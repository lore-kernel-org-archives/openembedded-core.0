Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF48C001B0
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 09:59:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web11.35842.1688983162832059003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 02:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=HgXJnUDR;
 spf=pass (domain: welotec.com, ip: 40.107.22.49, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aj/yqX7qnhTHROpNM7V5gJnrAQBTzl4FyY8/Ot3v3Cdz7CFMg2e/Jn2zbM8/5zD2HRNkmyK8o4ZLlJH5spW041RmULxWbaJbVlrSca5I/7tVuSMu9efPuMjyn1yuVETX6yD6ALcJXFn3pNOKgHoe5XdQzp4Dx8uuY6gCTQyYN3T1ejrbL8TORyuub2q0kb/RyeCFcABMhH5afUWqSHWadfM1u3m6mkeYza7KGkao89TuJBONKAgREKh9lLC3AGybmu6QyYWtC6bxe05iX7wJ7VpmE4Lg9agTXzE22P6PfJPJAZQtoK3l8/9J28BP53oDOusPRCmiQhR1ljkS6D1UEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvaM0e9UPNLjZPEGzYzXs+oUmS2U4Fd//WNtuqUZwoE=;
 b=ng3CE7oZ+wkxNLH8Jp3yLAHFDfsu0nPTAMDg+Nl0ztjoORLvicyXGFb3PtbZDeWnjHRidsaHBWU3haSGm3p5u6DSxwGDmXcH/nTuQjg55W8HfKmTH5LDKxXQ3DgoFxrhWPVyID4/x7S+CcVuePuPnAtugOk+OVwqkZaAMoMxUmRnqQ0xvAFkik5d3TQaVR4BXHMSFauy7rwrzqVA+zyj5q4/vk8e+N7vjtulgzhs0UBr2PJ8gci290iFDHH4D2t3gP7/Tq9PToEMLMhHviTQv9ZntPU1IutJa1hJobBWV5uaS/njfr9JiyiZt4yVGoOKg2T+Ii4s+z/XYslqL/7Gmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvaM0e9UPNLjZPEGzYzXs+oUmS2U4Fd//WNtuqUZwoE=;
 b=HgXJnUDRz0JJjo3noxZU/W8HQR5fmB/TqsJJpTukUETJMPB0FwNPbOnC2sFK+kCNkEPC9ip0krTIq+7Eds1813CtlLZeR/lUB8KW7IUl6sWLLC3Uxwvnb/zo6BEmbbppz5hHk6LWvrZWO/3gVUGzW9vf6BWG7P1ww1YiLrAUg/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 09:59:18 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 09:59:18 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro native features support
Date: Mon, 10 Jul 2023 11:57:58 +0200
Message-ID: <20230710095800.2033309-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::15) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 2baec0a8-f3e6-4315-74f9-08db812c5381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b3C8gnahxDaHbzW2ecqXpxjrLeqNrBltBuxuEasI/nYU+UDJWDc0h7IgIZXuZUjy+iBOUgKWjbJ+U0bzI1V28UgxJY+somX5jPLQtBQIgBuUx9heFN/L8MoUNdQzFxVLixeMT6YzSKOU6H4/vmchFgRyJN1phtE+yZOmpgnWGBCqTAiBBewJ3MF5ZLscgXNal+pyiXsvwJb4HIoDwjA3tFc0mwT76lcQr/5syTktDgYjiatpee7OCtvsq3kSk+NtQGfGbxpe7QYtISi4OZ3xi6BQ0wLkGwb5k37NwkeRCapGavomnUYezDV1A74Uk9pE8mwb0L3VadACKkznWwFq0DRF5Qz8ZgEuWRh58wB+r9RDNfN1RdTbWl1ogY88SN9iLwDljYopSaJaIEQgw+XayNaES+acHFzdij38ZukRcNRPcdEuqkFX4MEwPBTRYn9NgJyYOSy55PpCEc/PMK6VDcRKG2JVbBO4rZdWdYAHazh6loTGc8BvX6VXTvZFz48na8gYdw+hmjvZrYLe0dgQmfSutQN4T7XEMsks9nF24qcDWNrDq/EYWqdGoxPXyjteJx52TEqDgbOdIRdOgKyY0GDKaTIRoJLnGo8Rtytd8nqpt4oBM5ToqoNjNbbKs5bD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39840400004)(451199021)(4744005)(41300700001)(2906002)(5660300002)(8936002)(8676002)(36756003)(478600001)(2616005)(26005)(6506007)(6512007)(186003)(1076003)(6666004)(6486002)(52116002)(86362001)(6916009)(4326008)(66476007)(66946007)(66556008)(38350700002)(107886003)(66574015)(83380400001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cgUl0AqVvi2zOaKyc9o4Tsg4s2+wN27YwkhuAwR7VTpXKOsq69uggNagDZMV?=
 =?us-ascii?Q?fWhmfJWvkCkSioMGgCpdtposIEXBFRo4juHV+f0f/DVTxSF6Su/84v7Mk2Zd?=
 =?us-ascii?Q?CxTutczDNhKPf9gYjQjwS5LtNkQ9BokknOoU9rQz4BAtTXpP7rfv7vmczP90?=
 =?us-ascii?Q?GvK/RKe/nLzVFz6SS6vkYhg/aPcjPt/yXhvMwbfT+nNFzKNVeLqofPRA/zo+?=
 =?us-ascii?Q?9ybEvv350V3X/0H0sP+Brd0tPdCmRcymmUm6rGVfwyGc/GV7sRLArstEfR8R?=
 =?us-ascii?Q?jP1KDb1uoVZibcJCEIWmOeGhsxH3g17UaIiGvEcrdayb0sfT6B99ogGdgFGZ?=
 =?us-ascii?Q?nfEBVS6iz7fpV2P/T8UGXd2bFyjHUCucyqfxzu7vLEh+49lZwlDqPZM1ScJW?=
 =?us-ascii?Q?WnNGjYwitBR6qlT5ovVTN80QX3O0+tZxQCrqiwc7J5oxnGz2oriOQ1dW6wmc?=
 =?us-ascii?Q?8SzmhShnk6P6Xe1PqxkFhwKMiSmw2/VjQqfC/eToTDYp4em3jhwz9FiYRQBZ?=
 =?us-ascii?Q?5EWPLdTJJYJbraE12sofikNs14cUUkQ/nH2UnK1hPkR1iBqcYBcOCibDeRGk?=
 =?us-ascii?Q?Un0sdgWE8WyOX1dWVDbt6I5OkPUApRljG46qXWVvtkI2lXrO9NOWqYZ8aZmI?=
 =?us-ascii?Q?gXDhQcwib08ROArtL6TbfkQCVJEP/FG/UVW8ntFT+bGTmAyk9+IGt6b6r9H0?=
 =?us-ascii?Q?bN1RuZ19Ik6gm6IH9siS40yU4mjouM+o0Qbor2VdKcYOtgEHFxybatJtJL/R?=
 =?us-ascii?Q?CRwzv/7+ZPlLg8K9II9EUrN64Wq/ofLqZLwiMBBdKL/i7j55xCNn4ZQDIwPp?=
 =?us-ascii?Q?HU13kTZ1i4w4DR+dibbNq2vXRQpU7m5yzdC6Ve9Kwq/kom1XExnyraVBAfwm?=
 =?us-ascii?Q?80hWHhYVkBT72mZ/dxp/Qf2ymZFW6ogTIjlvvaXK4J0jDLCDDdY8NiKcmA2y?=
 =?us-ascii?Q?oZWMj5ofBf0/5CXvjriMUWmwwGKGY/jRCyL+P8Hx0gDMfZQLBILY2UlA5+FH?=
 =?us-ascii?Q?M+ce/45NEXSVm+YvygjLCXA87tvEaqC3DhHtr5zHxISKvsWq1/xSbNHIYH+w?=
 =?us-ascii?Q?AnvHn/BfTZzX6nMrpCCQZBfIUY8lSh9DlDNJLkSm7zBKOsFHY4Mak02egDQT?=
 =?us-ascii?Q?P8DfH/KcuFrYAt3BRox5Vw+v/mOHlVSxgcQ+sX68OOhlOccTrvROU3ufY9XJ?=
 =?us-ascii?Q?jsgTm+5uZdx2ObHN4nHxLHyi+S/R3Y3hxtPZdQ08jqHejIXweV7hswFlYOY7?=
 =?us-ascii?Q?94YgOp/i9+aQQgz87ks0DS8KfLFpcT2DGn374hcxU+uZNz6J6W1YHnqfCLIR?=
 =?us-ascii?Q?joDIfVIPoA9k4iMlLwT64Z0vf9YxXa7LW2Yw6Y+Zy25MS1B/odWvs6FWS69B?=
 =?us-ascii?Q?wB8dPoIsdcQuRzCawN7Y52xF91jtNr+EDuUwC+4E4TNZ33ZZZ/MMBcUg2zAi?=
 =?us-ascii?Q?+4AuifGNTi7/C1XI0w/zbjLOLmZweESBKA20TlIlHsRJQMaCSIoonbqIHO4x?=
 =?us-ascii?Q?T7o/a1L+MZ0jz8CydJbvOnQnru7LcPSxrBNR084wP4BdwNO4IzE2R3EWXPLD?=
 =?us-ascii?Q?M0XZxv7JJYM08AfxmkwAfGFKSBry1sUSbNO8pNjY?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2baec0a8-f3e6-4315-74f9-08db812c5381
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 09:59:18.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRtzpreRc4JTcXl9HOpcAIiHNJisRxLMihFzYmZgzx6mZgTX1HgWtifsndQddIhOGWE1Uj4h7PehO+AMUTIUOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 09:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184063

Include support for ACLs and extended file attributes for native
builds, depending on which distro target features has been turned
on.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9625a6fef4..da01e9b66f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
=20
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 ${@bb.utils.filter('DISTRO_FEATURES'=
, 'acl xattr', d)}"
 DISTRO_FEATURES_NATIVESDK ?=3D "x11"
=20
 # Normally target distro features will not be applied to native builds:
--=20
2.34.1


