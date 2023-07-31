Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C07C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:31 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.138])
 by mx.groups.io with SMTP id smtpd.web11.5524.1690840409043058716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=fWC4GJAe;
 spf=pass (domain: ni.com, ip: 40.107.94.138, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFKMoeznCTRqCFT31N8EaPu97+i6yVXkrKyNrEEtbDTWTGSMiQQR9mifDnNRoEnGt0sxJpEZ1SHoG7IuM6ukgsoxHvd2TWnyMgMv6UkCi3zyyqHtDvxeQhfECi+RhuOXjICLGMKN5lN9nxM1qljMJiAzCkCCFf8yis7cFsWfzmx6OO4cHTsTYP9sH9r+1enO8mIWXT+83Zn4diseEEFb4uDR6PC9KEjhAjq/Q9g2vXuxlKRtuBCizUmlIkW6iDNJWChCR1jP6huH1V5XjHSfzzaJjr6njGTZRTkgNQnpgJEikAB6OjHhHf0Cf6eUNACY4I0djKNlfrVyr9+XWXWO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yTBAAHsLa74vvzF7gKULZsLYY233urnoHIrDnrVGTU=;
 b=i3fr0hdgbj8ZxZ7sB5aszPSv8JabqIJOsS1K6inqnIBpb2NhtcrEX0Rvz+2mXCiQ/ySL93yBvhSCznWdrRHZPsHHuJFblbStPIt2DM/8R/uWM9TpInbwEg6a3RgEZDIVTbf4wMvzr8PDYofDSfllgw1g4dvmehHxYMOOttmO6e7BH/btH+8b/R+SRqjeKJ4SNDgJJNAiO6N0cGV0O58RhGKf1wlgHRHX87A0CXFPoXMHfvATWeOKav92KxaslCHo08r480DkznPvIFS0CdOTk9xc935Z7SuqCfvLuSBLHnwo4Ni2smhy6KZLwZb96g2T8VtJ3/mXG/8XHa8j3hgOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yTBAAHsLa74vvzF7gKULZsLYY233urnoHIrDnrVGTU=;
 b=fWC4GJAeZBB+KYgXSHuWJnJkvwF3bit4jfl+sthgf7LjUSDxXmOcCcQzGBenGVLVCXzLDENzLW6XF63jX7IX797PulhhWeEdpk9vPTfol0U0Eynke/7o+kKYxvyuMPN4hX+xoiLL07KT8Dbpe6MbuMWRRI0pEK3yX+ThvTNw/8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB9010.namprd04.prod.outlook.com (2603:10b6:a03:561::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 21:53:26 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:53:26 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH v2 2/6] package_manager: Add feed support to generate_index_files.
Date: Mon, 31 Jul 2023 16:42:59 -0500
Message-ID: <20230731215310.3949441-3-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731215310.3949441-1-charlie.johnston@ni.com>
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:806:6e::13) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3e91dd-657d-47a1-3f2f-08db921090f8
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bxG9Fo0ElP4DDAxO50ldh4C6WCWr9VjtjG0fsaEqq1Zx7QxLp3yGjsCgX/7Oi4mTzLuCdEYGQWfv0X0PM8yiNyz3VSBCRZSXKG1Cx+CezQo3yd1NKKY1aUlhund61kXAaOdIx8uh9TBR+i/FDLEjzjzxGSFp3RzS4qWcGF8qhQAQdWS8gOCSnIYsQy42CLWxrb7iTQGqAa84ZuKFfVNXAdE39RnOEgEJjirjhkEIzj2qitGrx0hZ9Pi6apG43ebIjOw5HkwbIe1RYUNNPR8fiip+x5uARufUrhk3Lx/5TJnMuU4zZdeuSAtxc5flkJolDCMkVH86nt+nRoifhz3dsYCHxhhocScAhWcKdiD/Fw4KoYQSfCNZD25dSKeSmC8hJCzux/RfUCgPZhiEUtTDQIe+kkuYm714aRUTDourDs7aU9XztZ+nkC/XEaFi6KhbzAhsmtLNNzhXhgja5UjHJ98GRS9BITnZJqmwGz6nNIPWYSrC7JhFc0H1TXCjiBCwM0ldCh0bU9KLW6trC0XgloSiQ+Y0BE0AzPc/zHsAT6A0ons8MpedSI+lJn43I5w9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199021)(2616005)(6486002)(5660300002)(6512007)(478600001)(6666004)(66556008)(66946007)(4326008)(316002)(66476007)(8676002)(41300700001)(8936002)(38100700002)(186003)(83380400001)(1076003)(6506007)(6916009)(26005)(36756003)(86362001)(44832011)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3iXVQ9gATMfGIN0wurbiUJBF7v9+S5BHMbuEAregontYPduyBCjY8AU5cK8D?=
 =?us-ascii?Q?Cf+tuspmPJlsqbGz+RVPD2HDUi/EQqxVTh9Ta5RdePX1MJ6TxzWA7VzB1ozf?=
 =?us-ascii?Q?blad7ldGAFXu2KamvbCJMg+LLO5uCM1QBM/sFeUH0ptlW1b28rUoqaw24qK8?=
 =?us-ascii?Q?/76MwmPCVsV0HKdv8Owj1gkesC4Iop6tpXGUkjmiXrZv9Q96wP4xBfkx40pU?=
 =?us-ascii?Q?YIeUctZ9F99IRmIMauwK3YAJpcoB+iyCzLDEppCdkIOFvEu+w6btpTd8tI78?=
 =?us-ascii?Q?EWj5XHuwXF3rXyc6F7uZcbE/bK1khm70BcFGl92eISLmrrujhMSmgUb5MiJo?=
 =?us-ascii?Q?jM5UTTpKKQJqbU89Hk9IZsjzEPkIbmCWIu/FQhCk/c4U+sVq2xZ0+ESNwTAH?=
 =?us-ascii?Q?p75A1UrScGAzwUXQ9abLeq/Px+qAhljSXcKRHerO0EvlAmOMPvRlpjpFyjkV?=
 =?us-ascii?Q?mqfaKSBB4weVDlWtwkA9Q1MPoOUxHqJJRITi+rptgaK1g671fioPjcvGlTYB?=
 =?us-ascii?Q?bEBZiA/L3iNbD2kVHmKV1LGOnrwzq13JIb2d83oUjdLjH+Z4AkUTbi5zA+NQ?=
 =?us-ascii?Q?wMmYkSWE2BeJ2/TDtHA4uhNe13E15+5O9wcpXAmgxXyqdzuA0lVPVNErlmLF?=
 =?us-ascii?Q?1jDJ8Y10RsYWrwMtIDyOrfiXT4X8ASe7BE5Hb8Aatd0X9bdPVCs9aNVY1/Bp?=
 =?us-ascii?Q?kg0Lg4+qwBQaAMAoGDSMdBa+DbwJ3J/JN9K48g/TXq2xnmGKYFEqkJyFdw2Y?=
 =?us-ascii?Q?pu2y4aV7vEtf6vW2ZdFsiUEg5uiJ4tmV/LKRVNPIMZRPFKpzZo/iCglVyquX?=
 =?us-ascii?Q?D5tdssyMDmqacG8NI6T487E1iZstsCcMnC5gG9BNS2NSQmTJhfc5rB+39J06?=
 =?us-ascii?Q?9fj0slvBzi2J+SWcjlFAoqfn2wPz1aI27sRQXQLOG5vvUQFXpcruQ1y4DiIp?=
 =?us-ascii?Q?SZ2QWl4WRhP4WmsmMohigZL39a72QX7Klphppfol22f0B1zRitRKtlRxK7kR?=
 =?us-ascii?Q?OCOd18JH0+J86hG2gZ+h7c9i5XScdGkraRZHRPk6PzPSX1wzUNRRu9msKWca?=
 =?us-ascii?Q?2npTmHvwfv9lEtFWw7+MyWi4rSwl9tAVmqd+TRlYsqzx1HCc7DxWRG2LfIcU?=
 =?us-ascii?Q?dNn2cTOUG/AQsMC6tDqRBpcY+osrtIuIrphfcMOPdE1z9Si9oNp5GH3dsdH5?=
 =?us-ascii?Q?qeAoJsLX5JJ9WbuhoRwzY7LwSiE9NGmh+SG8JJKqzRTPjZDQlrBBJg9XkzFf?=
 =?us-ascii?Q?qfXlioZC47vQHMz0ePMl5QzVDh/wNJ5pQhgRiB3gr4IFusnkSmyCI81HPv4K?=
 =?us-ascii?Q?rh3iF1rFn6xxiyB6XX6WbVMuPkIQAzo5WGxELZ/pZZTEdroX4yqHYs+2qjoB?=
 =?us-ascii?Q?v8DVmccW7Fyzt2Mzw5xucbF5Qq3Ceb0xsgSsMZp5aaaoEWs/Q6C4MlXq9hbh?=
 =?us-ascii?Q?LuSTOgyKGGepyPi5WO7lOPZ49r5OFQibo24NarN2lSqqBbNGRQX4aRgZql4o?=
 =?us-ascii?Q?U5ZDgEs4DzNeFOAcDdFUhKA2XvTASQfz7k/XWx8FSL1XRcryAuWa90THvs/0?=
 =?us-ascii?Q?wDcexP4FZWk4EPS0+MUMGIZnmAZcysrBFZTlz3HrRseCqIQgE5dFud2zP9J8?=
 =?us-ascii?Q?qA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3e91dd-657d-47a1-3f2f-08db921090f8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:53:26.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9S2NOCbsfTshX7hxiWz+8TpD7Yr7JtCqj2BQABb+wenpBLq6uQ+rZcWgjRaAyHb6GPtD0Kg2BmsaTGq8GALBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185176

