Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CE8C28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:27:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52311.1742218073576220995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F1CE1688
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:28:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E678B3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:27:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] dhcpcd: don't try to run autoreconf
Date: Mon, 17 Mar 2025 13:27:48 +0000
Message-ID: <20250317132749.1778185-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317132749.1778185-1-ross.burton@arm.com>
References: <20250317132749.1778185-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213094

This recipe has a configure script that isn't actually autoconf but
tries hard to look like it is.  Instead of trying to run autoreconf,
change do_configure to just run the configure script directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/rec=
ipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
index 99b72852bf3..8bc2ad16a39 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/NetworkConfiguration/dhcp=
cd;protocol=3Dhttps;branch=3Dma
 SRCREV =3D "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
 S =3D "${WORKDIR}/git"
=20
+# Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
=20
 SYSTEMD_SERVICE:${PN} =3D "dhcpcd.service"
@@ -50,6 +51,12 @@ EXTRA_OECONF =3D "--enable-ipv4 \
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system -d ${DBDIR} -M -s /bin/false -U dhcpcd=
"
=20
+# This isn't autoconf but is instead a configure script that tries to lo=
ok like
+# autoconf, so just run it directly.
+do_configure() {
+    oe_runconf
+}
+
 do_install:append () {
     # install systemd unit files
     install -d ${D}${systemd_system_unitdir}
--=20
2.43.0


