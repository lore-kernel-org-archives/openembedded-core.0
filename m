Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66C3E6F085
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 19:38:34 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.89])
 by mx.groups.io with SMTP id smtpd.web10.2957.1730489913473842828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 12:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=qdz4Z2kQ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.223.89, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlW6wdQtH1gdNuOYtcWaDlaskVpp7lFtrrjGwnk9iVvK06Av1PeZmm2otgfD3TwzxX59oXqCyXNLvior8418zDEZuSM8C1eWHvT7ysrsjRmFK7Q28iQ6xGxVkKnW38tSWDlUEZZqjwSKQbFLc8l3ORUGCKVKbO06eRFrTjWwk85l66l0Azd32Gn79DZ36CO8VkRvwShMu04sopEjecO9/2LFNMvRarWDoXiZmhNWiawPuMO/Jg4a8kQ5fTqw7DLW3pX1FJMbFanQSRBjUDYVHJ6LTER6PBqg7sRSvRivfvtSIdC0ox2pAtMxIOYheBUc0tNN7ihlkWMrmyPJf55b/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fDdFMrSHR0p4hvoS6b61tx4Jue2A/t++NbO64B3wxY=;
 b=nYfFKL7vhiq1/WK+N8g/D/Hfqe8wJaN76m4Gm7I3gKYJHVF2dAzgoyNSCgVWLNukEfbBDYIO5OMCEzdynuYPUwTLoxslBu0YsFTtiPTaaZ3lTqbAKmNJxJqypNP7fgreXfe0Eh0Lv/QCKAHuAokmhfmgD46HDh9lP/bj3k2HPkQPGNAUb/n2uqGEU8iOKK7xh0WeL5pWrFMlCTFq2ItEHKWoe8t/xvSs9dOoPpVPXiFpk8fhidXecXjzlNMbY68D6xkxaYjgjfwX4eVN5vN23b9AJsvhL08IiG+kzYmI/ch1aGmuM+arq/CD5V9qCkRL1ok4KEE2vXioQAeF55i+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fDdFMrSHR0p4hvoS6b61tx4Jue2A/t++NbO64B3wxY=;
 b=qdz4Z2kQC0CUoBIev+eIRc6g2A8sak6SpVFkvFUJeQVJrKGNs5ehNhfR8STXiFEM7I/o4sZ7fjmV6Sc24/mENmQGVooqY6Nuy4Kz3B5vxU8J21EbTGZP6jTNvDsYiqtKfaHz9jqvulvffKFA0yN0Dobtaim5G/MUXol8wrTK1j9fCNdCVuAsAwkuAQqNO3poTIzpO1h71FyasBNYw7NXgAdm+jvMCdkttfg8ucPAFDxyfDj8m9BHKY/uR/+CJwM8An1hwMou8ah96TizWIgtFhqZBAwCMGhVWNwJH+sR3oQiZGysPmkC68PYffgr8yjjca71/MzlX/W4I9o/zvfhoQ==
