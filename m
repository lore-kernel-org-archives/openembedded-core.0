Return-Path: <stephan.wurm@a-eberle.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC84CE79AD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:59:00 +0000 (UTC)
Received: from mx-relay100-hz2.antispameurope.com (mx-relay100-hz2.antispameurope.com [94.100.136.201])
 by mx.groups.io with SMTP id smtpd.web10.30690.1695189530572411538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-aeberlede-onmicrosoft-com._domainkey.aeberlede.onmicrosoft.com on 127.0.0.1:53: no such host" header.i=@aeberlede.onmicrosoft.com header.s=selector1-aeberlede-onmicrosoft-com header.b=QTLSLSag;
 spf=pass (domain: a-eberle.de, ip: 94.100.136.201, mailfrom: prvs=0620f471bb=stephan.wurm@a-eberle.de)
Received: from mail-db5eur02lp2104.outbound.protection.outlook.com ([104.47.11.104]) by mx-relay100-hz2.antispameurope.com;
 Wed, 20 Sep 2023 07:58:48 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWfi4DdU3GkQxU4x++YR7gqpfQ7NfK6i0zqN3LFFuJDkYy27KNO3V4Vh8AjbTZpRxSvqjjX1IjxdkEl4rxboU84gmWvX5Y46mjLkk/+A8cIhyBysdaA752RyCNVr0JsSIpRfKD7njU5o8ZyHooVMyaWK5cVaf0TNQ5DJ2bgpCH53gbCtOEDmahb9xlLLujP4O26FprQDpveo/DkmNRR4r91ZM3naaoE+ycUkjdJWueQP98ALovCXn8FpKMCK2uhClQEIG/swNU3e+MPDXgadIvdQfiIlgA3U5JALWzctQvyD7qAmAI6RVduweoNKxP5je1k3PLQPpBqhqC1vd5yS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02CwqWATQRow/meCLBzxfUVlIELqbschf01BjfrPovg=;
 b=iu2yHKsRDuX86y9ySro4+mmpDaedRJQX1jf+a+pY4a3jW4Ne0KE+KL9GrCrD/20mYv1h/BZ6tx8zVNgul/dHnEj7Lse3OK0ef5Bsb/774u+bdPEIkzNOzkZWCXlEdHNb1TqGgaro8g+ekOZMM/7Tm1uqQeM0QWmrnUczwhIG8wgr1yVK+u1QWAKk8RH33Xy1N3SqNCUEU5sxLEHWwHxkVrGeNdIcFw+xqMR2pYNsdEX/KdlLC5qW9qz2pVQzssNkCpmNEc2m9utyCNK7hWeEr6Q8LY69Z64ZL4OWkPKG+yjzq6/RLxySe+JDxoX0dhtvuUumXgB54yIGdmYqkt3cmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=a-eberle.de; dmarc=pass action=none header.from=a-eberle.de;
 dkim=pass header.d=a-eberle.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aeberlede.onmicrosoft.com; s=selector1-aeberlede-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02CwqWATQRow/meCLBzxfUVlIELqbschf01BjfrPovg=;
 b=QTLSLSag+cmCoeZqtYQLXPav0H8HP6XpAxx8bqogYkSAJNUBW3LTcmTbyVLszzcOk41ex7rsK4uu32fyGjFS0eUSVH4zpFOpWUe0pWaSoDnCZFfDSm1Lg7XC//juTJlPGaKednQRtFnIt+fy87q+4RY0MlHT76keh2aoAYMmbUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=a-eberle.de;
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:424::5)
 by GVXPR10MB5861.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:69::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:58:29 +0000
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b756:521a:4e29:ebac]) by DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b756:521a:4e29:ebac%3]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 05:58:29 +0000
From: Stephan Wurm <stephan.wurm@a-eberle.de>
Date: Wed, 20 Sep 2023 07:58:20 +0200
Subject: [PATCH v2 2/2] python3-jsonschema: Fix rfc3339 validation
 dependencies
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-fix-python3-jsonschema-deps-v2-2-7c58f77c19d4@a-eberle.de>
References: <20230920-fix-python3-jsonschema-deps-v2-0-7c58f77c19d4@a-eberle.de>
In-Reply-To: <20230920-fix-python3-jsonschema-deps-v2-0-7c58f77c19d4@a-eberle.de>
To: openembedded-core@lists.openembedded.org, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695189504; l=1071;
 i=stephan.wurm@a-eberle.de; s=20230317; h=from:subject:message-id;
 bh=l0RleYzYrkftGYB6Ylzfyq6PJTt8QpocxGW6SsvEBEY=;
 b=x21EL+i7mQmij5HRnuNNVbhQgV9pTwbqDkIDzumCZVOQCnYLigM9ItDL6jS/h/YaRqPUWLmvV
 hLd9zfwIrXOCrRP9ZFv9DT3Sbjrjn79q/CuzTWRntkXp17o95YBlWiY
