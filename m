Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC6510F994D
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:40 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107629.1775657853855655644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=iV4ANgHU;
 spf=pass (domain: axis.com, ip: 52.101.84.25, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svS+xL8Lrc0mkyNyU2bN+nfEgqILwzAcPasSk7R0zYdzuB2LG4nn6eBHVf7y26cU7rMRi9s6ILgW/MWXtJqT6l3ynH6JrhR+eaH7ZgDKfTUX1ddsfRHUiVFxLnOGdd3qrxUmVIEXojm5tm8oXiFGGHiY5eEUIt0MMxEhuG4xQRT2xOtTPrqeZx0xNzzDvBOzmMMYYP3e/bfAlrCWPH52bBJFlhyo29XIb/+0WpO7P0NMPnQYhc/2asYQbn2hcLh1svEKuhSj+QivOtvY3Rom++54MaIXcr/q5DGQJn1KPVylaEq8qNOViuJUsC3H55sP5JCgs7h0RhA7Q9dH9dKzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9d3YKLpj4DWEneIPs1NblqeLjjjxZ4mZs8rBDn2hjo=;
 b=ZFHSYuQC71fLJUG8PZ5OGC+mr4+OO24UgOHXn8B8id3PkXhG6pMjXbZzrTwoV1ft3msqY+pCHyaGHC7eOjpF1Xylw0E6N/xdO0Dsqger9kxIfj1143CxnTZvTd1cwQ0s1TwOa86mfmHQtkNXVCQE4YJmnAQ4rq6aXjFUKYdnSlM9fpkBYmMSn9zF6HvGFSXIDSR589EVr0TlcgdKgSySX7b+StXi2HS7aSht2KBQRj9/WNlO8aB6gFyhhBn5mGP01xzvjX0pARbChk1A46SMz+/+fPcBHegVWLNDeFVGz1scPTMUmadvOgkZivGNRBdlqUjhL3PS0gYwiluhTPHCtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9d3YKLpj4DWEneIPs1NblqeLjjjxZ4mZs8rBDn2hjo=;
 b=iV4ANgHUPULuQxb1u1oBaAWONxWedCjimUFiZ8/iT7CY6zU6Ny98L2X5ADABYbR7/0Ncfa2m4EjRBW3PegpbI3Ugq0Jw6lFCCFUqAsxSp7Z4INKcg1qqk8VpqvAumf5uZ+Rlg8dqAsKrlcuO78jiw0xQErWgLt63jgQH3sUc1j4=
Received: from DUZPR01CA0287.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::29) by GVXPR02MB10933.eurprd02.prod.outlook.com
 (2603:10a6:150:15b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 14:17:27 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::ab) by DUZPR01CA0287.outlook.office365.com
 (2603:10a6:10:4b7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 14:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:27 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8790F24B0
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 839391204FC; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 05/10] gstreamer1.0-plugins-ugly: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:13 +0200
Message-ID: <20260408141719.1086823-6-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|GVXPR02MB10933:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ce3803-6ef8-46af-7e29-08de9579902e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	6C1RIwt6TwttsUOKdXGvHXUQRG6ErqBCOSkgyRQ4nSoLG0JvhwXbFiqH3JHfJh8ncduKT6CJ3ZAH36R484/l8YEkIW+c2ZRMCNhcb82gzIz9s6VI7+83/RchvQBrOyNEWJ8BoBdVnOQinPyaud/IW550mTdrW8Yf7bBMbw92w1APh7lrlfRB97UIeoTxseL2fbZoR03y2n3DI0nFKDaIe6sqSdgly1WSnx0dkiqeOiKb57c9O/QdwlUOYwc5d/xN62pVsZ8cQeimnHWncZuA2PLNCkUbRz7HJ+9msj54EuX8p6I6ScSf/QAEGAr7/ftaH8vgGqLQeFHVOAf9Mvavrtwdpo7SuRKWUoWj+CS3RUbLuNgTcTx2SGbFNBExhTlgr87x1ui91fg2kW/urEGbF0iRpukLObpRUIEvyuru8V1lZuSs3WFj7XKgs1MOw14GNh9/R1l0NLI6uehXchXGU6AAqARWYlBMwd2Fox9j33OfdJ5xVtDHC+oepkb81UkeUatiEH+nxVdNqZPEVMiwgusBexDm3L/biaVNZP6W7Sjn/f2avekVfaOu5xRtq3UmAge7r77pQ/5Kq0EFhXgeYYSvXmS6Wmib1LPyr8XtnDG5DLzdGsP8xADiR+8m7GOLJclJEpF0c1yaRb9Mo9H3tyjBFYiDfRM1L0faG0PJv9nUtNrdVaEvt7dGG2v508hYRKWaCPav4uXotx/wAak2BnHsXvdnq4VDW023/Cpcp7k=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zp/QqGLnHXlei1NQ/1O0Y6oqWact4//wLRfvpBobFUSE8luruAzSGLbU/nw3UFzbXBSV9sySX4N8Um/uWTgFI6FHaBSEacsOqVQq/4LU2widEFghtXiXNmGdtYfHghmDabyiIVWVBfgqfu8ZSYEtn6c1XMlqu5gfPT086WdfYSHMX8Tnzu1ULW0WvlAnS306rE0++76AGrJ3EekjmdlHM4DXZYxBQGYDu0xPTHdjBVhD6WjrTM25X287Wohj+zapZQ4SWqU+FlFqK5eck4AKZrjPKS3fjMXUGOe8OEvjKbgCwuC4ARgTcakXagNSaUsXxFUoKGwMGo8tuA+qCtNhB9deJ5mfpOETnVR/+Kuz44ifCMtR+REAkpgJ7lkzGYQihssPYOJ4lsu69lVpInxNrocAPORBNaJ4lgaMJ4xrXl/Ah6i4e/kPxaXeLC79ilyJ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:27.5234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ce3803-6ef8-46af-7e29-08de9579902e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234843

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 7694a7d: modules: remove subproject README.md from git
* 6376a84: modules: dist common files from monorepo root
* 8f9c0ad: asfdemux: Error out on files with more than 32 streams
* cb184da: rmdemux: Check if new video fragment overflows the fragment
  storage before storing it
* 3bcbda6: rmdemux: Avoid integer overflow when checking if enough data
  is available for video fragment
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* 37274be: gst-plugins-ugly: update translations
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ugins-ugly_1.28.0.bb =3D> gstreamer1.0-plugins-ugly_1.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.0=
.bb =3D> gstreamer1.0-plugins-ugly_1.28.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.=
28.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2=
8.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
2.bb
index 94fdff5b05..1f3df47303 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.2.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plu=
gins-ugly-${PV}.tar.xz \
             "
=20
-SRC_URI[sha256sum] =3D "743f28b93c941e0af385ab193a2150f9f79bc6269adc639f64=
75d984794c217c"
+SRC_URI[sha256sum] =3D "fe39a5ee7115e37de9eb65d899ec84c93e6e26ed3ffe25c6d5=
176cececbab572"
=20
 S =3D "${UNPACKDIR}/gst-plugins-ugly-${PV}"
=20

