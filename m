Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3AFEF99C2
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 17:56:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77877.1771005382435991245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 09:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ng6fXBuj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483703e4b08so9039505e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771005380; x=1771610180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LlzYcHLJgdXDX3DBNXYixs/gIluKDtmKLCSaqTtMw6M=;
        b=Ng6fXBujj9uoe+8eC2uBOfqQXWb89JFDzgrn7ihQHq1ZJ0U3zUWx088VBktfd98PsX
         +68FiMWd7mWJXKTePIpGI2EZgv1NaooLAxxjhT1UosoaSeF4dn1+Lu5Xl7c0AzKQSIaF
         k2r1r6JzCrzPsL90WrcWlZGHQdww5I/KBgP+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771005380; x=1771610180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlzYcHLJgdXDX3DBNXYixs/gIluKDtmKLCSaqTtMw6M=;
        b=L+5Iabf3WslPyC8ToSRqrZYLQsAi2lfJwmi78Lu+gZrNeux/9szT8U5lK/1rh+BXAP
         lFkVGnQyoNs9Ict55Xl87OA5nxjtuB/AZxnQaofweh631NyUYeXZ8q7qE3ovuImZbqqZ
         mOef81KfqadgWYarSOVQYuiwlY0iedttanSTZIpKPac2VQrff4bLrW3nDn1rek/s0biO
         ZHdS+tsfnX29dz1C9YHzgzEvOhcny3ooT8PvKwEvVg28v4gOWOyujmEAjVC5SY7LeXAD
         P8xQMGyc8m6gXRiaEb2dpLmUZSzxRJ93+4f35H+QLYUyXnMrdtiboIQYXg4H99Ca+tGI
         kEQw==
X-Gm-Message-State: AOJu0YyUY7XoLoDddDBSOnBmpzR9Zt3lIES0m1NHZ6I3ZUhkNKcmgHKz
	L6vRNcxFD4Pos9Zn324FzA0B8SoGTyKjjXKZpTFzAnlbt8finWYZjCeuU++acYJl6NZvVgtu8Uy
	WLI3Ehww=
X-Gm-Gg: AZuq6aJhmmG1fLqw0JiA1wFfGIMNiZlK7nTESQg3v2lP9vtKjmUoGMwCDQ7/0n3bqaG
	V5FuLXK+hIfECRALEXHNDaQid1qKu5/TL+Fxf3CVoL7G55ISr5LW+xmHsRI3df/zXPaGaPk8XFp
	8Gu+mNRplkzwi0gkPTiOKLdhrG2sxL86jdKmTJdooFeeoMiJ90D8mwuwXPzfdBKU7GO17NqU7Tz
	pAfvrXYg7H8Dd+I01oo45NbrMA3sEban2pLIoUwfKM0S6v9yoVxyjOeEFycDYTGS6AHat2IS9Wc
	gbfSpiuAJg5zkIskht/xUQugJO4De4GvH6cb5qvx7uPvgHKoCh/yDFqO206BbARdvI0akW0ASCl
	X2p/Wf/o52sKjZu58bpAR6z5jU/0nk/kfVF7azosXIb1g2UOuSgt0cAFOXl+tHIZ5thboSYeOHE
	YvOnF8SzB0B/LDURXraYlilJRN2nau2QUKVulY46t++U4sdcufM0My49reJYDEoA==
X-Received: by 2002:a05:600c:3acf:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-48378d6ab64mr18289715e9.5.1771005379918;
        Fri, 13 Feb 2026 09:56:19 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e20e:afdc:37ec:38d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm498674085e9.11.2026.02.13.09.56.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:56:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: Stop supporting sysvinit compatibility
Date: Fri, 13 Feb 2026 17:56:18 +0000
Message-ID: <20260213175618.1801591-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 17:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231134

Systemd has worked with sysvinit compatibility but upstream plans to remove
this and hence we will no longer be able to support it. We need to remove this
before the LTS since the support will certainly not be there for the lifetime
of the LTS.

