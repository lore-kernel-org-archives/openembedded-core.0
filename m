Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3797CEA8102
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 11:52:44 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17707.1770724353715585414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 03:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=VnHXFzuT;
 spf=pass (domain: axis.com, ip: 52.101.72.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mulE+TvZD02ycnA4iHr03WPQ+IdUgdzKSqs5ltSkvsjNzy+Np7B2v8yHHRdfclZSIB0ukNIB3ct0Xl5y60NouB+mTVIMEgO9Rz5F8oxWU2wZ8dpoVzHuk0dDhScxtEpc4WPYa7DvV08WX2Vb6vu1yInT8D09BB3uc4J2cZu6denJ53gItwzhcLi1cHuFKkQBjH/ZNlPyDFt9GUUQMGtsc2UlYQYkMjyxVVquvB+/q1Lg1hun1aqdE1l2gx36uc4sGsUIAO1QQPa2F7czueI38y/arJTCSC/JniGMvdF1hFE8/CnwIERDse/r9rs4u9DoymBYLvmLcBv2WPLbNIZ6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ips5jptdt/c8+cw2InP8oIyp2e7N3QRRnvIJZ0bnoNc=;
 b=Vb3tuVuwuof6u/tG+x3N0AV4Xqut+A8Ha+jp9o9y0KReEGRTLNLM+eNC9LOasePm07jCCyczzIxbF2T1qSr0YgeuFMahhvJncX0yEj9SDQ7L7tt5SSOn8uGLpG9Sd68nB3wGc6s3d4yxG7BUsI96sEmwfiI8Zx69zVm4VAHnNK4ZMolkcM3UnsaNCXjpq2IrzjJv9FMIdY9d8s8zFM5RenHumhif5L3tGe1euInISUAt9s0sxhTDyDeywUoqQDoP7rdfGCYA8R36uOwBA4Dm/lRKksscMDtJ0ba9Yxu1cfoLpNUGiA5RFuesaEzmLIVO20FqvGornReA7fmvXv3S9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ips5jptdt/c8+cw2InP8oIyp2e7N3QRRnvIJZ0bnoNc=;
 b=VnHXFzuTysIRdblrHS2ql5mkmXvLX9hlVDNSrbz8jummmG+IsrXb7uIunzUza6Fi5TuKn0z0Za2+DUV4ptzu6M1R8dCJldFwweJ74qji/DdZKKVtnVApr9EEIXQfgLc0sSHwcFAuuQmBIuZM/rPUs5EV1GVZ6MwO4x3/eaHsH+A=
Received: from CWLP123CA0195.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::23)
 by DU4PR02MB11124.eurprd02.prod.outlook.com (2603:10a6:10:58e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 11:52:28 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:400:19c:cafe::15) by CWLP123CA0195.outlook.office365.com
 (2603:10a6:400:19c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 11:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 11:52:28 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 10 Feb
 2026 12:52:27 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 10 Feb 2026 12:52:27 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E934221B8
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 12:52:27 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E3A61120391; Tue, 10 Feb 2026 12:52:27 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] curl: Backport a patch to make curl work when aws support is disabled
Date: Tue, 10 Feb 2026 12:52:25 +0100
Message-ID: <20260210115225.1281101-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|DU4PR02MB11124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb51cc1-3fd9-42b8-9657-08de689add80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F7qVV3VyfqtHZlT4NzwyqWcb3xax2z6an9Qb4Vf8TILH8sSD+pUeLbr6kQEp?=
 =?us-ascii?Q?NnuD+9RrmYuuy3S/etGfiJvvOkj0hedUsKRrovpkPyswCd2DdaqzzMStAVtW?=
 =?us-ascii?Q?3MTCLulxxD3XRdDFWof448kiRIdUvHPkUcIbaIgINB0y1I4UKMwc/E3qSEGs?=
 =?us-ascii?Q?OPA1cdxT2s0FnLWBWehT5bA8zqUkS2oqlxx2B3QVm4wtwT8UjlE1rOP1NsVe?=
 =?us-ascii?Q?43jY3fqrYZ684O5LE5ri0Un4Ts/gwok7rfCBd2n8lfXB97QEDMFZe8khat0C?=
 =?us-ascii?Q?AFOMRXmw5twEYvVcgLwrt3K/xVRq+3sEc9eLnee5v/hS98mWY3UPTVINBWux?=
 =?us-ascii?Q?N9FIaMQwg1oqWmZ4nE4iHtJaqKv9QELDdpNfwKBaQnLJMcuhqqPESg9TJ5AQ?=
 =?us-ascii?Q?/QkPAZxQhNVe3amjfVgXYurz5rjeJvyLwssx3sBXeGfSNb/UfkuLUiaNxMfm?=
 =?us-ascii?Q?uHF8gp1biqPw/CJHTFRUimfTUdGfvICuH5CtJHdCjhbbS0pnk/h5F5MzN7x/?=
 =?us-ascii?Q?L3LRwA6FZuE/NlTS3tzeOGKlF3SJAXx4Ne/3Ex9ZYCT9uup+fvsyW1YmsTMm?=
 =?us-ascii?Q?NEdYRcuFX5fKoZHDzFoSLhBNo8o47C0xPyVzh7NXsEIeslPy2snEyohCpB9K?=
 =?us-ascii?Q?CsAINYXMPjpmQ2Pd4hhEO4H7CJVXIPVjZq76FEReBlP8D9+R46hatb8RaRHl?=
 =?us-ascii?Q?DBL2ia+AaqBAVWUM4HPK3oCPL56jfE1hvOFoo1yviRvtVqIrVLHN25b5Yq+M?=
 =?us-ascii?Q?YCoLSJuhD6n0LRwIfn6LZ8aEy/mVP8AeyrWHHxwZi6G8WT+Ibhl2HLcrccYG?=
 =?us-ascii?Q?j3jMgWS3CZMgRaXRVs8BmjUVETe41ZSkHZsCV1h43K6Yn3zumlwPpz+yw/d6?=
 =?us-ascii?Q?aYj5pyWpx+MJJoWiSBbx8APOOa9emmfLTJNAmY53+4lD8YyxTduuIA3pORJQ?=
 =?us-ascii?Q?KE/mBiQBgigMRQnrKHcs1aKJ21jYmy59rcQbiRiFB/2zMDvkTwWVHFzdtgDP?=
 =?us-ascii?Q?XdFh1GEgupqOV42kRrOryflUaqT94R8c5WMu4emDpe3t1kSj3oxFKh9N+nFF?=
 =?us-ascii?Q?CAJct/NZ18qgE6OiO8fTM0UASBXgyexir7JSZjoMeqE7iUVWMdZhGQGy/BtC?=
 =?us-ascii?Q?DjLfm0EhwgwHLd6cgVCqCjo+Zc0NmnzLOUXwHLuIUgMy5W3SY0mpxYNQxS7C?=
 =?us-ascii?Q?m/6qAfkY9af8LwnKm2ds3dRnfVusrNBQbUBel6UX1YMmwjSzwCOgPKNTwBMT?=
 =?us-ascii?Q?hxzjBRJEpqxfbSx82ghOFoZbM5fKpJ6aYgKF3XQn70KL9vrYf0IELeeVHz0n?=
 =?us-ascii?Q?Ry9UTJfzNO9y1MqIMwcYAKw/HCnA37n7WHbmE6CIzaMCVFJxLejn3QEEu57g?=
 =?us-ascii?Q?toX3ZMgeQ8oRH8xZ6V0kYrjInCr2aVnCpVbkG02AUpqW6aGBFEc2p88nOQkG?=
 =?us-ascii?Q?JPLU65v9UgSK9Xh5Uhvc/cYhWNpz3gLhDfNXZvuXg3WTD8TJ39hCiaTC+HCC?=
 =?us-ascii?Q?Wz+09yTXLhEP/Qklc8cYzJ7/Jq+axlIH7Xa9eNb3WNh4yQdDDGGags7mlcbd?=
 =?us-ascii?Q?FgwDZFfgmlF19WoKwZc1kQUUK93dwTcON9guyrWYzyI0SvEC+eDLcKIrG8j6?=
 =?us-ascii?Q?AQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Gyc9K1XhJA0AkYfT5e2sk4xUXZf/+1bnJ3OBD2QSBWqJ0OAS7JSrnMJTcGxCNIISPFlm7Ha4pfBt9lEZ1DMbuOL7FfgXJqNuIWxYz1Eje5BRDJ2FTIRBgaQHGJZG1sZAyf8U+7Ljvq9aQeFpaxGMIbDz2m53+omhk6NARC/0XFaH09dnE/+qygD0uyUNbDlt2+CmMsxljnQeBubjzJYElUcAOywXo6xRHzkj505DCV+irMbShWaiyBXvRUor76NkbJFiKwfZJiJxXs3v8nh1na2dPFRIpocJX9AZJq1v/zGp6U8V2KE1hJpvFQY9FbxlT1aGFgVmXRB53q94yvTQ2RwN3p3KgzHpvqlu9aqz0Va7F2IGdcozZhVH2SS63FILMYbLlcfKJPtDAmjvQK70N4SU7eTBQT+8XGbuvoMOnHRbFw2OMAMdPkdDnrh7MA9l
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 11:52:28.3265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb51cc1-3fd9-42b8-9657-08de689add80
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 11:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230887

