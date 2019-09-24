Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 961EA7F25B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 07:35:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8O7YJ78017082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 00:35:21 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Sep 2019 00:34:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2019 15:34:26 +0800
Message-ID: <727575983e43ad186b2f36209b306bdf37b07c4d.1569306585.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569306585.git.liezhi.yang@windriver.com>
References: <cover.1569306585.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] expect: Fix buffer overflow error when build in long path
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
X-List-Received-Date: Tue, 24 Sep 2019 07:35:30 -0000
Content-Type: text/plain

Fixed when built the project in a long path (len(TMPDIR) > 200):
$ bitbake dejagnu-native
[snip]
checking Tcl version 8.5 or greater... *** buffer overflow detected ***:
TOPDIR/tmp-glibc/work/x86_64-linux/dejagnu-native/1.6.2-r0/recipe-sysroot-native/usr/bin/expect terminated
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch | 55 ++++++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch

diff --git a/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch b/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
new file mode 100644
index 0000000..37512fb
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
@@ -0,0 +1,55 @@
+From 1407fcad6f1dac0a4efe8041660bf6139c1cd16a Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 24 Sep 2019 13:40:10 +0800
+Subject: [PATCH] exp_main_sub.c: Use PATH_MAX for path
+
+If expect was built from a long path whose length > 200, then it couldn't run:
+$ expect -c 'puts yes'
+*** buffer overflow detected ***: expect terminated
+Aborted (core dumped)
+
+Use PATH_MAX to fix the problem.
+
+Upstream-Status: Pending [Upstream seems dead]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ exp_main_sub.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/exp_main_sub.c b/exp_main_sub.c
+index fcfaa6e..bf6c4be 100644
+--- a/exp_main_sub.c
++++ b/exp_main_sub.c
+@@ -48,6 +48,10 @@ char exp_version[] = PACKAGE_VERSION;
+ #define NEED_TCL_MAJOR		7
+ #define NEED_TCL_MINOR		5
+ 
++#ifndef PATH_MAX
++#define PATH_MAX 4096
++#endif
++
+ char *exp_argv0 = "this program";	/* default program name */
+ void (*exp_app_exit)() = 0;
+ void (*exp_event_exit)() = 0;
+@@ -901,7 +905,7 @@ int sys_rc;
+ 	int rc;
+ 
+ 	if (sys_rc) {
+-	    char file[200];
++	    char file[PATH_MAX];
+ 	    int fd;
+ 
+ 	    sprintf(file,"%s/expect.rc",SCRIPTDIR);
+@@ -917,7 +921,7 @@ int sys_rc;
+ 	    }
+ 	}
+ 	if (my_rc) {
+-	    char file[200];
++	    char file[PATH_MAX];
+ 	    char *home;
+ 	    int fd;
+ 	    char *getenv();
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 96eacd9..dcd252f 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
            file://0001-Resolve-string-formatting-issues.patch \
            file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
+           file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
           "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
 SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
-- 
2.7.4


