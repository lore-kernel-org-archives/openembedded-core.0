Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BB7FB73181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 19:26:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 17 May 2016 12:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,324,1459839600"; d="scan'208";a="105606033"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.59])
	by fmsmga004.fm.intel.com with ESMTP; 17 May 2016 12:26:04 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 14:26:16 -0500
Message-Id: <1463513176-4208-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH v3] makedevs: fix security issues
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
X-List-Received-Date: Tue, 17 May 2016 19:26:08 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

This patch avoids makedevs fails to compile with compiler flags which elevate common string formatting issues into an error (-Wformat -Wformat-security -Werror=format-security).

[YOCTO #9549]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/conf/distro/include/security_flags.inc        |  1 -
 .../makedevs/makedevs/fix-security-format.patch    | 63 ++++++++++++++++++++++
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb   |  1 +
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/makedevs/makedevs/fix-security-format.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 7a91cec..dc210a0 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -103,7 +103,6 @@ SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-gettext = ""
 SECURITY_STRINGFORMAT_pn-kexec-tools = ""
-SECURITY_STRINGFORMAT_pn-makedevs = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 SECURITY_STRINGFORMAT_pn-stat = ""
 SECURITY_STRINGFORMAT_pn-unzip = ""
diff --git a/meta/recipes-devtools/makedevs/makedevs/fix-security-format.patch b/meta/recipes-devtools/makedevs/makedevs/fix-security-format.patch
new file mode 100644
index 0000000..140eb14
--- /dev/null
+++ b/meta/recipes-devtools/makedevs/makedevs/fix-security-format.patch
@@ -0,0 +1,63 @@
+makedevs: Fixing security formatting issues
+
+Fix security formatting issues related to printing without NULL argument 
+
+makedevs.c: In function 'main':
+makedevs.c:513:3: error: format not a string literal and no format arguments [-Werror=format-security]
+   fprintf(stderr, helptext);
+   ^
+makedevs.c:528:4: error: format not a string literal and no format arguments [-Werror=format-security]
+    printf(helptext);
+    ^
+makedevs.c:556:4: error: format not a string literal and no format arguments [-Werror=format-security]
+    fprintf(stderr, helptext);
+    ^
+makedevs.c:562:3: error: format not a string literal and no format arguments [-Werror=format-security]
+   fprintf(stderr, helptext);
+   ^
+
+[YOCTO #9549]
+[https://bugzilla.yoctoproject.org/show_bug.cgi?id=9549]
+
+Upstream-Status: Pending
+
+Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+
+diff --git a/makedevs.c b/makedevs.c
+index 771f33e..7471f3f 100644
+--- a/makedevs.c
++++ b/makedevs.c
+@@ -510,7 +510,7 @@ int main(int argc, char **argv)
+ 	umask (0);
+ 
+ 	if (argc==1) {
+-		fprintf(stderr, helptext);
++		fputs( helptext , stderr );
+ 		exit(1);
+ 	}
+ 
+@@ -525,7 +525,7 @@ int main(int argc, char **argv)
+ 				error_msg_and_die("%s: not a proper device table file", optarg);
+ 			break;
+ 		case 'h':
+-			printf(helptext);
++			puts(helptext);
+ 			exit(0);
+ 		case 'r':
+ 		case 'd':				/* for compatibility with mkfs.jffs, genext2fs, etc... */
+@@ -553,13 +553,13 @@ int main(int argc, char **argv)
+ 			printf("%s: %s\n", app_name, VERSION);
+ 			exit(0);
+ 		default:
+-			fprintf(stderr, helptext);
++			fputs(helptext,stderr);
+ 			exit(1);
+ 		}
+ 	}
+ 
+ 	if (argv[optind] != NULL) {
+-		fprintf(stderr, helptext);
++		fputs(helptext,stderr);
+ 		exit(1);
+ 	}
+ 
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 92d5870..41b8bec 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -3,6 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "base"
 SRC_URI = "file://makedevs.c \
+           file://fix-security-format.patch \
            file://COPYING.patch"
 
 S = "${WORKDIR}"
-- 
1.9.1


