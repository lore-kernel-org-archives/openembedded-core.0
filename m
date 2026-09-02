Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A2FC79F81
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9247.1788343181015361508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=V91nUqzq;
 spf=pass (domain: ericsson.com, ip: 52.101.83.54, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZdsHxeSllWyUvGo4eY/0bE0uFfZn1e2CeDDw+hdKTHKkW7kJxi0S0OpqejM1N+L9NsaOnYarozf0DkrBDTFCVwd5kJGAUIXcEjR5+EkMK1vzYtzpnwhr6gl5iXo+qPmic8RTZT36Z/g5fC+hbIhkQcoSorEJjQmuNGvL5RWK7keYHv/J/0lBSXvzxGMfVmmtjRZHkrVlF4gxj88pVXDucMA8ZgF2wK30jg3YfY2hHa0zmG84UKDYGJXReKkF5PtbL7M7YS7wcrlf806Ez0puYz9Xz0GtDHP5rElQZhfMXOnenHUsqro21/W3jqxjbtmmkKZufG323vjKnB0W5K8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csiTYmiB1Fdi1qJUvlhe1hR0MKdfxaYjhv8FsYHhA9g=;
 b=I1MYmfFyYl255ksRcV1M8ZxsXWlS4E0Ok0vqbba6tPi2Zxo7SdhwYPP7ASE9+Vh32KyccLbhcBsQ8iVGDTjtOokpvScN+VGtiOimbc9pTOewNywkWnQnfs3/0HWmdvK/gIj9BbdNqHAniDXBoepL3IEBjXd33u8fKPwOts61k7Bl/Pqbt95EWxnQn1B0W/U5NyCyTKmKjz3i7ZT9f0Y5dmVk1pXz+XleOm8/o1ZYwDSp+0kRiCzsHOL3KvC+m+wyqDoy0g6w3tZziNd1qwJBPiSriRSpmfbvZhv+VFvw+VrudoIPpCA4l3gK3zjl6wxjBKdKrp0rKcEG9WT7/ZKCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csiTYmiB1Fdi1qJUvlhe1hR0MKdfxaYjhv8FsYHhA9g=;
 b=V91nUqzquDClHw99eMf+1MUrpgjZ3J18PzJLGlX2iSfG6pTda833+fMtpAHgEd8JCyDdFdFJXWeh6brP66NSIz1Be+PMG0laorzMkHmvg7un3CR/JL4APcGAzaSgny5qjXmWrDYQCPS+beglFykLCzbanMS0nRBSeEminmjsJ0hfNCLZMTdSIEpIqXOYC51lrtTcBTImtwXkaWcxO8KnKAkl+EO11ysys+F5sw6JMuryni3GnzmgmiOguRfPxx4rPhMNO7kZrvH5oWCEOK4DDsJeygjI/12vSdIUtEMN7jIQdATcpU/MA0GJK1ot0PBVWNqfc1ze8KXzaAyK7XnmHw==
Received: from AM9P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::28)
 by GVXPR07MB10217.eurprd07.prod.outlook.com (2603:10a6:150:227::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:35 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::7b) by AM9P193CA0023.outlook.office365.com
 (2603:10a6:20b:21e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Wed, 2
 Sep 2026 09:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:35 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 1FECF4020AB8;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 63CF0700DF7E; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [wrynose][PATCH 10/20] libxml2: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:10 +0200
Message-ID: <20260902095920.2840293-11-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|GVXPR07MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: aee969b4-b408-4c1d-b5dc-08df08d8e50d
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|13003099007|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EMKw3AJVNyLZlrrjx/dYJX/jEFRDAb4fFCsekTXA/5J0+DnPjx//CzDoppz88oUNpKGNoWaLeLpd8W+LBzYLP3Bh0U+h6OVroX6tRwE0eHFVyvU/jzqLc83fDGO85UxVQQse8iunU1zyRcU4eTFL9AwxoawNWRjUhp47cI+ZKPy1HybSMSxEeiS1s8em9gMoo9cAP3XtY90X62uPytSY9NuxIZYyuOUGa0/Hxy2dO5ulTA0P3RH7c+zQkDD6qCAdzo3wMydekWQJLSQAtMJk8Gaijb7zWAEKtAKo+qw+BeaweEigUX2f4e8e0Mif+CDdvsyL1UhyK6WTpYX+f89xc619OC1Fljd+K2nsL9a24DAAiu5sLBW46DS7OYB2IgI3vBKytKPQWf6OoNp9/DqxYCnVlWa6HCvMx+vdaHtiEEq/SXlt5MkY5CoT6TlvFq13Tgz098taeZEWhItGcLZlfSkMhXqg9ZnNJKgWm+bOvh+aWex4ZFibfBfkgqDb7JxPxGRxYwkxV3LZZHiezlEZq0w62iCPnRtfSSGda3I3IbK+6enQWSI/Hn7/jnH0kiyGS12VM1TDyoqdO72Cgu275X6+Qwf/sdRpcLtNWrWJOW3AgZakt8MmpxUWDiPZZrF1Ofm1mKhJ/N7/QxqYEDkMUQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lPTCb702mWJwIJd97uLrwE3TiD6kF6ejUCP26iemoPhtDdSHxh7L6bARxucMcS1ueJdK/rybk+vCt1N2mFgHPwsezhTv537RUrjiclvsdA42EFO9ebzC/4EqcVvGQl1oas+LAOZSjaGI9DZyE0IiixhrDOqsLRHb/lX5wSeYycnylOHptYEoBqaeZq9vmXOn+2HUB8b7voFYjRit6mUaNQNO8O/1YLH4tlFa+FOn5UxtqKa0dYE6TKgU0qthVWM8f0SFhuHNBRJe7oN6MttH+ZsxABfGO6onZYQIZemUWNmCcW9UA//t2UsOOkfgL2YSwqdKRkOya3VGqtCIIk6dsLWj6LQMg+BD7flvXwcWm5eWgqRifgxECy/rPlbqofLsuJI9mN3iBdmU8fIx9ryodw7gUF5l2dKeunxd/vN7JlQ4FPsK3ZADfccDOnpxC8vt
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:35.8156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aee969b4-b408-4c1d-b5dc-08df08d8e50d
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR07MB10217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244918

From: Daniel Turull <daniel.turull@ericsson.com>

libxml2 maintains per-minor stable branches (2.9 through 2.15) that take
only bug-fix micro releases, and releases from several of them in
parallel: 2.13.9 and 2.14.6 went out the same day, after 2.14.5 was
already out. So upgrades within a major.minor are stable point upgrades
per the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://gitlab.gnome.org/GNOME/libxml2/-/tree/2.15

Checked the last three point releases. 2.15.3 (Apr 15 2026) is five
security fixes plus an "Improvements" section that is also entirely fixes,
and 2.15.1 (Oct 16 2025) is security, regression and build fixes. 2.15.2
(Mar 03 2026) is five CVE fixes plus one addition, a --xpath0 option
confined to the xmllint command-line tool.

A public-header diff across the three shows zero added, removed or changed
libxml2.so declarations, so the library API and ABI are unaffected by that
addition.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone picked up 2.9.14, scarthgap 2.12.5 ->
2.12.10.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Adapted for wrynose: applied to libxml2_2.15.2.bb (upstream: libxml2_2.15.3=
.bb).
(cherry picked from commit a9fd7975e991124b8f54c4c763917e705fb4213c)
---
 meta/recipes-core/libxml/libxml2_2.15.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.2.bb b/meta/recipes-core=
/libxml/libxml2_2.15.2.bb
index 9181949ea5..660e2dede2 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.2.bb
@@ -30,6 +30,10 @@ BINCONFIG =3D "${bindir}/xml2-config"
=20
 inherit autotools pkgconfig binconfig-disabled ptest
=20
+# libxml2 publishes bugfix/security-only micro releases on its per-minor
+# release branches.
+inherit upstream-stable-release-point
+
 LDFLAGS:append:riscv64 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is=
-lld ptest', ' -fuse-ld=3Dbfd', '', d)}"
=20
 RDEPENDS:${PN}-ptest +=3D "locale-base-en-us"

