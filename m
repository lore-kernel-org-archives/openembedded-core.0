Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A26CD72342
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 07:35:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.113])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63276.1769153745196872210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 23:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=Xy0rwvcE;
 spf=pass (domain: witekio.com, ip: 52.101.70.113, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x01BWaN6/VBUStgJ1dGL1Fx8hVVEpObm2Md3Dm/ZPyeaOlU/raGbmNgL+TofzlCuxFS9IR2czbbT6/SA+O7lZFEDLhXCsie9tLJmioWPdAd/WR9a2uL/klHeupcQ1CBgMjSHqcLLFvPknA3NF4rji5CdpF1l0WqT+tHaIuAmwXwLNiKIgNa6C6XatRHr42S120GMgbAkfJ81/vBW6QPj3xLSHIhHA1JO4/wc2/efB+m28XFhUCtRoqpOhQBXRVaeSeQMROtUC2cFXWTCXuaw/D/SvUMyK6G8iwL9uDg5HmrA2yLTNeeuwlGp7jTx4MbQLR5O8pqecNIfW+Bg4Zxb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n/mM+J5VKLWEYhnToEfJnNxpTRymZdD2cYsppS1fN8=;
 b=nFlGQhLS0/BDPYlUU1m5JqQ7qwLnMoQYi7JnBkkX/AiciFM90QvBTkF1rEUtzgbM3rth9ucjh9/d8u1X5MUupQrbPM4wnAYIFcG5mMzl78CXpaqiCSZEq2NJ/AYsZofhTGNbwh6I87+kqDlQkTjka8cg6ziqbNvxpSc/RY422j9WiZBVC/YqV0oySJ/IqSohm/aWVuQPnvZmwj08qEfahgkacSFUzGLfRUqUTO30yKp8khf/SQi2FZzoW72R+XVLk0A0FP61TI/kXxQEtWO6Sbjj/E0gKmuEer8YkBYu544Tcu/e2BK/Xe5lZk2VZQERdB5ZWnbRTSmu93IJsVa4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n/mM+J5VKLWEYhnToEfJnNxpTRymZdD2cYsppS1fN8=;
 b=Xy0rwvcEdbznITWgrxSBvwkeyQdTJ/b3UHHr7lb/BJGRDGUGOvBzkS1TG63M/u30O6gPE11VS8sYYadhIvESyr8BZzY+WwRyqwBPWCdThWR+6+cZ0x+9M1MRy/eLLnTzZRHkRgCklJbpUBVmEUn+NCHFbmHFjv1VT8Pt9rGNMprGprFCKEjft8X0uLBic12epGTmlCFh4lYRvcd6kfH29DpwL99Znn/oYlDtHuxU+23Kxa/n4sdwDUlsvZ/BQuRzfdIwObwuzfHAuXhOT42VgckbDMlxsJDoCzgqUzgdIg5m+egX6cxCjjixP3/ip46UsEjnrB/5woGPYKShOucjvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AM7PPF4055DB9FB.EURP192.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::64b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 07:35:40 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::7e78:af5f:27db:d020]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::7e78:af5f:27db:d020%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:35:40 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] libtasn1: Fix CVE-2025-13151
