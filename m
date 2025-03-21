Return-Path: <valeria.petrov@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25767C35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 11:40:20 +0000 (UTC)
Received: from GVAP278CU002.outbound.protection.outlook.com (GVAP278CU002.outbound.protection.outlook.com [52.101.188.88])
 by mx.groups.io with SMTP id smtpd.web11.19226.1742557216266222177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 04:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=f1Hk9WzV;
 spf=pass (domain: spinetix.com, ip: 52.101.188.88, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSMCFtTn7/b1wvzqWLC0m1hgWbcCHx7nphVjvLT4PMQFA3NR1QePv3dlvLchkK5GZhcCuCMxccUzu41qTPcq9qSLMb3sV5YUB6frW8hyZZPc4zn/bHVy6z/3UpvAsRjz0QPtgmBrxWOgr7ulnNOu0iQhfwbwMMMJQ9pDCVOnZjS2hQupKq42rOSrTK7ia4eaXhy8A3xezy47o/c1g3i4LYFsL1v4QHUI/Z5vrqg36hL4rcMiWy/zhziJ8EAHvgoplmoMBTYQLy43GLaewuqgipVagiOmRGFM1iH376fhnMObvPuwXgDx+9w6Vm1e+QLXKXxwAwgc4huCDrglhPVyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odQIBQBEKsNvwNReWuKI4QqXkfLWuzMG+scKVvYMf8I=;
 b=R2u+pgMrAcc3pJrbQxRqYmsyE6dOymtfQKrVYtkMUA43g/nMRA4Wq3n/eXmRMA+/vU+Zvc/4OHqDiLlDMiPWsvNXkjN/yVDzdElTDuQ9c9ue98x2PiPFW/pXqlUrGj9zvjqmBxWyuDe+D/lNxo+J/b/4MgFhzzaQOQTXOTurUkhmZ8kEDtZ9MQP6oafG1dasCOXYANV0BO0CJ7UtaEyMvcbyNCvphHRyw7VYsYSU+j6a0EjQEOv+O6XH6M6yb1mU/MGXsxxQERKVXQsNWhm0dw0lxxgK1OoBAkLkmoAKkEvBZWFzZvJ+cY6wZBN4GtIIjv2RMDOKtN/4Bco7LK4R3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odQIBQBEKsNvwNReWuKI4QqXkfLWuzMG+scKVvYMf8I=;
 b=f1Hk9WzVf8jeH+yoH49aaO++JvU+HAXUPF9uNL/lWJuqGi7H3R8BK+EG7TK2kQbb6diIQ8AOg/TrFsJuzL+mcNrw7UFZ8NNjTioFXl4bI6owAob9CDI2R1zVQEjJbHqgVpkbqlocWHI/7c6gA+MAI0VucUzbrjleQLV0VQdqZ90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZR0P278MB0121.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 11:40:06 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8%5]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 11:40:06 +0000
