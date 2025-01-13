Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD25FC02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:48:37 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.89])
 by mx.groups.io with SMTP id smtpd.web10.22122.1736786907703450965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 08:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=070KdfX+;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.89, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5oWjbPZSNwpQ5h2nPz4FhOYvqPEy2UocZabu6EHbpsZ5gMDOZYSOUyXwrCAqlL4HDki5QUM0qClz2uznarnetzIphpTctvU6X+L/HewC1ZN3Xtc83kM2S/vh0Lsuh/Txk0fSI1Lp/t2AIYhHNKk9tRiYgwBYnuXFr3glJSdxaSaY9QNZ/4idfLFjHKlYtMY+jnMr5pHDGI3yRjvTeslH5pUxQ5zn26mioMl7teeMUa8vKsYClSTvpqeX29dGlaqLjjvGx66k/UEdEr3aBSSzH6L1gQKUCVRMGlcHKrE7/LpL/oqinI7aomPGRbCibNInbos605ZVr8mNzC1VRVAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueilXwgrw1RFhQHthWZw6IFvKm5avd6AcdtF3eRYV+E=;
 b=cDGViKF9SX98iU6QxlI7WYSNY2pbIX83br0JWax8LAvFEO2ES9cDaIU1RJJt2IlZy2/5UTu6r3cm/RN0P/eh9aphBZ544OHFZZxVsPz2ibzWP0GloxWtSN9asiIy0UOw4df4SfNDNgzk7zvXny41/jr3GYwxdxaXiuHBrkV0utnQx5Mte/tmkTkLeCFbZEYBwVaAZT8bIsrgZnj4jKxjbyaEu1ftfZ98kmWQo4yYTVJCv6BHDvZI0qMiZnHBnbIKajgtJ4cYsBrBnKCrav8t3w25JLnNUC5o/n4AqTw80KqzUt4PXRef2uEeQ8kW4R20wmwFu10esu/vCO52WiogwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueilXwgrw1RFhQHthWZw6IFvKm5avd6AcdtF3eRYV+E=;
 b=070KdfX+r6opqjFqYf99DE/jCrHGqV1S5vUm+k7E6Sqwj7jwF8K0m3gN7+C0guNg8envb/Gi4f0UJuGfgmsYx7eE8VUyHQ4O5j6Up+gYyg0vt7ds2M6zY7AB/JRk0yZZS3vw+l7EC4T4jDUCzLJM5wis0qf0TVcUNptHnRPuvbfkPghfQm/m5dOJpkUlU3MUESStHr5KxpBiR1fIejKa7nCRRKJg+s7CS1q1l6RKVD9nNUMWCzgVeIW5YMXot6J4zGf/KwxJO1geo0Yp0MTj6do1AhwyrdZtOnHPz2V3go0vY/IzTRL7+3j6kA519lDL2C/vnPZlnjtW1kVBTGw2Zw==
