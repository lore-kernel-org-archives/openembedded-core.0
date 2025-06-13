Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA4EC61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:43:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1707.1749786235045676421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D3OHJX017774
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:43:54 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm66xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:43:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 20:43:53 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:43:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 00/20] *** libsoup/libsoup-2.4: fix CVEs ***
Date: Fri, 13 Jun 2025 11:43:32 +0800
Message-ID: <20250613034352.175878-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 39UcUbKy2_EIRUILz3tqVf1JhweoSNju
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684b9e7a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=ebGmSUOtpM_2Ds1x4DgA:9 a=MLZSree4-qiekLvN:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfX+tBTFx+ZWhDZ +JMSju2mmqDo40av+0Q3flbdOz/BSMvsJ4Cpn2VYNt8jcD8e2KstZwWiorrds8v27nWMsCCk+fB MMWbqLVbIqcOMZ7Shz/C7SMkElMsBHITLLovR+qOIX2WEKXSX3MjbBLBhntGVnPy0L25HXAYl4o
 LMmAlfQvpdPKTBQzZLQa6y4E1RRaqKsQHpghuKyd9wS/hc2JMvB53GLcg8AyjmyEGbBhVgcXhJC pvpH/CkDFaMXKFMIkbcKIU1DxKQKqnO2QLZ6IBNe0oFvPzF8Fsg00MXuuaSf+XFri1Qh+9w8UEG NQRUegyeSS3B2adD1SOrIhNwDi8nodez48vMAq97VtxCOAxWj82cczcU6tz3aOul0RTeGwDoV6G
 JOd0/dr4Ih3MRL6JpspW2X4YLYTilPp/vz+m1aiqZmE4m28bUOn0+VqrKe+wGyBTFg6TGTFi
X-Proofpoint-ORIG-GUID: 39UcUbKy2_EIRUILz3tqVf1JhweoSNju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=493 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218553

From: Changqing Li <changqing.li@windriver.com>

Backport several CVE fixes from branch scarthgap, cherry picked from
poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.

Ashish Sharma (1):
  libsoup: patch CVE-2025-4476

Changqing Li (17):
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-32053
  libsoup-2.4: fix CVE-2025-32052
  libsoup-2.4: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-2784
  libsoup-2.4: fix do_compile failure
  libsoup: fix CVE-2025-32907
  libsoup: fix CVE-2025-32053
  libsoup: fix CVE-2025-32052
  libsoup: fix CVE-2025-32051
  libsoup: fix CVE-2025-32050
  libsoup: fix CVE-2025-46421
  libsoup: fix CVE-2025-4948
  libsoup: fix CVE-2025-2784

Hitendra Prajapati (2):
  libsoup-2.4: Fix CVE-2025-4969
  libsoup: Fix CVE-2025-4969

 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 +++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 +++
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
 .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   9 +
 .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++
 .../libsoup/libsoup/CVE-2025-32050.patch      |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
 .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
 .../libsoup/libsoup/CVE-2025-32052.patch      |  31 +++
 .../libsoup/libsoup/CVE-2025-32053.patch      |  40 ++++
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
 .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
 .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
 .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
 .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  12 ++
 26 files changed, 1380 insertions(+), 135 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch

-- 
2.34.1


