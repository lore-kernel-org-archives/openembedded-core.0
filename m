Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54A8C87FCC
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:19:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.12344.1752807915365024846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 20:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Jb+EltMK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HMdb8F026790
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 03:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JnGmStD5Z+kui6nprvmPN/YHQa1vZWP3BOS
	9LU+0qmo=; b=Jb+EltMKuUQIFrhuSc9e7wGRgAQ1Gb1nqKNa16S4e+CoAzTZTIr
	uKgLCncUsOjtfqYl1doRkgBOKyifxYT/tzFfxnA0EZ5XV9odjy9KT5iLiKST9ce0
	GQCHDRBsYbnFxysCncOcjdFbvAxzE919BTmhYRcHu7YNpkMl/XXXz4p+fkSahN1l
	pR2hAlfybX8XVfXWmu3MRFbn2uLGKzC/i3/OV5qHywazcrwvJ+PHfUcRc7ItW6Rm
	XvL1aVatTfkpfQNiFz5dn9bNxeZ62j47+L+jK8SWm6wpQdxkxfBtbGh/AL1AmXGd
	kF0/10Vv30RJj/UHRnnvB64c4z46sRToPBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqe4aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 03:05:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-754f57d3259so2298669b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 20:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752807913; x=1753412713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnGmStD5Z+kui6nprvmPN/YHQa1vZWP3BOS9LU+0qmo=;
        b=gSiXwGdXi1KYIXhayvzW++gy27co+x1JiHpDTSITbWvItPEhXFmNsWLVXb9jvoa4Dp
         pasQz+JDVxhX5TiqcDTSN0srySSLat3fY51hgZYQSCx2UcBtqO7hWWXEjajQ7wWLgFAj
         i5ea5QOfqJVwuwxRv40I2j+h/PVMAteC8lfp39/PeDoYLFsNJA/sQQsda9a9ajV1ZPDq
         8YNtzNOR6oquAWSpfK1T7GG0nWEwiI8Kkt+F5y2sYLImMIJqubQ2QD0v2vXPY+3OVzeg
         lpi7HapbD+friEq3knE6srWQzhwcylfLhXHyaZUguSVokGtIH9Q1K03EWMg+ME8v6cbK
         G49w==
X-Gm-Message-State: AOJu0Ywk4EQ4+HXq4r0HdEq/gIFvgzaO6mqoMxSexjbZ0BPfKDagTXNN
	GP19xrGOjL9hW+b/iYasFpWe+eZo/5On1HeDPDyzAAEQisC1yTkD/rwVhMsqUu0w8vn1U2PNTNz
	XzG9AWgDudADnC7Kse0Q72mYXQHaIbyWohdSRrFAyced2uPCzeJgzkyHIYGWriHJ6iKEs2hscrO
	PjZggt6l+Qezi7M6Ca2Q==
X-Gm-Gg: ASbGnctbPUD6GZ4oynzgZXY+uqOIxv92QzB1EX3jdv9l100gqSQOCDFhphTxbEEmbs9
	1Kkrh4KbR1vcLWHXRs2ERgaHGW1lSxzOjIAfftRJmz9gi7M8sXbziIffLFuOYdwiThfuiHMwgJl
	vAHtdJH5HVapDtj2JPUypyH+wIHoz+oTXWOHf9Uw5cC4OntFFfdKN/FQaeWJXg/U2o+BZK3tgVX
	pHhZazJWLCihyp0Gfy3TmcetkEO3GqADZ41o1j8y1DcYw1D+L5qB9QSCgw3MU7nCyXnUxkflhEh
	6K7NzTuOlztS+HRgMQijZD17bwO6OOMIqWqvHbwEjbFPX3oBaxqnqkMcVZHxNLuAiJeNLbYxxOQ
	CrY3kbrZ8iC4r52ffrLnUDdQ=
X-Received: by 2002:a05:6a00:8c3:b0:74e:ac15:10ff with SMTP id d2e1a72fcca58-75848d0d2damr7722173b3a.4.1752807912465;
        Thu, 17 Jul 2025 20:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHodC/QydeZp54GFwhT+yhEFRe7X+Tj1ALU2vpIpd7SqJYZBrXCYVcBfraG4uJaMtt8x66MIA==
X-Received: by 2002:a05:6a00:8c3:b0:74e:ac15:10ff with SMTP id d2e1a72fcca58-75848d0d2damr7722133b3a.4.1752807911973;
        Thu, 17 Jul 2025 20:05:11 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc6bf14sm262195b3a.158.2025.07.17.20.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 20:05:11 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v2] wpa-supplicant: enable 802.11be, MBO, OWE, and SuiteB support
Date: Fri, 18 Jul 2025 11:04:52 +0800
Message-Id: <20250718030452.3459203-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6879b9ea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DOyQDXDkBrU8gSCrB9UA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: m9MCu3IXcvVnAzQuUuuTIedMkJ_ElJ4W
X-Proofpoint-GUID: m9MCu3IXcvVnAzQuUuuTIedMkJ_ElJ4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAyMyBTYWx0ZWRfX3G5xTaP/lxP/
 wErxzNzuyfWzfpkdLtZD3aCsOeHOTLh4EMS1OlVsG8hv+HIcDuAW1vgzPyFwN6hxL9cdtRxfI4M
 U+ybOmF0KqTPjJdQnM4g4d3qoBtgAZg52erh//I6SGw6OrWRFS2Y6e9QgX436o7sC3DusKs00/V
 +0xAgWktp1FJn2dAUzL2nWHKKJ0Y/dOb6B4gcJ4NyY3e4Rsuyn7CeqsZMJiPmF6BAoE7ELsh9cU
 DQSmvU+fNYLghxeR4NqvRILoEkAADp2KU+IDzAG2AJv8VWhorFeQMp3wxRKlX7uCIjuq6Z2TtXM
 oYyQr+V4Mv77lLlIsZX01QvV/3rO570K4VXRnzHGkf203499NgRgHN+bK1qTxRtqYmhxmnIQ63V
 QGyV3JOPQEjdIDNJ4xyOuFf/DuvoNQJFnbh8si55kgDX7DXB6oavDkb98VnYKM3cw/FV+DBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180023
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221064

wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
years. With growing market demand for Wi-Fi 7, it is now an
appropriate time to enable IEEE 802.11be Extremely High Throughput
(EHT) support - mainly for AP mode.

This patch also enables the following features in defconfig:
Opportunistic Wireless Encryption (OWE)
Suite B and Suite B 192
Multi Band Operation (MBO)

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
v2: update prefix and commit message.
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


