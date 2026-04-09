Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31F2E98FDC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:59 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128347.1775726992297744380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=tdaChy9p;
 spf=pass (domain: ericsson.com, ip: 40.107.162.4, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gf8l2hhnhspra8fnDeDJYaK8BGDelL6vlei5B0eO4aWTj6MVprZbauXjmaprkkzqhXRIWinTPYBDFvoWnR6jNFCjQB+on2t/QKwiiuMNZhKSB2ccSQ1atOwYjBFimarmCjHJKjyMIChjFpAOA7ZMAUAUFBrIAQ8G5lkCkwZmELFSeyHkazwkXE0MbhDf/7MPDAWSQg0u87Bt6zsyY+F7338mpAFBypEJQ351zpFNsqFDYDQINwspO9DFSUBcrUWkmzYQWOpoTGbpF5+ywj+cSP6MbLsnEWBWf8p4w+PwBV6NXhJNRbxuIC6Ud8omyS26DPc7a2R5cIElN4aTG7nw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6DUIxpCCODFRvZ00G5Dkc02K9Pb4bb5EpByBuHpRxM=;
 b=A7N3+Z2fBGISOH59qEXdY4eSzjm79FbH+vGhR2MrC+E4DkUnBhc8mKcpdcPphWH+ZpUGE/QnfvIsXtDM7m07nJigByFNl9oe4X97jpwdB60lMEMUPW9EQiaLrO5auLECi8o2WVqBTyQbUNwaFk4OzoieE/0FZ1ew7bzgvHCfMdKm6Ifdocma5vNthjzMgFU9kAzlcyBAGuyNXFe0M0F7vSpa9+9TpP7OXjpCPLSsUEjTJ5D9Lv7QBhImriYmfcW179iJy3Wy2p3i0zqQsxh6D7iddwj4rF7WwGczW9+YA56bPPiCmQhwe2MXwPg5cPYGuFAXwgIqp1VsMqB8NJ50Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6DUIxpCCODFRvZ00G5Dkc02K9Pb4bb5EpByBuHpRxM=;
 b=tdaChy9pacGXUTSBPW1mYx7wzcKtyszQTh7CCWTOkUnAVgWLIoTb1j88Uar6PV/t1+0i6iG08WKlo4v2YKSzJB8lYiWKyemkPCvcT7EXvhzdJWICDVM5PC1b2lhNxfETelBD+Nh8EuXmyI1hMfHdnXqVAL+9TZFTjTVwpZVgPUDleuq3djeCGqgJ4yS702TsL15EOkVpAx0odxA5fZmSJj41ctgcPkNLknQopXKCihS8NbRTQ9wYZQP4PRnuQns8J8ADwQhLw23r1QgNok4yMb84X7Fv+hU1VsLiA5k3mCrYgJyKC7CPHHFWNPJpPYVo+FZNOxm/kaBvDe6/bHMyKQ==
Received: from DU7P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::34)
 by AM9PR07MB7076.eurprd07.prod.outlook.com (2603:10a6:20b:2d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 09:29:48 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::f2) by DU7P194CA0019.outlook.office365.com
 (2603:10a6:10:553::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 09:29:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:45 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id F235E402084F;
	Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id D71D4700DB94; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 3/9] python3-requests: upgrade 2.32.4 -> 2.32.5
Date: Thu, 9 Apr 2026 11:29:30 +0200
Message-ID: <20260409092936.1740143-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|AM9PR07MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: fe61f4ad-ba40-4bae-ff67-08de961a899e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PHXqchLVN2j+OR2aNCDpMy2FAn96u/U/kLE6x/cDWActI1dnic9OHmSB6c8NU9B6gnuxO7knr/84xW+lPHUDMbq1aXPfol5ihlqquC4YrFUhbvQviD7wz0EVR3xYFnX4q3e0vBJCuN5a5ZNAWHVY4FgesDjzu9ROIHaXBEs5xG31FodENHsCXh4ibRWrzAeIq+uwFjnNbMJHnYD/kkO/tN+NsYvEbt5992snM/1vPbVGYHRSZZ9bQ1YTTPRQZZHvzBgJzJ8EOUiUqkbnNlC7sDp+cF1KFJBM+XoqwyB86OjfSFWD2Bn4i1J57fdcZ27HjloLCs5l47ZkMseOZz3r4dvYcmDvSejtp4OsKn9xPv8VhynRGd4ULxTViKJURsak2hMriK/i1jIikECydoZVrY6mJZaSypvS5E4+Ml86uosx0x9cTPxybW9c1xVIJqx1EhDco7uXksyf6jACZZGF2QCfL54nNhRhfMH2Wa+lmKz5ru/IuOSQJTmy9T/oaRGWCEGeY40w8O3vkoMuZKGgD3yifdA+TQ77TW1xjLZjU0v325uqOi34jSiJlvqzD0Bu4RAPhCRovhwSV9gV59vCshqrMrVwVq393nlOKB8H6tyrKCRK+6NODzx+3cNL5/s0/SDpiAumqwJJkMx7oogpukDr6ArQWhuzjBN1x7VKgRhxfkIa3UPcGV8JfJCfx8xtErgXVoky4iEmXobN7wZoYOeWjh750FSVDkSBurqjJYHuClcrS845OH2S6j+QtlgT419EWh4fVlUSqN4IEz+MEQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nTPvrkHArVB3Q88we7zunb9/8GUT73LyT0DR7B8v6Oe4B4i0flWL8JUngeo4ij6GSZ9gynkFEBKw7M662Guwyc97yf3xRVxj68P70XP+fOTABbhxjD7pnE3ezfp64Ke79tqmSKcSMZcBdHp7AszCMrJFwXbnKXJelrK3JP05XwnY9qNuvOFw/IitRXeu1T20ibNNoZvmJaN1atgaRK1HfPFcBdAUtKpbj3JfZkm/+diSshbXFXEzMGd9dv5iPaBWpacUHLufgl98PeopjdIhT+6fJ/m9iG+WMeBDnFjdnMYB/D7i7R5lfmiR2nR5ZoteNqCeqm4vedfPGM9XDLCwWchEIBbPDnmqbMnXgdx7cCPvFVXK1jVaQxR32Uk6M01spjXbnpDhLYXZnRFtS94/ALoLpxHMUVTyGVN5rvhu6Azlimdb7nTwxuynv+3Ydqxv
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:45.4605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe61f4ad-ba40-4bae-ff67-08de961a899e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234908

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for python3-requests: 2.32.4 -> 2.32.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

2.32.5 (2025-08-18)
-------------------

**Bugfixes**

- The SSLContext caching feature originally introduced in 2.32.0 has create=
d
  a new class of issues in Requests that have had negative impact across a =
number
  of use cases. The Requests team has decided to revert this feature as lon=
g term
  maintenance of it is proving to be unsustainable in its current iteration=
.

**Deprecations**
- Added support for Python 3.14.
- Dropped support for Python 3.8 following its end of support.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../{python3-requests_2.32.4.bb =3D> python3-requests_2.32.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.4.bb =3D> pytho=
n3-requests_2.32.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.4.bb b/meta=
/recipes-devtools/python/python3-requests_2.32.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-requests_2.32.4.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.5.bb
index b86ecfba52..930d48fc5c 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.4.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-python3-requests.sh \
 "
=20
-SRC_URI[sha256sum] =3D "27d0316682c8a29834d3264820024b62a36942083d52caf2f1=
4c0591336d3422"
+SRC_URI[sha256sum] =3D "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c=
3af500cec7d7cf"
=20
 inherit pypi python_setuptools_build_meta
=20

