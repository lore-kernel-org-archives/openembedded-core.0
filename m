Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D41D76ADC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 06:28:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5O6S4ZP022812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 23:28:04 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 23 Jun 2013 23:28:02 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 14:27:58 +0800
Message-ID: <d520d4fc66725801e83d4719e6c71f9015d8c9b0.1371807568.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1371807568.git.jackie.huang@windriver.com>
References: <cover.1371807568.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Limit the kbdrate application to x86, mips and sparc.
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
X-List-Received-Date: Mon, 24 Jun 2013 06:28:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The code relies on hardware specific memory locations to access
and modify the keyboard repeat rate.  It also requires read/write
access to /dev/port which doesn't exist on every architecture's
root fs.  The defect was raised for Qemu PowerPC but it also fails on
ARM.  The keyboard emulation in qemuppc is for an ADB (Apple Desktop Bus)
device and not compatible with an Intel driver.  There's also no
indication in the documentation that the code should work on
anything other than Intel architecture but it also works on MIPS.

Signed-off-by: Dennis Hall <dennis.hall@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../0001-Limit-kbdrate-to-x86-mips-and-sparc.patch |   48 ++++++++++++++++++++
 meta/recipes-core/kbd/kbd_1.15.2.bb                |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/kbd/files/0001-Limit-kbdrate-to-x86-mips-and-sparc.patch

diff --git a/meta/recipes-core/kbd/files/0001-Limit-kbdrate-to-x86-mips-and-sparc.patch b/meta/recipes-core/kbd/files/0001-Limit-kbdrate-to-x86-mips-and-sparc.patch
new file mode 100644
index 0000000..0283202
--- /dev/null
+++ b/meta/recipes-core/kbd/files/0001-Limit-kbdrate-to-x86-mips-and-sparc.patch
@@ -0,0 +1,48 @@
+From 4a679f16a3728a9323d23a8466d22a984a58c7af Mon Sep 17 00:00:00 2001
+From: Dennis Hall <dennis.hall@windriver.com>
+Date: Fri, 31 Aug 2012 10:15:13 -0400
+Subject: [PATCH] Limit kbdrate to x86, mips and sparc.
+
+Upstream-Status: Pending
+
+The application will exit with an error if it runs on any other architecture.
+
+The code relies on hardware specific memory locations to access
+and modify the keyboard repeat rate.  It also requires read/write
+access to /dev/port which doesn't exist on every architecture's
+root fs.  The CQ was raised for Qemu PowerPC but it also fails on
+ARM.  The keyboard emulation in qemuppc is for an ADB (Apple Desktop Bus)
+device and not compatible with an Intel driver.  There's also no
+indication in the documentation that the code should work on
+anything other than Intel architecture but it also works on MIPS32.
+MIPS64 is not supported at this time so it was not tested.
+
+Signed-off-by: Dennis Hall <dennis.hall@windriver.com>
+---
+ src/kbdrate.c |   10 ++++++++++
+ 1 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/src/kbdrate.c b/src/kbdrate.c
+index 95ff723..9a79774 100644
+--- a/src/kbdrate.c
++++ b/src/kbdrate.c
+@@ -241,6 +241,16 @@ main( int argc, char **argv ) {
+ 	unsigned int i;
+ 	extern char *optarg;
+
++#if !(  defined(__i386__)   \
++     || defined(__x86_64__) \
++     || defined(__mips__)   \
++     || defined(__sparc___))
++
++	fprintf(stderr,
++		"ERROR:  %s should only be used on MIPS, x86 and Sparc archicture boards\n", basename(argv[0]));
++        exit(1);
++#endif
++ 	set_progname(argv[0]);
+ 	set_progname(argv[0]);
+
+ 	setlocale(LC_ALL, "");
+--
+1.7.1
+
diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index 79ea468..2fddf0a 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -10,9 +10,11 @@ RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
-PR = "r4"
+PR = "r5"
 
-SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
+SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2 \
+         file://0001-Limit-kbdrate-to-x86-mips-and-sparc.patch \
+"
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
 SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
 
-- 
1.7.4.1


