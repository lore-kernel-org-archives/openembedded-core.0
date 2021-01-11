Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.27249.1610325999207144511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VL0guvyA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id y8so8614828plp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HepwSDsfCLujAXAdTVPdj3ZFf1K+RZz9NoVoGkBHkOk=;
        b=VL0guvyA6n3MpgWQPnakApn1LdovTLg2NiejsQbUac64XErhhDmGbPJ7d0KX6X90zC
         ePEuorDzYNb/gGcF6ptqAtW2aL52GW4N46ruQYRX2c7ptGeiO9uusO2V9O1/7xqJfMkl
         e77V8ef/MtYiGGBdmMa01xjHCEq+y63+rpw58OjM9jOV2m6zbdd6dwjOVeJGn2gk6gQG
         9pjSN98hJc931mGFopXo4uXAEyokfVaea9DvPBW+fVAFE/gurmQoG4nUrgYPtAv3dcYz
         I80cPvxpAzxmQvFrpE/AfLQfm70iwcpycPxDOj+rScRCT+iIi7BIeq0pLcqzOXIcwaaa
         ZsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HepwSDsfCLujAXAdTVPdj3ZFf1K+RZz9NoVoGkBHkOk=;
        b=MLpkv1h2cG8VFrr/dPhGNA/GGCwvlqfw3kqjhbrzj/WBZDYzL5FJLbMciOtHG/hOQK
         69qM56JWCep66a8aP62xIWr7IO0PMp/GXLK3ZXDaJAs0NozuVdgobECTN53YLkrFISaN
         oy5RPHQK8E/cbhNPDKhR2j3w+B8XnLFIecOc72PqoxdTE+QdTfM1lTRbH6FEF+QoMCaw
         SupF8YNHFScUd+ZZ3AqfGu1ggX5XTAP7ufcBlIwbPccvwhyj1oDSkyfqn1638HskWYmO
         I7llq1o47pjly5AKVE+DxpeCK2G/Yr/EHUMbScIHaEkWNzWUEXBbFx3nvnDdF4HJm5tE
         GYXw==
X-Gm-Message-State: AOAM533oj71q0FphrT5QvwQjwckyD7+ErSGnL3uYyGQzBMK3/Nr0Tps5
	4o3enJXyxl7nLLS24d8NEHw2nwVGlwa5bWOYNkk=
X-Google-Smtp-Source: ABdhPJy/PuLlcOQbiKG7P9+PxdOKO0lJD8WWkKZ0j/6QQi0oYToWjfyzdYxu9K7mLlVF9ZmjSs/qhQ==
X-Received: by 2002:a17:90b:24c:: with SMTP id fz12mr15260868pjb.138.1610325998089;
        Sun, 10 Jan 2021 16:46:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] systemd: update from 244.3 to 244.5 stable release
Date: Sun, 10 Jan 2021 14:45:49 -1000
Message-Id: <0c5151a7ec6ac0aaed1bc56ebb89f17442683072.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Brings in a number of fixes from upstream stable tree:

