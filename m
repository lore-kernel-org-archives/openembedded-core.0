Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B74DC56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17371.1785852711981945723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=EIxxDgfQ;
 spf=pass (domain: ericsson.com, ip: 40.107.130.40, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBWaTKN/eSR93TPdSKf90duIlPFVGPEAsNe91Mx60KKhlvVpAOqQHd5AEkH3/BIhvlsd8F68aj/6wUmEDeGS60Jy8Iu6rqISBF4CX3DDXlLCuhkyAvammbEOid89JmfdQs+xeL6PKxMBL6tQl0nzmdMveifm9JVMF0cHyAemRobIEZ5gcIlP+fhDH+mF8S+7Jj/NjhZ4WuMq/lXZ6LImRoiGQz5k2fmHRDGCI/j2XnEwCOC7KeAVWFzi8k6w1CjgzE7JA+WsvAQsCc4EuSXPK/Qyy7FEEL1xViy+y1SevqLEHc3z5b+sy02BfDpmSQ7P2cAgg57RcVPE9zavAJsZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf9/47c6SbvJ/jpvP6UMSYk0NwZZdmqZkrNlItO86iM=;
 b=ISLqV3ppNXA+QR876wkyhqgc4BMhxSUrYIG9RKdzOtLjOWVO9wL820T0oBEK+FD2CthQ1xQ3BWjkayghWrGya+3SoebnyXcsiIw/EOaxdse24KfWoDjib/pnVzXUpHPR95HK5TAToCpD3B5ID35qV99QvqeUljGr90cJS2BqciEN3UexZav2tV+DstgiXbu/PvbOE87jSlhvLEU/cXn2tl23dO+vLWT86SQi4vfWLL1oSlGZgrmpbbavNyPcMSwoWRtNIF894qFODluZNEmeXJkrPgZrgKygtcKOxeSmChLlsdaPtuqp2WH8UpucYswRjW8eFGz+S03k4dmZ/MeBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf9/47c6SbvJ/jpvP6UMSYk0NwZZdmqZkrNlItO86iM=;
 b=EIxxDgfQ7gIQuh2WAXz8Zfs0O2YB3XCtV3QhdozZGl0A2oIjF6rbUkm6UK7PPYLn0QeKqRI/CPanM5Ie0rfkWVj9XWzSJQGFLcjWk2hQn+WEUInEEHS8MPZZAynAuB1KWsMHYK+onCdBpRW3tvuDF73VJMoyat8LTFrWBLGfIFP2U1kPzBFr5jn4rZv/CZw5E442JpfHMvZGqP+sYfYpN6zLGj8W0UBloZSFUkKMcGyG5WCEmoCpd4My/mLClLkoYe1EwEhpg4Q3NiDiayV5CsffTJMKAd/m3o+qVZtgwDCA428gbVoL78GAsi02aiQ8/aSy2md/ObwVtkKAupwadw==
Received: from DU2PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:10:232::18)
 by AM9PR07MB7252.eurprd07.prod.outlook.com (2603:10a6:20b:2c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:11:45 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::23) by DU2PR04CA0073.outlook.office365.com
 (2603:10a6:10:232::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 14:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:45 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 774A895801;
	Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 478D2700DF4C; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 3/7] openssl: inherit upstream-stable-release-point
