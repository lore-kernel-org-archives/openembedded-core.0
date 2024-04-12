Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A6CC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:24 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.47323.1712929460340582605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 06:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kOWk8Pec;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024041213441776b5397d2d8832b9da-snozc3@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024041213441776b5397d2d8832b9da
        for <openembedded-core@lists.openembedded.org>;
        Fri, 12 Apr 2024 15:44:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uhSThd+gbDDSlphOcMYTNAGSHkgcRbkRhuK0usy6i0Q=;
 b=kOWk8PecDzuIprOwNE5Lbn5JgdnawLYzIgA2ZfmSp4woXnens615rbom1aJjVqcbVxBlpf
 rsluPeP5Hdt6GAXtqarV8JO4twCOX1bbjXWXD7oATnFbPO/qkYBlxwQZUhHVX5z/LI5xxX+j
 eYgqDk7qacAoSHB5DIbcjI0Hmwi1Y=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] systemd: make predictable name mac policy opt-out
Date: Fri, 12 Apr 2024 15:43:17 +0200
Message-Id: <20240412134317.318658-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 13:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198167

From: Peter Marko <peter.marko@siemens.com>

Even the patch says it's inappropriate for upstream,
and it's also inappropriate for some downstream projects, too.
So make it possible to opt-out on it by replacing
the patch by sed and depend on distro feature pni-names.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../systemd/systemd/0001-NamePolicy.patch     | 33 -------------------
 meta/recipes-core/systemd/systemd_255.4.bb    | 13 ++++++--
 2 files changed, 11 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-NamePolicy.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-NamePolicy.patch b/meta/recipes-core/systemd/systemd/0001-NamePolicy.patch
deleted file mode 100644
index 46955cbcbb..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-NamePolicy.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9bb09886320eb286108fb370b2634a66b3e3b9ff Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Thu, 21 Mar 2024 16:28:31 +0000
-Subject: [PATCH] systemd: enable mac based names in NamePolicy
-
-The default NamePolicy for network interface names does not
-include names based on mac addresses.  Some BSPs, though, do
-not provide information to compute other names, so we enable
-mac names as a last resort.
-
-Upstream-Status: Inappropriate [enable feature]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- network/99-default.link | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/network/99-default.link b/network/99-default.link
-index 429ac31e80..543ce54661 100644
---- a/network/99-default.link
-+++ b/network/99-default.link
-@@ -15,6 +15,6 @@
- OriginalName=*
- 
- [Link]
--NamePolicy=keep kernel database onboard slot path
--AlternativeNamesPolicy=database onboard slot path
-+NamePolicy=keep kernel database onboard slot path mac
-+AlternativeNamesPolicy=database onboard slot path mac
- MACAddressPolicy=persistent
--- 
-2.35.5
-
diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index 8a816c4bc1..e7498c802d 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -28,7 +28,6 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
-           file://0001-NamePolicy.patch \
            "
 
 # patches needed by musl
@@ -66,7 +65,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit seccomp', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam pni-names selinux smack usrmerge polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
@@ -197,6 +196,7 @@ PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[polkit_hostnamed_fallback] = ",,,,dbus-broker,polkit"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
 PACKAGECONFIG[pstore] = "-Dpstore=true,-Dpstore=false"
+PACKAGECONFIG[pni-names] = ",,,"
 PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode,,qrencode"
 PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
 PACKAGECONFIG[randomseed] = "-Drandomseed=true,-Drandomseed=false"
@@ -389,6 +389,15 @@ do_install() {
         sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
             ${D}/${sysconfdir}/systemd/system.conf
     fi
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
+		if ! grep -q '^NamePolicy=.*mac' ${D}${rootlibexecdir}/systemd/network/99-default.link; then
+			sed -i '/^NamePolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
+		fi
+		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${rootlibexecdir}/systemd/network/99-default.link; then
+			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
+		fi
+	fi
 }
 
 python populate_packages:prepend (){
-- 
2.30.2


