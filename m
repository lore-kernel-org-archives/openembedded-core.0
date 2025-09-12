Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A9DCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 20:07:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.243.1757707665414249405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 13:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Afk/HgQr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1350ed5193=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5pvkb565317
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 20:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PJ/529TuK/x2LdVZejQP
	NcgkGBU5T2QCff4oqrwq6/c=; b=Afk/HgQr9SfWwygAw38NpKUlnaQbC5WF/6Qp
	PVO4oMig2F1uQ7/8/Q13YnXPYAw8pbuQrC305Hfh3eckpgzqp+3eIB1yuVrBWnS5
	6dbvrS58LvdDLzpTltG02OiPskYz8cvFPGQ8lgjJyfHesL3RNXYLW1fXuMb0HTNS
	WMlTfizU8gOxeuJNNXOvyZwQ61zm1Hm/ou/hSFyqubZq81iNuBdUbp76i+EMQr4B
	WscwMmoiWzkYTE2HRYsjmdqW3px78tpxmT4EBgEpGYnO3ZDYO90yb88wW5f/vQ/8
	OLpdPqHtdZiSU5Ar17qetBt+cPshCBPhsi9eRDe87TDYnOvceA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve36mhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 20:07:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 13:07:43 -0700
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Sep 2025 13:07:43 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gawk: disable persistent memory by default due to licensing
Date: Fri, 12 Sep 2025 16:07:40 -0400
Message-ID: <20250912200740.2873851-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jIcT2lruMLKNAqD_Rkzv7H7bg3ga-B2E
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c47d8f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=2D5jpVDKiuhJLaPqUk8A:9
 a=1N9iHcwoX80A:10 a=yLXxm-r16ukA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jIcT2lruMLKNAqD_Rkzv7H7bg3ga-B2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDE4NCBTYWx0ZWRfX57pg9PjmlSym
 EtFHou1pOlQWTK+Co8xeUDa89xbYxS0t7OqWB9kBuFWZDogeMKjnGwgBWNJZ7Qa8oOOl7zgJ6f3
 bYYsSl0v9fb3Pajfhf6JggojpjV/wxbbiKuZxkylC4iK5e6Cc3MLgHVdNw1wRVsu/DUnvOFoXtW
 sGT8s+6Fz1zflIxuCt7GVfQrhxXYvQsXH804ZsJM+KpmZ/uMDNAWFpjxrxX5mSJ69EfX+gMfwuk
 TYMK+931huTEey1JdF6wNjPJsz/zei8DGhO8AIPZ7qgJNLP0ShM7K9Q/G4CrTd5uX1u35OQv5ds
 4vB128cmS9ZqEUTSiKbI8YT8EG64qEvp3n69HU76oe4RQ4kVWFYLxkA6PRTUV4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 20:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223334

From: Randy MacLeod <Randy.MacLeod@windriver.com>

In gawk-5.2, a feature that allows gawk to preserve memory between runs:
   https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html
was added. The files that implement this, support/pma.[ch], are licensed
under the AGPL which some entities perfer to avoid. Force people to knowingly
opt into using this feature and license.

Also add AGPL to the license to the summary.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
index 833fe78bf9..7678dc9401 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -8,12 +8,14 @@ SECTION = "console/utils"
 
 # gawk <= 3.1.5: GPL-2.0-only
 # gawk >= 3.1.6: GPL-3.0-only
-LICENSE = "GPL-3.0-only"
+LICENSE = "GPL-3.0-only & AGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PACKAGECONFIG ??= "readline mpfr"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
+# Check support/pwa.c license
+PACKAGECONFIG[pma] = "--enable-pma,--disable-pma, "
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
-- 
2.34.1