Currently, the generate_index_files function only handles
the creation of index files in the DEPLOY_DIR_<PKG_TYPE>
directories. This change adds an optional feedname input
that will instead point the index generation at a package
specific feed directory. If no feedname is specified,
the original behavior persists.

The directory for index creation will be
${DEPLOY_DIR_FEED_<PKG_TYPE>}/feedname.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 0c313190cf..0934cda89d 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -533,7 +533,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, task=
name, filterbydependencie
                         raise
=20
=20
-def generate_index_files(d):
+def generate_index_files(d, feedname =3D None):
     from oe.package_manager.rpm import RpmSubdirIndexer
     from oe.package_manager.ipk import OpkgIndexer
     from oe.package_manager.deb import DpkgIndexer
@@ -541,9 +541,9 @@ def generate_index_files(d):
     classes =3D d.getVar('PACKAGE_CLASSES').replace("package_", "").split(=
)
=20
     indexer_map =3D {
-        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
-        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
-        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
+        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM'), d.expand('${=
DEPLOY_DIR_FEED_RPM}/%s' % feedname)),
+        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK'), d.expand('${DEPLO=
Y_DIR_FEED_IPK}/%s' % feedname)),
+        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'), d.expand('${DEPLO=
Y_DIR_FEED_DEB}/%s' % feedname))
     }
=20
     result =3D None
@@ -552,8 +552,9 @@ def generate_index_files(d):
         if not pkg_class in indexer_map:
             continue
=20
-        if os.path.exists(indexer_map[pkg_class][1]):
-            result =3D indexer_map[pkg_class][0](d, indexer_map[pkg_class]=
[1]).write_index()
+        feedpath =3D indexer_map[pkg_class][1] if feedname is None else in=
dexer_map[pkg_class][2]
+        if os.path.exists(feedpath):
+            result =3D indexer_map[pkg_class][0](d, feedpath).write_index(=
)
=20
             if result is not None:
                 bb.fatal(result)
--=20
2.41.0


