Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD800CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 07:33:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3824.1782268521714095958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 19:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=A5iFDbxw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: shoudil@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1TSXF1860956
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 02:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dSygryroziMSEElOxsbcWn
	+3OYERw1+ynGoc7Eb1sk4=; b=A5iFDbxwRyIuBNBNvoThAXZ+sY86Fpgh7c+pnN
	8WZwlyccrINQuglX1sYDXRMq5RUzulVz1D+c9Zd8B8kRz/S+L3/wD5CWotQkGkIS
	JVPGh8PK7LLoE23Ly1BZUYWpSNsDabFkiAyNM8+kAdd6JsCI1q8ulQZWtKMdeECU
	g+UtTBZKyIrF++vbe+Ns2hWqnCEgSO9rkuS2cnAu1r0RMtz51BEWt2OOyfuTftEX
	xG4LOVYAjrdgeWs09fkAwjCf0SWJmCSHAiXINcZE3rFkUHMG0PMP+G6C6QQ5GPU5
	jQb7D1ctR7KWc8d2JLRv86uSDTtpBP8DiTSY0qrzCfcZzFfw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar06aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 02:35:20 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65O2ZGqm018304;
	Wed, 24 Jun 2026 02:35:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ewkxjb2sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 02:35:16 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65O2ZG2t018296
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 02:35:16 GMT
Received: from shoudil2-gv.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 65O2ZGah018292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 02:35:16 +0000 (GMT)
Received: by shoudil2-gv.qualcomm.com (Postfix, from userid 367460)
	id 34A9A4AAD8; Wed, 24 Jun 2026 10:35:15 +0800 (CST)
From: "Shoudi Li" <shoudil@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Shoudi Li <shoudil@qti.qualcomm.com>
Subject: [PATCH] uki.bbclass: add merge logic in dtb section
Date: Wed, 24 Jun 2026 10:35:06 +0800
Message-ID: <20260624023506.1474514-1-shoudil@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: DfcHixpnH2kEFavQYQi3lkcqna3aFxrT
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3b4268 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zmJVSft2TCmtUwwfddkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyMCBTYWx0ZWRfXx7+Dvmrxrmro
 ZQOzmNB/e88snYUWPQCZgxSpUYPm+kp9okfdbQZa1/kSwWa2qSQ00CmuOP2eksMr37P4csnOiAP
 5F9z2cj+5u2y/s3vytn+i4fwJF3UzUc=
X-Proofpoint-GUID: DfcHixpnH2kEFavQYQi3lkcqna3aFxrT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyMCBTYWx0ZWRfX7b1StuGwBJYr
 WBA00Jk5A+Y4tONWOz8oB260sHHXprugcyq8CizcdNcm+3zrgDDxAo04QB1OOEF/1RfJDqvOaE3
 VIyHmWOG1amGenwHEthxnv1KJmJpxHwFsXbYIZag9Bs2xxUnCczY3diGXu0d94eUQE8Rm21Diys
 zbqwhVr9pWOdUa4UEWTaKGULPCtZuNf0hp4zbFW9iGdao/oakAZGBb265FhbyAxHjEJNYimm1bT
 +4GJ+qV7EaGgBgfOG2zBPNixDAhhy6l9jRwkOku0UktRO1Q9K6Gmq/ml53oHqVbdrQK4n7jikT3
 gSt7HfZSf37ntTrNeglSBp6/Ue166G2UcIAduM0elpTRLO4KH1kiioiq9rcVCOArT8/FMbxlplQ
 YPkgwjJZsBxkJMCvqIRZ5D+hCTUpH5xEwpqbf5mMFROc+0Rzaw6gf+Ew/CxrvIHFDlM3kIJasMx
 PA5b6JqM49NSthyKrvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240020
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 65O1TSXF1860956
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239475

For machine with multiple dtbs specified, we need to merge dtb overlays
to base and pass the merged dtb to ukify to create UKI.
Walks UKI_DEVICETREE, splits entries into base_dtbs (.dtb) and overlays,
and validates all paths exist. For each base DTB, finds matching overlays
by checking whether the overlay filename starts with the base DTB name.

If matches exist, runs fdtoverlay -i <base> <overlays=E2=80=A6> -o <B>/<b=
ase>-merged.dtb
and passes the merged file to ukify.
If no overlays match, passes the base DTB directly =E2=80=94 no change in=
 behaviour for
DTB-only boards.

Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
---
 meta/classes-recipe/uki.bbclass | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
index fa1c95603b..03eb9eafbd 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -61,6 +61,7 @@
 #
=20
 DEPENDS +=3D "\
+    dtc-native \
     os-release \
     systemd-boot \
     systemd-boot-native \
@@ -150,16 +151,39 @@ python do_uki() {
     if cmdline:
         ukify_cmd +=3D " --cmdline=3D'%s'" % (cmdline)
=20
-    # dtb
+    # dtb: separate base DTBs from overlays, merge each base with its ma=
tching overlays
     uki_devicetree =3D d.getVar('UKI_DEVICETREE')
     if uki_devicetree:
+        base_dtbs =3D []
+        overlays =3D []
         for dtb in uki_devicetree.split():
             # DTBs are without sub-directories in deploy_dir
             dtb_name =3D os.path.basename(dtb)
             dtb_path =3D "%s/%s" % (deploy_dir_image, dtb_name)
             if not os.path.exists(dtb_path):
                 bb.fatal(f"ERROR: cannot find {dtb_path}.")
-            ukify_cmd +=3D " --devicetree %s" % (dtb_path)
+            if dtb_name.endswith('.dtbo'):
+                overlays.append(dtb_path)
+            else:
+                base_dtbs.append(dtb_path)
+
+        fdtoverlay_bin =3D os.path.join(d.getVar('STAGING_BINDIR_NATIVE'=
), 'fdtoverlay')
+        build_dir =3D d.getVar('B')
+        for base_dtb in base_dtbs:
+            base_name =3D os.path.splitext(os.path.basename(base_dtb))[0=
]
+            # Overlays whose filename starts with the base DTB name
+            matching_overlays =3D [o for o in overlays
+                                  if os.path.basename(o).startswith(base=
_name)]
+            if matching_overlays:
+                merged_dtb =3D os.path.join(build_dir, "%s-merged.dtb" %=
 base_name)
+                fdtoverlay_cmd =3D "%s -i %s %s -o %s" % (
+                    fdtoverlay_bin, base_dtb, " ".join(matching_overlays=
), merged_dtb)
+                bb.debug(2, "uki: merging DTBs: %s" % fdtoverlay_cmd)
+                out, err =3D bb.process.run(fdtoverlay_cmd, shell=3DTrue=
)
+                bb.debug(2, "%s\n%s" % (out, err))
+                ukify_cmd +=3D " --devicetree %s" % merged_dtb
+            else:
+                ukify_cmd +=3D " --devicetree %s" % base_dtb
=20
     # custom config for ukify
     if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
--=20
2.43.0