X-Developer-Key: i=stephan.wurm@a-eberle.de; a=ed25519;
 pk=4W7OL09LxOkN/pLfarMpGFwTa1iy/s2+DvRJOl3RQG8=
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:424::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB7436:EE_|GVXPR10MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 72103b5b-54c9-4e53-86b2-08dbb99e9cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ekV0H8JpUr4vAoWoHQ120/Vmg2OAHqmZVaiMUKPyKAtDFHb4nCcVjAIMQYI9Zvw08kOzJJelNjdHxVIR7lIcgQ36eiS6EPZeCmwJYpHyElOJWWM3S2pV/nBIgzFjapvGLjik5FKt4+3oFRn9tySbYCrRhVu6n9yGxcOsEGHwguSPn8oWCR6oiJhXn/XWWZ5+MxW8JWvwxLOxwmAWKhGexPQX00efFfo62adurYebmFAaxl4fll6UguP8r/t8q8Pf5d9nhzuNo5wNdmSNv822AgGPxp0LgN9Vs8uhKNAyO1BU7s+XhjarIwnmsmi1q+2RWVZ/kpRUhDNwblE17+oTDbUi5CQZS5Dj9ft67ZdfM9sUWtq0/JkbQPfwwj5yQGa/BuEswfvcqIuiCKaRk+QTvsdvws15S1b1IWiwhJvM7JP8upAn5xD4lQbKL4ra++Ip9sFpaqR/k+ghpt86yql7cEu5fB+iSOcUuZQOpSPXUy1wmG9HXwR85sB+QJTrjb9pBuW74AU4Sa2vQro6fiv7TaRwtAvs3Sr+erRaKmZCoLuxLXZoXna21pwfah6j4PxV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39840400004)(346002)(366004)(396003)(1800799009)(186009)(451199024)(107886003)(2616005)(44832011)(5660300002)(8936002)(8676002)(4326008)(6506007)(6486002)(6512007)(83380400001)(478600001)(6666004)(316002)(6916009)(66946007)(41300700001)(66556008)(66476007)(86362001)(36756003)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHppTlZXbWNUY1FBLzFkZlQ3WkJGcitId2lEZ3drNU92cmFzQTBkN3BJOFdv?=
 =?utf-8?B?YTk4ZVd2blBCZEpBTjVKRmNrclZiSjM2UDhVNm5ndDR0b0VWdUV1NjhLcEpO?=
 =?utf-8?B?VGJKUTdWenpMeldvTzZoam9mTTJXdkh3OElITjZmcEsvdHh0ejlRTUJVSFFT?=
 =?utf-8?B?WFUwQTRHa0NPU041NnlaMmNUV1NVTjRJcFZDNHNia29IdS92U2RwYzR1aEFh?=
 =?utf-8?B?aFlldmd3czVGTXJiaVR0QUJmK25WT1RZTjBuYnNmMDgyUkRLKzlja3dJanUv?=
 =?utf-8?B?a1hNcEVPUGZmbTdnSGRuT1hDWVlQWjhsUmswNGdxMEcvUHZxTnBUMm93d21x?=
 =?utf-8?B?enQrdTZtc2IwRU5yTkV1WVpUSnplaVNtREw1TE9Fd1k5TDdpcGlBUTlUNnJP?=
 =?utf-8?B?cVh1RzJVZDFnUXRYU2JHemdsZWltMDN2ZnlDTnFNNFlkZmwwcytXaStaVExy?=
 =?utf-8?B?amdldm1tWTFmQ0l2V3NZaTYzV3BrZHZpRmwybmk4OW0zbWtHMkprVXJLb2ZW?=
 =?utf-8?B?ejNNNjhqWW9JSHlEeGMrYk1yaHZoV0pMZ2NBbXhOWWNZNFMxOWMySFZMNktS?=
 =?utf-8?B?eU9uV0RKOUhaKzkyU1l5emxnbDBSVVFKdkpKaS9rditSR01DWkZwRzFGZzlF?=
 =?utf-8?B?MFRTSHVvaVhKdnc2cGhhVWpCWWZuZnlzbWgxcWs0QnFYMUlVTEg1MktRRUh0?=
 =?utf-8?B?ZDg3MnZFbTRyN3pSNGhCVG91WE1uWjdWYmtDdUhCUkdWT1pwem1CS1pRbHJ1?=
 =?utf-8?B?RkdGYitRY1AzeWdSc2QwTHU2QnZSaEJiVHoweTBvVDIzWjBadGZPempORk5D?=
 =?utf-8?B?Ym5VTFQvbXdoeU9YekFtQWVYRDFrNytCc0RjSUZZRGk0dEl3eWFkYjhiRjlK?=
 =?utf-8?B?QThHaUNJVElVZ2hWSHdXQUxEZDZNa3lwalNZU0RZUWNTMHhLNEphak9mWTBW?=
 =?utf-8?B?SUYrNDEwUHBlRi8wc0RCSittZWgxVFFHUlJhekxyYXRvZE9SMUppN1FLdFAx?=
 =?utf-8?B?ME1OSk5BRm16bkMzaEVRbGRHZW05bmJIb2dqNWcwSjRNbVF3N3ZLSXFwU2Ra?=
 =?utf-8?B?dEZGejhMYThTYkNOSFNhYjltNEZZbVlibis3NFZWZjA2TUUxYnlCSWFtMFZY?=
 =?utf-8?B?UzNYUVNNNTYzTlhoZlUxT2ZDVE5vMmhtTFhnT3pLakxGYWdzaTN2UkowRkE5?=
 =?utf-8?B?a2ZBYXlTd1cwMEx6N1ZidWdFUDV4cUszT1BLeEtJdlFOZ0tTOE9RaURQU3dm?=
 =?utf-8?B?K21RdTBNREZNMU9Nc013SHArdW9ud0VEdFgvdkcycVJZaEdQU2lVMHNhaXJv?=
 =?utf-8?B?d1N6NUs0eG1KVWN6T25kbEtRaUZZcGFkQjR2UndwQTZDVlRSbm54RlpHY0Z2?=
 =?utf-8?B?aG1hT09EeXdCcWtvcGdXbGE0SElydWRMQUViNmtETzlCR2RMb1ZxZWJ3aVNx?=
 =?utf-8?B?cWZ1ZFFnWU94b0dCYUVEeUNqblh6alo1Vll6UFB4VEg0NVNSOG00clNJbUg1?=
 =?utf-8?B?Q0loc2psZ2h2WkVjcjhSQmR5aENOU3BLLzhBSkpCdGlneXVPTGluRXVMb09F?=
 =?utf-8?B?QklFMXQzTi9OMUFLaFAyYUlKZXdtUXBBR2gweFk0ZXh5TlUvcWRGZUVMMFNn?=
 =?utf-8?B?Um5KellYa2J4UVNzdGVqaVZYSDFmTExybTIvMjZxYXRtWTFrS0ZFQlhGZ0pB?=
 =?utf-8?B?QmhoTXJRUHp6MC9FeTBCQ3ZhQndRQkY0N25pV1ZyODltSWlpMFZaRGxrMFN4?=
 =?utf-8?B?c25xczRuYzVBSU1yUnRIOWpsLzRIWkVIWXdpRDFKL29XTFdTR0o5NnpBVHRO?=
 =?utf-8?B?U0FyZUJpdjMwS1phaUpIL3F6c2Jlc3A5ejlYTlQzMmI2RW5aanYwQS9FRS9z?=
 =?utf-8?B?K0lYNVZHdWs1aEVETmM0WXM3WkxMWk1GU3NUd3hyakRFWEdSQVM3UEtSUGVL?=
 =?utf-8?B?RGE1WE1SZmI0ZzN3ZjM1VEVBaE1jOEpzdEdGUVFSVzIzbDRQUGJ0bmptN1Rk?=
 =?utf-8?B?RDNtOW5hTnMxbHhqT3ljZHN0NnZwWjhPTkYrblZMQ29sSzhuS2pnS1Vkd2NM?=
 =?utf-8?B?NUxwODFROVFXMTNqVnRMMzQ4c1cwYk5ZN3dkcVYzR2h1dnBmRm5DWTZSbWJh?=
 =?utf-8?B?aUpITGVXckpEbmRIa2Q3aGs5bnh3OUNvRVVmQ1FvbUx4c0hYYUxNeGRTdlp0?=
 =?utf-8?B?ZXI0Q2hHQmJsSUVzTWxGcDFrSTc2QmxkenpBUXJ2bWRXZ1EzbmNOdllnUGpL?=
 =?utf-8?B?UE83bExMdlJBeE55T1JJaWtJbkpRPT0=?=
