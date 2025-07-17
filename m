Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F91C87FD4
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:19:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.44910.1752745409321809350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 02:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=amYh0v0X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4XoOh021709
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FLDBDirEZ+7haw30BtAdgkd4xCIN/PPP0RS
	Q08wm1YQ=; b=amYh0v0XscD1vWWeWQUcvvr8OsOWCODuGvhUL0qSuY8OaVggJsX
	LsO8WmYNMUkAlrXwNkoOsnOcXTteHieQX7xq982vwfZ+lIckUiaCh8BfiKlcyBPJ
	SddfkZxRZICVFl+0rSNiPyKErFxqDGkGih9KbQlFU8oJOcsD34tiYOpgkjC9j6dx
	z0neJIudgGnxc/5MSN2cRU5J05w3Dx4mJ5KN2b8IVHYUOvhbVvKcO3c+eXD/Jcog
	94pFG1jfLukTSFp82EmZ8/p/8cMmAJk9L+q3oEcOH6yc047vOgh+yON96DM6EB0C
	Q17SmKTeQEKphOcKNng+E7uYF/kPsa7hNJg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8f008-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:40:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7494999de28so1051655b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745222; x=1753350022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLDBDirEZ+7haw30BtAdgkd4xCIN/PPP0RSQ08wm1YQ=;
        b=pNTCjk3oe3BT77FGQjPEotiTUszXTA7eEAnx51rdrE65g6oQyIpK8VUZSWRy57P7bV
         Ij5my030QPC3vyImtvQKAsySTJDaoYs/r/9U7xNON4wPP6KEkPtBGzcOFyxvyImlpM01
         OWynyFH82R6tYXYCLugtaGFKVqwed7Mm8tJpy2AhQ0pCTGnrcSWmvesQ3PKeTHRlIH9+
         E1/H+1u8WgifqmcVJ8rDtRaAYngvMQJOUCAZMdlhrXYX0dW7XvrDbeIfNNDAK/ntjeJC
         4vrqBsY2/y001kyKd1RbPBCtzSRCrWq6ArBZnK6C7O6+2MYyioBhuRNdtdJrnRabGK+v
         p2Tg==
X-Gm-Message-State: AOJu0YwVNxrsOyvYScHNMU75ud9m+uNM0ioe4ziMb0AQxMfl8pB6cW2k
	oVG6izQnzuLjJ5GjKhpNns3eABx521Pe4okvzj6zPSb+1caw1EqnJTmU/ZH3B77nLYN+s1eOghs
	odBH8tcCTZAgMpcV9nL9/Db3M5URb2kb1VMKMO+gOFgiVBxU+tSkMerLBAC/wadrcS3TwOs4IgQ
	cKTA2MvaNfDD+sziV0AA==
X-Gm-Gg: ASbGncs8PBqQ+P57a0bATqviDKoNHFPC96Tf5jdNiBoI7ufJOFIQMFSBUjln/Jm+wjA
	JF1XT4uC632yn1TGeIGFpTLbTYbVEtwihFuXcH5GTr1YAsuk1y4cml3GpSYo06nJqSnLQ7nNgNt
	3BmnmEAFJYO9U7Ynsk6NzG0d0Ee79v1ag9GebvRXjtGQmFgJ214rn2ZMNZlqAfSmbNSkc6EW4q1
	WtD+g2F2SQPvHivvsNVMQdGQog+udpVq1k8A5hPhlXqpdWa8GwpZN4SWcwsU/aXDrgFjg6Qni9r
	ov8H1TS7snF2Vmv7YioexuPGK669t0z5bLmRm8olw+XV4SMPojsDgdkqNIMMxcOsK+vIhJ4yVQS
	fLKjXZ2Y0xu4vJfeHU1XwO5Q=
X-Received: by 2002:a05:6a00:2305:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-7584b629f91mr3086579b3a.21.1752745222249;
        Thu, 17 Jul 2025 02:40:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7CVn7lnqCOhsq7QTAaqhoYiFwrJ/m5bBxXCTIYNp32rW20Za3Br04CEpdcuqGAaEEEcwQLw==
X-Received: by 2002:a05:6a00:2305:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-7584b629f91mr3086540b3a.21.1752745221699;
        Thu, 17 Jul 2025 02:40:21 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm15697345b3a.27.2025.07.17.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 02:40:20 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [meta-oe][PATCH] wpa_supplicant: enable 802.11be, MBO, OWE, and SuiteB support
Date: Thu, 17 Jul 2025 17:39:54 +0800
Message-Id: <20250717093954.3448977-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA4NCBTYWx0ZWRfX+nLa6Nd2HwCO
 Vhs9fQ9UZpXAu24Cox/F+WUEDoroMB8US4usH7nnGOOVcNSN7tobl0WVECkDmB7E7eqUpyBhHEe
 2woD/klaErYEA1FRktDvZY+rZMsS8Cl9+5Op9d2RaAtZ4Zfm02EmstziMa5CEtAa2bDYVAtl8sN
 Nh8NzGYm5hYmpM5j2ZeP8ZtgS/qxMxcJSwj2XN69HyhM2+7gy83lwiLmEBKefwC1YVMXobcvuIW
 m6z57n4E0T0SOBi5IvQXFy/A4YmUcaPn4DZ49oyjo8/9U5wDjhXlUaR+e9mesLCG2ZflXNYPe+X
 ly2KN6JsEFhVdwbCHxdGcadAiBv75gtSlMVNlH5BRC0K5asdl5cs2SNKf/OaFOxoq1tAnIyVMJ7
 o4qRwsmJj1SwsF5KLvDZQ/r1Lh/JVp6NIC29/22+KtXRkrQ2DqDUmYjEyEAOzn63Li2rS3zl
X-Proofpoint-ORIG-GUID: pXaFsTG3Bqur7HzxmEGzrOO687fij-BH
X-Proofpoint-GUID: pXaFsTG3Bqur7HzxmEGzrOO687fij-BH
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6878c507 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=fYLizRlkivGdc4uPsUoA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170084
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221063

wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
years. With growing market demand for Wi-Fi 7, it is now an
appropriate time to enable IEEE 802.11be Extremely High Throughput
(EHT) support.

This patch also enables the following features in defconfig:
Opportunistic Wireless Encryption (OWE)
Suite B and Suite B 192
Multi Band Operation (MBO)

All of these are build-time-only changes and have no impact on runtime
behavior.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant_2.11.bb                   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 6dc76494f7..440d3a5c94 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -37,6 +37,12 @@ do_configure () {
 	${MAKE} -C wpa_supplicant clean
 	sed -e '/^CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
 
+	sed -i -e 's/^#\(CONFIG_IEEE80211BE=y\)/\1/' \
+	       -e 's/^#\(CONFIG_MBO=y\)/\1/' \
+	       -e 's/^#\(CONFIG_OWE=y\)/\1/' \
+	       -e 's/^#\(CONFIG_SUITEB=y\)/\1/' \
+	       -e 's/^#\(CONFIG_SUITEB192=y\)/\1/' wpa_supplicant/.config
+
 	if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) }; then
 		echo 'CONFIG_TLS=openssl' >>wpa_supplicant/.config
 	elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'true', 'false', d) }; then
-- 
2.34.1


