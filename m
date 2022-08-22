Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1194C32796
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 19:57:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.62])
 by mx.groups.io with SMTP id smtpd.web12.22874.1661198258720739023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 12:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=iuZ5GxEx;
 spf=pass (domain: outlook.com, ip: 40.92.73.62,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrtY5/qyqiJ8j6Z0xm8Qg9/K8KQQPr8C+XRaLl/L7m5jA4LqYVJqNitreA3TdOwZzSNPyKNPui8bs9cXZLSRasg89Dhh9HMqixlt7OZ7+ALTmG+keU958N6wI75ZmHimBWNUE23Wq+S+qyHCqv9K45kBHt9weyFV2Eq0SJ37ZV8b7oi1FmhcEXtY74+ezEJxOJnqRjxaHFY4RQwZPmGGxfHAe/3megBnJpxVnwiF5UseL1x2If6wQbruy0fP9vmnWztflJvS9y0hbTGdkPN9gDGbjXNRqZYJDh4ea4KjNCr5peIeOmFLhfJRJLp/rA5bN2vVSwXudbT1HaA8mPkOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phjWdfcL7MrK61rIPsTGcu99VsZDFomXs+IMQaIfoFA=;
 b=IDeAa/1ftS0KSBxr+qynPUUCQ0YvWc8AZHFrqmBDPrOGtJUtmTBXp2B57yHdlA+bkP/xGn7kiLNxqmAZbXMnZ5cSFFaMUjygQgWEGTax5KGACE4P+mXPYKXExLRhSMBb3qRPnW/UijKxrLYWXxmF/rEvxVccL8hBIsrOdByZJZgA8hwbM+nQlrFDdiIGAC/nKwmu2whn9aKgVlwRiU0KEDGisPZktui7tbzTOdy2RDnVeuB0RBMeyazcfcKAJ1m7iWP1pg3k9goHPLogReAgGr65JfEnE0iOElnEgTe/CzaY5SkJTDi0tLF8Ou62XMUEvoXYIcjGKvJpeln7eovnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phjWdfcL7MrK61rIPsTGcu99VsZDFomXs+IMQaIfoFA=;
 b=iuZ5GxExxPhrFwHptQuC3jip6pA+4na3BHNlN8Pm1TSTDjW9EgvvK+yo9R6+3linQn0E4naI0R1LwrrXcm4tfM/F2FcfsNXYaSQ+Z2X8OqvGJfjnxAMsQyhBdpQrEKbpoWSe7NZ6Hsrwo4FfoNNGBFTHMZUsNNJCnIwggDgDllxQIYVaeVibtyoM5eZYW4U81fARBPgDjoxmNBKrVaF6YJcSm5hm6FVqbTp5pwTr6aP9LRaNDewBMiuJxJFOWQ5gnv3axGCojduF8uVY97pdLlI10kd3m5Kn7Tu6WakAnPBw3kbF9xhnvRwh99XecRFr2AN50Xs+BLhpfta2q5OxcA==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by DU0PR09MB5522.eurprd09.prod.outlook.com (2603:10a6:10:342::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 19:57:36 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 19:57:36 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/2] python3_pep517: use plain python
Date: Mon, 22 Aug 2022 19:57:01 +0000
Message-ID: 
 <PR2PR09MB31007DB00CE22137DA1D756BA8719@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822195701.2206262-1-kweihmann@outlook.com>
References: <20220822195701.2206262-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [SePa/NJhgaybXoAfeLDFFPZF/4xap2TAsxKSi4uKur9VlHTtDnh4nw+xY04aG/7j]
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <20220822195701.2206262-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e16a942e-36ec-4159-5ac4-08da84788f1d
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyK82s5TQjGu+X2Du9y4SfosPqW++2ohPz+jSwiBGLu+cT/ZfUO8PeE8hIv15iWpkVXpgTsVWi+5YZWfT8rfz31udhhTxi26Yiqgscwo/Lo8v07VvKdsbAh45kjd8P1dZQk3DRoC8ium8YTCtHjuvZNz6wdYL21ZWBR30TAf0KYJmdtHDaJ38klQl09MKOoSsLsSnFkQiYVZCeXBLjqAABZg00DXYcXx8oLGYgaIpyMp3s927aE0IIsdNC/nmi4ea3t6VlOh6TAm3tJnZMXm+Ix4Yet5cwzsm9bJrkjEsEl8QipkxUV3bd9Ztf1dF+SZlUGVohzVMqqtVF0CGhApyllCYEDJ39GH3+t+Rfu+csRVcwa/e+IrAOc1BGiNZhpLj0hY0m9/DdEbtLH12hu9mZo6hyQz3H3NDwh3roRkN01T1AEQSf/2Vn8SjB9yror9j+XHG9mzcEjDn1JPl/CYOg7fTxvT4zYf4lsIgyHKGTUCveaVpQM7YYiv+uJEJi/+4aUEv5ZjA1jF49yQ5V+Bq7ibEsZLjtm5dZDOkyG3hTGCq+pXAaYZyXL5q7rVIzImNzYW1CGmv1hjo8m6qSiX/lz8N01sM1cqcHfHR+vZ3WIwoS8iRKMAKAv7nlftxAGHWd7rTVsL6E9dqwHxfAVUnb0zTYGg1NxZrQPrzw5MhqWxY+baB/WGfYssMa5DUfmh5SG3acTCYyjjQ+uDt16xRGgy0ZqcX0iAUcdvl8hRlVBBx9IUy/Jhr7Nqih+ZO2exFZw=
X-MS-TrafficTypeDiagnostic: DU0PR09MB5522:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G2bx5CgU1/hUKOf6eQLCISjKqDF+MEBd9r3LJm+14tNYpnNf2fscglerR67mH5NybtSYJJubkrBzjVYRnCeaOku9QFImP3Tsh6vpqdBZHpkyJaHLnvLtorDsq+hxzSIplyJLwwMeQ5SGPVfmpvpPoAtiTxkXxZvCisyPs8vnx77a6HA95PXXwscqSyaeIEKv7JqrljUOv+LgfIgCvxy1J1p4+JfO0hrNOVON7bjoMoNuDLb3moeNdaKBrRGuPT+9F89uFXdh2cO5EuAT5aKHcyUiubJB4P+L4vYooxeSiUVy31TQJIaMZ8ViLVWNW94jn3Mccdri/He+XdiDWYdfntJgggV3kxNq9Q7S8p0oYtRoGCli5MMPlZToJD1OtjqVTlnATnDmez6XMvScA2RXFmBfXn8fhyTkNINdUvEgvO0iWN0v9DP98ctP7pPlDXpuN8dXEz86YuNk2b3W0rvTKEDLaFDoUwhpQNfZnxx60J5JjX+wlol1ChimC+CXcWmFDyGSlPtLblUvLluXbX7ljwZLXLE/bgKfXvaqOt4S8Gr8HGf1OrL/4LZfbBusiCsM790pxHDfvbPiKZj38yxJkpmb3DrlTSWOXKoeof47ohIXSY4Jr/AjHsQKKvxYsjVfCh3Pu62KLrJDPrzhO04F2Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2OanRCvTloFfPvfbUbYhWq88wJShmdGbyIE85vbiduikqJM43C4/yuRl98Qf?=
 =?us-ascii?Q?fUbd9tBwY+aFsgSCGCDrY/7rNLprumdvFqSq163wUEbVKpyfX6r24yVHyrMH?=
 =?us-ascii?Q?X3JegFQCcd/wPZiGJFhlyOkdipeYunR0We4HZyaImrxlid0kR1gH7Ia9Cle+?=
 =?us-ascii?Q?9q9QwxA36pmjEfXuXRbCWRn+hWui0wOA/7+uaMS4MA5M0XS5BCgbULvWevXd?=
 =?us-ascii?Q?BxTAkuOAMMHiTaeJOkKvQ9x5V3zv5xcv9XKafFNT6yIWe3kqCg9+yaqS9ex5?=
 =?us-ascii?Q?1qjCFPYAMwoBTrY/fuYAcnZFzwW2h8eIVIiZ676NF4sXdzonPowB0rss6rQ6?=
 =?us-ascii?Q?nPRjiiOIGEel1mSwa0XUOXzkeTT5N2hRRBclblE9FkgDwPhRsw3OF9TN+T54?=
 =?us-ascii?Q?6TOcgNjDgJ7YMx7+i/d446kqTPDrL71gRYaELi5WR/tLYhyF7L/aD02Ig53U?=
 =?us-ascii?Q?734cMcnyX0wdp7reoSOpv1GHm1OlX0Lv4U2/gJFfm06ODgtWtI5aHzLcNZGE?=
 =?us-ascii?Q?AhlcINacGrAarZUXFt6ijPRL5BYBlmo8tSUxtB1RmWbA8F9PBk1xQPQaQx2b?=
 =?us-ascii?Q?gHYhfjDhK4cfRDFC0BjN2vq0J7fi7LLkmoXDRYRyHqX33FV5Ikvk6P9kxMbK?=
 =?us-ascii?Q?J4b3duqvmGRsGASQZpteHy8nBO7cXV3ID0ieujFSra41N+rBqXp9qXDzZtwO?=
 =?us-ascii?Q?HcU7r+gxrizFOZ9olHpZa3AgYeX0izyYppJ1m4zAeY5tu5kXUE/OAaIdDC8j?=
 =?us-ascii?Q?D9TMwlBNELJelZ95dO6PmKob6uV6rM25MmFDCqfxN1NDoLz2sm08eg8eguTH?=
 =?us-ascii?Q?ERf0ndcnyDfmEUjQL/VCxizw2ul+9xTZfWW+kVr8tn3RPYYhwaXZ+E3Gn1Wb?=
 =?us-ascii?Q?Z8KhhhldzCwYZkSbrsHQkRx4XQBuHIU9MeUvQTDCRR92VIGTHllV+GlgpylY?=
 =?us-ascii?Q?8RolOJUOohMQDM4DswH+yHoQyib79XqxIhGVqE9tQGo8WXfz6ETbNblKo6l6?=
 =?us-ascii?Q?4wLRk0qZ+MtjBAT9Kvjkp623XohIdI///L8inlf22jXq0qAifsOE/15CjR7D?=
 =?us-ascii?Q?39+gJPPcvqkI7bbOWlv50a45HnzvcAuUVxopVj/yJVtTdjTUK+1KXrD10b+S?=
 =?us-ascii?Q?EwFV+GHJMYhp7EbyWUT4E4a9ku+BDR6vCPoJ5W6EJPqoW3K+jrSULwY6rUXa?=
 =?us-ascii?Q?PmA2phUYUH8sa5DK55Q4/eoi1DEq9e7ggyPP0qBPTccskqwD43FshrUZqIS/?=
 =?us-ascii?Q?6c+0SEE8VqmLVdd3V3u1m7ejlk2XjdXVUPurYE78U66mM0cQqhXn4VgqraO8?=
 =?us-ascii?Q?TJImHKR631Ti62GSzJr0pBdztmTvZcabDarWJFPHJz5qCA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e16a942e-36ec-4159-5ac4-08da84788f1d
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 19:57:36.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR09MB5522
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 19:57:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169682

as nativepython3 is now a shell wrapper, prevent endless
recursion loops, by just calling python3 instead of nativepython3.
The interpreter setting will still have precedence over the plain
python binary called

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes-recipe/python_pep517.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-recip=
e/python_pep517.bbclass
index 202dde0bc3..9484d61dec 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -48,7 +48,7 @@ python_pep517_do_install () {
         bbfatal More than one wheel found in ${PEP517_WHEEL_PATH}, this sh=
ould not happen
     fi
=20
-    nativepython3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE} --interpr=
eter "${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --destdir=3D${D} ${PEP517=
_WHEEL_PATH}/*.whl
+    python3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE} --interpreter "=
${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --destdir=3D${D} ${PEP517_WHEEL=
_PATH}/*.whl
 }
=20
 # A manual do_install that just uses unzip for bootstrapping purposes. Cal=
lers should DEPEND on unzip-native.
--=20
2.34.1


