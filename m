Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0629FC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 18:25:09 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.137])
 by mx.groups.io with SMTP id smtpd.web10.22454.1699467905487172804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 10:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=NZkfJZOn;
 spf=pass (domain: ni.com, ip: 40.107.223.137, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDV3m50l9O51qt+aBvSa6HzUOLtSdsqhSWIlgvOtq48NXD1YNSRYreK5icGyhKV1wDXZqcQwSWUa5REAt+eAod6mOTN3H4Db0sangqKNg+dF5T2hfrJKxBe2eP/CNIkxXOZQz4HF2D0iATgUwRjgHYPG2adr32isk3DIVQ8sTMz7eM09S29Sn1Rxc5raeYKFYaeRQTlPuDIBO2S/Rjl8z3S1XT3vKov6eEnhuypYqLmSVuXy10lPyCDr5K4IhQAV0TiHeXF0GCqy/j0s5HPtN8C07twakh/Q8YaSwg0s/9X51xMSXOEQ8nrkDEeLuBdBP31UJFDmSStqEVKnxcyDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVKstQE276SXmnPp5kK9s//MNXbFODqYuTLBPlRxDzA=;
 b=HhLIcDX32HUonN6lKrFh+pcsC9oUkI/jtnHkAEEKYX5XMmqpju7mO93poZPc0WL9AOglG6xFIgmHFAD6HrSf3rclZQmnXJUItcDRvnlwtmuvAbSxTV1JrIX6hCwxRCDfe492F1s/UA898sCKPX6UkVjT7AY9pg5LtrxVE40Dt/l0dhnwki21YlhwnaZBoCOGcI1uTMX7CyC1mOrXgu0G2Iz8eOOpVPJnBvFzELtZ/BRbHvwtgP5W2XZ/O0wDNmyY7Ch+xiuwrk7vrLtk7Zu+gWa6pEl9p3yPk8m0e0rzWvJfXtoQGF+98FQOcO4+0Rp5glASkItpWCAOo6NC8LTCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVKstQE276SXmnPp5kK9s//MNXbFODqYuTLBPlRxDzA=;
 b=NZkfJZOn0yTVyWouZ6pRO/mrIbr0llyOukPMXSCM8s8GAqEcJjj30mYQFVbSi9nGrZ4PxNGoT9JGhP1SRT+d+wYpLmJ3TNaJ5II7RvtyHY71AmeAVewA8pPZ9OoRpe7MUQRElC5e0fW1IJAHeZlDAz9VqFh3yF1k9ghBgTLDd5w=
Received: from CH0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:610:e7::19)
 by PH8PR04MB8639.namprd04.prod.outlook.com (2603:10b6:510:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 18:25:03 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::69) by CH0PR03CA0224.outlook.office365.com
 (2603:10b6:610:e7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Wed, 8 Nov 2023 18:25:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 18:25:01 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Wed, 8 Nov 2023 12:25:01 -0600
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Wed, 8 Nov 2023 12:25:01 -0600
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [kirkstone][PATCH] go: Fix issue in DNS resolver
Date: Wed, 8 Nov 2023 12:23:50 -0600
Message-ID: <20231108182350.881599-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH8PR04MB8639:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa3cc6f-a1a2-4229-c756-08dbe0880570
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ORehB9ERMmLSzYrbe18cJYmGzJnA1rHHFtsWzJPGeTvEMTjbhLSMvyme3K3ZPInnqFdmOxJ2Nxn+vAoiXKTcfpE6ZwqLtWk4PgYk/LKJyn9FgptaI5QoiUmT1gZpLhOp/HQR4vTceid7PZ5jUtjGqfIMyQZi/nk+jKTlYuA6GKG3/J6v2gAVkPPgfNbZ7Ez/T3OpbDhJZ3xZvhYymyvC+IUUm8lz3uxRIm0tgVOrIjhTEhujN/L+0BOnc/XYQoM3pnsQTVXovOnyG/RPLa1W773Xo7KvthoDU5u4VxSdTUnRTqH/BDJSgmnbHgsnN3/m6mFqXyuFj6GGTpGdvnW672Eg7yjv2YhITAK3RfmViCA9stJWzsixbUq8afyyMwTRN+p6bJ+e7CVlqKIQLRsE1nnnX2fbwVy2n+tOjkFKrFdm3OY7nqXBy+YnDwFFrPq0tYjgBrIZUxg9LXJTsJYi+wCh//ueg+Am04o1AxevDRQy1pfyClg6g2eQ4khvaHs3ZefqKfHOtUeBotscXmP/QKEemmOe1YZoOBNyX3fNBUjX/pMfZb/eq45Jqcq66/t1KKkKPeS5WpqqQGYlIf6MEdE1dfwZ7wq45zctP63p4H/Hzqi8YFvAoxHKJ5zJTVMBmfziTJbti92uVnR2Shr7B7FyOmmP+HQk1a6ut75urrAY0aXVa+z9/pZVWUKc500EaJkweT58Va5wyVlPZk+y11Gu2OuFfkNJ+28pSD6XrP5XlU6YqU62T7+Pk9Weq946BNLrtVmyllBBPTqWhmJmYA==
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(1076003)(966005)(40460700003)(41300700001)(316002)(36860700001)(70586007)(6666004)(36756003)(6916009)(70206006)(26005)(2906002)(86362001)(478600001)(47076005)(336012)(82740400003)(44832011)(83380400001)(356005)(8676002)(81166007)(4326008)(5660300002)(8936002)(2616005)(40480700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 18:25:01.3883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa3cc6f-a1a2-4229-c756-08dbe0880570
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR04MB8639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 18:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190356

This change adds a patch that is a partial backport of an upstream
commit[1].

It fixes a bug in go's DNS resolver that was causing a docker issue
where the first "docker pull" always fails after system boot if docker
daemon is started before networking is completely up.

[1] https://github.com/golang/go/commit/d52883f443e1d564b0300acdd382af1769b=
f0477

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 ...Fix-issue-with-DNS-not-being-updated.patch | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-wit=
h-DNS-not-being-updated.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtool=
s/go/go-1.17.13.inc
index 461819d80f3..5580da34f87 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -16,6 +16,7 @@ SRC_URI +=3D "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch=
 \
+    file://0010-net-Fix-issue-with-DNS-not-being-updated.patch  \
     file://CVE-2022-27664.patch \
     file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
     file://CVE-2022-41715.patch \
diff --git a/meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-with-DNS-n=
ot-being-updated.patch b/meta/recipes-devtools/go/go-1.20/0010-net-Fix-issu=
e-with-DNS-not-being-updated.patch
new file mode 100644
index 00000000000..6ead5188434
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-with-DNS-not-bein=
g-updated.patch
@@ -0,0 +1,51 @@
+From 20176b390e28daa86b4552965cb7bd9181983c4d Mon Sep 17 00:00:00 2001
+From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+Date: Mon, 6 Nov 2023 20:11:19 -0600
+Subject: [PATCH] net: Fix issue with DNS not being updated
+
+When dns requests are made, go's native DNS resolver only reads
+/etc/resolv.conf if the previous request is older than 5 seconds.
+
+On first network call, an initialization code runs that is
+supposed to initialize DNS data and set lastChecked time. There is a bug
+in this code that causes /etc/resolv.conf to not be read during
+initialization and the DNS data from program startup ends up being used
+until the next 5 seconds. This means that if /etc/resolv.conf changed
+between program startup and the first network call, old DNS data is
+still used until the next 5 seconds.
+
+This causes "docker pull" to fail the first time if docker daemon is
+started before networking is up.
+
+Upstream commit d52883f443e1d564b0300acdd382af1769bf0477 made lot of
+improvements to DNS resolver to fix some issues which also fixes this
+issue.
+This patch picks the relevant changes from it to fix this particular
+issue.
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/d52883f443e=
1d564b0300acdd382af1769bf0477]
+
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+---
+ src/net/dnsclient_unix.go | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/net/dnsclient_unix.go b/src/net/dnsclient_unix.go
+index 6dfd4af..520ffe6 100644
+--- a/src/net/dnsclient_unix.go
++++ b/src/net/dnsclient_unix.go
+@@ -337,10 +337,7 @@ var resolvConf resolverConfig
+ func (conf *resolverConfig) init() {
+ 	// Set dnsConfig and lastChecked so we don't parse
+ 	// resolv.conf twice the first time.
+-	conf.dnsConfig =3D systemConf().resolv
+-	if conf.dnsConfig =3D=3D nil {
+-		conf.dnsConfig =3D dnsReadConfig("/etc/resolv.conf")
+-	}
++	conf.dnsConfig =3D dnsReadConfig("/etc/resolv.conf")
+ 	conf.lastChecked =3D time.Now()
+=20
+ 	// Prepare ch so that only one update of resolverConfig may
+--=20
+2.34.1
+
--=20
2.34.1


