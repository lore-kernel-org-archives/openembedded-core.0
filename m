Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1C9CD13DD
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.930.1777481310134928484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KnWxMF1e;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 156F31BB0
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C46433F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481309; bh=G6i5efwKcsb2U1Vsj2B3SwUwzxw/DteSxH3HzlhVdNc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KnWxMF1e/wV/Hp3wx3HHc0nwiKEkVjd0vtAUtfkpY7q2JhEk2G73Rmmo1NH+RYcoG
	 VrF3rAL6b738ofd6y9EZ+XwDsB4N2gzL6P0M4l29Htezrgb5g5ZnRRyaW6EzCfB/Si
	 rXLHzP7Rl+ae/4hahi5Acvy8MQFus9/sKa507FxA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] linux-firmware: use ${firmwaredir} instead of ${nonarch_base_libdir}/firmware
Date: Wed, 29 Apr 2026 17:48:15 +0100
Message-ID: <20260429164821.3425757-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236116

Now that firmwaredir has been defined, use it instead of explicitly using
${nonarch_base_libdir}/firmware.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-firmware/linux-firmware_20260410.bb | 1646 ++++++++---------
 1 file changed, 823 insertions(+), 823 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
index fd4d2e4d599..cdd16ba33db 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
@@ -490,23 +490,23 @@ do_compile() {
 do_install() {
         sed -i 's:^./check_whence.py:#./check_whence.py:' ${S}/copy-firm=
ware.sh
=20
-        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' install${@fw_compr_suffix(d)}
+        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${firmwaredir}' insta=
ll${@fw_compr_suffix(d)}
         if [ "${@bb.utils.contains('PACKAGECONFIG', 'deduplicate', '1', =
'0', d)}" =3D "1" ]; then
-                oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_bas=
e_libdir}/firmware' dedup
+                oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${firmwaredir=
}' dedup
         fi
-        cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
-        cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
+        cp LICEN[CS]E.* WHENCE ${D}${firmwaredir}/
+        cp wfx/LICEN[CS]E.* ${D}${firmwaredir}/wfx/
=20
         # Remove all unlicensed firmware
         for file in ${REMOVE_UNLICENSED}; do
                 echo "Remove unlicensed firmware: $file"
-                rm ${D}${nonarch_base_libdir}/firmware/$file${@fw_compr_=
file_suffix(d)}
+                rm ${D}${firmwaredir}/$file${@fw_compr_file_suffix(d)}
                 path_to_file=3D$(dirname $file)
                 while [ "${path_to_file}" !=3D "." ]; do
-                        num_files=3D$(ls -A1 ${D}${nonarch_base_libdir}/=
firmware/$path_to_file | wc -l)
+                        num_files=3D$(ls -A1 ${D}${firmwaredir}/$path_to=
_file | wc -l)
                         if [ "$num_files" =3D "0" ]; then
                                 echo "Remove empty dir: $path_to_file"
-                                rm -rf ${D}${nonarch_base_libdir}/firmwa=
re/$path_to_file
+                                rm -rf ${D}${firmwaredir}/$path_to_file
                         fi
                         path_to_file=3D$(dirname $path_to_file)
                 done
@@ -861,9 +861,9 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphio=
n-vpu \
 LICENSE:${PN}-amphion-vpu =3D "Firmware-amphion_vpu"
 LICENSE:${PN}-amphion-vpu-license =3D "Firmware-amphion_vpu"
=20
-FILES:${PN}-amphion-vpu =3D "${nonarch_base_libdir}/firmware/amphion/*"
+FILES:${PN}-amphion-vpu =3D "${firmwaredir}/amphion/*"
 FILES:${PN}-amphion-vpu-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENSE.amphion_vpu \
+  ${firmwaredir}/LICENSE.amphion_vpu \
 "
 RDEPENDS:${PN}-amphion-vpu +=3D "${PN}-amphion-vpu-license"
=20
@@ -872,10 +872,10 @@ LICENSE:${PN}-cw1200 =3D "Firmware-cw1200"
 LICENSE:${PN}-cw1200-license =3D "Firmware-cw1200"
=20
 FILES:${PN}-cw1200 =3D " \
-    ${nonarch_base_libdir}/firmware/sdd_sagrad_1091_1098.bin* \
-    ${nonarch_base_libdir}/firmware/wsm_22.bin* \
+    ${firmwaredir}/sdd_sagrad_1091_1098.bin* \
+    ${firmwaredir}/wsm_22.bin* \
 "
-FILES:${PN}-cw1200-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
cw1200"
+FILES:${PN}-cw1200-license =3D "${firmwaredir}/LICENCE.cw1200"
=20
 RDEPENDS:${PN}-cw1200 +=3D "${PN}-cw1200-license"
=20
@@ -887,26 +887,26 @@ LICENSE:${PN}-ath6k =3D "Firmware-atheros_firmware"
 LICENSE:${PN}-ath9k =3D "Firmware-atheros_firmware"
 LICENSE:${PN}-atheros-license =3D "Firmware-atheros_firmware"
=20
-FILES:${PN}-atheros-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.atheros_firmware"
+FILES:${PN}-atheros-license =3D "${firmwaredir}/LICENCE.atheros_firmware=
"
 FILES:${PN}-ar5523 =3D " \
-  ${nonarch_base_libdir}/firmware/ar5523.bin* \
+  ${firmwaredir}/ar5523.bin* \
 "
 FILES:${PN}-ar9170 =3D " \
-  ${nonarch_base_libdir}/firmware/ar9170*.fw* \
+  ${firmwaredir}/ar9170*.fw* \
 "
 FILES:${PN}-ath3k =3D " \
-  ${nonarch_base_libdir}/firmware/ath3k*fw* \
+  ${firmwaredir}/ath3k*fw* \
 "
 FILES:${PN}-ath6k =3D " \
-  ${nonarch_base_libdir}/firmware/ath6k \
+  ${firmwaredir}/ath6k \
 "
 FILES:${PN}-ath9k =3D " \
-  ${nonarch_base_libdir}/firmware/ar9271.fw* \
-  ${nonarch_base_libdir}/firmware/ar7010*.fw* \
-  ${nonarch_base_libdir}/firmware/htc_9271.fw* \
-  ${nonarch_base_libdir}/firmware/htc_7010.fw* \
-  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_7010-1.4.0.fw* \
-  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_9271-1.4.0.fw* \
+  ${firmwaredir}/ar9271.fw* \
+  ${firmwaredir}/ar7010*.fw* \
+  ${firmwaredir}/htc_9271.fw* \
+  ${firmwaredir}/htc_7010.fw* \
+  ${firmwaredir}/ath9k_htc/htc_7010-1.4.0.fw* \
+  ${firmwaredir}/ath9k_htc/htc_9271-1.4.0.fw* \
 "
=20
 RDEPENDS:${PN}-ar5523 +=3D "${PN}-atheros-license"
@@ -917,7 +917,7 @@ RDEPENDS:${PN}-ath9k +=3D "${PN}-atheros-license"
 # For carl9170
=20
 FILES:${PN}-carl9170 =3D " \
-  ${nonarch_base_libdir}/firmware/carl9170*.fw* \
+  ${firmwaredir}/carl9170*.fw* \
 "
 LICENSE:${PN}-carl9170 =3D "GPL-2.0-or-later"
=20
@@ -961,139 +961,139 @@ LICENSE:${PN}-qca-wcn6750 =3D "Firmware-qualcommA=
thos_ath10k"
 LICENSE:${PN}-qca-wcn685x =3D "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn7850 =3D "Firmware-qcom"
=20
-FILES:${PN}-ar3k-license =3D "${nonarch_base_libdir}/firmware/LICENSE.Qu=
alcommAtheros_ar3k"
+FILES:${PN}-ar3k-license =3D "${firmwaredir}/LICENSE.QualcommAtheros_ar3=
k"
 FILES:${PN}-ar3k =3D " \
-  ${nonarch_base_libdir}/firmware/ar3k \
+  ${firmwaredir}/ar3k \
 "
=20
-FILES:${PN}-ath10k-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
QualcommAtheros_ath10k"
-FILES:${PN}-ath10k-qca4019 =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA4019"
-FILES:${PN}-ath10k-qca6174 =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA6174"
-FILES:${PN}-ath10k-qca9377 =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA9377"
-FILES:${PN}-ath10k-qca9887 =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA9887"
-FILES:${PN}-ath10k-qca9888 =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA9888"
-FILES:${PN}-ath10k-qca988x =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA988X"
-FILES:${PN}-ath10k-qca9984 =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA9984"
-FILES:${PN}-ath10k-qca99x0 =3D "${nonarch_base_libdir}/firmware/ath10k/Q=
CA99X0"
-FILES:${PN}-ath10k-wcn3990 =3D "${nonarch_base_libdir}/firmware/ath10k/W=
CN3990"
+FILES:${PN}-ath10k-license =3D "${firmwaredir}/LICENSE.QualcommAtheros_a=
th10k"
+FILES:${PN}-ath10k-qca4019 =3D "${firmwaredir}/ath10k/QCA4019"
+FILES:${PN}-ath10k-qca6174 =3D "${firmwaredir}/ath10k/QCA6174"
+FILES:${PN}-ath10k-qca9377 =3D "${firmwaredir}/ath10k/QCA9377"
+FILES:${PN}-ath10k-qca9887 =3D "${firmwaredir}/ath10k/QCA9887"
+FILES:${PN}-ath10k-qca9888 =3D "${firmwaredir}/ath10k/QCA9888"
+FILES:${PN}-ath10k-qca988x =3D "${firmwaredir}/ath10k/QCA988X"
+FILES:${PN}-ath10k-qca9984 =3D "${firmwaredir}/ath10k/QCA9984"
+FILES:${PN}-ath10k-qca99x0 =3D "${firmwaredir}/ath10k/QCA99X0"
+FILES:${PN}-ath10k-wcn3990 =3D "${firmwaredir}/ath10k/WCN3990"
 # -ath10k is a virtual package that depends upon all ath10k packages.
 ALLOW_EMPTY:${PN}-ath10k =3D "1"
=20
-FILES:${PN}-ath11k-ipq5018 =3D "${nonarch_base_libdir}/firmware/ath11k/I=
PQ5018"
-FILES:${PN}-ath11k-ipq6018 =3D "${nonarch_base_libdir}/firmware/ath11k/I=
PQ6018"
-FILES:${PN}-ath11k-ipq8074 =3D "${nonarch_base_libdir}/firmware/ath11k/I=
PQ8074"
-FILES:${PN}-ath11k-qca2066 =3D "${nonarch_base_libdir}/firmware/ath11k/Q=
CA2066"
-FILES:${PN}-ath11k-qca6390 =3D "${nonarch_base_libdir}/firmware/ath11k/Q=
CA6390"
-FILES:${PN}-ath11k-qca6698aq =3D "${nonarch_base_libdir}/firmware/ath11k=
/QCA6698AQ"
-FILES:${PN}-ath11k-qcn9074 =3D "${nonarch_base_libdir}/firmware/ath11k/Q=
CN9074"
-FILES:${PN}-ath11k-wcn6750 =3D "${nonarch_base_libdir}/firmware/ath11k/W=
CN6750"
-FILES:${PN}-ath11k-wcn6855 =3D "${nonarch_base_libdir}/firmware/ath11k/W=
CN6855"
+FILES:${PN}-ath11k-ipq5018 =3D "${firmwaredir}/ath11k/IPQ5018"
+FILES:${PN}-ath11k-ipq6018 =3D "${firmwaredir}/ath11k/IPQ6018"
+FILES:${PN}-ath11k-ipq8074 =3D "${firmwaredir}/ath11k/IPQ8074"
+FILES:${PN}-ath11k-qca2066 =3D "${firmwaredir}/ath11k/QCA2066"
+FILES:${PN}-ath11k-qca6390 =3D "${firmwaredir}/ath11k/QCA6390"
+FILES:${PN}-ath11k-qca6698aq =3D "${firmwaredir}/ath11k/QCA6698AQ"
+FILES:${PN}-ath11k-qcn9074 =3D "${firmwaredir}/ath11k/QCN9074"
+FILES:${PN}-ath11k-wcn6750 =3D "${firmwaredir}/ath11k/WCN6750"
+FILES:${PN}-ath11k-wcn6855 =3D "${firmwaredir}/ath11k/WCN6855"
 # -ath11k is a virtual package that depends upon all ath11k packages.
 ALLOW_EMPTY:${PN}-ath11k =3D "1"
=20
-FILES:${PN}-ath12k-qcn9274 =3D "${nonarch_base_libdir}/firmware/ath12k/Q=
CN9274"
-FILES:${PN}-ath12k-wcn7850 =3D "${nonarch_base_libdir}/firmware/ath12k/W=
CN7850"
+FILES:${PN}-ath12k-qcn9274 =3D "${firmwaredir}/ath12k/QCN9274"
+FILES:${PN}-ath12k-wcn7850 =3D "${firmwaredir}/ath12k/WCN7850"
 # -ath12k is a virtual package that depends upon all ath12k packages.
 ALLOW_EMPTY:${PN}-ath12k =3D "1"
=20
 FILES:${PN}-qca-qca2066 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.301* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.302* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.309* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.30a* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.30a* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
+  ${firmwaredir}/qca/hpbtfw21.tlv* \
+  ${firmwaredir}/qca/hpnv21.bin* \
+  ${firmwaredir}/qca/hpnv21g.bin* \
+  ${firmwaredir}/qca/hpnv21.301* \
+  ${firmwaredir}/qca/hpnv21.302* \
+  ${firmwaredir}/qca/hpnv21g.301* \
+  ${firmwaredir}/qca/hpnv21g.302* \
+  ${firmwaredir}/qca/hpnv21.309* \
+  ${firmwaredir}/qca/hpnv21g.309* \
+  ${firmwaredir}/qca/hpnv21.30a* \
+  ${firmwaredir}/qca/hpnv21g.30a* \
+  ${firmwaredir}/qca/hpnv21.b8c* \
+  ${firmwaredir}/qca/hpnv21.b9f* \
+  ${firmwaredir}/qca/hpnv21.ba0* \
+  ${firmwaredir}/qca/hpnv21.ba1* \
+  ${firmwaredir}/qca/hpnv21.ba2* \
+  ${firmwaredir}/qca/hpnv21.ba3* \
+  ${firmwaredir}/qca/hpnv21.ba4* \
+  ${firmwaredir}/qca/hpnv21.baa* \
+  ${firmwaredir}/qca/hpnv21.bb8* \
+  ${firmwaredir}/qca/hpnv21.b10c* \
+  ${firmwaredir}/qca/hpnv21.b111* \
+  ${firmwaredir}/qca/hpnv21g.b8c* \
+  ${firmwaredir}/qca/hpnv21g.b9f* \
+  ${firmwaredir}/qca/hpnv21g.ba0* \
+  ${firmwaredir}/qca/hpnv21g.ba1* \
+  ${firmwaredir}/qca/hpnv21g.ba2* \
+  ${firmwaredir}/qca/hpnv21g.ba3* \
+  ${firmwaredir}/qca/hpnv21g.ba4* \
+  ${firmwaredir}/qca/hpnv21g.baa* \
+  ${firmwaredir}/qca/hpnv21g.bb8* \
+  ${firmwaredir}/qca/hpnv21g.b10c* \
+  ${firmwaredir}/qca/hpnv21g.b111* \
 "
 FILES:${PN}-qca-qca61x4-serial =3D " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin* \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin* \
+  ${firmwaredir}/qca/nvm_0*.bin* \
+  ${firmwaredir}/qca/rampatch_0*.bin* \
 "
 FILES:${PN}-qca-qca61x4-usb =3D " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin* \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin*=
 \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.b=
in* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin*=
 \
+  ${firmwaredir}/qca/nvm_usb_*.bin* \
+  ${firmwaredir}/qca/rampatch_usb_*.bin* \
+  ${firmwaredir}/qca/QCA2066/nvm_usb_00130201_030a.bin* \
+  ${firmwaredir}/qca/QCA2066/nvm_usb_00130201_gf_030a.bin* \
+  ${firmwaredir}/qca/QCA2066/rampatch_usb_00130201.bin* \
 "
 FILES:${PN}-qca-qca6390 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/htnv20.bin* \
+  ${firmwaredir}/qca/htbtfw20.tlv* \
+  ${firmwaredir}/qca/htnv20.bin* \
 "
 FILES:${PN}-qca-qca6698 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpbtfw21.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b206* \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207* \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin* \
+  ${firmwaredir}/qca/QCA6698/hpbtfw21.tlv* \
+  ${firmwaredir}/qca/QCA6698/hpnv21.b206* \
+  ${firmwaredir}/qca/QCA6698/hpnv21.b207* \
+  ${firmwaredir}/qca/QCA6698/hpnv21.bin* \
 "
 FILES:${PN}-qca-qcc2072 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/ornbtfw11.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/ornnv11.bin* \
+  ${firmwaredir}/qca/ornbtfw11.tlv* \
+  ${firmwaredir}/qca/ornnv11.bin* \
 "
 FILES:${PN}-qca-wcn3950 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/cmnv12.bin* \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13.bin* \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13s.bin* \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13t.bin* \
+  ${firmwaredir}/qca/cmbtfw12.tlv* \
+  ${firmwaredir}/qca/cmbtfw13.tlv* \
+  ${firmwaredir}/qca/cmnv12.bin* \
+  ${firmwaredir}/qca/cmnv13.bin* \
+  ${firmwaredir}/qca/cmnv13s.bin* \
+  ${firmwaredir}/qca/cmnv13t.bin* \
 "
 FILES:${PN}-qca-wcn3988 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/apnv10.bin* \
-  ${nonarch_base_libdir}/firmware/qca/apnv11.bin* \
+  ${firmwaredir}/qca/apbtfw10.tlv* \
+  ${firmwaredir}/qca/apbtfw11.tlv* \
+  ${firmwaredir}/qca/apnv10.bin* \
+  ${firmwaredir}/qca/apnv11.bin* \
 "
 FILES:${PN}-qca-wcn399x =3D " \
-  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/crnv21.bin* \
-  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/crnv32.bin* \
-  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin* \
+  ${firmwaredir}/qca/crbtfw21.tlv* \
+  ${firmwaredir}/qca/crnv21.bin* \
+  ${firmwaredir}/qca/crbtfw32.tlv* \
+  ${firmwaredir}/qca/crnv32.bin* \
+  ${firmwaredir}/qca/crnv32u.bin* \
 "
 FILES:${PN}-qca-wcn6750 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn* \
-  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.bin* \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a* \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.b09* \
+  ${firmwaredir}/qca/msbtfw11.mbn* \
+  ${firmwaredir}/qca/msbtfw11.tlv* \
+  ${firmwaredir}/qca/msnv11.bin* \
+  ${firmwaredir}/qca/msnv11.b0a* \
+  ${firmwaredir}/qca/msnv11.b09* \
 "
 FILES:${PN}-qca-wcn685x =3D " \
-  ${nonarch_base_libdir}/firmware/qca/wcnhpbtfw21.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b* \
-  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b* \
+  ${firmwaredir}/qca/wcnhpbtfw21.tlv* \
+  ${firmwaredir}/qca/wcnhpnv21.b* \
+  ${firmwaredir}/qca/wcnhpnv21g.b* \
 "
 FILES:${PN}-qca-wcn7850 =3D " \
-  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f* \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112* \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin* \
+  ${firmwaredir}/qca/hmtbtfw20.tlv* \
+  ${firmwaredir}/qca/hmtnv20.b10f* \
+  ${firmwaredir}/qca/hmtnv20.b112* \
+  ${firmwaredir}/qca/hmtnv20.bin* \
 "
 ALLOW_EMPTY:${PN}-qca =3D "1"
=20
@@ -1138,22 +1138,22 @@ RDEPENDS:${PN}-qca-wcn7850 +=3D "${PN}-qcom-licen=
se"
 LICENSE:${PN}-ralink =3D "Firmware-ralink-firmware"
 LICENSE:${PN}-ralink-license =3D "Firmware-ralink-firmware"
=20
-FILES:${PN}-ralink-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
ralink-firmware.txt"
+FILES:${PN}-ralink-license =3D "${firmwaredir}/LICENCE.ralink-firmware.t=
xt"
 FILES:${PN}-ralink =3D " \
-  ${nonarch_base_libdir}/firmware/rt*.bin* \
+  ${firmwaredir}/rt*.bin* \
 "
=20
 RDEPENDS:${PN}-ralink +=3D "${PN}-ralink-license"
=20
 # For mediatek MT7601U
 LICENSE:${PN}-mt76x-license =3D "Firmware-ralink_a_mediatek_company_firm=
ware"
-FILES:${PN}-mt76x-license =3D "${nonarch_base_libdir}/firmware/LICENCE.r=
alink_a_mediatek_company_firmware"
+FILES:${PN}-mt76x-license =3D "${firmwaredir}/LICENCE.ralink_a_mediatek_=
company_firmware"
=20
 LICENSE:${PN}-mt7601u =3D "Firmware-ralink_a_mediatek_company_firmware"
=20
 FILES:${PN}-mt7601u =3D " \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin* \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin* \
+  ${firmwaredir}/mediatek/mt7601u.bin* \
+  ${firmwaredir}/mt7601u.bin* \
 "
 RDEPENDS:${PN}-mt7601u +=3D "${PN}-mt76x-license"
=20
@@ -1161,8 +1161,8 @@ RDEPENDS:${PN}-mt7601u +=3D "${PN}-mt76x-license"
 LICENSE:${PN}-mt7650 =3D "Firmware-ralink_a_mediatek_company_firmware"
=20
 FILES:${PN}-mt7650 =3D " \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7650.bin* \
-  ${nonarch_base_libdir}/firmware/mt7650.bin* \
+  ${firmwaredir}/mediatek/mt7650.bin* \
+  ${firmwaredir}/mt7650.bin* \
 "
 RDEPENDS:${PN}-mt7650 +=3D "${PN}-mt76x-license"
=20
@@ -1170,10 +1170,10 @@ RDEPENDS:${PN}-mt7650 +=3D "${PN}-mt76x-license"
 LICENSE:${PN}-mt76x2 =3D "Firmware-ralink_a_mediatek_company_firmware"
=20
 FILES:${PN}-mt76x2 =3D " \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7662.bin* \
-  ${nonarch_base_libdir}/firmware/mt7662.bin* \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7662_rom_patch.bin* \
-  ${nonarch_base_libdir}/firmware/mt7662_rom_patch.bin* \
+  ${firmwaredir}/mediatek/mt7662.bin* \
+  ${firmwaredir}/mt7662.bin* \
+  ${firmwaredir}/mediatek/mt7662_rom_patch.bin* \
+  ${firmwaredir}/mt7662_rom_patch.bin* \
 "
 RDEPENDS:${PN}-mt76x2 +=3D "${PN}-mt76x-license"
=20
@@ -1182,12 +1182,12 @@ LICENSE:${PN}-mediatek =3D "Firmware-mediatek"
 LICENSE:${PN}-mediatek-license =3D "Firmware-mediatek"
=20
 FILES:${PN}-mediatek =3D " \
-  ${nonarch_base_libdir}/firmware/mediatek/* \
-  ${nonarch_base_libdir}/firmware/vpu_d.bin* \
-  ${nonarch_base_libdir}/firmware/vpu_p.bin* \
+  ${firmwaredir}/mediatek/* \
+  ${firmwaredir}/vpu_d.bin* \
+  ${firmwaredir}/vpu_p.bin* \
 "
 FILES:${PN}-mediatek-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.mediatek \
+  ${firmwaredir}/LICENCE.mediatek \
 "
 RDEPENDS:${PN}-mediatek +=3D "${PN}-mediatek-license"
=20
@@ -1195,9 +1195,9 @@ RDEPENDS:${PN}-mediatek +=3D "${PN}-mediatek-licens=
e"
 LICENSE:${PN}-microchip =3D "Firmware-microchip"
 LICENSE:${PN}-microchip-license =3D "Firmware-microchip"
=20
-FILES:${PN}-microchip =3D "${nonarch_base_libdir}/firmware/microchip/*"
+FILES:${PN}-microchip =3D "${firmwaredir}/microchip/*"
 FILES:${PN}-microchip-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.microchip \
+  ${firmwaredir}/LICENCE.microchip \
 "
 RDEPENDS:${PN}-microchip +=3D "${PN}-microchip-license"
=20
@@ -1205,8 +1205,8 @@ RDEPENDS:${PN}-microchip +=3D "${PN}-microchip-lice=
nse"
 LICENSE:${PN}-moxa =3D "Firmware-moxa"
 LICENSE:${PN}-moxa-license =3D "Firmware-moxa"
=20
-FILES:${PN}-moxa =3D "${nonarch_base_libdir}/firmware/moxa"
-FILES:${PN}-moxa-license =3D "${nonarch_base_libdir}/firmware/LICENCE.mo=
xa"
+FILES:${PN}-moxa =3D "${firmwaredir}/moxa"
+FILES:${PN}-moxa-license =3D "${firmwaredir}/LICENCE.moxa"
=20
 RDEPENDS:${PN}-moxa +=3D "${PN}-moxa-license"
=20
@@ -1215,9 +1215,9 @@ RDEPENDS:${PN}-moxa +=3D "${PN}-moxa-license"
 LICENSE:${PN}-radeon =3D "Firmware-radeon"
 LICENSE:${PN}-radeon-license =3D "Firmware-radeon"
=20
-FILES:${PN}-radeon-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
radeon"
+FILES:${PN}-radeon-license =3D "${firmwaredir}/LICENSE.radeon"
 FILES:${PN}-radeon =3D " \
-  ${nonarch_base_libdir}/firmware/radeon \
+  ${firmwaredir}/radeon \
 "
=20
 RDEPENDS:${PN}-radeon +=3D "${PN}-radeon-license"
@@ -1252,47 +1252,47 @@ LICENSE:${PN}-amdgpu-vega10 =3D "Firmware-amdgpu"
 LICENSE:${PN}-amdgpu-vega12 =3D "Firmware-amdgpu"
 LICENSE:${PN}-amdgpu-misc =3D "Firmware-amdgpu"
