Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF72C369D9
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 05:53:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41502.1745819591064045237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 22:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139e711a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S0obte023075
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:53:10 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1aggx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:53:10 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 27 Apr 2025 22:53:08 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 27 Apr 2025 22:53:08 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 0/3] Backport 3 buildtools related patches from
Date: Mon, 28 Apr 2025 13:53:04 +0800
Message-ID: <20250428055307.3507811-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f17c6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=jXKoXrtyJxsEAUYfD9cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HKCXRAAzNexGBx7CiRaS_BKynYZQqJyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA0OCBTYWx0ZWRfX7Z2JBcLrxXKh psrr/ROkVABUzNYFdMzbwIEBlyg4cduPUd5R4qlkM7p3hXM+BTOxPosSfLp8uw5UgDzxP5oyvQB fFm/hekfhs9wvxtIm4TZ5mnX5baaw7aFjxz7+P9g1S5x4LOUFXKI1EEVpqz68PyI1dRJFrpGrNN
 ZoI2VVvZ+kqijIPRzb90QCRlV7A7MBsZnVrWLrnxllFh2FsVCmuIrVzp9rRH97LPSRFQ1vyqTCQ WGOcABYh17SKLaX1xQAIa6mPeV1og5E0H9G4riRx5l2834amRYqx/GNPj0KWm22RQwc9A6O4RsW Km9yFyclnKiDIK8r080MTZ7L9rUucGoxjc8NalkVGq16IQugerkjnDofziL/CrUR++azDizrN9N
 6oX5YX5UBU8cyaTaQgqSSfa+my+++mi8wDFyCWNSKen7ZBbq59gS+HBQTKOEKwxhzge3Xjq7
X-Proofpoint-GUID: HKCXRAAzNexGBx7CiRaS_BKynYZQqJyN
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=956 spamscore=0 bulkscore=1 lowpriorityscore=1 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215572

From: Changqing Li <changqing.li@windriver.com>

This backport include 3 commits:

[1/3]buildtools-tarball: move setting of envvars to respective envfile
[2/3]buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS

Above two commit is for fix a do_configure failure of recipe
tensorflow-lite-host-tools, this allow user can export GIT_SSL_CAINFO,
so that git clone can works well in do_configure when buildtools is used.

[3/3]buildtools-tarball: Make buildtools respects host CA certificates
Above commit is for improve buildtools, before this commit, when
buildtools is used, openssl/curl/git/.. in buildtools will use CA certificates
in buildtools. BUT, it is possbile that user has it's specific host env
and specific CA that not in buildtools, so changed to use host CA first


Changqing Li (3):
  buildtools-tarball: move setting of envvars to respective envfile
  buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS
  buildtools-tarball: Make buildtools respects host CA certificates

 .../openssl/files/environment.d-openssl.sh    | 22 ++++++++++++--
 meta/recipes-core/meta/buildtools-tarball.bb  | 29 ++++++++++++++-----
 .../git/git/environment.d-git.sh              | 19 ++++++++++++
 meta/recipes-devtools/git/git_2.44.1.bb       |  8 +++++
 .../environment.d-python3-requests.sh         | 11 +++++++
 .../python/python3-requests_2.32.3.bb         | 11 +++++++
 .../curl/curl/environment.d-curl.sh           | 19 ++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  9 ++++++
 8 files changed, 119 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
 create mode 100644 meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
 create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh

-- 
2.34.1


