Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 466D365CCD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 07:59:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t617xNYt000970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jul 2015 00:59:23 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 1 Jul 2015 00:59:22 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Jul 2015 15:54:21 +0800
Message-ID: <1435737261-30487-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: zchi@windriver.com
Subject: [PATCH] rpm: check if the argument(rootpath) exists or be writable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2015 07:59:23 -0000
Content-Type: text/plain

From: Zhixiong Chi <zchi@windriver.com>

When user execute the command "rpm -qai --root=$dir",if $dir doesn't
exist or is unwritable as result of making a typo in rootpath,then
it will create dirent $dir and subdirectory.
So we should add the check function to fix it before creating relational
subdirectory,and warn the incorrect rootpath to user. It just checks the
rootpath reasonableness when the user input the argument(--root=/-r=).

Signed-off-by: Zhixiong Chi <zchi@windriver.com>
---
 .../rpm/rpm-check-rootpath-reasonableness.patch    | 96 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch b/meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch
new file mode 100644
index 0000000..3986030
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch
@@ -0,0 +1,96 @@
+rpm: check if the argument(rootpath) exists or be writable
+
+When user execute the command "rpm -qai --root=$dir",if $dir doesn't
+exist or is unwritable as result of making a typo in rootpath,then
+it will create dirent $dir and subdirectory.
+So we should add the check function to fix it before creating relational
+subdirectory,and warn the incorrect rootpath to user. It just checks the
+rootpath reasonableness when the user input the argument(--root=/-r=).
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhixiong Chi <zchi@windriver.com>
+---
+ rpmqv.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/rpmqv.c b/rpmqv.c
+index 40c42bd..88d85ab 100644
+--- a/rpmqv.c
++++ b/rpmqv.c
+@@ -206,6 +206,8 @@ static struct poptOption optionsTable[] = {
+    POPT_TABLEEND
+ };
+ 
++static int _rpmqv_rootpath_state = 0;
++
+ #ifdef __MINT__
+ /* MiNT cannot dynamically increase the stack.  */
+ long _stksize = 64 * 1024L;
+@@ -427,6 +429,41 @@ static void integrity_check(const char *progname, enum modes progmode_num)
+ }
+ #endif
+ 
++/*check if the rootdir is writable or exists */
++int access_file(const char *rootdir)
++{
++    int ret,rootdir_len;
++
++    if(rootdir == NULL) {
++        return;
++    }
++
++    rootdir_len = strlen(rootdir);
++    /*make sure that dirent argument trailing is "/" */
++    if(!(rootdir_len && rootdir[rootdir_len - 1] == '/')){
++        char *t = (char *)malloc(rootdir_len + 2);
++        *t = '\0';
++        (void)stpcpy(stpcpy(t,rootdir),"/");
++        ret = access(t,F_OK|W_OK);
++        free(t);
++    }else{
++        ret = access(rootdir,F_OK|W_OK);
++    }
++    return ret;
++}
++
++/*check if input the argument "--root/-r"  */
++void check_argument_root(int argc,char * const argv[])
++{
++    int i;
++    for (i = 0; i < argc; i++) {
++        if(strncmp(argv[i],"--root=",7) == 0 || strncmp(argv[i],"-r=",3) == 0) {
++            _rpmqv_rootpath_state = 1;
++            break;
++        }
++    }
++}
++
+ /*@-bounds@*/ /* LCL: segfault */
+ /*@-mods@*/ /* FIX: shrug */
+ #if !defined(__GLIBC__) && !defined(__LCLINT__)
+@@ -476,6 +513,8 @@ int main(int argc, const char ** argv)
+     int xx;
+ #endif
+ 	
++    check_argument_root(argc,(char *const *)argv);
++
+ #if !defined(__GLIBC__) && !defined(__LCLINT__)
+     environ = envp;
+ #else
+@@ -715,6 +754,12 @@ int main(int argc, const char ** argv)
+ 		argerror(_("arguments to --root (-r) must begin with a /"));
+ 	    break;
+ 	}
++        if (_rpmqv_rootpath_state) {
++            if (access_file(rpmioRootDir)) {
++                fprintf(stderr, _("Invalid directory:%s, ensure it exists or be writable\n"),rpmioRootDir);
++                exit(EXIT_FAILURE);
++            }
++        }
+     }
+ 
+ #if defined(RPM_VENDOR_OPENPKG) /* integrity-checking */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index fb81f12..2e17a91 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -93,6 +93,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
 	   file://no-ldflags-in-pkgconfig.patch \
 	   file://rpm-lua-fix-print.patch \
+	   file://rpm-check-rootpath-reasonableness.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.9.1