=20
-FILES:${PN}-amdgpu-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
amdgpu"
-FILES:${PN}-amdgpu-aldebaran =3D "${nonarch_base_libdir}/firmware/amdgpu=
/aldebaran_*.bin*"
-FILES:${PN}-amdgpu-carrizo =3D "${nonarch_base_libdir}/firmware/amdgpu/c=
arrizo_*.bin*"
-FILES:${PN}-amdgpu-cezanne =3D "${nonarch_base_libdir}/firmware/amdgpu/g=
reen_sardine_*.bin*"
-FILES:${PN}-amdgpu-fiji =3D "${nonarch_base_libdir}/firmware/amdgpu/fiji=
_*.bin*"
-FILES:${PN}-amdgpu-hawaii =3D "${nonarch_base_libdir}/firmware/amdgpu/ha=
waii_*.bin*"
-FILES:${PN}-amdgpu-navi10 =3D "${nonarch_base_libdir}/firmware/amdgpu/na=
vi10_*.bin*"
-FILES:${PN}-amdgpu-navi14 =3D "${nonarch_base_libdir}/firmware/amdgpu/na=
vi14_*.bin*"
-FILES:${PN}-amdgpu-navi21 =3D "${nonarch_base_libdir}/firmware/amdgpu/si=
enna_cichlid_*.bin*"
-FILES:${PN}-amdgpu-navi22 =3D "${nonarch_base_libdir}/firmware/amdgpu/na=
vy_flounder_*.bin*"
-FILES:${PN}-amdgpu-navi23 =3D "${nonarch_base_libdir}/firmware/amdgpu/di=
mgrey_cavefish_*.bin*"
-FILES:${PN}-amdgpu-navi24 =3D "${nonarch_base_libdir}/firmware/amdgpu/be=
ige_goby_*.bin*"
-FILES:${PN}-amdgpu-navi31 =3D "${nonarch_base_libdir}/firmware/amdgpu/gc=
_11_0_0_*.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_sos.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_ta.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_0.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_0.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin* \
+FILES:${PN}-amdgpu-license =3D "${firmwaredir}/LICENSE.amdgpu"
+FILES:${PN}-amdgpu-aldebaran =3D "${firmwaredir}/amdgpu/aldebaran_*.bin*=
"
+FILES:${PN}-amdgpu-carrizo =3D "${firmwaredir}/amdgpu/carrizo_*.bin*"
+FILES:${PN}-amdgpu-cezanne =3D "${firmwaredir}/amdgpu/green_sardine_*.bi=
n*"
+FILES:${PN}-amdgpu-fiji =3D "${firmwaredir}/amdgpu/fiji_*.bin*"
+FILES:${PN}-amdgpu-hawaii =3D "${firmwaredir}/amdgpu/hawaii_*.bin*"
+FILES:${PN}-amdgpu-navi10 =3D "${firmwaredir}/amdgpu/navi10_*.bin*"
+FILES:${PN}-amdgpu-navi14 =3D "${firmwaredir}/amdgpu/navi14_*.bin*"
+FILES:${PN}-amdgpu-navi21 =3D "${firmwaredir}/amdgpu/sienna_cichlid_*.bi=
n*"
+FILES:${PN}-amdgpu-navi22 =3D "${firmwaredir}/amdgpu/navy_flounder_*.bin=
*"
+FILES:${PN}-amdgpu-navi23 =3D "${firmwaredir}/amdgpu/dimgrey_cavefish_*.=
bin*"
+FILES:${PN}-amdgpu-navi24 =3D "${firmwaredir}/amdgpu/beige_goby_*.bin*"
+FILES:${PN}-amdgpu-navi31 =3D "${firmwaredir}/amdgpu/gc_11_0_0_*.bin* \
+    ${firmwaredir}/amdgpu/psp_13_0_0_sos.bin* \
+    ${firmwaredir}/amdgpu/psp_13_0_0_ta.bin* \
+    ${firmwaredir}/amdgpu/smu_13_0_0.bin* \
+    ${firmwaredir}/amdgpu/dcn_3_2_0_dmcub.bin* \
+    ${firmwaredir}/amdgpu/sdma_6_0_0.bin* \
+    ${firmwaredir}/amdgpu/vcn_4_0_0.bin* \
 "
-FILES:${PN}-amdgpu-navi32 =3D "${nonarch_base_libdir}/firmware/amdgpu/dc=
n_3_2_0_dmcub.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_3_*.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_sos.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_ta.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_3.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_10.bin* \
-    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin* \
+FILES:${PN}-amdgpu-navi32 =3D "${firmwaredir}/amdgpu/dcn_3_2_0_dmcub.bin=
* \
+    ${firmwaredir}/amdgpu/gc_11_0_3_*.bin* \
+    ${firmwaredir}/amdgpu/psp_13_0_10_sos.bin* \
+    ${firmwaredir}/amdgpu/psp_13_0_10_ta.bin* \
+    ${firmwaredir}/amdgpu/sdma_6_0_3.bin* \
+    ${firmwaredir}/amdgpu/smu_13_0_10.bin* \
+    ${firmwaredir}/amdgpu/vcn_4_0_0.bin* \
 "
-FILES:${PN}-amdgpu-oland =3D "${nonarch_base_libdir}/firmware/amdgpu/ola=
nd_*.bin*"
-FILES:${PN}-amdgpu-polaris10 =3D "${nonarch_base_libdir}/firmware/amdgpu=
/polaris10_*.bin*"
-FILES:${PN}-amdgpu-polaris11 =3D "${nonarch_base_libdir}/firmware/amdgpu=
/polaris11_*.bin*"
-FILES:${PN}-amdgpu-polaris12 =3D "${nonarch_base_libdir}/firmware/amdgpu=
/polaris12_*.bin*"
-FILES:${PN}-amdgpu-raven =3D "${nonarch_base_libdir}/firmware/amdgpu/rav=
en_*.bin*"
-FILES:${PN}-amdgpu-rembrandt =3D "${nonarch_base_libdir}/firmware/amdgpu=
/yellow_carp_*.bin*"
-FILES:${PN}-amdgpu-renoir =3D "${nonarch_base_libdir}/firmware/amdgpu/re=
noir_*.bin*"
-FILES:${PN}-amdgpu-stoney =3D "${nonarch_base_libdir}/firmware/amdgpu/st=
oney_*.bin*"
-FILES:${PN}-amdgpu-tonga =3D "${nonarch_base_libdir}/firmware/amdgpu/ton=
ga_*.bin*"
-FILES:${PN}-amdgpu-topaz =3D "${nonarch_base_libdir}/firmware/amdgpu/top=
az_*.bin*"
-FILES:${PN}-amdgpu-vega10 =3D "${nonarch_base_libdir}/firmware/amdgpu/ve=
ga10_*.bin*"
-FILES:${PN}-amdgpu-vega12 =3D "${nonarch_base_libdir}/firmware/amdgpu/ve=
ga12_*.bin*"
-FILES:${PN}-amdgpu-misc =3D "${nonarch_base_libdir}/firmware/amdgpu/*"
+FILES:${PN}-amdgpu-oland =3D "${firmwaredir}/amdgpu/oland_*.bin*"
+FILES:${PN}-amdgpu-polaris10 =3D "${firmwaredir}/amdgpu/polaris10_*.bin*=
"
+FILES:${PN}-amdgpu-polaris11 =3D "${firmwaredir}/amdgpu/polaris11_*.bin*=
"
+FILES:${PN}-amdgpu-polaris12 =3D "${firmwaredir}/amdgpu/polaris12_*.bin*=
"
+FILES:${PN}-amdgpu-raven =3D "${firmwaredir}/amdgpu/raven_*.bin*"
+FILES:${PN}-amdgpu-rembrandt =3D "${firmwaredir}/amdgpu/yellow_carp_*.bi=
n*"
+FILES:${PN}-amdgpu-renoir =3D "${firmwaredir}/amdgpu/renoir_*.bin*"
+FILES:${PN}-amdgpu-stoney =3D "${firmwaredir}/amdgpu/stoney_*.bin*"
+FILES:${PN}-amdgpu-tonga =3D "${firmwaredir}/amdgpu/tonga_*.bin*"
+FILES:${PN}-amdgpu-topaz =3D "${firmwaredir}/amdgpu/topaz_*.bin*"
+FILES:${PN}-amdgpu-vega10 =3D "${firmwaredir}/amdgpu/vega10_*.bin*"
+FILES:${PN}-amdgpu-vega12 =3D "${firmwaredir}/amdgpu/vega12_*.bin*"
+FILES:${PN}-amdgpu-misc =3D "${firmwaredir}/amdgpu/*"
 # -amdgpu is a virtual package that depends upon all amdgpu packages.
 ALLOW_EMPTY:${PN}-amdgpu =3D "1"
 # -amdgpu-misc is a catch all package that includes all the amdgpu
@@ -1331,35 +1331,35 @@ RDEPENDS:${PN}-amdgpu-misc +=3D "${PN}-amdgpu-lic=
ense"
 LICENSE:${PN}-lt8713sx =3D "Firmware-Lontium"
 LICENSE:${PN}-lt9611uxc =3D "Firmware-Lontium"
=20
-FILES:${PN}-lontium-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.Lontium"
-FILES:${PN}-lt8713sx =3D "${nonarch_base_libdir}/firmware/lt8713sx_fw.bi=
n*"
-FILES:${PN}-lt9611uxc =3D "${nonarch_base_libdir}/firmware/lt9611uxc_fw.=
bin*"
+FILES:${PN}-lontium-license =3D "${firmwaredir}/LICENSE.Lontium"
+FILES:${PN}-lt8713sx =3D "${firmwaredir}/lt8713sx_fw.bin*"
+FILES:${PN}-lt9611uxc =3D "${firmwaredir}/lt9611uxc_fw.bin*"
=20
 # For Arm Mali
-FILES:${PN}-mali-csffw-license =3D "${nonarch_base_libdir}/firmware/LICE=
NCE.mali_csffw"
+FILES:${PN}-mali-csffw-license =3D "${firmwaredir}/LICENCE.mali_csffw"
=20
 LICENSE:${PN}-mali-csffw-arch108 =3D "Firmware-mali_csffw"
-FILES:${PN}-mali-csffw-arch108 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch10.8/mali_csffw.bin*"
+FILES:${PN}-mali-csffw-arch108 =3D "${firmwaredir}/arm/mali/arch10.8/mal=
i_csffw.bin*"
 RDEPENDS:${PN}-mali-csffw-arch108 +=3D "${PN}-mali-csffw-license"
=20
 LICENSE:${PN}-mali-csffw-arch1010 =3D "Firmware-mali_csffw"
-FILES:${PN}-mali-csffw-arch1010 =3D "${nonarch_base_libdir}/firmware/arm=
/mali/arch10.10/mali_csffw.bin*"
+FILES:${PN}-mali-csffw-arch1010 =3D "${firmwaredir}/arm/mali/arch10.10/m=
ali_csffw.bin*"
 RDEPENDS:${PN}-mali-csffw-arch1010 +=3D "${PN}-mali-csffw-license"
=20
 LICENSE:${PN}-mali-csffw-arch1012 =3D "Firmware-mali_csffw"
-FILES:${PN}-mali-csffw-arch1012 =3D "${nonarch_base_libdir}/firmware/arm=
/mali/arch10.12/mali_csffw.bin*"
+FILES:${PN}-mali-csffw-arch1012 =3D "${firmwaredir}/arm/mali/arch10.12/m=
ali_csffw.bin*"
 RDEPENDS:${PN}-mali-csffw-arch1012 +=3D "${PN}-mali-csffw-license"
=20
 LICENSE:${PN}-mali-csffw-arch118 =3D "Firmware-mali_csffw"
-FILES:${PN}-mali-csffw-arch118 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch11.8/mali_csffw.bin*"
+FILES:${PN}-mali-csffw-arch118 =3D "${firmwaredir}/arm/mali/arch11.8/mal=
i_csffw.bin*"
 RDEPENDS:${PN}-mali-csffw-arch118 +=3D "${PN}-mali-csffw-license"
=20
 LICENSE:${PN}-mali-csffw-arch128 =3D "Firmware-mali_csffw"
-FILES:${PN}-mali-csffw-arch128 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch12.8/mali_csffw.bin*"
+FILES:${PN}-mali-csffw-arch128 =3D "${firmwaredir}/arm/mali/arch12.8/mal=
i_csffw.bin*"
 RDEPENDS:${PN}-mali-csffw-arch128 +=3D "${PN}-mali-csffw-license"
=20
 LICENSE:${PN}-mali-csffw-arch138 =3D "Firmware-mali_csffw"
-FILES:${PN}-mali-csffw-arch138 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch13.8/mali_csffw.bin*"
+FILES:${PN}-mali-csffw-arch138 =3D "${firmwaredir}/arm/mali/arch13.8/mal=
i_csffw.bin*"
 RDEPENDS:${PN}-mali-csffw-arch138 +=3D "${PN}-mali-csffw-license"
=20
 # For marvell
@@ -1393,66 +1393,66 @@ LICENSE:${PN}-mwl8k =3D "Firmware-Marvell"
 LICENSE:${PN}-mwlwifi =3D "Firmware-Marvell"
 LICENSE:${PN}-marvell-license =3D "Firmware-Marvell"
=20
-FILES:${PN}-marvell-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.Marvell"
+FILES:${PN}-marvell-license =3D "${firmwaredir}/LICENCE.Marvell"
 FILES:${PN}-pcie8897 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/pcie8897_uapsta.bin* \
+  ${firmwaredir}/mrvl/pcie8897_uapsta.bin* \
 "
 FILES:${PN}-pcie8997 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/pcie8997_wlan_v4.bin* \
-  ${nonarch_base_libdir}/firmware/mrvl/pcieuart8997_combo_v4.bin* \
-  ${nonarch_base_libdir}/firmware/mrvl/pcieusb8997_combo_v4.bin* \
+  ${firmwaredir}/mrvl/pcie8997_wlan_v4.bin* \
+  ${firmwaredir}/mrvl/pcieuart8997_combo_v4.bin* \
+  ${firmwaredir}/mrvl/pcieusb8997_combo_v4.bin* \
 "
 FILES:${PN}-sd8686 =3D " \
-  ${nonarch_base_libdir}/firmware/libertas/sd8686* \
+  ${firmwaredir}/libertas/sd8686* \
 "
 FILES:${PN}-sd8688 =3D " \
-  ${nonarch_base_libdir}/firmware/libertas/sd8688* \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8688* \
+  ${firmwaredir}/libertas/sd8688* \
+  ${firmwaredir}/mrvl/sd8688* \
 "
 FILES:${PN}-sd8787 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8787_uapsta.bin* \
+  ${firmwaredir}/mrvl/sd8787_uapsta.bin* \
 "
 FILES:${PN}-sd8797 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8797_uapsta.bin* \
+  ${firmwaredir}/mrvl/sd8797_uapsta.bin* \
 "
 FILES:${PN}-sd8801 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8801_uapsta.bin* \
+  ${firmwaredir}/mrvl/sd8801_uapsta.bin* \
 "
 FILES:${PN}-sd8887 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8887_uapsta.bin* \
+  ${firmwaredir}/mrvl/sd8887_uapsta.bin* \
 "
 FILES:${PN}-sd8897 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8897_uapsta.bin* \
+  ${firmwaredir}/mrvl/sd8897_uapsta.bin* \
 "
 do_install:append() {
     # The kernel 5.6.x driver still uses the old name, provide a symlink=
 for
     # older kernels
-    ln -fs sdsd8997_combo_v4.bin${@fw_compr_file_suffix(d)} ${D}${nonarc=
h_base_libdir}/firmware/mrvl/sd8997_uapsta.bin${@fw_compr_file_suffix(d)}
+    ln -fs sdsd8997_combo_v4.bin${@fw_compr_file_suffix(d)} ${D}${firmwa=
redir}/mrvl/sd8997_uapsta.bin${@fw_compr_file_suffix(d)}
 }
 FILES:${PN}-sd8997 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin* \
-  ${nonarch_base_libdir}/firmware/mrvl/sdsd8997_combo_v4.bin* \
+  ${firmwaredir}/mrvl/sd8997_uapsta.bin* \
+  ${firmwaredir}/mrvl/sdsd8997_combo_v4.bin* \
 "
 FILES:${PN}-usb8997 =3D " \
-  ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin* \
+  ${firmwaredir}/mrvl/usbusb8997_combo_v4.bin* \
 "
-FILES:${PN}-cf8381 =3D "${nonarch_base_libdir}/firmware/libertas/cf8381*=
"
-FILES:${PN}-cf8385 =3D "${nonarch_base_libdir}/firmware/libertas/cf8385*=
"
-FILES:${PN}-gspi8682 =3D "${nonarch_base_libdir}/firmware/libertas/gspi8=
682*"
-FILES:${PN}-gspi8686 =3D "${nonarch_base_libdir}/firmware/libertas/gspi8=
686*"
-FILES:${PN}-gspi8688 =3D "${nonarch_base_libdir}/firmware/libertas/gspi8=
688*"
-FILES:${PN}-sd8385 =3D "${nonarch_base_libdir}/firmware/libertas/sd8385*=
"
-FILES:${PN}-sd8682 =3D "${nonarch_base_libdir}/firmware/libertas/sd8682*=
"
-FILES:${PN}-usb8388 =3D "${nonarch_base_libdir}/firmware/libertas/usb838=
8*"
-FILES:${PN}-usb8682 =3D "${nonarch_base_libdir}/firmware/libertas/usb868=
2*"
-FILES:${PN}-sd8977 =3D "${nonarch_base_libdir}/firmware/mrvl/sdsd8977*"
-FILES:${PN}-usb8766 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8766*"
-FILES:${PN}-usb8797 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8797*"
-FILES:${PN}-usb8801 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8801*"
-FILES:${PN}-usb8897 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8897*"
-FILES:${PN}-rvu-cptpf =3D "${nonarch_base_libdir}/firmware/mrvl/cpt0*"
-FILES:${PN}-mwl8k =3D "${nonarch_base_libdir}/firmware/mwl8k/*"
-FILES:${PN}-mwlwifi =3D "${nonarch_base_libdir}/firmware/mwlwifi/*"
+FILES:${PN}-cf8381 =3D "${firmwaredir}/libertas/cf8381*"
+FILES:${PN}-cf8385 =3D "${firmwaredir}/libertas/cf8385*"
+FILES:${PN}-gspi8682 =3D "${firmwaredir}/libertas/gspi8682*"
+FILES:${PN}-gspi8686 =3D "${firmwaredir}/libertas/gspi8686*"
+FILES:${PN}-gspi8688 =3D "${firmwaredir}/libertas/gspi8688*"
+FILES:${PN}-sd8385 =3D "${firmwaredir}/libertas/sd8385*"
+FILES:${PN}-sd8682 =3D "${firmwaredir}/libertas/sd8682*"
+FILES:${PN}-usb8388 =3D "${firmwaredir}/libertas/usb8388*"
+FILES:${PN}-usb8682 =3D "${firmwaredir}/libertas/usb8682*"
+FILES:${PN}-sd8977 =3D "${firmwaredir}/mrvl/sdsd8977*"
+FILES:${PN}-usb8766 =3D "${firmwaredir}/mrvl/usb8766*"
+FILES:${PN}-usb8797 =3D "${firmwaredir}/mrvl/usb8797*"
+FILES:${PN}-usb8801 =3D "${firmwaredir}/mrvl/usb8801*"
+FILES:${PN}-usb8897 =3D "${firmwaredir}/mrvl/usb8897*"
+FILES:${PN}-rvu-cptpf =3D "${firmwaredir}/mrvl/cpt0*"
+FILES:${PN}-mwl8k =3D "${firmwaredir}/mwl8k/*"
+FILES:${PN}-mwlwifi =3D "${firmwaredir}/mwlwifi/*"
=20
 RDEPENDS:${PN}-sd8686 +=3D "${PN}-marvell-license"
 RDEPENDS:${PN}-sd8688 +=3D "${PN}-marvell-license"
@@ -1485,20 +1485,20 @@ RDEPENDS:${PN}-mwlwifi +=3D "${PN}-marvell-licens=
e"
 LICENSE:${PN}-netronome =3D "Firmware-netronome"
=20
 FILES:${PN}-netronome-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.Netronome \
+  ${firmwaredir}/LICENCE.Netronome \
 "
 FILES:${PN}-netronome =3D " \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0081*.nffw* \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0096*.nffw* \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0097*.nffw* \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0099*.nffw* \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0011_2x40.nffw*=
 \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0012_2x40.nffw*=
 \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0078-0011_1x100.nffw=
* \
-  ${nonarch_base_libdir}/firmware/netronome/bpf \
-  ${nonarch_base_libdir}/firmware/netronome/flower \
-  ${nonarch_base_libdir}/firmware/netronome/nic \
-  ${nonarch_base_libdir}/firmware/netronome/nic-sriov \
+  ${firmwaredir}/netronome/nic_AMDA0081*.nffw* \
+  ${firmwaredir}/netronome/nic_AMDA0096*.nffw* \
+  ${firmwaredir}/netronome/nic_AMDA0097*.nffw* \
+  ${firmwaredir}/netronome/nic_AMDA0099*.nffw* \
+  ${firmwaredir}/netronome/nic_AMDA0058-0011_2x40.nffw* \
+  ${firmwaredir}/netronome/nic_AMDA0058-0012_2x40.nffw* \
+  ${firmwaredir}/netronome/nic_AMDA0078-0011_1x100.nffw* \
+  ${firmwaredir}/netronome/bpf \
+  ${firmwaredir}/netronome/flower \
+  ${firmwaredir}/netronome/nic \
+  ${firmwaredir}/netronome/nic-sriov \
 "
=20
 RDEPENDS:${PN}-netronome +=3D "${PN}-netronome-license"
@@ -1516,20 +1516,20 @@ LICENSE:${PN}-nxpiw612-sdio =3D "Firmware-nxp"
 LICENSE:${PN}-nxp-sr1xx =3D "Firmware-nxp"
 LICENSE:${PN}-nxp-license =3D "Firmware-nxp"
=20
-FILES:${PN}-nxp8987-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*8987*=
"
+FILES:${PN}-nxp8987-sdio =3D "${firmwaredir}/nxp/*8987*"
 FILES:${PN}-nxp8997-common =3D " \
-    ${nonarch_base_libdir}/firmware/nxp/uartuart8997_bt_v4.bin* \
-    ${nonarch_base_libdir}/firmware/nxp/helper_uart_3000000.bin* \
+    ${firmwaredir}/nxp/uartuart8997_bt_v4.bin* \
+    ${firmwaredir}/nxp/helper_uart_3000000.bin* \
 "
 ALLOW_EMPTY:${PN}-nxp8997-pcie =3D "1"
 ALLOW_EMPTY:${PN}-nxp8997-sdio =3D "1"
-FILES:${PN}-nxp9098-common =3D "${nonarch_base_libdir}/firmware/nxp/uart=
uart9098_bt_v1.bin*"
+FILES:${PN}-nxp9098-common =3D "${firmwaredir}/nxp/uartuart9098_bt_v1.bi=
n*"
 ALLOW_EMPTY:${PN}-nxp9098-pcie =3D "1"
 ALLOW_EMPTY:${PN}-nxp9098-sdio =3D "1"
-FILES:${PN}-nxpiw416-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*iw41=
6*"
-FILES:${PN}-nxpiw612-sdio =3D "${nonarch_base_libdir}/firmware/nxp/uarts=
pi_n61x_v1.bin.se*"
-FILES:${PN}-nxp-sr1xx =3D "${nonarch_base_libdir}/firmware/nxp/sr150_fw.=
bin*"
-FILES:${PN}-nxp-license =3D "${nonarch_base_libdir}/firmware/LICENSE.nxp=
"
+FILES:${PN}-nxpiw416-sdio =3D "${firmwaredir}/nxp/*iw416*"
+FILES:${PN}-nxpiw612-sdio =3D "${firmwaredir}/nxp/uartspi_n61x_v1.bin.se=
*"
+FILES:${PN}-nxp-sr1xx =3D "${firmwaredir}/nxp/sr150_fw.bin*"
+FILES:${PN}-nxp-license =3D "${firmwaredir}/LICENSE.nxp"
=20
 RDEPENDS:${PN}-nxp8987-sdio +=3D "${PN}-nxp-license"
 RDEPENDS:${PN}-nxp8997-common +=3D "${PN}-nxp-license"
@@ -1546,9 +1546,9 @@ RDEPENDS:${PN}-nxp-sr1xx +=3D "${PN}-nxp-license"
 LICENSE:${PN}-nxp-mc =3D "Firmware-nxp_mc_firmware"
 LICENSE:${PN}-nxp-mc-license =3D "Firmware-nxp_mc_firmware"
=20
-FILES:${PN}-nxp-mc =3D "${nonarch_base_libdir}/firmware/dpaa2/mc/*"
+FILES:${PN}-nxp-mc =3D "${firmwaredir}/dpaa2/mc/*"
 FILES:${PN}-nxp-mc-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENSE.nxp_mc_firmware \
+  ${firmwaredir}/LICENSE.nxp_mc_firmware \
 "
 RDEPENDS:${PN}-nxp-mc +=3D "${PN}-nxp-mc-license"
=20
@@ -1558,17 +1558,17 @@ LICENSE:${PN}-nvidia-tegra =3D "Firmware-nvidia"
 LICENSE:${PN}-nvidia-tegra-k1 =3D "Firmware-nvidia"
 LICENSE:${PN}-nvidia-license =3D "Firmware-nvidia"
=20
-FILES:${PN}-nvidia-gpu =3D "${nonarch_base_libdir}/firmware/nvidia"
+FILES:${PN}-nvidia-gpu =3D "${firmwaredir}/nvidia"
 FILES:${PN}-nvidia-tegra =3D " \
-  ${nonarch_base_libdir}/firmware/nvidia/tegra* \
-  ${nonarch_base_libdir}/firmware/nvidia/gm20b \
-  ${nonarch_base_libdir}/firmware/nvidia/gp10b \
+  ${firmwaredir}/nvidia/tegra* \
+  ${firmwaredir}/nvidia/gm20b \
+  ${firmwaredir}/nvidia/gp10b \
 "
 FILES:${PN}-nvidia-tegra-k1 =3D " \
-  ${nonarch_base_libdir}/firmware/nvidia/tegra124 \
-  ${nonarch_base_libdir}/firmware/nvidia/gk20a \
+  ${firmwaredir}/nvidia/tegra124 \
+  ${firmwaredir}/nvidia/gk20a \
 "
-FILES:${PN}-nvidia-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
nvidia"
+FILES:${PN}-nvidia-license =3D "${firmwaredir}/LICENCE.nvidia"
=20
 RDEPENDS:${PN}-nvidia-gpu +=3D "${PN}-nvidia-license"
 RDEPENDS:${PN}-nvidia-tegra +=3D "${PN}-nvidia-license"
@@ -1579,11 +1579,11 @@ LICENSE:${PN}-olpc =3D "Firmware-OLPC"
 LICENSE:${PN}-olpc-license =3D "Firmware-OLPC"
