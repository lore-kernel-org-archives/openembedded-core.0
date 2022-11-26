Return-Path: <pevik@seznam.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8ADC43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 00:51:11 +0000 (UTC)
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
 by mx.groups.io with SMTP id smtpd.web11.61253.1669423870881410429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 16:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seznam.cz header.s=szn20221014 header.b=LDmsrlYD;
 spf=pass (domain: seznam.cz, ip: 77.75.78.210, mailfrom: pevik@seznam.cz)
Received: from email.seznam.cz
	by smtpc-mxd-69d6476965-b5jvz
	(smtpc-mxd-69d6476965-b5jvz [2a02:598:64:8a00::1000:a6b])
	id 47111266f131ad3d4716ac11;
	Sat, 26 Nov 2022 01:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
	s=szn20221014; t=1669423865;
	bh=+xvjws2EIGQb40ILMOLEmMQfbGKvWE73yTZ5W6EK3RM=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	b=LDmsrlYD+VFp8MrXnDwdzG+7ceIcNBq9joolPexFkiCa76hOsyDHl04lTg92HMSJE
	 46Ri+u2RujbDkF8Ss4iAFeL5dn7Y7dazYx/IAMVY8dYF+HwBIUk18/dfrH+6ovRJTC
	 r2ztuoTSnWmdsNI1X46E+izE/fp0hKM919DpLhUYVz8b/YsadLO+tK0OVAg22K8Pnc
	 FCzmwJ+kvUtgR6Xmr4hjZeCwxu1iFG66HNQGF373lxPCfBChl2Tlm/kWzSnif+OTpd
	 AFMVlPEuhTEkzRbicYVIy5FvdvY9WMbZmz/U0dtFpdNtFOC7BsnmFaGMWwvnCNPjUr
	 hm0U01ROEySkQ==
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
	by email-relay14.ng.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
	Sat, 26 Nov 2022 01:51:03 +0100 (CET)  
From: Petr Vorel <pevik@seznam.cz>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/1] iputils: update to 20221126
Date: Sat, 26 Nov 2022 01:50:57 +0100
Message-Id: <20221126005057.464290-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 00:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173790

From: Petr Vorel <petr.vorel@gmail.com>

This release removed: ninfod, rarpd, rdisc.
Remove also related, not yet upstreamed patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

I'm sorry, I haven't managed to test patch.
Can anybody do it for me?
Thank you.

Kind regards,
Petr

 .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 27 -------------------
 ...putils_20211215.bb => iputils_20221126.bb} | 21 +++------------
 2 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
 rename meta/recipes-extended/iputils/{iputils_20211215.bb => iputils_20221126.bb} (66%)

diff --git a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
deleted file mode 100644
index c61e39dc80..0000000000
--- a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From dfeeb3f1328d09f516edeb6349bd63e3c87f9397 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Thu, 13 Feb 2020 06:08:45 +0000
-Subject: [PATCH] rarpd:Drop PrivateUsers
-
-rarpd cannot gain the necessary capabilities with
-PrivateUsers enabled.
-
-Upstream-Status: Pending
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
----
- systemd/rarpd.service.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/systemd/rarpd.service.in b/systemd/rarpd.service.in
-index e600c10..f5d7621 100644
---- a/systemd/rarpd.service.in
-+++ b/systemd/rarpd.service.in
-@@ -12,7 +12,6 @@ AmbientCapabilities=CAP_NET_RAW
- DynamicUser=yes
- PrivateTmp=yes
- PrivateDevices=yes
--PrivateUsers=yes
- ProtectSystem=strict
- ProtectHome=yes
- ProtectControlGroups=yes
diff --git a/meta/recipes-extended/iputils/iputils_20211215.bb b/meta/recipes-extended/iputils/iputils_20221126.bb
similarity index 66%
rename from meta/recipes-extended/iputils/iputils_20211215.bb
rename to meta/recipes-extended/iputils/iputils_20221126.bb
index 3ddce0be54..b4ab2fce5e 100644
--- a/meta/recipes-extended/iputils/iputils_20211215.bb
+++ b/meta/recipes-extended/iputils/iputils_20221126.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb64c89bb0e23b72930d2380894c47a1"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
-           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            "
-SRCREV = "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
+SRCREV = "5ffabc4190cab975c7332645259e286a032e183b"
 
 S = "${WORKDIR}/git"
 
@@ -23,14 +22,12 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 # breaks the version order.
 CVE_CHECK_IGNORE += "CVE-2000-1213 CVE-2000-1214"
 
-PACKAGECONFIG ??= "libcap rarpd \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
+PACKAGECONFIG ??= "libcap \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false -DNO_SETCAP_OR_SUID=true, libcap libcap-native"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
-PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
-PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
 PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_system_unitdir},,systemd"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
@@ -43,9 +40,7 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-rdisc \
-             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
-             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)}"
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -56,11 +51,3 @@ FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
 FILES:${PN}-arping = "${base_bindir}/arping"
 FILES:${PN}-tracepath = "${base_bindir}/tracepath"
 FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
-FILES:${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_system_unitdir}/rarpd@.service"
-FILES:${PN}-rdisc = "${base_sbindir}/rdisc"
-FILES:${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"
-
-SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)} \
-                    ${PN}-rdisc"
-SYSTEMD_SERVICE:${PN}-ninfod = "ninfod.service"
-SYSTEMD_SERVICE:${PN}-rdisc = "rdisc.service"
-- 
2.38.1


