Return-Path: <atharvanandanwar@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4CECE8373
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:31:12 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.92.23.18])
 by mx.groups.io with SMTP id smtpd.web10.59202.1727713869577908112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=hGWnCBwV;
 spf=pass (domain: outlook.com, ip: 40.92.23.18, mailfrom: atharvanandanwar@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXfnOPARpV3hywK2oq2EormFm5xA9OPWkG0GLWLSnMF9S2DqmxtdMGr3oPrHpHhtxtiig6C6gvdpisR0Xpfaj8JTEDBv8vTaLjI/13ATXSCjPpbrTb+qfS4LuNOQ/evGYkJgN7R927rn47Myk9tL5xwjYmZXs6vL3HSlmeoxrASKfXrHp1jYeCiVfwR1Eboz9y5rQc3L8Ue0f/bNYyUOJgALy8CN4rBWPWJaPFFu+o3zn8UcGSKzVBocfuNb3WB/PEQ7nrxo0dhQf+Yr/AxgiJCVQQFRv/jHeus8sn8p+HQm/maw1icVaoqTohYO8DIX4xUuLhZhZTWaPrEc/r4l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/WIZ3iPLKZlojlzERITyYRJ0d3LUupYXRVgIIW4hso=;
 b=LqKHs/AWL1EiJDGaDZyievQTmGxkDHeL4zZgqBTc4HSqQq2ULfQizop0wACebdWW3kYC4u0VeqgPI0LRpuXP/K+EKikQGSeHU7Uc2GMj01vYBOCrNu57vxOcqeiAYJ3Q10uuFem4JK984q6V6I395A8XiqHjOFwK2cxx7fcqsxFIrmlgyt1WcIa3M+DivjV9ZIMDEc9gsC6Eu4gSWyFxUDXTy+/u5fkSS+M/E5kV69kTc6hkKQopLaY9pxflgwkkbSOchChmpUJcAtfaMy22RD9FAO74AM59aMiq/WB5pO3Huno4+RFc7dJXxqq5ByMaZgyXRlV9iZGr2j8c4kUm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/WIZ3iPLKZlojlzERITyYRJ0d3LUupYXRVgIIW4hso=;
 b=hGWnCBwVFOtKjZGWyrvAZua/9myP3qXcExWUc+ztfKBAhmNHGfmYDHeUfCEMQHIKEviwSpFDYKH9WGs4fOU0oYgpqlRvPsmlslbilcfPOIeDh9KUCCqWG7+4tXV3hB9u494UBtgqipT+TUr0I/sw39V956ocANTMneAlAeYLybCWh/mUv7Siv72bq49M2cLIrQRlX7CU6TTwXN9hPEVHG1YbXIoMK7TycEa66TnE8F3aNjIAwUN/vRquxlpxm7qBG+NOYMJvNM4wIVIWPwYMj4kqh7Fr85cJJjce46dAqTCcgxxJBdK+eM0tkfaw0lqyft0HziPg7akBpcfP8FLD1g==
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3e8::8)
 by DS7P223MB0431.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:9d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.26; Mon, 30 Sep 2024 16:31:07 +0000
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184]) by SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184%3]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:31:07 +0000
Message-ID: 
 <SA1P223MB118732DABA33F9AB4EFD6C9FCB762@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Date: Mon, 30 Sep 2024 11:31:06 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
From: Atharva Nandanwar <atharvanandanwar@outlook.com>
Subject: [OE-core][scarthgap][PATCH 1/1] populate_sdk_base: inherit nopackages
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:610:59::27) To SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:3e8::8)
X-Microsoft-Original-Message-ID: 
 <76a5b30a-e1be-4acb-adc1-bde54133adf6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P223MB1187:EE_|DS7P223MB0431:EE_
