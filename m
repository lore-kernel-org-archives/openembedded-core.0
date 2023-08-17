Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEFCC2FC18
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:09 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.75])
 by mx.groups.io with SMTP id smtpd.web10.186317.1692276423793454116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=lEJpT7R9;
 spf=pass (domain: welotec.com, ip: 40.107.241.75, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7hKEVMQdjG3/IpJXQ9pzlXsl0l3Uya6L5S5ZxelmTY8FPCjLMcB4ZTb5a1HGqs5AkTeoz1GBE464jwmmMch5/DV8m9vKRoH2u4J8XbXyQyLYAxwlfh/ZRMnd8GURpeOT/jffN1njnucz/uMrj5GKtxu1U65DHQNZrWQ2A2QOtE1xQPEZIWGrB0EtI8OAGQdvrel6DeaJpX6X1dJg3jfQdhDF+Yn/9Lkk2YOYzmW03Cy8rPvCtRAtKjgkSe04ppP6e4PzHnegcgjOhr85yKPdAWQFjbyuUSHrE/atb5BzlZZotHUbAblpfjhdutSD6yIopGkFrzXAFtzJjwR3lg2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzVNT6fiqle27iQdgQgsJ0XXDOkwFLjCIc5Hn7fmknk=;
 b=XMb42B7jgZbh0MIpEHSq9TDtP7wiR3rwoHiuMzJ/JQ+GB8M7tNOSAoqg9zsLG/fbRC4J8hdZtE9BzlzRdyQ4qAnSeKekW5h3XXhmLmPxBaguO/jJ0gS/f64oN2+9uYcGCPNrNIK36IlET1iIWyu1DrbjWetmPBQhUPwXS7RWNaMr62ahpRG4mg3O1V2NejLYP2N5QynP4rmHHHZCEAjHdxTERAcjWegMFqy2Q6WCaJ/kwwV2dNfe+/glqvV68Yq28kVpgKkgTqLMkgiQ2BTUWk98IWgLMACzT1R65W70BgIfhR1eyJgQ4cLGpB07tD9DbCUeuUxbjJsZaSDqRBtYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzVNT6fiqle27iQdgQgsJ0XXDOkwFLjCIc5Hn7fmknk=;
 b=lEJpT7R9dGytFEFSU00pwETBs0sIFkt04h0xJPWLjZpuG7aKYKnCFMTgidtnW0wwZV7sLIdVmE4Bgpik4fNCtoBRtHL79PXyZs4ct50+smPFnVz7lrMF8yZcdQMPwNqwkrENQyEzAzXN4qTtRjSSOqiDouM3y5HjUxUyZgckU4nH+MO+e8NNENDIbJe0YPwnStxcJ4Y180BxUX0yGI64xm7Uc5S4nboNin3PI2a5Oqjt5oI/E415DMyQvPZAP7tGg7ZfhBBVDIeXLpxxyuXxD2JDmP3wwj9TqD6cRfpgs4ywjk9rsQua6OBL1of9I46SZ+mVXjhiuO2wiq+XycsSXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:46:59 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:46:59 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz=20via=20lists=2Eopenembedded=2Eorg?= <p.lobacz=welotec.com@lists.openembedded.org>,
	=?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 1/8] path.py: add support for ACLs and all additional attributes
