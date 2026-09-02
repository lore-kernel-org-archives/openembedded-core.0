Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF1CC79F83
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8946.1788343177301910019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=jj7hBQ+Q;
 spf=pass (domain: ericsson.com, ip: 52.101.65.52, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCWNrWY4eFpvRmNXN/LuclQNOplSmakPZ3ySMnzZOjP2OlBhLvOMXltYDweeg1EYzn3KM/mC68+A7vt4eKqfG0QkXlIbF1cq1Kf2Nl46Z3gbqdfKsu5XanW59t2Ct96VZaa3eKZqaaIXHufXRmUsUNhgE6TKXjaZ1dkenHWnP+lmIi91rzdtBi50wVt3hUXXyLjti3fjhhElYNXSbX5ztiaUDLJyNToqpko5RVh/XFsH6+jaXPtMcNA67IQWZx8C1vJSWjXrNboXdeDS0clNJslTuJ2VhYE32932i+rnsxZQAW5BtgH5V26x7UmgMT/j3q3UMdyXFY1rbPDkxLBKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSrMZ7t+wOORDg6usCLeyxxhQWHp4nVqWVZAXnw+MZQ=;
 b=PJdHUoziqDgGJJtijytgFInNvIB3pSisX/rEmYekaP1qUFTfpbflCfX7/HvtVaeL0tPeOKkwvz2W646aPiptTy8R+C81ylGuHElRCfcoagfNHEHzhpoZTxK+KsfuwjzqnA3EK4urDDWyW4sPEGZZWR5kuzTqrQDBYTa7RhbHl7SzuIgJAZlxWjgNMAaWZ6Z0242zXY4mYedNt+UZ3a+42LxSCJlN/tBBO5M5v5GfFP4GuZWfg+MEkft8ZCoGam1kS7igKFslxRJMZvlKQ3WF7h5hQEZnVinkthrUlgo41M4821jGuOklF6HqKii8PzAPJsK1kC99FvtYbXtHmnf+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSrMZ7t+wOORDg6usCLeyxxhQWHp4nVqWVZAXnw+MZQ=;
 b=jj7hBQ+QDHqqShHEHOmYDIU6jw90fQS0/UoG2Y95PUCIuH1Kp4UM0oyBUkQu5fPCvTRAtuBqN+AIw8Dg9hkqbeFrOdgebh7e2W4lGiPRxGCVgYPqGMqpqEBNtJib1APWaJUv4bt8K3ioGv1IVU3gXJ8e+lllgzOTO8CKAQ964NeXU5nBi8FqrMdg+SBPJXAOCMiMtN6SUqsGVDDNejjDetSPtCpreS1RRd5cra7koF4y9bw4mCJ5ljJJmNpx73iqapsQU4IZRxKd58i9bs5F1yjFhn+TDIWPq5ud5Ehy9Gies11oLcD2XnWYaNbX/Fb5FOEqSyVRSDPMCsCTbJxgHw==
Received: from AM9P193CA0028.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::33)
 by MI3PR07MB12267.eurprd07.prod.outlook.com (2603:10a6:290:7f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:33 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::31) by AM9P193CA0028.outlook.office365.com
 (2603:10a6:20b:21e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:33 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 81AAD4020B6E;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4CF37700DF77; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 05/20] glib-2.0: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:05 +0200
