Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B99C04A6A
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:22:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web10.7252.1690363361353950502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=QtBniToA;
 spf=pass (domain: welotec.com, ip: 40.107.104.78, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrmijCGS+19DRlzlUrMS5nxCxRWUXpEGaUjBDsbQ2JHl5fRab+mNITpyvYILtgtqPcPgsQvnBZGu7zPUQDelZXoJOdUouEpTostfhJ/j7fvwxuPtY+lDKDxXsOG/WzWoWI17V85ixHfksOGqldKxxtjWUGyyca6AxWqwZtGTi/QyYh/DzbsTShzjmPYWbBpmruR15CRIGyfC7ViB/PV67y9+b5TKYbIs2K9tSLM3vtxCEVHCCKxRC+3vz2N5+CCNqIXYM3kyggJykHLuZgk1l5fUv64xHOBR2suIwsWwn7o8Am4s5FLpiBsbKGdSc5LQRUR7XONpgW5JVVAcDmmZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=Nb3vajEClgwLEciOmH7OXm+zWPol1MQn4yNvHWuQMi9FJ917Qd8dC3pUow714keoeRolPVwc7PJ+LCmdGtlvCTEvF4uNeOmSzmhS3E6tM/eHM2FDdMGCq+sefa+rpfQspRAvc2xlm59yaZtQPBojHl1x4Dcppzwthe1YvBNwB8lKqJpSwPvsHMJ5wXLDe4/lHq2BPzYt+amhf9eMMAGI2Qq1raewEW3ybpQDNDlkFy1iz96izjSbTWn86drxPW9djlbbAx5JhAZBSP++IpaWjYYDoqdBr2yViOkt6+cQimd/YqtePXSzLfSSBXSJNBd7L66n2JH1I1sQc8w4WLVRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUnsX16xqBEglVdlb+4Bvsj7Dh5PIeCnYzvoRpMxQhg=;
 b=QtBniToA2ny9W1nNKJmCheePeqA4b0syZgDtsyS9sZeO/iTGGiNfGeN39qwj2GtyssgXYhS1dIHfdp58IhnaTgAHOLZJ/okSueHQd4S8kKYDCb4DKHIW4ujXC+bLsY7R1iGtDgOUN1rnQgl60TV4CG5VT1RG5cjmmmsQk9FwfLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:22:38 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:22:38 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v11][master-next 2/5] package.bbclass: add support for ACLs and xattr
