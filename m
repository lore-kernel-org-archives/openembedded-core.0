Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3AFC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 03:34:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20633.1659324862175321917
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 20:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SQ5KpXe9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52128a2068=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2713L4ct026971
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Aug 2022 03:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=rLd6kEdkMb3nTjok4OfA44WdUgpA+hPER2gBzVrhvuk=;
 b=SQ5KpXe95q8qbR6TJwEQySg7dxaz3L/yxxXDrWWWqE1DVBSEPqLaPPVsVSoKfd1sVvXL
 Thj/AInH/oCOZaoNReku7xjQtdK4moQKs+pbnbO6Xq0Ggbq0RfdZHlCBM+S7z9QjRvqY
 mlGCx0z9SOy1LnC5mK5tT8fN4KZGpJn9JaxVOnLWNwDtgMtwT0epH9S9nlqE1uCs4DVp
 +YfGgxrtBjFwBbHBNSLIzywWpdJPHEThy8T78Ae3FceInPCD94AoAt+MUAMEwpZ6nYta
 oZwpkm7yRdXITPmMlwPdCTgnJsqGxv1LNcStR8vs2L5oWM2sFIpCPyMNqOzgf7LPIAGg Sw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmum915mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 03:34:20 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 31 Jul 2022 20:34:19 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 31 Jul 2022 20:34:19 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][master][PATCH V2] apt: fix do_package_qa failure
Date: Mon, 1 Aug 2022 11:34:18 +0800
Message-ID: <20220801033418.1293523-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pWJk86B-ZUc_XgZ7SKvuGk1YWYXXpjmJ
X-Proofpoint-GUID: pWJk86B-ZUc_XgZ7SKvuGk1YWYXXpjmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-31_20,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=937 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 03:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168692

From: Changqing Li <changqing.li@windriver.com>

bitbake nativesdk-apt failed with error:
ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]

an empty dir apt is installed under /var/log/, fix the failure
by removing the empty dir apt as what we have done for target.
apt will create it when it does not exist.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 95c25e3036..cb29c41ce0 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -117,6 +117,7 @@ do_install:append:class-native() {
 
 do_install:append:class-nativesdk() {
 	customize_apt_conf_sample
+	rm -rf ${D}${localstatedir}/log
 }
 
 do_install:append:class-target() {
-- 
2.25.1