Date: Thu, 17 Aug 2023 14:46:05 +0200
Message-ID: <20230817124612.1043464-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5e5743-6bbe-4d77-ab9a-08db9f200bfb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qDrmCSSKiNq3wqv0pybtFVgThm1PhqJ+pyKY3oqIBFz0wJZxQQXvxOZiOmLUk/HETaVBfAYYcDrN28NZaZMPEydNyn6KIfz15afi3dzZQPU09bEjg1rX69VqCZdkW9LFjHphVNy5YpzvgK8bC4eIroCXhWCZorveHFs2nu3VwfXg+lCEuUcVB5y72yIgTculsxymoKYxLzGoYngh5QrglV5tVQbn/7qLbR8u5y9vD5DwNA2XQCtYBGDO5bkOJ3aon+HpaXh8g1mtvuQa0RZ6zjgs8LRomL5edHT8Yi9M2VLq9QxdHy0AEkyqc2aSNbVb32doMwWd++8KtWvbj4pGFs+bWioD44stG5PIURQBXSH1eXU6rel8kpkpt+Spg7bMolam+sZj8wlRa+KCdpd7TClX//XAu+Jml5yHEZm3TEDXYq68zPR1JVLwYbWn85JvkBejtwE+JY6rKKoqu+mdyVubTLg63g4g2nzRit6010KfiI75hcdIoL30nYbF4PIVsNjnKTDkfkLYH/AcW8DFr0+ahSTmHG7oyjRR7QALoMwWzGhJlt/OgYkKt4el2jLAh07jJES/dEw7lhFTz5oPqKoqH7xDcYVviUwpf9Ykw//P71DZgf9SUAEj7A8M+XSb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39840400004)(376002)(1800799009)(186009)(451199024)(66574015)(83380400001)(2906002)(66946007)(478600001)(66556008)(66476007)(6666004)(6506007)(54906003)(6486002)(52116002)(6916009)(316002)(5660300002)(2616005)(26005)(1076003)(6512007)(4326008)(8936002)(8676002)(41300700001)(450100002)(36756003)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZPC4/LcN5ntqiRhgrPk8mG79MFBi2GDJlg4lRXtRqYVXlPnKbsfn1ElFo9rg?=
 =?us-ascii?Q?Mdo0QPYWG2MqTd+hCXL1QHTffvHzMr3iWbGyruiJAesB2LP0+SWtnP689jQy?=
 =?us-ascii?Q?ohWGk17mAwoCwkv/pT9d26t+53t0XodGHvGADTW3VC+5FqP9PU54YhOTSwXc?=
 =?us-ascii?Q?6XeD7ERyFtB/DDrlYGLSiulr3fAiv/r5ZXvlPvMfo2XR0YbArO2V75YK+Ejy?=
 =?us-ascii?Q?JmdssDmJ4wigTZuOHhe+dJcpjuLz5tl/9wzwq5KGOtu66HKcJBpvs+i+G9OH?=
 =?us-ascii?Q?zJS/K6xtLcapxSNL3PAxh4QyifG43v9uySxsgxdfph7VHydqgAtpwy7tVg6B?=
 =?us-ascii?Q?HxNKdxB2O4FLdeiuUXWuLlEMC2KMMCzB75LL4pnQ228qmOi862UdeLSwkPI2?=
 =?us-ascii?Q?arsLHZwEO+p34npX1YHesbal64dt9z9Ne0MtW0UY0l5OZVIZf5DfSdaLg4ae?=
 =?us-ascii?Q?wvTOuNoUJS9o9S31bmDJlECptFBFUWy616ouh00vntChgceftdfw9r0YvWHL?=
 =?us-ascii?Q?ru8W/1tcYv545h6m1+cbknVPaz115oUZg9YHvs310bHybUSQ/GP2BqJZsDX2?=
 =?us-ascii?Q?RK39LHazvugZfq7GboqcnNrSd7mvVicznaCPZj5JKqzDzEtT8bFvbmRvszgp?=
 =?us-ascii?Q?OUl4Ed+GvklASZ1i5fbZnV8FZPhjTnaNtwT4fjveHAikE8eM1yGEGk8xoOJV?=
 =?us-ascii?Q?YbV9N32aKEqnbE3HR2jhXaj22HmXZi+T6Ncoy8mCu6gTiBlhiQ44gfTWHx0y?=
 =?us-ascii?Q?JfolZy4oAlHSbHM9ZGOELAhfWnJGXSYRxaG/rY+7g5Co4Q6x7eGm5SmHTHro?=
 =?us-ascii?Q?+QFMftxJ3HrjtaRvke/9oqGn/oRJAVnPPlvbyHvcXzAQdo7qkMECrWKqmd6k?=
 =?us-ascii?Q?qml5W1MvIKhw2LwFxh537eWcrtSdQfbC9ONyG7ZprgNr1wnXMAUO9g0G2cUO?=
 =?us-ascii?Q?dJ7VIOcdIqlAiO5At/ecYbXFoAiesCrpiaCDhgwjDrpzqLxVwub10vug7ZUp?=
 =?us-ascii?Q?tlcPAmxlv24sLuXx5+D5hSzaET42mcGEM60fmx2L7GdxAdBbqdXVVdZ1x1Zm?=
 =?us-ascii?Q?ww0fajp2CY9ZwdbsU7PEi+UeMm4IRZkZT65GTQn6WE7PutXsto4fUJKecFWK?=
 =?us-ascii?Q?fma2wnZaHPrctMSnc4yEEII7Hf17wHdhMk1SoEZsWCsojhTIN4ZyITsdFKRb?=
 =?us-ascii?Q?17/Z+zOCOGKN790nidg1bb8+ruhEttaoigKoAiGq751ras+dOHdWerZVeRsq?=
 =?us-ascii?Q?FPkMolS6MVsntu/c9Do2QdDf2RQcF9dbqLXgLFBN0z83RrHp6b66apK4Y6c0?=
 =?us-ascii?Q?2NMF5xgppG8C5Q0waFRzSqswWxCdduawuCAmLDcI1UKFTZdZwainSONn+z0A?=
 =?us-ascii?Q?D3fvdo/oxGwhb7l8ea2u2ln/tQbW18WMjptSHH5shKnDwl2hlKdkBP8CXmVy?=
 =?us-ascii?Q?/WFNobxJo4gS8/N0SU8M0KQHiJPwfZmv9x1TuF26pUQh2LotKVcduwjjYbeD?=
 =?us-ascii?Q?Gp4g1ayqIpsjSMIeBFR4A/GzJKc1CTgIz0Ctg0crHMIH/MdepZYCTbswYnw3?=
 =?us-ascii?Q?5vF1Lu0nS4LzzlW85m0I87UUQxVseREuneFXhb3c?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5e5743-6bbe-4d77-ab9a-08db9f200bfb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:46:59.3518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFqTuwynyiw3b7NmtDoHJHHj8+PvXwQom8HYZGMh5VNV3+gKfEr9+f+5dhQD7HZ8X3DdGDB8XsjCLguuFkavlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186308

