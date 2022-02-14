Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D0FC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 18:13:08 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web10.37911.1644862385167473379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 10:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=ShTDkfha;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.43,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhdaxtKelfYN9k2rkuyIqLCGqqC83d2Ca8vOZjFdTCuAFx8zs2QjlR1AwK4zkzBwwJBvxmX3JpELznavkHzMp3fmtQx+hsfMnVxLgZ7VrA0gjQWJ9YYZAfDdWCBLPssKj2kpIlVxV0vLxXJMqXu0IeoqQJp2JnzcoK+ruhYpz0/ktNrChJVCit8oGrysbP2WhK8EKndi8iYpdMi+Fy833cV2zFxaXkrKMeZ+sGpDId7hGzIOgvCUEDJ3JA5Iv7qTzsY6LftaJWONCBhEh2nK91PqFggx8KViOsLdlaYJCjnW8yoWLZmpq2+DvbAOIGxipg9X9yfcdzYukzJR7wWLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwtRa/N7AW+KHmFJLYofEZjP+jm4Jfq2y7RRgeeN2XM=;
 b=dsEkVt3OsJwqqUoGLiNAJCscXPafZS08IjDBbxcqLYhzeibYdxeGo0g58gneMrZWqd0kD/GDbFG6DWyqtDrLRHT1I0GTm7G8LDG7Z2CADxHRkF3pHNBpNC9H9Cr3NtzesP86ssza9ZCMYWwL99c2553EGIw0z695GyrV4lCeCbhIz52KDluG7+qqtJMCgb6OC//2Jrc8gGrYwH50zj1O7/HnzxInder5qeEBw2q6znKunSNyVP/O3lio17v2R+UCjZ0o3dXJXxeljTH/iPhmOdpm9JJUP9enWUSWktJXcIZED55Xivd9g298bsFCv6bC1IabqoQHQYSUE6R63oicqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwtRa/N7AW+KHmFJLYofEZjP+jm4Jfq2y7RRgeeN2XM=;
 b=ShTDkfhaZSP0+b5ekTO2E0CuqFnRU2+PKV0AWzOVvc4kBcLj86DdSSFGL5QQR2OgRREDH2Je0rd0ZilOE2P2nl78Ms14q1Z/VeuopPjSYKCjXYQBBI9NqveF3Hro6xiLc61PK+aKp8omjNrJllmBLCMxyoudH2MLjx3tkJZUsT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR0802MB2181.eurprd08.prod.outlook.com (2603:10a6:4:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 18:13:00 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 18:13:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3 1/4] wic: partition: Support valueless keys in sourceparams
