Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7FEE68958
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 07:41:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7441.1730360468991119379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 00:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10345bb591=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V5ItEN029350
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 07:41:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8p143-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 07:41:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 00:41:06 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 00:41:06 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ruby: Add init.rb file to PTEST installation path
Date: Thu, 31 Oct 2024 15:43:47 +0800
Message-ID: <20241031074347.2429921-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: giPmthBB7N48Y52qJLVWD6QiE9CMUPAX
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=67233493 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=Wgt4BMehFtG8VEkmdzwA:9 a=Y9P8xi-WhYsAB-1w5M_i:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: giPmthBB7N48Y52qJLVWD6QiE9CMUPAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=752
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410310056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 07:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206568

From: Jiaying Song <jiaying.song.cn@windriver.com>

This patch copies the init.rb file to the tool testing directory in the
PTEST installation path during installation. This modification can address
the following errors:

BEGIN: /usr/lib64/ruby/ptest
/usr/lib64/ruby/ptest/tool/test/runner.rb:4:in `require_relative': cannot load such file -- /usr/lib64/ruby/ptest/tool/test/init (LoadError)
	from /usr/lib64/ruby/ptest/tool/test/runner.rb:4:in `<top (required)>'
	from ./test/runner.rb:5:in `require_relative'
	from ./test/runner.rb:5:in `<main>'

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/ruby/ruby_3.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
index 5a7b8137aa..c5609893ca 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -99,7 +99,7 @@ do_install:append:class-target () {
 
 do_install_ptest () {
     cp -rf ${S}/test ${D}${PTEST_PATH}/
-
+    install -D ${S}/tool/test/init.rb ${D}${PTEST_PATH}/tool/test/init.rb
     install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
-- 
2.25.1


