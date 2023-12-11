Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EC0C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 15:13:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10771.1702307598389244982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 07:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b8zBRcNU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07098ab644=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB9al6T005000
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:13:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=duqOdYfW+DwOelfua4uAiwYBD0D9d4XeODJZ1F0bmss=; b=
	b8zBRcNUj3EYMJAgkAivApgEa/hzzpTSoE5iTFsTVStxAFGUhigL7vY7BRTpUChi
	uKnujwbD/T3mmQe8euuUu9TXgAWp+vF/fiQbFjFBnQI+XqOlnY8ZLVyhwAgy7Liv
	qRgxfqGM7AniTMAnpxijWfCoB9rhVSWIwEhURYu16aBTBMrQ06UKMbtzkVajPmLI
	3y+yCTj7Dj25T18urBJYZH5bARd1gPXDVGGr8TQZ5qKBWr5AirQ7kZ9ZgVkTgZzY
	0YXz+N9kIKKMeodVOTGpV+j4+u/C8vxZh3lcTL+uvV889VcAnqDt2WRUvbrA1Q/2
	sZQ8prqV0998wxuMeqZt0A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxj88ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:13:17 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 07:13:22 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 07:13:22 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] archiver.bbclass: Improve work-shared checking
Date: Mon, 11 Dec 2023 07:13:17 -0800
Message-ID: <7829286302c0e4a4bdcb351cbd295cb95387d7c1.1702307359.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702307359.git.liezhi.yang@windriver.com>
References: <cover.1702307359.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nl96ghC0jUBWDTIo4Xhj8NWqCnsWIsbL
X-Proofpoint-GUID: nl96ghC0jUBWDTIo4Xhj8NWqCnsWIsbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=704 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192173

From: Robert Yang <liezhi.yang@windriver.com>

There are other recipes except the listed ones which use work-shared, improve
the checking to make other recipes such as llvm-project-source work with
do_ar_patched.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0eee1abefab..80a69cf31db 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -468,10 +468,8 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
         os.chdir(cwd)
 
 def is_work_shared(d):
-    pn = d.getVar('PN')
-    return pn.startswith('gcc-source') or \
-        bb.data.inherits_class('kernel', d) or \
-        (bb.data.inherits_class('kernelsrc', d) and d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
+    sharedworkdir = os.path.join(d.getVar('TMPDIR'), 'work-shared')
+    return d.getVar('S').startswith(sharedworkdir)
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
2.42.0


