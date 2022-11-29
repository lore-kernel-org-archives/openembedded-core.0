Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E8FC43217
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 02:20:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.139016.1669688403274588005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 18:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c0lntNtG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EEAB2C0007;
	Tue, 29 Nov 2022 02:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669688401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s6shxB1KCK8Wkauicqp8JlL/S0WFdobeSeOyJgsx5+I=;
	b=c0lntNtGCRbWPPtR5QYIysQXh6r23Dy2FxnZroLIibGLH1Qi0QS2EMAHesyCSJ41uNxgl9
	wDKVQwYiQVa1iIro3XMDy6GX65P7/fZ6LGuoDioXu8/aDF8Ghe/puQBKdZ+Y9Csv8t/JO2
	LvvR7+qkbXa8T0fFq8nGLccKI+9F2wZxnFBZV9ZJxYxeIOirX0TgEpk0+pfe7OTta60AP8
	dTlEHanEYSMpeQK600dYwZvQR8jnk8sBT9e2c8oUgK+LFOkobgRuoMs+YLTvRcdhKRzshS
	NoTQ9cfpbFYYcAF92BcF68Wx2DG/KBVvsOC+yQtjLLxSc1aVOG25y1lst9fGWQ==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] iputils: update to 20221126
Date: Tue, 29 Nov 2022 03:19:52 +0100
Message-Id: <20221129021952.1002093-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 02:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173954

From: Petr Vorel <petr.vorel@gmail.com>

This release removed: ninfod, rarpd, rdisc.
Remove also related, not yet upstreamed patch.

License-Update: ninfod, rarpd, rdisc and switch to SPDX identifier.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 27 -----------------
 ...putils_20211215.bb => iputils_20221126.bb} | 29 ++++---------------
 2 files changed, 6 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
 rename meta/recipes-extended/iputils/{iputils_20211215.bb => iputils_20221126.bb} (53%)

diff --git a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
deleted file mode 100644
index c61e39dc80f1..000000000000
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
similarity index 53%
rename from meta/recipes-extended/iputils/iputils_20211215.bb
rename to meta/recipes-extended/iputils/iputils_20221126.bb
index 3ddce0be54b0..cd5fe9bd3ea2 100644
--- a/meta/recipes-extended/iputils/iputils_20211215.bb
+++ b/meta/recipes-extended/iputils/iputils_20221126.bb
@@ -6,14 +6,12 @@ SECTION = "console/network"
 
 LICENSE = "BSD-3-Clause & GPL-2.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bb64c89bb0e23b72930d2380894c47a1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
-           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
-           "
-SRCREV = "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
+SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
+SRCREV = "5ffabc4190cab975c7332645259e286a032e183b"
 
 S = "${WORKDIR}/git"
 
@@ -23,18 +21,13 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 # breaks the version order.
 CVE_CHECK_IGNORE += "CVE-2000-1213 CVE-2000-1214"
 
-PACKAGECONFIG ??= "libcap rarpd \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "libcap"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false -DNO_SETCAP_OR_SUID=true, libcap libcap-native"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
-PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
-PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
-PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_system_unitdir},,systemd"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
-inherit meson systemd update-alternatives pkgconfig
+inherit meson update-alternatives pkgconfig
 
 EXTRA_OEMESON += "--prefix=${root_prefix}/ -DSKIP_TESTS=true"
 
@@ -43,9 +36,7 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-rdisc \
-             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
-             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)}"
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -56,11 +47,3 @@ FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
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


