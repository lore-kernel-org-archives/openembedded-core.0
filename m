Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0C2C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:34:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14426.1749036869998934876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8250671ff5=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55456FaP006575
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 11:34:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q2dt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:34:28 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:34:27 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:34:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V2 00/14] fix several CVE for libsoup/libsoup-2.4
Date: Wed, 4 Jun 2025 19:34:12 +0800
Message-ID: <20250604113426.464818-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tu_PCkaY21M3W386q47XY7Tq3f-CvAfA
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=68402f45 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=yF3vOwTMPoubr7DojHQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4OCBTYWx0ZWRfX4TFBICRSDk/W gebX//QxwYkQ9UnAyxKuHS8SvOzX4mp7zK99bpayRDf/ZPJk/BMzjmeUXnCic2yCn2MJ+Y1uUjY jzOGWfFbUl0/TBoOr0w01+h3EnTqIc3YJooeuQ0/F/tHI8jiZluydM5Fq9j0YV1guKdzGwr7rvS
 q3HCx6zgQF3DFp5IWMOt22iOwA51LXOe1cn6W7ErKH5wqX/Ova+Xqhkzo+E3zzxwE5hMMXWHu3f Ht1H417rE8nP7OKbKTkalmhmp/zvBuGbCtgjLPeDaKDQUtNP4VddnEo0OVocu2to62QnHMihfJ7 PqiLcVfRRrcEFbBDp2q+/Se4tNCzvlFZnokkPAcmx1+Cn4+X0xn4F+tzBOYFbC5zHPZvAEmItdF
 OZHEurRSjSVDzE1RKMSMgKOspsmHzHjSUYcfbH8Yi/Hi7LPzI8mjgSd5U86FzsDmt1DLwgsv
X-Proofpoint-ORIG-GUID: tu_PCkaY21M3W386q47XY7Tq3f-CvAfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=486 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217926

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
 .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 +++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32050.patch        |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-1.patch      |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-2.patch      |  57 +++++++
 .../libsoup-3.4.4/CVE-2025-32052.patch        |  31 ++++
 .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch |  97 ++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch |  78 ++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   8 +
 17 files changed, 890 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
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


