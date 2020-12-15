Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.933.1608060223432712105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1489438C1242
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:43 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] readline: upgrading to 8.1 FAILED
Message-ID: <MADEUP.1650FA40E4A162AB.26086@lists.openembedded.org>
X-Groupsio-MsgNum: 145666
Content-Type: multipart/mixed; boundary="===============9136285336859967152=="

--===============9136285336859967152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *readline* to *8.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-readline-upgrade-8.0-8.1.patch
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

--===============9136285336859967152==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-readline-upgrade-8.0-8.1.patch"

From 2e53dd14555dd5278d624a2f2d69252cc931649d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 05:29:47 +0000
Subject: [PATCH] readline: upgrade 8.0 -> 8.1

---
 meta/recipes-core/readline/files/inputrc      | 61 -------------------
 .../readline/readline-8.0/rl-native.map       | 12 ----
 .../configure-fix.patch                       |  0
 .../norpath.patch                             |  0
 .../{readline_8.0.bb => readline_8.1.bb}      |  6 +-
 5 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/inputrc
 delete mode 100644 meta/recipes-core/readline/readline-8.0/rl-native.map
 rename meta/recipes-core/readline/{readline-8.0 => readline-8.1}/configure-fix.patch (100%)
 rename meta/recipes-core/readline/{readline-8.0 => readline-8.1}/norpath.patch (100%)
 rename meta/recipes-core/readline/{readline_8.0.bb => readline_8.1.bb} (25%)

diff --git a/meta/recipes-core/readline/files/inputrc b/meta/recipes-core/readline/files/inputrc
deleted file mode 100644
index b5c4c8af24..0000000000
--- a/meta/recipes-core/readline/files/inputrc
+++ /dev/null
@@ -1,61 +0,0 @@
-# /etc/inputrc - global inputrc for libreadline
-# See readline(3readline) and `info rluserman' for more information.
-
-# Be 8 bit clean.
-set input-meta on
-set output-meta on
-
-# To allow the use of 8bit-characters like the german umlauts, comment out
-# the line below. However this makes the meta key not work as a meta key,
-# which is annoying to those which don't need to type in 8-bit characters.
-
-# set convert-meta off
-
-# try to enable the application keypad when it is called.  Some systems
-# need this to enable the arrow keys.
-# set enable-keypad on
-
-# see /usr/share/doc/bash/inputrc.arrows for other codes of arrow keys
-
-# do not bell on tab-completion 
-# set bell-style none 
-
-# some defaults / modifications for the emacs mode
-$if mode=emacs
-
-# allow the use of the Home/End keys
-# "\e[1~": beginning-of-line
-# "\e[4~": end-of-line
-
-# allow the use of the Delete/Insert keys
-# "\e[3~": delete-char
-# "\e[2~": quoted-insert
-
-# mappings for "page up" and "page down" to step to the beginning/end 
-# of the history
-# "\e[5~": beginning-of-history
-# "\e[6~": end-of-history
-
-# alternate mappings for "page up" and "page down" to search the history
-# "\e[5~": history-search-backward
-# "\e[6~": history-search-forward
-
-# # mappings for Ctrl-left-arrow and Ctrl-right-arrow for word moving
-# "\e[5C": forward-word
-# "\e[5D": backward-word
-# "\e\e[C": forward-word
-# "\e\e[D": backward-word
-
-# $if term=rxvt
-# "\e[8~": end-of-line
-# $endif
-
-# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
-# "\eOH": beginning-of-line
-# "\eOF": end-of-line
-
-# for freebsd console
-# "\e[H": beginning-of-line
-# "\e[F": end-of-line
-
-$endif
diff --git a/meta/recipes-core/readline/readline-8.0/rl-native.map b/meta/recipes-core/readline/readline-8.0/rl-native.map
deleted file mode 100644
index 5e7d49cdd2..0000000000
--- a/meta/recipes-core/readline/readline-8.0/rl-native.map
+++ /dev/null
@@ -1,12 +0,0 @@
-READLINE_6.3 {
-    rl_change_environment;
-    rl_clear_history;
-    rl_executing_key;
-    rl_executing_keyseq;
-    rl_filename_stat_hook;
-    rl_history_substr_search_backward;
-    rl_history_substr_search_forward;
-    rl_input_available_hook;
-    rl_print_last_kbd_macro;
-    rl_signal_event_hook;
-};
diff --git a/meta/recipes-core/readline/readline-8.0/configure-fix.patch b/meta/recipes-core/readline/readline-8.1/configure-fix.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-8.0/configure-fix.patch
rename to meta/recipes-core/readline/readline-8.1/configure-fix.patch
diff --git a/meta/recipes-core/readline/readline-8.0/norpath.patch b/meta/recipes-core/readline/readline-8.1/norpath.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-8.0/norpath.patch
rename to meta/recipes-core/readline/readline-8.1/norpath.patch
diff --git a/meta/recipes-core/readline/readline_8.0.bb b/meta/recipes-core/readline/readline_8.1.bb
similarity index 25%
rename from meta/recipes-core/readline/readline_8.0.bb
rename to meta/recipes-core/readline/readline_8.1.bb
index 99d022a32f..205cc00826 100644
--- a/meta/recipes-core/readline/readline_8.0.bb
+++ b/meta/recipes-core/readline/readline_8.1.bb
@@ -1,7 +1,7 @@
 require readline.inc
 
 SRC_URI += "file://configure-fix.patch \
-            file://norpath.patch"
+           file://norpath.patch \
+           "
 
