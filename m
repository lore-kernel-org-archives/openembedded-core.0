Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D010C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:00:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9256.1788343206813141606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=YsctUptm;
 spf=pass (domain: ericsson.com, ip: 52.101.84.66, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PppErm926KuauvNre/1Hc+gYGRK0iOpTE/AVmBF9B4yQ/ZwL1wic6Obw8m0XmZ2oNXFhkhqT6dQUkgBoorBqIrUzp1386JUZ/6kVj9Hvx1JOwp3QxpnK+Im2HNbHcfF9qrNdlDGIt13xQOI+EqksnpBL5vki3e4JqbvUIr5aR7jSQzt/AJsNJ0IzNBcdNu3drejCCXEfH7OG3D4s50qXEVBeQrPDs/3yBUkCtEeof/VGJNx4nZWS2k5hRa8LBjTPUuzpARSSg15Z+iHMELcO5TgaOD1CzQAfMOMxlzXUR4G6izlN0CFnfPfB5f6n1BRA5Bm1bC7lbr1UzoNmHlnSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhZkh2BTZE9jc3/H35dQZ5/Mch1Lp4eV+SKPEmi47Xw=;
 b=NFcKhYzgVvegeTgHKgTBz9VbYQQGRr65EjjudDPMWu7oXdR0KXC2LYSvKy0k48JDAWAhI2sv7eQ1aqXDE1+AUC/kx+dku7cKSwMLwupNTlv2ELBGE/mHJSFRD1P7CN4R+Y13kbBYbPu1mQkjKCKqSYFQNz4wJVE3tUN4+TjxBkmThFRJybTFu1Mjnh686ihFByyopAk8AbDJuV5kMQEY+/ReIWME/ILMIXWSFbHObRM0sBnEMxHAALF7jz3CmvmWc+nK5WqoFOUit1qlBPRA3Vz60Wcv3PJW59s2Kk1Ua7Tt91F/bqBJYvVIlCOdiJWzCLLxf9fQ7cn3kX6xZSqVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhZkh2BTZE9jc3/H35dQZ5/Mch1Lp4eV+SKPEmi47Xw=;
 b=YsctUptmtXbkQO3PICdGGkoAr+5y/3c2iA+fW9oBGhH/P+OyAevnpGR5xYadVFIDAV0+40cJBHq4ske7tTnvd+A4TMilOXydkTdKv3vFYWVESg6J5JUij77fvcFdmvQ4Tl5YXA2kcmM6yV5BBlLeCuvyd5NH49sqAnQ4TEOvx0wDw0H1q4mf4UW09MU4QQVb+K+4aX+U6DgJioSdaGabPkVrGhE0xU8gZsl9LXCw5IhZV015z/XvfW2t2as8sL5C9tXjMEwPD0RRqe1G+Lh170T5TmF2SLtzKBZSTQpXuDMuh3YOJWw+ESukkpOq0Y/1Ol8m4cMnMmg5qDmuMFiDfg==
Received: from AS4P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::15)
 by AM7PR07MB6819.eurprd07.prod.outlook.com (2603:10a6:20b:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:00:03 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::9c) by AS4P189CA0012.outlook.office365.com
 (2603:10a6:20b:5d7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 10:00:03 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 399B94020E87;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 873FC700EB53; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 18/20] lttng-ust: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:18 +0200
