Return-Path: <atharvanandanwar@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE874CE8374
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:42:02 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.92.42.57])
 by mx.groups.io with SMTP id smtpd.web10.59570.1727714520948198999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=stRfSGu0;
 spf=pass (domain: outlook.com, ip: 40.92.42.57, mailfrom: atharvanandanwar@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxFf5+SYwKbM60V4h1rgaY8szS1h89vJZxpkwgRu3av8YiT+2ne1evZ/E6zMTS05q7cRpsliTiRsPuGXWha5tz8xZzaoCTDz9cz6M0UbqFiQPxmR5YawGSieGOrQIQCUX6cmFh9zc0OECKGa370TA/OgDZfwM1B6n9Lpg0HTz6jvBUBfitKgp6HR8lxDW4QX+3jMby2BXRI2kP/eplshGQymnFyEMbW/pQRco37Y7oQeXEL62PA1JGYmiPpaPd3cwItJDFUTg07N+i+OCcfk+PC4u9raIsJhLMbcZPyRYUGO+YLr5I/obtWX0PEE682BI4Anx6rZFk12yInSqjxn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLYMkAFsylBZrLc1Sgx/0EBjmWJN2PTFmCdRNFglzjc=;
 b=Zd+6TmFtL0ntVWU+21yBOeAVkfp57/yWTs1LTgjt9+7jsB2GmWSa5Lq7BFIunTNBBc6bpr0RYY2bCHKzPbFQujVzWSX56/Uio4+W7ZRVQSjyG9oTe6LRsaSDx+EtaAuJuUs/UabGVyhlJP1Ad8ltmf+BDbC51PDuST0aRZxwShy4KgCe4tlY9VOx/b5uZHtd4c1Pk61Ve1YR43FwNF6ivdTJ3iORcZxce+u39zzTfBdYt0z8z1Ze+ghGUXrCG0epVQslg0UApeNytlqeRVCOu7a3lkAaPWiDFvDXHsfVpbZ7Tm3+LhkebivEbXRmgXpMh7m2bjhBaWBIUI3anFc2ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLYMkAFsylBZrLc1Sgx/0EBjmWJN2PTFmCdRNFglzjc=;
 b=stRfSGu0wUWUvLBF0lqEBY9xw+/uN+WYjfXM3zsZxahZTD4Wgg3m4ntUor7ZWFdIQLjUtdT8cM0B7YGsrIVOUHUXp6a2aB13+E/rhHFa9dZYPbDwOVgQBMWFVFvxOC5xneWgz7EsbKKLUYWvW5zBdByyoZoBggw3Kj1GnPBQyjPNjTD689S6wkesl3gjR7eqAk4l4vE4VHCrrVXjnGzMq5tlm1q5uuOxPC8TDCXDik0h0a5e1QWth7POZzr3aL9PPr14mhWPTncEW9/9+mn4BGDtGSTckAS8XwwnRvoEijl+p7yyQiPpcXvtWb3oNI+P+EGLZ91UJqeFsfPrkT8UMg==
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3e8::8)
 by DM4P223MB0421.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:a0::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.27; Mon, 30 Sep 2024 16:41:58 +0000
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184]) by SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184%3]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:41:58 +0000
Message-ID: 
 <SA1P223MB118723F6AB838EA0FCB245EBCB762@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Date: Mon, 30 Sep 2024 11:41:57 -0500
User-Agent: Mozilla Thunderbird
Subject: [OE-core][kirkstone][PATCH 1/1] populate_sdk_base: inherit nopackages
Content-Language: en-US
References: <SA1P223MB118732DABA33F9AB4EFD6C9FCB762@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
From: Atharva Nandanwar <atharvanandanwar@outlook.com>
In-Reply-To: <SA1P223MB118732DABA33F9AB4EFD6C9FCB762@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
X-Forwarded-Message-Id: <SA1P223MB118732DABA33F9AB4EFD6C9FCB762@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:610:b1::24) To SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:3e8::8)
X-Microsoft-Original-Message-ID: 
 <f7714bd0-bb29-4e61-806a-2600c19bb008@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P223MB1187:EE_|DM4P223MB0421:EE_
