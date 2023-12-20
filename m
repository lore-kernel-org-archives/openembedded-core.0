Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC72AC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 14:02:07 +0000 (UTC)
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
 by mx.groups.io with SMTP id smtpd.web10.15663.1703049703399544055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 21:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hpe.com header.s=pps0720 header.b=PPNJMGEC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: hpe.com, ip: 148.163.143.35, mailfrom: clayc@hpe.com)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BJHa5RS003892
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 05:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pps0720;
 bh=3DtTfIdlcF5OjdYaQo0i5VoGIDWf9YiXKvcCSedy5EY=;
 b=PPNJMGECLRrHDH2e8WMVY3zxwLq68HGPqaarTl7qOEIlE5+sxfqzx8bUgHbhmVahp0OI
 zUZm5SdF6SkZXZone8aFiAADJ5IX9woPAMXPRQfKDbFiJuviswaHCJJ9dEq05eV0EH/k
 Klup3j8XYOxwjE6iztCFViUG8tVhrQbTmYsE9VNFZhwMhUSZCm1FQ/Av2smOgjn3oWP1
 JaKnCez6v4QyuqzNn9mpK4FEmDoVdV8+yrCXNH9EsuzPiEtEdMBThXwcaKdc1LekC98Y
 3MxvWzArquOR15Ip6sTZ9qt0AIRAXJzG32l5e4fp6XxOzm5jEBDU8vWbZiUpE0TiYhpm cg== 
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3v3fqfvcyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 05:21:42 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id C1ED2805E22
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 05:21:41 +0000 (UTC)
Received: from openbmc-builder-cc.amslabs.hpecorp.net (unknown [16.231.227.39])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 1A7898097C7;
	Wed, 20 Dec 2023 05:21:40 +0000 (UTC)
From: clayc@hpe.com
To: openembedded-core@lists.openembedded.org
Cc: Clay Chang <clayc@hpe.com>
Subject: [PATCH] devtool: deploy: provide max_process to strip_execs
Date: Wed, 20 Dec 2023 13:21:39 +0800
Message-Id: <20231220052139.2201118-1-clayc@hpe.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: n1612X71oNVP-erYWUsxGwgzsuzijIZR
X-Proofpoint-ORIG-GUID: n1612X71oNVP-erYWUsxGwgzsuzijIZR
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-20_01,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=736 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312200033
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 14:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192801

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


