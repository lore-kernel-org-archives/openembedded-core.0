Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427E4C41513
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:09:51 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.134])
 by mx.groups.io with SMTP id smtpd.web11.170823.1692216588445881618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=dhnJMtOd;
 spf=pass (domain: ni.com, ip: 40.107.100.134, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwjiXOZrq/M2IhhgrdI71AEYCLO8N36ABkVm2UlQMwvxmVkdEKmsxksiAR7La417XTVWzY6C2AvB0Owdl/Jo7BSifhhSKk0wuICB2fbFmP4z7n2kYoCNfKUfwaksG9UkyxThDQugJwkeh/fefta5s8mw4jyI59tc8jFCbwWK5iOlO4M2x3E/IF/QjMBjefzt4Ai26f53jpl3q/h7QTqNIBEq6EAG93oXLEFQhF0D7M03pW3CLge4/wELDhTZAs1B5xtumjqrOLv2SA+XN/HrRcU9h/tQB423W93NqQRRkGImLW5JN5OU0TEUHesd/JjDc53HTzKtcasvZHemZ08UTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc2R/mowLPwddwqosdWZmOLOzGBmS78DFJHZo51HWss=;
 b=CB1ywTr9fLK9pW1MU3Yu9udXaLDfJV3YL3Ou0FxsiURMk1EtEovyq8EipNXXH/BQwEGJ17cIMmc/PD/D1afOGQ07NBAFgFSzncLZiA5RB/XfXADu1SwzcAsL6smrznkNfuL7Pf4PH5hWDvHlM77XN/64c647kqEe8NrqAI0iXrmjlpU2pPN0e6V82N063u/oqGLHeONJCCARjVlOIAwOKCIFVP+ZBHhjBgW/HGVkwINFCV+U1kgk1iyAQk//VIb9baVRsrWr2JBG8e9Wr+LmLoTztsmPubwBf27Y1cdrLdhx3KgklDx4yN7frdwHeBaz17qgc4J3xk/MTjXITN6N+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc2R/mowLPwddwqosdWZmOLOzGBmS78DFJHZo51HWss=;
 b=dhnJMtOdKJKB7UnLX23kkwZodr4atZyY4o7euMx5rtp8TRmBt8zSi3auTKnx0x/1Nl1Paoi0hYx69TlJ+NHds0+IpJ268veyNO1B4Gd6t1EOf8yHQBgf//WVan964aL+0mlXlkINiCCKa5vJtutva9eqbF2zy11gOOlHjDADEV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by MN2PR04MB6400.namprd04.prod.outlook.com (2603:10b6:208:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 20:09:46 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:09:46 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v2 1/7] bitbake.conf: Add new DEPLOY_DIR_FEED variables.
Date: Wed, 16 Aug 2023 15:08:31 -0500
Message-ID: <20230816200931.2577181-2-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816200931.2577181-1-charlie.johnston@ni.com>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::14) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|MN2PR04MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e48ae1d-f4c7-4e2e-5a02-08db9e94bcaf
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LcOhmZlUniAa4lHCwwdVOJDaBPZ15rJ+1K3nw14dwcTPk7FdhMlt0Ts4DmQOXq8GwICAxy3Rt85eLBKXDigeABbggb++B2tmxE7gxPWcyrKIhvYzD1ImZr9m6qnGof26CZr28NKRoQ6u40U4O+i5465En4EStKXq4Xv9MOGKqPbwYM+bUx0dAgkHHxUpTg5is9JHgtDXo1rrRjW6GDbU7CLTXUQl5RuGL/o4Y6gRVlsqrOqfqu7liAONgHSys/xrlbYkF1x48lrIMJv6Zdu01dNRIt9LUx+V5YdtRo66EjBWz0Ed3TSIBluJi0rJaQPksHF1bQ217wgMzM7HUNCfTqa2uLY0txn888kOaYm1NgXbhzh/Ir6rJNI76wrMuvkxl2DzsmL8vVhnjonVt87a5PTdOlZDipc7FU5hjX7x5aGBxVQzdPgLG5TCrzyfKM4KXrVHcjVLnPler8Zz9zGytT33NFsdcZhaUhkOWvbL61OthtuXz+CDa4f5j/o2Y2CWqSBoJ6obGXqPkW0dne6e4qBgBYAc3xypjK/dU2XheOa1FGXWiA12nWJW2YUlkcf/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y5Fm0/hNh+k2b1LXSyQV3EI5uNUJnhiVbSjl4lgPe7EE4G/J71py9SW6mksK?=
 =?us-ascii?Q?mkZ6QEhjO/lp1Ds+Mq2x9mVE9lCy6im67Ti+1BzNk9cXjg5mZetGVrVQfkFH?=
 =?us-ascii?Q?j2lYWZ/hFDWKFjjZUyDW/CCeZ3tFpTPmV0aZc81ePmy+yaU6pRNTBvcwFCbC?=
 =?us-ascii?Q?67hJE4sBUxUSuGbEypajcvx6at40mYlD6QE+sGILV62vTP4Simyi5KRL6q2E?=
 =?us-ascii?Q?OYN/QPeVcPf6zMzJ0qTyaA6qdJGUpQ/Ackb1/waRgV1tyeDKerZkHT4/N10X?=
 =?us-ascii?Q?nl/OB44U8QrEqw8TlIodM2VBdnZURliJytBAJCCrdFo3TztfmMn/3SyU7HBr?=
 =?us-ascii?Q?3bkwMxRU2sLU1PvNkaTjDrUjkiFsq1+Ia1sewNSMvpNL5UIexBioMz98FRDK?=
 =?us-ascii?Q?f0K0uPKB2lOYyJ8yfHTWwOiLcF5xH++elTC1VqWLnHhgSCeFXCGVZielIRAE?=
 =?us-ascii?Q?hC+bKznXhwT0z9sP2A5yNGUqBIGzJyNQXt4EfkiEWTYt2QeRoiGIcCwg3afU?=
 =?us-ascii?Q?jY9jDQjviplQIZNfjSqYhcFKAjb/FMYLJAk7v4tilKgQQ1X8K/+L1qWN7RW2?=
 =?us-ascii?Q?H8F0cMGHE059VdtiYtq2DeCbc3UVVoP+T+FXaEqP3AG5x1R/proql29r7Krt?=
 =?us-ascii?Q?1Zl+UGcatXWQOOm6FnV/htKb5eZ5L9xiH2BgmrAa1mdLUF5FzFDUq8431ZTl?=
 =?us-ascii?Q?fqP+/Ps5NPk41VZMAio7csRmlUNbazV6l/GtpYlOtNMJfPJl1J1Xt6DWGnHo?=
 =?us-ascii?Q?hjTeuHG/6AjCYBFR07oMXE1cqRLKOq2OJ8GUIRg7jWg3JPWz8N94Gposmh/Z?=
 =?us-ascii?Q?Mq1uPUDRCjXlyLcdsBJndiH+Eh6FirrzeC9wDhyBt49letTdRCSGq2YiR0sa?=
 =?us-ascii?Q?WSpgHHfnKKVu5tobLgblRKqw3wJwmcak3ChlXIg91hOXf9kdapax9GPBjjAI?=
 =?us-ascii?Q?6cVo4s4feAMG90xqJvuJjW2mBzJF8jkhv3yXjEIY3JfjXESyqd+YqFjnJjDH?=
 =?us-ascii?Q?DdqYAjNh+fM6sX9/fIkjm3TMQ05qbQ/40CNIw1lW5+PLevDGSgxIm1iz3yJW?=
 =?us-ascii?Q?BB4POY19S7obxlewQ2SLl8Dtk55alc2Skyu5nFVSoa1hrnRK8K7mpWGkQ+Aq?=
 =?us-ascii?Q?UhOREUszwoszGK+HGeqTddDpSPlUJPP5zWZkQ1iM8FUT4fbln6/A6yxWDOlL?=
 =?us-ascii?Q?PC5Xb2ck3+IMZnmdddFjTpV7vBNzSMcvbV1+tGlL3B3DUjXTIeWPZgdbMUyT?=
 =?us-ascii?Q?L00AP+MXN6Qp7BNEEHnrJP2AgYXOsNfVD//I3VYzmL9iEBqVfm7AhJTWFdQm?=
 =?us-ascii?Q?Cm29wP43rgxKIu7E8vcS8jaxGlvKDrqPsH86MTFcG1vF8CLT7ZR/s3Kr5LW1?=
 =?us-ascii?Q?Ro6ROVVDBZscSlFTuh5dGgFyei57dHI7jlDbkWle69W/6XIbcqFHEnAAPMD4?=
 =?us-ascii?Q?PyUuP8ebJuuG0Ih8NT8g1GIgwIKnoh277mr0sXcEB/6trFvhrrQhreMnAFvN?=
 =?us-ascii?Q?WfMl3yF0fi0AWja/Rtxp86vK07veC7tgTSj3RFxD+IaccC4/zt/MTyqLEg5m?=
 =?us-ascii?Q?6oPRlhVCa+LxB7RzUbuDDltLMe/2ZXzM8Gg51MWAs/sZoadaiQafbaIQ4fc4?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e48ae1d-f4c7-4e2e-5a02-08db9e94bcaf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:09:46.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3a5bRDt9PWrKWmvlxJ1j0gf8MUZwii8KCeyTAD+1IaQ8SutED5DUKKZejCsnJAUPeYiMByvFIkEuSxAfut+psw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186144

This change adds a new variable that defines where
feeds should be created when building a packagefeed.
A feed location for each package type is also added
to allow multiple package type feeds to be created
in parallel.

The location for feeds is ${DEPLOY_DIR}/feeds/ and
each package type will further drill down to
${DEPLOY_DIR_FEED}/<pkg_type>/${PN} where PN is the
name of the feed.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8daaaad615..381ca7f3e8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -450,6 +450,10 @@ DEPLOY_DIR_RPM =3D "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB =3D "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
+DEPLOY_DIR_FEED ?=3D "${DEPLOY_DIR}/feeds/"
+DEPLOY_DIR_FEED_IPK =3D "${DEPLOY_DIR_FEED}/ipk/${PN}"
+DEPLOY_DIR_FEED_RPM =3D "${DEPLOY_DIR_FEED}/rpm/${PN}"
+DEPLOY_DIR_FEED_DEB =3D "${DEPLOY_DIR_FEED}/deb/${PN}"
=20
 PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MACHINE}"
 PKGDATA_DIR_SDK =3D "${TMPDIR}/pkgdata/${SDK_SYS}"
--=20
2.41.0