Received: from BN0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:408:ec::20)
 by PH8PR12MB6964.namprd12.prod.outlook.com (2603:10b6:510:1bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 19:38:29 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::df) by BN0PR04CA0105.outlook.office365.com
 (2603:10b6:408:ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Fri, 1 Nov 2024 19:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 19:38:28 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 13:38:24 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH support
Date: Fri, 1 Nov 2024 15:38:11 -0400
Message-ID: <20241101193811.2068211-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH8PR12MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff900a3-8d26-49eb-ff0c-08dcfaacc2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UZMfVTj7HWTnxjjvpbm3s4B6dUvc4P7XURsH+XwZ3mf7JOMeTx1CWaZ6Q9nT?=
 =?us-ascii?Q?KMBitrCm6ENT4T6jElgd3mzmUl38wfDfTnUtuoERmwqjp6ASL30XXZPKtdZf?=
 =?us-ascii?Q?S9RfdpB6cRZin7GRvb1SBr9AQ9LT/K3hGYz8o/REH1wD3qcyioYpUOUjncMc?=
 =?us-ascii?Q?y6kqqDm9ku5hw8G4dksAmCeCLgW9KsOKhwv4aAAL7uwPuuTSYsNpkSeLYc5W?=
 =?us-ascii?Q?1soAiIXhpSyqeM302ePPWmHrCfHF6OwuMm2ewdfnt/jyDXS+OVsrwDGnXfLq?=
 =?us-ascii?Q?weMUg2/jVYfw53GjKwRPVz7RWtksAay+5JsjCdOnpwEre8O4QThckKzH3bWW?=
 =?us-ascii?Q?mqikw01piPns88QyzAJDbFjc7BlygSQ6VjeFOD6C60o9qDqLke5cC4XOEGRu?=
 =?us-ascii?Q?ZyvwIXWNGFHAa/slXZBYuGz6oQ/fU91bCsdKVnjHS46Moq2xtUfMkCyeLE7k?=
 =?us-ascii?Q?N1txxObIW8v2AiDONLkxYiLrx7GlgY350Xj0ge5nO3SM4L0ZQq2+mBpIGWzk?=
 =?us-ascii?Q?gepwBKJPrZbZvpVw9viY7mUcXBGbKO6KicsQi+rbufu6ODiD8ALzXU4y047T?=
 =?us-ascii?Q?/0GTJomovv7k4QCFDYgsUa8mTHS8Ulf9thMXZp64xNC8rqtJrURauXYjqu/e?=
 =?us-ascii?Q?mxzNGjn1R+5GkbkDqATdn4MSvC5Qp2Gc1bdH9YuRpcs8VTV1shMrAuNXhYXL?=
 =?us-ascii?Q?yzWPhUCxpCbkTXGj1ryH03Zxa+FbCqLBakbZDmXnVmfOGQv4qTqezduifpP3?=
 =?us-ascii?Q?eyF1iVK3JQ7ITqJPrwlFDYQIaEw1fJ1I82W+FNbYQyThP9KMDfRoVtVxs3Jn?=
 =?us-ascii?Q?FwPfi21tJqMCZbscK61oZyca8EIUnbhKlMGLCgrg0HQ6ZQSOKa9PBqXx81wL?=
 =?us-ascii?Q?bqBYiaH+uBQpefyxnIVLoOck3/6fqrscSIUxJbgrZIhcFYmSZbVxTKd/nyuA?=
 =?us-ascii?Q?HFvgn4SZJVDu2HXxHEBtm7y2l6bEhSAqcLd5CTKj8/tDNclfUM8OBKwJ1Zal?=
 =?us-ascii?Q?6ahjU+g8uiHgZV8DR+4m2MEXbnEXkbIHudCGgmgR3rt68buQR9Wbjx5bSX6c?=
 =?us-ascii?Q?eDrVQPg9DWKzyoNEd6CLHAoZb2Lvrsa7pfLHgTFHE2R+zgLlxd4diqQk8X8U?=
 =?us-ascii?Q?mBHcRt8g5gmLhv6gv0Q4kfYJ9MF/h9jYl+9IeDb8Rt+HLoTZpxSGoBxbRHGF?=
 =?us-ascii?Q?UUaE09o3tlfW6s/uJnmoitOAaP0nwiFWkQIPIfqxO9gvqLe2kQL/zbH5qcMV?=
 =?us-ascii?Q?lcQ1/DusmUG3yX/mbIx9RhMqgiHqmP98vROd7CnnSxDziaZTHXQjGkyM9sAn?=
 =?us-ascii?Q?kflV8T1PcmAsOiQgcJdVt99XPJwurfZETMyVZH9F6sTgVQKyEoOBoQKN1u0r?=
 =?us-ascii?Q?auEEGirmzEkM5JC9Wxqga7+GVxmJJVkJCcmuONTI1iXMf+RD5A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 19:38:28.7526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff900a3-8d26-49eb-ff0c-08dcfaacc2c4
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6964
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206630

From: Chris Laplante <chris.laplante@agilent.com>

Provide a per-recipe opt-out for devtool's default behavior of using the 'd=
evtool'
branch. This is primarily intended for company-internal recipes (e.g. on pr=
ivate
layers) that use floating upstream SRCREV. It is assumed that such recipes =
do
not care about patches, since the upstream is 100% controlled by the user.

In those cases, the 'devtool' branch is unnecessary and just confuses users=
.

Typical usage would be something like the following:

BRANCH =3D "main"
DEVTOOL_PREFER_BRANCH =3D "${BRANCH}"
SRCREV =3D "${AUTOREV}"
SRC_URI =3D "git://intranet.company.io/whatever/libsecretsauce;branch=3D${B=
RANCH};protocol=3Dhttps"

This way, when users 'devtool modify' the recipe, the 'main' branch is
checked out by default.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/standard.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index f2440ae804..6b6d542e8b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -907,6 +907,14 @@ def modify(args, config, basepath, workspace):
                         seen_patches.append(origpatch)
                         branch_patches[branch].append(origpatch)
=20
+        if not args.no_extract and not args.ignore_recipe_preferred_branch=
 and (args.branch =3D=3D "devtool"):
+            prefer_branch =3D rd.getVar("DEVTOOL_PREFER_BRANCH")
+            if prefer_branch:
+                logger.info("Checking out recipe preferred branch (DEVTOOL=
_PREFER_BRANCH) "
+                            "'{0}'; use -i/--ignore-recipe-preferred-branc=
h or -b/--branch "
+                            "next time to override".format(prefer_branch))
+                bb.process.run('git checkout {0}'.format(prefer_branch), c=
wd=3Dsrctree)
+
         # Need to grab this here in case the source is within a subdirecto=
ry
         srctreebase =3D srctree
         srctree =3D get_real_srctree(srctree, rd.getVar('S'), rd.getVar('W=
ORKDIR'))
@@ -2307,7 +2315,9 @@ def register_commands(subparsers, context):
     group =3D parser_modify.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help=3D'Build in same directory=
 as source', action=3D"store_true")
     group.add_argument('--no-same-dir', help=3D'Force build in a separate =
build directory', action=3D"store_true")
-    parser_modify.add_argument('--branch', '-b', default=3D"devtool", help=
=3D'Name for development branch to checkout (when not using -n/--no-extract=
) (default "%(default)s")')
+    group =3D parser_modify.add_mutually_exclusive_group()
+    group.add_argument('--branch', '-b', default=3D"devtool", help=3D'Name=
 for development branch to checkout (when not using -n/--no-extract) (defau=
lt "%(default)s")')
+    group.add_argument('--ignore-recipe-preferred-branch', '-i', help=3D'D=
o not check out the branch indicated by DEVTOOL_PREFER_BRANCH.', action=3D'=
store_true')
     parser_modify.add_argument('--no-overrides', '-O', action=3D"store_tru=
e", help=3D'Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help=3D'Keep temporary direc=
tory (for debugging)', action=3D"store_true")
     parser_modify.set_defaults(func=3Dmodify, fixed_setup=3Dcontext.fixed_=
setup)
--=20
2.43.0


