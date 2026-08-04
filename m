Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786EEC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17289.1785852712199411908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=F7z4v+WY;
 spf=pass (domain: ericsson.com, ip: 40.107.162.24, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4vZOD2QAbrtpeesJu1hYxiAowHJafTdcSZf7ZiE3ckRDS9hQjgOHp8W/EWAJ3IocNV3+GvytR2nP2x3GRyfNq/s9VgbtDHv7XBA+2AsazgYTb4+61Um4krGzTQPp486MPlgFHwnMdxFckBo3UkrXzloa0CuddjPYvdaGkDSKFljLCaqxNhQ7/PXPABePiGTMbmVRSIBp131ku9qB2sjsAbgId7cf0tU68OJI4HUqD2dFFamh5+P8+w7yqQmgns5ttnUOkqGMuf3ZVPuOjWh68u5YNoKd5yDurCRn5SWlVIbQ12aw7iCGjWxP8wlxf89XkXO1zOwkPOgGEKAH3b7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq/KOrX9O5uCxht3xBgBv5BImpDe5x0wePP4jUmv1jU=;
 b=HpIJJ7ZSdrUnxEUds1MY5JLOSnMOz29IIG53N9avbGb9H2FwWwCIUSWx/ni2Zvj2mD5av1liOO/LRpLZZsVLz8MsmlkyMsn2HJYPGd0KpoRX07/aPKP6K7BUwpd2SsXOwRKP7Oc3ZwlIhBL9BHthPOcROizmIiARmaGXrPK6TuOqrBssnzux3BJwKs8dZ5esFqipKW883YMNnChN5X5mnGZeBaYPO+Pob/rTE5CFfOzxpAJUMe39w+cin006pbxtcCArAm6Y0Qz9FnuIXzXSTv7LHU43rlr629lBITMK6FRP+X4L5IgF0Lk5Ymw3eIEdbXi9eEL9MtX7EWhYGf4KHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq/KOrX9O5uCxht3xBgBv5BImpDe5x0wePP4jUmv1jU=;
 b=F7z4v+WYyps0/Sz65aoVM5C+pW9FfIUoEgUhz3Es1xpBobyVsxHVjEH7CCt6mBocoqLaWP+G1RkXej0WKMSXcNYg0oETVqbJhGbTXEJ8Rl+DI6lh+6bC779W1Pr3sH/d9ankWR9KjZd/blu/llW3n6ejhGX6FvZPb2PmdRYCLFkEcE5PfKwnnCguG1C7GjEWjQknMWY9QDJ4OUvZG7KLEaUv7gjnhe41GBfUwsMrdp8hzDqHPhX6mZxMVv3v8ni27za9eIQf+Jy+E2Il8FZFYIgJgqk1IdeuLHXOx++eMdtAtqKd5bmzi9SVFrVVez87ASYnrurt/LzSRSx/8bdAOQ==
Received: from DU7P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::23)
 by AS2PR07MB9352.eurprd07.prod.outlook.com (2603:10a6:20b:608::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Tue, 4 Aug
 2026 14:11:46 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::a9) by DU7P191CA0012.outlook.office365.com
 (2603:10a6:10:54e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 14:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:45 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 2A9CF95802;
	Tue,  4 Aug 2026 16:11:44 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4FBAB700DF50; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 5/7] libgcrypt: inherit upstream-stable-release-point