From: Piotr =C5=81obacz via lists.openembedded.org <p.lobacz=3Dwelotec.com@=
lists.openembedded.org>

Extend `tar` command inside copytree() and copyhardlinktree() functions,
with additional parameters, in order to support ACLs and xattr. The posix
format doesn't need to be set in here, as GNU tar switches to it whenewer
is uses --acls and/or --xattrs parameters.

Additionaly change preservation of additional attributes for `cp` command
to all (meaning mode, ownership, timestamps etc.) not only xattrs, which
were previously.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/path.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0dc8f172d5..56e8e214ac 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -92,7 +92,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
=20
     bb.utils.mkdirhier(dst)
-    cmd =3D "tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p . | tar=
 --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
+    cmd =3D "tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p =
. | tar --acls --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
 def copyhardlinktree(src, dst):
@@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):
     if (canhard):
         # Need to copy directories only with tar first since cp will error=
 if two=20
         # writers try and create a directory at the same time
-        cmd =3D "cd %s; find . -type d -print | tar --xattrs --xattrs-incl=
ude=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --=
xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
+        cmd =3D "cd %s; find . -type d -print | tar --acls --xattrs --xatt=
rs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --ac=
ls --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STD=
OUT)
         source =3D ''
         if os.path.isdir(src):
@@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):
         else:
             source =3D src
             s_dir =3D os.getcwd()
-        cmd =3D 'cp -afl --preserve=3Dxattr %s %s' % (source, os.path.real=
path(dst))
+        cmd =3D 'cp -afl --preserve=3Dall %s %s' % (source, os.path.realpa=
th(dst))
         subprocess.check_output(cmd, shell=3DTrue, cwd=3Ds_dir, stderr=3Ds=
ubprocess.STDOUT)
     else:
         copytree(src, dst)
--=20
2.34.1


