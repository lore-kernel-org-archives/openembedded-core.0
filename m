Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDB8C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:00:45 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web10.6635.1651820433030208227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=3+etzVam;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.85,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A30EGAsxvvO8WR7XZiA3oExITRgXtXU3EqXpHbugMIHC0RHK8+ecJt13inzrF0F/dfNucu7vp33WFBPMtmR617rdac9NHGcD3g5v83O2Vhx6cGpD3YiWtNyE99c7gNppIls5AW68DNDfgxO9OzSGTXDZ19lHFeTyOdEm1XeR+pKRsYcs17pMnQPUumxPZP6Q24I8b4WmFr8576rKGDt/uHsVtJMZ01z02wjgwHuiU1F/l91OHdj9sb26EHJzdPUIolx0Go9ONptAiAy6xdiJM7+n4+HA2PofY5b4pipVD0wBIi1y4QXXxVen4pfdIybycZ2DH1I4PXJpJS5uKGhijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+NFZNwtWOfnjC+pHXYrx6vBEhJy4UZOPYqvRKAz9PQ=;
 b=f/gkoW1yMhv8bZjSoeF4DTaP4WcmlsTPnfAuq/3mgFVoDb/731pjC+R1A2dzzumeVweM0S3njvRMrUcsl/SM2MtEvLPt22iG12QI3vGsJSEjkc7VMtOH5s3aWrHkBC4Kmayp+nTLRzszddqYppAMfsBuflxrTTTMfb19MhivU29VSCRsyRjyU8k8759/VWxRG6dqfH82piIzBDnHPwdbZeJcdETnrapxbE8NF+/QipNGYR0laqsaXbGrgLHWr0ni9AhdrPgWOFqnN+MABnZGLwebO4iJwYi0oK/qBpH1NZPPqkU+DGOa/+cc2WUt4LaC8TBtgs4PkNFwYWtgfaDklQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+NFZNwtWOfnjC+pHXYrx6vBEhJy4UZOPYqvRKAz9PQ=;
 b=3+etzVamRjnI1IAM6+n1R3+bnSN7STOxCGmkYvW/pjR8tK26z3njpQ1z3XPe2ESQYXl8uoTUWeHSI5JCA5s9kae+f+m5BfFhkLibBTKRzWbzS+TxgRdR6ms3u3dHz7lriDu3IXqfVWrPoXo/ezUeWoA6Mpr4PQX3NF9lvuYpVj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0801MB1881.eurprd08.prod.outlook.com (2603:10a6:3:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 6 May
 2022 07:00:27 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23%8]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 07:00:27 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 1/5] recipetool-create: add ensure_native_cmd function