Received: from BN9PR03CA0427.namprd03.prod.outlook.com (2603:10b6:408:113::12)
 by DS0PR12MB8528.namprd12.prod.outlook.com (2603:10b6:8:160::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:48:24 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::41) by BN9PR03CA0427.outlook.office365.com
 (2603:10b6:408:113::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 16:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 16:48:24 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 13 Jan 2025 09:48:06 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>, Chris Laplante
	<chris.laplante@agilent.com>
Subject: [PATCH] devtool: actually pass down whether we are in fixed setup
Date: Mon, 13 Jan 2025 11:46:41 -0500
Message-ID: <20250113164641.810415-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|DS0PR12MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 98894840-b68c-4a98-6cd2-08dd33f21897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dUzf5lrS3TG3bYjyidAeyXVeJE4Gt1v6ocQeE62e4d+4IvT3Ai883peuE4Ud?=
 =?us-ascii?Q?v+vNuXp9GPyOmRiic8cnf6uJWau1u1INLmQcLSE5BB124C3GUFZmDEnOnUNU?=
 =?us-ascii?Q?FnePHC3gK4QGFacJfrZWi4kamO6gDHHUojF+hSla/hpyS2RvzY0m1H+5fdHW?=
 =?us-ascii?Q?BCXGJVnCNFcskaY7peVNIuFi5gG7qK5TCWA2HAYPR1vvFK3FaqWQze8fh00L?=
 =?us-ascii?Q?i/4ycVWfs4FtQtKBHg/l8pWlR85/PhJs3CRSoPYO1UXNJq97iTAzyQzgb6h5?=
 =?us-ascii?Q?0atr4f8KOYUvDSPcX6CyTAI1A2r7ijkLHAgH8C1OdcdDhK8YUBGfbO7WuYKI?=
 =?us-ascii?Q?ewcRBEpmlLYLcT2ut8tRM9j0hJzw8gLibMQ/BaoPcaZNwojyvgcXYW9Gdqwv?=
 =?us-ascii?Q?yPvPj7CQluCILxolnCs38pNAZjn5el0ZFilWOEqcQ9eugzPOj0sBUFmiysZE?=
 =?us-ascii?Q?dF1KLnGC1WKy5FJgmdBs6rheQAtx7wZQSOzRANcG/EHsr4GHO74Nuq9jcuhe?=
 =?us-ascii?Q?NtA+hpGVqDj4OSZA9fAP77HIu/nYrs+rJgHCWdkk71hpvQj/x0VIHYQy338Z?=
 =?us-ascii?Q?tD2c6xy29AF8fZ4OTVta4uYlDPPDq5yGVTuxiSJkphgMmwpcjJ2wFkHcLWRT?=
 =?us-ascii?Q?RCCAesNOa9YBrXdGl5YKxTYk1k8+V9dE8neP+OOe5+kk1t1eR7gk6zpGoRwo?=
 =?us-ascii?Q?ByfAJUZb1qEVv1XiMk+2MUnWk/oUf9UgQto/D6Onn7LIYGzZ+HBH+1p1dQAu?=
 =?us-ascii?Q?DN4iqwNzMrSAwjZCGzHvDVFjEukuIQfiXIqVodFRlA6qC0nbGAN/yO/exyfw?=
 =?us-ascii?Q?cFtGfpNFbpLqp9ZoIHiAsOGoDrxxaBd+5al7YjccHZGFjAd0h5bTXWM00ttW?=
 =?us-ascii?Q?YIu7aRWHMIthfaYkkT8ZWw792aWrVPuvk/FP9K1sk8wJv7I1wh5fxWcEudfh?=
 =?us-ascii?Q?eKuxFUXsqpv9tzbzHsTKo9rkDe4mumpIDJUFnWqrMB3clAWoGyxIBTF0lYJC?=
 =?us-ascii?Q?ebZWzAy+LLcIVoVQkwDBVhLSxRnYXm8dOgqD8odJ3PhrGR8iFmdlce0VJscE?=
 =?us-ascii?Q?akSpK9994dWxkVngdytpgrhBRL2JeFt7+Oo8L0gkXdCFBPHDYEg01gx7sk2c?=
 =?us-ascii?Q?flgdUX2GM5X7akXck9/Yj3m7YhZxjjsOijB/kMRoJIjpb8nPkMEWiZ0Ct2Ug?=
 =?us-ascii?Q?axhHBiZH596UtH1dwNbvUBNfelPdrPkBGgr1YzKXCar1wcsmwCT5TBquODc2?=
 =?us-ascii?Q?QeojkXJ/NQz9Iee5kRSUJ5BEIrsvKV51r6GhIqVNsEVXn4ZGklYxfST2AgyY?=
 =?us-ascii?Q?btZToz1eVnsdAAYC69K+FM0feaDoKCarhzjrVj2c7ZZDS2UO4S1mt7ost0pH?=
 =?us-ascii?Q?vRoi6IqVjz29Ke5xwmRecuVLl4umZGSMcq1MkkVAPQDZvBvtF2Y8p5e/4ALH?=
 =?us-ascii?Q?L+iOrRy0K60=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:48:24.2751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98894840-b68c-4a98-6cd2-08dd33f21897
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8528
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 16:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209738

From: Chris Laplante <chris.laplante@agilent.com>

This should fix https://valkyrie.yoctoproject.org/#/builders/80/builds/725/=
steps/13/logs/stdio

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/devtool b/scripts/devtool
index ebd3e4c11b..39cebec0d8 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -299,7 +299,7 @@ def main():
     # Search BBPATH first to allow layers to override plugins in scripts_p=
ath
     pluginpaths =3D [os.path.join(path, 'lib', 'devtool') for path in glob=
al_args.bbpath.split(':') + [scripts_path]]
=20
-    context =3D Context(fixed_setup=3DFalse, config=3Dconfig, pluginpaths=
=3Dpluginpaths)
+    context =3D Context(fixed_setup=3Dis_fixed_setup, config=3Dconfig, plu=
ginpaths=3Dpluginpaths)
=20
     plugins =3D []
     for pluginpath in pluginpaths:
--=20
2.43.0


