Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5B8C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:02:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10650.1785823342956897633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=RStaTlPj;
 spf=pass (domain: ericsson.com, ip: 52.101.84.49, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/EqqC3q0NpdWY1Kn8MLoT4RB72n0el4+z4+NDWeHGr5Hol2a0h3W1L948wcIXizFVaF2cigVBMZxLq4TpTVktqeuNOVZVATAUHXuXd7JnykCTXReRIlVIIQ50TDmutfPZ0erMCRYN0jbWxQBdkKF58OfT5mTDF/8ABPuSWrw+O0tlb/TSL6pdZc1n0jVrJgs9daHcuKfK2eJXQVPVQ+NVIcebT5pc+JIOUyGTuS52aMbzNtVuefv0Vnm27T8Qiz4wxJm7oGXz0w6UbX4xeN8Ubqf+rq1y/Cog9gkWBoqEizUCVSBsksqaxWcVSoD7vgOhBbZYPvtdaA+U13XIstww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOW2RoKH1F/ti64ph28A5moSlCQBfwJWjPH57t0HSSg=;
 b=ot5G64mCdRq52iJZUptJaeADxINuPTWFR6+mcMzf/fcDNjgUTHWGVU05jRM2IFYi9RPo2M9BYBL0atgcyjAlCYgaKyk5HTr41il8lH2+tWhL7iYEMfpYmzK3SnvL6pFazJZl8hf3SR84jw2KdoLGCI+hGulGeRIc8Kk/RMdkyrIJfKYUWZ0MtvIZJ5QnU+bAkZ/nM+D5pD/XaJggcGi1mfHYxp1u0NX/uk/M4kMQcZ2rZPKcIe8Uyr6VH7eu0/rPQjM19Oz1zspvId72drUrleLvCC2GIpBv/xTEGLyfcWdhmo9v+LmB1doWx8Dc9qt08z+GrGs3zxLJcmzJ5SOzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOW2RoKH1F/ti64ph28A5moSlCQBfwJWjPH57t0HSSg=;
 b=RStaTlPjbE5wJ5PJbF/p83kbMbHiYTr0u9MI1Qz8XORzD9HSr+kcXNbtwPtZGf7RzH7SIu4AeK4r9uTg0VnHYOAS+SH/0FMCR/G6cWQZeSr+7VsP8q56yu6mbkzXzLiKEbA39/SpxxBxNjDav5RYrbH1vshpAjkCjUEE+9R2BM8dh1an9wc6iRL4A02MfaCXWldY4IKdqhF3BCCNaciS/1LUB7SPUti+Ds7ZAEQfEOpqAh4DmW2ZrrSoY7IjhhIOh8RFQDOUBOvxWreRuCl32hTXu6icARLXrUp/STURVC0aj3TDxfy4SKltBoLeVbmU8P0yzloVs3TsrJWBVU2HGA==
Received: from DUZPR01CA0241.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::24) by PR3PR07MB6652.eurprd07.prod.outlook.com
 (2603:10a6:102:66::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 06:02:19 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::6a) by DUZPR01CA0241.outlook.office365.com
 (2603:10a6:10:4b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 06:02:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 4 Aug 2026 06:02:18 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 08:02:17 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 0873F4020B44;
	Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C9F39700DBB0; Tue,  4 Aug 2026 08:02:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 0/3] devtool: upgrade: improve changelog extraction for git-log-style ChangeLogs
Date: Tue, 4 Aug 2026 08:02:02 +0200
Message-ID: <20260804060205.179715-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|PR3PR07MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd00435-c471-43d6-3958-08def1edf0ff
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|11063799006|3023799007|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	MFsIOL49TTi1tTkw4QZbUbAx3s2+ov8kWDjjU0biOCgld9SOlcsrgM2+SeBWFnBJtPnLWylkCzV+6P2cDentP6rguB3T9BEjnP5j6786X+UOYsmYYxUWAxjKyCJ6Ty03AJJ7S7ho2DomCER6vsGQIM9b97Nq+b8aUH3bmzclp3bvh7wd6yR3X3+KGLSu53hpI+gSNsBZhSsX4bGFxYt4oFGrVdrCOZpxEcwWQaPwkQkkilhctouVNP5S4SnfAVPaHFloAyTS3IaxQJvkwubsPhhDEkx4ttnLsSwM+xGmlbtm/GGUbQzdIfXU1kPpjFv9UO9Sto+RuuPQDOqzC/h3atGCtkiIh+BdFss/n9kEcOIzwYFTY3bOJQguZPS4MTHmUgqxkQDeQwtvlEH6CJjRbk9Go2GyBqJrbF+fmUI9/cIJvh7hM0J4RkBfR26VV2jeNZcB2nGNulBCRBM/uOGvq1qr9ibgge1PgM+DKIVrAIR69B2eemjPP06+Yn0c5hzeEefitIV5yTm958SnzaM1BSkN/S7Q4M7PSekpE6RMD4TZaBP8XsZLX4C9cOhQKcLmUc6Sb17TmZ25INdMm+9dGTAMDQPjMtM/BVetgT1I3MOVHmlOqiDkitCLlB/5D4Dm4XzuyBdDXQ1FKH88X7LkWCc4iYJolyDzN0GrqL/A+OgM0yDEgNoJC0cAJKjvLtejhNkowgGSCPauv7o13v7fDQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(11063799006)(3023799007)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rBZts471+MkUmXOZDfZOt3OTmEJ/iHH2rFoOOVBxAZZ2DdhJ4zmvNvIx3tXBoyWsxa9Htz6hsEnEIFO49nkDybVhpLAbjRXkZGRrwaI99U8p35r173rR4RzfnoTbMCA+s84Bho3MO57XA8LtlfELIl+fKhWYbu786XmQd7du3zwoXFLJLuZJFfUhDIqkAoqNbwNwKC89QdTohKLcpSLCrwSdwOASyrUxDYIyt1t0knxZJMaY9Q4u7/RfMLSif8wcGa9Gv4DnpsHHt1HOBzfOQJGOl7P9G5inahPF/WHwTxmS5FKlL63cxQLV6+n5//B/47MmsF/xDZta0GjE+II9FKv9xwyKvIAmv2Mb0Q2H6H9P/zDtSY/ltzB2IQqALGpDd9Kg6cogkUdcLQ90o9aJxri4ket7iwbnui5z16Aaqj5uuhpyr4R6O6wzuKg5x5O9
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:02:18.5198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd00435-c471-43d6-3958-08def1edf0ff
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6652
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242696

From: Daniel Turull <daniel.turull@ericsson.com>

devtool upgrade's changelog extraction misattributed unrelated commits
when upgrading recipes like nghttp2, whose ChangeLog is the literal output
of `git log`, regenerated wholesale on every release.

Changes from v1:
- Header-skipping in the structural diff now relies on the blank line
  git log always inserts before the commit message, instead of
  enumerating header prefixes with a regex.
- The UTF-8 decode fix is split into its own patch and applied to both
  git-show call sites instead of just one.
- A single-use helper that only sequenced two operations with no reuse
  benefit has been inlined into its caller.
- The git-diff fallback is now guarded against UnicodeDecodeError too,
  so a bad byte in the diff hunk itself doesn't crash extraction.

Daniel Turull (3):
  devtool: upgrade: ignore changelogs from 3rd party
  devtool: upgrade: read changelog blobs via a temp file
  devtool: upgrade: diff git-log-style changelogs by commit hash

 scripts/lib/devtool/upgrade.py | 90 +++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 11 deletions(-)


