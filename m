Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF69E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:09:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.77695.1734426591772634140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208178e12f=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH7w2T8015362
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 01:09:51 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h6682rja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 01:09:51 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 17 Dec 2024 01:09:50 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 17 Dec 2024 01:09:49 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] man-db: fix do_configure "Argument list too long" error
Date: Tue, 17 Dec 2024 17:09:49 +0800
Message-ID: <20241217090949.117178-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GEk7zz8B45moDQL7ojzlEoXGL5A_5K7D
X-Authority-Analysis: v=2.4 cv=K5XYHzWI c=1 sm=1 tr=0 ts=67613fdf cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=g8BfZvj49CohcG2J7dUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GEk7zz8B45moDQL7ojzlEoXGL5A_5K7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_05,2024-12-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=5 clxscore=1015 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=823 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412170074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 09:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208826

From: Changqing Li <changqing.li@windriver.com>

man-db uses a lot of m4 files, with acpaths set to absolute path,
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
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2fa18a8f24..553b2d59d2 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -22,7 +22,7 @@ USE_NLS:libc-musl = "no"
 inherit gettext pkgconfig autotools systemd
 
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"
-EXTRA_AUTORECONF += "-I ${S}/gl/m4"
+acpaths = "-I ./m4 -I ./gl/m4"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2"
 PACKAGECONFIG[gzip] = "--with-gzip=gzip,ac_cv_prog_have_gzip='',gzip"
-- 
2.25.1


