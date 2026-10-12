Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67032CA9EDE
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13141.1791811218138366613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Qy0CNBnj;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPHrjSObEJRiIy3n7yiQbzVg/Kyl6Dj44JdUUYyj5Xc63kYJ0y+YN1Kl8uQ1UVRropBzWAxcf1RCTPGRKbT78vCaqsCseNfuX38u/hfZeseIz0/LwRwojY4rQ0B4NBeVPzVIBP9rrmxPzZAJLCSt9g2Afc8FUAgIphJ3/5e5BwcrAt1cL/nlKC38Hg97GrPTidfWeD9xjRW968FYS5gnW8m2A6JtzMeT1HxNL+2+FfISZm72Pt2BSWK9jRfvKd8Mv79TmRfTtieVccn/mDDI+RKqxODE/XYuPDOrk/to69YI0nX1/lhGxveVSn1nFHZSFp6nGeSyL3iYcJwiV5WXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot7VpKws9xzRVxajAmPgLxhCntJYdbuvtfZE8tdqPug=;
 b=jcPT2MRHhiZHHxFRTmVVExgv8fYHjEsOnQn4kcaD8uP7OC6VD2eODdBySN3JfR/x7xwa+0VVfV00Yj5srVRamFhnVjb3vVcLMtHcgiRYLqkgsvnyCpBoC4tveSEwtOviatstZcdgL21T7QiWealC+z1c9v1gR2Mk9rdD2Dpj4hUWti21ZLL2Zw5ji73Oh4Ip5awutiJrSxGQoZBeUauwxd0vLuypur1YLsjDRt1Ip8DYSywvKedQKl8zJf9gXchjUGmJya6btufBc8DhZOuUMW0gYTo7ekETvUQPBeUgqNOdBl+5sfG4h0MsYYBMpG0Egb+1+76mcCihNLXAO0b+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot7VpKws9xzRVxajAmPgLxhCntJYdbuvtfZE8tdqPug=;
 b=Qy0CNBnjFHPpxucbAXm7qmJfLwo/v73tzdHU9JFWRpnSRO8ms+B2xcoBEqXvgVcTdxMrQOXHrR4/SPMRMd2zJxekSjsFufHOTKNDDxBj+ZJiYK1hHuvXiahLQ34dYkO8ZY+5mBbv9yEZyeDodCJkOJSAwcVoM4tUjy/iIJgHQd2e/J0v/hTHwBSKZl37HTvnupnIrZrHYcVY2Wyu6neEYNZdcUHsME5P200Zut4nQf6af8vb+H9ut+FIc1COw7SH0A/lG0GNEiXeU2Jyo6ikM5iGg7jCZVcMbPNwM8GMztkuFEy2po5sbEUecJG7z3XuMdoME+8mhuJ9YH+izJIubg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:17 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/18] gstreamer1.0-python: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 15:19:52 +0200