Date: Fri, 23 Jan 2026 08:35:28 +0100
Message-ID: <20260123073528.2350669-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0337.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::13) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AM7PPF4055DB9FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc0dc84-8dbd-493b-ddf6-08de5a5201f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|10070799003|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jv+dge2PWgzisbzOQSEqgcRkGW3/z3sALgjkIdQlkBYGkB0i+cyypO2RmWZl?=
 =?us-ascii?Q?2kMjylx1pQZZiioydaN9jmKzXOw+LGGb4OObbO1O+AjSb2WYhMi6eczHmd7W?=
 =?us-ascii?Q?07mLPt+8yrW+sifxrGXIb0DFg46wW+dVbEAUl0MUdfg7AmyZUr1UKW47hDnu?=
 =?us-ascii?Q?MOA9nsltjBaabYsZAW+0QnsgA7MAg9jMFgcfyN4lAnmlbxROA6NHTvXL10W5?=
 =?us-ascii?Q?wzpMRqP2ijbTYEbcmqoGIG8U8/MxeXcIIAf5ghKYz20gXeqzLxODkgGPs1nm?=
 =?us-ascii?Q?0uU9NnEeDAXOJF7CMSrdF7rR2BPnYAozVclZRz9+zgwgRcexD9uVuWAnrqkn?=
 =?us-ascii?Q?wnNFhpUXQ5Y63SUz+grARfjEwLAsxmRoP4QJK2KnsdIjFazVb00og4q7aV4o?=
 =?us-ascii?Q?hHM6IIqCG0qFzbra4YXnZJ6EpUNx7ntKft0D6D1mEB8CdLoXjvSkAPPp7SwC?=
 =?us-ascii?Q?cFEYqvTzcGiTqqwBOmMP9IsY7wOeDDJpePHofWsdXZYxOJ0S8s+U0wdcPNux?=
 =?us-ascii?Q?A7AW4Ns6V1BX5jFbTJKCz6FIGGF6XwnNS2XCO2Y1rUJtX9XegWlp4+CdwxU8?=
 =?us-ascii?Q?7sItT28QzQB/rGDnWVD2tXIrd2kyUjZJW2HRcPIT7DE7InOONZm7/6F+Q9Rs?=
 =?us-ascii?Q?8klho5P1lDZKpUYckSpqns/HTuWsmvVVLjmdfKQ81r5OUnGNF0yJ5s6vCOaH?=
 =?us-ascii?Q?bOyDXY9gAPtmi31lnIL6WLkStW/gygBDGHveX8OYPsRMOG3j+s+PJVrQ978t?=
 =?us-ascii?Q?DyHH/9BLy1ApgZpMxR1WigpOd9sE+2blH4dtxTgCl9UaKyllPSsVya5u0aNI?=
 =?us-ascii?Q?Xo5jXL8rHgC2t60lrxLxpCbeFHe2ANM1E9J6oM8/kusLhmk8Kn5NetcWLcDG?=
 =?us-ascii?Q?p6OlhLuv9kS3fOBgutAbbwh8M//15c/w1jVSWqMK2h4+SBSbBHSbnuUVgX+C?=
 =?us-ascii?Q?pGdxoZ3lNgSyEGIbFPfurP+7m+CgfcPfJmJfLdH4KkBs0FJgx2d2Dvrl+H0m?=
 =?us-ascii?Q?IPZV9VECo47BNPI5Cx/v2yM6vgdSbRJV5mBoHwsknxWijrkmdvWOHIh61p+J?=
 =?us-ascii?Q?HaoN1DKTEZNlyEikMuAdngYv8Y/lPmzqd8LgrFpWiiwQMcelndipNZJT/0Xs?=
 =?us-ascii?Q?ubxL2MLWTIZLuF7qkgeOcNTdxFmc4XBiuhuo2oQ3sCwKgZWODkJ0hkaLEmOJ?=
 =?us-ascii?Q?hyWwqb1EaaTKxP9bB70C5+ziK5qaF1eGr1rsOIcpSYdysIQONpxaqAgAIKx4?=
 =?us-ascii?Q?UmB0T+02Bx9Z0WwSAAsuRGgqxmYtAsHEd+qU6FJ4ZeIorrBEjJhM1deJgVof?=
 =?us-ascii?Q?5nnm/XGNM7Sd5yPqWWtnNM/G2zweO90uOw5/F5PyHej7dQwLzmPyBvWiyYOs?=
 =?us-ascii?Q?/a9XhWawg1Y4g3Ut+Amgddm62NoeC/VttW0SS/flIjfwTv4sAv1jOfWVOZIw?=
 =?us-ascii?Q?z8LbUbecDOqqj/S8LTZ9EVbjcT/8sK3I2v3lwWoSCNnmfCyxgBOf1Fgq/Lgj?=
 =?us-ascii?Q?U5FzxXp58HN66ZEBPBs+9YZXHlMbkwlx9hUoOrP4I61qmm7Xzx/8O2v4A459?=
 =?us-ascii?Q?CgNktQO6goHPwFE5+8k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(10070799003)(366016)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CRLx/V813IajyyYgSx8wvlM9U9vKPEHwfcwVHqy4rBqdqYuVP8TZnjO3zNyH?=
 =?us-ascii?Q?Eq1L2pCzCRVoisrdhHckKIVQtuQK1hx5A44pubqUWDR5ri5lzdIAc1EGFQfP?=
 =?us-ascii?Q?XT1eEL2Y7e1pcFpUZO+jK8dCC5mGLXAYZWBzJwpP90VEjxJ5ZQ3WxJ8745fL?=
 =?us-ascii?Q?0gPK9zXoP2KaItLD+m58LRGtCiXIe9bQWCmFKykny4tqksctVPrArT1y5J3X?=
 =?us-ascii?Q?ACNwbk7a8CUzRNkadrD2AxP8xZREttx8rBqYdJA6iYPFAXJ6fn0VbJAsBYkx?=
 =?us-ascii?Q?gg2gWwOaF6pEJFlu4TrP2ele0c+ckmaUPWjvwO50KPz8ahqTW142DfmDN0zJ?=
 =?us-ascii?Q?KpOwTV9XcR7QxhdNSRrAOmj5bAELHP1RnsRwioFHlxikF00iVG6BLHqcL5gF?=
 =?us-ascii?Q?6iBKJhzNnwJs/H/xrLC2omBcm/kQ7bhh9BeeaYKaxRkioNQRgECRcibexDlo?=
 =?us-ascii?Q?b0txaNboq/dPu+I5RqVMXoyqmRdK8gqDMMVi+11bWAuJIWjxr1PUM83iMRuA?=
 =?us-ascii?Q?VohbMIQrYxxjo1HeoNP7g8qZeCIDi5rS7ukTj5S3UmKfnJKHp0vPuGG5yAAo?=
 =?us-ascii?Q?qh7R40CBFK+eXqpqVdn1QVps+3GdepBScWdCJRQn0PpAt3f8vq3xvSD4q+f9?=
 =?us-ascii?Q?nAF5LvTf3JcmgjM0wDYuUaAgfu7Ag1gPo/HD5apkwpSDBm1HU2FueWDSN5wG?=
 =?us-ascii?Q?1wjpBwxxNgil5ci06HxKYJ/Dgq9I1caWtJw9GZlMqX4qKIt9oWMtldY58ZZp?=
 =?us-ascii?Q?/EsnRDqeOjoCrJhofi5RBNnUDD2o3gsMgqSpHUZRyU2SUdRrfVIUDATFsxid?=
 =?us-ascii?Q?hekJdCcCSU0WZj555WX5zW04xalAJdF6BnZoz/oEsTEz4/vnDYhQDizJ1Wr+?=
 =?us-ascii?Q?8eovGHWTTPvcBQgGshEnkAdSK9MSeTedZNvxcvVgpg9KMnX2dC0ltgIaOkrc?=
 =?us-ascii?Q?R3x52qPdBoBaSvGyIAqYpUHzuViUxdLeCNA26ga9rai00SvCeZ+qFXM3U6E6?=
 =?us-ascii?Q?lQ8sRBXrlatJmyaYgopQkiZ12WnIDNa1Putvx8sFFr1Iskn8QVz6OFdAGkpE?=
 =?us-ascii?Q?UNmpdIjTM2UPKbCajLmWapiPf0VpZjpSxfTK4RCRgGVE2pXaoljHly5X6Bmf?=
 =?us-ascii?Q?mJQw73t72wnWW/oTBhdPFk/kJ5LMpoaGL06gz8THubEgvQ4+Pgl1N577iMIn?=
 =?us-ascii?Q?V2e+VYJTzkUpCqw7ff39YUQM8OgETWYPbQfeEApzShbKwUXmIpLzopC9JXWd?=
 =?us-ascii?Q?QtUN/C8k2+Wwy05zfmaIctxwyuisjehQ4wIUpbvOxgGpCXcg3bti2WHVq1zJ?=
 =?us-ascii?Q?51a1IWFsIR769Q8eyr824n5n6VoSZM/QmYKXo/gYLrcuxJN6czXgLCRLJIQb?=
 =?us-ascii?Q?G0vgwNDFkIctGfX46rmg9eq+Lm3RYrhfyqEg9ejYiPyy2hP2QU2Ef1+mbeZX?=
 =?us-ascii?Q?kM+oSQIQW7IL9oagj3Xbe+gE1MlHgjFa1N+/z1moW9rxFNdQjgL2zfZQJmxy?=
 =?us-ascii?Q?eRc/lteABmGIEjKsMFSTGm3ySIS8tkyloaRjDYp2RswHRU3nP0RNs4sCzW5x?=
 =?us-ascii?Q?ew2/2P3/3SGDDAHG+uGLipo+NRBHw1eRO5EOhufQHhWA7cc5QncIKaECpOLm?=
 =?us-ascii?Q?N2pNOOW3Lg/U7LCvbZTMpQb82ZPLtNC2t+MjZYbjqo58IS8iXDUQek9Vu9F/?=
 =?us-ascii?Q?Ftj676WNXmQfOMgA4zCnfVtdqpTZ0ZMARduqx0YSoW+ja0jS6nmmnDKb0QHY?=
 =?us-ascii?Q?N/FfTsvnJ7xpOLNCG3r3G+vqWPzwq8UaR8tVrVpostTlHNyMAJcg1aOYiPR7?=