This avoids the following error when using curl from curl-native:

  $ oe-run-native curl-native curl https://www.example.com
  Getting sysroot...
  curl: (48) An unknown option was passed in to libcurl

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ix-for-disable-aws-build-configurati.patch | 33 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.18.0.bb      |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-config2setopts-fix-=
for-disable-aws-build-configurati.patch

diff --git a/meta/recipes-support/curl/curl/0001-config2setopts-fix-for-dis=
able-aws-build-configurati.patch b/meta/recipes-support/curl/curl/0001-conf=
ig2setopts-fix-for-disable-aws-build-configurati.patch
new file mode 100644
index 0000000000..9294094ecf
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-config2setopts-fix-for-disable-aw=
s-build-configurati.patch
@@ -0,0 +1,33 @@
+From a87f346189ffdc7559771c20961a7c294ed8ba5c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Maksim=3D20=3DC5=3D9Aciepanienka?=3D <msciepanienka@gmai=
l.com>
+Date: Tue, 20 Jan 2026 04:19:06 +0100
+Subject: [PATCH] config2setopts: fix for --disable-aws build configuration
+
+Closes #20368
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a87f346189f=
fdc7559771c20961a7c294ed8ba5c]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ src/config2setopts.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/config2setopts.c b/src/config2setopts.c
+index 5e1722c3ee..a023287834 100644
+--- a/src/config2setopts.c
++++ b/src/config2setopts.c
+@@ -486,12 +486,14 @@ static CURLcode ssl_setopts(struct OperationConfig *=
config, CURL *curl)
+ /* only called for HTTP transfers */
+ static CURLcode http_setopts(struct OperationConfig *config, CURL *curl)
+ {
+-  CURLcode result;
++  CURLcode result =3D CURLE_OK;
+   long postRedir =3D 0;
+=20
+   my_setopt_long(curl, CURLOPT_FOLLOWLOCATION, config->followlocation);
+   my_setopt_long(curl, CURLOPT_UNRESTRICTED_AUTH, config->unrestricted_au=
th);
++#ifndef CURL_DISABLE_AWS
+   MY_SETOPT_STR(curl, CURLOPT_AWS_SIGV4, config->aws_sigv4);
++#endif
+   my_setopt_long(curl, CURLOPT_AUTOREFERER, config->autoreferer);
+=20
+   if(config->proxyheaders) {
diff --git a/meta/recipes-support/curl/curl_8.18.0.bb b/meta/recipes-suppor=
t/curl/curl_8.18.0.bb
index b94da348b7..a151a7be8c 100644
--- a/meta/recipes-support/curl/curl_8.18.0.bb
+++ b/meta/recipes-support/curl/curl_8.18.0.bb
@@ -14,10 +14,11 @@ SRC_URI =3D " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://0001-config2setopts-fix-for-disable-aws-build-configurati.patch=
 \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
-           file://environment.d-curl.sh \
+    file://environment.d-curl.sh \
 "
=20
 SRC_URI[sha256sum] =3D "40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd1=
3100e2c9a91946"