This patch disables that usage mode and removes some of the compatibility logic.
There is more that can be removed, this is meant just to signal to people it is
no longer supported and start that process. Further cleanup can be made over time
in later commits.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/systemd.bbclass           | 14 +++-------
 .../distro/include/init-manager-systemd.inc   |  2 +-
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../systemd/systemd-compat-units.bb           | 27 -------------------
 meta/recipes-core/systemd/systemd_258.1.bb    | 18 +++++--------
 5 files changed, 12 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 562e71fb56e..26eaaf1922f 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -18,14 +18,12 @@ SYSTEMD_AUTO_ENABLE ??= "enable"
 # even if systemd is not in DISTRO_FEATURES.  As such don't make any changes
 # directly but check the DISTRO_FEATURES first.
 python __anonymous() {
-    # If the distro features have systemd but not sysvinit, inhibit update-rcd
-    # from doing any work so that pure-systemd images don't have redundant init
-    # files.
+    # Inhibit update-rcd from doing any work so that systemd images don't have
+    # redundant init files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         d.appendVar("DEPENDS", " systemd-systemctl-native")
         d.appendVar("PACKAGE_WRITE_DEPS", " systemd-systemctl-native")
-        if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-            d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
 systemd_postinst() {
@@ -295,9 +293,5 @@ rm_sysvinit_initddir() {
 }
 
 do_install[postfuncs] += "${RMINITDIR}"
-RMINITDIR = " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'rm_systemd_unitdir', d)} \
-    ${@'rm_sysvinit_initddir' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and \
-                                 not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) else ''} \
-"
+RMINITDIR = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'rm_sysvinit_initddir', 'rm_systemd_unitdir', d)}"
 RMINITDIR:class-native = ""
diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 0a76647459b..1e64b8ad226 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -2,7 +2,7 @@
 DISTRO_FEATURES:append = " systemd usrmerge"
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
 VIRTUAL-RUNTIME_init_manager ??= "systemd"
-VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
+VIRTUAL-RUNTIME_initscripts ??= ""
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
 VIRTUAL-RUNTIME_dev_manager ??= "systemd"
 # systemd hardcodes /root in its source codes, other values are not offically supported
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f7728f3fad9..37d22df2f43 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -826,7 +826,6 @@ RECIPE_MAINTAINER:pn-systemd-bootchart = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-bootconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-boot-native = "Viswanath Kraleti <quic_vkraleti@quicinc.com>"
 RECIPE_MAINTAINER:pn-systemd-conf = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
deleted file mode 100644
index 68391010371..00000000000
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
-LICENSE = "MIT"
-
-DEPENDS = "systemd-systemctl-native"
-INHIBIT_DEFAULT_DEPS = "1"
-
-S = "${UNPACKDIR}"
-
-inherit features_check
-
-REQUIRED_DISTRO_FEATURES = "systemd"
-
-SYSTEMD_DISABLED_SYSV_SERVICES = " \
-  busybox-udhcpc \
-  hwclock \
-  networking \
-  nfsserver \
-  nfscommon \
-  syslog.busybox \
-"
-
-do_install() {
-	for unit in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
-		systemctl --root ${D} mask $unit
-	done
-}
diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core/systemd/systemd_258.1.bb
index bd8a01f645d..3847b985476 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -18,6 +18,10 @@ REQUIRED_DISTRO_FEATURES += "usrmerge"
 # that we don't build both udev and systemd in world builds.
 REQUIRED_DISTRO_FEATURES += "systemd"
 
+# Systemd used to work with sysvinit compatibility but upstream plans to remove
+# this and hence we can no longer support it
+CONFLICT_DISTRO_FEATURES += "sysvinit"
+
 SRC_URI += " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
@@ -62,7 +66,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', 'link-udev-shared', d)} \
+    link-udev-shared \
     backlight \
     binfmt \
     gshadow \
@@ -300,13 +304,6 @@ do_install() {
 
 	install -m 0644 ${UNPACKDIR}/00-create-volatile.conf ${D}${nonarch_libdir}/tmpfiles.d/
 
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
-		sed -i s%@UDEVD@%${nonarch_libdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
-		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
-	fi
-
 	if ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-log.txt', 'true', 'false', d)}; then
 		# base-files recipe provides /var/log which is a symlink to /var/volatile/log
 		rm -rf ${D}${localstatedir}/log
@@ -841,10 +838,9 @@ INITSCRIPT_PACKAGES = "udev"
 INITSCRIPT_NAME:udev = "systemd-udevd"
 INITSCRIPT_PARAMS:udev = "start 03 S ."
 
-python __anonymous() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+INHIBIT_UPDATERCD_BBCLASS = "1"
 
+python __anonymous() {
     if bb.utils.contains('DISTRO_FEATURES', 'systemd-resolved', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'nss-resolve resolved', True, False, d):
         bb.error("DISTRO_FEATURES[systemd-resolved] requires PACKAGECONFIG[nss-resolve, resolved]")
 

