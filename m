Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4970C4167E
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 12:41:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.77])
 by mx.groups.io with SMTP id smtpd.web11.8816.1644928904247377328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 04:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Je2ebSn4;
 spf=pass (domain: outlook.com, ip: 40.92.90.77,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIe38fstzBzd+prYiaQ+lYITIESW85e/BoReid7hNtD+8wtnW6JoDhQXxWVYLa41FAWYxNYpKErwSduNGAKFcxNqqwlLh95BtihBDe4CkYD4FMqLTc55zuwyouwKw7pKvB220vaa0NOkUIw37WlLgDNA0b0QY8QOY5fTIYxsoPAUcCl/Jo7jWjZC92pABM2rvLLFskLJGtGmh413bMf+W3hJWgx47dCJDTy6ZDg73RCDPOaUGXkyl3NLOfbgc3HHY6EB0dQz4WqFL7bQx3wbK1BZDasOM0R312YVquTxHxy5bUJ9rs6DQyYQMWhKuUuzX/m71erv75lXTrB/myIZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtDAgio0wcSFOrcxiHGQCNoSE7KXJIu7PDS6LNlWwAM=;
 b=GzADxrn26kf6+xcYeswc2HkABZUGWXhL0ERBm4KPKpdmMEgaPws8H8GJBTXiIkmvNUwDenoOIoX14083SeXYRKhPdD0R13dEdsxip/NnQs3buzn8vdJbjpgybiO1ypxUlqCBDiUmkBHQfWQsjVCBLb5o50jvzFqTB2/J7/AKg7UVMC/pkK2giq1E6eIw8YdjW3US6K3L0vJi83+kTM/gdaZDKeeTyRZ/hf2lLY/VVDk1Ss0PXSb+0ANJptwneetjXWnfi2beYuD5TEGcPo+OZBGRKatbJaPxpEhKcO76mxrDOt7QrMct6qxmh+RMn70BH8LiHBQWezWB09alz47LlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtDAgio0wcSFOrcxiHGQCNoSE7KXJIu7PDS6LNlWwAM=;
 b=Je2ebSn4CcxEj0e/s1mbrgux/LQT9sgIED79jGN+SB+abwWRIf/EwIC1agT2W2PcigSSKaZyXpWV3XLohuCNuF4RRRuPt0yKnY0MMWJY2e5TEOe8IXcfRuQZQxMlxNOO3iLeC54Wi6MJnYuNE6rbuJ/GFCR/LpS7NngWuOprjfDm5zBXbMAP4vmEAu+lhWJDD3VGDPVHKDg9BDC37OdpFkwVVcjSZO0Erfa5PgDUfGhEmpXR1cwAP3KYSda0+ScricGke76WXPRtf5k40yc4EYudmXGgQe1HCiJs64yqG3x+TBR03ksk3RwFjZ3s6UuiqrFn4wD1hbwzB2sg3IW3qg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by PA4PR09MB4560.eurprd09.prod.outlook.com (2603:10a6:102:ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 12:41:41 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702%9]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 12:41:41 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: raj.khem@gmail.com,
	ross.burton@arm.com,
	Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] gmp: fix EXTRA_OECONF for mipsarchr6
Date: Tue, 15 Feb 2022 13:41:02 +0100
Message-ID: 
 <AM9PR09MB464241300636B9ED5F4BFF23A8349@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [X4ts5o+kd4a7NLI/GVMhY4InnKh8NdKh6MKBFSO6S0pp3pCBg9tA9mccuD+c5MCr]
X-ClientProxiedBy: AS9PR06CA0324.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::13) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20220215124102.946812-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9419a8cb-6771-4302-ab69-08d9f08083d0
X-MS-Exchange-SLBlob-MailProps: 
	aa/WAlXx4eSkByeNbgZsmQlLcA8/zkjAzg344WdTQHQeLjKaCW0oeeI3o+rdWy0HYifWY3OmIq5fhkx5Ds3ESo25Xa9awJgObnVzd7m3bSTb3XrwmyENWGEYhsH0sXhuKJlWn/vEGMWJQTvqQo6VPfO1MRJbrHclrDFFl32ZOO0doHXgfaeNqutfVW64ZRkT5kYnySpNY3tp5ZVWQUnxo4ppORNEwSRMwcVSEroNHrtVcXFqQoI3vC1ioIgXIHluUn9VN91Xojs1TxQCcGM0jejGuZFH3bqVdM4ayClVJ9YT921+GywLVXpHZ7Sd0oOSMZgkVgcT3yzklESM3vDrPgJyj9yzT+tjgEezwDoQtF8fyzE0ZMPoCWOzxbzmO7g8q+jL0jpxcwjhkIFNTlFW5PuM2rxooXx84PDOuBYmAgMwRW9P2swV4eac99Q6GaBTDbB+wuYNIF1e4TlJjs5WDldH0VfuuP6nasDJ8spAV4eAzk8UxhJ2ScoDrnCDIuY88ySCUecq8WwW0PqynJRryYxJAZ0udgMzqQvZT8OKobnOdToGzG6s1niuMnrW6M+sqjffcKz1Igv2iZ1psdIpSBT7BKrOUVCdrVspcxOckyD7yI7TsnqztI4ynBVuwVVLlpBnZZtRHL0gw4ibKUCgqHYrk19Mwwc19a81r0mU9zgJ7yDkz3XiP01HcD4Tx+psTnH+qpfLNZANjmgdh/ZQfherXs3EFqy3iLbLfdLX4AQOIeDiu49hNZh5mV7+jPsqz73UbykpJBHcFeYFqTNzYyJhOB5rggxu
