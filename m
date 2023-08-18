Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF31EE498D
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:40 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.137])
 by mx.groups.io with SMTP id smtpd.web11.930.1692380911643476540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=kQy+I621;
 spf=pass (domain: ni.com, ip: 40.107.101.137, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BG1e6qCRA5bH4bgmJbepoLhF0zGgUVA0Ffuihv30MOfS95c2IHbblKyncpwRI8ca+CnpADnf7eID2kHOOM5aX2N4jrvJCqkE2caG6Nv9lowZh2Ae/S8OfgeN8qvpfhIekifpdhHvVXDUc3vfojGyarvT/aZYO5OIgbSoIATIm3JuN+sRwxzkZIyZTZzy3qolaSd1Byh7q6SaTvKTpwSKBK+B7ZCse3rp7GVlH7Ilg9qvba7oxyW22tnC0tzd5kMXTAL0HsdM7le/lNIrNMLxJGO0GbuWzGPVzWG47t939BP6Xir7/1N+BmgFZ/FK/d8GTtKnaS1RzO8IFzRY5eYB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wekKM55XuJU3iPgPSLeIGmn+KBY4hFqoRpo/ysu/7Q=;
 b=VAuswuVFTgVi6ZEksj3uoIp3socIdw7wsh+yXbcDZNYthzPOk+zHWXYXjCtBBplInm/UbUqUCfgp9vmrxdiIdprPBzkKzxBR9dgK/AhHe7Rd+GgVj0vbRV2YNwzjVn9VbX32qm6WguIk99Fx6eiJCVU/E1tV0gwZaN6LCv8cQ8b1VKXhCYNOJqWH/hOKk9RpPDq3rXu2WYJxVq269/O+3ORkB6DLNAlFCmNGDqehAa/LNv5FETkpT0C/rcHU3qYO4ie8XtPvki+1CY0SXnHsVTm/zwu58exOWhmutw6nOz5HYmYoj7WgcD+G2oSuVrdTcVjYFMaEEnQAjSEslFdpeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wekKM55XuJU3iPgPSLeIGmn+KBY4hFqoRpo/ysu/7Q=;
 b=kQy+I621M6kx6bkMS+sJ30Sxh940JpdwsZ9Ulm191dDGCGso+TSqItiwAnysgurhXj2RP5aW/4fKjpDmishJINoVY3aIjUhrsUuEyO1sGiY1C9PoTL20BbTc6uArYBBT9xoofxJaUEdJbOqoVSZYSBojYc0n+fBx7J8y7BHA+Ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by CYYPR04MB8867.namprd04.prod.outlook.com (2603:10b6:930:bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 17:48:28 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:28 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 8/8] insane.bbclass: Drop qa check for maintainers of packagefeeds.
Date: Fri, 18 Aug 2023 12:44:57 -0500
Message-ID: <20230818174754.988128-9-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:806:24::26) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|CYYPR04MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec5ad69-c7e4-4971-2419-08dba0135413
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D1lWCf4iC+TJzL57PQ2V4eJ8J+2tOyL4S9VS+5ncW/VJIB537GJ93pMUFlBj5m0MP//Z0TD3UeVUTqn/TUJ4tOXAE0rILYn1BgOITMzA42NG0KpWyJPFwjdKLpBgyyUlryO020ZHQRGvA29FFMnI5bAviT3CiMGmHL2OUzTZSXjiq27PDsyj6Wqz6zLjBnK9nEGvGlMnxKUrPAK+eVdi/SxAqsYHy0T/lSHm5gpp3y/bKguAgXfX57yoeyGEvAF4Yd0EMeDxfs4m+uqHT0hb27JsxGmz+ETqePvgPcT9Uz2YYBKqoLyyPVNffHZSEYFUhqjqhzyKVLbUaYqev0b9gpoqsY+FsW7KcYEKVUwo+eagFNnWihhXxNqG+v5JJJb9VSuK/kOifjndyGzBZfZN8l9LLPNB9mu7qrczsiYaO7Y5SWpng4dbcI/nv1ZBGyefDn3N4I3eNAgOGe42PDmUYuPuSfY5f33DAeYWzwb70CCU1a16w4ISNLRa7vfA9U26XhOHKA+tf0AarlDOSOPs+4393WIjulegaH53P3n6QiIDiCBqNTRBv51Cs2qCUBox
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(186009)(451199024)(1800799009)(2616005)(83380400001)(6916009)(316002)(66556008)(66476007)(66946007)(2906002)(26005)(36756003)(44832011)(1076003)(6506007)(6512007)(6486002)(5660300002)(478600001)(4326008)(6666004)(38100700002)(86362001)(8936002)(8676002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Vay2qnrwaeEx4UVfhwqfyoywrlmqdJguMvQysZZrFFeJRtDknph3ODFNYZ5?=
 =?us-ascii?Q?FrysFHEmZiBz5kbUTQRrk9zhMYsOiHwbG5dt6QCC39w6qn+au/d5cQVKHNEA?=
 =?us-ascii?Q?uLdtkzNhIt7mHwUIOjwVFJvVR+S6gLHwji+6HTJP4/kQwLMYg84fy20zAGsp?=
 =?us-ascii?Q?TKj7lIxlo8TK6Sa5EpjHA3Ln26btYKsc+C1HHHrqCsE+/UeZ+ufZThAWJF9/?=
 =?us-ascii?Q?9ty5+29D/pxDkOEx7ex/CEDr8ZVskh+LQU1AxnRGdIyyQWociL/hOPgbcmY/?=
 =?us-ascii?Q?rcZRUrkdKfbpIyLGmeK9BtM6WwC1z3RjLIbmEDWQpN3g+z1yEVbRbZ6x+U0K?=
 =?us-ascii?Q?nd2T1GVKKVBRYC5Po6xoCjx7IX6XwpHH1JoxVa0Pz9O/yNonrTprUAhbhyGe?=
 =?us-ascii?Q?MqPUynmdvEErlUps9gPDmTzPeADVL4JWaC9zdONIu10Qo7arEeuxLGm8Q+b8?=
 =?us-ascii?Q?01uLE1Yj2mhsXNtWY/e2FYX6q/nsStZd9odxgmLsMkNAyTENoEVwVZ0xWRXh?=
 =?us-ascii?Q?l+Kq1exAGvOtk/qq/SP/hcLRsebikibvTKA5bbmfH3Si8WsDK+iq3I9zOrgC?=
 =?us-ascii?Q?4E6sJhuzXwYYW3oxPmInOGsxbbu9tJDzyAe/w2mB0o5vIs3pfoeLqouPcxpm?=
 =?us-ascii?Q?iGdIjY5jH1u8mB9zWDUQLAuP26Uaupyt3VgI0Xjv/4ThijFkR3HFME9NBdxi?=
 =?us-ascii?Q?u9MmsfIpEXJo8IaVZ1dD4P3J6poYJeaUQEwUx4iY54dF9fOCjkrfkwLWMiav?=
 =?us-ascii?Q?CjxCoUIDhMUT2SiwRBR10b0UuNORu9j1XEMxOmaGqvQluTNxZZXZmbKZM3Fw?=
 =?us-ascii?Q?GDjU+0ixHE319EAn7xG01Cx6/cMWHzVoMLTSdqXPFtL0cg2uuCtTX2TrpqSe?=
 =?us-ascii?Q?uD6A12kUN8ca+dS1LZycaUR6qruzC3A2A+SfJ23GQEsd8u2o+2CasPW5CbeY?=
 =?us-ascii?Q?p89HYwQEcNIuzOA2N2f0tZ9TitrAs6uffhtcq7gra9cR2GEI/9GpVZnqidTD?=
 =?us-ascii?Q?6oMoiYCVKV52vLSoWxRmeo6qltZ0dO153B59tlwceC0dOS85U7jnhVmgYa5o?=
 =?us-ascii?Q?vQZIoV1mIZqjIvpvB2UWPtGsx5NC8UHXgsDkoIKluskyM5Dim7tev7ast/nW?=
 =?us-ascii?Q?nQh6xZMOBx0Q+BnpcTPuTEmdkvY3n0bbubYgxmUnoyFdHnEfwEr2emyp+OJg?=
 =?us-ascii?Q?8LB8RXAAkvDh/I6YcU0dXe5nQLMsV375yV96IJNKgtw50/tsgNGlYAM89bpz?=
 =?us-ascii?Q?3uUmV7zrl9JA84xYt4DbfYL8+X1N8Y2yRGtQ8QmMKwnMscyYrMNEXtwIax+1?=
 =?us-ascii?Q?2NiqVu5TjG+WJIcSwW+rDCCRfquPbG/9kHwvYGPPBMRQMRe0OA42SHxl6fOD?=
 =?us-ascii?Q?HlQUViq+ODPkGR8Z3XHk84viF5dUv5D81hOb7sfkXFI3FBD4j4+AMHyNN42k?=
 =?us-ascii?Q?y53SN+P8miyBS9wIJkdrYkGgDwUyZqm+8L4O1jQAQlt2p1PJpcSQd+seXUOh?=
 =?us-ascii?Q?dE9ojN+9yVAKs2H0gDJk41IYsvgN9ZU5i6UOVanN4MAM9y1WcxmxgW9eSQih?=
 =?us-ascii?Q?TCPZ6VAHlPsO5kBcyQ8qw3lcfNuG0IVeH3Hxn6nePXmH6SLJV52m7npnjGfn?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec5ad69-c7e4-4971-2419-08dba0135413
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:28.4868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGCpduonXanxjnxzFOvnXo+BgBlkWxmLj+JhO7k79FjVysUNoDIgqIvX3mXNsLZM3Kni1NgH3DxE6PwByolwdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR04MB8867
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186390

The do_recipe_qa task checks if recipes have a maintainer
except for certain types of recipes such as packagegroups or
-native recipes. The new packagefeed recipe class is similar
to a packagegroup and should be treated the same.

This change adds packagefeed recipes to the recipe types that
don't require a maintainer.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 960dfc8924a..9ff4870afde 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1488,7 +1488,7 @@ python do_recipe_qa() {
     def test_missing_maintainer(d):
         fn =3D d.getVar("FILE")
         pn =3D d.getVar("PN")
-        if pn.endswith("-native") or pn.startswith("nativesdk-") or "packa=
gegroup-" in pn or "core-image-ptest-" in pn:
+        if pn.endswith("-native") or pn.startswith("nativesdk-") or "packa=
gegroup-" in pn or "packagefeed-" in pn or "core-image-ptest-" in pn:
             return
         if not d.getVar('RECIPE_MAINTAINER'):
             oe.qa.handle_error("missing-maintainer", "Recipe {} in {} does=
 not have an assigned maintainer. Please add an entry into meta/conf/distro=
/include/maintainers.inc.".format(pn, fn), d)
--=20
2.41.0


