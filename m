Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2960C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 15:17:40 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32770.1786979852596162206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 08:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=K6aYMsWn;
 spf=pass (domain: est.tech, ip: 52.101.72.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd8vohFy5mRLZvoQVBGVUSFUhT5et3daWJjErMETPYyxNhr2SkW9z6zdCsoI4ytLIhAHf9uWgwVckE2T9QQokieJPke71ATEmqtB0Rhxsv/RBC7jxDZDA82d1YBGCdbiBhatwaWVqU9SdknpsfMMJZ+gcuxl8y9d3xSxVafTjKh78YwLhPx3H+enwvn3vUXvcXqdgL1Nq4sYuf3Ao5iEXh+gN/LwL1wrBmXfF6s16xE01fEvUZUVKW3dpG+Bg0+gSG/WYn6XlClySJ7Hsa16FxxD17ToUKTMTA2F5h1LsBEZzKNlxrNoOoViDPDt5OX0uQz1h/afkcIhVyKmlliXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sqHmHxw4p6Tg14UXEwItAs52npNKE1KI9U8ZWyfigM=;
 b=puS7BobdIOHeZoU9oV2lzevYj/Qga9weyyb9+CODZzV2M/vQfhTz/ijgptZyWCXj3PsjCxVvBv5vIVKMfulWPOv6JkiGRx7i2RnSyLHcRnuHt6jVpctWVAK6HRhXQPL30PcQw0n194Y5ktVqWzZHEOHeAm1C0t1iB6QbamdrLEy/QshbjukfaZLigHmVK2t/58/YcjPhzQNENOs6va9mSieXpQPnLi7iJqeQqVdkF2bWqQYjcTl3Jgm7XBIv88inuDJA8xexrwbL/q6fmbmBEeA8ia4kqgHV7FZ3WQdvLIs1o7UfyheYbB41xxb7byzoEmh2IC5HXAy1VYEty0y/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sqHmHxw4p6Tg14UXEwItAs52npNKE1KI9U8ZWyfigM=;
 b=K6aYMsWnf5RjFA6LRJfne9O/B5myXKSkk3iO9oAkuh1f2uymjlircNerTScHY4C9d+gQx5LsyYW1BgP5F5ahsKrt6431PDxGgBplvgdk9q13lBJnhLgR9U5Ki33/tccaMQuQYzE2s/eNLIcoseJ09WWbkzHE0xQuyO49E0ECbx2ilAT+EJkS21EEe9BSt2JRFvdcmmE9CZjk4uUD2crgTlgfE+H5rQYqczsPpAsBdtzncX8TEjrMoKGOPEgZ3HCX/wWjTq/0wqIQZrkgP0x+dHNkFK/UqJ0wsp6K7a+xyjb8ZhM+w1e9NE1ZI3KMIVMEbfBbaTOHxU1W7YZYXAANbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AMBP189MB3194.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 15:17:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 15:17:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH] expat: set CVE_STATUS for CVE-2026-72522