$ git log --format="%h %s" v244.3..v244.5
3ceaa81c61 kernel-install/90-loaderentry: fix when /boot is not mountpoint
ecbb5a4f67 nspawn: fix fd leak on failure path
a09947ddd4 nspawn: check return of setsid()
334f8e2e8f dissect: is_loop_device() returns negative on error, don't mistake that is true
b6efbbfb00 dissect: always invalidate secondary arch partitions if we found primary arch
dc5c5cd5c8 util: wireguard is merged into upstream kernel
6349956dda fstab-generator: add 'nofail' when  NFS 'bg' option is used
f4777883f9 busctl: add missing shortopt -l
9f6249eb7f bootctl: handle if LoaderSystemToken is invalid for some reason
bda316cc0a hashmap: make sure to initialize shared hash key atomically
b80ea9e3da backlight: do not claim that ID_BACKLIGHT_CLAMP= property is not set
c829f6e7ca coredump: don't convert s → µs twice
bb9d872398 firstboot: fill empty color if ansi_color unavailable from os-release
156570cc77 resolved: make sure we initialize t->answer_errno before completing the transaction
02bba02fa6 src/shared/dissect-image.c: fix build without blkdid (#16901)
13cb598631 analyze: fix error handling in one case
6ab20e9f3b units: add missing usb-gadget.target
9ef259dd4d login/logind: Include sys/stat.h for struct stat usage
7762e59fd4 partition/makefs: Include missing sys/file.h header
3528ace8fb networkctl: label command does not take any argument
34b4dc64c6 missing: Add new Linux capability
ba28e6fc45 tty-ask-pw-agent: properly propagate error
7b6e0f74f2 tty-ask-pw-agent: the message string might not be set
0bfe4bd39b tty-ask-pw-agent: make sure "--list" works correctly
0783b4f8ce path: Improve $PATH search directory case
d0735d81d4 path: Skip directories when finalising $PATH search
436872f995 rules: don't install 80-drivers.rules when kmod is disabled
342dc4c15f zsh: correct journalctl command completion parsing
fec0bb6df4 basic/missing_syscall: fix syscall numbers for arm64 :(
bea900bb31 shared/install: fix preset operations for non-service instantiated units
677fb2b663 user-runtime-dir: deal gracefully with missing logind properties
11a97bc230 shared/seccomp: do not use ifdef guards around textual syscall names
d411a4d6a6 machine-id-setup: don't use KVM or container manager supplied uuid if in chroot env
9b078df0ba analyze-security: do not assign badness to filtered-out syscalls
da0cc77b52 load-fragment: fix grammar in error messages
74d7c53e5f test: accept that char device 0/0 can now be created witout privileges
5c35bcf329 tools/make-man-index: fix purpose text that contains tags
da1eb548fb Newer Glibc use faccessat2 to implement faccessat
b44e86ef76 bless-boot: add missing verb to --help
88b6379bcd fix typo in systemctl help
d091e19bbd _sd-common.h: avoid parsing errors with Coverity
d56055f47f nspawn: Fix incorrect usage of putenv
674a2beff0 udev: fix codesonar warnings
16477684d2 sd-boot: fix -Wpointer-sign warning
cc8aeb9916 network: fix static assertion on IPPROTO_MAX range
f047b0706c sd-boot: fix menu ordering with boot counting
896de33984 tests: add a testcase for https://github.com/systemd/systemd/issues/15885
bbc6ff960a network: Fix crash when SendOption= is invalid
1599741b55 kernel-install: strip BOOT_IMAGE= from kernel options
1d1f5006cb basic/user-util: always use base 10 for user/group numbers
b07d782047 parse-util: backport safe_atou32_full()
7bc54463ce Fix build with µhttpd 0.9.71
b074499894 random-seed: add missing header for GRND_NONBLOCK (#14988)
ec9fd71358 makefs: strdup arguments to mkfs
efd5b1d443 network-generator: allow empty hostname
c188248371 network: DHCP lease load SIP copy paste error
cd7d8bb962 davfs is a network file system
6aae7f596a logind: log a more accurate error when we failed at session creation
f4d5928122 docs: Add syntax for templated units to systemd.preset man page
148f7b147a man: add a tiny bit of markup
dbe16df9cd test: wait a bit after starting the test service
a713f52ddb fix journalctl regression (#15099)
49e7c3b617 core: transition to FINAL_SIGTERM state after ExecStopPost=
d25598854d journalctl: show duplicate entries if they are from the same file (#14898)
037a0fa5d0 udev: fix SECLABEL{selinux} issue (#15064)
9de06cd65a dissect-image: avoid scanning partitions
fa65938017 test: ignore IAB capabilities in `test-execute`
16cac70094 Support compiling with clang and gnu11 standard
1ea52d91c8 Typo fix
869614a551 boot: Ensure ARM UEFI binary does not contain FP/SIMD instructions

Patches CVE-2020-13776.patch and systemd-udev-seclabel-options-crash-fix.patch
can be dropped as they are already applied in 244.5 upstream release.

Not needed on master branch or gatesgarth as they run newer systemd version 246.

Tested on an ARM64 target with automatic tests which are passing on our side.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...md-boot_244.3.bb => systemd-boot_244.5.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 .../systemd/systemd/CVE-2020-13776.patch      | 96 -------------------
 ...temd-udev-seclabel-options-crash-fix.patch | 30 ------
 .../{systemd_244.3.bb => systemd_244.5.bb}    |  5 +-
 5 files changed, 4 insertions(+), 129 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_244.3.bb => systemd-boot_244.5.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
 rename meta/recipes-core/systemd/{systemd_244.3.bb => systemd_244.5.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_244.3.bb b/meta/recipes-core/systemd/systemd-boot_244.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_244.3.bb
rename to meta/recipes-core/systemd/systemd-boot_244.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index e73b397b5d..3165d13f03 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "b7ed902b2394f94e7f1fbe6c3194b5cd9a9429e6"
+SRCREV = "3ceaa81c61b654ebf562464d142675bd4d57d7b6"
 SRCBRANCH = "v244-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch b/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
deleted file mode 100644
index 7b5e3e7f7a..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 156a5fd297b61bce31630d7a52c15614bf784843 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Sun, 31 May 2020 18:21:09 +0200
-Subject: [PATCH 1/1] basic/user-util: always use base 10 for user/group
- numbers
-
-We would parse numbers with base prefixes as user identifiers. For example,
-"0x2b3bfa0" would be interpreted as UID==45334432 and "01750" would be
-interpreted as UID==1000. This parsing was used also in cases where either a
-user/group name or number may be specified. This means that names like
-0x2b3bfa0 would be ambiguous: they are a valid user name according to our
-documented relaxed rules, but they would also be parsed as numeric uids.
-
-This behaviour is definitely not expected by users, since tools generally only
-accept decimal numbers (e.g. id, getent passwd), while other tools only accept
-user names and thus will interpret such strings as user names without even
-attempting to convert them to numbers (su, ssh). So let's follow suit and only
-accept numbers in decimal notation. Effectively this means that we will reject
-such strings as a username/uid/groupname/gid where strict mode is used, and try
-to look up a user/group with such a name in relaxed mode.
-
-Since the function changed is fairly low-level and fairly widely used, this
-affects multiple tools: loginctl show-user/enable-linger/disable-linger foo',
-the third argument in sysusers.d, fourth and fifth arguments in tmpfiles.d,
-etc.
-
-Fixes #15985.
----
- src/basic/user-util.c     |  2 +-
- src/test/test-user-util.c | 10 ++++++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
---- end of commit 156a5fd297b61bce31630d7a52c15614bf784843 ---
-
-
-Add definition of safe_atou32_full() from commit b934ac3d6e7dcad114776ef30ee9098693e7ab7e
-
-CVE: CVE-2020-13776
-
-Upstream-Status: Backport [https://github.com/systemd/systemd.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-
---- git.orig/src/basic/user-util.c
-+++ git/src/basic/user-util.c
-@@ -49,7 +49,7 @@ int parse_uid(const char *s, uid_t *ret)
-         assert(s);
- 
-         assert_cc(sizeof(uid_t) == sizeof(uint32_t));
--        r = safe_atou32(s, &uid);
-+        r = safe_atou32_full(s, 10, &uid);
-         if (r < 0)
-                 return r;
- 
---- git.orig/src/test/test-user-util.c
-+++ git/src/test/test-user-util.c
-@@ -48,9 +48,19 @@ static void test_parse_uid(void) {
- 
-         r = parse_uid("65535", &uid);
-         assert_se(r == -ENXIO);
-+        assert_se(uid == 100);
-+
-+        r = parse_uid("0x1234", &uid);
-+        assert_se(r == -EINVAL);
-+        assert_se(uid == 100);
-+
-+        r = parse_uid("01234", &uid);
-+        assert_se(r == 0);
-+        assert_se(uid == 1234);
- 
-         r = parse_uid("asdsdas", &uid);
-         assert_se(r == -EINVAL);
-+        assert_se(uid == 1234);
- }
- 
- static void test_uid_ptr(void) {
---- git.orig/src/basic/parse-util.h
-+++ git/src/basic/parse-util.h
-@@ -45,9 +45,13 @@ static inline int safe_atoux16(const cha
- 
- int safe_atoi16(const char *s, int16_t *ret);
- 
--static inline int safe_atou32(const char *s, uint32_t *ret_u) {
-+static inline int safe_atou32_full(const char *s, unsigned base, uint32_t *ret_u) {
-         assert_cc(sizeof(uint32_t) == sizeof(unsigned));
--        return safe_atou(s, (unsigned*) ret_u);
-+        return safe_atou_full(s, base, (unsigned*) ret_u);
-+}
-+
-+static inline int safe_atou32(const char *s, uint32_t *ret_u) {
-+        return safe_atou32_full(s, 0, (unsigned*) ret_u);
- }
- 
- static inline int safe_atoi32(const char *s, int32_t *ret_i) {
diff --git a/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch b/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
deleted file mode 100644
index 27b2b60fad..0000000000
--- a/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0335d110afc08baf47d76b7011ce02510dfdd524 Mon Sep 17 00:00:00 2001
-From: Valery0xff <valery.chernous@gmail.com>
-Date: Wed, 11 Mar 2020 02:20:36 +0200
-Subject: [PATCH] udev: fix SECLABEL{selinux} issue (#15064)
-
-Add SECLABEL{selinux}="some value" cause udevadm crash
-systemd-udevd[x]: Worker [x] terminated by signal 11 (SEGV)
- 
-It happens since 25de7aa7b90 (Yu Watanabe 2019-04-25 01:21:11 +0200)
-when udev rules processing changed to token model. Yu forgot store
-attr to SECLABEL token so fix it.
----
- src/udev/udev-rules.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/0335d110afc08baf47d76b7011ce02510dfdd524.patch]
----
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index b9b350d1ef..b990f68e93 100644
---- a/src/udev/udev-rules.c
-+++ b/src/udev/udev-rules.c
-@@ -921,7 +921,7 @@ static int parse_token(UdevRules *rules, const char *key, char *attr, UdevRuleOp
-                         op = OP_ASSIGN;
-                 }
- 
--                r = rule_line_add_token(rule_line, TK_A_SECLABEL, op, value, NULL);
-+                r = rule_line_add_token(rule_line, TK_A_SECLABEL, op, value, attr);
-         } else if (streq(key, "RUN")) {
-                 if (is_match || op == OP_REMOVE)
-                         return log_token_invalid_op(rules, key);
diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.5.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_244.3.bb
rename to meta/recipes-core/systemd/systemd_244.5.bb
index 64e3b18333..8c95648ca0 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -20,8 +20,6 @@ SRC_URI += "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://CVE-2020-13776.patch \
-           file://systemd-udev-seclabel-options-crash-fix.patch \
            "
 
 # patches needed by musl
@@ -51,6 +49,9 @@ SRC_URI_MUSL = "\
                file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch \
                "
 
+# already applied in 244.5
+CVE_CHECK_WHITELIST += "CVE-2020-13776"
+
 PAM_PLUGINS = " \
     pam-plugin-unix \
     pam-plugin-loginuid \
-- 
2.17.1