Date: Wed, 26 Jul 2023 11:22:25 +0200
Message-ID: <20230726092228.1005306-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726092228.1005306-1-p.lobacz@welotec.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: d4dcb271-28c9-417e-1767-08db8db9da8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ddx6l1Xd7ARogXhfZG4L7T1P0BpwSgFRPMTttjLv3vKstbDURXooOxaxkevqjUL3PV1pljGykwZcTzaLwRs9zMYBBSgkTDvpSpslvvkSka01hfkfda6A5CNNUXdSvHv7T0hDaFq0C4LyjQp+X5rvEtZE+d596ntRtoEZ+FK2yjksYHuyBozlI2gZLl1fE8ptIR51vokZAddxXZUtDAdt64rSEhykqhEsIJ5SsArDhe3jCfJQ2R9DUoA4aDgHnxAqe/i5XpRDDzVlKf3eJU7/Ff/4GgCzCdFxfbfoumhGGEPu8MpzfLX1nlYrphU+g5quLtlDU+c4b9VE72W7WB5iXFueDU/0J1ii3+l5OQ3zbxA4utWJ07pz/JQQ7q7+0cVpNv13alPdqvsEwnPpLvop1pXijrqwODHt/ZbjjJTzPoVOrAmM2a/gKf5yk2/JVewF9wl4eNSUIptg25kXPPOzJjl05xMijgdzLKAMXS9sSyyYxMrZtXdngk/Rpn3/1dE3tYKbTqBxfzkZr1PToJEVnpsHTSB1A0gCDwzpBG1d0QG2wx/NzPdCiFtKVi+bxY+fjktX5wQN6gQz9yzU/9VWd9sVNZQLGx5MK5OwGr3X2J9LFZiLt4Q2mPEt6cMETQs/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(136003)(346002)(376002)(366004)(451199021)(316002)(41300700001)(66476007)(66946007)(66556008)(6916009)(5660300002)(8936002)(4326008)(8676002)(2906002)(478600001)(36756003)(6486002)(52116002)(6512007)(6666004)(86362001)(107886003)(6506007)(1076003)(26005)(186003)(66574015)(38350700002)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VBU/W7uc17GCvIIANb9kVqOh/vHBce1EP4Qmbq9Xyjh51bVXa7DqIbjSQMGh?=
 =?us-ascii?Q?UmBCaZChQEtz2WhLCz/wMREFkjVdWwCy/Tz8CquEkL+6E73BKw/7YlrRkgRF?=
 =?us-ascii?Q?RbH+OkZAbUPtUoareIaPkWgJQynMkyGyy1I1QdjKPt7iok22WkVc1N/CiIVZ?=
 =?us-ascii?Q?y44/zb6o+TtQvZk+WVICwdm2bWuCCFYCEXjv33cz5SsP6H7btyGNL4HumAMC?=
 =?us-ascii?Q?hRtmlREczfFnm8ikJcYhqHIRz6CbkHekpp/PQraiBeMJ9YCL8bab15vvO6Sj?=
 =?us-ascii?Q?YD0cHkQnZziv6/UvDSIU3gq9dvj/6dvM21d6CP8uLpL+SRS5AssikGolzAHP?=
 =?us-ascii?Q?yyjiFZUMvhYhTG2Xx2Hz64ADaLIUx3e5+d4mpOHpALy8opTIvtBd6yfu/Sjb?=
 =?us-ascii?Q?WgaFXD9EmYEdhL8abBB4p6jRUiieiEv2RDAPgU1AEYW+uLcqQsgALuf9JBHk?=
 =?us-ascii?Q?Hzloj3yDwsF4EEWz9E8xmMGEq82I4H2HfozM3EVWdVqNPMzvLkklN+vbJyD1?=
 =?us-ascii?Q?D5cPum81YhIeP7DHQhkr/st0p0WBxtQSh7gvURU2W/U8AQwOXNkvfqaLweKd?=
 =?us-ascii?Q?njNqEO3LL7zk6vVkuHA0HDhS0bm2dS8jHzLi1U2O0VfPLWskiBqrmFbngVPr?=
 =?us-ascii?Q?vVNGlhHWN4RDIxJSK6Xlrh0pujqa4ve5C9cIw7KjBR3hg6EXzSJ/fzSHSg2K?=
 =?us-ascii?Q?SWA30fpd+vCEjN1QHNxUjpbnV4qmZqFq28rUYjsyk/AtuW19Xp3fqKZm+7v9?=
 =?us-ascii?Q?WnpQWC0WTE3M9HQ1T8h7M9DtEloGfcLdH2khhMh8PSw1J/k4fsR5WR4J2wIe?=
 =?us-ascii?Q?Sc4/txxx+ca8nfYRgJQ8XlOSNmES+OYwWznMeuCBwuZIoUCZQxa3dzkBDj7d?=
 =?us-ascii?Q?GvV3hpSTUJ+hKAdjI+zT2fzRJLoNGnDIT7e+emDUC4RNToc0UanoWtdsPQZD?=
 =?us-ascii?Q?BRdpBn6L31KfjFpcju4/JPhfcbAsI5YTjy1/lEp4bvkE5JrIb95fQkAbBa7f?=
 =?us-ascii?Q?kf3ZYNn1480gap+AwFiIRTpZ6PIotcw1rzGp9Z2D0vJQnCtUyN13BDEsYu31?=
 =?us-ascii?Q?/jZqGweyYTlvJkMoIDxt3xdGMo754ZDcDwmFgMPsg9tbzPO9mr016dADlCDW?=
 =?us-ascii?Q?Zpb6SqC85XORDsevgeldhPPR7XpxAQW2CaWA+wF0eJ7K5NgCpE4NLgrcU9zz?=
 =?us-ascii?Q?MM/Cc+0jmydSW5Am0GzsXfHfsjSZi92V10fvCdNH4xET8kSR5y+g8ilXCKa/?=
 =?us-ascii?Q?rVRwCevZ23SWPgvckmX00HLsgHTfE3QgTlQsTg3EAjd910hd28hUFcKo7Ii7?=
 =?us-ascii?Q?npEM7D2Vmbq9gyLZig5m9VqofFpkccbb2gG1DHkvwuNRM6eOFmhxbUWhPHXL?=
 =?us-ascii?Q?9g/4WQnBQ2gzIjeoDTSFBS/fJcT9fbPqU+klmaKB8OB7EOOcxbVmMDCokpVI?=
 =?us-ascii?Q?a8QM0AyzHpWK/SvgpbKz2tWbPIGm/evanBp0ZknKqunykcPTynnSivKpWpSc?=
 =?us-ascii?Q?2iGYYTL+xFJ6FKer/PC3q+p7k3/5eGVHz7MvwL55bfMV6cGRm3ZbHD51JHS2?=
 =?us-ascii?Q?CcAqzMqAREH4FVX3oqItZm8E4G5prwIgYJOomkmC?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4dcb271-28c9-417e-1767-08db8db9da8f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:22:37.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJxxWYdGtip6/D+C8aYWlgLzcA0bnSUUMb895umpyz1bIPGQyCfnDYgc6QoW1N02kZHBB8a4rN8K/kGrfhUgaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184871

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index e8055a9cdc..6e5d0dd4dc 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-only=
 -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