=20
 FILES:${PN}-olpc =3D " \
-  ${nonarch_base_libdir}/firmware/libertas/lbtf_sdio.bin*	\
-  ${nonarch_base_libdir}/firmware/lbtf_usb.bin*			\
-  ${nonarch_base_libdir}/firmware/libertas/usb8388_olpc.bin*	\
+  ${firmwaredir}/libertas/lbtf_sdio.bin*	\
+  ${firmwaredir}/lbtf_usb.bin*			\
+  ${firmwaredir}/libertas/usb8388_olpc.bin*	\
 "
-FILES:${PN}-olpc-license =3D "${nonarch_base_libdir}/firmware/LICENCE.OL=
PC"
+FILES:${PN}-olpc-license =3D "${firmwaredir}/LICENCE.OLPC"
=20
 RDEPENDS:${PN}-olpc +=3D "${PN}-olpc-license"
=20
@@ -1591,8 +1591,8 @@ RDEPENDS:${PN}-olpc +=3D "${PN}-olpc-license"
 LICENSE:${PN}-phanfw =3D "Firmware-phanfw"
 LICENSE:${PN}-phanfw-license =3D "Firmware-phanfw"
=20
-FILES:${PN}-phanfw =3D "${nonarch_base_libdir}/firmware/phanfw.bin*"
-FILES:${PN}-phanfw-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
phanfw"
+FILES:${PN}-phanfw =3D "${firmwaredir}/phanfw.bin*"
+FILES:${PN}-phanfw-license =3D "${firmwaredir}/LICENCE.phanfw"
=20
 RDEPENDS:${PN}-phanfw +=3D "${PN}-phanfw-license"
=20
@@ -1600,8 +1600,8 @@ RDEPENDS:${PN}-phanfw +=3D "${PN}-phanfw-license"
 LICENSE:${PN}-powervr =3D "Firmware-powervr"
 LICENSE:${PN}-powervr-license =3D "Firmware-powervr"
=20
-FILES:${PN}-powervr =3D "${nonarch_base_libdir}/firmware/powervr"
-FILES:${PN}-powervr-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.powervr"
+FILES:${PN}-powervr =3D "${firmwaredir}/powervr"
+FILES:${PN}-powervr-license =3D "${firmwaredir}/LICENSE.powervr"
=20
 RDEPENDS:${PN}-powervr +=3D "${PN}-powervr-license"
=20
@@ -1609,8 +1609,8 @@ RDEPENDS:${PN}-powervr +=3D "${PN}-powervr-license"
 LICENSE:${PN}-qla2xxx =3D "Firmware-qla2xxx"
 LICENSE:${PN}-qla2xxx-license =3D "Firmware-qla2xxx"
=20
-FILES:${PN}-qla2xxx =3D "${nonarch_base_libdir}/firmware/ql2*"
-FILES:${PN}-qla2xxx-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.qla2xxx"
+FILES:${PN}-qla2xxx =3D "${firmwaredir}/ql2*"
+FILES:${PN}-qla2xxx-license =3D "${firmwaredir}/LICENCE.qla2xxx"
=20
 RDEPENDS:${PN}-qla2xxx +=3D "${PN}-qla2xxx-license"
=20
@@ -1619,9 +1619,9 @@ LICENSE:${PN}-rs9113 =3D "WHENCE"
 LICENSE:${PN}-rs9116 =3D "WHENCE"
 LICENSE:${PN}-rsi-91x =3D "WHENCE"
=20
-FILES:${PN}-rs9113 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps=
* "
-FILES:${PN}-rs9116 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps=
* "
-FILES:${PN}-rsi-91x =3D " ${nonarch_base_libdir}/firmware/rsi_91x.fw* "
+FILES:${PN}-rs9113 =3D " ${firmwaredir}/rsi/rs9113*.rps* "
+FILES:${PN}-rs9116 =3D " ${firmwaredir}/rsi/rs9116*.rps* "
+FILES:${PN}-rsi-91x =3D " ${firmwaredir}/rsi_91x.fw* "
=20
 RDEPENDS:${PN}-rs9113 +=3D "${PN}-whence-license"
 RDEPENDS:${PN}-rs9116 +=3D "${PN}-whence-license"
@@ -1649,69 +1649,69 @@ LICENSE:${PN}-rtl-nic =3D "WHENCE"
 LICENSE:${PN}-rtl8168 =3D "WHENCE"
=20
 FILES:${PN}-rtl-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
+  ${firmwaredir}/LICENCE.rtlwifi_firmware.txt \
 "
 FILES:${PN}-rtl8188 =3D " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8188*.bin* \
+  ${firmwaredir}/rtlwifi/rtl8188*.bin* \
 "
 FILES:${PN}-rtl8192cu =3D " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cufw*.bin* \
+  ${firmwaredir}/rtlwifi/rtl8192cufw*.bin* \
 "
 FILES:${PN}-rtl8192ce =3D " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cfw*.bin* \
+  ${firmwaredir}/rtlwifi/rtl8192cfw*.bin* \
 "
 FILES:${PN}-rtl8192su =3D " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8712u.bin* \
+  ${firmwaredir}/rtlwifi/rtl8712u.bin* \
 "
 FILES:${PN}-rtl8723 =3D " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
-  ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
-  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
+  ${firmwaredir}/rtlwifi/rtl8723*.bin* \
+  ${firmwaredir}/rtw88/rtw8723*.bin* \
+  ${firmwaredir}/rtl_bt/rtl8723*.bin* \
 "
 FILES:${PN}-rtl8821 =3D " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
-  ${nonarch_base_libdir}/firmware/rtw88/README* \
-  ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
-  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin* \
+  ${firmwaredir}/rtlwifi/rtl8821*.bin* \
+  ${firmwaredir}/rtw88/README* \
+  ${firmwaredir}/rtw88/rtw8821*.bin* \
+  ${firmwaredir}/rtl_bt/rtl8821*.bin* \
 "
 FILES:${PN}-rtl8761 =3D " \
-  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
+  ${firmwaredir}/rtl_bt/rtl8761*.bin* \
 "
 FILES:${PN}-rtl8168 =3D " \
-  ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw* \
+  ${firmwaredir}/rtl_nic/rtl8168*.fw* \
 "
 FILES:${PN}-rtl8822 =3D " \
-  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8822*.bin* \
-  ${nonarch_base_libdir}/firmware/rtw88/rtw8822*.bin* \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8822*.bin* \
+  ${firmwaredir}/rtl_bt/rtl8822*.bin* \
+  ${firmwaredir}/rtw88/rtw8822*.bin* \
+  ${firmwaredir}/rtlwifi/rtl8822*.bin* \
 "
 FILES:${PN}-rtl-nic =3D " \
-  ${nonarch_base_libdir}/firmware/rtl_nic/*.fw* \
+  ${firmwaredir}/rtl_nic/*.fw* \
 "
 FILES:${PN}-rtl8192 =3D " \
-    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192* \
-    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8192* \
+    ${firmwaredir}/rtlwifi/rtl8192* \
+    ${firmwaredir}/rtl_bt/rtl8192* \
 "
-FILES:${PN}-rtl8710 =3D "${nonarch_base_libdir}/firmware/rtlwifi/rtl8710=
*"
+FILES:${PN}-rtl8710 =3D "${firmwaredir}/rtlwifi/rtl8710*"
 FILES:${PN}-rtl8812 =3D " \
-    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8812* \
-    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8812* \
-    ${nonarch_base_libdir}/firmware/rtw88/rtw8812* \
+    ${firmwaredir}/rtlwifi/rtl8812* \
+    ${firmwaredir}/rtl_bt/rtl8812* \
+    ${firmwaredir}/rtw88/rtw8812* \
 "
 FILES:${PN}-rtl8851 =3D " \
-    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8851* \
-    ${nonarch_base_libdir}/firmware/rtw89/rtw8851* \
+    ${firmwaredir}/rtl_bt/rtl8851* \
+    ${firmwaredir}/rtw89/rtw8851* \
 "
 FILES:${PN}-rtl8852 =3D " \
-    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8852* \
-    ${nonarch_base_libdir}/firmware/rtw89/rtw8852* \
+    ${firmwaredir}/rtl_bt/rtl8852* \
+    ${firmwaredir}/rtw89/rtw8852* \
 "
 FILES:${PN}-rtl8922 =3D " \
-    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8922* \
-    ${nonarch_base_libdir}/firmware/rtw89/rtw8922* \
+    ${firmwaredir}/rtl_bt/rtl8922* \
+    ${firmwaredir}/rtw89/rtw8922* \
 "
-FILES:${PN}-rtl8703 =3D "${nonarch_base_libdir}/firmware/rtw88/rtw8703*"
-FILES:${PN}-rtl8814 =3D "${nonarch_base_libdir}/firmware/rtw88/rtw8814*"
+FILES:${PN}-rtl8703 =3D "${firmwaredir}/rtw88/rtw8703*"
+FILES:${PN}-rtl8814 =3D "${firmwaredir}/rtw88/rtw8814*"
=20
 RDEPENDS:${PN}-rtl8188 +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192ce +=3D "${PN}-rtl-license"
@@ -1737,10 +1737,10 @@ LICENSE:${PN}-wfx =3D "Firmware-wfx"
 LICENSE:${PN}-wfx-license =3D "Firmware-wfx"
=20
 FILES:${PN}-wfx =3D " \
-  ${nonarch_base_libdir}/firmware/wfx/*.pds*        \
-  ${nonarch_base_libdir}/firmware/wfx/*.sec*        \
+  ${firmwaredir}/wfx/*.pds*        \
+  ${firmwaredir}/wfx/*.sec*        \
 "
-FILES:${PN}-wfx-license =3D "${nonarch_base_libdir}/firmware/wfx/LICENCE=
.wf200"
+FILES:${PN}-wfx-license =3D "${firmwaredir}/wfx/LICENCE.wf200"
=20
 RDEPENDS:${PN}-wfx +=3D "${PN}-wfx-license"
=20
@@ -1749,10 +1749,10 @@ LICENSE:${PN}-wl1251 =3D "Firmware-wl1251"
 LICENSE:${PN}-wl1251-license =3D "Firmware-wl1251"
=20
 FILES:${PN}-wl1251 =3D " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-fw.bin*        =
 \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-nvs.bin*       =
 \
+  ${firmwaredir}/ti-connectivity/wl1251-fw.bin*         \
+  ${firmwaredir}/ti-connectivity/wl1251-nvs.bin*        \
 "
-FILES:${PN}-wl1251-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
wl1251"
+FILES:${PN}-wl1251-license =3D "${firmwaredir}/LICENCE.wl1251"
=20
 RDEPENDS:${PN}-wl1251 +=3D "${PN}-wl1251-license"
=20
@@ -1763,7 +1763,7 @@ LICENSE:${PN}-wl18xx =3D "Firmware-ti-connectivity"
 LICENSE:${PN}-cc33xx =3D "Firmware-ti-connectivity"
 LICENSE:${PN}-ti-connectivity-license =3D "Firmware-ti-connectivity"
=20
-FILES:${PN}-ti-connectivity-license =3D "${nonarch_base_libdir}/firmware=
/LICENCE.ti-connectivity"
+FILES:${PN}-ti-connectivity-license =3D "${firmwaredir}/LICENCE.ti-conne=
ctivity"
 # wl18xx optionally needs wl1271-nvs.bin (which itself is a symlink to
 # wl127x-nvs.bin) - see linux/drivers/net/wireless/ti/wlcore/sdio.c
 # and drivers/net/wireless/ti/wlcore/spi.c.
@@ -1772,19 +1772,19 @@ FILES:${PN}-ti-connectivity-license =3D "${nonarc=
h_base_libdir}/firmware/LICENCE.t
 # if not there. So let's make it available always. Because it's a
 # symlink, both need to go to wlcommon.
 FILES:${PN}-wlcommon =3D " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/TI* \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl127x-nvs.bin* \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1271-nvs.bin* \
+  ${firmwaredir}/ti-connectivity/TI* \
+  ${firmwaredir}/ti-connectivity/wl127x-nvs.bin* \
+  ${firmwaredir}/ti-connectivity/wl1271-nvs.bin* \
 "
 FILES:${PN}-wl12xx =3D " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12* \
+  ${firmwaredir}/ti-connectivity/wl12* \
 "
 FILES:${PN}-wl18xx =3D " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl18* \
+  ${firmwaredir}/ti-connectivity/wl18* \
 "
=20
 FILES:${PN}-cc33xx =3D " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/cc33* \
+  ${firmwaredir}/ti-connectivity/cc33* \
 "
=20
 RDEPENDS:${PN}-wl12xx =3D "${PN}-ti-connectivity-license ${PN}-wlcommon"
@@ -1795,62 +1795,62 @@ RDEPENDS:${PN}-cc33xx =3D "${PN}-ti-connectivity-=
license"
 LICENSE:${PN}-ti-keystone =3D "Firmware-ti-keystone"
 LICENSE:${PN}-ti-keystone-license =3D "Firmware-ti-keystone"
