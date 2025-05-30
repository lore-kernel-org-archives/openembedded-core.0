Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74B7C54F30
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:13:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1287.1748589192929849745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U5sj35016799
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5396873-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 00:12:51 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 30 May 2025 00:12:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 00/15] fix several CVEs for libsoup-2.4
Date: Fri, 30 May 2025 15:12:54 +0800
Message-ID: <20250530071309.1603334-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA1OSBTYWx0ZWRfX0j9uRQzoj4uz sZrKBxPLRQSYQlgw+SfoUzHLXWpi1uJMHxfpwYwdgPMTokxdM96/GZn9c3ji4F6WLU4Rq6taG2/ kD+UBUIAR+lIdZH+r/uhrozNcNZiLV9jx862S/pJHdZX0JDDc+9kUvgMubNPtJ3O1JL2+Q3Shxq
 HLo4I1fpETuSas09itienGqkyX39JQyIwgtIR8FCfh+BJYti95H1kGdz8mC8fC8iDwW9SXyKWjA 06VldQ0v3iot6jcFGkwskA8SHr0l2ogXcUiWGe/zcF0NzednoR4twdfSaqv8pRNQCgFeheHFiha wnIkdzTZeRuwf3FjtsmQcFehESO3gi4MbfS8Q+3RmXqc+QpnYfokS9UwpnpgUD4ogb0TX1husas
 Ps9VCwMXvwnKzHSB0fQxhRrbIjXjQMLJlHIyFCYLh9ftFjqPtgiihQirHMJad4O5vraTkVUH
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68395a87 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=gjR99IWqj_EIfYGojPMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: EzjyWeXgRTba4AgTMkvNXZ1JC0BO1Wo9
X-Proofpoint-GUID: EzjyWeXgRTba4AgTMkvNXZ1JC0BO1Wo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=511
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217469

From: Changqing Li <changqing.li@windriver.com>

*** BLURB HERE ***

Changqing Li (15):
  libsoup-2.4: update patch 0001-CVE-2025-32911.patch
  libsoup-2.4: fix CVE-2025-32053
  libsoup-2.4: fix CVE-2025-2784
  libsoup-2.4: fix CVE-2024-52530
  libsoup-2.4: fix CVE-2025-32906
  libsoup-2.4: fix CVE-2025-32914
  libsoup-2.4: fix CVE-2025-46420
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-32052
  libsoup-2.4: fix CVE-2025-32909
  libsoup-2.4: fix CVE-2025-32910
  libsoup-2.4: fix CVE-2025-32912
  libsoup-2.4: fix CVE-2024-52531
  libsoup-2.4: fix CVE-2025-4476

 .../libsoup-2.4/0001-CVE-2025-32911.patch     |   2 +-
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ++++++++++++++++++
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 +++++
 .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ++++++++++++++++
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 +++++
 .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 +++++++++
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 +++++
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 +++++++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  36 +++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  48 ++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  20 ++-
 19 files changed, 976 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch

-- 
2.34.1