X-MS-Exchange-AntiSpam-MessageData-1: AGK5xcaxG2G6JQ==
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc0dc84-8dbd-493b-ddf6-08de5a5201f1
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:35:40.0453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1AQbvp2F+4rIbIpMoU+aIYMFreZJKO26ikruqCKqCf6P4B6GXsdMkuzsUKrWR7MpjWazUwNWHkn2iP8uFmgHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF4055DB9FB
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 07:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229873

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.com/gnutls/libtasn1/-/commit/=
d276cc495a2a32b182c3c39851f1ba58f2d9f9b8

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../gnutls/libtasn1/CVE-2025-13151.patch      | 30 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.pat=
ch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch b/me=
ta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
new file mode 100644
index 0000000000..5047d67984
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
@@ -0,0 +1,30 @@
+From ff7aa7ef2b9ba41df8f2d1e71b05bf2c2ad868dd Mon Sep 17 00:00:00 2001
+From: Vijay Sarvepalli <vssarvepalli@cert.org>
+Date: Mon, 22 Dec 2025 12:24:27 -0500
+Subject: [PATCH] Fix for CVE-2025-13151 Buffer overflow
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/d27=
6cc495a2a32b182c3c39851f1ba58f2d9f9b8]
+CVE: CVE-2025-13151
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/decoding.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 1e0fcb3..abcb49f 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1983,7 +1983,7 @@ int
+ asn1_expand_octet_string (asn1_node_const definitions, asn1_node *element=
,
+ 			  const char *octetName, const char *objectName)
+ {
+-  char name[2 * ASN1_MAX_NAME_SIZE + 1], value[ASN1_MAX_NAME_SIZE];
++  char name[2 * ASN1_MAX_NAME_SIZE + 2], value[ASN1_MAX_NAME_SIZE];
+   int retCode =3D ASN1_SUCCESS, result;
+   int len, len2, len3;
+   asn1_node_const p2;
+--=20
+2.47.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-=
support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1d..bfc011a2f1 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464 \
=20
 SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2025-13151.patch \
            "
=20
 DEPENDS =3D "bison-native"
--=20
2.43.0


