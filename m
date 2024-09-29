Return-Path: <atharvanandanwar@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC69CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 18:55:33 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.92.20.79])
 by mx.groups.io with SMTP id smtpd.web10.38059.1727636131880251403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 11:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Svg8Hd09;
 spf=pass (domain: outlook.com, ip: 40.92.20.79, mailfrom: atharvanandanwar@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPzf3TWQLP338lnU0499fuBh/QhhXa0LRhs2iiZqc11y8ytYwFYx28ShO9igq6ddE21Fcvajt1J8wCOCBuIZzNKI86x669+uu1BTO2OZ0eBgM5OtpSFcC5VruL3pnzeT1+9UElvPD5JPVTg3nA5eOQVTfl4TP6yGAWEabwBqjwkM9dXIfdO+gIdYb+Ns6M88GB4ewSF6Z2uJegQfZafmRvwf/VR4jTQCd2YMtG6WqXzAbrHJ4+UErUL6bPUVaS8xGv26yPoeJ32x3yeMsU+EP85d7Oud70wF2+IHGXl3YPzT1WCDLWj1kYbvw3ZEr4i+lAGrhvKZof4JY6u0Zaq1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SPsBUlcMQ83PdwegMrY5ot7L4Rf02zHdIcBhM1J2NM=;
 b=gHLTf4ZLzAUG1JqYtgMHSlBj25tv0S0y2cuctg44vj6tLKVmgak+GuwKJWLpEbTzRP1ssJYdZ3ibg/mMntDoqfRE9RPrlRkscaQGCE4qGNgsBZq8+vVzcI7lldTROrSYk9SqsbJobdGNXnKhwHSxix58fZGUc6qJgH8GenHzAoK5tfglXklxD4n5DYyLiFyajUMijaz2JVnUSFw7c/bu3PwoP7JwlQqhS0vUPZkh6ePalxPMyl7yn5pO2y8cCzZ4ClS5L/gDFPNsmBbCVBPBr84MPnTDblzTj7ltWJJZqXunQwgpCLab8t9qcxW7DW4SLE5KIYa9DeSjDaNmXAK0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SPsBUlcMQ83PdwegMrY5ot7L4Rf02zHdIcBhM1J2NM=;
 b=Svg8Hd09g9W/fvJRGY3S4CHGf2DX/5eUmntfVdRJtEK9jlVGsvH1hNt27pw2wnZXFXXMCMPTHB65ZGHZ+FVZuwnjypzCGL8X3i1n2S0c4HcR4duHRkyXAGHs/BfG+1FD5MyliGqgTA/y2D+id2IcdrgYqZiA7HNSIFewMpMFPYABhZwC3GoYuaWr3pG7bHHeesEvL1cpLdngsrqTxBDm3ou9pwOuN1wfyxn+46XAonIKuNZmNiEAdwgGRujbDpyJIkoisIlsghRgYasjeYGuc43KvnDEEqFo5ygucXyYE7CgaYt9LTfeMdbi5qqbexXbpjM8qpmRbHIl/p+IMANptg==
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3e8::8)
 by BN0P223MB0181.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Sun, 29 Sep
 2024 18:55:29 +0000
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184]) by SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184%3]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 18:55:29 +0000
Message-ID: 
 <SA1P223MB1187C93538CD6219C8C10402CB752@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Date: Sun, 29 Sep 2024 13:55:28 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Atharva Nandanwar <atharvanandanwar@outlook.com>
Subject: [master][PATCH] meta-toolchain: inherit nopackages
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH3P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1e7::23) To SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:3e8::8)
X-Microsoft-Original-Message-ID: 
 <4be4bbe1-096e-47fc-bd6a-fbcb83fa216a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P223MB1187:EE_|BN0P223MB0181:EE_
