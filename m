Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68B5C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 15:13:00 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32673.1786979578262199767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 08:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iqpl4YbM;
 spf=pass (domain: est.tech, ip: 52.101.83.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCyhmT9Rr6JECkZOoTjNURok3DbdnszrrXQnbjPvV4oe3zc/6BmwpjlIEAh6nvUNHOuXr1Mds/IVxspC8Jo4KxkZTOZkkpimKPi6x2PpMNptTQ+cModl6BSXXG6824qsobbVfLTH+PIaAWRl8Np/Bp0hW/ptkXVqYgdeW/t0Is1cqcXiXGhvxxvZDjsZH/gc2TNAcGmyhSrOQsTCJBf+fSwJvOla/STt8G950WbCmdTpTEQpAC1KL51apffaoB6c2F6vJcSfEK5/Sclm0A8gcPCYHd/Yg+9XujEToR3A5MtC0F6TNM2/laDlAoT9bH9Gb1I2hKJcmW2o8Yo1fWSOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kchIdxe5xMV9a6bYXOuv4Ku0IFzzk1E4e+2rlH8dQuc=;
 b=YcUJA6V3b8nfmNGSTNC60s3Ul56ksJHKtf4aFocGYDy+3lA6x2kZFAOGVIt+c6IfZeUAmlO0Omsdh2zrFgYQwYSRWuC7BVqj52c20xmlzxW5iMaggGpIzN5u4NTk5M7BPx7FC4zKRwn2WdKgZD4ZUy0tkk9Yc0HL13V/FP12FKwT5jUsbD4L/3nJ62rFQMSdQdR2YD6YmhWmzb0ar0WywP+eT1PG/EthZKyul27zldFjIjlBeeodhqYvrCoUuCVYzr9jbY6135f7Or35w2of/cxluTIWbjph+0bzJXNXmQeGjJvswIasYGs87FGozv58XRhXrjkxw5SMxeJVRHYpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kchIdxe5xMV9a6bYXOuv4Ku0IFzzk1E4e+2rlH8dQuc=;
 b=iqpl4YbMUWyRbrts0zVqbOKjRdn6HDfjS6uR19rdfo0cQ27QZfYFjVoK86eak1/8wV8y5s0oRh6cPnMEYEWjLvSNQjK95jatNUgA2jWamnD+6sh0vpxaQWsmSiEXoGlLi6A5+A2BgzF4Xd91YNpP20ZQB17t0EIE6rubIt3pgZe9DppqP1cxFPFHyfUD+lt2vmyB/W0sA+JqemkXPhYUe0sj7z/Pj7D4GDrAcTK3w5VW/2PpThKWYezDBPHW6r+6+rfgVbvj0xl4GWWZmnZkdYddfwzqV11umH2Q3cEb+PcRMLuGzEGn/LVJ3qFDgiz1gqXKo5HY31TTt0eGT1b77Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2142.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:528::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 15:12:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 15:12:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] expat: set CVE_STATUS for CVE-2026-72522
