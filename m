Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96F0EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:04:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web10.4463.1689188684363419691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=O8o3q1op;
 spf=pass (domain: welotec.com, ip: 40.107.21.76, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URDNGK1tL/aDjMIFoL/AoK+W7EETqDKIolfMTbKj7n3gMQ0Uqf3obzHHEa9suaAHahVigiJenfwR7bFzBl3V55YTX/domwH0/pE8tU7YIDBT89X43RGcC+ArVvBmmz4fzaGGBhkndiX4Lr0wvEtX5Knj7LMM20ymd0owCzld/kXMSzOTNYbKxsXWBplm7SSXJw+XEytxkCcKHW6QLe9xBEPQbqrOphLJrnn0dCJ6xZAWIj8X5gUpCTjShdFnRy0sXiDvBitleLFhh+JJixSjxRiyRKWpE2VUR5dsurDW8upr726CD8keHOooe19nfgYbHiMmNq6SCHCIes54utbSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2ZV6Y7oDIyu6JsDrEUq6/cNti1xzxCqlbDT3Z1eKls=;
 b=QzNhNH1OYl/ymbQSPVA/msDSbDe/Xt4siZJJPyB9cie0DV43keX+B6M9bZdPwuDSKwA37OfzrPo4N87TYQ7AZ/HbmlRoaWC2BdIZSE5X5BA7DgaLWo1YZ6ZnhUDmofirSMrOuDs93KaXUDNKCOIBChUAtQ7eMQuHRWiq+F4pB1Y1wm4CWMrD1T0p9cscmSr8+MzjNBVvFoavyv8mUDQHFzBRTxITkGRM7IhP963dhyHEEK74JkCEb9UikJUKlSeUlZGO9BDwTf6dHfaaq13A2QgMLtHvr81LlABaALpFyNPuN8H6Jj1dvaltdVTbHmsHV5WHiJjJYaLtWvDbOPltsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2ZV6Y7oDIyu6JsDrEUq6/cNti1xzxCqlbDT3Z1eKls=;
 b=O8o3q1opVjH1UJF2YF1ROCzqJccIK+H+l7N11mE1JbKXw9Nn9zANUYwB/ZSN0Ak6z/jih3p2cYWMQ8QJvFdJfxdug35JNm9IgEbfZVvrk4/FQfetWJwcfWsRifhs+P6qq6D5+RMFa/lKLwGXQbbBZdFJkafElDw23zDX53vUblM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 19:04:40 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 19:04:39 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro native features support
Date: Wed, 12 Jul 2023 21:04:24 +0200
Message-ID: <20230712190428.379909-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::16) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b6a27a-a153-4ac3-41f0-08db830ad73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qE2bmEbnNWLhan0DG54ZmF0roNekiiCnYWk+UgCHQiy//+DEyL0L+jsGY4nhMAAHjwcvQa2p58AOUtLmLq4ac19hVxecqrdyCvBfRAZPTumxg28PS20uFpQJB17zipoBivLTb7cvKf2Dy80ok8lYdn8+xhEK8AGMRpxpA3qXO5AGRrBl94PFIbIHoSvJftG8LvSk13+rKEGtf7S1+76nJwNfRENuPe4x/6AKC7dcSN0ohvuRjFztP814J0nv7cWOkfJ+sWOzH+6XTn7L/LYXuTr5Y8jecu10zD5bH0oCq7nIf/RUPgQMn25DR9KcolpWf8eA8mSLvxARSWjqKnNOKek/5xIuAuW3UYphC1ATtSr76FTQQemOf3ZpAuWpTKThx5kUY8aHSsdu8nYuUO5W8p4vOM3GCodrebYFRHAmzk6N8RvjuZMEnKkNNNgtWXd4F785hJOLXtEKQxM82Q3+U1GXfZevP6OGB4E9V7yKtqnlDwMK9MNTIVMQwejrVEzWXOSg41Cnh9zNgEg79tPy2sQ6l4Tr0VURCCeMUjMB5N7S89WbwVxZybSCrVzraV63N3SKW3Yqs4xhJ9C2i62tHn+3NkyEAtfHfYY4FN7Iti+UEjkeSePBEQRq7/0uRnyq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(451199021)(8936002)(8676002)(38100700002)(38350700002)(66574015)(2616005)(41300700001)(4744005)(2906002)(316002)(5660300002)(4326008)(66476007)(6916009)(66556008)(66946007)(6486002)(6666004)(6512007)(52116002)(83380400001)(36756003)(478600001)(6506007)(107886003)(1076003)(186003)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1RKbvIaeCouvkEWU9oEyJ+H6c3lUV/xKjCJbaU9ufUxc8Pmgpd+nYcxAHCh0?=
 =?us-ascii?Q?0BNP6500/4uctFZESmqysMge/1/eivay0+hfCexc2Fc3IDhGBOcgHtyZ7NaW?=
 =?us-ascii?Q?gA/jglxriuh5RZ3Kgbblc/5xKm5iiL9Vr+3zQfUNjEOPegcD7XVhrghca2qo?=
 =?us-ascii?Q?wo+0OKT1+69OC4ZUINjkm3icra79AS5rfM+ugXCGJ4PznP9jqjOW8cDVlx75?=
 =?us-ascii?Q?jFCfPwQavSWwv3wVIPBMTujYUFRpoK97Rs5u830jbgQfchA1uACcAjNeQdF9?=
 =?us-ascii?Q?YofNAGPfePxxSq5PUNNsYLlRaQPTXp9WFo+grmzrhWVPqkKSBuhcBb2SUr/Q?=
 =?us-ascii?Q?ZfRSKNaPthGN+EkJu2HCKUrLLGSw3by3nBXxbyPPJ2MQwwEYl2sP6vEOQuma?=
 =?us-ascii?Q?euIWjlznvoeiziL9MIPlgGrEgFU0xNva9dPdqtQd9C11/Xvy+kc61IlGA0Qe?=
 =?us-ascii?Q?AyCghK8E4OsGs+VCSdvV1iQWvFu2kz5OICpBEqexgx/V+e5jbpyzrcA0JKFR?=
 =?us-ascii?Q?A3y+9EHZ/xHFwUIFaAC11R05S8uHInOBvDT7L7zQsLoIlF98CmbMV1iAeOwt?=
 =?us-ascii?Q?J6iy0e/SKm8MkRYiAdt7P7L2WHSyDSAsZfUqj4AM2yknsjarWgTZKBUaygsn?=
 =?us-ascii?Q?wOvxyF89xdJd2TutkvCvNMePdUVyOu2mDIA8ITfXKZiWpqmO8JC1R12BFVBP?=
 =?us-ascii?Q?UOtR9gkXKKEnMjBTataZRwmbQX5BCIp77ZvVgFKYE3FoS1Uat11WYwao5Uo7?=
 =?us-ascii?Q?pKXjUJ2SWaDo3AM9/hUUQLLLoomYfOJOu2idj7sArgZQHTXHQHOhMcKiGpJv?=
 =?us-ascii?Q?Ly3sjwu+MpzJQQojqM91oV0BANgjaO01vycNt3V1Bzb25DU5c8UhvFkGTNxJ?=
 =?us-ascii?Q?nsUUnTN4el961o75iHZtYMP6hLNUOpkCAgPstSVWJwCGe9KT9MsR42wvfZOw?=
 =?us-ascii?Q?4qzFh5H2x7S5RONHAs3MmjpeSp/PKJDGnkiE5EOVGSuQsyBQWV4eIOC9BxE4?=
 =?us-ascii?Q?yHKtPvgmwxoWz4qBkeGFwAJ8TXvtp83MGAClsKVLlGirckZzYwfmUtKuw8JS?=
 =?us-ascii?Q?Yiy0rLePdc9yPdbneN12QoNwQGrwZbzp2u5YZGRaxekmsDKCE5kBv0IpfUlA?=
 =?us-ascii?Q?bvk1tPxLM90FnNT+fmVmR84b4t7Aukwdh7IPDImhUNE4+oE519zJmDMRHaAF?=
 =?us-ascii?Q?JUxNuvvD17bqlZNx5+GkmxECb0/5EnU1VC4z5YYnHlyWSXcoqQOSv4PZi7E2?=
 =?us-ascii?Q?0iy2pO8aMu3vxG5pny/HxS46ZcIkJtRuYLWMcR6k8oWbHoFunNJ2Knf9Cd/R?=
 =?us-ascii?Q?s3MhnDcZD6EH0jsL6pWUN+aZ6mm9VXOhTjJKevp8uznodu5+kRKWKBjLK8PI?=
 =?us-ascii?Q?fnrX80yra9OO9+FpI5FyjjuXVEKqExwXOfOg6I8u+mgNyEGeBUTl9w9nWayd?=
 =?us-ascii?Q?/YnwGDndVSFFIHeLIuqfuBipd19xhPzp+1EQot7xG7CliNCuGvqruD9+BnN4?=
 =?us-ascii?Q?c4QECAWUNyuYvOafHBQ7p2TQpLyl/4UPPsDf0Ym8YmrzedBPKaW6OHRSU+Og?=
 =?us-ascii?Q?kPpSuXlgqUJBXORsmEN13+hdRo2mJIMjhhI2KeyQ?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b6a27a-a153-4ac3-41f0-08db830ad73c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 19:04:38.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEayZVlyaWIuygDq/myzdFtAED8xuUfuwq6hB4avu4aYcO9sr5w6dZx00bfUd8VaeslpYQUiulk7GKSNIsXyTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184214

Include support for ACLs and extended file attributes for native
builds, by default.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9625a6fef4..8daaaad615 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
=20
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
 DISTRO_FEATURES_NATIVESDK ?=3D "x11"
=20
 # Normally target distro features will not be applied to native builds:
--=20
2.34.1