From: Valeria <valeria.petrov@spinetix.com>
To: openembedded-core@lists.openembedded.org
CC: Valeria <valeria.petrov@spinetix.com>
Subject: [OE-core][master][PATCH] grub2: Add GRUB_MKIMAGE_OPTS for configurable grub-mkimage options
Date: Fri, 21 Mar 2025 12:39:04 +0100
Message-ID: <20250321113904.4137267-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0026.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::9) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZR0P278MB0121:EE_
X-MS-Office365-Filtering-Correlation-Id: 4629667d-3007-4b8c-7b06-08dd686d208d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TL35VyFn/eVr+OfDbSg3/OdL+Cxr27T5JpwBnDUZpOeax4oe4f5vTLftwXbm?=
 =?us-ascii?Q?wqT3CYQDAijbClcTR2SBpkxyTCjk/5r1oy/7Wo+hbUVMX0VV5zrvQJp57OTl?=
 =?us-ascii?Q?r73hMbBVqthCPBYdyTECkeeW8JYvMCI6OGN1lOFxCwi5uzxrFyWfJxPK0fAf?=
 =?us-ascii?Q?9DSsqSJxSvLBlR+f/fykubJa8yTm5Vy2s5x3dc+9BGW22yjWOE9WArCHjdAq?=
 =?us-ascii?Q?mj6n03udvSeMsjxEBdbxDbjIkMDXLak9SLDAEZHHQwzytBVV+ToKu0lR0pDL?=
 =?us-ascii?Q?JdBFxkxFdGx5jerzpVxSHEXtLvdiZ45EHZ0/g8SiOanCvP4TXPs1gSfKzokx?=
 =?us-ascii?Q?Pgthje6B/4/8xEaaLT8CbOjpow0Fe3EwuU10SgCjWXxhWPlcdwixEi6tjjvo?=
 =?us-ascii?Q?cB1enfHJ9XhAU75AfWl823aTTyja9JRoVS9IXhfva4vTvdrQU4uQTZib3AHK?=
 =?us-ascii?Q?4MRsw0Mgh3ZBPukOxICx+SkRcRl9D77OuEEYQA642xQK9Lc7Fvw38DEjZAVm?=
 =?us-ascii?Q?mgVpMOraw+pC+M4oz2BidF7LKujWw3SpcFI2hB//BeE0iQjDgBImK/l+LV48?=
 =?us-ascii?Q?Z++jf3+mZdqhuPriLUpWrAd+MDoPQU0zpnOHqNorBMVVZJ18LgIaVASr9ven?=
 =?us-ascii?Q?oaoTd0WM6OqysqQxaOeU4xN2liV4l7lpFRdqt73i/L36OQnS+n/0EdX/5vX+?=
 =?us-ascii?Q?gLYFCfkGGzF+g3cSxtV5sfaLqpM0L1c9pdkTVzX3ldPWE9/SLvxtNg9qMx8U?=
 =?us-ascii?Q?vc2IMfIg/fZP64XLoNq78ud3+sKH96QUa2CZ5P8txZ4C2pPOG7o/u/9/9KaR?=
 =?us-ascii?Q?s+avnvLUNySVt1gjkMVOJbQEnYQdRJ1hgtCrwswc20xFGoab+A6NHrfX6DQ2?=
 =?us-ascii?Q?V1RDx9mLJ/iusMwLCPjR2zzKb4wE2Tj/PzCoAibttDxlxPp+6SDbmxRZzpsF?=
 =?us-ascii?Q?C/jN3SJPgAxGMw/uz0G5I25z+lZH6EzqFd9QuwrjLiqNHmzfeJErkTzrhkgk?=
 =?us-ascii?Q?XeTHJIHFOwnRENIa/YUnU3IDybtiDp2pTTMv6SV673GbJmHfqgkZdqng1KJK?=
 =?us-ascii?Q?7zzU6GwTiCYcpkgxZXq7c9zHddrv16EyxsPSOgkrrSGyNFJsQXvgvUYfm0Rv?=
 =?us-ascii?Q?Uv0pc+3D9USru/UdP7tltFKmvMUCTQE+wj0Y0qpNIhqPF3wk1o03YAnLYn0/?=
 =?us-ascii?Q?tTPcOaCLNjJAIuhXirFL/yQgnvlsVI1Y1UBjTkNN/sku/bL+YkhrNbu7Jaf/?=
 =?us-ascii?Q?miNIPWQtuKluuKZEppNKIDUyyew2+xyBD14XTKdrfMSORgaWAQ7xI9T3H07q?=
 =?us-ascii?Q?qK4QQWuOU3uqC/33bgREUWwi+QeXRR8eDMv7B36vsIYzLujiPGEauUFGHhHi?=
 =?us-ascii?Q?X3mNNxK1E/DTYaLU8Toe7skoyt8RzdqaklxhwB6GOk4nQyu3cBIi3gBV9dJq?=
 =?us-ascii?Q?XD9EjJ2FA6507kkJ/hf0r4+2KWKhkl/q?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JmU78/lD6kGPF3rh1TBORAW3PQw0B7yD6F2OdDbv43NqsJ9LycuPRINMzmlc?=
 =?us-ascii?Q?o3zWLTUWVaZIV1I3xVf7KoHyfmnwkVzKSLP+URa/ikkTLGKQLFCvabAtlPug?=
 =?us-ascii?Q?yOixgeCh3YeXGeu2Fry9HJe2uwOtsn8m0sI+4B/NkBz0B1DqPhqcEtA/oaY5?=
 =?us-ascii?Q?WSGnop1nakLVH6pwG3wE3cZHPqMMB6TdOZQakzINHrlbR7C1dvb5gi2bHzve?=
 =?us-ascii?Q?O3PxSoljd45gN0LCDuEZcB7KbTQCQnoAXP4zY/naLD1INBc/O7IsWLSoYbC1?=
 =?us-ascii?Q?LyewewFwFCydU1n70ni1y8QVmCiaN49bA6f2EzfrgLqh9/xpJE+xiDXDFAZ/?=
 =?us-ascii?Q?IlMk11+YjpBpSdRVSRc84iUwnDnzKpjurI6Jm9Yd50qyfhKODj/dIPwjS8la?=
 =?us-ascii?Q?RPVpf/RsaNxlXAE9W/WeAOdZmYuF3KzR3qexG1Vk/vgiQMjwce75Xk0cd+yC?=
 =?us-ascii?Q?UPv6tF3v3Jx+KfkGnXR5H5UotEqYQitf+5rZVCac6OnT7ZL/diTDPLnE9cNT?=
 =?us-ascii?Q?qsUmJ6cGQZNG1nRIFecbma8ofP0RD9PVuYE5zf9+YU0YZaQRfMvXPTEosG4u?=
 =?us-ascii?Q?a5bmhH7fc1UWjlnJMZp3WWlbKHL7Ih8dnlfhMAyecYMOLPhAiGkRPB/E7aaK?=
 =?us-ascii?Q?3epw8acDS7Agy8+TaP8FhCTD/N/EdSY+5Za1WIBoqbqapmWrrEzc4aCCnRtb?=
 =?us-ascii?Q?WQtflFBm4vhyEd1NVeBZfRx1a2S+ck7vcRZjLyihXQ6ULKEYijopdncCee1j?=
 =?us-ascii?Q?VQcuDBWKm+rn/SQKTbci4Sh6cBpRipVuVC1WxeYcxAWksfYvLkyk6Q4p94bs?=
 =?us-ascii?Q?m82RKHuJAz/jF47wHeye8qWw8uc/iFHmG17qX5a3SarYdYaRFjnA538MZxlA?=
 =?us-ascii?Q?KNvJCbcnoayjzVtxgXjFEG4IZzz7DJzb+UXP8/FNg/hX13e/wHto28gU3C6Q?=
 =?us-ascii?Q?aY6m+2KbpvjYhYoa20d0vZrL/0Cz9rfMJo/0qCbSY7RY05sPvmnKZqJCH03T?=
 =?us-ascii?Q?Wv2CPB4UFSliTjguQjmyaw9SiGgTgqvddUbXVMG9G+ZKSsyHPNFG02jGm6l9?=
 =?us-ascii?Q?KAKUDaAjaqNGdfocT+HaR2XGtSWc0qxJcqUv8gO5tfT+xrJwOtAvM0Da3CHj?=
 =?us-ascii?Q?uqW+t0uPf9UGCVj/+6LjxLz0j9O97ntVEq524kPngr/NUSqac89WuPojyoS9?=
 =?us-ascii?Q?23vjWYdknB0EwGqYoRZKyArK8tyhnKd72E359fraLAGGRY+nL6EKbra2IedI?=
 =?us-ascii?Q?4tWyphbgT7uq6N7/YALOH+yqV9h9KUL7MhR3YAqOc+J0KgEpOGkkaJmt+d8w?=
 =?us-ascii?Q?nuC3mK+0w+ZqyGEBZyQhgdVUXc8MphU8xZfMOEimDb4g2e2KfdkBiw6d978A?=
 =?us-ascii?Q?ueA+Wz7t/h7FuLn+RbFQjkGRsdV4rb+ZjsyKCimWFUyPNrJGONwwHfpnBwi7?=
 =?us-ascii?Q?Bo1wnEGKuJPqRtxQb+VQMgZdVF70Qo9yDUEJWcgQzzzSo2xsfK+n/QncgHgm?=
 =?us-ascii?Q?rGUCQguUbQEB2yackH1ocKFyWPXlVWV3/Y70QUUbp++oIIS5oM/Sfr99pVXS?=
 =?us-ascii?Q?AsvmVoVNz6gO/CI8R6Xk/Pou0E9ZRXLPFVIw/GGVm9BaqUsBsNMKS46Az2Lr?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4629667d-3007-4b8c-7b06-08dd686d208d
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 11:40:06.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HvzPCgQudECV8JE5zyKCSh2hzJi3GamtUWJ6G4rb9pLdg4Icbe+rPysIjli3kJW3QDCN+ZLllq9tFuaqTbWxUvLWeYES2R5fpTGmI8OVho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 11:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213442

