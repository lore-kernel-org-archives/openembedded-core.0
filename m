Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A15FECE57B
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 08:32:52 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.92.49.74])
 by mx.groups.io with SMTP id smtpd.web11.48151.1725870769477434264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 01:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Nc6GKSfZ;
 spf=pass (domain: outlook.com, ip: 40.92.49.74, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wekW8VIEXMCoUcB3FkibDV5xs3ay2FikcgTtr4SzcoalXbL96IpUkbqZ64WJ8M5gWBbjwCvYfOxH2YnhWJ8WYzJo+WMWunI9UDvMsiBP7tEeL7/1iguVZEo3xxnFecbnEik6PQ7vAX3zq96sXoDpWa67XGzibU90i5bPyLVjwWzlYO9Dv5nNb7Pf6p9T/s2bh6Ywbscflt0JVUjJY3D1meCkEwO7l7OiNKQ8JxcmWT+tyaMnSAwZEBYxqFVY+YOL+Yk/eJiEMOdkt/bjjnbxNr9WyUScIwf5HU+QF8fwGGlyEjEyzeySBYBwkPoW0/JxWPRvUBhk74UO1MIEzAkVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToBLaCKiVVMohcKDAFA7N3kKTXaF1s6SS3UfBAKHdbE=;
 b=XL9vDYGalKLt9HXGdShTcMHu8CwGRapy/vO4dh3UJcd7c5WKAau4KseDvKn+XXJxW/F9SEFLRDdxV+AhAgo7RseZNcXn0e4GWEkrV9mfmUlv8N+I3M9qelulrCgaGy0Il3sl/dw15bo3n5hdsDaciBz6tn/w0XfppgaHDvcU+8Qy1opqXJTKa8xTvDIYWyxkBJSgSOleVLAE//7zTYud3jqHW/YoUgGfto+FDs9ZT45c01vjtQBxefLUhvelo9QuRAjnvBpfhClW9ezfP0sabZ9sRp+OHXgnsSoHUxP67u8J9WC6CNSeyR0C6suyv5bzzuGbb+Uh6VgnPF4wKqf11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToBLaCKiVVMohcKDAFA7N3kKTXaF1s6SS3UfBAKHdbE=;
 b=Nc6GKSfZDFoj3Lo+eWJaaHhH+p6UgnBMifwN+EwmtNhsk/8RLqmbylHiMzKlPTP0i/7Z4uVcpMfMJQUtrIYjwtGnkwaB4Vo5ExBIjT02fIS73UhPVqUdto5zzePB4pJPAh0I+Bc7xqk9P6cXckoOu6cSft3tHZcKr8SO78f7ReEJNoqklLuRQB2YOSaYQR2q850y0XpcyV83yGGPrpgFsEGfdUs7fi+rGHb+Gpa275Rc+5DhWilW/PSi/OIrQMfZIpDMUA86N14bWTCRjGv2hH9I+DBp6FGPWjia6PaCxov8BkECrs+EWzqYMkUpgubIcmS2Zwe7UNPyowTVo+oxVA==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by VI1PR07MB9996.eurprd07.prod.outlook.com (2603:10a6:800:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 08:32:44 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%5]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 08:32:44 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 3/3] runqemu: remove error parameter from acquire_taplock
