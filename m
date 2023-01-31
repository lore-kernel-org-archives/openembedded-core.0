Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF75C636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 09:40:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8527.1675158017008723179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 01:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YXh0VQ0J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=139550ef7e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V94Flb014968
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 09:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ICSBkMD8jeh2dMwkYL6zysP+QPp5Mp22fIBGQ1RYCpU=;
 b=YXh0VQ0JZDAOnzeuAHB3pXuAEsBLS4w+p0kKAmoqO968a4LGCNPuI2MgOUQlbtWy6BKU
 R2V1Qshg2s/9T4rxJ99rh22R2YYGoyy8GUffz09CxEPHoP6vAJA2ij7HzXl0/qYI9+nW
 vPU+21iY1FnZlwOtsSvaXcMrkBqfdc81P56ZSCV/pIyW5imSpKqvH0TBP+1iqJD+TKxU
 CA2Air51oYQjK4JfJxXezN6meF9/5zA+U0On6l21nwEzg7zJWbJjBGmd2cDVKVi0VfLK
 9sEoGer/xulaSWbP5cEyEThxvtQ5zpnCmCWr9Tz6wmM0g+8Tv445UVpGwWWuI4avCM22 aA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpau4vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 09:40:15 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 01:40:14 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 01:40:14 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] apt: fix do_package_qa failure
Date: Tue, 31 Jan 2023 17:40:13 +0800
Message-ID: <20230131094013.3582685-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aADRV-H9ckoyVR8knir1YAqISL9M3XYI
X-Proofpoint-ORIG-GUID: aADRV-H9ckoyVR8knir1YAqISL9M3XYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_04,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=829 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 09:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176513

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
index 4ecbf98554..7af9792a0d 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -127,6 +127,7 @@ do_install:append:class-native() {
 
 do_install:append:class-nativesdk() {
 	customize_apt_conf_sample
+        rm -rf ${D}${localstatedir}/log
 }
 
 do_install:append:class-target() {
-- 
2.25.1