Date: Mon, 14 Feb 2022 19:12:34 +0100
Message-ID: 
 <20220214181237.10308-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0256.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffee85c7-214d-46ec-6874-08d9efe5a271
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2181:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2181D4FF8BD3577BD1B94818D7339@DB6PR0802MB2181.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zuo2k50IWTzTZOeyoxmtAKAaIkRXxJu84EsulPcZ49SNJg2tWOMTvLM603A1H9siDGj7xYCHvF9CCXoPQKanIAq7xze+M56Pl3HXG84YctIWxz908k/sYAwDhpWywAVld8+s/V32/rhyK7cHRlyJgJlN71JTR8yfCQzvqlgonnZWAq7O5792sxHeUCy90ym9uMkFyu8RH0r2u2pn3bOzm60Oh1qy6bYVyp6rtJ2JbM9PSmhgw/0BN8/QGN3kfO8xaDAT1fAaDsiro46sGfXiKN+U9DGsjPFlpmLHUAyfv+50z6bUtX+2v/Gp0gns1TNnUvjFZFQ9tJtveVLbeBvViTOy592D5pG94r+CTIBFI4nh2UEdopziKGBqHtvc/DLKlxrkF6rYyd2laWh2HidAfAi31kGzoNUls8HnYkt66KJn8KFkQPf1XrcCjSqF3B/P6enJYMZiQYA1ZVXa1OsWQqXBpiFBz0EazX4sXnppElu+NSGYgIX1m1Q83jDGWcb/fQlvgs9qn9XiRCGf0vpycYwsCv9EVxicGv/31zmUzaHrcGTuOe8hYsFjOuUnJgQB1IYt0QUBIs949Kul3PUpeVzGvAm2jx9KVIXDhp0ewAaM3Xdds8GQzQxvfLClvgU2kTBO13ncvUi4vR4kf3JWMlPwR+p7uKCdIe9OcbJvIfQp1s58mquknV8s5XFb/phZ9UBJxgX37ONHELfzd/tfTw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(8936002)(6506007)(4326008)(66946007)(107886003)(52116002)(66476007)(508600001)(6666004)(66556008)(6512007)(8676002)(6916009)(86362001)(316002)(2906002)(38100700002)(186003)(5660300002)(2616005)(83380400001)(26005)(1076003)(36756003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kdM+TpNfHW5FW3+dMCsaBUd/dAK5MaIWo4cb6whu71ug7YtpOwMEqIdR7Std?=
 =?us-ascii?Q?cmug95PO3EZfeytb2PaJikhJcELof/ZpKl0f64/PZeZRubkYPTxyMUWjZQyQ?=
 =?us-ascii?Q?QGav4lOF9bXZHEiHkPikC4wJZXU2LKYa4ExMDoPRTFFwX0TvZcOH0h4h+SRv?=
 =?us-ascii?Q?dsY5Yx4hNkSBq/BwUULieTsDgjcybiPC2gUVRccHL2ZJnLA8Trw1bdrNJinQ?=
 =?us-ascii?Q?REHcm0+MoqegRsbNaUL4QfQEpWVuq99tfE+6UiDdAxqY2iN6uLIr6grF9usL?=
 =?us-ascii?Q?foi4W8RhBlThxlZErNurkIUaYZ8DXp48QYYcMhoWsXO9PRmmI2hMQ79erX41?=
 =?us-ascii?Q?vh1tORgJKybtbZLCdry/v7pOKUy52GToFADi/EONAr9G36sLh1ljlbmOu5nP?=
 =?us-ascii?Q?0M3Z4MuSh1LWLngnwW0asBLCbDI3h0ClaSg1t1qNPMuAYVK6EqubEgLeySLh?=
 =?us-ascii?Q?1DaB/O3xSawi3NfIJ0mcXYkBYfOnC1QASV1CtuIYcILzO6fop18grvAbU2H3?=
 =?us-ascii?Q?VK+1gtR3gdTrdKCKQY0ItcS0vbUcmh7YAja2yRwC6r+XAEp9APFyzbdMuplm?=
 =?us-ascii?Q?UboX9qVYjdJ6D41+ynJf5CZnDTjrEyFajk3+OpL75H7Oi/tgVeAqTT7HzNpY?=
 =?us-ascii?Q?AbJeEPwyzqvezvGehF4St+r4p9uKvCrNnQUfkq4eoWU2XGhX1t1PXykKB+Kc?=
 =?us-ascii?Q?KckBB6TF0Zli531ebgI1mJ8nuhGhuCIJI9lsSvRieK/KCSoxV4ZxGgvCi/YL?=
 =?us-ascii?Q?qxYg3FxSJtu83N4IO2y++Jf6SkgxWKTKYwFTKyzBCRmwggGJftU1VTgUVD34?=
 =?us-ascii?Q?LkXkMEz/SJmOxrpturogkD0hyK8OQcOOon+v0M8+635SVoPDtrvbLH/1sQOc?=
 =?us-ascii?Q?ACP73O7U+eyZYRGXsYfkuTmqiZMkIM7/4xb8nZrIr5qURC6zszyyQW3XzbYN?=
 =?us-ascii?Q?Af+gGGmuS6SAzl+kTxBeC7ecAOqTzTzkViwVDY3dse2IZvi92N7aShOjvzyQ?=
 =?us-ascii?Q?GY/6sOjNbyWT63WRoXsB455RYQ8fe2RZ20NQFwV2JY57n8uHGJbk3WSBvNxv?=
 =?us-ascii?Q?EJdWaFOdI+LDOM5FGOiqy5PnKNF6su0gf3uBo+NevNrE1C2dsuUTr6AUMawV?=
 =?us-ascii?Q?9KzQdtbOBBZABbDuuECwD9QOBugAMCg6g9aq7sZdTcPTNXjwp+TTqi9B7X/L?=
 =?us-ascii?Q?v+YhQdTSmUEBEUcpYIQtj43OLrkWrlikN9nE9XSdMrdcQI6C/+/4ncSpVrus?=
 =?us-ascii?Q?QJKg+131Z5gILBOvapC2zneNETjWPUv2HTRUwwEvQiJZ0h7CRZqY/QHJiei/?=
 =?us-ascii?Q?oALIcT734svj6NfvjSJQAiWW3lvUgCeHTRcYWWrHOvF1q3mGED2LQlKyb1tk?=
 =?us-ascii?Q?y3N7+CTPNdVvgrKdizms6Oaf7BTD74Dw4vF1fCHV19PEiXsTmoLJTK0yVgBl?=
 =?us-ascii?Q?TpyzfPAnU/UbPGfEZwYL58FlJBtW9EJLJDioivo3NmAYyv6jZnecWmTyXqMj?=
 =?us-ascii?Q?YfUNw70NITzFCDnsY6AcUsKlKk2vyqvHpQdBUF6c2XZLjVs/sIGMBeUeQJMN?=
 =?us-ascii?Q?RO3CohooTHZNt0BMLyOvbMQAO6WfysVnsCkuXQ2kjeBKV305dPlpFMP9BmNW?=
 =?us-ascii?Q?+YQdEUVaRyvYA3g9RyNuUuo=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ffee85c7-214d-46ec-6874-08d9efe5a271
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 18:13:00.3869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2yCJtmRWdm2A7Z2KsSSEGEsgaE3LW75fADfW0WFSWF6o7CuJwC/VkSyyewGvicIacP6XR6Ky6SVggBCANDSJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 18:13:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161729

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Accept valueless keys in sourceparams without equals sign (=3D) to match
the comment and support Boolean entries.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index a25834048e..09e491dd49 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -171,7 +171,7 @@ class Partition():
             # Split sourceparams string of the form key1=3Dval1[,key2=3Dva=
l2,...]
             # into a dict.  Also accepts valueless keys i.e. without =3D
             splitted =3D self.sourceparams.split(',')
-            srcparams_dict =3D dict(par.split('=3D', 1) for par in splitte=
d if par)
+            srcparams_dict =3D dict((par.split('=3D', 1) + [None])[:2] for=
 par in splitted if par)
=20
         plugin =3D PluginMgr.get_plugins('source')[self.source]
         plugin.do_configure_partition(self, srcparams_dict, creator,
--=20
2.30.2