X-MS-Office365-Filtering-Correlation-Id: e44c701c-accb-4244-6d73-08dce16ecd29
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|15080799006|7092599003|461199028|5072599009|8060799006|19110799003|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	A2UuEuCYDo6yOnmBVGDRirM2XVdEJO1qpuzzqdqqYjev1Dj9UJ3w0JIvKElX3IDNNoCtbPnqvNuZbBk1zduUXgYhRAtO/NY68HUsrZF+UR69gDOHnocXRjqeWvgIKvTXxgaFhZpweYe5KQ/pR1z9rY4r6Y0JNWGAxEhPkMK6jy6vwrzmxLF6flpcjbzgaBWejEdXLIlgzC3lNtfcEyT5kieujJY8bRG0XYDRhSw1WWtjyXcxrvahvSEVoeaeZDLvCCw6qRCMnOUm4etOpqBPCS7ah9Ue5wcou/toRZnRqEt3RCz3ZOU/gDttO2bqlkOdRaCbWvLlYN8x4IR1gpu3DviqXGG82TRxDZ2X1Y+rsVLSA4N9BLbqw6jtxyMXAXj0aLx6iWifh9QWm4+I4J8aICS1uamPRVkHV+c/NAUuLvFD57cN752QLKrPkLzqIx9GiTry19aomQ4KIIW93s3nRaqJ3cZBhXZwk1jYstj1gg61Ts6+2bt+jY3Y03Ibv2FyawzIqPlOZTsr/Lmj9fdrxJNzBzYk/EleMaw7ZvOka4rjjBpek59LbojwCrgry8trrHn7IEUfXJBYmi7XXePHgXeSdYIsAJhFH3cjqPkB3McP6lmGDPdz2zxPwEQrEPu0+rjHDSsCcEFOGL1E2iMJ/ozaTNGbXUnbUfZI93bs+D8ZznKg88L7gXx+8wVvzEjo9XKkU0W/tsuK4BMdTBLUbU5kCbKiAHw83dCSMx5rw0gHh1vQHW2Nd+/4CSHoMwKPHalXZPjMVXG8utPgHOmeZg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGJiWWxTVUxHMVNPOEw2TUs4S0JHR0lrU25LRVVMUHBDSTkvdW9EYUlvQllB?=
 =?utf-8?B?SC9RUUFQdUg0SS9tL1hpR1BsWll5dFBlQXlqR2ozVU8zem1qN0dkN0FTZmhV?=
 =?utf-8?B?WVdiUFJwUFoydU9jY1cwYnJNVllCa3JtbEtPOS9VUmdDWVl3LzVXbndsT2Vx?=
 =?utf-8?B?ejVPRGFYT2Vkbk5tK25WVlRsVjQ0Y0ZTbVVqTWJQRzg3bmxJbjdnZ05aMDFo?=
 =?utf-8?B?L0djWHc4b3NyR1ZDaDc0K3ZnNnhHaXFQdXRyNHMxSU5zZTh6RVZOdm1vdUR4?=
 =?utf-8?B?K0FQTDVzMjJ3cW5GQ1Z6TnY4N0FPbWkwaHZEMUZIcWJjU1ZwWUFHOENSV2V0?=
 =?utf-8?B?VmVGSDNNSThYNTNkckwvTlpuL2srTExJV1gyeGVIYmE2TDN0UWJhYVdBdnNt?=
 =?utf-8?B?Vzl6WWZaSXVPZFVSVUxHcnBSdHdxQUNleWlUK2NGaEpZSU9ZTU5VUVRvVXNF?=
 =?utf-8?B?RGRQMHU0NXVOb3BRVHlSVmc1VCtnRmdlY3VNT3hwdXN6SEUybkY4b3hwa01h?=
 =?utf-8?B?YVZqMENZTEdCSThXaVhaa1JoOGhkK01kY0tBSjdncEtIbDUwSk5UNS9wTHRx?=
 =?utf-8?B?T050ZDRCV0NLemxCN2VqaEl4T3hEWGVUWk5CaTNyWUk4ejRpNElhQW1XVytj?=
 =?utf-8?B?RnlOaWo1UUZUUncwemxPdC9kbWZ0ZWxsLzY5UlRDSENTOFowRzl6cWhudVlU?=
 =?utf-8?B?ZW5wSS9Mc01FUlhDM0cwZlJaV0pxYTBBUkc1Mmc3TFhFbGxwZDVjb0MyMTht?=
 =?utf-8?B?UHZheXJzQjlkNGQyL1lrODBCeGRHbXhmRmxiWkk5SnByelJZYWR0ZXF3cDVm?=
 =?utf-8?B?a1JsS3BWOXdaNE51TmNkNS9XN095OTg1VmxYR0NSZnZhb3pwNW95cDFOQ2gv?=
 =?utf-8?B?cUozUWdKck1zZkViUU41NElYR2drdFBMQ1dHMnlQejh3L1dVN2pwcURmaC9B?=
 =?utf-8?B?R0ZZK3I4d2ZvbHlkNk1mZ0NONXRKc3BCR2s0d1haNDhjREVnRzhQYmhKV3ht?=
 =?utf-8?B?S2hVQzU0MGx1TUFZQm5XWnN1aTR1Q1lsK1lEMHJwdkhtTzZUNG1PdDh6TFNp?=
 =?utf-8?B?Sjk4d081SFdPWUUxRXQzN09lWlY5ZDNnRGZNNGMxdnhhblowTkxrR2liV0FK?=
 =?utf-8?B?TDdGdk83R3h0YUZXbm5kYUxFczczdHRPZEtObHBna1p6a1hHeVFGVUZwUzNQ?=
 =?utf-8?B?S2I0cTYyS081WS96WTRkVXI5UzRnTWtPMmNzS3FGQXMyWjlhYm9FcjFHa0dt?=
 =?utf-8?B?MkxNRDROcEI2bkhRM2hNOWxTQkxvUDFyVFk3cCtRQlBpRjZCSTZOaExlUmpa?=
 =?utf-8?B?SlpjSXlrK3hhTElnZFRrTzlYd2RPeVE1WVczVXRkNC80ZjB5U2hKbXFwTFhO?=
 =?utf-8?B?MmJVOUJ1ZTREb2xFMnFzRldzSTBPRTdTR1pPVVYrYS9pa0lWZ3Jqak5Ob0tr?=
 =?utf-8?B?K2hsM1ZRbk8xb0RHU0NnckpXd2xYNk5STG5VMCs1RUNIcnluaitySkswQ0dP?=
 =?utf-8?B?OXQ4d1ZQV0lmMG5pU1djTlFpZlQ3K3IrR3oxUEZlTm1KeFlBcGliMTQ2aCtH?=
 =?utf-8?B?cEUwdHBlK2p4TjJ4TlhIaGl3UEgzbEVUNGdQWmxMcjFaSGZHYjVKZmlMYmpV?=
 =?utf-8?B?MnlzVXpSRUZuS1ZhVk5NWTZYQ0tQZG9DQ3hYUi9CSEloUE0yaDBZTE96VUc3?=
 =?utf-8?Q?fgzSL9kY1K3qRSbshpZl?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44c701c-accb-4244-6d73-08dce16ecd29
X-MS-Exchange-CrossTenant-AuthSource: SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:41:58.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4P223MB0421
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 16:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205124

From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Sep 2024 11:37:29 -0500

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.com>
Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index fb00460172..8e50ce93a5 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,6 +1,6 @@
 PACKAGES = ""
 
-inherit image-postinst-intercepts image-artifact-names
+inherit image-postinst-intercepts image-artifact-names nopackages
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
-- 
2.34.1