X-MS-Office365-Filtering-Correlation-Id: 9002d9e7-c178-4c21-137b-08dce0b84998
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|5062599005|8060799006|19110799003|5072599009|6090799003|15080799006|7092599003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 
	McQSOqi1CwOLquscaqLFalcOkcdws7AhL1qODstK6Ydn1+wXbrHOXWvsv9J9ru4X1MRoYKvRVN1wEcjks4nD6e6YYvZWjBA0VaRO3vaqcFrPcul546IBz9JlcjM2h/h7cOnA8t8aLq7lZGj+BOP7JwYkhsSF2ow0F4YRWdx+znvkMRo0DMHXp3ch7qVObtrpZA/S+ydtGT1CvZS+52F2jBNlKWzIfJjg52N08xsdNkvXCVN2loI4/TN3pp94IhWx/cv9ba9mcSRpv85EnkET46nA59auLEH89X9u65DgWlyOuGfHs5uqnqIskxYtefTSeBpHQmigtO2sIruGgVoJrFUK7KaD8tajMMn7wEbpxYIV1pP/LpEPVxx3rFEYSqezZhYjBdY0mNyoTGlVurh0kh2Xarp8EzNh5d0L9UFhhwcdqevlmMnaD2BJBgYN7DaHWK0EdAI2o2oEs51+1/0Tj/dZYlsAq0wSbkSG9mInji2yRjevSy6CM95wRJ9gYMDhZT60ZG3tm9rvtrdkTYSWgjxhcTWYcUjuDlZOizGgcE4LlIkwzqi9lGoY493z9H4aahtk87s29W9VRd0omb6gHA+X2I9AqZG5yD35alS0HtW4BRbQg2EiAByt7gbto1ijqS3swlWIOGtnXWopBfszVRs2nHs/6Uv0aOdHR/mVfPAd++ODcCkz6XinpCZnMk798LKAyy6Rhu0dv54P6IEo9pqm/aFnkotAa/ndYOeOlPJ6/4tXOT354O1IRC4r0q+6Vc981AMMMsfL9CCjzm4BvFJgKISUb5f/JJtpZh5RU1Q=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVNmUHlTNUhRaGxmM09EWU12WmVwd3BSL3RMbXRDOUFwc2N1and3a2MvZHRs?=
 =?utf-8?B?bnhEdkgzWEpYcnJsbjFOaU9ZS05KYzgwUmlBcFB3VFE4TitHNFFUbm5sei9x?=
 =?utf-8?B?MU9tWkl0M0tjazN2ZU4zZGkxZ0tmRTdrN2tBeTFYNW5pUFl1UnpLamZwM2ov?=
 =?utf-8?B?eFZpMG1tZ0Vmd3IxWTl2YlJVRGx1a2tNT1VSMjF6RHBkZEdyWm9JQmFpbi96?=
 =?utf-8?B?TldLbnBERlNlakZRSkRLUEJ2WTBKSUpiUzhyanU5amRpNnMrK0RINTRlQk9n?=
 =?utf-8?B?UXd4bXB0Yk8rczdTdmJZeFNXOEx6QmZCY0lQcHdDeTZvaU5OMElNOGU0NS91?=
 =?utf-8?B?Si8rSi90ZS9HOXNndVp4dVBpVmYrU2tJYktTeTQreXV0VUgzU0lsWGV5cjBk?=
 =?utf-8?B?OUpGU1VGYTlpeFp5dDNoeUxVL1JZNnNxa3hNUUFyV1RVbld5S05xMGt0R1Fw?=
 =?utf-8?B?Q1l0SzVqV2RheGNMcEhMelgySTFsb0twSGNhcitrOVcvbm9oQXJsR2FEblZK?=
 =?utf-8?B?L3dCbjU5UlhsMFZhQzdZMkVTbE9xVHd3c0wybHFtcFhoKzk5Ty9ycEFWRXhv?=
 =?utf-8?B?aVZTQmVycFhoVWtmRUEzQVhjSXVySTA2bUtCQWhmRmRsQkcwSUtBRnlrT0g3?=
 =?utf-8?B?Q01QM2czSXVpMXhlR3REYTV1dTR5U3lkc2ppWVYxcUZTM3A1UGh0U1hRdElN?=
 =?utf-8?B?R1JUSHpWdnpEMkNuZFpKOEpSU3ZCanp2V2tBTTBraUlHN2NwTmx4S0svTFQ3?=
 =?utf-8?B?a3pTODR0SmE2RVlWZmwzSXBFT3pPOUw1b2c3dERvRUhVUWQ3aytDNmZUYmpP?=
 =?utf-8?B?WHozK0RaTS9hR2YvaFQ2QjBKOXZHZmIxRjg5eHZSNUZHdnE2MnIvWnlXdVZJ?=
 =?utf-8?B?WTl3SE5GM2s1RE10a2RsSjYxUGFvNFEveXJmalNjSjlJcFE0TG9OUzFFamY2?=
 =?utf-8?B?Y2ZTQm8yMVpFR1dNaWtLMk1qc2V2OTlHMzJPcXdzaGpOUXgyRUsxSHgvbUVP?=
 =?utf-8?B?WGtmeW5Vc1VZV2tBZEtDWlV2ZVZIclVVckNabmFxakNReUUyRlhPalFka29k?=
 =?utf-8?B?THo0QmJkRG5ZWk13Mi9UdmptUlNOWDV2Nlh6NHpEakV6Tk1rZ1hqbXQrOUJJ?=
 =?utf-8?B?VTdPbVBjdTNHRS9vVzVZWVViblBaTzFMRUlaa2cvWHQ2RVRENlJDVjNOMG4y?=
 =?utf-8?B?OG9xZGVBdk5xT3VvMW03TFMzeFVheUpOSnArcHh1UWxDam10ZXVZcEI1ZzZC?=
 =?utf-8?B?RWFnbnczRFgveEhzVWl6b0RGNmppM0pHbDBCbHI2Q0FENjJObnlLVmQ5M3dB?=
 =?utf-8?B?cjRBOGhSZGpha05reEZRL0JZRWRXQUE2Rng3UlJqNEt4ZGJoTkpzdG9USVVM?=
 =?utf-8?B?c0NwSk43QjdiN0VnYVgvakRKQlpEZGFCS2RIRDJ2VGdQZTRrSExWKy9HU1p3?=
 =?utf-8?B?eTJDRXZ5cUJtdW9HZmU0emdWNmZiZzJlTW04ZHpYcVA5MnpKM1Q2QS93QjV6?=
 =?utf-8?B?WVViUHpMYS9uTnNHOGFRKytpQVBRZDh4VnNLOWphczhBTEhMV1hCRjAwd1dN?=
 =?utf-8?B?KzJLdVVMSlcwQXljVThIVERYWGE0cUExZkRNNFVwOXpkZ1JFQTJHdmw3bUR3?=
 =?utf-8?B?RE1RNzBySDk1Z0grYmE5QUwvS0MzRkZTaWFiaUtBT3p1dkgvaE4vWklQRC9R?=
 =?utf-8?Q?AAkVG2Ig5huMmKqgUj2C?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9002d9e7-c178-4c21-137b-08dce0b84998
X-MS-Exchange-CrossTenant-AuthSource: SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 18:55:29.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P223MB0181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205059

From: Atharva Nandanwar <atharvanandanwar@outlook.com>

- buildhistory emits hard error when no files are present in
  package-split.
- meta-toolchain doesn't install/package any files, hence inheriting
  nopackages should allow building this recipe again

Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
---
 meta/recipes-core/meta/meta-toolchain.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index 260e03934e..c97cc68ad4 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -2,4 +2,4 @@ SUMMARY = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
 
 
-inherit populate_sdk
+inherit nopackages populate_sdk
-- 
2.34.1

