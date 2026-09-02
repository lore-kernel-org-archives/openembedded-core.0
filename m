Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE918C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:00:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9259.1788343209693426663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ZbBFS5JB;
 spf=pass (domain: ericsson.com, ip: 52.101.66.63, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8wwvgSH+jAF/ANNheN/vLX8YXH4Ypb56gWCM/qwvwgh5DyS2UQ4UOiHoPVH5kYK53iN8Bn8Hrgy/5GvCujW0GZVP73lyLwpiU5ymMeO4OSTzFKbThyuoxSXo83vo5Ht6nw8Y5TXNCaHFqdKUI1ZA/CtnlQQ7/6RKDRO8ziCcP9cWXo60N59ySkyXnG7zjgCSG+5iIlkaMgMRLzvjISOrRkMprsN2tsO4vNSRvo4q0dM6GKlJt/i6YoFz87FmjrCa5YtEpttAiyN8ik0mkvyI63Ob7ea+hKNnuetfovvQBoolzgcgecWXWLyHLDND0cy3iFUluGAPqZzPhrKZuCUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVPMCt3EaXST5kB4zLW+tjebP7km8cSYWzLxbSDzup4=;
 b=aViVehnHfzE40PJC5QdpJliuuRF/tlTKcBz0wXq9GMqpuKogqx8Y0mTYWilhB+nAw1rrH4BhNXIeb0vxcfYvOJJd7mPKL3SjxftuZXryEVkchgOl7Yc7bD41OTao00qyhfRCazFOY48NbiqT5CSReWpB1HlULuUQYvurVlTY12bNDnt4xixesMvKa4DFyFIEelRNGJjtnCDSKjK6WUUqWXE4sTYe3JQdwHev6hCparEEXPJVAOU0HkAPRGXR/MN7xgcYyorDavLxEfuMuGP9knMkIoVzBuevVGkvQC/P/JjzMkC3xH/GhcCpoB7wosfNdZKmZ1kmAHFAslojm4tyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVPMCt3EaXST5kB4zLW+tjebP7km8cSYWzLxbSDzup4=;
 b=ZbBFS5JBmOokSwv1UmRaE1Ti9rigLwQXDTrSlHU/Fzc42dFfSgT0xPkgtkMwWLp0ofunDlHt3/c26kAw1SP9lfQVQodLKI2dv0J3OR5E6Agn/vp31LydMI9OShgu6CZhKpLJ9T+dhO644bTCn5yiYLmOlApiPlCW/400Rm/1U9qoe4ZEd8FtBBWZiJhDEBqzAhzlPaDZ0JnQrATLIY0MuRq8pQVhTBpL/CEMlCLO9Hv/zv3hEB04iRHqzI4lrsSmpUY7MQr1FJ2jJkSma+wbNTbUckxG/95qCSzjQIydZHCS+vOS+sDFZLjOmjji9Hv40j7txIDLRhiQF1SeG29fjg==
Received: from AS4P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::12)
 by DB9PR07MB7979.eurprd07.prod.outlook.com (2603:10a6:10:2ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:00:03 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::7c) by AS4P189CA0011.outlook.office365.com
 (2603:10a6:20b:5d7::12) with Microsoft SMTP Server (version=TLS1_3,
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
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 035A84020AA1;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6CD72700E7C3; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [wrynose][PATCH 12/20] openssl: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:12 +0200
Message-ID: <20260902095920.2840293-13-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|DB9PR07MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a62b564-25bd-4a03-5ccb-08df08d8f556
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|13003099007|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	eHhQuLepjhj97Fj2TwJmyoo1KkCYF9c5KRfeVqqME0yaTTkC86ssWASsBGORsvbuy5pYz8zn2Elq+HfdLFgZihvWRxuxpPB3GmGEhzLFkPd/GVyZkApFoHF8/uwcYPtH6rx7IQEyk2OGd0RDTPYhDmj2py286eh0dh1ZEHhE8b+E/CM4WAyVwNYmTm2QRnenmj+VnMSReKreAGfknJieFrBxKXci2cpOX+7YjwrEBoN9rDilc6WFhODytpQrIoStu/ljaXfo0rzzQCLhnr18JB3Gy7x0A+JOSsZnrOPnqP+wc8xbtk7LEfOornDZVk8Z9KHjNO1VU6IfcL/yDrcWq7pyzzYuk8UPhDWjPvRTBlRpjawxo9CJoK3kuGhshf0a7Gc1HphY69eIqoISyptNzr5vV2ryjUy/k/qoARcXmIud8lBoVwr8s86dNg8pHIbge0LNt+rMHshiJrm4CbqAGpIvNConulAMq1VXLN0cM5H4SOP2JaDK+8j2i1VFGdiiGV8CAJSPz49cX/cTQqDANh3j1PwzH3zGiuskBBiRyHq2IYdThyuAPEh2rISOpgA9HqX2fTKmkz6hZNyCvL6iXrTtEO0Nje9kOWmvk4sbckfHmNBCxGj7TBurTsgE60AxHM+C3v1WHDaUZXUXrXRwYw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tN6uB8sQo8eUXnByWYkIpmf5lmPJxjzX5n0/ETlGfGWx4AfbGOpgBMAXe/L4WRriRI2jUy0RUEXu38zs4e0/3M1ZRRvi2sia3Z81OUGglIPkDYv3sg3TEgna9ZFUuVkkPBHK5GLKlApAFGKhYjGLbHYhAGsUa+7RBLhgJwGsNB/VULgVjtk0vrC3qrc3VIpDRZbBprkx4gQ9PKsFPLxlheq8EIJ0gp5Ztxw0C+qcWZgaWOGVWGCPf6mH9DKQhZZiJ8XRjADx6mFnnbxCCZblni+I5n8kfpdubzkEInB2IYVsG/IPS1V3NnDLdt3wU1kYNexxOG9FFzSczvQrZAoUJip+03s5xmJElj2AEJpNz/U0/od1COSqZGbSvbhXvnbOK5H3MQvaDbIt3nmMBOZPZVi85xY2s5o5rDiZSGRfbg6DdDyBY7CI+Vmuj3iJHO/j
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:00:03.1343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a62b564-25bd-4a03-5ccb-08df08d8f556
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 10:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244928

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 75f78c58cf9e4b385ddf4f09668b7f1a49117d97)
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