Date: Fri,  6 May 2022 08:59:13 +0200
Message-ID: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91c557b7-ce75-4000-6c4d-08da2f2e19bc
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1881:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB188165AAC24F2383A329C76FD7C59@HE1PR0801MB1881.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BJ9P/AS6plO3Ob60jKVQP8jBDBTO6IyNQ/N3rB7MoISUzEr2YT0T0xs74JrwDObGCGPkMKE90fWdMsL6dQ0pAHG7GitpuOZ+S4lV1MjD6dqf7i64DuyINqk1JmBz3b8j3hy9Ft/YbX1DPPhAuygAMeU3ajZiDzr+EJe5RBClC++lUdkF3fc1WnHFSxS+JsHEmBG3mDPkRblT2T81tKRK2pv5G0ZwJjEbGpyBzIQEMNJ7S7IvTbX7JHee2oxDkTpq2hLSiebner2dtwiZjdYfOjbtGtQJ8olkkoUSda1DBoJH394mgiuSqWJpCRaTOamSF02eP0rpktGeRMXmChK/kC8HvExVZMnMm2RQItEtYWAvsChwkfsD7nXnMxpaxvG9ONLZxnptkxLQZ5KyIw8ZBmXIF+MpGv/WamDr74DAe+bUmELVL0efYt4hJj47iJkgw7Dz+jZKdJHu67k68Im+s7ewNWn8K7sYOPTBu3ehWbeRMBP24DH/1SlvtyMkTwM9a0Lwa4QSfxYApIxKH2Mar+MHBCirb8FpDQp8MRJI4TjNXF1lDqKPtVurH6eeG6ckAcNIY0j3xiersDnF3wmXMixdhrBlgR1PAxhmaCN8wTX9gnn7l0yUTnRKuK2jAtCahiSruFKhpt7i4wSBNljkA49aE6ibNgRFu+SC6jPZu+pOYDQEFwy7pJIo8GJ1x0ykX0LDifQbQSg22nnGZxiQ0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6486002)(5660300002)(316002)(38100700002)(38350700002)(2906002)(6666004)(8936002)(508600001)(52116002)(36756003)(1076003)(2616005)(86362001)(6512007)(186003)(26005)(54906003)(6916009)(4326008)(66556008)(66476007)(66946007)(8676002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?te62/m8kb4dy82sJpJDV15zWLdmW0zil3LpkkFwBWA2Mh3yINb3ZbtjNfrxd?=
 =?us-ascii?Q?loCuqUnHVHj81zQ6hITF3j9cAtgxlLur+5eHct0yQkZoI4wrYBVEhOzKWspq?=
 =?us-ascii?Q?/WahdoffWmYloplBTPn4QqaCsfqhoX5zsbqVrVQbexpenb8KKPU8AEoTRg/z?=
 =?us-ascii?Q?QkYMrBa0X7lJ2mWocP+fO5wV0lBvbLKI+DMCbd1zhnGKZ+fTJtT/YRYVvYCB?=
 =?us-ascii?Q?VyQ4sFUvRgDsMYcN6d4bO1sQ7jnw91pUlApOHk3PXb6wFBcHOWXriEhkmRR1?=
 =?us-ascii?Q?KUiq0BnROXsq6sSZRFyfZcReAhvX1rw8PbUtLF7ZjXkemom9kTaAJ/ZkpQ93?=
 =?us-ascii?Q?yHJSP0n0bAvXxBEBMKW4VzkFdbOG/R+AqRUfSFqEwRMzqZ4ZuYtVzc3J8ZHk?=
 =?us-ascii?Q?h+TQi7HgRp4d1bWXOIfUSTxUkfklEflYQ81AFOb32mSPQEQnUTVL1AhdoX6k?=
 =?us-ascii?Q?SZzoyIedhx1zq1c0WKCCijhZFZK9Xk/sW+xtJCQ6kKsKsjvfDBGu2gKRIlhh?=
 =?us-ascii?Q?cceWdrcCHP9MdopmcAV5lze2BQPqse5cJ9gD7EC1AevfAPrLc3zdUuK+hOvm?=
 =?us-ascii?Q?mmIodKICze5UFs1X3TOpv2CCYKgTZ7pMGIJt+S4dlMU3DUeEFpOTAfIakevC?=
 =?us-ascii?Q?6309pnRG8GgrfhNcXphQhoXZfMNO9n9YbihR8Gqa+EPAqjW0ec3WTUG08wLf?=
 =?us-ascii?Q?9YTB8oLkGNvojviMN/wMIkK3oEWZ1gEp7SNL0IlH0tgUhfFJX53Jw8Z7BJrN?=
 =?us-ascii?Q?H1IHMBSAjuIUZo1/ZE+VmhfxyIvTAZP3ohYTfHkLdsHYG1WlEGWdFVxWYOAz?=
 =?us-ascii?Q?J83r7meov4pYIVMZLYc6lYes0k0mMhMenWRTGFW/4o6xeNVd5hd/3T2zWXhY?=
 =?us-ascii?Q?MlAMNGmfcxiDTjEJIuQ3iwVw/SG8hLUWxg7Rxoz9jgzJhbTP+WaPOpzF26zV?=
 =?us-ascii?Q?BvjCckv8WzdMtmMgf8BMgUYB9zh6kUiojI8+Yh5fE5U5ffY5KxQuDj/VbcYH?=
 =?us-ascii?Q?8PcUYBV46j35XcC+OtiWUBcQZWmcv33YibfActSCC1p08LMhEDoEotIx9zmd?=
 =?us-ascii?Q?vGRs2Wp4hbVJnTLfIpJshuL8Qb8Za/B/9GIJguuNUaZyNi2rSkuwu/6Py4Tt?=
 =?us-ascii?Q?QdiNHCt2eNiu9UZK298gghCZ+sKdFbBrxkivtL8g5k82bv+7uZovf1WY9Oli?=
 =?us-ascii?Q?9VoBhhik+BVfTPggLbGJ5l538gr22lcBT93yMi2O0bzqWfdjELaYTq4BIv8p?=
 =?us-ascii?Q?akQHHAZipXeXDlxoR62E+ZT3yO+33tC3jNIpZ6xrk9MhAGYXAxNwKzXTfSZN?=
 =?us-ascii?Q?0Nju5ZIlNDMm9o9xFSSnoTEWlog8d1jg0abLiS58gtoNVGzwwZilUn2W70QE?=
 =?us-ascii?Q?Q+Q7pH0lDRIqvRtLixFdjwf8y0LMLgYM8woL8tD9pASETIYwhXDiAo/rBLwK?=
 =?us-ascii?Q?ORg+HYlgPzFLKm3UvX7JuNQdHEP+cYkdWlF2L05xgAgIPvY4K/y0NRcOfmXu?=
 =?us-ascii?Q?+YVHg5nfKeZnb2aY4ixQD3hFd1uJKB7l2Jt3uSHzFmaQrFLc/j0Disx3MLKE?=
 =?us-ascii?Q?z3p4py+G477wvbeB55jf4RbW4d09/hFwohe4U2nKus0Wn/XKBo7Ws14dJiFu?=
 =?us-ascii?Q?9h+JqAea261ZSc2QDixIuQGjHzvA7SCLJwWadyDh7BzSkXI+sGpC4BUe399V?=
 =?us-ascii?Q?MOJP3WePs4SyW1ciuZls5khSZBKY+BcxqY4RjJbT1nSjeDCArqCSa522jcQv?=
 =?us-ascii?Q?9sT0Uzlzw/Bfhs7x+fK04fpaWTk31/Y=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91c557b7-ce75-4000-6c4d-08da2f2e19bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:00:27.4532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tTrdx8CEOUdD+Z5a2upEVKAryPa/0MZbCY5jZybAI7Vfoe582NaRJujGIZlMhoGvmr24t82V5P8YV6i+bfoQQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165323

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 824ac6350d..efcb82173e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1375,6 +1375,29 @@ def convert_rpm_xml(xmlfile):
                     values[varname] =3D child[0].text
     return values
=20
+def ensure_native_cmd(tinfoil, cmd):
+    """Check if the command is available in the recipes"""
+    if not tinfoil.recipes_parsed:
+        tinfoil.parse_recipes()
+
+    try:
+        d =3D tinfoil.parse_recipe("%s-native" % cmd)
+    except bb.providers.NoProvider:
+        bb.error("Nothing provides '%s-native' which is required for the b=
uild" % cmd)
+        bb.note("You will likely need to add a layer that provides %s" % c=
md)
+        sys.exit(14)
+
+    bindir =3D d.getVar("STAGING_BINDIR_NATIVE")
+    cmdpath =3D os.path.join(bindir, cmd)
+
+    if not os.path.exists(cmdpath):
+        tinfoil.build_targets("%s-native" % cmd, "addto_recipe_sysroot")
+
+        if not os.path.exists(cmdpath):
+            bb.error("Failed to add '%s' to sysroot" % cmd)
+            sys.exit(14)
+
+    return bindir
=20
 def register_commands(subparsers):
     parser_create =3D subparsers.add_parser('create',
--=20
2.30.2


