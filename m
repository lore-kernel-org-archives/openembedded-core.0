Return-Path: <pevik@seznam.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A05C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 22:22:55 +0000 (UTC)
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
 by mx.groups.io with SMTP id smtpd.web10.103063.1669587767253818835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 14:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seznam.cz header.s=szn20221014 header.b=eg5IqLch;
 spf=pass (domain: seznam.cz, ip: 77.75.76.210, mailfrom: pevik@seznam.cz)
Received: from email.seznam.cz
	by smtpc-mxd-6d6659f9df-gw7x2
	(smtpc-mxd-6d6659f9df-gw7x2 [2a02:598:128:8a00::1000:a4b])
	id 2aa6b03e9c860f652aa10e49;
	Sun, 27 Nov 2022 23:22:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
	s=szn20221014; t=1669587762;
	bh=F4khJpWFQh8qzFEgVbXw+sf64QopXFoyzHHSVjdmJbo=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	b=eg5IqLchSYVZ0mQoYvQk8t1BsLUDwgUD41PIwUwA/IsjRLhujE63mdVVTJUbXVS0C
	 Old6qKvjuK9uwEp+x1SLquYjRSZKfYSbCcxktDLfzWZJqA6mAJdx3p5tUsdctRzEh9
	 OMi6dihuo6P1p9ru/bjg6wUThH8BAGVUxDbpITr1kR0gDFqpzdL2xUxInK2nBnHSCW
	 +/8nQIqCF5JAJz4pfLIXlgZaMeGTSokObMrLvCI9stv3b+4GZ6drm/u6vr4ayoUkVv
	 8z6SLzfXIT1662+ewAhoLffxLKJn0ApY1JiiWIljqPDFlq0FvcW54EReXJ5EntYFE9
	 FMQq7UcSF3ClA==
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
	by email-relay8.ko.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
	Sun, 27 Nov 2022 23:22:40 +0100 (CET)  
From: Petr Vorel <pevik@seznam.cz>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v3 1/1] iputils: update to 20221126
Date: Sun, 27 Nov 2022 23:22:34 +0100
Message-Id: <20221127222234.502122-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 22:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173889

From: Petr Vorel <petr.vorel@gmail.com>

This release removed: ninfod, rarpd, rdisc.
Remove also related, not yet upstreamed patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

changes v2-v3:
* Remove ninfod related code (Alexandre Belloni):
${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \

Hope now it's correct (Alexandre Belloni is going to test v2 without
this line).

Kind regards,
Petr

 .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 27 -------------------
 ...putils_20211215.bb => iputils_20221126.bb} | 20 +++-----------
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
 rename meta/recipes-extended/iputils/{iputils_20211215.bb => iputils_20221126.bb} (64%)

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
similarity index 64%
rename from meta/recipes-extended/iputils/iputils_20211215.bb
rename to meta/recipes-extended/iputils/iputils_20221126.bb
index 3ddce0be54..ad9c275e0c 100644
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
 
@@ -23,14 +22,11 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 # breaks the version order.
 CVE_CHECK_IGNORE += "CVE-2000-1213 CVE-2000-1214"
 
-PACKAGECONFIG ??= "libcap rarpd \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
+PACKAGECONFIG ??= "libcap \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false -DNO_SETCAP_OR_SUID=true, libcap libcap-native"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
-PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
-PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
 PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_system_unitdir},,systemd"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
@@ -43,9 +39,7 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-rdisc \
-             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
-             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)}"
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -56,11 +50,3 @@ FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
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


