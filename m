Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8A7C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 12:05:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21481.1709813128939714354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 04:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A2AD1FB
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:06:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 293333F762
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:05:28 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-firmware: add support for deduplicating the firmware
Date: Thu,  7 Mar 2024 12:05:23 +0000
Message-Id: <20240307120526.774895-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196786

From: Ross Burton <ross.burton@arm.com>

This can a non-trivial amount of disk space, but requires rdfind from
meta-oe. As duplicate pieces of firmware become links, this reduces the
size of individual packages and adds dependencies:

linux-firmware-adsp-sst: PKGSIZE changed from 6362678 to 5609999 (-12%)
linux-firmware-amdgpu: PKGSIZE changed from 80234502 to 60819841 (-24%)
linux-firmware-cirrus: PKGSIZE changed from 1290908 to 1068886 (-17%)
linux-firmware-ibt-17: PKGSIZE changed from 2601222 to 1300679 (-50%)
linux-firmware-ibt-17: RDEPENDS: added "linux-firmware-ibt-misc"
linux-firmware-ibt-20: PKGSIZE changed from 2399511 to 1599721 (-33%)
linux-firmware-ibt-20: RDEPENDS: added "linux-firmware-ibt-misc"
linux-firmware-ibt-misc: PKGSIZE changed from 22400466 to 13390020 (-40%)
linux-firmware-ibt-misc: RDEPENDS: added "linux-firmware-ibt-17"
linux-firmware-qcom-qrb4210-audio: RDEPENDS: added "linux-firmware-qcom-q=
cm2290-audio"
linux-firmware-qcom-qrb4210-modem: PKGSIZE changed from 8882947 to 63 (-1=
00%)
linux-firmware-qcom-qrb4210-modem: RDEPENDS: added "linux-firmware-qcom-q=
cm2290-modem"
linux-firmware-qcom-sdm845-audio: RDEPENDS: added "linux-firmware-qcom-qc=
m2290-audio"
linux-firmware-qcom-sdm845-compute: RDEPENDS: added "linux-firmware-qcom-=
qrb4210-compute"
linux-firmware-qcom-sdm845-modem: RDEPENDS: added "linux-firmware-qcom-qc=
m2290-modem"
linux-firmware-qcom-sm8250-audio: RDEPENDS: added "linux-firmware-qcom-qc=
m2290-audio"
linux-firmware-qcom-sm8250-compute: RDEPENDS: added "linux-firmware-qcom-=
qrb4210-compute"
linux-firmware-qcom-sm8250-thundercomm-rb5-sensors: RDEPENDS: added "linu=
x-firmware-qcom-sdm845-thundercomm-db845c-sensors"
linux-firmware-radeon: PKGSIZE changed from 7105560 to 3343141 (-53%)
linux-firmware-radeon: RDEPENDS: added "linux-firmware-amdgpu"
linux-firmware-rtl8822: RDEPENDS: added "linux-firmware-rtl8761"
linux-firmware-sd8688: RDEPENDS: added "linux-firmware"
linux-firmware: RDEPENDS: added "linux-firmware-rtl8761"

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-firmware/linux-firmware_20231211.bb             | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index 3a3690bdc1b..b3884dd3e5a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -249,13 +249,17 @@ inherit allarch
=20
 CLEANBROKEN =3D "1"
=20
+# Use PACKAGECONFIG_CONFARGS to set the Makefile target
+PACKAGECONFIG ??=3D ""
+# Enabling dedup will turn duplicate firmware files into links
+PACKAGECONFIG[deduplicate] =3D "install,install-nodedup,rdfind-native"
+
 do_compile() {
 	:
 }
=20
 do_install() {
-        # install-nodedup avoids rdfind dependency
-        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' install-nodedup
+        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' ${PACKAGECONFIG_CONFARGS}
         cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware=
/
 }
=20
--=20
2.34.1


