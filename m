Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4A6C71145
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:08:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.114])
 by mx.groups.io with SMTP id smtpd.web10.11824.1692886084308486955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 07:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=OAmai9ft;
 spf=pass (domain: prevas.dk, ip: 40.107.6.114, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBPoiblm6bGDxaUeD9zWiUOMUbEh1hYmHylji7Xrg1IbgtCjY/zSq4lW0mPlTvaZ3A9sy2Z0EWw+rAGuFQ4SimJjxjyEb4J3mux3aj0SM/Y9fXPyPleRxXYNz9kSSKPUB6kYE3s3Bqp/Bu7BEferVztVwyWTAQ/e112ggIG1TsVhPFdssY9KxYU0qXenN7F7PbQlrhb+HRG8CpGFGizR18aw2O6ot9AD3915AK0B1sSJdLix3kscDGjDk5GNoa0aQ9KFnc/735Z+F9lv50cnvk34ut3RWtcPsbm2/j+wezu6k3m08ksxSRLto+ivFVHXe5xpJloBL8heTGQCnx8QHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkOROkWsyXKtxuSkyuHBcQfzjRwGgaVYNh8a4oiRqRA=;
 b=mXf0WVqHb1zI1YhgI8WtxFmCoOzWSIuNrjDwnGzrjUgTcjh6ENosxe94anM3NiQDUwPmSJanXEJ0/4UQbKfUTyFf20phg60Hdh6LO4QV4uAjSwA74RWNnM5Ccw1aQM9vKJV5+07A1ppSZQf9c9SKx9sclLjZfFDw0I+qKpNaj7fsULJSf+EYYStk/4chfGYr3lilu20TC0acAWqEf8kSe564qj7XQa9D0ZmeGHU2k9fLZNCymFN30tQ4dRk/fINlxc9NFOZ+fz6oXboX+GIarlspyrZuvJA1gRPyCG5CYW/bnyiGXJNT8WgLrL0pqrM7nzFTBKeH69CJn8xCY4asRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkOROkWsyXKtxuSkyuHBcQfzjRwGgaVYNh8a4oiRqRA=;
 b=OAmai9ftV902Mx7QVNl0wYo4QCJ4LCbNC0+3BP61nyvujNhhDZjvBUpguj1D8aRYHQIPCFWZboBGcYtF4u/xj4ZzVYdtw3kznbuyut2EDXGJiNYoPf+iRd7A+SkT/DH3CDq/ig4m3h9LrtkF7vyw7Vpj+tWbVgnqT/ILPt1Roms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by AS1PR10MB5263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:08:02 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 14:08:02 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 2/3] lcms: add CVE_PRODUCT