Date: Tue, 4 Aug 2026 16:11:33 +0200
Message-ID: <20260804141135.3779287-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|AS2PR07MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ff1a5f-2f80-4a8a-97fb-08def2325149
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Wfag98CesynPTCfKUNXjSMeS7/Dw/JlFJUEHXUMZUJGMWjsIEFzyV5hB7RffTgur1M4c/uMKT/bqboJlTevQgB1PVrrL/3DvkO1VyTB0l9sZTqERhRh3gs5pUUb68CgOFEilfP62BdFtBrokVF9ooBZBT9j/+ZbDF82fx5ng357ShCwy3s4bmv2DW0v//zumzACWfNDs+12ivkvAdC4ncY7m/NjJC2FgmKJXZM8fqLopNA4K9TKXlrZQfRtYDnLMsnXFHxYmaIjX6CrE0ZD9bE+0H0ObXtirw5dJ4oMqrcMCevnN3pNQKrbFKOWvEJyPQEzHhf/eXYmDqDz3zA0Q+7A3eTo8UShMZ5fxbJO+tcaJTI2j3Nb37ZfG9ZqmrH8MA7jmGA2XmfQMDhUT2SGf2RAjPi4smkMEIT0gk+ZiqZWCooWEYgMDPLmZ6XEjQ8HqN3I8nTFt/0wA/HDE1uOJzzHRPOG5joiTr/bywDkgSdnRRNzecnbKW5dwqoW0yCYCHkS85cIB4gaJ6jVw//mGC2b1zfKqbcsQQbAans/jeHWkh1b1Q4khVQAFlGxxeDNCSZM2ZTDfZltG4sAPGQC60soD9uLmMmHl69pESX4S+WCClXqkNv7wFVB63ihogbEAA4aTO5o0SD8xDKz6rqgNNscbA+AXMLpi4d35UqQNSuU=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zZSVm4dTkUCfvdz2TI25syUdn+rckGCi2D/oNuLS0O3Jb+F2HcPPMrpY8ekUN5E9OmDutwPWNhhRjy2CLtEiWcm/rjen4+lu/qbcnRm2oSKI2XogYH8k2KeHtmF/Gqac4K1XByAdO7X+0NbEB4/5IG69A2UHzwMFaB+4X+Jb73HZN3DsQVGWh2sak8KOZiYideWZ3t/Ok+9KMWd+wN3UV3r+ZjnNGVPYTm8FWrjVslFx9WNU6awAUvYjFm5D31WwhX+U9oA0N0xwSYXnKAJOB+ilb7k7QTnmQh4ak2ZE23lXllrCdSkvjM6Z7bnebPptRRLNAv1GXSKWiUD9Zl+Kv78bTZjgDccRpTf5TI38LbygjuLPCtUHOv+ZDXOb5JEYGSQ/CY7K1bArYuIF1+1cGV53h7GvXiXL9sMTk3Ryt9rDKzOAKCI8rQsznWlQ58tQ
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:45.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ff1a5f-2f80-4a8a-97fb-08def2325149
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9352
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242770

From: Daniel Turull <daniel.turull@ericsson.com>

libgcrypt keeps a long-lived maintenance branch per minor version,
LIBGCRYPT-1.12-BRANCH matching the current PV with equivalents back to
1.2, and releases from several in parallel: in one week of April 2026 it
released into four of them, 1.12.2 and 1.8.13 on the 15th, 1.11.3 and
1.10.4 on the 21st. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/gpg/libgcrypt/tree/LIBGCRYPT-1.12-BRANCH

NEWS separates "Bug fixes" from "New and extended interfaces", and neither
point release in the current series has the latter section at all: 1.12.2
(Apr 15 2026) is four fixes, including an ECDH buffer overwrite and a
missing Dilithium bounds check, and 1.12.1 (Feb 20 2026) four build or
arithmetic regressions. 1.12.0 (Jan 29 2026) opens the series and does add
features, confirming X.Y.0 bumps must stay outside the regex.

The libtool version-info in each NEWS heading is upstream's own ABI
record, and across the current series only the revision moves. One
deviation is worth disclosing from the previous series: 1.11.2 adds a
single enum constant, GCRY_KEM_RAW_P256R1, with current and age
incremented together so it stays backward compatible. Point releases here
are fixes-focused rather than absolutely fixes-only, with the deviation
bounded to additive constants.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: scarthgap took 1.10.3 -> 1.10.4, which needed a
build fix backported alongside it because 1.10.4 broke building with -O2
in the sysroot path. kirkstone has taken no in-series bump and stays at
1.9.4.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.2.bb
index 697deed607..deb053031e 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] =3D "7ce33c2492221a0436f96a8500215e9f3=
e3dcb5fd26a757cd415e7a843
=20
 BINCONFIG =3D "${bindir}/libgcrypt-config"
=20
-inherit autotools texinfo binconfig-disabled pkgconfig ptest
+inherit autotools texinfo binconfig-disabled pkgconfig ptest upstream-stab=
le-release-point
=20
 require recipes-support/gnupg/drop-unknown-suffix.inc
=20

