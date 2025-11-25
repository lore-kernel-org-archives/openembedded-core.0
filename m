Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E34CFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:07:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13148.1764061661054798319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hlTPWXbC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2geI01847623
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 09:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PRVyI3Kwi0+VC/IJrLU7qD
	UjqWflGlV2zJHqoGN96Fk=; b=hlTPWXbC/pXuuJ8PDRttWfAMgQ30QwITqy5zx5
	csBPeh7Tvhc3MHYfbAuavz9dgnzUE57olHzdnHP2LRh1e5xek0+yeG0/4viNrYk8
	R38fd3GsN1yXohorL4iKsIgsDfzmtwW5m9OCN5UTIHYtizaHB/GaOYK7DFMRravT
	7u3uXPMS7VPCc9w1LQfxXYSKq06mEDoKOvc3qXLMgCsMO3Et3CkYt0oEyrj8eCAn
	fdXVzfTIolzvkSHS5NcvfDiCjLrM5EEsqRIlCq6U3Kpsr/thLXowhKBbFTGD82sB
	RU573AjFg7/TkY8G9tMYzvNt8s3T4YenT4kTFfmysxnlcg+A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qaf5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 09:07:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AP97bDg003238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 09:07:37 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 25 Nov 2025 01:07:36 -0800
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH v4] udev-extraconf: Split automount and autonet into seperate packages
Date: Tue, 25 Nov 2025 14:37:22 +0530
Message-ID: <20251125090722.2240655-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zrrpU9E4pZTmIWSUJhhk3hxpMJwbiO8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA3MyBTYWx0ZWRfXwZNCZGZeJQPs
 i5x2+585yxSVptcPRe2pbhbxivZ+xWDYKvihCmnFG6yhtTGKceNaqzJLuEkwdPJzfgYXiHFWVwm
 GRjRNh7Rhae2d3MZXcRuWooZo39RrxUufzlIZcr1IMO28dZjp9gh8xwxVvm6cVWUeEV9Ep27O3v
 k3Shsh6Bj8ogwMGlCCBTn34K1f2LOuj5E/2yg6QUvN6ka7jEsPLOBre7P2YHFSeDHa7RJdguMBz
 wUc6AbPg2Kj2T11eblCC+rFeiof2YUBgSr7PHBce+Yem0LmqxCxo1CLrg027cDuVPmIk0ZlxYn9
 IKQL8OL4dYzQYDQlHHHmdSyZ9cSuwcTnIEJ7i0f8Y3/acys4By+ck3X2FZvwLNSoPqYN1wIv15A
 pirAg+DXOpBokMkYahEMMpq8BgQGvA==
X-Proofpoint-GUID: zrrpU9E4pZTmIWSUJhhk3hxpMJwbiO8b
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=692571da cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5BUBf6riorUkBbOJn3oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 09:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226759

Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
udev rules and scripts for automount and autonet functionality.

If the image only needs storage devices to be auto-mounted or just needs
network hotplug handling, splitting the packages let us choose automount or
autonet package without having to care about other rules. This change does not
save much space but helps avoid installing unnecessary scripts and rules.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
---
 meta/recipes-core/udev/udev-extraconf_1.1.bb | 25 ++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 2ba6606c05..1353d35de2 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -40,22 +40,39 @@ do_install() {
     install -m 0755 ${S}/network.sh ${D}${sysconfdir}/udev/scripts
 }
 
-pkg_postinst:${PN} () {
+PACKAGES =+ "${PN}-automount ${PN}-autonet"
+
+FILES:${PN}-automount = " \
+    ${sysconfdir}/udev/rules.d/automount.rules \
+    ${sysconfdir}/udev/scripts/mount.sh \
+    ${sysconfdir}/udev/mount.ignorelist \
+"
+
+RDEPENDS:${PN}-automount = "udev util-linux-blkid ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'util-linux-lsblk', '', d)}"
+CONFFILES:${PN}-automount = "${sysconfdir}/udev/mount.ignorelist"
+
+pkg_postinst:${PN}-automount () {
 	if [ -e $D${systemd_unitdir}/system/systemd-udevd.service ]; then
 		sed -i "/\[Service\]/aMountFlags=shared" $D${systemd_unitdir}/system/systemd-udevd.service
 	fi
 }
 
-pkg_postrm:${PN} () {
+pkg_postrm:${PN}-automount () {
 	if [ -e $D${systemd_unitdir}/system/systemd-udevd.service ]; then
 		sed -i "/MountFlags=shared/d" $D${systemd_unitdir}/system/systemd-udevd.service
 	fi
 }
 
-RDEPENDS:${PN} = "udev util-linux-blkid ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'util-linux-lsblk', '', d)}"
-CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
+FILES:${PN}-autonet = " \
+    ${sysconfdir}/udev/rules.d/autonet.rules \
+    ${sysconfdir}/udev/scripts/network.sh \
+"
+
+RDEPENDS:${PN}-autonet = "udev"
 
 # to replace udev-extra-rules from meta-oe
 RPROVIDES:${PN} = "udev-extra-rules"
 RREPLACES:${PN} = "udev-extra-rules"
 RCONFLICTS:${PN} = "udev-extra-rules"
+
+RDEPENDS:${PN} = "${PN}-automount ${PN}-autonet"
-- 
2.34.1


