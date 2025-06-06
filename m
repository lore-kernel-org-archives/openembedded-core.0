Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91DDC5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:50:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27983.1749192609230404533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565V5g1012130
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 23:50:08 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw0f9-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 23:50:08 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 23:50:04 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 23:50:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V3 00/12] fix several CVE for libsoup/libsoup-2.4
Date: Fri, 6 Jun 2025 14:49:51 +0800
Message-ID: <20250606065003.3681416-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CGQLFOdSthhOxU-PlnVhlH_bdqTXYWC6
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68428fa0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=28L885X2wViOXTSM39QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MSBTYWx0ZWRfX3Q9Sk+3HO5pA pytnyRK+tkbSu4yruf3LMU6lQNry88n5MQ0UmrfEsrcCL9Aq7qwe+sv3E2VDbO2RyWkD8FBn7FI MZodEwl9kpkFTBbmN/F8Rib7eesZai1XvsoeBSftufc8vgVLpayufldd0f0XkijXniXmV8bQGW0
 I25rYbhgNTggLaiJ8Rm8le/nfGrtYH9YSIeuV3SuBsM5LxqQwrDmd+/VqcDRjQfyrr2V6sGkC5S BaAP22vygrfsCjbsyh5cqORRYYuJzvVX07FLrtWFtJb9kM2Gb5H9joSKxi0M/RMi8da6+V5F2UV MqvQJUMVXEUR5jMXVnZGKN4LgZ9teitf5lZZJaatNPkCxW1oibmL24/bZKUeNCp1f02fNZyUfFH
 0q8Mp8MiDlQURQfOA9EqolNsfIGxCuGqBd0Qo/imYk9JsX+n6L/z3NYfpKvaj6iTN7tNJ62t
X-Proofpoint-ORIG-GUID: CGQLFOdSthhOxU-PlnVhlH_bdqTXYWC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=528
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218099

From: Changqing Li <changqing.li@windriver.com>


Changqing Li (12):
  libsoup-2.4: fix CVE-2025-32052
  libsoup: fix CVE-2025-32052
  libsoup: fix CVE-2025-32051
  libsoup-2.4: fix CVE-2025-32050
  libsoup: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-46421
  libsoup: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-2784
  libsoup: fix CVE-2025-2784

 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 +++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   6 +
 .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 +++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32050.patch        |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-1.patch      |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-2.patch      |  57 +++++++
 .../libsoup-3.4.4/CVE-2025-32052.patch        |  31 ++++
 .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch |  97 ++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   7 +
 15 files changed, 772 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch

-- 
2.34.1