X-MS-TrafficTypeDiagnostic: PA4PR09MB4560:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y0V5SSxcht0bAfTPtfcJPSoJzSC67vdlJD95CHpHxgR0KaUK2TAE4VaA8vJGp+Inht47VtP2W1T5fMamH6mDObJwhu1xekmmHFrjcBjtlkrd71Ef0lKQASv+yRBfU5c6YBvndBIfW3E9QzLUQi7XFWSNd7YW4ayKTdcV6rj54y6w3WlGwJiCp5Tjp1bN2ibh2V/VETWYypn1Ac5EQAUaDydSpt1AEpQi8CIrWWIm+kQU2+S35idy62B5PVA1m10DhyUhE1ISn7k1ofky3X0t5XCvCCwTF9Ku62CbDB5y8xhM98eMEayf1rLXqUSIbUeXNJPV2aRRj5k5QcFgfKShOrA+cs+Z3NqDJ8TX5jnElz9el9GjNMTrIt72U/okclxGiATb0CfLKLB+/4WCSKH3DsZ0PRnj/+9yzfGxiv+Zeal7NbMktP4jyjx4+qlMj6Z+WW95S5e9HVQFbqfLltGE9WPPhYun6HZmgTry3bH2M5ZHQz5B1y3P3O/Bck8k8bxF8TDS7+EZIVsJnG/Rwb+YZcWHSBdRdLVS46WfOpbDJTWZxyCT1kRdlkuuWTrnNj7hufpJfe15UVTIrayHlyf6sQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7dmUFPlidA3C/U0FgA49t4l1Cnd5Adky2IdNNp3+cVAmME6sKWrQnJYSEJiP?=
 =?us-ascii?Q?j6ENZcwJa4hG02eh78ogijGVa2WRi3YG/+mM6pRoMbT+rfJtsKodRB/4I/md?=
 =?us-ascii?Q?4Sz0ych04GvGz+pBbnQ+YZRxFaIt2I1ux0YTozseuMPb6d1au/xISatwmDqW?=
 =?us-ascii?Q?PegyCErMfJaHe++ffnuwlOm8yMv0WVuxdXEWMMQG1IXEApZkWUE7enECchc5?=
 =?us-ascii?Q?UVWpImiw7TCp6RX3w7os4n6ECsgF4gYzJJrZw2HH9ariHUr5sl1mOsWKhcJt?=
 =?us-ascii?Q?JvJCWmKbyZBLbx+WrbGqJpPoSC1V6O/IW2RXTqAlnyqPhbtotbM2auK1LGOC?=
 =?us-ascii?Q?2jfC2YRpTbE+EdfMENhlfDp6Qr3CIjUutI6DnYjypYOpFkaujkOAwXLI88UK?=
 =?us-ascii?Q?B/h36tU0D47RIL451Zan5VbrdocqCB7AaT8CC3AeH++r+9nxyLzyGtl2CZAW?=
 =?us-ascii?Q?jGsIxBS/Gvq7yn1Vyu3eRZwEPzLGr1Pc51yJa6bIJIkLKo+0rvebfOD/9JRD?=
 =?us-ascii?Q?R7p7wimzWJCOdQaX2Ihf/hP/oGovEZyv5cuvDd7p59CgoQyt/R/DzryI6Utr?=
 =?us-ascii?Q?/Vwae3A1sqtr5YmJtZmYDE2X6/cB59BOkqn2Ml0/Z60KzFofRuQljWcMl+ml?=
 =?us-ascii?Q?UoUfV/rpUQdzAyCXuo87RYmbsOsEaxCJrIuAjyCDaYSu1jXot71Vty9LEBWW?=
 =?us-ascii?Q?Ha+R1SjlJz84Sdpsc6NhftDw7FkhEUyjuYEzzHuUHun0ao2wD/fQnrVymExG?=
 =?us-ascii?Q?Xbhcg6Ygnt2LvB6odISH7bhhVkGYiZCO37008ucp+6EFDaFgcfzkQxwxiWEo?=
 =?us-ascii?Q?NFXF5EyTRGDvnb9d0jfd3G0+szOHcB8DROMj/uDzSE72X0RSH2O8yDDcwSgs?=
 =?us-ascii?Q?wrp24kIblu2Zrers0i4Wcu9V5U09jBhl8PPR5bh/ZeLrEf3u+zmeYQDQZPLl?=
 =?us-ascii?Q?/8I2BOVVG7gIESwJW2eI/y5K7f3UTIF6djCpJVwjWf8/UTrZhh4gF0oHsSQD?=
 =?us-ascii?Q?Jly+j9Baobe9AE3DzSGqE6vLAg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9419a8cb-6771-4302-ab69-08d9f08083d0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 12:41:40.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR09MB4560
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 12:41:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161745

previously used mipsarchr6:append created an empty set for
EXTRA_OECONF and then appended --disable-assembly
while it should be just added to the existing var value.
Without this patch gmp will be configured without
--enable-cxx=3Ddetect for mipsarchr6 targets

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-support/gmp/gmp_6.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/g=
mp/gmp_6.2.1.bb
index e61582afdf..33f439eca9 100644
--- a/meta/recipes-support/gmp/gmp_6.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D "eae9326beb4158c386e39a356818031bd=
28f3124cf915f8c5b1dc4c7a3
 acpaths =3D ""
=20
 EXTRA_OECONF +=3D " --enable-cxx=3Ddetect"
-EXTRA_OECONF:mipsarchr6:append =3D " --disable-assembly"
+EXTRA_OECONF:append:mipsarchr6 =3D " --disable-assembly"
=20
 PACKAGES =3D+ "libgmpxx"
 FILES:libgmpxx =3D "${libdir}/libgmpxx${SOLIBS}"
--=20
2.25.1


