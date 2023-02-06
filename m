Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9893C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 21:36:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web11.67405.1675719404198777293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 13:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=aacvJvz6;
 spf=pass (domain: nxp.com, ip: 40.107.21.82, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muw5fD/QlVjJfjfcR7OzTQ7cUudJnuN6+5d/Vj4pTIWQndibd6XYtix4RFFzm+xYpaKDW2Rq2bJpvFwIKeKQ6tYZ97EtDbRZNcdmYMhoEuKraoIQ6nzkYk5ualuUCxvCdh2viI12fdllieD77XbRKSfwH7JtrIk6P92bqnbZGGit4PwXwA4BkTZubzGAWlE2xJ9OpIBJZvKR/C5+22zF4CVmEPs4OHc2HtqH1vy8xSORjHi7C+T1Pf7HckXc2hgjJOFZP5P7GScn5IZaxjDg6n/gAa3Mo2hN2tZGa+4g1PeQByLMjC6nyuWedxX2hulU7RdRbDu6+ys78H7f1rtmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kLzEkxtSOFVz9Ii1g7O2TvXGbS0oeipChqX4p3G6X0=;
 b=VySXabILwuXSChrnCwdpuytVTOjJPhpt0/ybxER7zNVH7aE8565RNZPXAHTTk9hhyFElgeeahQ0mm58lCyPPTcto7zlljljYWMPrg1MymziEj9Z9iHVdcfTjZ2/hsHTL1C9Yh2cqIVfTSFYTeTUR8ooNlVpUOsnBzh6Fy0/PC/rNJZAykpEhALJLRgN16NVUWPzUXv5PDWBxqPo/e6okOLUOiRVel7kSnSLm1wzqfLyp//zhooCROF7FdR+4cHC3u3zHGpQ8Dwj4OTV8R2wbOUaebDdEkWht/B8x8OC8rn82Xx5Jq4fQqicGoNRVvWW+zKen432KHDNSrZ79egPhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kLzEkxtSOFVz9Ii1g7O2TvXGbS0oeipChqX4p3G6X0=;
 b=aacvJvz62lwLNA04QGljVbJALrSm1Q1g8UyU/G8k9B5w4lFBkA6eYz4irKi5pkJzs/kiJgD2zmhk7QH3lffJfz//Vte0pNceiq2I+E3xB9moE62YBwyfA/1bfWpHNKxJFQUZ8AzMXoeJHDfvWuaphXJMR9d19qERE3mCfww8XMk=
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by PAXPR04MB8407.eurprd04.prod.outlook.com (2603:10a6:102:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 21:36:41 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 21:36:40 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main
 package for SDK
Thread-Topic: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main
 package for SDK
Thread-Index: AQHZOm9UebLQL2v8P0yMuc4Rp6LfSq7CasAAgAAAfYA=
Date: Mon, 6 Feb 2023 21:36:40 +0000
Message-ID: 
 <DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <20230206210911.2074894-1-tom.hochstein@nxp.com>
 <CA+chaQcNJc+k_SGvbzOAQPPHdf=6M3397qyiSV49v2eAiRf+ZQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcNJc+k_SGvbzOAQPPHdf=6M3397qyiSV49v2eAiRf+ZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0402MB3852:EE_|PAXPR04MB8407:EE_
x-ms-office365-filtering-correlation-id: ceb9e2b3-4747-45d4-f4e4-08db088a3c0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cfcfNn09lNlc2GW/FxLUD9kU6JJGNHyuELUiHdILv3g4FhUj4HDcCqfO2j6PaMl7bQKJ/5OfnyVKs95OZgqtldJ5g2cYL+JqgOoacDVqR1OEBKZpMEzKfHgBUWOiRKQo1ga02w4QteThjH+NzfPrXRnxs6tJp4RKV3LWbGKuFqzOBGoQDZp3nWxoR/BvjhEWu8pajcbXTntlkkyZvNBDywdOwrhGh8W+hoB5Vp36kzIGayjKkmd90Qh1CgujvK/cAZS02uCk+I7/MjW4mmGE44HUEnZWvyRSffJ7a8V5RWDduHy+WPPh68W2WB2k20t9Q9vufhXpaq/XSSa1y8+pDJSZT6wLPCIlK5YnZCuVhtGq1hseQKiCfXOO1vKjYXtiTr00kDRQX4tGitFiCo+iD2I+UyjVUf0Ueuox8ncwG5Wjw0DOWaSkF4bp887FyibHLBQCIHWm+t+CBXjkKN52GLXwOSOKYwnR6petTc2nrKotjLrhDpNfyYuVI9WhTB8wNiiEqmpdhBjubJtLz52wmxjCR6w+2IlR7Jh5OQxzH3/MoNrZ5i6vaWjjabr2W19IkZoPt0clm08U6dOtgWSCsc6bzSj2Ikxd7uYwU00ItHHf0eU/B3Yx8AH57nnTMhzoAW/iVd4wPYbtI4QvA2+bTdYQg2iW+D5K0zdUdxYIkM1QVdBqO0Bh0jHNuXI/94GQn7DRg285+KfqhRF6bCiJAYfEtAdIhdi7abI1vqoCzf0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199018)(38070700005)(33656002)(38100700002)(86362001)(55016003)(166002)(122000001)(41300700001)(316002)(71200400001)(966005)(478600001)(7696005)(66476007)(6506007)(44832011)(2906002)(64756008)(66556008)(6916009)(83380400001)(5660300002)(4326008)(52536014)(66946007)(8676002)(8936002)(66446008)(9686003)(26005)(186003)(76116006)(53546011)(55236004)(66899018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?z8Uz/ttlVQqRcxhK1Z9kmCkbGaTPT1pilBJLVDPRGFtOd3cidOrPGitgK6d2?=
 =?us-ascii?Q?EblifK0N8s2P/jYE1z6EPfNe81ZjolY3r1sAhws4GvFkjNElIk4xxL0fLvvZ?=
 =?us-ascii?Q?QeYHNdyuiOhoLQ+47sX/eYCSsDdfkWJS2U0ivCxlr0kNFgFLC60qORy6cagZ?=
 =?us-ascii?Q?Q6d5o/iDR0BUl8lgLJI41sodOanyVPmsDCwHWavsTuNIt1RPKs+Pv0uUEnFS?=
 =?us-ascii?Q?WDXBmZOYv9gbYBqWJL9A5n4ncnMNl71d8MuvM2LO43bHZN15mu6utct5cqA8?=
 =?us-ascii?Q?6D8UIkFhnqHBARJOUHr6wdOArcEWjhoTIraKWh0Ky8qLI2VtUvUxU1lUkfIO?=
 =?us-ascii?Q?b033GcsRDxuBcyMsjudn2n9vNdIbks1M2B/LiUmsbT/B6oXEoHrmM6ub/Ith?=
 =?us-ascii?Q?CSZbFKdo2Td85lexBeMeTvbWbEysr5/u2BWAYklxcOKwmZsJbCW0AHk9eeyE?=
 =?us-ascii?Q?VwXDqEUzfjVDyeVc8dH6PChRTCgvf9n2GjkwanDmORK6AgT4xjU4qCNg2Nme?=
 =?us-ascii?Q?Ns9l1rj9VysCaisRCNgLCdZSoNRoXodR4+UcIpXNWy/rhWpJt1+9kgQtnO/z?=
 =?us-ascii?Q?e/CICyXtJnhxvmUu79nh3/PAHAp3h/EM6HkpVHhyjlEPyYJP/hLUkEQbe1xs?=
 =?us-ascii?Q?k5k/6r/QbfGNdnrMErVKbMkWVms9hQYP6C2Y2agwD5ET+3rgAk913FtE32HG?=
 =?us-ascii?Q?CUqWew/egg9eXq4Uvl+8OCeaJtloV8bA/ZIoJ80KROLgGOsq/ERhmI5ZPWvt?=
 =?us-ascii?Q?HRg528EVpg27DEtTwqp+gbCkEseqelcd/n+StOitf5vZtMzviE1wzySzBwCv?=
 =?us-ascii?Q?XhLYWkd29L1ht3LGCXFeaKUme+6ADgUG6Gxw/qo1bgpEmgbcnBuzVl8wfieP?=
 =?us-ascii?Q?CD2sRKWTyGrakLTG4ERy3Ou6VbssPrJ02ljqi8xz931B9n4e5AkiyRhr+y1u?=
 =?us-ascii?Q?UsrnQnIEiYm2jG3LXwNxQrT1ypnKrAbM1jIvHHiQw38AHaik1qpQ6pIIFzXG?=
 =?us-ascii?Q?6Cc/j3vETgDl61fvUZ1jnLrRRCtUI4oAT8wH2bx6W59SE8w1U+4gZMFzbhgh?=
 =?us-ascii?Q?Q/o4QaslvbpPBAqO4hcfpqeUrvA1fETYt+lKX23Kf71VWqAlvMPspYFlIjEZ?=
 =?us-ascii?Q?StsvGH1lDuQ7ooENYh+Y02AvN24mDE1JkSqjZqDl3k4Uk8SH2RdgLglXT5Li?=
 =?us-ascii?Q?F1I+E4qUlIwEpjUJ8S61F67eX2aYff8n+zZFfi9vHtqj6/lSIlTi4LKLNZEs?=
 =?us-ascii?Q?gHU7+iXrX+/Y4ec8MUApusCYsEclDaMBkkfKDvwdkj4964faQlH3bp72/seG?=
 =?us-ascii?Q?fBtgqMGnhGDOby5ahltJZPBE8O/GwPSkcGehgALZYd/2fW100o3hbxW/IXjr?=
 =?us-ascii?Q?C3UnCV3hko/entNSEH9v4gEyf0lZm1wJv0uV7OOrYZH7VOdyTdlLPgYpKSlX?=
 =?us-ascii?Q?gUgL+qyD4LWfwS+I9FeDUTdqQumFVoknuYNVRpbq4NFdavpcxZm9YXOlbZUI?=
 =?us-ascii?Q?9xP53RD/W6Gw9saKMb5Q9wXOIpN+PqSCquJHHYNsBXjdrPogAr8xTp7oL3/T?=
 =?us-ascii?Q?rMETVaRZo5tTuSChBVVtUThdO5pBAGJpL+jLyIFM?=
Content-Type: multipart/alternative;
	boundary="_000_DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9DB3PR0402MB3852_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb9e2b3-4747-45d4-f4e4-08db088a3c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 21:36:40.8619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCC2mtjRnZoIZ55WWEpQ6VWD9dQ3kWC2iBBt8OV5BcGsMF0UqdNhWWEd/CM+u7bEtn05JwyKQ9CWRGy7WwSrGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 21:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176799

--_000_DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9DB3PR0402MB3852_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Oops, I don't often send for non OE-Core and I forgot there was a separate =
mailing list for that. I usually just cut and paste from here:

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Send=
ing_patches

Which makes it easy to overlook the mailing list requirement.

There are several examples in the repo that use this same pattern. Here's o=
ne:

https://github.com/openembedded/meta-openembedded/commit/7163946b56539725d5=
a5868a9318e56e713a4a95

It has the advantage of not installing the header in the image. Should the =
-dev solution be preferred?

Tom

From: Martin Jansa <martin.jansa@gmail.com>
Sent: Monday, February 6, 2023 3:13 PM
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main pac=
kage for SDK

Wrong ML and why do you want to install empty package? Add nlohmann-json-de=
v to imx-gpu-sdk recipe instead.

On Mon, Feb 6, 2023 at 10:09 PM Tom Hochstein <tom.hochstein@nxp.com<mailto=
:tom.hochstein@nxp.com>> wrote:
The header-only package cannot be included in the SDK without marking
the main package with ALLOW_EMPTY.

Fixes rootfs problem:
```
The following packages have unmet dependencies:
 imx-gpu-sdk : Depends: nlohmann-json but it is not installable
E: Unable to correct problems, you have held broken packages.
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com<mailto:tom.hochstein@nx=
p.com>>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb<https://eur=
01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_3.11.=
2.bb%2F&data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db=
0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012774729%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DvhZ3gJZfb%2FF4qX25hkN%2BQIA6jUK6jBFLg=
sIFAX6dQAQ%3D&reserved=3D0> | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb=
<https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohman=
n-json_3.11.2.bb%2F&data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb89259=
4f67b4df08db0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148=
012774729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DvhZ3gJZfb%2FF4qX25hkN%2BQ=
IA6jUK6jBFLgsIFAX6dQAQ%3D&reserved=3D0> b/meta-oe/recipes-devtools/nlohmann=
-json/nlohmann-json_3.11.2.bb<https://eur01.safelinks.protection.outlook.co=
m/?url=3Dhttp%3A%2F%2Fnlohmann-json_3.11.2.bb%2F&data=3D05%7C01%7Ctom.hochs=
tein%40nxp.com%7Ccd434fb892594f67b4df08db0886f900%7C686ea1d3bc2b4c6fa92cd99=
c5c301635%7C0%7C0%7C638113148012774729%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat=
a=3DvhZ3gJZfb%2FF4qX25hkN%2BQIA6jUK6jBFLgsIFAX6dQAQ%3D&reserved=3D0>
index 502262820..6cf27755e 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb<https:=
//eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_=
3.11.2.bb%2F&data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4d=
f08db0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6381131480127747=
29%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DvhZ3gJZfb%2FF4qX25hkN%2BQIA6jUK6=
jBFLgsIFAX6dQAQ%3D&reserved=3D0>
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb<https:=
//eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_=
3.11.2.bb%2F&data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4d=
f08db0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6381131480129309=
75%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DsvBLqUNpOl3rYXMGmHR6RfR9il6dkPxn=
xENyv6IUCME%3D&reserved=3D0>
@@ -18,7 +18,7 @@ inherit cmake
 EXTRA_OECMAKE +=3D "-DJSON_BuildTests=3DOFF"

 # nlohmann-json is a header only C++ library, so the main package will be =
empty.
-
+ALLOW_EMPTY:${PN} =3D "1"
 RDEPENDS:${PN}-dev =3D ""

 BBCLASSEXTEND =3D "native nativesdk"
--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#176797): https://lists.openembedded.org/g/openembedded-=
core/message/176797<https://eur01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F176=
797&data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db0886=
f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012930975%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DVYm639TrGNY7AIPC0l7x7pWHuq2b3DvNn6jvnSUYK=
4s%3D&reserved=3D0>
Mute This Topic: https://lists.openembedded.org/mt/96793459/3617156<https:/=
/eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.openembe=
dded.org%2Fmt%2F96793459%2F3617156&data=3D05%7C01%7Ctom.hochstein%40nxp.com=
%7Ccd434fb892594f67b4df08db0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%=
7C0%7C638113148012930975%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZlYEnu9Drz=
znQzzDnPlqCkwD8lV7xuB7jlB9Se7Hff8%3D&reserved=3D0>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.openem=
bedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C01%7Ctom.hochstein%4=
0nxp.com%7Ccd434fb892594f67b4df08db0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301=
635%7C0%7C0%7C638113148012930975%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D3w=
vdYu6JMTk6HvM%2FzyglYQwljY2Ftm2XACftS9egjxk%3D&reserved=3D0> [Martin.Jansa@=
gmail.com<mailto:Martin.Jansa@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--_000_DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9DB3PR0402MB3852_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Oops, I don&#8217;t often send for non OE-Core and I=
 forgot there was a separate mailing list for that. I usually just cut and =
paste from here:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://www.openembedded.org/wiki/How_to_s=
ubmit_a_patch_to_OpenEmbedded#Sending_patches">http://www.openembedded.org/=
wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_patches</a><o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Which makes it easy to overlook the mailing list req=
uirement.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There are several examples in the repo that use this=
 same pattern. Here&#8217;s one:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openembedded/meta-open=
embedded/commit/7163946b56539725d5a5868a9318e56e713a4a95">https://github.co=
m/openembedded/meta-openembedded/commit/7163946b56539725d5a5868a9318e56e713=
a4a95</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It has the advantage of not installing the header in=
 the image. Should the -dev solution be preferred?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Tom<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Martin Jansa &lt;martin.jansa@gmail.com=
&gt; <br>
<b>Sent:</b> Monday, February 6, 2023 3:13 PM<br>
<b>To:</b> Tom Hochstein &lt;tom.hochstein@nxp.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty m=
ain package for SDK<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Wrong ML and why do you want to install empty packag=
e? Add nlohmann-json-dev to imx-gpu-sdk recipe instead.<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Feb 6, 2023 at 10:09 PM Tom Hochstein &lt;<a=
 href=3D"mailto:tom.hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt; wrote:=
<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">The header-only packa=
ge cannot be included in the SDK without marking<br>
the main package with ALLOW_EMPTY.<br>
<br>
Fixes rootfs problem:<br>
```<br>
The following packages have unmet dependencies:<br>
&nbsp;imx-gpu-sdk : Depends: nlohmann-json but it is not installable<br>
E: Unable to correct problems, you have held broken packages.<br>
```<br>
<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com" t=
arget=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
---<br>
&nbsp;meta-oe/recipes-devtools/nlohmann-json/<a href=3D"https://eur01.safel=
inks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_3.11.2.bb%2F&=
amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db0886=
f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012774729%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DvhZ3gJZfb%2FF4qX25hkN%2BQIA6jUK6jBFLg=
sIFAX6dQAQ%3D&amp;reserved=3D0" target=3D"_blank">nlohmann-json_3.11.2.bb</=
a>
 | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"https://eur0=
1.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_3.11.2=
.bb%2F&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df0=
8db0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012774729=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DvhZ3gJZfb%2FF4qX25hkN%2BQIA6jU=
K6jBFLgsIFAX6dQAQ%3D&amp;reserved=3D0" target=3D"_blank">nlohmann-json_3.11=
.2.bb</a>
 b/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"https://eur01.safelink=
s.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_3.11.2.bb%2F&amp=
;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db0886f90=
0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012774729%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DvhZ3gJZfb%2FF4qX25hkN%2BQIA6jUK6jBFLgsIF=
AX6dQAQ%3D&amp;reserved=3D0" target=3D"_blank">nlohmann-json_3.11.2.bb</a><=
br>
index 502262820..6cf27755e 100644<br>
--- a/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"https://eur01.safel=
inks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_3.11.2.bb%2F&=
amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db0886=
f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012774729%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DvhZ3gJZfb%2FF4qX25hkN%2BQIA6jUK6jBFLg=
sIFAX6dQAQ%3D&amp;reserved=3D0" target=3D"_blank">nlohmann-json_3.11.2.bb</=
a><br>
+++ b/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"https://eur01.safel=
inks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnlohmann-json_3.11.2.bb%2F&=
amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db0886=
f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012930975%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DsvBLqUNpOl3rYXMGmHR6RfR9il6dkPxnxENyv=
6IUCME%3D&amp;reserved=3D0" target=3D"_blank">nlohmann-json_3.11.2.bb</a><b=
r>
@@ -18,7 +18,7 @@ inherit cmake<br>
&nbsp;EXTRA_OECMAKE +=3D &quot;-DJSON_BuildTests=3DOFF&quot;<br>
<br>
&nbsp;# nlohmann-json is a header only C++ library, so the main package wil=
l be empty.<br>
-<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&nbsp;RDEPENDS:${PN}-dev =3D &quot;&quot;<br>
<br>
&nbsp;BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176797): <a href=3D"https://eur01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-=
core%2Fmessage%2F176797&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd43=
4fb892594f67b4df08db0886f900%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6=
38113148012930975%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DVYm639TrGNY7A=
IPC0l7x7pWHuq2b3DvNn6jvnSUYK4s%3D&amp;reserved=3D0" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/176797</a><br>
Mute This Topic: <a href=3D"https://eur01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fmt%2F96793459%2F3617156&amp;d=
ata=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db0886f900%=
7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012930975%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3DZlYEnu9DrzznQzzDnPlqCkwD8lV7xuB7jlB9Se7Hff=
8%3D&amp;reserved=3D0" target=3D"_blank">
https://lists.openembedded.org/mt/96793459/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://eur01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp=
;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Ccd434fb892594f67b4df08db0886f90=
0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638113148012930975%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D3wvdYu6JMTk6HvM%2FzyglYQwljY2Ftm2XACftS9=
egjxk%3D&amp;reserved=3D0" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></p>
</blockquote>
</div>
</div>
</body>
</html>

--_000_DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9DB3PR0402MB3852_--