-SRC_URI[archive.md5sum] = "7e6c1f16aee3244a69aba6e438295ca3"
-SRC_URI[archive.sha256sum] = "e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461"
+SRC_URI[archive.sha256sum] = "f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02"
-- 
2.17.1


--===============9136285336859967152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1416 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb: Unable to get checksum for nativesdk-readline SRC_URI entry inputrc: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb: Unable to get checksum for readline-native SRC_URI entry inputrc: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb: Unable to get checksum for readline-native SRC_URI entry rl-native.map: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb: Unable to get checksum for readline SRC_URI entry inputrc: file could not be found
done.
Parsing of 806 .bb files complete (805 cached, 1 parsed). 1410 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-0da42903041e10dd2ec261915833460278e86163"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0da42903041e10dd2ec261915833460278e86163"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 471 Found 122 Missed 349 Current 183 (25% match, 46% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 203 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 218 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 223 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 226 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 229 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 234 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 237 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 248 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 269 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 283 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 292 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 340 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 374 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 408 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 459 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 498 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to b25f506b6b42393f7c4170a8a0ea9024e454955476098b5f02fee190b2ffabc7. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 500 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 504 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 505 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 506 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 509 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 511 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 512 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 526 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 540 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 541 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 546 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 564 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_stash_locale_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 612 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 613 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 614 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 616 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to b25f506b6b42393f7c4170a8a0ea9024e454955476098b5f02fee190b2ffabc7. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 618 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.32-r0: task do_stash_locale_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 158 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_fetch)
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 623 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 624 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 626 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running noexec task 264 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running noexec task 266 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_fetch)
NOTE: Running setscene task 627 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 628 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 274 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_fetch: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 631 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 317 of 2096 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch)
NOTE: Running task 326 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_fetch)
NOTE: Running task 329 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_fetch)
NOTE: Running task 330 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 407 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch)
NOTE: Running task 408 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 416 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Started
NOTE: Running task 422 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 423 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.8-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 634 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 448 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_unpack)
NOTE: Running task 449 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 450 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_unpack)
NOTE: recipe bison-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_fetch: Started
NOTE: Running task 453 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_fetch)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 510 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_fetch)
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 511 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 512 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch)
NOTE: Running setscene task 636 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 534 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_fetch)
NOTE: recipe libpam-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-native-8.1-r0: task do_fetch: Started
NOTE: Running task 535 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe readline-8.1-r0: task do_fetch: Started
NOTE: Running task 536 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_unpack)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_fetch: Succeeded
NOTE: Running task 537 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_unpack)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 538 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_fetch)
NOTE: Running task 539 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_fetch)
NOTE: Running task 540 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_fetch)
NOTE: Running task 550 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: Running task 553 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_write_config)
NOTE: Running task 554 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_write_config)
NOTE: Running task 555 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 557 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
WARNING: readline-native-8.1-r0 do_fetch: Failed to fetch URL file://inputrc, attempting MIRRORS if available
NOTE: Running task 558 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: recipe ncurses-6.2-r0: task do_fetch: Started
NOTE: Running task 559 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 560 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 561 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
WARNING: readline-8.1-r0 do_fetch: Failed to fetch URL file://inputrc, attempting MIRRORS if available
NOTE: Running task 563 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_fetch)
ERROR: readline-8.1-r0 do_fetch: Fetcher failure: Unable to find file file://inputrc anywhere. The paths that were searched were:
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/
    /home/pokybuild/yocto-worker/auh/build/build/build/downloads
ERROR: readline-8.1-r0 do_fetch: Fetcher failure for URL: 'file://inputrc'. Unable to fetch URL from any source.
NOTE: recipe expat-2.2.10-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 566 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 567 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 573 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_fetch)
NOTE: Running task 584 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_fetch)
NOTE: Running task 586 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_fetch)
NOTE: Running task 590 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_fetch)
ERROR: readline-native-8.1-r0 do_fetch: Fetcher failure: Unable to find file file://inputrc anywhere. The paths that were searched were:
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/x86-64
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/x86-64
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/x86-64
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline-8.1/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/files/
    /home/pokybuild/yocto-worker/auh/build/build/build/downloads
ERROR: readline-native-8.1-r0 do_fetch: Fetcher failure for URL: 'file://inputrc'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/readline-native/8.1-r0/temp/log.do_fetch.42529
NOTE: recipe readline-native-8.1-r0: task do_fetch: Failed
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/readline/8.1-r0/temp/log.do_fetch.42577
NOTE: recipe readline-8.1-r0: task do_fetch: Failed
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_unpack: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch) failed with exit code '1'
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch) failed with exit code '1'
NOTE: Running task 591 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_fetch)
NOTE: recipe ncurses-6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_fetch: Started
NOTE: recipe openssl-1.1.1h-r0: task do_fetch: Started
NOTE: recipe openssl-1.1.1h-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Started
NOTE: recipe python3-3.9.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Started
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.3.1-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to b25f506b6b42393f7c4170a8a0ea9024e454955476098b5f02fee190b2ffabc7. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.36-r0: task do_unpack: Started
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Started
NOTE: recipe acl-2.2.53-r0: task do_fetch: Started
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Started
NOTE: recipe libcap-2.45-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe acl-2.2.53-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe libcap-2.45-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe kmod-27-r0: task do_fetch: Started
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_fetch: Started
NOTE: recipe kmod-27-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.32-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 591 tasks of which 547 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch
Summary: There were 6 WARNING messages shown.
Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============9136285336859967152==--
