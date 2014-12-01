Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 114E972313
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 06:01:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB161Bff022847
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 30 Nov 2014 22:01:11 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 30 Nov 2014 22:01:11 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 1 Dec 2014 14:01:29 +0800
Message-ID: <eb3ae98cd6b06ffc14d00686460aaf2072a12b96.1417413565.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417413565.git.Qi.Chen@windriver.com>
References: <cover.1417413565.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Mon, 01 Dec 2014 06:01:14 -0000
Content-Type: text/plain

Allow globs in CONFFILES and default CONFFILES to '${sysconfdir}'.

Previously, the CONFFILES variable is a list of config files to be
packaged. However, as these files may come directly from the source
instead of our WORKDIR, it's a very common mistake that we forget to set
this variable in our recipes. This will lead to unexpected behavior
when doing an on-target upgrade. For example, we modify the /etc/login.defs
locally and then do an upgrade. The file will be replaced, which is
obviously not correct.

This patch changes the way of CONFFILES handling. After this  change,
the CONFFILES can take the same form as FILES. That means, we don't
have to list a bunch of files for CONFFILES. It will just be expanded
like the FILES variable.

As almost all files under /etc are basically configuration files, we
provide a default value for CONFFILES.

    CONNFFILES = "${sysconfdir}"

In this way, we don't need to modify every recipe to set the CONFFILES
variable. Of course, setting CONFFILES in recipes take precedence over
the CONFFILES. For example, if the recipe author decides that package A
should only treat files under ${sysconfdir}/default/ as config files,
he/she can write like this.

    CONFFILES_A = "${sysconfdir}/default"

The above situation should not be common. As according to FHS, the /etc
directory is a place for all system related configuration files.

[YOCTO #5200]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/package.bbclass     | 35 +++++++++++++++++++++++++++++++++++
 meta/classes/package_deb.bbclass |  2 +-
 meta/classes/package_ipk.bbclass |  2 +-
 meta/classes/package_rpm.bbclass |  2 +-
 meta/conf/bitbake.conf           |  2 ++
 5 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 510617c..ae5ca20 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -237,6 +237,41 @@ python () {
         d.appendVarFlag('do_package', 'deptask', " do_packagedata")
 }
 
+# Called in package_<rpm,ipk,deb>.bbclass to get the correct list of configuration files
+def get_conffiles(pkg, d):
+    import glob
+    pkgdest = d.getVar('PKGDEST', True)
+    conf_list = []
+    root = os.path.join(pkgdest, pkg)
+    cwd = os.getcwd()
+    os.chdir(root)
+    conffiles = (d.getVar('CONFFILES_%s' % pkg, True) or d.getVar('CONFFILES', True) or "").split()
+    for conffile in conffiles:
+        if os.path.isabs(conffile):
+            conffile = '.' + conffile
+        if not conffile.startswith('./'):
+            conffile = './' + conffile
+        if not os.path.islink(conffile) and os.path.isdir(conffile):
+            newconffiles = [ os.path.join(conffile, x) for x in os.listdir(conffile) ]
+            if newconffiles:
+                conffiles += newconffiles
+                continue
+        globbed = glob.glob(conffile)
+        if globbed:
+            if [ conffile ] != globbed:
+                conffile += globbed
+                continue
+        if (not os.path.islink(conffile)) and (not os.path.exists(conffile)):
+            continue
+        if conffile in conf_list:
+            continue
+        conf_list.append(conffile)
+    # Remove the leading './'
+    for i in range(0, len(conf_list)):
+        conf_list[i] = conf_list[i][1:]
+    os.chdir(cwd)
+    return conf_list
+
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5b5f7e2..9d7c59b 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -262,7 +262,7 @@ python do_package_deb () {
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0755)
 
-        conffiles_str = localdata.getVar("CONFFILES", True)
+        conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
             try:
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 44fd3eb..dba6804 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -226,7 +226,7 @@ python do_package_ipk () {
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0755)
 
-        conffiles_str = localdata.getVar("CONFFILES", True)
+        conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
             try:
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 92ddf7a..b87e634 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -324,7 +324,7 @@ python write_specfile () {
 
         bb.data.update_data(localdata)
 
-        conffiles = (localdata.getVar('CONFFILES', True) or "").split()
+        conffiles = get_conffiles(pkg, d)
         dirfiles = localdata.getVar('DIRFILES', True)
         if dirfiles is not None:
             dirfiles = dirfiles.split()
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0ccaac0..dd3b41b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -265,6 +265,8 @@ PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
 FILES = ""
 
+CONFFILES = "${sysconfdir}"
+
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
-- 
1.9.1