Date: Mon,  9 Sep 2024 08:32:17 +0000
Message-ID: <GV1PR07MB9120D5A48A0D1AAEB78F9409A8992@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909083217.33315-1-kweihmann@outlook.com>
References: <20240909083217.33315-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [t43Y9KX2AlqviBgvPuA52/7UhjqEfYnjy41YCi3qp1zIQ2C8QQLDACxMd+RXF/DQ]
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240909083217.33315-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|VI1PR07MB9996:EE_
X-MS-Office365-Filtering-Correlation-Id: 6562a967-40f9-40b7-a3ed-08dcd0a9fa1d
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|15080799006|19110799003|8060799006|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	zL8POvgnuTnt5k0mk+WFo91Exs/8e7FQOxrpa8uaNEGyJYZwMBfatGhM9tzotAn0ZL1CJCAta9t45YM7vMZTIkFKax748IKJgKOe5C94hG/yzBOzobvpUU3cVIiUg3LSN5yll4Zx7sJeim48OWYrPLU/Esn6baaG6cCRp19PhJrzlpkbpa5Yb7jFyHeq484ZhNJ1zRfUp5nm0aV2nrY/FGHnkCk9tWGiwgbedbEBQGc7kb1Xd3DyOIScqsmFe9xK4dxvSPxq7HELlfASimMtMoSpkXRto0znLKAZfO/ugKxAYMUd0zjYaKIEM26ChFw7/oLT2OAgHqcMkzqc/4aITD5IClHLL//11hGXjB8mVaH2+Q3/zP8ln74YVisd7bcKci+TrIhCqrw8oz2ddMgXErSNgt9aoWOLYLMN0TJ0p8ZRda7gFgpVn4vrxiB5YkCoyf/zH8TNln0WVcfXeT2PiYv1e1AFADg+nsEjaCWK7XFtjAdehTGc0b7sLO751OjmZaa0Em2r+s+dQAewo3yDtU/FDcZInzSf/Ky0nTHvBRoqJFxdm7gMlqKE/l/6S521l+7zVWNjkDcCA9WEyz5AhWdaHBi879tsqnZ2tzDEI6B6bt/q3j22MmOceQ0HakdfUBMNuD3acGBpH+0f6qlvJBRl5OaG/XWqqPb4xIOX/td4hHfKVHOS6192xLyUsnrfMOU3g6SHJy4NLIrYiuzBhlI6OJPRj//ZhiGhVgx1U88=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ie/vS/Yf8NYjI/GMvjYMNQfNYYJ+a9LxAeY8Gv3vTdWpPx90vhhPvn/gxTt1?=
 =?us-ascii?Q?bgQbtuuW+SjLyi4YLZRBjXlGIDWNP7kinEP+YrmHUgkR5jevinfnQnkOqRzk?=
 =?us-ascii?Q?eBZDeR74yfY0BuQCjvT3AXnkb+B/nDWUlxJJ+smFzyKzVLTj/BYJu1JVl8If?=
 =?us-ascii?Q?m0FUSb5UkIkLAJp0SnLxJSdHOrWP3at/uSM7tQJKxNjJJ6x4q1yabs/IjQK+?=
 =?us-ascii?Q?9B2ycQgIVpe6whXqx3+89Bz/x1ZfYSWGW7ty1xSxtGAtLVunhLnhmzNXi8kH?=
 =?us-ascii?Q?+e3UHLA8QO7wWZcZv3f5sFXPNeRaYBIj/7s9NO0K3MxHP8CHZcRTHoKZMnAn?=
 =?us-ascii?Q?gCSxQyBvlcvJdQR83672aRsvmR64mHFZxHOC9Cjw9ZwE7+DCE/3Hi/U8gPpj?=
 =?us-ascii?Q?OmqFE/oxvsV5aP9LPSOdYmH70KTeE8FQnvHKKUCc6GjvBvgChoiq4fkK61VJ?=
 =?us-ascii?Q?NWEeCm8C05c48kKEwMxXjTZUHIZWFO7uE0lJoWe8p4gN/Dbt9ld6Y8giNUmZ?=
 =?us-ascii?Q?GslWPgrN/YWOiMENiudwBttHaLfxkb4czZPQQgR1XSggzf805eoAbX4bixuk?=
 =?us-ascii?Q?/krK6jczJU5rYXNcHI7xiSdxxYfj6uyr6Wb4C6Ud87xPa6W6m3RuGoX34fHs?=
 =?us-ascii?Q?4nwQQ6zMGcbzxpz37cHiztst0XxX62Kbc6Kb6a+niHh7veK4PbZVgmM1ArZN?=
 =?us-ascii?Q?d9RPl+FoHNnfiLDH+dpmvKQ0mJ20PlgR/wKdySWC+agiAV9Oz9fD9Jus4cr4?=
 =?us-ascii?Q?/BBaP+ldcr5ETQKeS5lY7NlZ1+tp29V9CNdigPTuNrlhSKGAyV4YZ55C0LD0?=
 =?us-ascii?Q?vtYPWlH4KeuZ7V7r5bKHlhefC2FVCSrqV6Od4Kb+66BLFzj7jv3qMOHq1HEf?=
 =?us-ascii?Q?SlCfNMKjUL1d3oYK2nIIFypq95RQaYu+i7tiY9UoORNXzoeYolpkGguSsLoj?=
 =?us-ascii?Q?agtYkgGrUCiGeKrEMN9RMRFI348ne/Qp0K09uLZEIZrer0rGoER9qeMnG7CI?=
 =?us-ascii?Q?Y9rnrg+IqN5mVR9/kqLWyBAnEnUplcx3o//5O790wkLQ8pQ15BG3C81Sn+fe?=
 =?us-ascii?Q?8pnL0JH1QmZ84hNJ5bQ/Ib2gzgTw/FH8QjSMhP9iZE1qmjMup2dNgbciUwO/?=
 =?us-ascii?Q?w6UvRxt6jij822ppm5VYj9XqGBlcB+15pe7APf9Z68eftZKgs0VsgLxoUjGo?=
 =?us-ascii?Q?wRc2wl430rseAuzH1hchBIx5fsf6K5O70JESFo6JiYepteqny8VjYIZvVem7?=
 =?us-ascii?Q?boMEKeGaENIYjFgghhcflGaGEvRGdHVvjhrWb0PlD/eIWCKnEAyXwAJetEPx?=
 =?us-ascii?Q?geU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6562a967-40f9-40b7-a3ed-08dcd0a9fa1d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 08:32:44.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 08:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204316

the error handling should be done on the return code by
the calling function, so creating an error within the function
does not make that much sense.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 scripts/runqemu | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 14eb939b3e..006e60410f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -226,17 +226,14 @@ class BaseConfig(object):
         self.guest_agent =3D False
         self.guest_agent_sockpath =3D '/tmp/qga.sock'
=20
-    def acquire_taplock(self, error=3DTrue):
+    def acquire_taplock(self):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
         try:
             self.taplock_descriptor =3D open(self.taplock, 'w')
             fcntl.flock(self.taplock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_=
NB)
         except Exception as e:
             msg =3D "Acquiring lockfile %s failed: %s" % (self.taplock, e)
-            if error:
-                logger.error(msg)
-            else:
-                logger.info(msg)
+            logger.info(msg)
             if self.taplock_descriptor:
                 self.taplock_descriptor.close()
                 self.taplock_descriptor =3D None
@@ -1179,7 +1176,7 @@ to your build configuration.
                 logger.info('Found %s.skip, skipping %s' % (lockfile, p))
                 continue
             self.taplock =3D lockfile + '.lock'
-            if self.acquire_taplock(error=3DFalse):
+            if self.acquire_taplock():
                 tap =3D p
                 logger.info("Using preconfigured tap device %s" % tap)
                 logger.info("If this is not intended, touch %s.skip to mak=
e runqemu skip %s." %(lockfile, tap))
--=20
2.34.1