Date: Mon, 17 Aug 2026 17:12:45 +0200
Message-ID: <20260817151245.48711-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0604.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2142:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b7bf98-0a61-45be-41fa-08defc7202b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|376014|10067099003|56012099006|3023799007|6133799003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: 
	e38KAec+TBJB7eDMjHLr99QYl792t6wldHnP7kjb0uuN03i9mHHyP3BgTYOvvAlEglMPYgpVn27FepAxZpa4LJVTI/lZRT1h4jFV+yc/92wUXr0hVLCscw5FVgbl/CFU5ADunC8iSeLdXZ/0woq1dc1OT7qmT3vrU6elT6lkmWaAc9FJxXr55FeCIvw+V0HoPCLoTWOvz6ODOlH1cKpc7r2R8EKAI0QzidppbbCIzt1aj75JJVRuhCfejw7gQibADsc3IfYR8Pm7MLqPNpw7ADPKsbCPS+ng1nIK6oh2hRJFKohCos8/HFe+3Se2dTb5QKEaeVuOX1CahDrpgA0qYZN5QnCWewVRA+0OvnKz/6h4Hu0oBFXpNZGJB+NSarQ6UoN3K61pqpPg/1HSlh+tAQijm+Q0UUiix+IUR3GZMdkNL02CIWhA1wYJOThSENYJO9/16DB6VB7+A8LPr3YLS1GADN35OmgEtT7VSdNA8QiRQmMdP/GBIJZqO0BIaaq7qUr6v6v7uO4bW2pN7+z0phfdzA8gbsFl69Lvodb+YYGAvcuc1+TWWyFYqZ0Nb+HyhtcGpYnDHbvN/brJDoayBAbSZHb7p7HwKzZXJVOsrpRrr9psbOhOb1++/KAMHI3D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TCu3RjZwqd68CS4vhIuWSxVNvt2nz73QFnUf9qYUegnKqjbA9xLQov7LxIzP?=
 =?us-ascii?Q?OKYQXLAAOIQyKOj9BtDe2/6EJjoUOmvSBZeXY6sEUHs6a4WL1TYO57QdS+K5?=
 =?us-ascii?Q?fu/dd9cRLBNRvc054jWQ6oBV3iV7VIETEMZ7/RNTIZIogUa+CqHqfDQjO7vw?=
 =?us-ascii?Q?cJuuH0oNGZsi9nFBbc2gfXXxEIhIsfHbBEd0cscx1yxNPxeWAlnrw1AQmX+i?=
 =?us-ascii?Q?sFFv/wOYr2seekL67bVavMiGGtDZZ9kkYMIDJuePLjGQfmiH+XBzjWqGfb6g?=
 =?us-ascii?Q?G16IoKEopZagF29/QHBNeAd1NhhQbxWGWhAKrBr9NLqS0dqfa9PInzXXaBMp?=
 =?us-ascii?Q?lj79+9aJfDO0o8SrHugKLarCi5kFSVknCW7OBoqKnRKKaRgUrWX7Yz8tjxBZ?=
 =?us-ascii?Q?xNG3ZNoc0nA6xTyx15b1G3JEUQe/+EZpOga2/XrYWQ36oD0goPHUVC0UUnpW?=
 =?us-ascii?Q?IC1XN1wx7jUbi/6LDd8p6jCRLNgAwG5kO1IWPZg4QoDT36oHb+7ItayHUvDa?=
 =?us-ascii?Q?RvW0BPaIIrH5P6tvK3yo6gbyBmPcVxnRCxoGT/V/Ai6GsgorYP9hx/pY3GUa?=
 =?us-ascii?Q?GzVXIoIv2qTNBnuChYcFcJH7dfTIzhzpmf04DpZyZXwhWECG35DY8rQNSye4?=
 =?us-ascii?Q?Un7GtWKhCbR9HVUuyijOoVXYZJa9cs92u23LCWthhq06KIIZL6VnTSCvHwXF?=
 =?us-ascii?Q?v5XpDns4EMZ+dnrTTkSKO8hAeOUXzxdxdc5fHKhtuzsiUpKBsmENImJ6Jp4p?=
 =?us-ascii?Q?MOnkPbykCA+Xegwa3d3ROqf84VyEokOZ259x1b9+NBHeww+JCDGJCVRtXX97?=
 =?us-ascii?Q?c3INsVTBXhr/9ZigUyl3nLsN+zZ8uPigFSzg4YDW3bQAhDFSkOZZoBNZE+kQ?=
 =?us-ascii?Q?zGhZtSKlXWLzdvUxjyIsjtfpmYJ1DWsMI9Av/CVA4+9P9e6jy6vKO1uGrzFw?=
 =?us-ascii?Q?k/IJ9ycFkObVQ9nuj5N/ffZY7PlpImI9HLgP7U+/+UeRFaejd3WGGkiIQP9I?=
 =?us-ascii?Q?kvm1a3O94P9K7o0qyv9cUniB+XcquYPiwlgjb2XJ2LDqsXwAzjipzZ8Gzy4R?=
 =?us-ascii?Q?+Xtnj0GssFsiDmCQ70PEwzweRztRbyU+/DLvGuPrhzT8ZbYWza9cnKgqoJ/m?=
 =?us-ascii?Q?OVdqBtIozBEeNGLpz3zrIbiSS5YePXg/Rlh7bB3CLH0Wcg78bsVXyEHjmPvr?=
 =?us-ascii?Q?nqSx6fb0BlY965NUHgFSoQP0s3xmaE9c3CeSCGWaDijymd+O4qjrfg7gA2rv?=
 =?us-ascii?Q?pYdR9Y0brcXTcVHZD7YX0eOyC0BKMd+0+JcQpwHNYn62UBArJ8c8DSpSGelL?=
 =?us-ascii?Q?EX+/xGT7o3JnHvkcvr26nodZo/vY8ZHVaBeNovDpKkYQgE/kAU9/SjbT9gGp?=
 =?us-ascii?Q?vGotLYCiyoLD2IE93d09vb58umbZP1e336lcqy00NWioCm9KYJVD3tJ0Cxn0?=
 =?us-ascii?Q?/romVp6UcsrY5ul0LQbbsRQCYgeQrZVHctuyB4NADPpa+dXM9S9ig1S+1IEp?=
 =?us-ascii?Q?7NNY6bDt1kxaFdU0pXZF7bhzFTkcCdO+rAGf0Vb9bxzsi/pruTZqApGE/ftM?=
 =?us-ascii?Q?faR22GTFnCI2ZOGpMoKVtM0cGyPoUJZGr117tgCTWdzM1IbhG4obRc1z4HHM?=
 =?us-ascii?Q?UyYiLIsc9IiqABRS7oUcyID0P428dc7R1OnNzLTkRjIac7rVFVvdemK+AY2X?=
 =?us-ascii?Q?3Y7TfHackKGvg1toZYsCJfGRl+0YTw+7QZK9oaYsoVVNac1WERxhIss15k31?=
 =?us-ascii?Q?KDKEV1wKoGJcw5neStRhO1hYVHLC2GgTpUtXu+/zkZa+4jOvfcccK94nchb1?=
