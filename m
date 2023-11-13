Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F1C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:58:09 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.49])
 by mx.groups.io with SMTP id smtpd.web10.37139.1699883879028211034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 05:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Mr1k6UL1;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.49, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jglALReb+bQe98Yvdf3kkgPpRGEbNikQz+Sc6ZiQlgrF61eMSkJDufZaOWyc3qJwdJjfHmdnByXovtsS/MILUa1MV0EA+P3LWlt4t23Ig9DYLvtUdfw+rIrVlxPc46G5z4NLr8EqsvdVSBqK5gpgIWl9dFNvrrBr54pHiyWtk9LWNVNHIk0vaf0iAlGRK5m6lIWoE19TNv2z3NJPbl1ze0jRnbuLDk2N0sUzoC9ycvDqklYb8BsEtawTBj5/ZGFgKPuLE+HngATmtv9z+vV90LmoSdDyPODhlovxhJ5d0ZuPretxyJE153me83tn8j8xIsXXSj1HdJ54X8peZp/m1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFAdQdFbn1YtPFJdCaBXjkO9R5Kbb9nBK+eCHRIyBDU=;
 b=BevHTrAQMmaQogHsidustnM/uTXrZonPucyCly0P60jEj6EO3uRbKAx/w6FoSwiKOHVyD0mw2dHiXXMHNVgpU7i+754ULHm1yb0B1tTLij6VYSj2vHArUU3SrPtSU1epPOHbmbg9oMY2LGe8oUIa2U4FqG+Yct1VEYXuEo4MGdtDohtp2ZKZ0aBcS1Sh6Zuem6Ogx+IUo9JcAW7pZxEbxfW1iObMpJVBgprXupCOSEPGX/4r22w7l+bIzv4nFOXEkCz0P07IteTLGa26Uhywo3hV09C096LEv6dTLC1elBQVC5c0cYfPBWV6iY6GSOee3N1sHOKvzQiRsQX28teoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFAdQdFbn1YtPFJdCaBXjkO9R5Kbb9nBK+eCHRIyBDU=;
 b=Mr1k6UL1Tiwki3+hn/+SMPn7GLXNeuxnknqz/bljWxVxWnnTxUAPGFU5qM1K+UylwU1xfay7QRuJmJ/vkwUGeOXlju3JxvVccu9ruw2XVGYx7yMQ4eWErjxe8MjMziav9cKt3O8ICByc91Wha8/yOs4+7uaH4SU6Y16YLljYiKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DU2PR08MB10040.eurprd08.prod.outlook.com (2603:10a6:10:49f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 13:57:55 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 13:57:55 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [OE-Core][PATCH 2/2] patch: extract patches with all-zero hash
Date: Mon, 13 Nov 2023 14:57:46 +0100
Message-ID: <20231113135746.1047416-3-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231113135746.1047416-1-lukas.funke-oss@weidmueller.com>
References: <20231113135746.1047416-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DU2PR08MB10040:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d9fbda-356b-44ce-1d9a-08dbe450891c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O+SbO96T6ok8kKVOZuFj2cJVEujFsERIQdF8UEePWlRGy0mtw0JUO++9zfrq9y5Vm3yHw+0FYy0QrSYsexazU04NNdrxWogDRBXXNRtI5FseZQ17jh7GjagfbhM2iKJphhxE/bP3HmjrN4OgsPMG8N32rbNT28OU+KLE75fNBK+vNCFhoZURY4ClVyObEearqpzu8jK3ma0kCrjtypHhXUuwYSNDwvAiU1BIXyvobxPeBhepHePmzJcVKgqUnHc2qgswPAo4fTJpdnYwikUTSnJHzjH22a72+HT1lmlHGaL9NxdQQ4U9/LfupAujgOgHH7stKM3R6EX4LXxUSfQusYrFOKE4tx3QrIwv8CDobcVT4SNF2V0mI64AUCoZBpT/TdcecJVUHcs4MKaNuFmXleOIGmx9N0PTv+KkUk4PF0tuTJrR50p0CLjtQvdFXeFLHOeC6uEKT4qhOUZN8nL9EDjIWsz3AgXE3JTVZMWvAXQXf7T8CqjnTIRgFzGQZ9DSBXU8DrHlqtuD/EZcEhueN3QKx3T4dp+gJ2koMF36NqFZlBTxxAPRKb3sDxCIAGzEKFwm8Dv3LK1M1z2E3D6Blz0qVVzykiwpXvYBHsanPhxA0hreHPcSMrfUixpG2O4m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39850400004)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(316002)(26005)(107886003)(1076003)(6506007)(52116002)(6666004)(2616005)(6512007)(9686003)(83380400001)(4326008)(8936002)(8676002)(5660300002)(4744005)(2906002)(41300700001)(6486002)(478600001)(6916009)(66476007)(66946007)(66556008)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dE59ZAsuino7hUfFkt9401Sb/6mwpr1jv9l7qBtP6ebmg/UweryNJoTSFt/A?=
 =?us-ascii?Q?FdjnZMYaT0wUAAZHF7b8z3HyuaXjKRfK3BKe8hRTW9wck534if1/hnQNDgUV?=
 =?us-ascii?Q?cAy29GQKOARYiwnRFIHrsEqFmB88+oCjSfCx6vdfV/S327Ilihhq9FSj07xU?=
 =?us-ascii?Q?EY+rNiud2nOrBh7euJo8ssD0Wcy3WGP9uy5BfFve8wKeKoJKiO1Gnpl3jtX/?=
 =?us-ascii?Q?44iqlYQijDUpQDSokN6iG3XLByA+ZeEXv1e5/FxmEPbuBd7kZs93AtN2ZG7K?=
 =?us-ascii?Q?sSMmA+wDwgZy7CwwlbFdiKAtRUCA18WTvjLJjg5kmjWeqz5IM/GQoN/G8H5M?=
 =?us-ascii?Q?klKs+6egpDLygUnoMSx+r0u6Mtd4TAcj7gZ5mnVzVvFBJCEr7j4+3nOgO8jF?=
 =?us-ascii?Q?djfjyq/p15K8n9AFcGx/I8AyZyk9aUie1C++mDKVVoLIblwPPtnrV9Zy/JUJ?=
 =?us-ascii?Q?ndHFUDN0yB38qEZXfr2kDKiJFHsU6vVXhRqpaMqexe0HRG/ugkbupaYL+vo3?=
 =?us-ascii?Q?KkaanDPoCq0Gz7csg5vpO0mjQW1eS80qmsub5OI9tMIwfnCJZSrujjKDXRCp?=
 =?us-ascii?Q?irRtdj1Ovw7iH7Qen83/zqMX+GvjKczjQwZ0DFuDqa4D7S35aFGIcaJ3PyUN?=
 =?us-ascii?Q?qBR4uHiatGfAlQtjTYSK1yOD94dCcLAGzYFtZ8oTl287nM3WqAc8NVmHRdKL?=
 =?us-ascii?Q?7WgQv02ruLseLKBxApRl7FAHPQyzwme92s1OQ7D8hMAOONCpWN26AD3/mgeN?=
 =?us-ascii?Q?/HRttZyWREa76qpFMZ3P73ikh6zyvvAD+9O7VybOZ41LZBYeyrSQ+JG5AFk7?=
 =?us-ascii?Q?7/OFFoVFkI8Y6J2kh78+xJ+rAbpSl+q1cyG/AoR/1Kl3Akm8VglLKVioW2J7?=
 =?us-ascii?Q?8YTG1WVISBuX4NeSPzd8dJ2EYcRl55CKRXbYMJIvO5i+bYFf36dk6IdpGQjG?=
 =?us-ascii?Q?FgxFcQvnGmf7GOD0RnMWyZZOQE7qw1M5DUvv0UsubqNX2j6RZkyDBk9d5pS0?=
 =?us-ascii?Q?OHUVawoBmTM0HRSmBfofNq0o07eqnnPQGXrgcJ05zUREF1fxvawMYdHQbB0a?=
 =?us-ascii?Q?Iyd0lG9MoF726sPIoLAh75wxn7+uZfP3TsuxPGrFWRIz8TgEY3lZRs3RO2pa?=
 =?us-ascii?Q?Wiyrff0n41xoBSZKwJ0HFcFuhLHcYiqm1A/GRn+LpQJ7ITOOo+NrAwTKnzcE?=
 =?us-ascii?Q?9emwZtQEwcQ8eGXJWru8wJ9C+qJER5uNWpyjo9EXWr7BBpIdAujKVZIcwhJE?=
 =?us-ascii?Q?SO9k48BFtpUrnpiEWzgq3wLTRH61AID1bU2LsrafSQxqhPKOWKu6dqLzO2e3?=
 =?us-ascii?Q?wSExbHgsdsXuLCj2uJBDgAey2/9s0ue3TS4mQHq23rZLU9N3v0VU1CAyS+EB?=
 =?us-ascii?Q?DZ7mgXF+FoK7Nw4MEiRaY9nZmKlJv9wiDjRqFOjHiq7NZAerJEv7qxybR2OY?=
 =?us-ascii?Q?MfaHlzMXG+MP0pC75HHK9Q9ex+xZbjFzkGE64fOY5q4ivr6MdHqaOsKoUUSI?=
 =?us-ascii?Q?ekPyWc7hw7qbZdO4TNC3Rgr+Jroet+W3moC8m0iaaQcbripSCmV2fbyxaY2A?=
 =?us-ascii?Q?lWRWQ5As5ydG+o1VjWOov8RsJ5neVQkRMKrlwKg1fNFx4kh8XVFOJ5V0hmQi?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d9fbda-356b-44ce-1d9a-08dbe450891c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:57:55.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO+73gSQ5sbg2xyQ2m6tt5L2J6sdyP6muU4oIPLKWeC9G9p4r/epp4yXrUYgDHL1G+K3JMWe1TdrfE8+RDj4eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 13:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190472

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Extract patches with all-zero hash in each patch header instead of the
hash of the commit to reduce changes during patch refresh.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 71cd193afb..cc4c8f4371 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -465,7 +465,7 @@ class GitApplyTree(PatchTree):
         tempdir =3D tempfile.mkdtemp(prefix=3D'oepatch')
         try:
             shellcmd =3D ["git", "format-patch", "--no-signature", "--no-n=
umbered",
-                        "--no-stat", startcommit, "-o", tempdir]
+                        "--no-stat", "--zero-commit", startcommit, "-o", t=
empdir]
             if paths:
                 shellcmd.append('--')
                 shellcmd.extend(paths)
--=20
2.30.2