Message-ID: <20260902095920.2840293-19-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|AM7PR07MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dd745c-4757-4548-4b54-08df08d8f5ad
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zb9O1s4ovrdMMr8b40aeno2Xs/PT2eYoI3verYeerfrsSBf/kF1V9Jo+U/c3sqPqnfxmcevZrAPF3iv1hQuga8lrdYeMg6xfaHtEEWizxJ9tpUNSBWvXiygeSSwNHPfP1YNw+mqJTtu9UzAKvmeVvthtZu266wl2tLVN9TbUjsgGqH9q7G3HbN3u52ZFmgRbWre+YlDkMR9rSl/MLk4ATNxx8oeWRkRdXnINrGdR3TtI2+LWlnbWO/y9XGyukCbuDz3zSPnO+aKysRy0h4Y0+NQcDHhuPNvqh4hDNiYIZrMlbzgn+L8mVvYKGTJG3yQfFqxUkO02jbqg0kV2GlfHnPCQSTxEbeWuFE4f1CPG0RR04h1krXZJZQSdnQSwjng4dlk/B84h70NryomLoTfk58uE3S+F50+09U9iQuXloLPn3xv7EUkCaF2Sa4itF7PLG7KkUoFIgxjd6CVo2CJy6Wo3BzL90zVk0zoyXRA5Z/+ud+l9Cn2WcfnkW7bmgKvUqXGWgd3YJwTIJRCbmVbazXsjdsFV++SbW288yL5hYYz9n0FJ/zh35u4bPlTyCcLwRP1hCavaL3ajtFdqY5BWeksTFySB428EmfiA3JNk43Ka6LN4/qyRn5fuTNCWPLTQmDov/6lpYB6VrzW4jj31ng==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mWnTp913narWau/dTFNCX9tzKQfkISYvB0JPu7rr7u801QT1X/YY+45XwxoHxqH/pc8nuouH5OcUapu7SiHd2N8Kd1kPlCsS/9uSl+gEW/Ntx1xXzBBrge7uyHqCeBhnA5SBfENFaP8M5xjK/NH4EzS76WDXxBFFP+8NuiaMPKeJNH0iJXkL+kupheEPxBfgs9DEWYh0771aiPKdD5DV+p4xRuEwp2vz5gOhRtg7LXOMv9G35YqCRp0wHg98MwYni+uwdTaNH6eZW0mSecz4nVWUDxytRwL3y/TYo3I4LSklkv8aAxc5+jqkJZjZhScbxBMCYluwWkJtoooXr5LTdI2y776zrjdHGgjT1EgpkHBImnWoIMwKUTGDardmB/0QzXPTJg5zbNd9ZHiixmseIXpqrcbHALxOzQwyVCJ0cjpYV7FqGxQNlHOzKluxG8iP
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:00:03.7036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dd745c-4757-4548-4b54-08df08d8f5ad
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 10:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244926

From: Daniel Turull <daniel.turull@ericsson.com>

lttng-ust maintains a branch per minor series (stable-2.13 through
stable-2.16) and releases from several at once: 2.14.2 and 2.15.1 went out
the same day in May 2026, and three series together in February, 2.13.10,
2.14.1 and 2.15.0. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades"). There is no written policy document, so qualification
rests on that branch structure and the release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/lttng/lttng-ust/tree/stable-2.15

Upstream keeps a ChangeLog with a per-release entry list, and every entry
for the one point release in the current series is labelled a fix. 2.15.1
(May 22 2026) covers a negative error code on incorrect message size, a
shmp() return value checked before dereference, an underflow warning in
zero_file, uninitialised LTTNG_UST_LFILE and sigevent structs, close_range
inefficiency and excessive fd-tracker memory use, and a NULL check in
ustctl. The one non-fix entry changes a likely to unlikely branch hint.

Only one point release exists in the 2.15 series so far, so this also
rests on the 2.13 series' record, which ran to ten.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.13.5 -> 2.13.6 and scarthgap
2.13.7 -> 2.13.8 -> 2.13.10. wrynose has taken none and sits at 2.14.0.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to lttng-ust_2.14.0.bb (upstream: lttng-ust_2.=
15.1.bb).
(cherry picked from commit a5dcaef20fc91539efa08b47607c4c91f4f49849)
---
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b420..4285a445d6 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -11,7 +11,9 @@ PYTHON_OPTION =3D "am_cv_python_pyexecdir=3D'${PYTHON_SIT=
EPACKAGES_DIR}' \
                  PYTHON_INCLUDE=3D'-I${STAGING_INCDIR}/python${PYTHON_BASE=
VERSION}${PYTHON_ABI}' \
 "
=20
-inherit autotools lib_package manpages python3native pkgconfig
+# lttng-ust publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches, the same upstream and release model as lttng-tools.
+inherit autotools lib_package manpages python3native pkgconfig upstream-st=
able-release-point
=20
 include lttng-platforms.inc
=20