Message-ID: <20261012132005.23909-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0030.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::35) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1e4fcc-e94b-4aad-040a-08df28638d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|260925022911599003|260925021911599003|260925021311599003|10067099003|261009223027099003|11063799006|6133799003|12006099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	J3ZadFLMDZ1IhwnXZdswk/g7Bnb8VPCqIAhCYdybyJkfHAUbpKKpd0HboO10lHwBaZtwolAH/OofEJPsCEebv8KWfbu3pZFF04RUw4Je74pXl4iI1o57/ENX650xP+8H7GBOXt14e5SgBYMp95ZCYTRYvLm1mqYwR1MEqJmjVr5eBro7k7pfSAPDWX0sDRI9d82NhxTb63bZM2wWCZCNAp6TxmvPQ+uk4X3PccVQ4yFZx1GXZ/deZjGsMmBvalt7bJD9hToeHqezZ1aGi95MTqwOsRQeW4tHTUNY9WyVMWmkBGFMCN4nZDHnfxj2pbVykIZ1/9oB90xgZJty3T8ECY/dXqJOQOy+zuNXjdCUmIsFVixvUcU/JP5fEHW49zr9RyWbiD02LcYTsjt7AwuZcDer0xVSkiiZfshsIwBCGEQ4bDkArsp7l7kgCm3m+YG9orWQeuUDHIfDHz32Puus98YaLfoEYKt6dyfbS/hM4V44+MaDUYFHqobSEvUu2Ald7LS/Y+5hiWMrdRc3ODNzOOlkJ5yurQsmME+ie5VGuXM+oZnpi5CDNCgGrqyo4PBSD5OVWr+0sMstxzFjpsTZwg5buTGDA+jIeRXFV2yp2o4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(261009223027099003)(11063799006)(6133799003)(12006099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0ZEgRfabjho3uhJ+cI34j9D1uw9vCzepQ1TqNjuJYDpsu6DRz0fv06m4CYxW?=
 =?us-ascii?Q?j2E0i4E8RfKB7PvI2E+JHVlrb/uwxtxWL6Nfyu5AKv8unZr3dX8AGJ5fCZan?=
 =?us-ascii?Q?D4b61+ms86vXJP/DIoCpTFN/13KPmm04Eqt8dx3Soz1YoLwmx025BqESOXRb?=
 =?us-ascii?Q?oc0dBjUkedtx0p+mZB+m5HGN957XeES7D+cxca+P9YhTogvDSV3V6MKthWa9?=
 =?us-ascii?Q?YwXZ0u+WBPNkk7o391UfEmj7RcUeRLVzyGspC66TcPuOMbegfvcQF+YuzttJ?=
 =?us-ascii?Q?tu93OUEsKwsOnn1+p320U8yknbofbSKGBha6CbVZx0EgFw3/EaMtfpQDfD87?=
 =?us-ascii?Q?wTdRnnr01HI4Q6M/X3twmh3EFKVndZrVA3CUGJgibFNpj9oEqU5x0mYD4Hhb?=
 =?us-ascii?Q?gYPeYWporQtpsqaKfxua4MJqvFMYL2R2gPOGVrliyBA5k30tmnji6gdVX1uD?=
 =?us-ascii?Q?iWmONKBTXLlNwjIpE6fGGIwmvf3/H/sAi5hw4Z6ebNi8NlcCUuKVyGyWSv3H?=
 =?us-ascii?Q?x+iXQdviZsllryph2spTXDDhA4cu9uaTuLRrgQtS+ed6cmoFIf15zpLnu1T7?=
 =?us-ascii?Q?R4JCJZXtOqyoDi6LS3/4tIFH0KTbo+lavN7kVU2CO2YnIbRiTMu630kcomoq?=
 =?us-ascii?Q?UhQGEHOxH6Z4GUP/67/ZxZC3Nlok7GLI1zUCL1UDXJKcqNDpcu14HOM3qJd3?=
 =?us-ascii?Q?W314aTqzAUdMlAIxo1BGW/zeZXlX+EcR0lnM8bbMdcIxSv4aWoo1DHrzCDJB?=
 =?us-ascii?Q?fQ0RFo/OyuYvK/P1mAo0MB20qK+EYJWjTtiGEdsCJUb/bRdI56OFYNj06TjX?=
 =?us-ascii?Q?e6ZLeiZPKEJdVnAysxoMqkWfkWdudokNDAr4JMM7lB63E26E8C5coG3Ev0Bl?=
 =?us-ascii?Q?Lb+bnh8/4WxJDEiiKAzQhGF6vRFt2JNmnVvfb3GSvGThp8UYUGA9WWluSM+S?=
 =?us-ascii?Q?1Zo2YE/IQ5dLPX08fqq6nOt+Iuhvc1OdfEa/GTElLPMiBUxMqZXqyWbXpfoU?=
 =?us-ascii?Q?RDpVpqxqp3z5zqomzZfgJ/dOpx+ZiDL2Yx1qaivKxIKwfqlnlsDnN+nGjKyu?=
 =?us-ascii?Q?Ovhq0n0U6lD+tROcUrvNkVoXwLPzYuO4DNDRSqpH6BCyXaHyqmarpeD8tFPI?=
 =?us-ascii?Q?94nXofBvwhw5XY3lFKSLWPD20pLg3MXbINJlceNkXryJku9DI2YVmrIRx81v?=
 =?us-ascii?Q?hEVNjl9UXg4Eft/8qasP6EYHIprirz2mkocbxoYS5xq09NBjcbLwCYi1MGqS?=
 =?us-ascii?Q?GqVpLh/1WJGy0AETBOyzW0x1tV2CrXCvYGnpssnmQo+2mrNFgZIGUq7BNW0U?=
 =?us-ascii?Q?5KWeTrJipEHBOZIUCKHn8RTiXMR3QpLk4lV0QO6sH83WAdySi9PFBNTZr9Tz?=
 =?us-ascii?Q?taEcOwJiI3PAlH18wcLPmvWb8D6qzvpcW8CrZ3EVdQhwfOQqJg2cB5H5DXrN?=
 =?us-ascii?Q?XL3KjF3ADa1DHzLQ+8GXb5BRvUFvq95YSKuSydtBeRbWLb2knrfLYL0vsn4z?=
 =?us-ascii?Q?0e46JAWxNsUIJQNV2sKS4uralhvjActYKMRhDSSFxy7kxxREjWWZk5Bp7xTG?=
 =?us-ascii?Q?CK2cp96NXcTDw2qvfTHq5ClJTGE1wT4yikfZt6FeMcL6EFQRCnLztgGbRuzj?=
 =?us-ascii?Q?0rsD1dpCfiNlRxG8aAjEK+uyRUFGOFs4o9qtW3kK296svbPCONddRqGwTYHt?=
 =?us-ascii?Q?FxoNc2bV2+2nO+N5nZAw6PbXMBpUxpI7NBPqg87EGRY96hm9YIsKvhYPMH1q?=
 =?us-ascii?Q?mBJ6Vvdsyg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1e4fcc-e94b-4aad-040a-08df28638d9f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:15.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVMAtsNdv4jcmLtBMC8959AtzM1jlAxq86Q3Kqfb8Lgz9amHnewZRYeprG2S4nJERx6zivXkOjmx3I42Erw+oQ5BgZBNHk+RGlOSAKk2TrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247649

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...reamer1.0-python_1.28.7.bb =3D> gstreamer1.0-python_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.7.bb =
=3D> gstreamer1.0-python_1.28.8.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.b=
b b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
index a33bc0f057..c7efa31ecf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
@@ -8,7 +8,7 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f74=
0"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "9c23c5dddfd2c9b94bb1b4e4f5b90ebc6400d84277c77cf91b=
1dbdb4a8b451f9"
+SRC_URI[sha256sum] =3D "6e0d8dd920234b9feeb86003d8f43c1996491f9d8190882329=
bf56f60a70206e"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstr=
eamer1.0-plugins-bad"
 RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobj=
ect"

