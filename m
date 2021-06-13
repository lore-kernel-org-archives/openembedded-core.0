Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.16437.1623585061528874541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2BC7838C13DD
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nettle: upgrading to 3.7.3 FAILED
Message-ID: <MADEUP.168822031716DF89.6241@lists.openembedded.org>
X-Groupsio-MsgNum: 152913
Content-Type: multipart/mixed; boundary="===============2075197376428770043=="

--===============2075197376428770043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nettle* to *3.7.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nettle-upgrade-3.7.2-3.7.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2075197376428770043==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-nettle-upgrade-3.7.2-3.7.3.patch"

From a9b5b592fcf33f86709065011e3f3bf4945cb10e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 11:45:30 +0000
Subject: [PATCH] nettle: upgrade 3.7.2 -> 3.7.3

---
 meta/recipes-support/nettle/nettle/run-ptest  | 36 -------------------
 .../{nettle_3.7.2.bb => nettle_3.7.3.bb}      |  4 +--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-support/nettle/nettle/run-ptest
 rename meta/recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} (94%)

diff --git a/meta/recipes-support/nettle/nettle/run-ptest b/meta/recipes-support/nettle/nettle/run-ptest
deleted file mode 100644
index b90bed66d2..0000000000
--- a/meta/recipes-support/nettle/nettle/run-ptest
+++ /dev/null
@@ -1,36 +0,0 @@
-#! /bin/sh
-
-cd testsuite
-
-failed=0
-all=0
-
-for f in *-test; do
-    if [ "$f" = "sha1-huge-test" ] ; then
-        echo "SKIP: $f (skipped for ludicrous run time)"
-        continue
-    fi
-
-    "./$f"
-    case "$?" in
-        0)
-            echo "PASS: $f"
-            all=$((all + 1))
-            ;;
-        77)
-            echo "SKIP: $f"
-            ;;
-        *)
-            echo "FAIL: $f"
-            failed=$((failed + 1))
-            all=$((all + 1))
-            ;;
-    esac
-done
-
-if [ "$failed" -eq 0 ] ; then
-  echo "All $all tests passed"
-else
-  echo "$failed of $all tests failed"
-fi
-
diff --git a/meta/recipes-support/nettle/nettle_3.7.2.bb b/meta/recipes-support/nettle/nettle_3.7.3.bb
similarity index 94%
rename from meta/recipes-support/nettle/nettle_3.7.2.bb
rename to meta/recipes-support/nettle/nettle_3.7.3.bb
index f8f3360086..91306e0078 100644
--- a/meta/recipes-support/nettle/nettle_3.7.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.3.bb
@@ -16,15 +16,15 @@ DEPENDS += "gmp"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
-           file://run-ptest \
            file://check-header-files-of-openssl-only-if-enable_.patch \
+           file://dlopen-test.patch \
            "
 
 SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162"
+SRC_URI[sha256sum] = "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


--===============2075197376428770043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1454 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (816 cached, 1 parsed). 1454 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-d0358f65d9f8d0963807d04792e5067cf6ed3b6b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d0358f65d9f8d0963807d04792e5067cf6ed3b6b"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 15 Network 0 Missed 7 Current 122 (68% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 137 of 144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 471 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 482 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 141 of 144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 142 of 144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 483 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
ERROR: nettle-3.7.3-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/nettle/3.7.3-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Patch dlopen-test.patch is already applied; check your series file

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/nettle/3.7.3-r0/temp/log.do_patch.5208
NOTE: recipe nettle-3.7.3-r0: task do_patch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch) failed with exit code '1'
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Tasks Summary: Attempted 487 tasks of which 484 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2075197376428770043==--
