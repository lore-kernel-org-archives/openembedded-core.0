Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65828E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 07:29:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8600.1733297338921763711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 23:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20685f624c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B45jhpr016158
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 23:28:58 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7v8ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 23:28:58 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Dec 2024 23:28:57 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Dec 2024 23:28:57 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libunistring: fix do_configure "Argument list too long" error
Date: Wed, 4 Dec 2024 15:28:56 +0800
Message-ID: <20241204072856.917489-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Joh8cTU87s7ufjYNtQiYxlLcfefAfOqu
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=675004ba cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=3isc9rRXyBFZFg2bORkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Joh8cTU87s7ufjYNtQiYxlLcfefAfOqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_05,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=3
 phishscore=0 mlxlogscore=752 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 07:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208267

From: Changqing Li <changqing.li@windriver.com>

libunistring uses a lot of m4 files, with acpaths set to absolute path,
and the TMPDIR is long/deep, for example when len(TMPDIR) = 350,
do_configure failed with "Argument list too long" error.

[snip]
aclocal: error: cannot open xxx  Argument list too long
autoreconf: aclocal failed with exit status: 1
ERROR: autoreconf execution failed.
[snip]

Let aclocal use the relative path for the m4 file rather than the
absolute would fix the problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/libunistring/libunistring_1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libunistring/libunistring_1.3.bb b/meta/recipes-support/libunistring/libunistring_1.3.bb
index 08531acec10..3b6dd61a34e 100644
--- a/meta/recipes-support/libunistring/libunistring_1.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.3.bb
@@ -24,4 +24,7 @@ SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
 SRC_URI[sha256sum] = "8ea8ccf86c09dd801c8cac19878e804e54f707cf69884371130d20bde68386b7"
 
 inherit autotools texinfo
+
+acpaths = "-I ./m4 -I ./gnulib-m4"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


