Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F3DC61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:28:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14259.1749036526991491676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250671ff5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554At1ZU031026
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 04:28:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rte0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:28:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:28:45 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:28:42 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATH 00/14] fix several CVE for libsoup-2.4/libsoup
Date: Wed, 4 Jun 2025 19:28:27 +0800
Message-ID: <20250604112841.424355-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4NyBTYWx0ZWRfX52mXMzvXGYAq 0XiCWXQ3KK1Dkv2/H4a1jX+DOknSJHYyMpFlOwv2b2S2HnaNgNmAZmzdHj6MpltTXfDJQAT0iis ETcFXjGR2NfATGhhqEE5hluKVq3ME78F6L2Zce1FpgvILmvCSxdpm83ckyyS3lMMnOVAfVpG102
 8XmDoE+Tooc/JbAxYi2+5mOQYiFeuSzXBFnY4ghUZnaMmxIPJElxjZeK8NEWUXTOXdbcIrQVmlv GUSTrPNfpDhd7fVuVYXBKhlr+whEMyfdKZNTrVSheQt0Xvro6QMDdwi52CtaBuXo2H8ICgDDIAE sMzA/bZFIKpGjYytQQ0LbKhTOgbUPZSCoVluWTJvKDANCYUQVCiUU2RceY8hBypGKReBks29fAh
 UWBYJoa0uBKoGnNpELBbYkpA+4tZwspw72jHj3AqhuUWGEe+fj4Tg4teBSRWcEdz+lLqzZ2G
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68402dee cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=Ky1scgHNTpJU9FCIswkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: apExvt_PUg15BQ7-o3DJ7k6FY2QV7UzZ
X-Proofpoint-ORIG-GUID: apExvt_PUg15BQ7-o3DJ7k6FY2QV7UzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=373 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217911

From: Changqing Li <changqing.li@windriver.com>


Changqing Li (14):
  libsoup-2.4: fix CVE-2025-32052
  libsoup: fix CVE-2025-32052
  libsoup: fix CVE-2025-32051
  libsoup-2.4: fix CVE-2025-32050
  libsoup: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-46421
  libsoup: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4969
  libsoup: fix CVE-2025-4969
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-2784
  libsoup: fix CVE-2025-2784

 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  48 ++++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 +++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   7 +
 .../libsoup-3.4.4/CVE-2025-2784-1.patch       |  86 ++++++++++
 .../libsoup-3.4.4/CVE-2025-2784-2.patch       | 154 ++++++++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 ++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32050.patch        |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-1.patch      |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-2.patch      |  57 +++++++
 .../libsoup-3.4.4/CVE-2025-32052.patch        |  31 ++++
 .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch |  97 +++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch |  78 +++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   8 +
 19 files changed, 1130 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch

-- 
2.34.1