Date: Thu, 24 Aug 2023 16:07:46 +0200
Message-ID: <20230824140747.45594-3-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824140747.45594-1-emkan@prevas.dk>
References: <20230824140747.45594-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::29) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|AS1PR10MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f225fc6-1941-4d46-7c2e-08dba4ab8766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ga3tHpkhU/8RLodH6s9jg/bQJfvDXT6syGRHp+hbnuI6iyKNQKScnySSMk9CS1uGsGFnv81TIXTXkQ9aA4+1ia13NPkzYBWcQ3p/CYgA/+kyyrOx4Ez5fZmYRaMqt0dUaiBSEpyPyPA4Djl9cRe5OT68uPtvHwpMhae3xxte8jWu2KM/04bpKnTne1wR4veUvCA7BNhwlGZUKaRRugxgZnide6YMctVkVrFlBX8vu0NXnzVm08+cJuOoAXkYOmxDe9XQz0RMP8Gvqdcv01N7TFi7HTtuNzWGs9cVj55rkLaKJ+WIYGt573HBweGT5rwtnQ+L2LstA8eTc+2JrTfOqS381Xm44WJpNK560dUIdKfRjmL1JGnNaLpKTt4DbhKeraFPFILKBGyMB70rhnOPJCjmfzHjRER2SF7jbjUemID0qEjgoI55/igTCfaqNQCCbFiYoJurWE+AgVB3QjvGvG3lw4GHPYX0R85lDSfzbCZdDDlmiph+86icyhBMAnrroqe30GZKLjmssinfO1/vsjF2kSXsqU2Ros7Ni3mrHfzSrbcMkZYRAT58WuGKNed3sULxKEvVd0daNVzsgp5DvlYDLKBcwPiGh+qLlb6RKyF0Zzi7uy38HtWJ7f4di31k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199024)(186009)(1800799009)(66946007)(66476007)(66556008)(6916009)(316002)(478600001)(38350700002)(26005)(6666004)(38100700002)(41300700001)(52116002)(6486002)(6512007)(2906002)(6506007)(8976002)(4326008)(8676002)(8936002)(1076003)(2616005)(107886003)(5660300002)(36756003)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?14FrVV9xCPQx/rEliwZAx6RmMRTO3jAG4lopuYDr0pHA4R/vPrET3aoQG/Fd?=
 =?us-ascii?Q?CnR4KLEW0lE2Dq4MRbT1YDQJu/K7Mqud7FPOhBejMlPfk9DNmVElcpvdq1kq?=
 =?us-ascii?Q?d/im4yUWHpgOB4EwkfQrCJXjLxyuJTGwIkeAIrByElOAT+gVqJ67pN232DQv?=
 =?us-ascii?Q?YDS4xBmTuCUjOrYA7RxXEo9d+8jaOt5BPRWuz/OeMSGaf4+vwAdH3Ll9P8IU?=
 =?us-ascii?Q?iJZwJfbLftcsoQBTvNPztxihfMcqbVEqUq3LbCmCVDq+bjzVzFDqfU2vlzmj?=
 =?us-ascii?Q?+juHvC0h4u5ERHzV1plpOtJIVSyUS13kymc5DZQyXJ1YwXndO4WCfKar9pLy?=
 =?us-ascii?Q?+7PBd3LKKE8xKzB6YkZWqBTIz57sR62R/0wbWAVRNA8WlqtDkKWe7+yMkJ+x?=
 =?us-ascii?Q?7shZHVlbYrwyO7uZL2i947TjIIH/B4aDebbuJZHcPzdxsV52WH3D4R8S0bV7?=
 =?us-ascii?Q?qREM7YlgOOyCALgDEBMv5F7trRoudnj1ubHHdM2azvQJVwd4frSJjKKQzl78?=
 =?us-ascii?Q?e5y2G7AE3Eu9KZPm67DqX8Yx1bqmzDMEk4i9Px3Eliuo6fk5c3cl3GPJ8AQj?=
 =?us-ascii?Q?2OH1Hff1+SXSJySKqC7nAnb2bpDmA+ZOcSrKUOABeP5n4TTjqjIzgxRtwde3?=
 =?us-ascii?Q?sziw4yJ0PAGY2UTlILzRP0rqGjQYlGeKXTZNVkekL5bIha9C+lqViIzvOPnJ?=
 =?us-ascii?Q?hCYOUCa6gwk0W6dMqs2U4/c/iBVh3kF52STBoCTNv64EpxHiD2g5iwcRA/mt?=
 =?us-ascii?Q?BDD8JS+SkcDNVo9eyb2+W0coh58XXZeH5V1Uq6lxmufCY8tCGQgyo3XZmvU/?=
 =?us-ascii?Q?w80EbJGrVOPZXnfvBXWd2DZcQU/s8wXh0bALNRJjxWkdQCCFeeL1gewYMnGx?=
 =?us-ascii?Q?Odex6k1nbwY54+6vbT4lKmSV0INko9CEuERxhtUOY4CbSEQZttTxyWvy0ZC6?=
 =?us-ascii?Q?R/okrllAPdfF8h8Cw1hS5L3/13UvT/SRwc2kq70V3KTo4h03b5iQolMEGibf?=
 =?us-ascii?Q?TLI8/AG90eBGzxJqvrqt6+0yFNRjJbeUNR+LWwNT5aoYq8A/ZByakxzJSBye?=
 =?us-ascii?Q?kVR+voS1zHVa5T240TgA5qunZNLzLgRo1MrzDfzup8EK5dJZYWLivIQfMlAt?=
 =?us-ascii?Q?jPpCsVBOdQhNi17wdkM/7n35YtijCvA/m8+9q7Bn4tseFp87c8jPu79lOOxT?=
 =?us-ascii?Q?lAzZJoxLaojliJaQ1RaNuDyucLQEBmgQ71noiE6nZDcsZw1ky8KcpRtV50vb?=
 =?us-ascii?Q?0y87zRfGdVsfFZp03IJNdlYM88eZXqGmeIejfCDNxBnNvJBbSqtD0b2h45g2?=
 =?us-ascii?Q?Z3xSZagla6SMxvsUykeMRqG/4m1ap3krAxhJQgHtTysZxf6is5HxZLsSwxLu?=
 =?us-ascii?Q?Mar/qJ46QWbPC16hO/28HwQjV59pGL8ULqSYBpkWygjGT2f28C9+wF6clZw6?=
 =?us-ascii?Q?7I3Au82+M9EHqQvTlj7Qf5C0JGuaBvq+ubJ4D7PpVjkHOy2f5tkVE4E2K12Z?=
 =?us-ascii?Q?pdilLebU3Ula6brOfjYU3Veb0+uvNpZjNHGFqCSIQZOqfW1QkHBr7AP7r0Hz?=
 =?us-ascii?Q?H/ZBCzxCohMYE3rPiCjFLsFSXCBQjeV9hJ/JhHFyKAWFWq++fkkp745huRV6?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f225fc6-1941-4d46-7c2e-08dba4ab8766
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:08:02.2788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+0r0nch0Wq8ze8IdnWIbfarTQo1mL8OE2lD3GKe03zyMG7BMcRKLCcHBd5Yx/otUolhQT/mUQtgm+Y6b3oCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 14:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186665

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta-oe/recipes-support/lcms/lcms_2.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.15.bb b/meta-oe/recipes-su=
pport/lcms/lcms_2.15.bb
index 3656e1cfd..6c5766a0e 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.15.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.15.bb
@@ -13,3 +13,5 @@ BBCLASSEXTEND =3D "native"
 S =3D "${WORKDIR}/lcms2-${PV}"
=20
 inherit autotools
+
+CVE_PRODUCT +=3D "littlecms:little_cms_color_engine"
--=20
2.41.0