=20
-FILES:${PN}-ti-keystone =3D "${nonarch_base_libdir}/firmware/ti-keystone=
/*"
+FILES:${PN}-ti-keystone =3D "${firmwaredir}/ti-keystone/*"
 FILES:${PN}-ti-keystone-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.ti-keystone \
+  ${firmwaredir}/LICENCE.ti-keystone \
 "
 RDEPENDS:${PN}-ti-keystone +=3D "${PN}-ti-keystone-license"
=20
 # For ti-tspa-license
 LICENSE:${PN}-ti-tspa-license =3D "Firmware-ti-tspa"
-FILES:${PN}-ti-tspa-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.ti-tspa"
+FILES:${PN}-ti-tspa-license =3D "${firmwaredir}/LICENCE.ti-tspa"
=20
 # For ti-tas2563 - tas2563 firmware
 LICENSE:${PN}-ti-tas2563 =3D "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2563 =3D "\
-    ${nonarch_base_libdir}/firmware/INT8866RCA2.bin* \
-    ${nonarch_base_libdir}/firmware/TAS2XXX3870.bin* \
-    ${nonarch_base_libdir}/firmware/ti/audio/tas2563/* \
+    ${firmwaredir}/INT8866RCA2.bin* \
+    ${firmwaredir}/TAS2XXX3870.bin* \
+    ${firmwaredir}/ti/audio/tas2563/* \
 "
 RDEPENDS:${PN}-ti-tas2563 =3D "${PN}-ti-tspa-license"
=20
 # For ti-tas2781 - tas2781 firmware
 LICENSE:${PN}-ti-tas2781 =3D "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2781 =3D "\
-    ${nonarch_base_libdir}/firmware/TAS2XXX*.bin* \
-    ${nonarch_base_libdir}/firmware/TIAS2781*.bin* \
-    ${nonarch_base_libdir}/firmware/TXNW2781*.bin* \
-    ${nonarch_base_libdir}/firmware/ti/audio/tas2781/* \
+    ${firmwaredir}/TAS2XXX*.bin* \
+    ${firmwaredir}/TIAS2781*.bin* \
+    ${firmwaredir}/TXNW2781*.bin* \
+    ${firmwaredir}/ti/audio/tas2781/* \
 "
 RDEPENDS:${PN}-ti-tas2781 =3D "${PN}-ti-tspa-license"
=20
 # For ti-tas2783 - tas2783 firmware
 LICENSE:${PN}-ti-tas2783 =3D "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2783 =3D "\
-    ${nonarch_base_libdir}/firmware/8E[8F]*-?-?.bin* \
-    ${nonarch_base_libdir}/firmware/ti/audio/tas2783/* \
+    ${firmwaredir}/8E[8F]*-?-?.bin* \
+    ${firmwaredir}/ti/audio/tas2783/* \
 "
 RDEPENDS:${PN}-ti-tas2781 =3D "${PN}-ti-tspa-license"
=20
 # For ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
 LICENSE:${PN}-ti-vpe =3D "Firmware-ti-tspa"
-FILES:${PN}-ti-vpe =3D "${nonarch_base_libdir}/firmware/ti/vpdma-1b8.bin=
*"
+FILES:${PN}-ti-vpe =3D "${firmwaredir}/ti/vpdma-1b8.bin*"
 RDEPENDS:${PN}-ti-vpe =3D "${PN}-ti-tspa-license"
=20
 # For ti_usb_3410_5052 - USB TI 3410/5052 serial device
 LICENSE:${PN}-ti-usb-3410-5052 =3D "GPL-2.0-or-later"
 FILES:${PN}-ti-usb-3410-5052 =3D "\
-    ${nonarch_base_libdir}/firmware/ti_3410.fw* \
-    ${nonarch_base_libdir}/firmware/ti_5052.fw* \
+    ${firmwaredir}/ti_3410.fw* \
+    ${firmwaredir}/ti_5052.fw* \
 "
=20
 # For vt6656
 LICENSE:${PN}-vt6656 =3D "Firmware-via_vt6656"
 LICENSE:${PN}-vt6656-license =3D "Firmware-via_vt6656"
=20
-FILES:${PN}-vt6656-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
via_vt6656"
+FILES:${PN}-vt6656-license =3D "${firmwaredir}/LICENCE.via_vt6656"
 FILES:${PN}-vt6656 =3D " \
-  ${nonarch_base_libdir}/firmware/vntwusb.fw* \
+  ${firmwaredir}/vntwusb.fw* \
 "
=20
 RDEPENDS:${PN}-vt6656 =3D "${PN}-vt6656-license"
@@ -1859,8 +1859,8 @@ RDEPENDS:${PN}-vt6656 =3D "${PN}-vt6656-license"
 LICENSE:${PN}-xc4000 =3D "Firmware-xc4000"
 LICENSE:${PN}-xc4000-license =3D "Firmware-xc4000"
=20
-FILES:${PN}-xc4000 =3D "${nonarch_base_libdir}/firmware/dvb-fe-xc4000-1.=
4.1.fw*"
-FILES:${PN}-xc4000-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
xc4000"
+FILES:${PN}-xc4000 =3D "${firmwaredir}/dvb-fe-xc4000-1.4.1.fw*"
+FILES:${PN}-xc4000-license =3D "${firmwaredir}/LICENCE.xc4000"
=20
 RDEPENDS:${PN}-xc4000 +=3D "${PN}-xc4000-license"
=20
@@ -1868,8 +1868,8 @@ RDEPENDS:${PN}-xc4000 +=3D "${PN}-xc4000-license"
 LICENSE:${PN}-xc5000 =3D "Firmware-xc5000"
 LICENSE:${PN}-xc5000-license =3D "Firmware-xc5000"
=20
-FILES:${PN}-xc5000 =3D "${nonarch_base_libdir}/firmware/dvb-fe-xc5000-1.=
6.114.fw*"
-FILES:${PN}-xc5000-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
xc5000"
+FILES:${PN}-xc5000 =3D "${firmwaredir}/dvb-fe-xc5000-1.6.114.fw*"
+FILES:${PN}-xc5000-license =3D "${firmwaredir}/LICENCE.xc5000"
=20
 RDEPENDS:${PN}-xc5000 +=3D "${PN}-xc5000-license"
=20
@@ -1878,9 +1878,9 @@ LICENSE:${PN}-xc5000c =3D "Firmware-xc5000c"
 LICENSE:${PN}-xc5000c-license =3D "Firmware-xc5000c"
=20
 FILES:${PN}-xc5000c =3D " \
-  ${nonarch_base_libdir}/firmware/dvb-fe-xc5000c-4.1.30.7.fw* \
+  ${firmwaredir}/dvb-fe-xc5000c-4.1.30.7.fw* \
 "
-FILES:${PN}-xc5000c-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.xc5000c"
+FILES:${PN}-xc5000c-license =3D "${firmwaredir}/LICENCE.xc5000c"
=20
 RDEPENDS:${PN}-xc5000c +=3D "${PN}-xc5000c-license"
=20
@@ -1889,54 +1889,54 @@ RDEPENDS:${PN}-xc5000c +=3D "${PN}-xc5000c-licens=
e"
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do=
 pkg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_h=
dr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "             \${PN}-$pkg \\"=
; done  | sort -u
=20
 LICENSE:${PN}-broadcom-license =3D "Firmware-broadcom_bcm43xx"
-FILES:${PN}-broadcom-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.broadcom_bcm43xx"
+FILES:${PN}-broadcom-license =3D "${firmwaredir}/LICENCE.broadcom_bcm43x=
x"
=20
-# for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do=
 pkg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_h=
dr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo "$i - $pkg"; echo -e "FILES:\${P=
N}-$pkg =3D \"\${nonarch_base_libdir}/firmware/brcm/$i\""; done | grep ^F=
ILES
+# for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do=
 pkg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_h=
dr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo "$i - $pkg"; echo -e "FILES:\${P=
N}-$pkg =3D \"\${firmwaredir}/brcm/$i\""; done | grep ^FILES
=20
-FILES:${PN}-bcm43xx =3D "${nonarch_base_libdir}/firmware/brcm/bcm43xx-0.=
fw*"
-FILES:${PN}-bcm43xx-hdr =3D "${nonarch_base_libdir}/firmware/brcm/bcm43x=
x_hdr-0.fw*"
-FILES:${PN}-bcm4329-fullmac =3D "${nonarch_base_libdir}/firmware/brcm/bc=
m4329-fullmac-4.bin*"
-FILES:${PN}-bcm43236b =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac=
43236b.bin*"
-FILES:${PN}-bcm4329 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
29-sdio.bin*"
-FILES:${PN}-bcm4330 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
30-sdio.*"
-FILES:${PN}-bcm4334 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
34-sdio.bin*"
-FILES:${PN}-bcm4335 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
35-sdio.bin*"
-FILES:${PN}-bcm4339 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
39-sdio.bin* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4339-sdio.bin* \
+FILES:${PN}-bcm43xx =3D "${firmwaredir}/brcm/bcm43xx-0.fw*"
+FILES:${PN}-bcm43xx-hdr =3D "${firmwaredir}/brcm/bcm43xx_hdr-0.fw*"
+FILES:${PN}-bcm4329-fullmac =3D "${firmwaredir}/brcm/bcm4329-fullmac-4.b=
in*"
+FILES:${PN}-bcm43236b =3D "${firmwaredir}/brcm/brcmfmac43236b.bin*"
+FILES:${PN}-bcm4329 =3D "${firmwaredir}/brcm/brcmfmac4329-sdio.bin*"
+FILES:${PN}-bcm4330 =3D "${firmwaredir}/brcm/brcmfmac4330-sdio.*"
+FILES:${PN}-bcm4334 =3D "${firmwaredir}/brcm/brcmfmac4334-sdio.bin*"
+FILES:${PN}-bcm4335 =3D "${firmwaredir}/brcm/brcmfmac4335-sdio.bin*"
+FILES:${PN}-bcm4339 =3D "${firmwaredir}/brcm/brcmfmac4339-sdio.bin* \
+  ${firmwaredir}/cypress/cyfmac4339-sdio.bin* \
 "
-FILES:${PN}-bcm43241b0 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43241b0-sdio.bin*"
-FILES:${PN}-bcm43241b4 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43241b4-sdio.*"
-FILES:${PN}-bcm43241b5 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43241b5-sdio.bin*"
-FILES:${PN}-bcm43242a =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac=
43242a.bin*"
-FILES:${PN}-bcm43012 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3012-sdio.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43012-sdio.* \
+FILES:${PN}-bcm43241b0 =3D "${firmwaredir}/brcm/brcmfmac43241b0-sdio.bin=
*"
+FILES:${PN}-bcm43241b4 =3D "${firmwaredir}/brcm/brcmfmac43241b4-sdio.*"
+FILES:${PN}-bcm43241b5 =3D "${firmwaredir}/brcm/brcmfmac43241b5-sdio.bin=
*"
+FILES:${PN}-bcm43242a =3D "${firmwaredir}/brcm/brcmfmac43242a.bin*"
+FILES:${PN}-bcm43012 =3D "${firmwaredir}/brcm/brcmfmac43012-sdio.* \
+  ${firmwaredir}/cypress/cyfmac43012-sdio.* \
 "
-FILES:${PN}-bcm43143 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3143.bin* \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin* \
+FILES:${PN}-bcm43143 =3D "${firmwaredir}/brcm/brcmfmac43143.bin* \
+  ${firmwaredir}/brcm/brcmfmac43143-sdio.bin* \
 "
-FILES:${PN}-bcm43430a0 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43430a0-sdio.*"
-FILES:${PN}-bcm43455 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3455-sdio.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43455-sdio.* \
+FILES:${PN}-bcm43430a0 =3D "${firmwaredir}/brcm/brcmfmac43430a0-sdio.*"
+FILES:${PN}-bcm43455 =3D "${firmwaredir}/brcm/brcmfmac43455-sdio.* \
+  ${firmwaredir}/cypress/cyfmac43455-sdio.* \
 "
-FILES:${PN}-bcm4350c2 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac=
4350c2-pcie.bin*"
-FILES:${PN}-bcm4350 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
50-pcie.bin*"
-FILES:${PN}-bcm4356 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
56-sdio.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.* \
+FILES:${PN}-bcm4350c2 =3D "${firmwaredir}/brcm/brcmfmac4350c2-pcie.bin*"
+FILES:${PN}-bcm4350 =3D "${firmwaredir}/brcm/brcmfmac4350-pcie.bin*"
+FILES:${PN}-bcm4356 =3D "${firmwaredir}/brcm/brcmfmac4356-sdio.* \
+  ${firmwaredir}/cypress/cyfmac4356-sdio.* \
 "
-FILES:${PN}-bcm43569 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3569.bin*"
-FILES:${PN}-bcm43570 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3570-pcie.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.* \
+FILES:${PN}-bcm43569 =3D "${firmwaredir}/brcm/brcmfmac43569.bin*"
+FILES:${PN}-bcm43570 =3D "${firmwaredir}/brcm/brcmfmac43570-pcie.* \
+  ${firmwaredir}/cypress/cyfmac43570-pcie.* \
 "
-FILES:${PN}-bcm4358 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
58-pcie.bin*"
-FILES:${PN}-bcm43602 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3602-pcie.bin* \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin* \
+FILES:${PN}-bcm4358 =3D "${firmwaredir}/brcm/brcmfmac4358-pcie.bin*"
+FILES:${PN}-bcm43602 =3D "${firmwaredir}/brcm/brcmfmac43602-pcie.bin* \
+  ${firmwaredir}/brcm/brcmfmac43602-pcie.ap.bin* \
 "
-FILES:${PN}-bcm4366b =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
366b-pcie.bin*"
-FILES:${PN}-bcm4366c =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
366c-pcie.bin*"
-FILES:${PN}-bcm4371 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
71-pcie.bin*"
+FILES:${PN}-bcm4366b =3D "${firmwaredir}/brcm/brcmfmac4366b-pcie.bin*"
+FILES:${PN}-bcm4366c =3D "${firmwaredir}/brcm/brcmfmac4366c-pcie.bin*"
+FILES:${PN}-bcm4371 =3D "${firmwaredir}/brcm/brcmfmac4371-pcie.bin*"
=20
-FILES:${PN}-bcm54591 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac5=
4591-pcie.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac54591-pcie.* \
+FILES:${PN}-bcm54591 =3D "${firmwaredir}/brcm/brcmfmac54591-pcie.* \
+  ${firmwaredir}/cypress/cyfmac54591-pcie.* \
 "
=20
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do=
 pkg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_h=
dr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE:\${PN}-$pkg =3D \"Fi=
rmware-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg +=3D \"\${PN}-broadcom-li=
cense\""; done
@@ -2002,27 +2002,27 @@ RDEPENDS:${PN}-bcm54591 +=3D "${PN}-broadcom-lice=
nse"
 # For broadcom cypress
=20
 LICENSE:${PN}-cypress-license =3D "Firmware-cypress"
-FILES:${PN}-cypress-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.cypress"
+FILES:${PN}-cypress-license =3D "${firmwaredir}/LICENCE.cypress"
=20
-FILES:${PN}-bcm-0bb4-0306 =3D "${nonarch_base_libdir}/firmware/brcm/BCM-=
0bb4-0306.hcd*"
-FILES:${PN}-bcm-0a5c-6410 =3D "${nonarch_base_libdir}/firmware/brcm/BCM-=
0a5c-6410.hcd*"
-FILES:${PN}-bcm43340 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3340-sdio.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43340-sdio.*"
-FILES:${PN}-bcm43362 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3362-sdio.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43362-sdio.*"
-FILES:${PN}-bcm43430 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3430-sdio.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43430-sdio.*"
-FILES:${PN}-bcm4354 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
54-sdio.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.* \
+FILES:${PN}-bcm-0bb4-0306 =3D "${firmwaredir}/brcm/BCM-0bb4-0306.hcd*"
+FILES:${PN}-bcm-0a5c-6410 =3D "${firmwaredir}/brcm/BCM-0a5c-6410.hcd*"
+FILES:${PN}-bcm43340 =3D "${firmwaredir}/brcm/brcmfmac43340-sdio.* \
+  ${firmwaredir}/cypress/cyfmac43340-sdio.*"
+FILES:${PN}-bcm43362 =3D "${firmwaredir}/brcm/brcmfmac43362-sdio.* \
+  ${firmwaredir}/cypress/cyfmac43362-sdio.*"
+FILES:${PN}-bcm43430 =3D "${firmwaredir}/brcm/brcmfmac43430-sdio.* \
+  ${firmwaredir}/cypress/cyfmac43430-sdio.*"
+FILES:${PN}-bcm4354 =3D "${firmwaredir}/brcm/brcmfmac4354-sdio.* \
+  ${firmwaredir}/cypress/cyfmac4354-sdio.* \
 "
-FILES:${PN}-bcm4356-pcie =3D "${nonarch_base_libdir}/firmware/brcm/brcmf=
mac4356-pcie.* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
+FILES:${PN}-bcm4356-pcie =3D "${firmwaredir}/brcm/brcmfmac4356-pcie.* \
+  ${firmwaredir}/cypress/cyfmac4356-pcie.* \
 "
-FILES:${PN}-bcm4373 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
73-sdio.bin* \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin* \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.clm_blob* \
+FILES:${PN}-bcm4373 =3D "${firmwaredir}/brcm/brcmfmac4373-sdio.bin* \
+  ${firmwaredir}/brcm/brcmfmac4373.bin* \
+  ${firmwaredir}/cypress/cyfmac4373-sdio.bin* \
+  ${firmwaredir}/brcm/brcmfmac4373-sdio.clm_blob* \
+  ${firmwaredir}/cypress/cyfmac4373-sdio.clm_blob* \
 "
=20
 LICENSE:${PN}-bcm-0bb4-0306 =3D "Firmware-cypress"
@@ -2051,17 +2051,17 @@ LICENSE:${PN}-bnx2 =3D "WHENCE"
 LICENSE:${PN}-whence-license =3D "WHENCE"
=20
 FILES:${PN}-bnx2 =3D " \
-    ${nonarch_base_libdir}/firmware/bnx2/bnx2-mips*.fw* \
-    ${nonarch_base_libdir}/firmware/bnx2/bnx2-rv2p*.fw* \
+    ${firmwaredir}/bnx2/bnx2-mips*.fw* \
+    ${firmwaredir}/bnx2/bnx2-rv2p*.fw* \
 "
-FILES:${PN}-whence-license =3D "${nonarch_base_libdir}/firmware/WHENCE"
+FILES:${PN}-whence-license =3D "${firmwaredir}/WHENCE"
=20
 RDEPENDS:${PN}-bnx2 +=3D "${PN}-whence-license"
 RPROVIDES:${PN}-bnx2 =3D "${PN}-bnx2-mips"
=20
 LICENSE:${PN}-bnx2x =3D "WHENCE"
=20
-FILES:${PN}-bnx2x =3D "${nonarch_base_libdir}/firmware/bnx2x/bnx2x*.fw*"
+FILES:${PN}-bnx2x =3D "${firmwaredir}/bnx2x/bnx2x*.fw*"
=20
 RDEPENDS:${PN}-bnx2x +=3D "${PN}-whence-license"
=20
@@ -2071,14 +2071,14 @@ LICENSE:${PN}-cirrus-cs42l45 =3D "Firmware-cirrus=
"
 LICENSE:${PN}-cirrus-license =3D "Firmware-cirrus"
=20
 FILES:${PN}-cirrus =3D " \
-    ${nonarch_base_libdir}/firmware/cs42l43.bin* \
-    ${nonarch_base_libdir}/firmware/cirrus/* \
+    ${firmwaredir}/cs42l43.bin* \
+    ${firmwaredir}/cirrus/* \
 "
 FILES:${PN}-cirrus-cs42l45 =3D " \
-    ${nonarch_base_libdir}/firmware/sdca/1fa/1028/* \
-    ${nonarch_base_libdir}/firmware/sdca/1fa/17aa/* \
+    ${firmwaredir}/sdca/1fa/1028/* \
+    ${firmwaredir}/sdca/1fa/17aa/* \
 "
-FILES:${PN}-cirrus-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
cirrus"
+FILES:${PN}-cirrus-license =3D "${firmwaredir}/LICENSE.cirrus"
=20
 RDEPENDS:${PN}-cirrus +=3D "${PN}-cirrus-license"
 RDEPENDS:${PN}-cirrus-cs42l45 +=3D "${PN}-cirrus-license"
@@ -2087,8 +2087,8 @@ RDEPENDS:${PN}-cirrus-cs42l45 +=3D "${PN}-cirrus-li=
cense"
 LICENSE:${PN}-cnm =3D "Firmware-cnm"
 LICENSE:${PN}-cnm-license =3D "Firmware-cnm"
=20
-FILES:${PN}-cnm =3D "${nonarch_base_libdir}/firmware/cnm/*"
-FILES:${PN}-cnm-license =3D "${nonarch_base_libdir}/firmware/LICENCE.cnm=
"
+FILES:${PN}-cnm =3D "${firmwaredir}/cnm/*"
+FILES:${PN}-cnm-license =3D "${firmwaredir}/LICENCE.cnm"
=20
 RDEPENDS:${PN}-cnm +=3D "${PN}-cnm-license"
=20
@@ -2097,15 +2097,15 @@ LICENSE:${PN}-imx-sdma-imx6q       =3D "Firmware-=
imx-sdma_firmware"
 LICENSE:${PN}-imx-sdma-imx7d       =3D "Firmware-imx-sdma_firmware"
 LICENSE:${PN}-imx-sdma-license       =3D "Firmware-imx-sdma_firmware"
=20
-FILES:${PN}-imx-sdma-imx6q =3D "${nonarch_base_libdir}/firmware/imx/sdma=
/sdma-imx6q.bin*"
+FILES:${PN}-imx-sdma-imx6q =3D "${firmwaredir}/imx/sdma/sdma-imx6q.bin*"
=20
 RPROVIDES:${PN}-imx-sdma-imx6q =3D "firmware-imx-sdma-imx6q"
 RREPLACES:${PN}-imx-sdma-imx6q =3D "firmware-imx-sdma-imx6q"
 RCONFLICTS:${PN}-imx-sdma-imx6q =3D "firmware-imx-sdma-imx6q"
=20
-FILES:${PN}-imx-sdma-imx7d =3D "${nonarch_base_libdir}/firmware/imx/sdma=
/sdma-imx7d.bin*"
+FILES:${PN}-imx-sdma-imx7d =3D "${firmwaredir}/imx/sdma/sdma-imx7d.bin*"
=20
-FILES:${PN}-imx-sdma-license =3D "${nonarch_base_libdir}/firmware/LICENS=
E.sdma_firmware"
+FILES:${PN}-imx-sdma-license =3D "${firmwaredir}/LICENSE.sdma_firmware"
=20
 RDEPENDS:${PN}-imx-sdma-imx6q +=3D "${PN}-imx-sdma-license"
 RDEPENDS:${PN}-imx-sdma-imx7d +=3D "${PN}-imx-sdma-license"
@@ -2138,33 +2138,33 @@ LICENSE:${PN}-iwlwifi-9260      =3D "Firmware-iwl=
wifi_firmware"
 LICENSE:${PN}-iwlwifi-misc      =3D "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-license   =3D "Firmware-iwlwifi_firmware"
=20
-FILES:${PN}-iwlwifi-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.iwlwifi_firmware"
-FILES:${PN}-iwlwifi-135-6 =3D "${nonarch_base_libdir}/firmware/iwlwifi-1=
35-6.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-135-6.u=
code*"
-FILES:${PN}-iwlwifi-3160-7 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
3160-7.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-=
7.ucode*"
-FILES:${PN}-iwlwifi-3160-8 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
3160-8.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-=
8.ucode*"
-FILES:${PN}-iwlwifi-3160-9 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
3160-9.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-=
9.ucode*"
-FILES:${PN}-iwlwifi-3160-10 =3D "${nonarch_base_libdir}/firmware/iwlwifi=
-3160-10.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-316=
0-10.ucode*"
-FILES:${PN}-iwlwifi-3160-12 =3D "${nonarch_base_libdir}/firmware/iwlwifi=
-3160-12.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-316=
0-12.ucode*"
-FILES:${PN}-iwlwifi-3160-13 =3D "${nonarch_base_libdir}/firmware/iwlwifi=
-3160-13.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-316=
0-13.ucode*"
-FILES:${PN}-iwlwifi-3160-16 =3D "${nonarch_base_libdir}/firmware/iwlwifi=
-3160-16.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-316=
0-16.ucode*"
-FILES:${PN}-iwlwifi-3160-17 =3D "${nonarch_base_libdir}/firmware/iwlwifi=
-3160-17.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-316=
0-17.ucode*"
-FILES:${PN}-iwlwifi-6000-4 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
6000-4.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6000-=
4.ucode*"
-FILES:${PN}-iwlwifi-6000g2a-5 =3D "${nonarch_base_libdir}/firmware/iwlwi=
fi-6000g2a-5.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi=
-6000g2a-5.ucode*"
-FILES:${PN}-iwlwifi-6000g2a-6 =3D "${nonarch_base_libdir}/firmware/iwlwi=
fi-6000g2a-6.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi=
-6000g2a-6.ucode*"
-FILES:${PN}-iwlwifi-6000g2b-5 =3D "${nonarch_base_libdir}/firmware/iwlwi=
fi-6000g2b-5.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi=
-6000g2b-5.ucode*"
-FILES:${PN}-iwlwifi-6000g2b-6 =3D "${nonarch_base_libdir}/firmware/iwlwi=
fi-6000g2b-6.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi=
-6000g2b-6.ucode*"
-FILES:${PN}-iwlwifi-6050-4 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
6050-4.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6050-=
4.ucode*"
-FILES:${PN}-iwlwifi-6050-5 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
6050-5.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6050-=
5.ucode*"
-FILES:${PN}-iwlwifi-7260   =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
7260-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-7260-=
*.ucode*"
-FILES:${PN}-iwlwifi-7265   =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
7265-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-7265-=
*.ucode*"
-FILES:${PN}-iwlwifi-7265d   =3D "${nonarch_base_libdir}/firmware/iwlwifi=
-7265D-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-726=
5D-*.ucode*"
-FILES:${PN}-iwlwifi-8000c   =3D "${nonarch_base_libdir}/firmware/iwlwifi=
-8000C-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-800=
0C-*.ucode*"
-FILES:${PN}-iwlwifi-8265   =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
8265-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-8265-=
*.ucode*"
-FILES:${PN}-iwlwifi-9000   =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
9000-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-9000-=
*.ucode*"
-FILES:${PN}-iwlwifi-9260   =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
9260-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-9260-=
*.ucode*"
+FILES:${PN}-iwlwifi-license =3D "${firmwaredir}/LICENCE.iwlwifi_firmware=
"
+FILES:${PN}-iwlwifi-135-6 =3D "${firmwaredir}/iwlwifi-135-6.ucode* ${fir=
mwaredir}/intel/iwlwifi/iwlwifi-135-6.ucode*"
+FILES:${PN}-iwlwifi-3160-7 =3D "${firmwaredir}/iwlwifi-3160-7.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-3160-7.ucode*"
+FILES:${PN}-iwlwifi-3160-8 =3D "${firmwaredir}/iwlwifi-3160-8.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-3160-8.ucode*"
+FILES:${PN}-iwlwifi-3160-9 =3D "${firmwaredir}/iwlwifi-3160-9.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-3160-9.ucode*"
+FILES:${PN}-iwlwifi-3160-10 =3D "${firmwaredir}/iwlwifi-3160-10.ucode* $=
{firmwaredir}/intel/iwlwifi/iwlwifi-3160-10.ucode*"
+FILES:${PN}-iwlwifi-3160-12 =3D "${firmwaredir}/iwlwifi-3160-12.ucode* $=
{firmwaredir}/intel/iwlwifi/iwlwifi-3160-12.ucode*"
+FILES:${PN}-iwlwifi-3160-13 =3D "${firmwaredir}/iwlwifi-3160-13.ucode* $=
{firmwaredir}/intel/iwlwifi/iwlwifi-3160-13.ucode*"
+FILES:${PN}-iwlwifi-3160-16 =3D "${firmwaredir}/iwlwifi-3160-16.ucode* $=
{firmwaredir}/intel/iwlwifi/iwlwifi-3160-16.ucode*"
+FILES:${PN}-iwlwifi-3160-17 =3D "${firmwaredir}/iwlwifi-3160-17.ucode* $=
{firmwaredir}/intel/iwlwifi/iwlwifi-3160-17.ucode*"
+FILES:${PN}-iwlwifi-6000-4 =3D "${firmwaredir}/iwlwifi-6000-4.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-6000-4.ucode*"
+FILES:${PN}-iwlwifi-6000g2a-5 =3D "${firmwaredir}/iwlwifi-6000g2a-5.ucod=
e* ${firmwaredir}/intel/iwlwifi/iwlwifi-6000g2a-5.ucode*"
+FILES:${PN}-iwlwifi-6000g2a-6 =3D "${firmwaredir}/iwlwifi-6000g2a-6.ucod=
e* ${firmwaredir}/intel/iwlwifi/iwlwifi-6000g2a-6.ucode*"
+FILES:${PN}-iwlwifi-6000g2b-5 =3D "${firmwaredir}/iwlwifi-6000g2b-5.ucod=
e* ${firmwaredir}/intel/iwlwifi/iwlwifi-6000g2b-5.ucode*"
+FILES:${PN}-iwlwifi-6000g2b-6 =3D "${firmwaredir}/iwlwifi-6000g2b-6.ucod=
e* ${firmwaredir}/intel/iwlwifi/iwlwifi-6000g2b-6.ucode*"
+FILES:${PN}-iwlwifi-6050-4 =3D "${firmwaredir}/iwlwifi-6050-4.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-6050-4.ucode*"
+FILES:${PN}-iwlwifi-6050-5 =3D "${firmwaredir}/iwlwifi-6050-5.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-6050-5.ucode*"
+FILES:${PN}-iwlwifi-7260   =3D "${firmwaredir}/iwlwifi-7260-*.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-7260-*.ucode*"
+FILES:${PN}-iwlwifi-7265   =3D "${firmwaredir}/iwlwifi-7265-*.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-7265-*.ucode*"
+FILES:${PN}-iwlwifi-7265d   =3D "${firmwaredir}/iwlwifi-7265D-*.ucode* $=
{firmwaredir}/intel/iwlwifi/iwlwifi-7265D-*.ucode*"
+FILES:${PN}-iwlwifi-8000c   =3D "${firmwaredir}/iwlwifi-8000C-*.ucode* $=
{firmwaredir}/intel/iwlwifi/iwlwifi-8000C-*.ucode*"
+FILES:${PN}-iwlwifi-8265   =3D "${firmwaredir}/iwlwifi-8265-*.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-8265-*.ucode*"
+FILES:${PN}-iwlwifi-9000   =3D "${firmwaredir}/iwlwifi-9000-*.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-9000-*.ucode*"
+FILES:${PN}-iwlwifi-9260   =3D "${firmwaredir}/iwlwifi-9260-*.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-9260-*.ucode*"
 FILES:${PN}-iwlwifi-misc   =3D " \
-    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode* ${nonarch_base_libd=
ir}/firmware/intel/iwlwifi/iwlwifi-*.ucode* \
-    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm* ${nonarch_base_libdi=
r}/firmware/intel/iwlwifi/iwlwifi-*.pnvm* \
+    ${firmwaredir}/iwlwifi-*.ucode* ${firmwaredir}/intel/iwlwifi/iwlwifi=
-*.ucode* \
+    ${firmwaredir}/iwlwifi-*.pnvm* ${firmwaredir}/intel/iwlwifi/iwlwifi-=
*.pnvm* \
 "
=20
 RDEPENDS:${PN}-iwlwifi-135-6     =3D "${PN}-iwlwifi-license"
@@ -2220,15 +2220,15 @@ LICENSE:${PN}-ibt-18    =3D "Firmware-ibt_firmwar=
e"
 LICENSE:${PN}-ibt-20 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-misc    =3D "Firmware-ibt_firmware"
=20
-FILES:${PN}-ibt-license =3D "${nonarch_base_libdir}/firmware/LICENCE.ibt=
_firmware"
-FILES:${PN}-ibt-hw-37-7 =3D "${nonarch_base_libdir}/firmware/intel/ibt-h=
w-37.7*.bseq*"
-FILES:${PN}-ibt-hw-37-8 =3D "${nonarch_base_libdir}/firmware/intel/ibt-h=
w-37.8*.bseq*"
-FILES:${PN}-ibt-11-5    =3D "${nonarch_base_libdir}/firmware/intel/ibt-1=
1-5.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc*"
-FILES:${PN}-ibt-12-16   =3D "${nonarch_base_libdir}/firmware/intel/ibt-1=
2-16.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc*"
-FILES:${PN}-ibt-17 =3D "${nonarch_base_libdir}/firmware/intel/ibt-17-*.s=
fi* ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc*"
-FILES:${PN}-ibt-18      =3D "${nonarch_base_libdir}/firmware/intel/ibt-1=
8-*.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc*"
-FILES:${PN}-ibt-20 =3D "${nonarch_base_libdir}/firmware/intel/ibt-20-*.s=
fi* ${nonarch_base_libdir}/firmware/intel/ibt-20-*.ddc*"
-FILES:${PN}-ibt-misc    =3D "${nonarch_base_libdir}/firmware/intel/ibt-*=
"
+FILES:${PN}-ibt-license =3D "${firmwaredir}/LICENCE.ibt_firmware"
+FILES:${PN}-ibt-hw-37-7 =3D "${firmwaredir}/intel/ibt-hw-37.7*.bseq*"
+FILES:${PN}-ibt-hw-37-8 =3D "${firmwaredir}/intel/ibt-hw-37.8*.bseq*"
+FILES:${PN}-ibt-11-5    =3D "${firmwaredir}/intel/ibt-11-5.sfi* ${firmwa=
redir}/intel/ibt-11-5.ddc*"
+FILES:${PN}-ibt-12-16   =3D "${firmwaredir}/intel/ibt-12-16.sfi* ${firmw=
aredir}/intel/ibt-12-16.ddc*"
+FILES:${PN}-ibt-17 =3D "${firmwaredir}/intel/ibt-17-*.sfi* ${firmwaredir=
}/intel/ibt-17-*.ddc*"
+FILES:${PN}-ibt-18      =3D "${firmwaredir}/intel/ibt-18-*.sfi* ${firmwa=
redir}/intel/ibt-18-*.ddc*"
+FILES:${PN}-ibt-20 =3D "${firmwaredir}/intel/ibt-20-*.sfi* ${firmwaredir=
}/intel/ibt-20-*.ddc*"
+FILES:${PN}-ibt-misc    =3D "${firmwaredir}/intel/ibt-*"
=20
 RDEPENDS:${PN}-ibt-hw-37-7 =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-hw-37.8 =3D "${PN}-ibt-license"
@@ -2244,8 +2244,8 @@ ALLOW_EMPTY:${PN}-ibt-misc =3D "1"
=20
 LICENSE:${PN}-i915       =3D "Firmware-i915"
 LICENSE:${PN}-i915-license =3D "Firmware-i915"
-FILES:${PN}-i915-license =3D "${nonarch_base_libdir}/firmware/LICENSE.i9=
15"
-FILES:${PN}-i915         =3D "${nonarch_base_libdir}/firmware/i915"
+FILES:${PN}-i915-license =3D "${firmwaredir}/LICENSE.i915"
+FILES:${PN}-i915         =3D "${firmwaredir}/i915"
 RDEPENDS:${PN}-i915      =3D "${PN}-i915-license"
=20
 # For ice-enhanced
@@ -2253,49 +2253,49 @@ LICENSE:${PN}-ice-enhanced         =3D "Firmware-=
ice_enhanced"
 LICENSE:${PN}-ice-enhanced-license =3D "Firmware-ice_enhanced"
=20
 FILES:${PN}-ice-enhanced           =3D " \
-  ${nonarch_base_libdir}/firmware/intel/ice/ddp-comms/* \
-  ${nonarch_base_libdir}/firmware/intel/ice/ddp-wireless_edge/* \
+  ${firmwaredir}/intel/ice/ddp-comms/* \
+  ${firmwaredir}/intel/ice/ddp-wireless_edge/* \
 "
 FILES:${PN}-ice-enhanced-license   =3D " \
-  ${nonarch_base_libdir}/firmware/LICENSE.ice_enhanced \
+  ${firmwaredir}/LICENSE.ice_enhanced \
 "
 RDEPENDS:${PN}-ice-enhanced        =3D "${PN}-ice-enhanced-license"
=20
 LICENSE:${PN}-ice       =3D "Firmware-ice"
 LICENSE:${PN}-ice-license =3D "Firmware-ice"
-FILES:${PN}-ice-license =3D "${nonarch_base_libdir}/firmware/LICENSE.ice=
"
+FILES:${PN}-ice-license =3D "${firmwaredir}/LICENSE.ice"
 FILES:${PN}-ice         =3D " \
-  ${nonarch_base_libdir}/firmware/intel/ice/ddp/* \
-  ${nonarch_base_libdir}/firmware/intel/ice/ddp-lag/* \
+  ${firmwaredir}/intel/ice/ddp/* \
+  ${firmwaredir}/intel/ice/ddp-lag/* \
 "
 RDEPENDS:${PN}-ice      =3D "${PN}-ice-license"
=20
-FILES:${PN}-adsp-sst-license      =3D "${nonarch_base_libdir}/firmware/L=
ICENCE.adsp_sst"
+FILES:${PN}-adsp-sst-license      =3D "${firmwaredir}/LICENCE.adsp_sst"
 LICENSE:${PN}-adsp-sst            =3D "Firmware-adsp_sst"
 LICENSE:${PN}-adsp-sst-license    =3D "Firmware-adsp_sst"
 FILES:${PN}-adsp-sst              =3D "\
-    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
-    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
-    ${nonarch_base_libdir}/firmware/intel/avs/skl/dsp_mod_7CAD0808-AB10-=
CD23-EF45-12AB34CD56EF.bin \
+    ${firmwaredir}/intel/dsp_fw* \
+    ${firmwaredir}/intel/avs/*/dsp_basefw.bin \
+    ${firmwaredir}/intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34C=
D56EF.bin \
 "
 RDEPENDS:${PN}-adsp-sst           =3D "${PN}-adsp-sst-license"
=20
 # For snd_soc_avs - Intel AudioDSP driver for cAVS platforms
 LICENSE:${PN}-snd-soc-avs =3D "Apache-2.0"
-FILES:${PN}-snd-soc-avs =3D "${nonarch_base_libdir}/firmware/intel/avs/*=
"
+FILES:${PN}-snd-soc-avs =3D "${firmwaredir}/intel/avs/*"
=20
 # For QAT
 LICENSE:${PN}-qat         =3D "Firmware-qat"
 LICENSE:${PN}-qat-license =3D "Firmware-qat"
-FILES:${PN}-qat-license   =3D "${nonarch_base_libdir}/firmware/LICENCE.q=
at_firmware"
-FILES:${PN}-qat           =3D "${nonarch_base_libdir}/firmware/qat*.bin*=
 ${nonarch_base_libdir}/firmware/intel/qat/qat*.bin*"
+FILES:${PN}-qat-license   =3D "${firmwaredir}/LICENCE.qat_firmware"
+FILES:${PN}-qat           =3D "${firmwaredir}/qat*.bin* ${firmwaredir}/i=
ntel/qat/qat*.bin*"
 RDEPENDS:${PN}-qat        =3D "${PN}-qat-license"
=20
 LICENSE:${PN}-qed         =3D "WHENCE"
-FILES:${PN}-qed           =3D "${nonarch_base_libdir}/firmware/qed/*"
+FILES:${PN}-qed           =3D "${firmwaredir}/qed/*"
=20
 LICENSE:${PN}-linaro-license =3D "Firmware-linaro"
-FILES:${PN}-linaro-license   =3D "${nonarch_base_libdir}/firmware/LICENC=
E.linaro"
+FILES:${PN}-linaro-license   =3D "${firmwaredir}/LICENCE.linaro"
=20
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license =3D "Firmware-qcom"
@@ -2424,199 +2424,199 @@ LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-=
vpu =3D "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-qupv3fw =3D "Firmware-qcom"
 LICENSE:${PN}-qcom-x1p42100-adreno =3D "Firmware-qcom"