Date: Mon, 17 Aug 2026 17:17:19 +0200
Message-ID: <20260817151719.48749-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AMBP189MB3194:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec5f5c2-1294-4566-acef-08defc72a614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|6133799003|10067099003|56012099006|5023799004|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6cbbZLAppw2R2fWgNzNGmsEZkd6d5OXKtF9b3spd05qLu/+0d7Rggoea56TPA1/HvvdI6kNVGpgjFwmzH8uu/81Gre+ftH7e8/1a2IcAjDqceba3z/bk7Wqu1h1luVJm77CNGlGI81FD119NyBkSzKbg1ku4hJ+6F6pzn63V6EaywyFKpihKBhYsZMxQApiFCJg8wNALB7hXzQsoIoLP7rFCyF6SoNMDLo5X56k4QRmVqs5Y7xuKNpLaBZgMxI8hpGLOuVyxuueDK+k1zyeleKucHlMVP6NMrF3g/62HeNrCk7aA13tSYFzKPUmBSQM+0NtCAMtJKoIgtuSBgD18slvH7p0g5Pg0ViEFzfgvzZVXYJZqF546bXPfTvU133JjJ91iK3HlecrdCCJfKx+Y7MYYhR8WOPnGcU1FZLz84PefFBFpaem8Pb7P2mO37DtXbxWYFy4oSHeA+AcDItJJjuFEzkQVO8Hz2lJZOXcYhx3XWIQSmZvUZPirAQMLMJhYgdBK0Ouymnqf0HK7APsCWyNMOkcigW+y91B6dKYVwWwAHZxTNYUmsabtKkXKZT0RluKFNdeFTW1phTUuGwh5ugdOuobX9DweAedjOEsfEHTxZ2Elj2uoq107lVXw40Lv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TabPTSOn9GHLGhYNBj61C0lHusami9RJZbXgmJ1AuDxX7ZW1ovl9V+5cf79W?=
 =?us-ascii?Q?ZJZmMnHWIJnRt9DwE47X9/Myvah298sJR8LUAoDLrjIH5MJlSEFM1LugNMHF?=
 =?us-ascii?Q?Zjd6y/uhinDLWCj7aQgamiLSNHAiVcq0luMHtuJe4lBCzfpvP9dvZQ6uVzjm?=
 =?us-ascii?Q?Y6ZpNOJqmWCVu8RPWqGRf00o6+fEU7bnCrnsr2BUFiFkLX8gEGcINzp24IWm?=
 =?us-ascii?Q?FqtrniSGCZBRFMRImUMg+0TprS7TwTwvM9w8VC2AjNjUTFLPFVaQKVOsLcGZ?=
 =?us-ascii?Q?n9g0Tkth+84g2Q0iRA4t5296x0D2lqx8AcHAjDBBSMsihtutJpRyw22zS6Di?=
 =?us-ascii?Q?j81UNFZxzCQcGKLbh2V/RtVDtynlz0qPXUVMnBtxKfKAq61X0IpXQQCGtnFp?=
 =?us-ascii?Q?IEMuH+oct5EqCKk4ZXj9IszyYWaLqxaU4j6IqbsjNBRIH4b38Lx6m+nd+1Cj?=
 =?us-ascii?Q?9iUQslnYmAHGCyOYK9MV1ALE+OxrKqlZ5gG1gf0qn42TW4Yn6qDoLvk1WV2H?=
 =?us-ascii?Q?oXnuRuQnUoFcRUKg+RUErPbzvITrDKMFIompMHyjOwur+CWT+0Bo+16Z0oPI?=
 =?us-ascii?Q?eVr6fnmSXDg1uVJoh9OfmIqsHzh1BmChL7nvGVElVhkDGd+FdwVxhakj86Tg?=
 =?us-ascii?Q?3vqcnM7A/JEt9suQTESuepvdOWiQ+pe54ikEa7ex0052JMFqEmX24u49txKe?=
 =?us-ascii?Q?OH0mXCEBGeI6AoLUtRNbit9bhlBEktUDWbX5WeXAzjssxVzMomYCGiSiVbYf?=
 =?us-ascii?Q?X1xgSMcbCCzbytlFnqbvMBk1qq/0crLdqj5idRS+WoEQPtgud1PumnaCO9iD?=
 =?us-ascii?Q?dEo/jROGed1nQatCN84Rbsf5lyPGwhG0SS9DgxWPAt2ucwgZsmkEG3dfnVot?=
 =?us-ascii?Q?E362hJYYAcGAIifUlnYG6yXcQgRvjnv2+3Nt92LTBMmDNjN/V9NVZ+kjoFNo?=
 =?us-ascii?Q?L98oBolo0o4aPdX0Y/hfESTwVJw4El3KSX4txGdOkdOyRWN0asuOjZe8tSk9?=
 =?us-ascii?Q?qLpB1p2IsuwNuPP1cEkAz2AMH/ZrOp60fujtRzYoxTiVMR5VD9l5ctUUzjnh?=
 =?us-ascii?Q?nUfQt67S6NlojVOkvLD9iyb4uXnNGM2vSnhBf1/9hFNIBtgTxEkAA2sqUC8F?=
 =?us-ascii?Q?/QSluAfsGged8G2K2XrwnPvM0v7qXndPbtJjS1JFE857E1mEM4z6UaPQYDrh?=
 =?us-ascii?Q?6nkEtrvnlvVerD7HqYxxSEzXL1VlEzzoh8Mr2fxvvvbnrDOPLGaAC9s6c1Xg?=
 =?us-ascii?Q?7fvcpaoVo373y+27OzE0no8yPAdaBT5CzE1CN+cUpwhYlp2yNilxdmPxsfYO?=
 =?us-ascii?Q?7EMgw19jTEGP3wwGF5/NNO2L9H5KEoEtRtZTDqUrJKz0xME6nJUEUqXGKvs1?=
 =?us-ascii?Q?azwOQeUa2E0Rz75YIAxcmc33tqw9uaiA5ms5IwXL0yuBBgYyWdlVZOfxrBi7?=
 =?us-ascii?Q?nufaOJKTFTFhdp8w8dLzI8gJwGuM23fgU4l0TrA204gKJC/KsemQd9ucpDQj?=
 =?us-ascii?Q?p4/uFemBc1KfFG+WWOJjzjAkeJL6Jzjg9DUHVqMSq5lQRHAqYw9Cgub75uQu?=
 =?us-ascii?Q?rb4Q6XcIsvoF95DmYSUTm6ixu7p0th3ukcGUqjcn5GbXk+ckMIgio/n+DxQ3?=
 =?us-ascii?Q?3AaEkPcgZNdxxssEmX5mom5YTeIuXu5RIETQbnVN7DIFK2Z74pCTlq+zbdZg?=
 =?us-ascii?Q?mx1/yDZ1ZX8MjZTpRxJXU4ft2VVTR60YaUh/fiaf8tlrfkTLSupb/Dcvkvgn?=
 =?us-ascii?Q?0LfZDKqGPOGj1AQGecclk/B6xwI5GpA5qWNYCGP7iy+JWUbD4ytyD0QwPVXe?=
X-MS-Exchange-AntiSpam-MessageData-1: tpn28JzXUzDF687IwPBVcCpsMe9Y0FVvLwk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec5f5c2-1294-4566-acef-08defc72a614
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 15:17:27.7016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2/zATK7TVuXVJMVhqW2niG+HXBjys/a6mg4CLvEFwd3sXvkT22IsAWF+3tJ8q0of57X1kThU6HCRFyKsnz/iKa8zhOtT+Ppw6TLRlRBiKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 15:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243626

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
 meta/recipes-core/expat/expat_2.6.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/exp=
at/expat_2.6.4.bb
index 3581d94fac..77950df189 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -82,3 +82,6 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND +=3D "native nativesdk"
=20
 CVE_PRODUCT =3D "expat libexpat"
+
+CVE_STATUS[CVE-2026-72522] =3D "not-applicable-config: Needs Expat compile=
d with 16bit character support , Issue only affects firefox/Windows. \
+EXPAT_CHAR_TYPE:STRING=3Dchar is for Yocto builds"