X-MS-Office365-Filtering-Correlation-Id: 643905d2-b53e-4132-5b82-08dce16d48da
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|19110799003|8060799006|5072599009|6090799003|7092599003|15080799006|461199028|5062599005|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 
	gDi5jvjue8qmTinxxJjL2OOt3MH0xqRrzlL5hVITH5VOmNPLoeiB8m91hcqs0h1QYNjUVjMg7uTXjIyQB/yBIu/cLgUTgUtek93slojoplSOzqeuOkATvI4n6B2wATXDhMLcr+CdoYftnMaVXp7UGbQHH6UKRVficN7Xz3TSOTL/vOFEpnYdhkpr4xWzixnYD5I6mgYrUFSbrzYAA9dXBmJcVnaEK88fWKQghI/TEr0axOCdAfCu+3aVqOjsyboe+qR8B87/P0sFXNRqo4ptlWsSnVGzOGyU9e469VRZ183+KFZ2KhK9ggYjqeVIfAI5u+at2mFC0u7PFHg7YsBx4i9q98YZseceCbfFWlisQoIYvcxzqAU+vPT6hUKoXVNY1AvIScxWbgi2+dKkzniiAgoYFmlxqMpXhlOMz7fl0hAI1jvhv8WbTaaKhOe0hJIv0QJjRy/Knbr6/1el3+1rGYmowd7TV360GjawDX+eZ33yRiz6e0CGXbdvGLG8pxBKlCvnswPNj57pw8yV/ifs+FJvvPBWASTAsVNQdTzYzyTNfr9SooT61bO9mC15k/r2rtA4OIIyaCdjWDpdf34l/NR45meuaag93BNRH+z3bt78X44xj18lSHe2hGYTKl99KqGLE8w5ffNpA7CJndahi7Ky7zSr0WoXJPtrAT4SRSB1m8QDzDddUfunvaamdjoMxK7BBFAGYOccROTnmS/YPtk8bE3n/aJAv3YUO5PTQ5q3esMQtSyp/Oz3kon5L32HgLxQkBrSZFL700Y4OxfZY84DmFfhLhTeoE8zFbDeBtA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGJrRlBMdGlMbmp5eEtNM0lZUkdHZlc2U05TWEw5aXE1S2c1eDM4YnFCOXpv?=
 =?utf-8?B?NGc1bkVBblZyWUhDWDg5WW5ZbzBQMkptckEwbENueHFsbGtWNHJ2bFlLYUJD?=
 =?utf-8?B?bitMLzNZanVLenkvd3kzZlE4VGs1VDB0dUNNcUpEWDRHSzVFT241OS9MT1ZF?=
 =?utf-8?B?NXVkWVdOaHExUUpSekgzVXB5WHpQbVdhMTZEL2ttdm5VMDBZSXUwZE9UTmw2?=
 =?utf-8?B?ZjZpLzUybVVDTHUrOFhiclVNMWFLK1VDZEtUaFlNSXZON0tiUEdVWER6MlQ2?=
 =?utf-8?B?VUR1T0diM0JITURNeHNNK3ZxNjJKQkczWXAzaXgzN0lOb2tQekRtS0c5aE1D?=
 =?utf-8?B?VlprRXRSZEZWZ3E0OE5VSTY5YTY3U0tjdGlhM244TFZnQjNkbU8zUDAzdDBK?=
 =?utf-8?B?VGJVVlVOa3hsS1JxaE0yUityZGprTkl1ZVBQY2xUYkhaRVJheWQ4R3VkYzZi?=
 =?utf-8?B?cTBJUWpjY211WWxGdE1vQ2RIa0dTUDQ0RUQxeG02a3VmQzd4bHpJOHdCbktj?=
 =?utf-8?B?eVZzQWx1UjFtcnRKNTFyVlY5TFJkOTB0SkoyRXRhT05WeXlpbjM2WGJscGwx?=
 =?utf-8?B?UmtLNzVpVmNkMnB4WlJtQVp4dU1xWFlOQjJJK2VqMGJXQklQZGZUQzBVUng2?=
 =?utf-8?B?SEN3SXdXYWtjTnE5QjcrMFQzLzE2TFlocjYrRDdiMHBYOWJDOHpYSllVb1Bh?=
 =?utf-8?B?YnBEWTVOMXBWK25IQjRzSjdpYWtzbWttWjZEUVcrTzR3eWVOOC8wQnFOTzdQ?=
 =?utf-8?B?dHJLVlRKZG9jRS8yYi9XY3pHWTN2cGxYSEVJVFFGRkxvUmlWZDZmVjZmcDYv?=
 =?utf-8?B?c2lMTEkrdVIwRnRTNzNTblRLZzFDbURlMjR3QkIvTU16Tjdwa3Z5VWZMSTBN?=
 =?utf-8?B?b1N1NTRuUUdzbkh2U1NZVTlnTk9wcStqcjdGTktOWTAzSkwreHZaKzFyUll5?=
 =?utf-8?B?TlI0R3YxaCt5UHUrNUxQRUNURXBYemF0cSt2cGR6M2tlcHBjYnZsUW9UZjll?=
 =?utf-8?B?MVJpTzQ4Ynkzamp6MFUyVEZCMXFBblMxUy9pZyt0d2wrZkd5RlVVMzR1V1hl?=
 =?utf-8?B?Nm5NTll1V3FtS0N2cU9GUjNFR3YyZWlNQXM1eGF1dEJ2c3FZZExFbGFTWlVD?=
 =?utf-8?B?MzFiMEFmdUs0ZHZDN1Z4Sm9TR3hHcnlZUXByUmtuUjJKS2VBNFRUdGhmNUlH?=
 =?utf-8?B?RjlaK1JIaG1EQUxqb1ZnODlXN0M1RzJuQnhpTmpmSnJxQ1NGQ2podytuZjNq?=
 =?utf-8?B?N05QNnorbmw1RGxnM1phQ3FXUWJxdnhWdkNBbE96bys4ZElLOHdlV3VrS2RL?=
 =?utf-8?B?UFJKckxLRXM3NjV4ZjlOWVgwUUZqRHc2cFZzYlRCM0o0UDZZYlFaaGllYUU2?=
 =?utf-8?B?UDljS1diOUZ4ZU40a2wzUFQwZFI0cE96MlduUHRQN1ZrYzVOZlNIMmxxVmhP?=
 =?utf-8?B?RUJIZGRCYkRSZ3dEMm1WL0VRZjFUZThCbjhnekY3RXFHTXo3dTJxK2FRU2Vq?=
 =?utf-8?B?bDJGbDdodEdWVE5NZDQ4MHBSam1CVVJyemVCbXc1V3JtNE9DNWdiS3lCWHRR?=
 =?utf-8?B?QzhYajc1c1JZSTZGV2JzbU5TRW9pSHc3eVJUZ1JvSHU1bHpVTHN4UVlQVktj?=
 =?utf-8?B?QWYzQW9mK3NwVldPNW43TXM4R0p6NDBYQ0JSQWFPMkluMDA0MEZ2VXlqZDBq?=
 =?utf-8?Q?81Q/JxAudqs9cZXH+bg2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643905d2-b53e-4132-5b82-08dce16d48da
X-MS-Exchange-CrossTenant-AuthSource: SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:31:07.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7P223MB0431
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 16:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205123

From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Aug 2024 21:37:52 +0200

Since this bbclass sets PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't
do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

e.g. meta-toolchain build now fails with:
| DEBUG: Executing shell function buildhistory_list_pkg_files
| find: ".../meta-toolchain/1.0/packages-split/*": No such file or directory
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function buildhistory_emit_pkghistory finished

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index a103e7b738..5c738dbf2a 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -13,7 +13,7 @@ PACKAGES = ""
 # SDK processing context.  This class happens to be common to these usages.
 SPDX_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
 
-inherit image-postinst-intercepts image-artifact-names
+inherit image-postinst-intercepts image-artifact-names nopackages
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
2.34.1