X-OriginatorOrg: a-eberle.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 72103b5b-54c9-4e53-86b2-08dbb99e9cc9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:58:29.0189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2996bb3-18ea-41df-986b-e80d19297774
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lj46K7UusmOzWKHBJ0US2MXDYot1zeCxjDEPQSOvveXLYr1UHxCYXkQWDu8B83vettPfvjC+wqY1vRBeMf9TCeNs1DniE2n071d5/Mpt2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5861
X-cloud-security-sender: stephan.wurm@a-eberle.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: stephan.wurm@a-eberle.de
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with 8959E16002FF
X-cloud-security-connect: mail-db5eur02lp2104.outbound.protection.outlook.com[104.47.11.104], TLS=1, IP=104.47.11.104
X-cloud-security-Digest: 2cf5ab1a112b2f326760d20fc1141512
X-cloud-security: scantime:1.554
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187896

The project changed its dependency for rfc3339 validation from package
"python3-strict-rfc3339" to package "python3-rfc3339-validation" after
v3.2.0.
But the v4.4.0 recipe in does not reflect this change and still depends
on package "python3-strict-rfc3339" when "format" is set in
PACKAGECONFIG.

Signed-off-by: Stephan Wurm <stephan.wurm@a-eberle.de>
---
 meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
index 92f4a56792..12773ee2cc 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[format] = ",,,\
     ${PYTHON_PN}-jsonpointer \
     ${PYTHON_PN}-webcolors \
     ${PYTHON_PN}-rfc3987 \
-    ${PYTHON_PN}-strict-rfc3339 \
+    ${PYTHON_PN}-rfc3339-validator \
 "
 PACKAGECONFIG[nongpl] = ",,,\
     ${PYTHON_PN}-idna \

-- 
2.34.1


