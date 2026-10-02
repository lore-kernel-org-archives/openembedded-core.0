Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135E1CA5FE1
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:16:16 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5975.1790925367210363324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=D3c8oXnj;
 spf=pass (domain: est.tech, ip: 52.101.65.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzNEhCBrA7eXMrS4UqzeiDOUI/5rnnsBslm2zx9FbMjIIKPwBw6IQaiE4A/Nz8TEFzPZ6RAutgNMa74xpO4ZLHtr3yk55gGsayXE0nPw2dET1+7CBLXdf9OSGaVhlY25Z/bdiP/uFZBLPtQlaKzBvJ8QXWp38CAo9HlWGv3W8NKx8Z/9LWSe2fwlkeuiRlNXHcGcpimSt858rgG/USF53nvRVOrX9T7HStMuCtKNLCUtJjz7VzQ819FSBTgZJAwH0GUIE7oUsdwnpsa1tgmPuBgZNKGFzP8ZafgPIL47hmrUdT7nAZNEmByTDYDlHT0HL5TUP2+wN2Ghe831DHpvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQWRqlMKf/FF2AM3NxvQwKsfi4ElkaHML+9ARUToDLo=;
 b=wB2nY6ngmphIA/ASpNCvJU6IXNtHHk7xaTFCSYrRDolisiG28CYS0Hg1H49VC0c0QpUcKbvof6OFZGxxJuqM+MPygA4nek+qQOb9TD+fivr2TwHEm2osiao/yzY93W7seXTbEd/9c9MXkctzCNLu/CthPYTq2evL0wvuPQW5IKY8WzNt/hrZZVsux4qmWsNjCLVeo1pB/3fSVwwb8Z4yUKURjrZh2I4eQ6h51bfk2M6WCbcn1etEBHCy8l8Qc7DMXYYkHV2IHbkut/jC2XyzUlGAdkuHpV8y9Ae94xsZymrP3lE7OswEP8FdvMhuUz7G4pvaBDU0bu88XyFT8gS8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQWRqlMKf/FF2AM3NxvQwKsfi4ElkaHML+9ARUToDLo=;
 b=D3c8oXnj7+1b/tqqern1hKby/lEoxLqWdpR4IHZReNIDNFDZ5F6pbP2N5t//OZgjf9fTVyXe0+Yi3m5z4S/bxrlT4sO6qSzlUjmrp3OXQXCcHksw8oJbyGxd/uzI6JO2ShHEljECiXwL1Y0/lA719EHRa8G0vTHCmGMdkvU5LPUCJk8YYBr3+ybPVLu+36cZS03sQUnhxmzt4mvUNbCoiWI7fmyUUelnR85Yn3Ykb+ML8kP+4vlD+PMNvq1Xax/5f+O5L1+s9wc5d8Xazmx+HSn2xZlEL1yvJOQnE8GppI5bwBQMDye0ejIQUM4sqxtfaSJye0M2hRchTmfxFC/WcA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU7PPFF852A1B5A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aee) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:16:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 07:16:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libjitterentropy: upgrade 3.6.3 -> 3.7.0
Date: Fri,  2 Oct 2026 09:15:54 +0200
Message-ID: <20261002071557.74249-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0608.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU7PPFF852A1B5A:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1ef7f6-842a-41d4-aab9-08df20550325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|3023799007|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	OV92Jo5tNfE9M21P8MLEFDPo6XIe+c89T7Vlui6SWylGj9M0Y3xonMW5Dew1CUJdGvb6+MqfEelLQFPi6ORIynzFD+++yGxhOfRMh50jmc2bzapy3pMZEBxVsCbxg/fnuydICKO60jxNDZu+fcpLZv00twBCHe/SHkNcmVIlCWosv6BVk/NwuAp8umjYx7PzdvLmzbpxtU0DutwZCznZmJUKlbMkHgjSx7rwjgD5Aqa5ddkR6JG9/sX5+UefbiPJl7Ul3rETs4eQa8meQv4Rub+aNYzZf+XtvKxt4NKVeDCJU9pjkaFujzTFyYNscYNbk/lf7Zg1xL51b+lTDLXEe69G0WQ9kCcUqm6u/FJCS9Cpe19S2DEZXx7asPE46pUXdd4POOXGF3I8Ah7NaLMY87sUnTXvxuYKIMiEo/TCF5o6zpGfEFvEbaM5RBtaP/Y/+8gtQ3b2RrYvBdTHZHkkr3uz/4oyrO+gJZvdxfQk8rY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(3023799007)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NvdhFNIhI9fGHEkHWFm7dNPIEckUw9e0iNv5Ucn0xaWCjmAQl+eoojC0D2vK?=
 =?us-ascii?Q?6ArofNWO3iwHCmdqL25U1bF50EIgO+6P0jlLsUOrS7i33eLDdqGoOljtO0fO?=
 =?us-ascii?Q?D/ostnStdg3YNiWPWDsg1khmpTJPiPPtTuoEid2Gv2Gdjo4CldHCSwUuq7DF?=
 =?us-ascii?Q?Enoo7encnNt99pnpSlJbyrjqsKi60SayFPVAmSHQUBMuavVluzu5JuittVTs?=
 =?us-ascii?Q?Uc3TJgxgYTfmXJpKMk6nnd3y5rkYcjV/W2BFFSly32JFb+S6HOOytCPCIWtZ?=
 =?us-ascii?Q?LIodPABbzJ66w42KVrlGp/KEVmN2ZzxLL/ipDEX1SOTcINm3AMfIw8PB++0w?=
 =?us-ascii?Q?ZlyS/iZsiLYXy339jzFYAJQ7ukABlOAv2vOkUTcFg6Yux6YwcEizwp8bG0ff?=
 =?us-ascii?Q?uGMojDdoYHhpwUW49MyfGL4/rOM2Gt9IdXlCpejk8Hr34iBLxknNAhPAxmi7?=
 =?us-ascii?Q?HAIqV6rz4zpZzil78Z9mLlMgMo6CcZ84YwUPInTbPNrBg0WtAqQBMeJ6GU0T?=
 =?us-ascii?Q?Vey94F0MiEITlhpy8p5RBc28OTh9+5GeTO0trSN7QDY1stToAT1b9QgXvZVO?=
 =?us-ascii?Q?vD+HFRFh/UgEWxxdn7BoTl5w6C7SDIf3nvKmiU3AGS7AQ2F1mHRogU7Ccj7S?=
 =?us-ascii?Q?LgRKhxh+C3qteR+P5V2dhKTdNgNywcA1uJctAKEKNy7uTfwyr97bbyt5a6Be?=
 =?us-ascii?Q?YUgW9Mn3K/gItmZPzAaVAyvlXCTB8gaKoue2CW1TDOelH9EthH1qprgDDjvr?=
 =?us-ascii?Q?VQFC/KeUZqyAUmyv9wvuCSatoz50EDt7ziea8/2RqcsXgjDx5cITDRzrxURv?=
 =?us-ascii?Q?DTf8gSnEh/NyWsrnzM2FneIRKMCLPJWReniiUkv4UAvvK7OS/FmQ76hQQ786?=
 =?us-ascii?Q?xVF1WDFaHWff2IVUApDyPxNVzlzHVINytBP29A5rkZ31Znw5euhjCGhmpMbc?=
 =?us-ascii?Q?HTqvnYgt+oggzZlNJhN+USBMoLk/0rjac+9Jj8ZLQA8Sepa7eSA3Mlm2Bhrg?=
 =?us-ascii?Q?DicNMzIlJIFeXY782yfllimxeYmLLT1PGqve0zdMW8FRck5vfycr6KDKs4Wn?=
 =?us-ascii?Q?IWyFcsk3u8hWfrRgtj5UqkbkNjPIY0imsla4B6HqHlYcBTOol9kI8Ov5QvmD?=
 =?us-ascii?Q?G7Z8p9fgTp26/fQ4otNCJaErj3rWJHST/OkzDHC/0TAv5j3MXRkZkoMD4WNm?=
 =?us-ascii?Q?fzuunQ84yZCVIRbukz28V6PU/xRNvJX3zqAxVt7cWJ9f3n5jGKyiMc2DI0W7?=
 =?us-ascii?Q?LCla95Pbci2DqKl4FiVq5AED02QZeJZ7tLXT+X7gtvbGN4mqlthwYY69ZAou?=
 =?us-ascii?Q?abxcZ+ZEaHOXo8ayFLzSWpngsXXItPXjVTg04q+Oy7hUxZX9ecjaJw1G04Rf?=
 =?us-ascii?Q?FLeCdDsETdWUXBvJ90RAdOyMFLrTIwhkGxoENnlrmFrM5PnqatlzilhqXqoI?=
 =?us-ascii?Q?ZJcxJZQ8QDY8bhdVAq6LKQsRluIhsc9SVUGHfcn+2lfQ+ZWUmtFE305S73Y1?=
 =?us-ascii?Q?hiWcNWEVSrbVmK6N6MXMFj5rwDviW+K+dt9zRimkPbo7dp2E4RNqNV3T5VdH?=
 =?us-ascii?Q?imC6cXu5YLsspSMuhHE9hUtUAQQ8JALnMw+qWO1teuZcUdcLchf7Qww5kWdu?=
 =?us-ascii?Q?5LWtt702pYrQ4FQiRN4QB60Xe4JDgVE/2OAtXbSJt3+JfzLC/2CxVT3Mb/q/?=
 =?us-ascii?Q?stYQ1K0qt5k5lzyinOwd/wZoeBThi9uPh1bw3DHMH/oyf4XDLqZwCTTWmbkt?=
 =?us-ascii?Q?VpsTTUmo+w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1ef7f6-842a-41d4-aab9-08df20550325
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:16:00.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuNfIMFReFLOc0QH1izMS71noklzoiOcXr+170V5tLwKt8k5iJ8R2ZSI3Al/2HnbkwBLcA5SXyA+sG9Rnz7ClFp+UByc9cZYWJe+ovq0gzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFF852A1B5A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247069

Source: CHANGES.md

3.7.0
 * Add secure memory implementation for Linux and {Net,Open,Free}BSD, MacOS=
 and Windows
 * Update supported CMake version to 3.10
 * doc: use Doxygen-style comments
 * NTG.1 compliance: Modify startup such that the memory access and SHA-3 l=
oop are treated as independent noise sources which are sampled to collect a=
t least 240 bits each before first block of random numbers is released
 * Remove all code when JENT_CONF_DISABLE_LOOP_SHUFFLE is unset. This code =
is already discouraged for a long time. Now it is taken out for good.
 * If cache size cannot be detected from base system (e.g. virtualization),=
 use the requested memory size.
 * Change the stuck test to always calculate the absolute values of the 2nd=
 and 3rd discrete derivation of time.
 * Replace SHA3-256 output generation with XDRBG-256
 * Prune the jitterentropy.h header file of internal definitions and delcar=
ations which are moved to src/jitterentropy-internal.h. With that, jitteren=
tropy.h only contains the API. This modification does not alter the Jitter =
RNG behavior at all.
 * Update secure storage memory implementation for libgcrypt and OpenSSL
 * Add API jent_status

License-Update: copyright years updated.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{libjitterentropy_3.6.3.bb =3D> libjitterentropy_3.7.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.3.bb =
=3D> libjitterentropy_3.7.0.bb} (89%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.b=
b b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
similarity index 89%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
index 776cfe9785f..ed3d850e81a 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
@@ -5,12 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that =
is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE =3D "http://www.chronox.de/jent.html"
 LICENSE =3D "BSD-3-Clause OR GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De01027c4ad1fe5a4768f8488c945d49=
1 \
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcaa2e2fa77c4ea22e45bf79e9a4109=
3 \
                     file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e68b=
5c50a \
                     file://LICENSE.bsd;md5=3D66a5cedaf62c4b2637025f049f9b8=
26f \
                     "
 SRC_URI =3D "git://github.com/smuellerDD/jitterentropy-library.git;branch=
=3Dmaster;protocol=3Dhttps;tag=3Dv${PV}"
-SRCREV =3D "c90ff465dcdb6a6949542c72a26a8ab496daa8cb"
+SRCREV =3D "e783cf1c450bce4d72f95c9f9c84546a6094976a"
=20
 do_configure[noexec] =3D "1"
=20

