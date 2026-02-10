Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBF8EB5942
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 23:41:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7217.1770766895172448465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 15:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QnPJpslB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6501cfa702=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ABU2uS2299018
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:41:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=o5hX8yfl7uQzYCXN+62E
	OYbnU4HF5iQ3CVx01B8mNLA=; b=QnPJpslBp+1Tyk5YmP2cxvRqwJPg8RSA8aOo
	8/tCq+iVep6+QxJo1go7Rhkfhz8qepOShNpFmFTt96/wz1KF227TNkRx/8UnWebv
	p/heLcAK5xkfhl5kergRWFcYY0209xDw+aDlutwaKaRSgDggjUrlhUNpxQeQCjom
	85bghrpXyG23p+6/dPzVm74NLcCaHe1AoS4fzq0Ma9Qe9zOq3ASsxDoYkbz6NJc6
	8j1UFX5CtKSAn9vHTFvF55kSOnI+FKLD6P30C7JPZkgpqqtRma/q4zdMewZxftHb
	FCwkqel5Z/jUOBkUAr8NFO2899RGYVFLe5RQlkqN/9Ya00gozg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj3p5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:41:34 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 15:41:34 -0800
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Tue, 10 Feb 2026 15:41:33 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] strace: upgrade from 6.18-> 6.19
Date: Tue, 10 Feb 2026 18:41:33 -0500
Message-ID: <20260210234133.3109412-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2rMmAACii2yiYtKx7vrLj1XQklxKvFsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE5NiBTYWx0ZWRfX2eH/VdGMrf1H
 2az/UU1UV40VcALnnb5sjhk0YE23xLUbjr/7Z8/uLZwn1F4tXHfnTIzOLvMdI8ocN2OgVKjSKm+
 DA6pq1HvmPs5jL0PBFkRw6AImbMybJ2wihMktJNurlgatIKW0n6LLJ3OZA4jjo1nu3WmSeo4smL
 S3bwYMCSYRw7HHlOt1EiE0u2AbKU4AQ2v8Owl+jheZvmhOo8Mu6rd11sH6BfY/i2mRCqQgOpDs4
 tKQIz3KyLX1MbnvdsvnIKg+HSI4Ea2pqbBojp4SUd7igbAJAz455vsJUQHSNWcGHeRlG3u7TFgQ
 fSFQ7qQpgA2qjH+czE1FBc55uBqk2j1Jz22bP6xJ7TXCQ+e0BiJFQZOGmNcleaObckcMDeI1Es+
 FH+IJDMCn2FPQT34+8j21Ynf08q5K63uS1sc4OYUH2noSwjSGuMhALgkFxLL9mxRLfVFzNKmsB2
 1YWLoe0ZoUvaXARYmZw==
X-Proofpoint-GUID: 2rMmAACii2yiYtKx7vrLj1XQklxKvFsX
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698bc22e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=fzO0DoyAAAAA:20 a=_pA1qYqWAAAA:8 a=t7CeM3EgAAAA:8
 a=7Lqjq_4UkUZYMGYIYOEA:9 a=TbLkyeXSistb_kka44-k:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 23:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230938

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release notes:
   https://github.com/strace/strace/releases/tag/v6.19
License-Update: copyright years refreshed

Ptest results for qemux86-64/kvm:
+------------+--------+---------+-------+
| Version    | Passed | Ignored | Total |
+------------+--------+---------+-------+
| 6.18 glibc |  1,127 |    332  | 1,459 |
| 6.19 glibc |  1,129 |    332  | 1,461 |
| 6.19 musl  |  1,123 |    338  | 1,461 |
+------------+--------+---------+-------+

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../strace/{strace_6.18.bb => strace_6.19.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.18.bb => strace_6.19.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace_6.18.bb b/meta/recipes-devtools/strace/strace_6.19.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.18.bb
rename to meta/recipes-devtools/strace/strace_6.19.bb
index a2eba0797f..dfe14e2a39 100644
--- a/meta/recipes-devtools/strace/strace_6.18.bb
+++ b/meta/recipes-devtools/strace/strace_6.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1efaf30bb0084b4a17a6f55f9cbcd25b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9259131ce5420f9790214be1c20a83a9"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325"
+SRC_URI[sha256sum] = "e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143"
 
 inherit autotools github-releases ptest
 
-- 
2.34.1