=20
-FILES:${PN}-qcom-license   =3D "${nonarch_base_libdir}/firmware/LICENSE.=
qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
-FILES:${PN}-qcom-2-license   =3D "${nonarch_base_libdir}/firmware/LICENS=
E.qcom-2"
-FILES:${PN}-qcom-yamato-license =3D "${nonarch_base_libdir}/firmware/LIC=
ENSE.qcom_yamato"
+FILES:${PN}-qcom-license   =3D "${firmwaredir}/LICENSE.qcom ${firmwaredi=
r}/qcom/NOTICE.txt"
+FILES:${PN}-qcom-2-license   =3D "${firmwaredir}/LICENSE.qcom-2"
+FILES:${PN}-qcom-yamato-license =3D "${firmwaredir}/LICENSE.qcom_yamato"
=20
-FILES:${PN}-qcom-aic100 =3D "${nonarch_base_libdir}/firmware/qcom/aic100=
/*"
-FILES:${PN}-qcom-qdu100 =3D "${nonarch_base_libdir}/firmware/qcom/qdu100=
/*"
+FILES:${PN}-qcom-aic100 =3D "${firmwaredir}/qcom/aic100/*"
+FILES:${PN}-qcom-qdu100 =3D "${firmwaredir}/qcom/qdu100/*"
=20
-FILES:${PN}-qcom-venus-1.8 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-1.8/*"
-FILES:${PN}-qcom-venus-4.2 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-4.2/*"
-FILES:${PN}-qcom-venus-5.2 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-5.2/*"
-FILES:${PN}-qcom-venus-5.4 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-5.4/*"
-FILES:${PN}-qcom-venus-6.0 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-6.0/*"
+FILES:${PN}-qcom-venus-1.8 =3D "${firmwaredir}/qcom/venus-1.8/*"
+FILES:${PN}-qcom-venus-4.2 =3D "${firmwaredir}/qcom/venus-4.2/*"
+FILES:${PN}-qcom-venus-5.2 =3D "${firmwaredir}/qcom/venus-5.2/*"
+FILES:${PN}-qcom-venus-5.4 =3D "${firmwaredir}/qcom/venus-5.4/*"
+FILES:${PN}-qcom-venus-6.0 =3D "${firmwaredir}/qcom/venus-6.0/*"
 FILES:${PN}-qcom-vpu =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/vpu/* \
-    ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
-    ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
+    ${firmwaredir}/qcom/vpu/* \
+    ${firmwaredir}/qcom/vpu-1.0/* \
+    ${firmwaredir}/qcom/vpu-2.0/* \
 "
-FILES:${PN}-qcom-adreno-a2xx =3D "${nonarch_base_libdir}/firmware/qcom/l=
eia_*.fw* ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw* ${nonarch_bas=
e_libdir}/firmware/qcom/a2*_*.fw*"
-FILES:${PN}-qcom-adreno-a3xx =3D "${nonarch_base_libdir}/firmware/qcom/a=
3*_*.fw* ${nonarch_base_libdir}/firmware/a300_*.fw*"
-FILES:${PN}-qcom-adreno-a4xx =3D "${nonarch_base_libdir}/firmware/qcom/a=
4*_*.fw*"
-FILES:${PN}-qcom-adreno-a530 =3D "${nonarch_base_libdir}/firmware/qcom/a=
530*.fw*"
-FILES:${PN}-qcom-adreno-a612 =3D "${nonarch_base_libdir}/firmware/qcom/a=
612*.*"
-FILES:${PN}-qcom-adreno-a623 =3D "${nonarch_base_libdir}/firmware/qcom/a=
623*.*"
-FILES:${PN}-qcom-adreno-a630 =3D "${nonarch_base_libdir}/firmware/qcom/a=
630*.*"
-FILES:${PN}-qcom-adreno-a640 =3D "${nonarch_base_libdir}/firmware/qcom/a=
640*.*"
-FILES:${PN}-qcom-adreno-a650 =3D "${nonarch_base_libdir}/firmware/qcom/a=
650*.*"
-FILES:${PN}-qcom-adreno-a660 =3D "${nonarch_base_libdir}/firmware/qcom/a=
660*.*"
-FILES:${PN}-qcom-adreno-a663 =3D "${nonarch_base_libdir}/firmware/qcom/a=
663*.*"
-FILES:${PN}-qcom-adreno-a702 =3D "${nonarch_base_libdir}/firmware/qcom/a=
702*.*"
-FILES:${PN}-qcom-adreno-a730 =3D "${nonarch_base_libdir}/firmware/qcom/a=
730_sqe*.* ${nonarch_base_libdir}/firmware/qcom/gmu_gen70000.*"
-FILES:${PN}-qcom-adreno-a740 =3D "${nonarch_base_libdir}/firmware/qcom/a=
740_sqe*.* ${nonarch_base_libdir}/firmware/qcom/gmu_gen70200.*"
-FILES:${PN}-qcom-adreno-g705 =3D "${nonarch_base_libdir}/firmware/qcom/g=
en70500_*.*"
-FILES:${PN}-qcom-adreno-g709 =3D "${nonarch_base_libdir}/firmware/qcom/g=
en70900_*.* ${nonarch_base_libdir}/firmware/qcom/gmu_gen70900.*"
-FILES:${PN}-qcom-adreno-g715 =3D "${nonarch_base_libdir}/firmware/qcom/g=
en71500_*.*"
-FILES:${PN}-qcom-adreno-g800 =3D "${nonarch_base_libdir}/firmware/qcom/g=
en80000_*.*"
-FILES:${PN}-qcom-adreno-g801 =3D "${nonarch_base_libdir}/firmware/qcom/g=
en80100_*.*"
-FILES:${PN}-qcom-adreno-g802 =3D "${nonarch_base_libdir}/firmware/qcom/g=
en80200_*.*"
-FILES:${PN}-qcom-apq8016-modem =3D "${nonarch_base_libdir}/firmware/qcom=
/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*=
"
-FILES:${PN}-qcom-apq8016-wifi =3D "${nonarch_base_libdir}/firmware/qcom/=
apq8016/wcnss.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
-FILES:${PN}-qcom-apq8096-adreno =3D "${nonarch_base_libdir}/firmware/qco=
m/apq8096/a530_zap.mbn* ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt=
*"
-FILES:${PN}-qcom-apq8096-audio =3D "${nonarch_base_libdir}/firmware/qcom=
/apq8096/adsp*.*"
-FILES:${PN}-qcom-apq8096-modem =3D "${nonarch_base_libdir}/firmware/qcom=
/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* $=
{nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
-FILES:${PN}-qcom-glymur-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/glymur/gen80100_zap.mbn*"
+FILES:${PN}-qcom-adreno-a2xx =3D "${firmwaredir}/qcom/leia_*.fw* ${firmw=
aredir}/qcom/yamato_*.fw* ${firmwaredir}/qcom/a2*_*.fw*"
+FILES:${PN}-qcom-adreno-a3xx =3D "${firmwaredir}/qcom/a3*_*.fw* ${firmwa=
redir}/a300_*.fw*"
+FILES:${PN}-qcom-adreno-a4xx =3D "${firmwaredir}/qcom/a4*_*.fw*"
+FILES:${PN}-qcom-adreno-a530 =3D "${firmwaredir}/qcom/a530*.fw*"
+FILES:${PN}-qcom-adreno-a612 =3D "${firmwaredir}/qcom/a612*.*"
+FILES:${PN}-qcom-adreno-a623 =3D "${firmwaredir}/qcom/a623*.*"
+FILES:${PN}-qcom-adreno-a630 =3D "${firmwaredir}/qcom/a630*.*"
+FILES:${PN}-qcom-adreno-a640 =3D "${firmwaredir}/qcom/a640*.*"
+FILES:${PN}-qcom-adreno-a650 =3D "${firmwaredir}/qcom/a650*.*"
+FILES:${PN}-qcom-adreno-a660 =3D "${firmwaredir}/qcom/a660*.*"
+FILES:${PN}-qcom-adreno-a663 =3D "${firmwaredir}/qcom/a663*.*"
+FILES:${PN}-qcom-adreno-a702 =3D "${firmwaredir}/qcom/a702*.*"
+FILES:${PN}-qcom-adreno-a730 =3D "${firmwaredir}/qcom/a730_sqe*.* ${firm=
waredir}/qcom/gmu_gen70000.*"
+FILES:${PN}-qcom-adreno-a740 =3D "${firmwaredir}/qcom/a740_sqe*.* ${firm=
waredir}/qcom/gmu_gen70200.*"
+FILES:${PN}-qcom-adreno-g705 =3D "${firmwaredir}/qcom/gen70500_*.*"
+FILES:${PN}-qcom-adreno-g709 =3D "${firmwaredir}/qcom/gen70900_*.* ${fir=
mwaredir}/qcom/gmu_gen70900.*"
+FILES:${PN}-qcom-adreno-g715 =3D "${firmwaredir}/qcom/gen71500_*.*"
+FILES:${PN}-qcom-adreno-g800 =3D "${firmwaredir}/qcom/gen80000_*.*"
+FILES:${PN}-qcom-adreno-g801 =3D "${firmwaredir}/qcom/gen80100_*.*"
+FILES:${PN}-qcom-adreno-g802 =3D "${firmwaredir}/qcom/gen80200_*.*"
+FILES:${PN}-qcom-apq8016-modem =3D "${firmwaredir}/qcom/apq8016/mba.mbn*=
 ${firmwaredir}/qcom/apq8016/modem.mbn*"
+FILES:${PN}-qcom-apq8016-wifi =3D "${firmwaredir}/qcom/apq8016/wcnss.mbn=
* ${firmwaredir}/qcom/apq8016/WCNSS*"
+FILES:${PN}-qcom-apq8096-adreno =3D "${firmwaredir}/qcom/apq8096/a530_za=
p.mbn* ${firmwaredir}/qcom/a530_zap.mdt*"
+FILES:${PN}-qcom-apq8096-audio =3D "${firmwaredir}/qcom/apq8096/adsp*.*"
+FILES:${PN}-qcom-apq8096-modem =3D "${firmwaredir}/qcom/apq8096/mba.mbn*=
 ${firmwaredir}/qcom/apq8096/modem*.* ${firmwaredir}/qcom/apq8096/wlanmds=
p.mbn*"
+FILES:${PN}-qcom-glymur-adreno =3D "${firmwaredir}/qcom/glymur/gen80100_=
zap.mbn*"
 FILES:${PN}-qcom-glymur-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/glymur/GLYMUR-CRD-tplg.bin* \
+    ${firmwaredir}/qcom/glymur/adsp*.* \
+    ${firmwaredir}/qcom/glymur/GLYMUR-CRD-tplg.bin* \
 "
-FILES:${PN}-qcom-glymur-compute =3D "${nonarch_base_libdir}/firmware/qco=
m/glymur/cdsp*.*"
-FILES:${PN}-qcom-kaanapali-adreno =3D "${nonarch_base_libdir}/firmware/q=
com/kaanapali/gen80200_zap.mbn*"
+FILES:${PN}-qcom-glymur-compute =3D "${firmwaredir}/qcom/glymur/cdsp*.*"
+FILES:${PN}-qcom-kaanapali-adreno =3D "${firmwaredir}/qcom/kaanapali/gen=
80200_zap.mbn*"
 FILES:${PN}-qcom-kaanapali-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/kaanapali/Kaanapali-MTP-tplg.bi=
n* \
+    ${firmwaredir}/qcom/kaanapali/adsp*.* \
+    ${firmwaredir}/qcom/kaanapali/Kaanapali-MTP-tplg.bin* \
 "
-FILES:${PN}-qcom-kaanapali-compute =3D "${nonarch_base_libdir}/firmware/=
qcom/kaanapali/cdsp*.*"
-FILES:${PN}-qcom-kaanapali-soccp =3D "${nonarch_base_libdir}/firmware/qc=
om/kaanapali/soccp*.*"
-FILES:${PN}-qcom-qcm2290-adreno =3D "${nonarch_base_libdir}/firmware/qco=
m/qcm2290/a702_zap.mbn*"
-FILES:${PN}-qcom-qcm2290-audio =3D "${nonarch_base_libdir}/firmware/qcom=
/qcm2290/adsp*.*"
-FILES:${PN}-qcom-qcm2290-modem =3D "${nonarch_base_libdir}/firmware/qcom=
/qcm2290/modem*.*"
-FILES:${PN}-qcom-qcm2290-wifi =3D "${nonarch_base_libdir}/firmware/qcom/=
qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.=
0/qcm2290/*"
-FILES:${PN}-qcom-qcm6490-adreno =3D "${nonarch_base_libdir}/firmware/qco=
m/qc[ms]6490/a660_zap.mbn*"
+FILES:${PN}-qcom-kaanapali-compute =3D "${firmwaredir}/qcom/kaanapali/cd=
sp*.*"
+FILES:${PN}-qcom-kaanapali-soccp =3D "${firmwaredir}/qcom/kaanapali/socc=
p*.*"
+FILES:${PN}-qcom-qcm2290-adreno =3D "${firmwaredir}/qcom/qcm2290/a702_za=
p.mbn*"
+FILES:${PN}-qcom-qcm2290-audio =3D "${firmwaredir}/qcom/qcm2290/adsp*.*"
+FILES:${PN}-qcom-qcm2290-modem =3D "${firmwaredir}/qcom/qcm2290/modem*.*=
"
+FILES:${PN}-qcom-qcm2290-wifi =3D "${firmwaredir}/qcom/qcm2290/wlanmdsp.=
mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/qcm2290/*"
+FILES:${PN}-qcom-qcm6490-adreno =3D "${firmwaredir}/qcom/qc[ms]6490/a660=
_zap.mbn*"
 FILES:${PN}-qcom-qcm6490-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn \
-    ${nonarch_base_libdir}/firmware/qcom/qcm6490/QCM6490-IDP-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-RB3Gen2-tplg.bi=
n* \
+    ${firmwaredir}/qcom/qc[ms]6490/adsp*.* \
+    ${firmwaredir}/qcom/qc[ms]6490/battmgr.jsn \
+    ${firmwaredir}/qcom/qcm6490/QCM6490-IDP-tplg.bin* \
+    ${firmwaredir}/qcom/qcs6490/QCS6490-RB3Gen2-tplg.bin* \
 "
-FILES:${PN}-qcom-qcm6490-compute =3D "${nonarch_base_libdir}/firmware/qc=
om/qc[ms]6490/cdsp*.*"
-FILES:${PN}-qcom-qcm6490-ipa =3D "${nonarch_base_libdir}/firmware/qcom/q=
cm6490/ipa_fws.mbn*"
-FILES:${PN}-qcom-qcm6490-wifi =3D "${nonarch_base_libdir}/firmware/qcom/=
qc[ms]6490/wpss.mbn*"
-FILES:${PN}-qcom-qcm6490-qupv3fw =3D "${nonarch_base_libdir}/firmware/qc=
om/qc[ms]6490/qupv3fw.elf*"
-FILES:${PN}-qcom-qcs615-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/qcs615/a612_zap.mbn*"
-FILES:${PN}-qcom-qcs615-audio =3D "${nonarch_base_libdir}/firmware/qcom/=
qcs615/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs615/TALOS-EVK-tplg=
.bin*"
-FILES:${PN}-qcom-qcs615-compute =3D "${nonarch_base_libdir}/firmware/qco=
m/qcs615/cdsp*.*"
-FILES:${PN}-qcom-qcs615-qupv3fw =3D "${nonarch_base_libdir}/firmware/qco=
m/qcs615/qupv3fw.elf*"
+FILES:${PN}-qcom-qcm6490-compute =3D "${firmwaredir}/qcom/qc[ms]6490/cds=
p*.*"
+FILES:${PN}-qcom-qcm6490-ipa =3D "${firmwaredir}/qcom/qcm6490/ipa_fws.mb=
n*"
+FILES:${PN}-qcom-qcm6490-wifi =3D "${firmwaredir}/qcom/qc[ms]6490/wpss.m=
bn*"
+FILES:${PN}-qcom-qcm6490-qupv3fw =3D "${firmwaredir}/qcom/qc[ms]6490/qup=
v3fw.elf*"
+FILES:${PN}-qcom-qcs615-adreno =3D "${firmwaredir}/qcom/qcs615/a612_zap.=
mbn*"
+FILES:${PN}-qcom-qcs615-audio =3D "${firmwaredir}/qcom/qcs615/adsp*.* ${=
firmwaredir}/qcom/qcs615/TALOS-EVK-tplg.bin*"
+FILES:${PN}-qcom-qcs615-compute =3D "${firmwaredir}/qcom/qcs615/cdsp*.*"
+FILES:${PN}-qcom-qcs615-qupv3fw =3D "${firmwaredir}/qcom/qcs615/qupv3fw.=
elf*"
 FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.=
* \
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS649=
0-Radxa-Dragon-Q6A-tplg.bin*\
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6=
A-tplg.bin*\
+    ${firmwaredir}/qcom/qcs6490/radxa/dragon-q6a/adsp*.* \
+    ${firmwaredir}/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6=
A-tplg.bin*\
+    ${firmwaredir}/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
 "
 FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp*.=
* \
+    ${firmwaredir}/qcom/qcs6490/radxa/dragon-q6a/cdsp*.* \
 "
 FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/ad=
sp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/QC=
S6490-Thundercomm-RubikPi3-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Thundercomm-Rub=
ikPi3-tplg.bin* \
+    ${firmwaredir}/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.* \
+    ${firmwaredir}/qcom/qcs6490/Thundercomm/RubikPi3/QCS6490-Thundercomm=
-RubikPi3-tplg.bin* \
+    ${firmwaredir}/qcom/qcs6490/QCS6490-Thundercomm-RubikPi3-tplg.bin* \
 "
-FILES:${PN}-qcom-qcs8300-adreno =3D "${nonarch_base_libdir}/firmware/qco=
m/qcs8300/a623_zap.mbn*"
+FILES:${PN}-qcom-qcs8300-adreno =3D "${firmwaredir}/qcom/qcs8300/a623_za=
p.mbn*"
 FILES:${PN}-qcom-qcs8300-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/qcs8300/arduino-monza-tplg.bin*=
 \
-    ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin* \
+    ${firmwaredir}/qcom/qcs8300/adsp*.* \
+    ${firmwaredir}/qcom/qcs8300/arduino-monza-tplg.bin* \
+    ${firmwaredir}/qcom/qcs8300/MONACO-EVK-tplg.bin* \
 "
-FILES:${PN}-qcom-qcs8300-compute =3D "${nonarch_base_libdir}/firmware/qc=
om/qcs8300/cdsp*.*"
-FILES:${PN}-qcom-qcs8300-generalpurpose =3D "${nonarch_base_libdir}/firm=
ware/qcom/qcs8300/gpdsp*.*"
-FILES:${PN}-qcom-qcs8300-qupv3fw =3D "${nonarch_base_libdir}/firmware/qc=
om/qcs8300/qupv3fw.elf*"
-FILES:${PN}-qcom-qrb4210-adreno =3D "${nonarch_base_libdir}/firmware/qco=
m/qrb4210/a610_zap.mbn*"
-FILES:${PN}-qcom-qrb4210-audio =3D "${nonarch_base_libdir}/firmware/qcom=
/qrb4210/adsp*.*"
-FILES:${PN}-qcom-qrb4210-compute =3D "${nonarch_base_libdir}/firmware/qc=
om/qrb4210/cdsp*.*"
-FILES:${PN}-qcom-qrb4210-modem =3D "${nonarch_base_libdir}/firmware/qcom=
/qrb4210/modem*.*"
-FILES:${PN}-qcom-qrb4210-wifi =3D "${nonarch_base_libdir}/firmware/qcom/=
qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.=
0/qrb4210/*"
-FILES:${PN}-qcom-sa8775p-adreno =3D "${nonarch_base_libdir}/firmware/qco=
m/sa8775p/a663_zap.mbn*"
+FILES:${PN}-qcom-qcs8300-compute =3D "${firmwaredir}/qcom/qcs8300/cdsp*.=
*"
+FILES:${PN}-qcom-qcs8300-generalpurpose =3D "${firmwaredir}/qcom/qcs8300=
/gpdsp*.*"
+FILES:${PN}-qcom-qcs8300-qupv3fw =3D "${firmwaredir}/qcom/qcs8300/qupv3f=
w.elf*"
+FILES:${PN}-qcom-qrb4210-adreno =3D "${firmwaredir}/qcom/qrb4210/a610_za=
p.mbn*"
+FILES:${PN}-qcom-qrb4210-audio =3D "${firmwaredir}/qcom/qrb4210/adsp*.*"
+FILES:${PN}-qcom-qrb4210-compute =3D "${firmwaredir}/qcom/qrb4210/cdsp*.=
*"
+FILES:${PN}-qcom-qrb4210-modem =3D "${firmwaredir}/qcom/qrb4210/modem*.*=
"
+FILES:${PN}-qcom-qrb4210-wifi =3D "${firmwaredir}/qcom/qrb4210/wlanmdsp.=
mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/qrb4210/*"
+FILES:${PN}-qcom-sa8775p-adreno =3D "${firmwaredir}/qcom/sa8775p/a663_za=
p.mbn*"
 FILES:${PN}-qcom-sa8775p-audio =3D "\
-    ${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/sa8775p/LEMANS-EVK-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tplg.bin* \
+    ${firmwaredir}/qcom/sa8775p/adsp*.* \
+    ${firmwaredir}/qcom/sa8775p/LEMANS-EVK-tplg.bin* \
+    ${firmwaredir}/qcom/qcs9100/LEMANS-EVK-tplg.bin* \
 "
-FILES:${PN}-qcom-sa8775p-compute =3D "${nonarch_base_libdir}/firmware/qc=
om/sa8775p/cdsp*.*"
-FILES:${PN}-qcom-sa8775p-generalpurpose =3D "${nonarch_base_libdir}/firm=
ware/qcom/sa8775p/gpdsp*.*"
-FILES:${PN}-qcom-sa8775p-qupv3fw =3D "${nonarch_base_libdir}/firmware/qc=
om/sa8775p/qupv3fw.elf*"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat =3D "${nonarch_base_libdir}=
/firmware/qcom/LENOVO/21BX"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio =3D "${nonarch_base_libdir}/=
firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmwa=
re/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn* ${nonarch_base_libdir}/firmware=
/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${nonarch_base_libdir}/fi=
rmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno =3D "${nonarch_base_libdir}=
/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute =3D "${nonarch_base_libdir=
}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors =3D "${nonarch_base_libdir=
}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu =3D "${nonarch_base_libdir}/fi=
rmware/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn*"
-FILES:${PN}-qcom-sdm845-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sdm845/a630*.*"
-FILES:${PN}-qcom-sdm845-audio =3D "${nonarch_base_libdir}/firmware/qcom/=
sdm845/adsp*.*"
-FILES:${PN}-qcom-sdm845-compute =3D "${nonarch_base_libdir}/firmware/qco=
m/sdm845/cdsp*.*"
-FILES:${PN}-qcom-sdm845-modem =3D "${nonarch_base_libdir}/firmware/qcom/=
sdm845/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${no=
narch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn* ${nonarch_base_libd=
ir}/firmware/qcom/sdm845/notice.txt_wlanmdsp* \
-                                 ${nonarch_base_libdir}/firmware/ath10k/=
WCN3990/hw1.0/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN399=
0/hw1.0/notice.txt_wlanmdsp"
-FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors =3D "${nonarch_base_l=
ibdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
-FILES:${PN}-qcom-sdx35-foxconn-firehose =3D "${nonarch_base_libdir}/firm=
ware/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
-FILES:${PN}-qcom-sdx61-foxconn-firehose =3D "${nonarch_base_libdir}/firm=
ware/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
-FILES:${PN}-qcom-shikra-qupv3fw =3D "${nonarch_base_libdir}/firmware/qco=
m/shikra/qupv3fw.elf*"
-FILES:${PN}-qcom-sm8150-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sm8150/a640*.*"
-FILES:${PN}-qcom-sm8250-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sm8250/a650*.*"
-FILES:${PN}-qcom-sm8250-audio =3D "${nonarch_base_libdir}/firmware/qcom/=
sm8250/adsp*.*"
-FILES:${PN}-qcom-sm8250-compute =3D "${nonarch_base_libdir}/firmware/qco=
m/sm8250/cdsp*.*"
-FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors =3D "${nonarch_base_libd=
ir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
-FILES:${PN}-qcom-sm8350-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sm8350/a660_zap.mbn*"
-FILES:${PN}-qcom-sm8450-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sm8450/a730_zap.mbn*"
-FILES:${PN}-qcom-sm8450-audio-tplg =3D "${nonarch_base_libdir}/firmware/=
qcom/sm8450/*tplg.bin*"
-FILES:${PN}-qcom-sm8550-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sm8550/a740_zap.mbn*"
-FILES:${PN}-qcom-sm8550-audio-tplg =3D "${nonarch_base_libdir}/firmware/=
qcom/sm8550/*tplg.bin*"
-FILES:${PN}-qcom-sm8650-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sm8650/gen70900_zap.mbn*"
-FILES:${PN}-qcom-sm8650-audio-tplg =3D "${nonarch_base_libdir}/firmware/=
qcom/sm8650/*tplg.bin*"
-FILES:${PN}-qcom-sm8750-adreno =3D "${nonarch_base_libdir}/firmware/qcom=
/sm8750/gen80000_zap.mbn*"
-FILES:${PN}-qcom-sm8750-audio =3D "${nonarch_base_libdir}/firmware/qcom/=
sm8750/adsp*.* ${nonarch_base_libdir}/firmware/qcom/sm8750/*tplg.bin*"
-FILES:${PN}-qcom-sm8750-compute =3D "${nonarch_base_libdir}/firmware/qco=
m/sm8750/cdsp*.*"
-FILES:${PN}-qcom-x1e80100-adreno =3D "${nonarch_base_libdir}/firmware/qc=
om/x1e80100/gen70500_zap.mbn*"
+FILES:${PN}-qcom-sa8775p-compute =3D "${firmwaredir}/qcom/sa8775p/cdsp*.=
*"
+FILES:${PN}-qcom-sa8775p-generalpurpose =3D "${firmwaredir}/qcom/sa8775p=
/gpdsp*.*"
+FILES:${PN}-qcom-sa8775p-qupv3fw =3D "${firmwaredir}/qcom/sa8775p/qupv3f=
w.elf*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat =3D "${firmwaredir}/qcom/LE=
NOVO/21BX"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio =3D "${firmwaredir}/qcom/sc8=
280xp/LENOVO/21BX/*adsp*.* ${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/battm=
gr.jsn* ${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${f=
irmwaredir}/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno =3D "${firmwaredir}/qcom/sc=
8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute =3D "${firmwaredir}/qcom/s=
c8280xp/LENOVO/21BX/*cdsp*.*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors =3D "${firmwaredir}/qcom/s=
c8280xp/LENOVO/21BX/*slpi*.*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu =3D "${firmwaredir}/qcom/sc828=
0xp/LENOVO/21BX/qcvss8280.mbn*"
+FILES:${PN}-qcom-sdm845-adreno =3D "${firmwaredir}/qcom/sdm845/a630*.*"
+FILES:${PN}-qcom-sdm845-audio =3D "${firmwaredir}/qcom/sdm845/adsp*.*"
+FILES:${PN}-qcom-sdm845-compute =3D "${firmwaredir}/qcom/sdm845/cdsp*.*"
+FILES:${PN}-qcom-sdm845-modem =3D "${firmwaredir}/qcom/sdm845/mba.mbn* $=
{firmwaredir}/qcom/sdm845/modem*.* ${firmwaredir}/qcom/sdm845/wlanmdsp.mb=
n* ${firmwaredir}/qcom/sdm845/notice.txt_wlanmdsp* \
+                                 ${firmwaredir}/ath10k/WCN3990/hw1.0/wla=
nmdsp.mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
+FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors =3D "${firmwaredir}/q=
com/sdm845/Thundercomm/db845c/slpi*.*"
+FILES:${PN}-qcom-sdx35-foxconn-firehose =3D "${firmwaredir}/qcom/sdx35/f=
oxconn/xbl_s_devprg_ns.melf*"
+FILES:${PN}-qcom-sdx61-foxconn-firehose =3D "${firmwaredir}/qcom/sdx61/f=
oxconn/prog_firehose_lite.elf*"
+FILES:${PN}-qcom-shikra-qupv3fw =3D "${firmwaredir}/qcom/shikra/qupv3fw.=
elf*"
+FILES:${PN}-qcom-sm8150-adreno =3D "${firmwaredir}/qcom/sm8150/a640*.*"
+FILES:${PN}-qcom-sm8250-adreno =3D "${firmwaredir}/qcom/sm8250/a650*.*"
+FILES:${PN}-qcom-sm8250-audio =3D "${firmwaredir}/qcom/sm8250/adsp*.*"
+FILES:${PN}-qcom-sm8250-compute =3D "${firmwaredir}/qcom/sm8250/cdsp*.*"
+FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors =3D "${firmwaredir}/qcom=
/sm8250/Thundercomm/RB5/slpi*.*"
+FILES:${PN}-qcom-sm8350-adreno =3D "${firmwaredir}/qcom/sm8350/a660_zap.=
mbn*"
+FILES:${PN}-qcom-sm8450-adreno =3D "${firmwaredir}/qcom/sm8450/a730_zap.=
mbn*"
+FILES:${PN}-qcom-sm8450-audio-tplg =3D "${firmwaredir}/qcom/sm8450/*tplg=
.bin*"
+FILES:${PN}-qcom-sm8550-adreno =3D "${firmwaredir}/qcom/sm8550/a740_zap.=
mbn*"
+FILES:${PN}-qcom-sm8550-audio-tplg =3D "${firmwaredir}/qcom/sm8550/*tplg=
.bin*"
+FILES:${PN}-qcom-sm8650-adreno =3D "${firmwaredir}/qcom/sm8650/gen70900_=
zap.mbn*"
+FILES:${PN}-qcom-sm8650-audio-tplg =3D "${firmwaredir}/qcom/sm8650/*tplg=
.bin*"
+FILES:${PN}-qcom-sm8750-adreno =3D "${firmwaredir}/qcom/sm8750/gen80000_=
zap.mbn*"
+FILES:${PN}-qcom-sm8750-audio =3D "${firmwaredir}/qcom/sm8750/adsp*.* ${=
firmwaredir}/qcom/sm8750/*tplg.bin*"
+FILES:${PN}-qcom-sm8750-compute =3D "${firmwaredir}/qcom/sm8750/cdsp*.*"
+FILES:${PN}-qcom-x1e80100-adreno =3D "${firmwaredir}/qcom/x1e80100/gen70=
500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E001DE-DEVKIT-tplg.b=
in* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-CRD-tplg.bin*=
 \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-EVK-tplg.bin*=
 \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Romulus-tplg.=
bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-TUXEDO-Elite-=
14-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/adsp*.* \
+    ${firmwaredir}/qcom/x1e80100/battmgr.jsn \
+    ${firmwaredir}/qcom/x1e80100/X1E001DE-DEVKIT-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-CRD-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-EVK-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-Romulus-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-TUXEDO-Elite-14-tplg.bin* \
 "
-FILES:${PN}-qcom-x1e80100-compute =3D "${nonarch_base_libdir}/firmware/q=
com/x1e80100/cdsp*.*"
+FILES:${PN}-qcom-x1e80100-compute =3D "${firmwaredir}/qcom/x1e80100/cdsp=
*.*"
 FILES:${PN}-qcom-x1e80100-asus-vivobook-16-audio-tplg =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/ASUSTeK/vivobook-16/X1=
E80100-ASUS-Vivobook-16-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-ASUS-Vivobook=
-16-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/ASUSTeK/vivobook-16/X1E80100-ASUS-Vivob=
ook-16-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-ASUS-Vivobook-16-tplg.bin* \
 "
 FILES:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/ASUSTeK/vivobook-s15/X=
1E80100-ASUS-Vivobook-S15-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-ASUS-Vivobook=
-S15-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/ASUSTeK/vivobook-s15/X1E80100-ASUS-Vivo=
book-S15-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-ASUS-Vivobook-S15-tplg.bin* \
 "
 FILES:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/ASUSTeK/zenbook-a14/X1=
E80100-ASUS-Zenbook-A14-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-ASUS-Zenbook-=
A14-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/ASUSTeK/zenbook-a14/X1E80100-ASUS-Zenbo=
ok-A14-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-ASUS-Zenbook-A14-tplg.bin* \
 "
 FILES:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/inspiron-14-plus-=
7441/X1E80100-Dell-Inspiron-14p-7441-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-Inspiron=
-14p-7441-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/dell/inspiron-14-plus-7441/X1E80100-Del=
l-Inspiron-14p-7441-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-Dell-Inspiron-14p-7441-tplg.bi=
n* \
 "
 FILES:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/latitude-7455/X1E=
80100-Dell-Latitude-7455-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-Latitude=
-7455-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/dell/latitude-7455/X1E80100-Dell-Latitu=
de-7455-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-Dell-Latitude-7455-tplg.bin* \
 "
-FILES:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D "${nonarch_base_lib=
dir}/firmware/qcom/x1e80100/dell/xps13-9345/qcdxkmsuc8380.mbn*"
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-adreno =3D "${firmwaredir}/qco=
m/x1e80100/dell/xps13-9345/qcdxkmsuc8380.mbn*"
 FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*adsp*=
.* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/battmg=
r.jsn* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/X1E801=
00-Dell-XPS-13-9345-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-XPS-13-9=
345-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/dell/xps13-9345/*adsp*.* \
+    ${firmwaredir}/qcom/x1e80100/dell/xps13-9345/battmgr.jsn* \
+    ${firmwaredir}/qcom/x1e80100/dell/xps13-9345/X1E80100-Dell-XPS-13-93=
45-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-Dell-XPS-13-9345-tplg.bin* \
 "
-FILES:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D "${nonarch_base_li=
bdir}/firmware/qcom/x1e80100/dell/xps13-9345/*cdsp*.*"
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-compute =3D "${firmwaredir}/qc=
om/x1e80100/dell/xps13-9345/*cdsp*.*"
 FILES:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg =3D " \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/hp/omnibook-x14/X1E801=
00-HP-OMNIBOOK-X14-tplg.bin* \
-    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-HP-OMNIBOOK-X=
14-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/hp/omnibook-x14/X1E80100-HP-OMNIBOOK-X1=
4-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \
 "
-FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno =3D "${nonarch_base_libd=
ir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
-FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio =3D "${nonarch_base_libdi=
r}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/fir=
mware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn* ${nonarch_base_libdir}/firmw=
are/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin* ${n=
onarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-=
tplg.bin*"
-FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute =3D "${nonarch_base_lib=
dir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
-FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu =3D "${nonarch_base_libdir}=
/firmware/qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn*"
-FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno =3D "${nonarch_base_=
libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn*"
-FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio =3D "${nonarch_base_l=
ibdir}/firmware/qcom/x1e80100/LENOVO/83ED/*adsp*.* ${nonarch_base_libdir}=
/firmware/qcom/x1e80100/LENOVO/83ED/battmgr.jsn* ${nonarch_base_libdir}/f=
irmware/qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin* $=
{nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-=
tplg.bin*"
-FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute =3D "${nonarch_base=
_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/*cdsp*.*"
-FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu =3D "${nonarch_base_lib=
dir}/firmware/qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn* ${nonarch_base_lib=
dir}/firmware/qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn*"
-FILES:${PN}-qcom-x1e80100-qupv3fw =3D "${nonarch_base_libdir}/firmware/q=
com/x1e80100/qupv3fw.elf*"
-FILES:${PN}-qcom-x1p42100-adreno =3D "${nonarch_base_libdir}/firmware/qc=
om/x1p42100/gen71500_zap.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno =3D "${firmwaredir}/qcom=
/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio =3D "${firmwaredir}/qcom/=
x1e80100/LENOVO/21N1/*adsp*.* ${firmwaredir}/qcom/x1e80100/LENOVO/21N1/ba=
ttmgr.jsn* ${firmwaredir}/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Think=
pad-T14s-tplg.bin* ${firmwaredir}/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-=
T14s-tplg.bin*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute =3D "${firmwaredir}/qco=
m/x1e80100/LENOVO/21N1/*cdsp*.*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu =3D "${firmwaredir}/qcom/x1=
e80100/LENOVO/21N1/qcvss8380.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno =3D "${firmwaredir}/=
qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio =3D "${firmwaredir}/q=
com/x1e80100/LENOVO/83ED/*adsp*.* ${firmwaredir}/qcom/x1e80100/LENOVO/83E=
D/battmgr.jsn* ${firmwaredir}/qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Y=
oga-Slim7x-tplg.bin* ${firmwaredir}/qcom/x1e80100/X1E80100-LENOVO-Yoga-Sl=
im7x-tplg.bin*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute =3D "${firmwaredir}=
/qcom/x1e80100/LENOVO/83ED/*cdsp*.*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu =3D "${firmwaredir}/qco=
m/x1e80100/LENOVO/83ED/qcvss8380.mbn* ${firmwaredir}/qcom/x1e80100/LENOVO=
/83ED/qcav1e8380.mbn*"
+FILES:${PN}-qcom-x1e80100-qupv3fw =3D "${firmwaredir}/qcom/x1e80100/qupv=
3fw.elf*"
+FILES:${PN}-qcom-x1p42100-adreno =3D "${firmwaredir}/qcom/x1p42100/gen71=
500_zap.mbn*"
=20
 RDEPENDS:${PN}-qcom-aic100 =3D "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qdu100 =3D "${PN}-qcom-license"
@@ -2754,733 +2754,733 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sen=
sors =3D "${PN}-qcom-sc8280xp-lenov
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu =3D "${PN}-qcom-sc8280xp=
-lenovo-x13s-compat"
=20
 LICENSE:${PN}-liquidui =3D "Firmware-cavium_liquidio"
-FILES:${PN}-liquidio =3D "${nonarch_base_libdir}/firmware/liquidio"
+FILES:${PN}-liquidio =3D "${firmwaredir}/liquidio"
=20
 LICENSE:${PN}-mellanox =3D "WHENCE"
-FILES:${PN}-mellanox =3D "${nonarch_base_libdir}/firmware/mellanox"
+FILES:${PN}-mellanox =3D "${firmwaredir}/mellanox"
=20
 LICENSE:${PN}-prestera =3D "Firmware-Marvell"
-FILES:${PN}-prestera =3D "${nonarch_base_libdir}/firmware/mrvl/prestera"
+FILES:${PN}-prestera =3D "${firmwaredir}/mrvl/prestera"
 RDEPENDS:${PN}-prestera =3D "${PN}-marvell-license"
=20
 # For Rockchip
 LICENSE:${PN}-rockchip-dptx =3D "Firmware-rockchip"
-FILES:${PN}-rockchip-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.rockchip"
-FILES:${PN}-rockchip-dptx =3D "${nonarch_base_libdir}/firmware/rockchip/=
dptx.bin*"
+FILES:${PN}-rockchip-license =3D "${firmwaredir}/LICENCE.rockchip"
+FILES:${PN}-rockchip-dptx =3D "${firmwaredir}/rockchip/dptx.bin*"
 RDEPENDS:${PN}-rockchip-dptx =3D "${PN}-rockchip-license"
=20
 # For Amlogic VDEC
 LICENSE:${PN}-amlogic-vdec =3D "Firmware-amlogic_vdec"
-FILES:${PN}-amlogic-vdec-license =3D "${nonarch_base_libdir}/firmware/LI=
CENSE.amlogic_vdec"
-FILES:${PN}-amlogic-vdec =3D "${nonarch_base_libdir}/firmware/meson/vdec=
/*"
+FILES:${PN}-amlogic-vdec-license =3D "${firmwaredir}/LICENSE.amlogic_vde=
c"
+FILES:${PN}-amlogic-vdec =3D "${firmwaredir}/meson/vdec/*"
 RDEPENDS:${PN}-amlogic-vdec =3D "${PN}-amlogic-vdec-license"
=20
 # For 3com typhoon
 LICENSE:${PN}-typhoon-license =3D "Firmware-typhoon"
 LICENSE:${PN}-typhoon =3D "Firmware-typhoon"
-FILES:${PN}-typhoon-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.typhoon"
-FILES:${PN}-typhoon =3D "${nonarch_base_libdir}/firmware/3com/typhoon.bi=
n*"
+FILES:${PN}-typhoon-license =3D "${firmwaredir}/LICENCE.typhoon"
+FILES:${PN}-typhoon =3D "${firmwaredir}/3com/typhoon.bin*"
 RDEPENDS:${PN}-typhoon =3D "${PN}-typhoon-license"
=20
 # For ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-intel-license =3D "Firmware-intel"
-FILES:${PN}-intel-license =3D "${nonarch_base_libdir}/firmware/LICENSE.i=
ntel"
+FILES:${PN}-intel-license =3D "${firmwaredir}/LICENSE.intel"
=20
 LICENSE:${PN}-ish-lnlm =3D "Firmware-intel"
-FILES:${PN}-ish-lnlm =3D "${nonarch_base_libdir}/firmware/intel/ish/ish_=
lnlm.bin*"
+FILES:${PN}-ish-lnlm =3D "${firmwaredir}/intel/ish/ish_lnlm.bin*"
 RDEPENDS:${PN}-ish-lnlm =3D "${PN}-intel-license"
=20
 # For Dell ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-dell-license =3D "Firmware-dell"
-FILES:${PN}-dell-license =3D "${nonarch_base_libdir}/firmware/LICENSE.de=
ll"
+FILES:${PN}-dell-license =3D "${firmwaredir}/LICENSE.dell"
=20
 LICENSE:${PN}-ish-lnlm-39ceeaf8 =3D "Firmware-dell"
 FILES:${PN}-ish-lnlm-39ceeaf8 =3D  "\
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_39ceeaf8.bin* \
-    ${nonarch_base_libdir}/firmware/dell/ish/ish_lnlm_39ceeaf8_*.bin* \
+    ${firmwaredir}/intel/ish/ish_lnlm_39ceeaf8.bin* \
+    ${firmwaredir}/dell/ish/ish_lnlm_39ceeaf8_*.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-39ceeaf8 =3D "${PN}-dell-license"
=20
 LICENSE:${PN}-ish-ptl-39ceeaf8 =3D "Firmware-dell"
 FILES:${PN}-ish-ptl-39ceeaf8 =3D  "\
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_ptl_39ceeaf8.bin* \
-    ${nonarch_base_libdir}/firmware/dell/ish/ish_ptl_39ceeaf8_*.bin* \
+    ${firmwaredir}/intel/ish/ish_ptl_39ceeaf8.bin* \
+    ${firmwaredir}/dell/ish/ish_ptl_39ceeaf8_*.bin* \
 "
 RDEPENDS:${PN}-ish-ptl-39ceeaf8 =3D "${PN}-dell-license"
=20
 # For HP ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-hp-license =3D "Firmware-HP"
-FILES:${PN}-hp-license =3D "${nonarch_base_libdir}/firmware/LICENSE.HP"
+FILES:${PN}-hp-license =3D "${firmwaredir}/LICENSE.HP"
=20
 LICENSE:${PN}-ish-lnlm-12128606 =3D "Firmware-HP"
 FILES:${PN}-ish-lnlm-12128606 =3D " \
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_12128606_*.bin* \
-    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_12128606_*.bin* \
+    ${firmwaredir}/intel/ish/ish_lnlm_12128606_*.bin* \
+    ${firmwaredir}/HP/ish/ish_lnlm_12128606_*.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-12128606 =3D "${PN}-hp-license"
=20
 # For LENOVO ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-lenovo-license =3D "Firmware-lenovo"
-FILES:${PN}-lenovo-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
lenovo"
+FILES:${PN}-lenovo-license =3D "${firmwaredir}/LICENCE.lenovo"
=20
 LICENSE:${PN}-ish-lnlm-53c4ffad =3D "Firmware-lenovo"
 FILES:${PN}-ish-lnlm-53c4ffad =3D "\
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_*.bin* \
-    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X1_2025_5=
.8.4.7720.bin* \
-    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_x9-15_202=
5_5.8.0.7720.bin* \
-    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X9-14_202=
5_5.8.36.09092.bin* \
+    ${firmwaredir}/intel/ish/ish_lnlm_53c4ffad_*.bin* \
+    ${firmwaredir}/LENOVO/ish/ish_lnlm_lenovo_X1_2025_5.8.4.7720.bin* \
+    ${firmwaredir}/LENOVO/ish/ish_lnlm_lenovo_x9-15_2025_5.8.0.7720.bin*=
 \
+    ${firmwaredir}/LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.8.36.09092.bi=
n* \
 "
 RDEPENDS:${PN}-ish-lnlm-53c4ffad =3D "${PN}-lenovo-license"
=20
 LICENSE:${PN}-ish-ptl =3D "Firmware-intel"
-FILES:${PN}-ish-ptl =3D "${nonarch_base_libdir}/firmware/intel/ish/ish_p=
tl.bin*"
+FILES:${PN}-ish-ptl =3D "${firmwaredir}/intel/ish/ish_ptl.bin*"
 RDEPENDS:${PN}-ish-ptl =3D "${PN}-intel-license"
=20
 LICENSE:${PN}-ish-ptl-53c4ffad =3D "Firmware-lenovo"
 FILES:${PN}-ish-ptl-53c4ffad =3D "\
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_ptl_53c4ffad_*.bin* \
-    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_ptl_lenovo_X1_2026_5.=
8.1.7782.bin* \
+    ${firmwaredir}/intel/ish/ish_ptl_53c4ffad_*.bin* \
+    ${firmwaredir}/LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin* \
 "
 RDEPENDS:${PN}-ish-ptl-53c4ffad =3D "${PN}-lenovo-license"
=20
 LICENSE:${PN}-ish-wcl =3D "Firmware-intel"
-FILES:${PN}-ish-wcl =3D "${nonarch_base_libdir}/firmware/intel/ish/ish_w=
cl.bin*"
+FILES:${PN}-ish-wcl =3D "${firmwaredir}/intel/ish/ish_wcl.bin*"
 RDEPENDS:${PN}-ish-wcl =3D "${PN}-intel-license"
=20
 # For advansys - AdvanSys SCSI
 LICENSE:${PN}-advansys-license =3D "Firmware-advansys"
-FILES:${PN}-advansys-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.advansys"
+FILES:${PN}-advansys-license =3D "${firmwaredir}/LICENCE.advansys"
=20
 LICENSE:${PN}-advansys =3D "Firmware-advansys"
-FILES:${PN}-advansys =3D "${nonarch_base_libdir}/firmware/advansys/*"
+FILES:${PN}-advansys =3D "${firmwaredir}/advansys/*"
 RDEPENDS:${PN}-advansys =3D "${PN}-advansys-license"
=20
 # For as21xxx
 LICENSE:${PN}-aeonsemi-license =3D "Firmware-aeonsemi"
-FILES:${PN}-aeonsemi-license =3D "${nonarch_base_libdir}/firmware/LICENS=
E.aeonsemi"
+FILES:${PN}-aeonsemi-license =3D "${firmwaredir}/LICENSE.aeonsemi"
=20
 LICENSE:${PN}-as21xxx =3D "Firmware-aeonsemi"
-FILES:${PN}-as21xxx =3D "${nonarch_base_libdir}/firmware/aeonsemi/*"
+FILES:${PN}-as21xxx =3D "${firmwaredir}/aeonsemi/*"
 RDEPENDS:${PN}-as21xxx =3D "${PN}-aeonsemi-license"
=20
 # For orinoco - Agere/Prism/Symbol Orinoco support
 LICENSE:${PN}-agere-license =3D "Firmware-agere"
-FILES:${PN}-agere-license =3D "${nonarch_base_libdir}/firmware/LICENCE.a=
gere"
+FILES:${PN}-agere-license =3D "${firmwaredir}/LICENCE.agere"
=20
 LICENSE:${PN}-orinoco =3D "Firmware-agere"
-FILES:${PN}-orinoco =3D "${nonarch_base_libdir}/firmware/agere_*"
+FILES:${PN}-orinoco =3D "${firmwaredir}/agere_*"
 RDEPENDS:${PN}-orinoco =3D "${PN}-agere-license"
=20
 # For en8811h - Airoha 2.5G Ethernet Phy
 LICENSE:${PN}-airoha-license =3D "Firmware-airoha"
-FILES:${PN}-airoha-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
airoha"
+FILES:${PN}-airoha-license =3D "${firmwaredir}/LICENSE.airoha"
=20
 LICENSE:${PN}-an8811hb =3D "Firmware-airoha"
-FILES:${PN}-an8811hb =3D "${nonarch_base_libdir}/firmware/airoha/an8811h=
b/EthMD32*"
+FILES:${PN}-an8811hb =3D "${firmwaredir}/airoha/an8811hb/EthMD32*"
 RDEPENDS:${PN}-an8811hb =3D "${PN}-airoha-license"
=20
 LICENSE:${PN}-en8811h =3D "Firmware-airoha"
-FILES:${PN}-en8811h =3D "${nonarch_base_libdir}/firmware/airoha/EthMD32*=
"
+FILES:${PN}-en8811h =3D "${firmwaredir}/airoha/EthMD32*"
 RDEPENDS:${PN}-en8811h =3D "${PN}-airoha-license"
=20
 # For airoha-npu - Airoha Network Processor Unit driver
 LICENSE:${PN}-airoha-npu =3D "Firmware-airoha"
 FILES:${PN}-airoha-npu =3D " \
-    ${nonarch_base_libdir}/firmware/airoha/an7583_npu* \
-    ${nonarch_base_libdir}/firmware/airoha/en7581_npu* \
-    ${nonarch_base_libdir}/firmware/airoha/en7581_MT7996_npu* \
+    ${firmwaredir}/airoha/an7583_npu* \
+    ${firmwaredir}/airoha/en7581_npu* \
+    ${firmwaredir}/airoha/en7581_MT7996_npu* \
 "
 RDEPENDS:${PN}-airoha-npu =3D "${PN}-airoha-license"
=20
 # For ccp - Platform Security Processor (PSP) device
 LICENSE:${PN}-amd-sev-license =3D "Firmware-amd-sev"
-FILES:${PN}-amd-sev-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.amd-sev"
+FILES:${PN}-amd-sev-license =3D "${firmwaredir}/LICENSE.amd-sev"
=20
 LICENSE:${PN}-ccp =3D "Firmware-amd-sev"
-FILES:${PN}-ccp =3D "${nonarch_base_libdir}/firmware/amd/amd_sev*"
+FILES:${PN}-ccp =3D "${firmwaredir}/amd/amd_sev*"
 RDEPENDS:${PN}-ccp =3D "${PN}-amd-sev-license"
=20
 # For amdxdna - AMD Inference processor
 LICENSE:${PN}-amdnpu-license =3D "Firmware-amdnpu"
-FILES:${PN}-amdnpu-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
amdnpu"
+FILES:${PN}-amdnpu-license =3D "${firmwaredir}/LICENSE.amdnpu"
=20
 LICENSE:${PN}-amdxdna =3D "Firmware-amdnpu"
-FILES:${PN}-amdxdna =3D "${nonarch_base_libdir}/firmware/amdnpu/*"
+FILES:${PN}-amdxdna =3D "${firmwaredir}/amdnpu/*"
 RDEPENDS:${PN}-amdxdna =3D "${PN}-amdnpu-license"
=20
 # For amd_pmf - AMD Platform Management Framework TA
 LICENSE:${PN}-amd-pmf-license =3D "Firmware-amd_pmf"
-FILES:${PN}-amd-pmf-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.amd_pmf"
+FILES:${PN}-amd-pmf-license =3D "${firmwaredir}/LICENSE.amd_pmf"
=20
 LICENSE:${PN}-amd-pmf =3D "Firmware-amd_pmf"
-FILES:${PN}-amd-pmf =3D "${nonarch_base_libdir}/firmware/amdtee/*"
+FILES:${PN}-amd-pmf =3D "${firmwaredir}/amdtee/*"
 RDEPENDS:${PN}-amd-pmf =3D "${PN}-amd-pmf-license"
=20
 # For microcode_amd - AMD CPU Microcode Update Driver for Linux
 LICENSE:${PN}-amd-ucode-license =3D "Firmware-amd-ucode"
-FILES:${PN}-amd-ucode-license =3D "${nonarch_base_libdir}/firmware/LICEN=
SE.amd-ucode"
+FILES:${PN}-amd-ucode-license =3D "${firmwaredir}/LICENSE.amd-ucode"
=20
 LICENSE:${PN}-microcode-amd =3D "Firmware-amd-ucode"
-FILES:${PN}-microcode-amd =3D "${nonarch_base_libdir}/firmware/amd-ucode=
/*"
+FILES:${PN}-microcode-amd =3D "${firmwaredir}/amd-ucode/*"
 RDEPENDS:${PN}-microcode-amd =3D "${PN}-amd-ucode-license"
=20
 # For amlogic - Amlogic SoC Firmware
 LICENSE:${PN}-amlogic-license =3D "Firmware-amlogic"
-FILES:${PN}-amlogic-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.amlogic"
+FILES:${PN}-amlogic-license =3D "${firmwaredir}/LICENSE.amlogic"
=20
 LICENSE:${PN}-amlogic =3D "Firmware-amlogic"
-FILES:${PN}-amlogic =3D "${nonarch_base_libdir}/firmware/amlogic/aml_*"
+FILES:${PN}-amlogic =3D "${firmwaredir}/amlogic/aml_*"
 RDEPENDS:${PN}-amlogic =3D "${PN}-amlogic-license"
=20
 # For starfire - Adaptec Starfire/DuraLAN support
 LICENSE:${PN}-starfire =3D "GPL-2.0-only"
-FILES:${PN}-starfire =3D "${nonarch_base_libdir}/firmware/adaptec/starfi=
re*"
+FILES:${PN}-starfire =3D "${firmwaredir}/adaptec/starfire*"
=20
 # For as102 - Abilis Systems Single DVB-T Receiver
 LICENSE:${PN}-abilis-license =3D "Firmware-Abilis"
-FILES:${PN}-abilis-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
Abilis"
+FILES:${PN}-abilis-license =3D "${firmwaredir}/LICENCE.Abilis"
=20
 LICENSE:${PN}-as102 =3D "Firmware-Abilis"
-FILES:${PN}-as102 =3D "${nonarch_base_libdir}/firmware/as102_data*_st.he=
x*"
+FILES:${PN}-as102 =3D "${firmwaredir}/as102_data*_st.hex*"
 RDEPENDS:${PN}-as102 =3D "${PN}-abilis-license"
=20
 # For wilc1000 - Atmel 802.11n WLAN driver for WILC1000 & WILC3000
 LICENSE:${PN}-atmel-license =3D "Firmware-atmel"
-FILES:${PN}-atmel-license =3D "${nonarch_base_libdir}/firmware/LICENSE.a=
tmel"
+FILES:${PN}-atmel-license =3D "${firmwaredir}/LICENSE.atmel"
=20
 LICENSE:${PN}-wilc1000 =3D "Firmware-atmel"
-FILES:${PN}-wilc1000 =3D "${nonarch_base_libdir}/firmware/atmel/wilc1000=
*"
+FILES:${PN}-wilc1000 =3D "${firmwaredir}/atmel/wilc1000*"
 RDEPENDS:${PN}-wilc1000 =3D "${PN}-atmel-license"
=20
 LICENSE:${PN}-wilc3000 =3D "Firmware-atmel"
-FILES:${PN}-wilc3000 =3D "${nonarch_base_libdir}/firmware/atmel/wilc3000=
*"
+FILES:${PN}-wilc3000 =3D "${firmwaredir}/atmel/wilc3000*"
 RDEPENDS:${PN}-wilc3000 =3D "${PN}-atmel-license"
=20
 # For atusb - ATUSB IEEE 802.15.4 transceiver driver
-FILES:${PN}-atusb =3D "${nonarch_base_libdir}/firmware/atusb/*"
+FILES:${PN}-atusb =3D "${firmwaredir}/atusb/*"
 LICENSE:${PN}-atusb =3D "GPL-2.0-or-later"
=20
 # For dvb-ttpci - AV7110 cards
-FILES:${PN}-dvb-ttpci =3D "${nonarch_base_libdir}/firmware/av7110/*"
+FILES:${PN}-dvb-ttpci =3D "${firmwaredir}/av7110/*"
 LICENSE:${PN}-dvb-ttpci =3D "GPL-2.0-or-later"
=20
 # For bmi260 - Bosch BMI260 IMU configuration data
 LICENSE:${PN}-bmi260-license =3D "Firmware-bmi260"
-FILES:${PN}-bmi260-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
bmi260"
+FILES:${PN}-bmi260-license =3D "${firmwaredir}/LICENSE.bmi260"
=20
 LICENSE:${PN}-bmi260 =3D "Firmware-bmi260"
-FILES:${PN}-bmi260 =3D "${nonarch_base_libdir}/firmware/bmi260-init-data=
.fw*"
+FILES:${PN}-bmi260 =3D "${firmwaredir}/bmi260-init-data.fw*"
 RDEPENDS:${PN}-bmi260 =3D "${PN}-bmi260-license"
=20
 # For cdns-mhdp - Cadence MHDP8546 DP bridge
 LICENSE:${PN}-cadence-license =3D "Firmware-cadence"
-FILES:${PN}-cadence-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.cadence"
+FILES:${PN}-cadence-license =3D "${firmwaredir}/LICENCE.cadence"
=20
 LICENSE:${PN}-mhdp8546 =3D "Firmware-cadence"
-FILES:${PN}-mhdp8546 =3D "${nonarch_base_libdir}/firmware/cadence/mhdp85=
46.bin*"
+FILES:${PN}-mhdp8546 =3D "${firmwaredir}/cadence/mhdp8546.bin*"
 RDEPENDS:${PN}-mhdp8546 =3D "${PN}-cadence-license"
=20
 # For nitrox - Cavium CNN55XX crypto driver
 LICENSE:${PN}-cavium-license =3D "Firmware-cavium"
-FILES:${PN}-cavium-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
cavium"
+FILES:${PN}-cavium-license =3D "${firmwaredir}/LICENCE.cavium"
=20
 LICENSE:${PN}-cnn55xx =3D "Firmware-cavium"
-FILES:${PN}-cnn55xx =3D "${nonarch_base_libdir}/firmware/cavium/cnn55xx*=
"
+FILES:${PN}-cnn55xx =3D "${firmwaredir}/cavium/cnn55xx*"
 RDEPENDS:${PN}-cnn55xx =3D "${PN}-cavium-license"
=20
 # For BFA/BNA - QLogic BR-series Adapter FC/FCOE drivers
 LICENSE:${PN}-bfa-license =3D "Firmware-bfa"
-FILES:${PN}-bfa-license =3D "${nonarch_base_libdir}/firmware/LICENSE.bfa=
"
+FILES:${PN}-bfa-license =3D "${firmwaredir}/LICENSE.bfa"
=20
 LICENSE:${PN}-cbfw =3D "Firmware-bfa"
-FILES:${PN}-cbfw =3D "${nonarch_base_libdir}/firmware/cbfw-3.2.5.1.bin*"
+FILES:${PN}-cbfw =3D "${firmwaredir}/cbfw-3.2.5.1.bin*"
 RDEPENDS:${PN}-cbfw =3D "${PN}-bfa-license"
=20
 LICENSE:${PN}-ctfw =3D "Firmware-bfa"
-FILES:${PN}-ctfw =3D "${nonarch_base_libdir}/firmware/ctfw-3.2.5.1.bin*"
+FILES:${PN}-ctfw =3D "${firmwaredir}/ctfw-3.2.5.1.bin*"
 RDEPENDS:${PN}-ctfw =3D "${PN}-bfa-license"
=20
 LICENSE:${PN}-ct2fw =3D "Firmware-bfa"
-FILES:${PN}-ct2fw =3D "${nonarch_base_libdir}/firmware/ct2fw-3.2.5.1.bin=
*"
+FILES:${PN}-ct2fw =3D "${firmwaredir}/ct2fw-3.2.5.1.bin*"
 RDEPENDS:${PN}-ct2fw =3D "${PN}-bfa-license"
=20
 # For pcnet_cs - NE2000 compatible PCMCIA adapter
 FILES:${PN}-pcnet-cs =3D " \
-    ${nonarch_base_libdir}/firmware/cis/LA-PCM.cis* \
-    ${nonarch_base_libdir}/firmware/cis/PCMLM28.cis* \
-    ${nonarch_base_libdir}/firmware/cis/DP83903.cis* \
-    ${nonarch_base_libdir}/firmware/cis/NE2K.cis* \
-    ${nonarch_base_libdir}/firmware/cis/tamarack.cis* \
-    ${nonarch_base_libdir}/firmware/cis/PE-200.cis* \
-    ${nonarch_base_libdir}/firmware/cis/PE520.cis* \
+    ${firmwaredir}/cis/LA-PCM.cis* \
+    ${firmwaredir}/cis/PCMLM28.cis* \
+    ${firmwaredir}/cis/DP83903.cis* \
+    ${firmwaredir}/cis/NE2K.cis* \
+    ${firmwaredir}/cis/tamarack.cis* \
+    ${firmwaredir}/cis/PE-200.cis* \
+    ${firmwaredir}/cis/PE520.cis* \
 "
 LICENSE:${PN}-pcnet-cs =3D "GPL-2.0-only & MPL-1.1"
=20
 # For 3c589_cs - 3Com PCMCIA adapter
-FILES:${PN}-3c589-cs =3D "${nonarch_base_libdir}/firmware/cis/3CXEM556.c=
is*"
+FILES:${PN}-3c589-cs =3D "${firmwaredir}/cis/3CXEM556.cis*"
 LICENSE:${PN}-3c589-cs =3D "GPL-2.0-only & MPL-1.1"
=20
 # For 3c574-cs - 3Com PCMCIA adapter
-FILES:${PN}-3c574-cs =3D "${nonarch_base_libdir}/firmware/cis/3CCFEM556.=
cis*"
+FILES:${PN}-3c574-cs =3D "${firmwaredir}/cis/3CCFEM556.cis*"
 LICENSE:${PN}-3c574-cs =3D "GPL-2.0-only & MPL-1.1"
=20
 # For serial_cs - Serial PCMCIA adapter (pcmcia-cs project)
 FILES:${PN}-serial-cs =3D " \
-    ${nonarch_base_libdir}/firmware/cis/MT5634ZLX.cis* \
-    ${nonarch_base_libdir}/firmware/cis/RS-COM-2P.cis* \
-    ${nonarch_base_libdir}/firmware/cis/COMpad2.cis* \
-    ${nonarch_base_libdir}/firmware/cis/COMpad4.cis* \
+    ${firmwaredir}/cis/MT5634ZLX.cis* \
+    ${firmwaredir}/cis/RS-COM-2P.cis* \
+    ${firmwaredir}/cis/COMpad2.cis* \
+    ${firmwaredir}/cis/COMpad4.cis* \
 "
 LICENSE:${PN}-serial-cs =3D "GPL-2.0-only & MPL-1.1"
=20
 # For Sierra Wireless serial_cs - Serial PCMCIA adapter
 FILES:${PN}-sw-serial =3D " \
-    ${nonarch_base_libdir}/firmware/cis/SW_555_SER.cis* \
-    ${nonarch_base_libdir}/firmware/cis/SW_7xx_SER.cis* \
-    ${nonarch_base_libdir}/firmware/cis/SW_8xx_SER.cis* \
+    ${firmwaredir}/cis/SW_555_SER.cis* \
+    ${firmwaredir}/cis/SW_7xx_SER.cis* \
+    ${firmwaredir}/cis/SW_8xx_SER.cis* \
 "
 LICENSE:${PN}-sw-serial =3D "GPL-3.0-only"
=20
 # For smsmdtv - Siano MDTV Core module
 LICENSE:${PN}-siano-license =3D "Firmware-siano"
-FILES:${PN}-siano-license =3D "${nonarch_base_libdir}/firmware/LICENCE.s=
iano"
+FILES:${PN}-siano-license =3D "${firmwaredir}/LICENCE.siano"
=20
 LICENSE:${PN}-smsmdtv =3D "Firmware-siano"
 FILES:${PN}-smsmdtv =3D " \
-    ${nonarch_base_libdir}/firmware/cmmb_vega_12mhz.inp* \
-    ${nonarch_base_libdir}/firmware/cmmb_venice_12mhz.inp* \
-    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz.inp* \
-    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz_b0.inp* \
-    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz.inp* \
-    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz_b0.inp* \
-    ${nonarch_base_libdir}/firmware/isdbt_rio.inp* \
-    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-dvbt-02.fw* \
-    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-isdbt-02.fw* \
-    ${nonarch_base_libdir}/firmware/sms1xxx-nova-a-dvbt-01.fw* \
-    ${nonarch_base_libdir}/firmware/sms1xxx-nova-b-dvbt-01.fw* \
-    ${nonarch_base_libdir}/firmware/sms1xxx-stellar-dvbt-01.fw* \
-    ${nonarch_base_libdir}/firmware/tdmb_nova_12mhz.inp* \
+    ${firmwaredir}/cmmb_vega_12mhz.inp* \
+    ${firmwaredir}/cmmb_venice_12mhz.inp* \
+    ${firmwaredir}/dvb_nova_12mhz.inp* \
+    ${firmwaredir}/dvb_nova_12mhz_b0.inp* \
+    ${firmwaredir}/isdbt_nova_12mhz.inp* \
+    ${firmwaredir}/isdbt_nova_12mhz_b0.inp* \
+    ${firmwaredir}/isdbt_rio.inp* \
+    ${firmwaredir}/sms1xxx-hcw-55xxx-dvbt-02.fw* \
+    ${firmwaredir}/sms1xxx-hcw-55xxx-isdbt-02.fw* \
+    ${firmwaredir}/sms1xxx-nova-a-dvbt-01.fw* \
+    ${firmwaredir}/sms1xxx-nova-b-dvbt-01.fw* \
+    ${firmwaredir}/sms1xxx-stellar-dvbt-01.fw* \
+    ${firmwaredir}/tdmb_nova_12mhz.inp* \
 "
 RDEPENDS:${PN}-smsmdtv =3D "${PN}-siano-license"
=20
 # For cpia2 - cameras based on Vision's CPiA2
-FILES:${PN}-cpia2 =3D "${nonarch_base_libdir}/firmware/cpia2/*"
+FILES:${PN}-cpia2 =3D "${firmwaredir}/cpia2/*"
 LICENSE:${PN}-cpia2 =3D "GPL-2.0-or-later"
=20
 # For snd-hda-codec-ca0132 - Creative Sound Core3D codec
 LICENSE:${PN}-ca0132-license =3D "Firmware-ca0132"
-FILES:${PN}-ca0132-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
ca0132"
+FILES:${PN}-ca0132-license =3D "${firmwaredir}/LICENCE.ca0132"
=20
 LICENSE:${PN}-ca0132 =3D "Firmware-ca0132"
 FILES:${PN}-ca0132 =3D " \
-    ${nonarch_base_libdir}/firmware/ctefx.bin* \
-    ${nonarch_base_libdir}/firmware/ctspeq.bin* \
+    ${firmwaredir}/ctefx.bin* \
+    ${firmwaredir}/ctspeq.bin* \
 "
 RDEPENDS:${PN}-ca0132 =3D "${PN}-ca0132-license"
=20
 # For cxgb3 - Chelsio Terminator 3 1G/10G Ethernet adapter
 LICENSE:${PN}-cxgb3-license =3D "Firmware-cxgb3"
-FILES:${PN}-cxgb3-license =3D "${nonarch_base_libdir}/firmware/LICENCE.c=
xgb3"
+FILES:${PN}-cxgb3-license =3D "${firmwaredir}/LICENCE.cxgb3"
=20
 LICENSE:${PN}-cxgb3 =3D "Firmware-cxgb3 & GPL-2.0-only"
-FILES:${PN}-cxgb3 =3D "${nonarch_base_libdir}/firmware/cxgb3/*"
+FILES:${PN}-cxgb3 =3D "${firmwaredir}/cxgb3/*"
 RDEPENDS:${PN}-cxgb3 =3D "${PN}-cxgb3-license"
=20
 # For cxgb4 - Chelsio Terminator 4/5/6 1/10/25/40/100G Ethernet adapter
 LICENSE:${PN}-chelsio-firmware-license =3D "Firmware-chelsio_firmware"
-FILES:${PN}-chelsio-firmware-license =3D "${nonarch_base_libdir}/firmwar=
e/LICENCE.chelsio_firmware"
+FILES:${PN}-chelsio-firmware-license =3D "${firmwaredir}/LICENCE.chelsio=
_firmware"
=20
 LICENSE:${PN}-cxgb4 =3D "Firmware-chelsio_firmware"
-FILES:${PN}-cxgb4 =3D "${nonarch_base_libdir}/firmware/cxgb4/*"
+FILES:${PN}-cxgb4 =3D "${firmwaredir}/cxgb4/*"
 RDEPENDS:${PN}-cxgb4 =3D "${PN}-chelsio-firmware-license"
=20
 # For dabusb - Digital Audio Broadcasting (DAB) Receiver for USB and Lin=
ux
 LICENSE:${PN}-dabusb-license =3D "Firmware-dabusb"
-FILES:${PN}-dabusb-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
dabusb"
+FILES:${PN}-dabusb-license =3D "${firmwaredir}/LICENCE.dabusb"
=20
 LICENSE:${PN}-dabusb =3D "Firmware-dabusb"
-FILES:${PN}-dabusb =3D "${nonarch_base_libdir}/firmware/dabusb/*"
+FILES:${PN}-dabusb =3D "${firmwaredir}/dabusb/*"
 RDEPENDS:${PN}-dabusb =3D "${PN}-dabusb-license"
=20
 # For dsp56k - Atari DSP56k support
 LICENSE:${PN}-dsp56k =3D "GPL-2.0-or-later"
-FILES:${PN}-dsp56k =3D "${nonarch_base_libdir}/firmware/dsp56k/*"
+FILES:${PN}-dsp56k =3D "${firmwaredir}/dsp56k/*"
=20
 # For dib0700 - DiBcom dib0700 USB DVB bridge driver
 LICENSE:${PN}-dib0700-license =3D "Firmware-dib0700"
-FILES:${PN}-dib0700-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.dib0700"
+FILES:${PN}-dib0700-license =3D "${firmwaredir}/LICENSE.dib0700"
=20
 LICENSE:${PN}-dib0700 =3D "Firmware-dib0700"
-FILES:${PN}-dib0700 =3D "${nonarch_base_libdir}/firmware/dvb-usb-dib0700=
-1.20.fw*"
+FILES:${PN}-dib0700 =3D "${firmwaredir}/dvb-usb-dib0700-1.20.fw*"
 RDEPENDS:${PN}-dib0700 =3D "${PN}-dib0700-license"
=20
 # For it9135 - ITEtech IT913x DVB-T USB driver
 LICENSE:${PN}-it913x-license =3D "Firmware-it913x"
-FILES:${PN}-it913x-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
it913x"
+FILES:${PN}-it913x-license =3D "${firmwaredir}/LICENCE.it913x"
=20
 LICENSE:${PN}-it9135 =3D "Firmware-it913x"
-FILES:${PN}-it9135 =3D "${nonarch_base_libdir}/firmware/dvb-usb-it9135*"
+FILES:${PN}-it9135 =3D "${firmwaredir}/dvb-usb-it9135*"
 RDEPENDS:${PN}-it9135 =3D "${PN}-it913x-license"
=20
 # For drxk - Micronas DRX-K demodulator driver
 LICENSE:${PN}-drxk-license =3D "Firmware-drxk"
-FILES:${PN}-drxk-license =3D "${nonarch_base_libdir}/firmware/LICENSE.dr=
xk"
+FILES:${PN}-drxk-license =3D "${firmwaredir}/LICENSE.drxk"
=20
 LICENSE:${PN}-drxk =3D "Firmware-drxk"
-FILES:${PN}-drxk =3D "${nonarch_base_libdir}/firmware/dvb-usb-terratec-h=
5-drxk.fw*"
+FILES:${PN}-drxk =3D "${firmwaredir}/dvb-usb-terratec-h5-drxk.fw*"
 RDEPENDS:${PN}-drxk =3D "${PN}-drxk-license"
=20
 # For e100 - Intel PRO/100 Ethernet NIC
 LICENSE:${PN}-e100-license =3D "Firmware-e100"
-FILES:${PN}-e100-license =3D "${nonarch_base_libdir}/firmware/LICENCE.e1=
00"
+FILES:${PN}-e100-license =3D "${firmwaredir}/LICENCE.e100"
=20
 LICENSE:${PN}-e100 =3D "Firmware-e100"
-FILES:${PN}-e100 =3D "${nonarch_base_libdir}/firmware/e100/*"
+FILES:${PN}-e100 =3D "${firmwaredir}/e100/*"
 RDEPENDS:${PN}-e100 =3D "${PN}-e100-license"
=20
 # For io_ti - USB Inside Out Edgeport Serial Driver (TI Devices)
 LICENSE:${PN}-io-ti =3D "GPL-2.0-or-later"
-FILES:${PN}-io-ti =3D "${nonarch_base_libdir}/firmware/edgeport/down3.bi=
n"
+FILES:${PN}-io-ti =3D "${firmwaredir}/edgeport/down3.bin"
=20
 # For io_edgeport - USB Inside Out Edgeport Serial Driver
 LICENSE:${PN}-io-edgeport =3D "GPL-2.0-or-later"
-FILES:${PN}-io-edgeport =3D "${nonarch_base_libdir}/firmware/edgeport/*"
+FILES:${PN}-io-edgeport =3D "${firmwaredir}/edgeport/*"
=20
 # For emi26 - EMI 2|6 USB Audio interface
 LICENSE:${PN}-emi26-license =3D "Firmware-emi26"
-FILES:${PN}-emi26-license =3D "${nonarch_base_libdir}/firmware/LICENCE.e=
mi26"
+FILES:${PN}-emi26-license =3D "${firmwaredir}/LICENCE.emi26"
=20
 LICENSE:${PN}-emi26 =3D "Firmware-emi26"
-FILES:${PN}-emi26 =3D "${nonarch_base_libdir}/firmware/emi26/*"
+FILES:${PN}-emi26 =3D "${firmwaredir}/emi26/*"
 RDEPENDS:${PN}-emi26 =3D "${PN}-drxk-license"
=20
 # For ene-ub6250 - ENE UB6250 SD card reader driver
 LICENSE:${PN}-ene-firmware-license =3D "Firmware-ene_firmware"
-FILES:${PN}-ene-firmware-license =3D "${nonarch_base_libdir}/firmware/LI=
CENCE.ene_firmware"
+FILES:${PN}-ene-firmware-license =3D "${firmwaredir}/LICENCE.ene_firmwar=
e"
=20
 LICENSE:${PN}-ene-ub6250 =3D "Firmware-ene_firmware"
-FILES:${PN}-ene-ub6250 =3D "${nonarch_base_libdir}/firmware/ene-ub6250/*=
"
+FILES:${PN}-ene-ub6250 =3D "${firmwaredir}/ene-ub6250/*"
 RDEPENDS:${PN}-ene-ub6250 =3D "${PN}-ene-firmware-license"
=20
 # For go7007-s2250
 LICENSE:${PN}-sensoray-license =3D "Firmware-sensoray"
-FILES:${PN}-sensoray-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.sensoray"
+FILES:${PN}-sensoray-license =3D "${firmwaredir}/LICENCE.sensoray"
=20
 LICENSE:${PN}-go7007-s2250 =3D "Firmware-sensoray"
 FILES:${PN}-go7007-s2250 =3D " \
-    ${nonarch_base_libdir}/firmware/go7007/s2250* \
-    ${nonarch_base_libdir}/firmware/s2250* \
+    ${firmwaredir}/go7007/s2250* \
+    ${firmwaredir}/s2250* \
 "
 RDEPENDS:${PN}-go7007-s2250 =3D "${PN}-sensoray-license"
=20
 # For go7007
 LICENSE:${PN}-go7007-license =3D "Firmware-go7007"
-FILES:${PN}-go7007-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
go7007"
+FILES:${PN}-go7007-license =3D "${firmwaredir}/LICENCE.go7007"
=20
 LICENSE:${PN}-go7007 =3D "Firmware-go7007"
-FILES:${PN}-go7007 =3D "${nonarch_base_libdir}/firmware/go7007/*"
+FILES:${PN}-go7007 =3D "${firmwaredir}/go7007/*"
 RDEPENDS:${PN}-go7007 =3D "${PN}-go7007-license"
=20
 # For hfi1 - Intel OPA Gen 1 adapter
 LICENSE:${PN}-hfi1-license =3D "Firmware-hfi1_firmware"
-FILES:${PN}-hfi1-license =3D "${nonarch_base_libdir}/firmware/LICENSE.hf=
i1_firmware"
+FILES:${PN}-hfi1-license =3D "${firmwaredir}/LICENSE.hfi1_firmware"
=20
 LICENSE:${PN}-hfi1 =3D "Firmware-hfi1_firmware"
-FILES:${PN}-hfi1 =3D "${nonarch_base_libdir}/firmware/hfi1_*"
+FILES:${PN}-hfi1 =3D "${firmwaredir}/hfi1_*"
 RDEPENDS:${PN}-hfi1 =3D "${PN}-hfi1-license"
=20
 # For inside-secure - Inside Secure EIP197 crypto driver
 LICENSE:${PN}-inside-secure-license =3D "Firmware-inside-secure"
-FILES:${PN}-inside-secure-license =3D "${nonarch_base_libdir}/firmware/L=
ICENCE.inside-secure"
+FILES:${PN}-inside-secure-license =3D "${firmwaredir}/LICENCE.inside-sec=
ure"
=20
 LICENSE:${PN}-inside-secure =3D "Firmware-inside-secure"
-FILES:${PN}-inside-secure =3D "${nonarch_base_libdir}/firmware/inside-se=
cure/*"
+FILES:${PN}-inside-secure =3D "${firmwaredir}/inside-secure/*"
 RDEPENDS:${PN}-inside-secure =3D "${PN}-inside-secure-license"
=20
 # For snd_soc_catpt - Intel AudioDSP driver for HSW/BDW platforms
 LICENSE:${PN}-intcsst2-license =3D "Firmware-IntcSST2"
-FILES:${PN}-intcsst2-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.IntcSST2"
+FILES:${PN}-intcsst2-license =3D "${firmwaredir}/LICENCE.IntcSST2"
=20
 LICENSE:${PN}-snd-soc-catpt =3D "Firmware-IntcSST2"
 FILES:${PN}-snd-soc-catpt =3D " \
-    ${nonarch_base_libdir}/firmware/intel/catpt/bdw/dsp_basefw.bin* \
-    ${nonarch_base_libdir}/firmware/intel/IntcSST2.bin* \
+    ${firmwaredir}/intel/catpt/bdw/dsp_basefw.bin* \
+    ${firmwaredir}/intel/IntcSST2.bin* \
 "
 RDEPENDS:${PN}-snd-soc-catpt =3D "${PN}-intcsst2-license"
=20
 # For snd_intel_sst_core
 LICENSE:${PN}-fw-sst-0f28-license =3D "Firmware-fw_sst_0f28"
-FILES:${PN}-fw-sst-0f28-license =3D "${nonarch_base_libdir}/firmware/LIC=
ENCE.fw_sst_0f28"
+FILES:${PN}-fw-sst-0f28-license =3D "${firmwaredir}/LICENCE.fw_sst_0f28"
=20
 LICENSE:${PN}-snd-intel-sst-core =3D "Firmware-fw_sst_0f28"
-FILES:${PN}-snd-intel-sst-core =3D "${nonarch_base_libdir}/firmware/inte=
l/fw_sst_*"
+FILES:${PN}-snd-intel-sst-core =3D "${firmwaredir}/intel/fw_sst_*"
 RDEPENDS:${PN}-snd-intel-sst-core =3D "${PN}-fw-sst-0f28-license"
=20
 # For atomisp - Intel IPU2 (Image Processing Unit 2) driver
 LICENSE:${PN}-ivsc-license =3D "Firmware-ivsc"
-FILES:${PN}-ivsc-license =3D "${nonarch_base_libdir}/firmware/LICENSE.iv=
sc"
+FILES:${PN}-ivsc-license =3D "${firmwaredir}/LICENSE.ivsc"
=20
 LICENSE:${PN}-atomisp =3D "Firmware-ivsc"
-FILES:${PN}-atomisp =3D "${nonarch_base_libdir}/firmware/intel/ipu/shisp=
_240*"
+FILES:${PN}-atomisp =3D "${firmwaredir}/intel/ipu/shisp_240*"
 RDEPENDS:${PN}-atomisp =3D "${PN}-ivsc-license"
=20
 # For intel-ipu6-isys - Intel IPU6 (Image Processing Unit 6) driver
 LICENSE:${PN}-intel-ipu6-isys =3D "Firmware-ivsc"
-FILES:${PN}-intel-ipu6-isys =3D "${nonarch_base_libdir}/firmware/intel/i=
pu/ipu6*"
+FILES:${PN}-intel-ipu6-isys =3D "${firmwaredir}/intel/ipu/ipu6*"
 RDEPENDS:${PN}-intel-ipu6-isys =3D "${PN}-ivsc-license"
=20
 # For mei-vsc-hw - Intel Visual Sensing Controller
 LICENSE:${PN}-mei-vsc-hw =3D "Firmware-ivsc"
-FILES:${PN}-mei-vsc-hw =3D "${nonarch_base_libdir}/firmware/intel/vsc/*"
+FILES:${PN}-mei-vsc-hw =3D "${firmwaredir}/intel/vsc/*"
 RDEPENDS:${PN}-mei-vsc-hw =3D "${PN}-ivsc-license"
=20
 # For ipu3-imgu - Intel IPU3 (3rd Gen Image Processing Unit) driver
 LICENSE:${PN}-ipu3-firmware-license =3D "Firmware-ipu3_firmware"
-FILES:${PN}-ipu3-firmware-license =3D "${nonarch_base_libdir}/firmware/L=
ICENSE.ipu3_firmware"
+FILES:${PN}-ipu3-firmware-license =3D "${firmwaredir}/LICENSE.ipu3_firmw=
are"
=20
 LICENSE:${PN}-ipu3-imgu =3D "Firmware-ipu3_firmware"
 FILES:${PN}-ipu3-imgu =3D " \
-    ${nonarch_base_libdir}/firmware/intel/ipu/irci_irci_ecr-master_20161=
208_0213_20170112_1500.bin* \
-    ${nonarch_base_libdir}/firmware/intel/ipu3-fw.bin* \
-    ${nonarch_base_libdir}/firmware/intel/irci_irci_ecr-master_20161208_=
0213_20170112_1500.bin* \
+    ${firmwaredir}/intel/ipu/irci_irci_ecr-master_20161208_0213_20170112=
_1500.bin* \
+    ${firmwaredir}/intel/ipu3-fw.bin* \
+    ${firmwaredir}/intel/irci_irci_ecr-master_20161208_0213_20170112_150=
0.bin* \
 "
 RDEPENDS:${PN}-ipu3-imgu =3D "${PN}-ipu3-firmware-license"
=20
 # For intel-ipu7-isys - Intel IPU7 (Image Processing Unit 7) driver
 LICENSE:${PN}-intel-ipu7-isys =3D "Firmware-intel"
-FILES:${PN}-intel-ipu7-isys =3D "${nonarch_base_libdir}/firmware/intel/i=
pu/ipu7*"
+FILES:${PN}-intel-ipu7-isys =3D "${firmwaredir}/intel/ipu/ipu7*"
 RDEPENDS:${PN}-intel-ipu7-isys =3D "${PN}-intel-license"
=20
 # For intel_vpu - Intel NPU driver
 LICENSE:${PN}-intel-vpu-license =3D "Firmware-intel_vpu"
-FILES:${PN}-intel-vpu-license =3D "${nonarch_base_libdir}/firmware/LICEN=
SE.intel_vpu"
+FILES:${PN}-intel-vpu-license =3D "${firmwaredir}/LICENSE.intel_vpu"
=20
 LICENSE:${PN}-intel-vpu =3D "Firmware-intel_vpu"
-FILES:${PN}-intel-vpu =3D "${nonarch_base_libdir}/firmware/intel/vpu/*"
+FILES:${PN}-intel-vpu =3D "${firmwaredir}/intel/vpu/*"
 RDEPENDS:${PN}-intel-vpu =3D "${PN}-intel-vpu-license"
=20
 # For isci - Intel C600 SAS controller driver
 LICENSE:${PN}-isci =3D "GPL-2.0-only"
-FILES:${PN}-isci =3D "${nonarch_base_libdir}/firmware/isci/*"
+FILES:${PN}-isci =3D "${firmwaredir}/isci/*"
=20
 # For ixp4xx-npe - Intel IXP4xx XScale Network Processing Engine (NPE) F=
irmware
 LICENSE:${PN}-ixp4xx-license =3D "Firmware-ixp4xx"
-FILES:${PN}-ixp4xx-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
ixp4xx"
+FILES:${PN}-ixp4xx-license =3D "${firmwaredir}/LICENSE.ixp4xx"
=20
 LICENSE:${PN}-ixp4xx-npe =3D "Firmware-ixp4xx"
-FILES:${PN}-ixp4xx-npe =3D "${nonarch_base_libdir}/firmware/ixp4xx/*"
+FILES:${PN}-ixp4xx-npe =3D "${firmwaredir}/ixp4xx/*"
 RDEPENDS:${PN}-ixp4xx-npe =3D "${PN}-ixp4xx-license"
=20
 # For kaweth - USB KLSI KL5USB101-based Ethernet device
 LICENSE:${PN}-kaweth-license =3D "Firmware-kaweth"
-FILES:${PN}-kaweth-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
kaweth"
+FILES:${PN}-kaweth-license =3D "${firmwaredir}/LICENCE.kaweth"
=20
 LICENSE:${PN}-kaweth =3D "Firmware-kaweth"
-FILES:${PN}-kaweth =3D "${nonarch_base_libdir}/firmware/kaweth/*"
+FILES:${PN}-kaweth =3D "${firmwaredir}/kaweth/*"
 RDEPENDS:${PN}-kaweth =3D "${PN}-kaweth-license"
=20
 # For keyspan - USB Keyspan USA-xxx serial device
 LICENSE:${PN}-keyspan-license =3D "Firmware-keyspan"
-FILES:${PN}-keyspan-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.keyspan"
+FILES:${PN}-keyspan-license =3D "${firmwaredir}/LICENCE.keyspan"
=20
 LICENSE:${PN}-keyspan =3D "Firmware-keyspan"
-FILES:${PN}-keyspan =3D "${nonarch_base_libdir}/firmware/keyspan/*"
+FILES:${PN}-keyspan =3D "${firmwaredir}/keyspan/*"
 RDEPENDS:${PN}-keyspan =3D "${PN}-keyspan-license"
=20
 # For keyspan_pda - USB Keyspan PDA single-port serial device
 LICENSE:${PN}-keyspan-pda =3D "GPL-2.0-or-later"
-FILES:${PN}-keyspan-pda =3D "${nonarch_base_libdir}/firmware/keyspan_pda=
/*"
+FILES:${PN}-keyspan-pda =3D "${firmwaredir}/keyspan_pda/*"
=20
 # For mga - Matrox G200/G400/G550
 LICENSE:${PN}-mga-license =3D "Firmware-mga"
-FILES:${PN}-mga-license =3D "${nonarch_base_libdir}/firmware/LICENSE.mga=
"
+FILES:${PN}-mga-license =3D "${firmwaredir}/LICENSE.mga"
=20
 LICENSE:${PN}-mga =3D "Firmware-mga"
-FILES:${PN}-mga =3D "${nonarch_base_libdir}/firmware/matrox/*"
+FILES:${PN}-mga =3D "${firmwaredir}/matrox/*"
 RDEPENDS:${PN}-mga =3D "${PN}-mga-license"
=20
 # For myri10ge - Myri10GE 10GbE NIC driver
 LICENSE:${PN}-myri10ge-firmware-license =3D "Firmware-myri10ge_firmware"
-FILES:${PN}-myri10ge-firmware-license =3D "${nonarch_base_libdir}/firmwa=
re/LICENCE.myri10ge_firmware"
+FILES:${PN}-myri10ge-firmware-license =3D "${firmwaredir}/LICENCE.myri10=
ge_firmware"
=20
 LICENSE:${PN}-myri10ge =3D "Firmware-myri10ge_firmware"
-FILES:${PN}-myri10ge =3D "${nonarch_base_libdir}/firmware/myri10ge_*"
+FILES:${PN}-myri10ge =3D "${firmwaredir}/myri10ge_*"
 RDEPENDS:${PN}-myri10ge =3D "${PN}-myri10ge-firmware-license"
=20
 # For smc91c92_cs - SMC 91Cxx PCMCIA
 LICENSE:${PN}-smc91c92-cs =3D "GPL-1.0-only"
-FILES:${PN}-smc91c92-cs =3D "${nonarch_base_libdir}/firmware/ositech/Xil=
inx7OD.bin*"
+FILES:${PN}-smc91c92-cs =3D "${firmwaredir}/ositech/Xilinx7OD.bin*"
=20
 # For qla1280 - Qlogic QLA 1240/1x80/1x160 SCSI support
 LICENSE:${PN}-qla1280-license =3D "Firmware-qla1280"
-FILES:${PN}-qla1280-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.qla1280"
+FILES:${PN}-qla1280-license =3D "${firmwaredir}/LICENCE.qla1280"
=20
 LICENSE:${PN}-qla1280 =3D "Firmware-qla1280"
 FILES:${PN}-qla1280 =3D " \
-    ${nonarch_base_libdir}/firmware/qlogic/1040.bin* \
-    ${nonarch_base_libdir}/firmware/qlogic/1280.bin* \
-    ${nonarch_base_libdir}/firmware/qlogic/12160.bin* \
+    ${firmwaredir}/qlogic/1040.bin* \
+    ${firmwaredir}/qlogic/1280.bin* \
+    ${firmwaredir}/qlogic/12160.bin* \
 "
 RDEPENDS:${PN}-qla1280 =3D "${PN}-qla1280-license"
=20
 # For ib_qib - QLogic Infiniband
 LICENSE:${PN}-ib-qib-license =3D "Firmware-ib_qib"
-FILES:${PN}-ib-qib-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
ib_qib"
+FILES:${PN}-ib-qib-license =3D "${firmwaredir}/LICENSE.ib_qib"
=20
 LICENSE:${PN}-ib-qib =3D "Firmware-ib_qib"
-FILES:${PN}-ib-qib =3D "${nonarch_base_libdir}/firmware/qlogic/sd7220.fw=
*"
+FILES:${PN}-ib-qib =3D "${firmwaredir}/qlogic/sd7220.fw*"
 RDEPENDS:${PN}-ib-qib =3D "${PN}-ib-qib-license"
=20
 # For xhci-rcar - Renesas R-Car Gen2/3 USB 3.0 host controller driver
 LICENSE:${PN}-r8a779x-usb3-license =3D "Firmware-r8a779x_usb3"
-FILES:${PN}-r8a779x-usb3-license =3D "${nonarch_base_libdir}/firmware/LI=
CENCE.r8a779x_usb3"
+FILES:${PN}-r8a779x-usb3-license =3D "${firmwaredir}/LICENCE.r8a779x_usb=
3"
=20
 LICENSE:${PN}-xhci-rcar =3D "Firmware-r8a779x_usb3"
-FILES:${PN}-xhci-rcar =3D "${nonarch_base_libdir}/firmware/r8a779x_usb3_=
*"
+FILES:${PN}-xhci-rcar =3D "${firmwaredir}/r8a779x_usb3_*"
 RDEPENDS:${PN}-xhci-rcar =3D "${PN}-r8a779x-usb3-license"
=20
 # For pcie-rcar-gen4 - Renesas R-Car Gen4 PCIe driver
 LICENSE:${PN}-r8a779g-pcie-phy-license =3D "Firmware-r8a779g_pcie_phy"
-FILES:${PN}-r8a779g-pcie-phy-license =3D "${nonarch_base_libdir}/firmwar=
e/LICENCE.r8a779g_pcie_phy"
+FILES:${PN}-r8a779g-pcie-phy-license =3D "${firmwaredir}/LICENCE.r8a779g=
_pcie_phy"
=20
 LICENSE:${PN}-pcie-rcar =3D "Firmware-r8a779g_pcie_phy"
-FILES:${PN}-pcie-rcar =3D "${nonarch_base_libdir}/firmware/rcar_gen4_pci=
e.bin*"
+FILES:${PN}-pcie-rcar =3D "${firmwaredir}/rcar_gen4_pcie.bin*"
 RDEPENDS:${PN}-pcie-rcar =3D "${PN}-r8a779g-pcie-phy-license"
=20
 # For r128 - ATI Rage 128
 LICENSE:${PN}-r128 =3D "MIT"
-FILES:${PN}-r128 =3D "${nonarch_base_libdir}/firmware/r128/*"
+FILES:${PN}-r128 =3D "${firmwaredir}/r128/*"
=20
 # For rt1320 - Realtek rt1320 ASoC audio driver.
 LICENSE:${PN}-rt1320-license =3D "Firmware-rt1320"
-FILES:${PN}-rt1320-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
rt1320"
+FILES:${PN}-rt1320-license =3D "${firmwaredir}/LICENSE.rt1320"
=20
 LICENSE:${PN}-rt1320 =3D "Firmware-rt1320"
-FILES:${PN}-rt1320 =3D "${nonarch_base_libdir}/firmware/realtek/rt1320/*=
"
+FILES:${PN}-rt1320 =3D "${firmwaredir}/realtek/rt1320/*"
 RDEPENDS:${PN}-rt1320 =3D "${PN}-rt1320-license"
=20
 # For rp2 - Comtrol RocketPort 2 serial driver
 LICENSE:${PN}-rp2-license =3D "Firmware-rp2"
-FILES:${PN}-rp2-license =3D "${nonarch_base_libdir}/firmware/LICENSE.rp2=
"
+FILES:${PN}-rp2-license =3D "${firmwaredir}/LICENSE.rp2"
=20
 LICENSE:${PN}-rp2 =3D "Firmware-rp2"
-FILES:${PN}-rp2 =3D "${nonarch_base_libdir}/firmware/rp2.fw*"
+FILES:${PN}-rp2 =3D "${firmwaredir}/rp2.fw*"
 RDEPENDS:${PN}-rp2 =3D "${PN}-rp2-license"
=20
 # For s5p-mfc - Samsung MFC video encoder/decoder driver
 LICENSE:${PN}-s5p-mfc-license =3D "Firmware-s5p-mfc"
-FILES:${PN}-s5p-mfc-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.s5p-mfc"
+FILES:${PN}-s5p-mfc-license =3D "${firmwaredir}/LICENSE.s5p-mfc"
=20
 LICENSE:${PN}-s5p-mfc =3D "Firmware-s5p-mfc"
-FILES:${PN}-s5p-mfc =3D "${nonarch_base_libdir}/firmware/s5p-mfc*"
+FILES:${PN}-s5p-mfc =3D "${firmwaredir}/s5p-mfc*"
 RDEPENDS:${PN}-s5p-mfc =3D "${PN}-s5p-mfc-license"
=20
 # For snd-sb16-csp - Sound Blaster 16/AWE CSP support
 LICENSE:${PN}-snd-sb16-csp =3D "GPL-2.0-or-later"
-FILES:${PN}-snd-sb16-csp =3D "${nonarch_base_libdir}/firmware/sb16/*"
+FILES:${PN}-snd-sb16-csp =3D "${firmwaredir}/sb16/*"
=20
 # For slicoss - Alacritech IS-NIC products
 LICENSE:${PN}-alacritech-license =3D "Firmware-alacritech"
-FILES:${PN}-alacritech-license =3D "${nonarch_base_libdir}/firmware/LICE=
NCE.alacritech"
+FILES:${PN}-alacritech-license =3D "${firmwaredir}/LICENCE.alacritech"
=20
 LICENSE:${PN}-slicoss =3D "Firmware-alacritech"
-FILES:${PN}-slicoss =3D "${nonarch_base_libdir}/firmware/slicoss/*"
+FILES:${PN}-slicoss =3D "${firmwaredir}/slicoss/*"
 RDEPENDS:${PN}-slicoss =3D "${PN}-alacritech-license"
=20
 LICENSE:${PN}-sxg =3D "Firmware-alacritech"
-FILES:${PN}-sxg =3D "${nonarch_base_libdir}/firmware/sxg/*"
+FILES:${PN}-sxg =3D "${firmwaredir}/sxg/*"
 RDEPENDS:${PN}-sxg =3D "${PN}-alacritech-license"
=20
 # For tehuti - Tehuti Networks 10G Ethernet
 LICENSE:${PN}-tehuti-license =3D "Firmware-tehuti"
-FILES:${PN}-tehuti-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
tehuti"
+FILES:${PN}-tehuti-license =3D "${firmwaredir}/LICENSE.tehuti"
=20
 LICENSE:${PN}-tehuti =3D "Firmware-tehuti"
-FILES:${PN}-tehuti =3D "${nonarch_base_libdir}/firmware/tehuti/*"
+FILES:${PN}-tehuti =3D "${firmwaredir}/tehuti/*"
 RDEPENDS:${PN}-tehuti =3D "${PN}-tehuti-license"
=20
 # For tg3 - Broadcom Tigon3 based gigabit Ethernet cards
 LICENSE:${PN}-tigon-license =3D "Firmware-tigon"
-FILES:${PN}-tigon-license =3D "${nonarch_base_libdir}/firmware/LICENCE.t=
igon"
+FILES:${PN}-tigon-license =3D "${firmwaredir}/LICENCE.tigon"
=20
 LICENSE:${PN}-tg3 =3D "Firmware-tigon"
-FILES:${PN}-tg3 =3D "${nonarch_base_libdir}/firmware/tigon/*"
+FILES:${PN}-tg3 =3D "${firmwaredir}/tigon/*"
 RDEPENDS:${PN}-tg3 =3D "${PN}-tigon-license"
=20
 # For tlg2300 - Telgent 2300 V4L/DVB driver.
 LICENSE:${PN}-tlg2300-license =3D "Firmware-tlg2300"
-FILES:${PN}-tlg2300-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.tlg2300"
+FILES:${PN}-tlg2300-license =3D "${firmwaredir}/LICENSE.tlg2300"
=20
 LICENSE:${PN}-tlg2300 =3D "Firmware-tlg2300"
-FILES:${PN}-tlg2300 =3D "${nonarch_base_libdir}/firmware/tlg2300*"
+FILES:${PN}-tlg2300 =3D "${firmwaredir}/tlg2300*"
 RDEPENDS:${PN}-tlg2300 =3D "${PN}-tlg2300-license"
=20
 # For Mont-TSSE - Mont-TSSE(TM) Crypto Algorithm Accelerator Driver
 LICENSE:${PN}-montage-license =3D "Firmware-montage"
-FILES:${PN}-montage-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.montage"
+FILES:${PN}-montage-license =3D "${firmwaredir}/LICENSE.montage"
=20
 LICENSE:${PN}-mont-tsse =3D "Firmware-montage"
-FILES:${PN}-mont-tsse =3D "${nonarch_base_libdir}/firmware/tsse_firmware=
.bin*"
+FILES:${PN}-mont-tsse =3D "${firmwaredir}/tsse_firmware.bin*"
 RDEPENDS:${PN}-mont-tsse =3D "${PN}-montage-license"
=20
 # For ueagle-atm - Driver for USB ADSL Modems based on Eagle IV Chipset
 LICENSE:${PN}-ueagle-atm4-firmware-license =3D "Firmware-ueagle-atm4-fir=
mware"
-FILES:${PN}-ueagle-atm4-firmware-license =3D "${nonarch_base_libdir}/fir=
mware/LICENCE.ueagle-atm4-firmware"
+FILES:${PN}-ueagle-atm4-firmware-license =3D "${firmwaredir}/LICENCE.uea=
gle-atm4-firmware"
=20
 LICENSE:${PN}-ueagle-atm =3D "Firmware-ueagle-atm4-firmware"
 FILES:${PN}-ueagle-atm =3D " \
-    ${nonarch_base_libdir}/firmware/ueagle-atm/CMV4p.bin.v2* \
-    ${nonarch_base_libdir}/firmware/ueagle-atm/DSP4p.bin* \
-    ${nonarch_base_libdir}/firmware/ueagle-atm/eagleIV.fw* \
+    ${firmwaredir}/ueagle-atm/CMV4p.bin.v2* \
+    ${firmwaredir}/ueagle-atm/DSP4p.bin* \
+    ${firmwaredir}/ueagle-atm/eagleIV.fw* \
 "
 RDEPENDS:${PN}-ueagle-atm =3D "${PN}-ueagle-atm4-firmware-license"
=20
 # For usbdux/usbduxfast/usbduxsigma - usbdux data acquisition cards
 LICENSE:${PN}-usbdux =3D "GPL-2.0-or-later"
-FILES:${PN}-usbdux =3D "${nonarch_base_libdir}/firmware/usbdux*"
+FILES:${PN}-usbdux =3D "${firmwaredir}/usbdux*"
=20
 # For cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
 LICENSE:${PN}-conexant-license =3D "Firmware-conexant"
-FILES:${PN}-conexant-license =3D "${nonarch_base_libdir}/firmware/LICENS=
E.conexant"
+FILES:${PN}-conexant-license =3D "${firmwaredir}/LICENSE.conexant"
=20
 LICENSE:${PN}-cx231xx =3D "Firmware-conexant"
-FILES:${PN}-cx231xx =3D "${nonarch_base_libdir}/firmware/v4l-cx231xx*"
+FILES:${PN}-cx231xx =3D "${firmwaredir}/v4l-cx231xx*"
 RDEPENDS:${PN}-cx231xx =3D "${PN}-conexant-license"
=20
 LICENSE:${PN}-cx23418 =3D "Firmware-conexant"
-FILES:${PN}-cx23418 =3D "${nonarch_base_libdir}/firmware/v4l-cx23418*"
+FILES:${PN}-cx23418 =3D "${firmwaredir}/v4l-cx23418*"
 RDEPENDS:${PN}-cx23418 =3D "${PN}-conexant-license"
=20
 LICENSE:${PN}-cx23885 =3D "Firmware-conexant"
-FILES:${PN}-cx23885 =3D "${nonarch_base_libdir}/firmware/v4l-cx23885*"
+FILES:${PN}-cx23885 =3D "${firmwaredir}/v4l-cx23885*"
 RDEPENDS:${PN}-cx23885 =3D "${PN}-conexant-license"
=20
 LICENSE:${PN}-cx23840 =3D "Firmware-conexant"
-FILES:${PN}-cx23840 =3D "${nonarch_base_libdir}/firmware/v4l-cx25840*"
+FILES:${PN}-cx23840 =3D "${firmwaredir}/v4l-cx25840*"
 RDEPENDS:${PN}-cx23840 =3D "${PN}-conexant-license"
=20
 # For vxge - Exar X3100 Series 10GbE PCIe I/O Virtualized Server Adapter
 LICENSE:${PN}-vxge-license =3D "Firmware-vxge"
-FILES:${PN}-vxge-license =3D "${nonarch_base_libdir}/firmware/LICENSE.vx=
ge"
+FILES:${PN}-vxge-license =3D "${firmwaredir}/LICENSE.vxge"
=20
 LICENSE:${PN}-vxge =3D "Firmware-vxge"
-FILES:${PN}-vxge =3D "${nonarch_base_libdir}/firmware/vxge/*"
+FILES:${PN}-vxge =3D "${firmwaredir}/vxge/*"
 RDEPENDS:${PN}-vxge =3D "${PN}-vxge-license"
=20
 # For whiteheat - USB ConnectTech WhiteHEAT serial device
 LICENSE:${PN}-whiteheat =3D "GPL-2.0-only"
-FILES:${PN}-whiteheat =3D "${nonarch_base_libdir}/firmware/whiteheat*"
+FILES:${PN}-whiteheat =3D "${firmwaredir}/whiteheat*"
=20
 LICENSE:${PN}-wil6210 =3D "Firmware-qualcommAthos_ath10k"
-FILES:${PN}-wil6210 =3D "${nonarch_base_libdir}/firmware/wil6210*"
+FILES:${PN}-wil6210 =3D "${firmwaredir}/wil6210*"
 RDEPENDS:${PN}-wil6210 =3D "${PN}-ath10k-license"
=20
 # For xe - Intel Graphics driver
 LICENSE:${PN}-xe-license =3D "Firmware-xe"
-FILES:${PN}-xe-license =3D "${nonarch_base_libdir}/firmware/LICENSE.xe"
+FILES:${PN}-xe-license =3D "${firmwaredir}/LICENSE.xe"
=20
 LICENSE:${PN}-xe =3D "Firmware-xe"
-FILES:${PN}-xe =3D "${nonarch_base_libdir}/firmware/xe/*"
+FILES:${PN}-xe =3D "${firmwaredir}/xe/*"
 RDEPENDS:${PN}-xe =3D "${PN}-xe-license"
=20
 # For other firmwares
@@ -3588,7 +3588,7 @@ LICENSE:${PN} =3D "\
 FILES:${PN} =3D ""
 ALLOW_EMPTY:${PN} =3D "1"
=20
-FILES:${PN}-license +=3D "${nonarch_base_libdir}/firmware/LICEN*"
+FILES:${PN}-license +=3D "${firmwaredir}/LICEN*"
 RDEPENDS:${PN} +=3D "${PN}-license"
 RDEPENDS:${PN} +=3D "${PN}-whence-license"
=20
@@ -3637,4 +3637,4 @@ INSANE_SKIP +=3D "ldflags"
 INSANE_SKIP:${PN} =3D "already-stripped"
=20
 # No need to put firmware into the sysroot
-SYSROOT_DIRS_IGNORE +=3D "${nonarch_base_libdir}/firmware"
+SYSROOT_DIRS_IGNORE +=3D "${firmwaredir}"
--=20
2.43.0


