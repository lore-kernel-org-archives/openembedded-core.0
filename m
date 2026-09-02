Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB959C624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9248.1788343181206301311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=KTKES8Df;
 spf=pass (domain: ericsson.com, ip: 52.101.66.21, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGWJZMhoRckpCyBDVTJlPuJpzrhialh0SfXL5NiMYu0j9x2216/5SNIwLLBm8slvhfkBp0v83wp6GFr/1rrMiu8Cu+sErws1S5kpudKN+pMNViWDaY/wY47EaGdSVfyERg+6ehh7IQ03pzxlYU9lNaAGeVpdFlgbWl92b9oUY+v1JvbJdXsMNwQWglWF+5kZahMhES6cYX/ww1WGqceqgs79A9ZVm0y0CZNijzGK4Na1Wx/wWBjdL5HTlD6w5bgGZWbYowq6kPTQ+mZoWgF71Ot40GmbT3cdL3tCZnAncJhipU7C92Dn/J918MFHFMkZ9BK6kXXPYU8r+4Aqd/uPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7+kSl2v1/lrjVOPcVW1Xgquo2K8w1RRlwBU6B0uIj8=;
 b=DB84h2DRhCtZdc641Y0b1RusMDJGRI59Omzk7masLKbkc+Ff1bFWlega9VVX3yiEjdKh5Ab6kEw+lNPLjbCQx6MZZJKeyMOSLunS9uwSzY8JxEIUpFPJ7EZU+SJdNGK90IkPNd0SIiNC5XZUc/WU5WDH2sam/Bw61B6qpcePEckYc1dPLHUEqoowtStdIxFElp0u8pkK74Fh2wxCVnMhMruac+jCKpktVUv7UAH12hzILxEjEgAg0clUJP7bqGXI8Q3vVhRqDUEBnia0Rq46uKeQc17lJi0j/6HpdpGeLiyjBbAetIvA+TvWjf8JhMV0p8ictlRf3lTKbXb0PyG/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7+kSl2v1/lrjVOPcVW1Xgquo2K8w1RRlwBU6B0uIj8=;
 b=KTKES8DfNkx/UzVO7Jw2guu4ApCI/23Z0yyU2PxUfqYXvvQ7nnlszvYsRWn6GNSmhhRKVwLB+C+ywqre2nRx+n7tba3EU5BuyAtROE6m8HLbm8CFEbF6W6IZdC7xZ3Cgvth+fGdxIVej2mxAGT3UhCFbeBvP65Dt7CDt1xpX8A2NlIJNUaZ994Bi+eM00AYuDYZMnQ+goJ2hKsf+dy4IsOe9BVhutXOPPjKQ6vAJGZKF3X5d1czHDy7ObMSN0UvpourdCKn/SA6tJiSdzepmAvU/pHW5xJDqID13ytuWQlgBoZL5D/GUdXAG0PjbnJoPLszLHWbI7V339d7hsbo20g==
Received: from AM0PR02CA0131.eurprd02.prod.outlook.com (2603:10a6:20b:28c::28)
 by GV2PR07MB12263.eurprd07.prod.outlook.com (2603:10a6:150:36d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:35 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::41) by AM0PR02CA0131.outlook.office365.com
 (2603:10a6:20b:28c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 58EE94020EA3;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 75541700E7DD; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [wrynose][PATCH 14/20] libgcrypt: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:14 +0200
Message-ID: <20260902095920.2840293-15-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|GV2PR07MB12263:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a473405-0c9b-4093-7d47-08df08d8e45e
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	zLY6AhmaKMJM9Tr4VYVfgzMsW9dcigN0fXmAvL1sojY228sw4yoQvwJLwPTQr+I2+6tMZgfLJt8DbBdSxApVCz/sMqgMqY6CzXgUKpUplZYmGtJpp6zgkACw7MJY4vmLFngF1GiOAWCWzjdhDL1ysincPcw9Z9f+zXYcyxBZ43G7TDkWvWmwUu2qoJE+Ymp8BOmDI5jGhDptH04KxbLTTQ0f7h9fGV9dzET0dX8IAWHeXy+4LDkLkOWxPpZzsTJX+u7bDw804J/+Niyd9CM70TN6runEsoVVk/cSdTmxolNMbKoPzwSX6jbq0Pth5271IpRcMmBoZ6hsyOvX+DOhrzWD5y4OXEFFYA6QCcK5P1jpfPOe4qxgoyoBS51xuSul16/fClEG2+0nAUiV+vQJWkaX3++XDnZLqqMTQESD8KNvXjuqPxR1oBh73o6J32pi+vw3YRHeWUT9FWhVgBMr0EzqWaZ+Db1/7Vl/APHJ8q88dgii80nJqU0gQMh5LCXNKz4HoVRAeam6BvT9eTAZmBLof0H1+39/ijZSx3ruCY3jji50QEtz0CmA+u6p+R4GtrjWdiSPd8k9nvflV94wEl0LaB5lnjiwkIQZiJxSuX1Clehek5ovyUICuzZN7WwwGTisP3EtRcDyvLezsqdjwA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	J9W4koa5H5g8CWKTFxYpJcaCwQarMhXanyOe9FVkYjoGspNgAp99KQNPHJ7PR4rqTxO84btmLB74HKvldXW4lOqZcpQ8PzuHzT2VPuC/sziV7wSj5rbA5DmvSCVJVDj0J0ll98JnszwTCvw4ci4m0Y310/kKpjQX4igVpBDzxgP3jniAUNUp2GPx7f6B0i8DfnvK6J3TsXPBdbkb937SFBE7ulVdqF4lxzYbdpOv1xXBMmZyPtGWMWazDHJ7OCb/6F4nMn2Ey/cm3CVVOHLCRF8OYdJaZaurVMGMu2ZnWpxxH+jjMYuK5SQGgB858MuesgjlyFTuZU0mlVhDoLX2irRueRtuJB4F+GKpXfQXV5f4XHHvYMPCxZ2+YaaUaF6Wkv6G5SQ4WDen/kcWZoNGx91IWc2IJP2q1rf9tovaRgk71ausGaBVHSFAQYYbC6X9
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.6629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a473405-0c9b-4093-7d47-08df08d8e45e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB12263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244919

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Adapted for wrynose: applied to libgcrypt_1.12.1.bb (upstream: libgcrypt_1.=
12.2.bb).
(cherry picked from commit 97caf8a110281becde5d888338712d71627cbf98)
---
 meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.1.bb
index d7f8563ae6..d7b3e182cd 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -32,7 +32,7 @@ SRC_URI[sha256sum] =3D "7df5c08d952ba33f9b6bdabdb06a61a78=
b2cf62d2122c2d1d03a91a798
=20
 BINCONFIG =3D "${bindir}/libgcrypt-config"
=20
-inherit autotools texinfo binconfig-disabled pkgconfig ptest
+inherit autotools texinfo binconfig-disabled pkgconfig ptest upstream-stab=
le-release-point
=20
 require recipes-support/gnupg/drop-unknown-suffix.inc
=20