Message-ID: <20260902095920.2840293-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|MI3PR07MB12267:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c46a7c1-5323-4d23-7c7b-08df08d8e3cf
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LP3P+WerF9+Ta2qxQWPG6yikVqgsjV0j3vmPOyHYBQByNcSPhcC4wHfZfRN+xvp7P1RhNX0avKH4zupJlg5XGQ1k7G21VYhDUWRxpWlJYLRxbf2vF1dldj0n+eurxpC209CVuAYEoNzK6O5VELuo5qwKjWz1bFBz9dadqLX0iEi8jVUOtONfuSkGS3EidJ6plESsEOvdEi5HUQHYRuZmaKo3sRg88dEyM19AQuecogNg7ZrG5eu7Yfi5AcbcrhT7JT6x1Woos/dxqkuQuZ0oLrGl+4RSXpQN7oUDQLsrgFZWNU8XbxWehbUIipET0IZ+f1U0GTTHKZPvZJpCtzBUriNzhaMiW4SUDO8G/5tpm2Y6ND6vF2QtQxNUzTd/lNlH82sZ64tZuG3MaS4Zix5QEh4M28xIbcCcRgBJ5U+KXzeBsatoAWhEvX1asjFw32gZK6SfYMe0TbcRAo3nk4yibdgNzNlADwaCZvhd/utSkILzmvt9k9lXknHu54fR2vq6Kk/GScM/FguejrfybGSvmghNYBQTtyzhtAZ8oDzIUQcjQdgq2gXcyGTk6HZFQ2Xw/zLsEyHrWE7UgwOwOvQLrp+c8YuQjw/AzzKrZTQZyJEM8TuaHHUw70K/aL8/Xqm/JBJBYlBranXV+34JMZ0Kq/w0xx2u5aHQbSY3u4aTi3o=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iybXnO83TU+bE/1it9JEKQkns3t0/K5URn72kNWvbc3aYHyIqOnKwgmLgwY9dGcn/0D0ZTR6sAUmbZiIM/PXISv/RmSIsINMqJiVacHk6idC0OR70mLv4dWCG631SZeQMEcMOtHA7YeUas69uXfNsyxF0AB2S6/nDp5dUfERJ5GsIhGm+JC7Qw5ZIpk6IcuIPWg75nWgOmGa7kdoWTm2Nhk0uPVIkmoMAJCmEgkj6l32OmIAt4E2ivui5HmlVj4xzp/c5eE1nH4t9w1+qFpwKsgGOMvy/o6Y+F8xtuzMSdjZAMec0JUQwHYScv4a9CTsrWNCvsSTaOWtoeqxBESXfX5inYHpHw41U09sEakXX8IBu7vdMevDz+FYEuCFhFzQNEl3f2ON11rDDR48VNe+B5aNQ8wyJw6FPVVZfKOSVrROLq49ij+Ja8+GfG5czeff
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:33.7221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c46a7c1-5323-4d23-7c7b-08df08d8e3cf
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR07MB12267
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244908

From: Daniel Turull <daniel.turull@ericsson.com>

GLib's docs/backports.md states that only bug and documentation fixes are
backported to the current stable branch, that new features and API/ABI
changes must not be, and that micro stable releases are intended as
drop-in replacements. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.2/docs/backports.md#L18

Checked the last two point releases for feature creep:

  2.88.2 (Jun 25 2026): entirely "Bugs fixed" backports plus translation
  updates.
  2.88.1 (May 02 2026): seven fixes -- a GCC 16 miscompilation, a GRegex
  out-of-bounds read with security impact, and five further out-of-bounds
  reads. No API or behaviour changes.

The series opened with 2.88.0 (Mar 16 2026), which must stay outside the
regex as the feature-level release.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 2.72.0 -> 2.72.3,
scarthgap 2.78.4 -> 2.78.6, and wrynose 2.88.0 -> 2.88.2.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de7017a3161ffb04f36e9c6ba2f7ead402dc4a5)
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index d49ae13168..cad74f53f7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,7 +30,9 @@ LEAD_SONAME =3D "libglib-2.0.*"
=20
 GNOMEBN =3D "glib"
=20
-inherit gettext gi-docgen gnomebase ptest-gnome upstream-version-is-even b=
ash-completion gio-module-cache manpages gobject-introspection-data
+# GLib publishes bugfix/security-only micro releases on its stable
+# (even-minor) series.
+inherit gettext gi-docgen gnomebase ptest-gnome upstream-version-is-even b=
ash-completion gio-module-cache manpages gobject-introspection-data upstrea=
m-stable-release-point
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20