X-MS-Exchange-AntiSpam-MessageData-1: cVFjFjlqUyoZ194kaqksPPrxNpGuEDPbknw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b7bf98-0a61-45be-41fa-08defc7202b8
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 15:12:53.6405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ydm+cTvwUq1BdeQ6Imyf0Ic+Zs/glL6mt5/9MG83xPNb8P7vSkJpvdd5dpzGH0LSgDwWNpb7Anko68+cKpd/CqSqtV+jte7XPcK/fgS4Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 15:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243625

CVE-2026-72522 is an out-of-bounds read and infinite loop vulnerability in
Expat's *_toUtf16 functions caused by mis-classifying low surrogates as
high surrogates.

Our Yocto configuration is not affected by this vulnerability:
- Expat is compiled with EXPAT_CHAR_TYPE=3Dchar (8-bit character representa=
tion).
- Neither XML_UNICODE nor XML_UNICODE_WCHAR_T is defined.
- The vulnerable *_toUtf16 functions are only invoked when Expat's internal
  character type is 16-bit (ushort or wchar_t).
- In 8-bit mode, Expat handles conversion using *_toUtf8 functions even whe=
n
  parsing UTF-16 encoded XML inputs, rendering the vulnerable code path
  unreachable.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-72522
[2] https://github.com/libexpat/libexpat/pull/1296/changes/8fbfb52fa88e040e=
8b0b7a9d39f260d6a9e8b6db

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/expat/expat_2.7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb
index 890ee5b7d3..da35b8f9ff 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -57,3 +57,6 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND +=3D "native nativesdk"
=20
 CVE_PRODUCT =3D "expat libexpat"
+
+CVE_STATUS[CVE-2026-72522] =3D "not-applicable-config: Needs Expat compile=
d with 16bit character support , Issue only affects firefox/Windows. \
+EXPAT_CHAR_TYPE:STRING=3Dchar is for Yocto builds"