Date: Tue, 4 Aug 2026 16:11:31 +0200
Message-ID: <20260804141135.3779287-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|AM9PR07MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: dee242d7-747c-414f-6794-08def232511a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	V3zxLBECfWSS2jC7GU4fCN9crgeXhtIZBB5xLMklGFS9KDx6Afkirrn/A/ohpYTfJgNMMsnq6zVqGBjl/JttqIOayJLe387NOpdsYRJWCb8tkrvgJGr/pSRSpOiPCBkV5mimgXMhATh8o4l/AQUPZK4Xk04e3q0ej3HPDGaRkFXxFcy8LaU9uMpYIDCMqExfWf6u6kB6B17RZcQPJlahZpE/75lVjiWl/ooOGObsHwHYCcOjnrnNxi7GxFaCtG953rlJ8Q4vdxodKCfXkf9Ie2PM750VJHL6ja8kzig3FpRydDXaggEmPSRhQhgaJM4mkld4mUth0gGMloZbRkKbZN7TF4xBKDnSAOBOV/uW5qGMhc9tZ4cW1EkHu8OpGbIu2Umw9SBGWR/wB17881eoe8niziH3Wv74t3c+hlz+lU1JLnRqor99ahwRNi7bTYb8tBmeldNk9sK1QEDLvBuj6mooRNZ4JWbuj0I7i+9cH3Z428sLYVjAq9c7gQpHAqImfEt6rG3+Qk9WLF/L34aLznMf9hniRoOMathU5lKDI/a6ePTqmNMEDTuzPg6egBJbImuAoLiysCiD+RUX55NplnodAqmAEk75f9lWE76TyHgrGUo04Ye6gaKpC5rFUiJy2HxoVa7Mk9ByrfQ+Mh9goQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FjYkWRwWTNDG0cNOMWmDIfrt/DFyhkpt8cf5pgGHHEiVw3G7lHEXwr+UGgEUtjHN7dXAXUQKZlMSk5MCKbIS4iKeTdCNb63qXpxoG6mVfG34VJkSkqbducFJWUBEdn5iyP1FHIhtULhn6Iozxg19eFCyNHJoSoEd5HI98jPscMJJsNFfjpBw80FaOfdrsysQ6wYLqaGg428mD7Qz7HVLCKvb1SAWnxBZywPvBerMwTeaMSw4vNNxwayJ5WNZNc/bXaf/hl34Cn+NvHM2BhrGkOx4uSl0zjUL+RY3msgLhLahFkfhfoPv3Z0Cw7uPCrAOPpInRVuVXRS3l5/RrD6GJJpa9Le9hcKjc5l8gD1PcGhQADvEwyiXD1NpedYIX9Szb7eb7Bhun4GjnTlCgafRVK47X0PxGUqXnmrB1TFR5WXItRYdUmw3ZLa+o0NeJvAx
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:45.5366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dee242d7-747c-414f-6794-08def232511a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7252
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242769

From: Daniel Turull <daniel.turull@ericsson.com>

OpenSSL's release strategy states that patch releases contain only bug and
security fixes, with no new features and no API or ABI breaking changes.
It maintains several series at once: 3.0.21, 3.4.6, 3.5.7 and 3.6.3 were
all released on 2026-06-09, with 4.0.0 already out. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://openssl-library.org/policies/releasestrat/

Checked the last three point releases. Each is labelled "a security patch
release" in its own NEWS.md header, and every entry is a CVE fix, the item
count matching the unique CVE count exactly: 15 CVEs in 3.5.7 (Jun 09
2026), 7 in 3.5.6 (Apr 07 2026), 12 in 3.5.5 (Jan 27 2026).

When a series reaches EOL the regex must be moved to the next maintained
series by hand, as that is a feature-level change.

One limit is worth stating, from this recipe's own history: 3.2.4 -> 3.2.5
was refused on scarthgap in July 2025 for intermittent ptest failures in a
dependent recipe, bisected to an upstream commit and reported upstream,
and the branch went to 3.2.6 instead. A fixes-only release can still fail
to integrate, so proposing an upgrade is not the same as it passing.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.0.2 -> 3.0.19 on the 3.0 LTS series;
scarthgap 3.2.1 -> 3.2.6 then, at EOL, 3.5.5 -> 3.5.7; wrynose picked up
3.5.7.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.5.7.bb
index 212879dfa3..1f2754d5e0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -24,6 +24,11 @@ SRC_URI[sha256sum] =3D "a8c0d28a529ca480f9f36cf5792e2cd2=
1984552a3c8e4aa11a24aa31ae
 inherit lib_package multilib_header multilib_script ptest perlnative manpa=
ges
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
=20
+# OpenSSL publishes bugfix/security-only releases on its per-minor branche=
s.
+# When the tracked series reaches EOL, bump the regex manually to the next
+# maintained series.
+inherit upstream-stable-release-point
+
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""

