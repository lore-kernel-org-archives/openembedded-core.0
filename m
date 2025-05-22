Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699C3C54756
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 05:16:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16698.1747891014430323543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 22:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72376e78f2=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M4Y4Nv013155
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 22:16:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfra5n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 22:16:53 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 22:16:35 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 22:16:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] *** A workaround for bug of file on fedora42 ***
Date: Thu, 22 May 2025 13:16:50 +0800
Message-ID: <20250522051651.3711352-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1MCBTYWx0ZWRfXx2fvwp+rK9e+ hKbL7PRfejYULx22/+cexCGvCJq0jXWcdlDnpDAmELmn/2BK+S9g4JCaPjBjYvkI1grY3XhpUMJ aHlq9n9nDXxcSjAMQ5Hgxx5+dCbUKvaWn5HrzdhTDYxbMMHTS1JmfqPB8VCJICl8UvpluueGJf5
 mdMvoBcPv7adtZui0eo8dDKXknINtq0zpwTY/yA+OYFpiNDqn6MbZcJgw6xCsGET5iPNAEEuIn7 oM1DWzpzA8ySQr6xWZiuVG1vRoaWDL9060s0CnalPhNDmGjs8fzSyo5e5TubCbcJK8lpfgkn48Z QC9lNZC9K6M2XQgWnDBq6j9k3sbBPOzpezwos4daXCKrF6yDZIAlPaJPgHo2JO3OAua16IjEXKP
 0q217K1ZfVT1bNq0wyUsE4VLs0+e335+jkVJLtkdNqx8eDr5kPQlKd8Qozqd26jY+/WiBHtw
X-Proofpoint-ORIG-GUID: _DCIFreDv56lOsJ_dJ9rNUUpWZS0WrIe
X-Proofpoint-GUID: _DCIFreDv56lOsJ_dJ9rNUUpWZS0WrIe
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682eb345 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=NSoiUcdBe_R0XK1504MA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=575
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505220050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 05:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217060

Hi,

This is a workaround for bug of of file on fedora42, the bug is fixed by
file upstream, but not released and also not cherry-picked by fedora42
now. This can be a workaround before fedora42 fix the issue, and this
can be dropped after the fedora42 fix the issue.

Changqing Li (1):
  buildtools: Add a replacement for file command

 meta/files/toolchain-shar-extract.sh         | 12 ++++++-
 meta/files/toolchain-shar-relocate.sh        |  8 ++++-
 meta/recipes-core/meta/buildtools-tarball.bb |  2 ++
 scripts/file.py                              | 34 ++++++++++++++++++++
 4 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100755 scripts/file.py

-- 
2.34.1


