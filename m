Return-Path: <clayc@hpe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BDFC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:32:35 +0000 (UTC)
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
 by mx.groups.io with SMTP id smtpd.web10.17156.1703057545949027834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hpe.com header.s=pps0720 header.b=IyGsYxPq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: hpe.com, ip: 148.163.143.35, mailfrom: clayc@hpe.com)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BJN2nps014750
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pps0720;
 bh=3DtTfIdlcF5OjdYaQo0i5VoGIDWf9YiXKvcCSedy5EY=;
 b=IyGsYxPqHUFJPoJyvocDe7+ef5fpc6QjXylf3G+E/LnI3i4bJhnv1VTZfuGrlgD1h3pb
 YK9ztBZRYz3JUrKUbbu5LW2Xk1/V7HymzqvZPyy6epvdYYWX63L9mj2sfKJZJDRqedYP
 TF+//jW6Bj19BMQAcqZXJxyF6umIFuEj4c+F6tmTA9zOhg5Y+qU9RdEPZYJv/YI1TsUM
 znAzSDJ7VrPOtNPheu5h+Mips9jEI6PqZO3exB7rQ8eK7Kn9TFo6VfyK/as61TXUFckZ
 vz8XaJyvYjEomP956wbSzh4YwgaYL7Ilyi9vxfsT8fN3gZLQF/kzFRNgEn2/26Mf4opz gg== 
Received: from p1lg14880.it.hpe.com ([16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3v3gdxcwk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:32:25 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 81A7A800462
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:32:24 +0000 (UTC)
Received: from openbmc-builder-cc.amslabs.hpecorp.net (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 6C67D80E4CB;
	Wed, 20 Dec 2023 07:32:18 +0000 (UTC)
From: clayc@hpe.com
To: openembedded-core@lists.openembedded.org
Cc: Clay Chang <clayc@hpe.com>
Subject: [PATCH] devtool: deploy: provide max_process to strip_execs
Date: Wed, 20 Dec 2023 15:31:33 +0800
Message-Id: <20231220073133.3777792-1-clayc@hpe.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rvB7Op7wooZXAfNE6R_D5Qyhyo91ox2r
X-Proofpoint-GUID: rvB7Op7wooZXAfNE6R_D5Qyhyo91ox2r
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-20_02,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=736 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312200050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192772

From: Clay Chang <clayc@hpe.com>

Use oe.utils.get_bb_number_threads to get max_process

Signed-off-by: Clay Chang <clayc@hpe.com>
---
 scripts/lib/devtool/deploy.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index e14a587417..eadf6e1521 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -140,6 +140,7 @@ def deploy(args, config, basepath, workspace):
     import math
     import oe.recipeutils
     import oe.package
+    import oe.utils
 
     check_workspace_recipe(workspace, args.recipename, checksrc=False)
 
@@ -174,7 +175,7 @@ def deploy(args, config, basepath, workspace):
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
             os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
             oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
-                        rd.getVar('base_libdir'), rd)
+                        rd.getVar('base_libdir'), oe.utils.get_bb_number_threads(rd), rd)
 
         filelist = []
         inodes = set({})
-- 
2.34.1