Introduce the GRUB_MKIMAGE_OPTS variable to allow additional options
to be passed to grub-mkimage, making its behavior more configurable.
(for example, this allows disabling shim lock when necessary).

Update do_mkimage to use ${GRUB_MKIMAGE_OPTS}. This change reduce the
need for hardcoded modifications and makes future adjustments easier.

Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
---
 meta/recipes-bsp/grub/grub-efi_2.12.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub=
/grub-efi_2.12.bb
index 6dbc0ccf7f..5b435245ee 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -46,6 +46,9 @@ inherit deploy
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_HELP2MAN=3D"
 EXTRA_OECONF +=3D "--enable-efiemu=3Dno"
=20
+# Define GRUB_MKIMAGE_OPTS variable for additional grub-mkimage options (e=
.g., disabling shim lock)
+GRUB_MKIMAGE_OPTS ?=3D ""
+
 do_mkimage() {
 	cd ${B}
=20
@@ -62,7 +65,7 @@ do_mkimage() {
 	# built in cfg file provided via this recipe
 	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAG=
E} \
-	               ${GRUB_MKIMAGE_MODULES}
+	               ${GRUB_MKIMAGE_OPTS} ${GRUB_MKIMAGE_MODULES}
 }
=20
 addtask mkimage before do_install after do_compile
--=20
2.25.1


