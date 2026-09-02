Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE15C624DD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9242.1788343179729044457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=V1KSZn3u;
 spf=pass (domain: ericsson.com, ip: 52.101.70.21, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnKtn76RhUj5zIiaB6KBgmRCmadYE/hQSH6gWdB5mcpAiaZKLAPkT4nsyM45L333ebxWeSzMIC+LUowP7v2hW8kqlHmR1KMbMUGZRMtPlv3dJuHJRK9gYwsyS+GZchhupydpTwB9KvLo3piLf21wHavfMlA40TFbb5aK5taHPWk4rtIz0eZLfArbnIMENubr4MQqEn9YT+j9hKbWR0UCFEm7xY/I0QVUGH/g3/YriMYZC7RCqRfaH/GXDrpl3M3rcQU4s76fDupRcoQv6FzY6zw9uc/MJs4qKpmo6iet2oZ0aYKYFsrb4WVeFbtlBCseeEGLtycKs7Awa1TGdbkQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PpTi4xtZd0Jn3m9cCk1wmnO+MfOis97u5jR6x2w5nE=;
 b=CSW8tT27Of/cJT1Hm4XpfOtu/VGtojfCM1rH0e9O6+5oUs9sXkcmJR8RisjCuzg05w88LhPqUQmek2uhh3gj1rYqGSSBHHEF2HvM7lYpsPEtJAPfH1RuIORwu5XM8FvY97ZSjlQE6tycApd6Vj6s/pnLCBPqq4/Ys9mcIwhl9V6mkSDnfwY7cKqfH5swzgNLQgLTckhc9mbEE2UVXEf8ui7Vas650Lk+xwbQ8an6tz9Nz/yzYUWY4LXKDjPVjiyggXfJelYmGUT30TYKXjXst2ialXAeXM7Kn16JHKRnK/QOlNXwlF2Lot8bwD8xF+FXJyVMZl0AQCaGctDiV9nyOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PpTi4xtZd0Jn3m9cCk1wmnO+MfOis97u5jR6x2w5nE=;
 b=V1KSZn3uAAABErfFMQszGBDk6xJXmdZkzMm0oBK1I4M6ZuLj5gVnacWUYZwiNd9POmpA/BYJGlPDlsKwlGpnbfWMVOKqWvsn5j37Ug82buiPGnjH7C68NroyjZY0LF0A0M0G/Tge96qXEOVfgSS1y0lohaFuyh7015hQifXZ59tZnrAl7dJCGOFFfl6EZUSya124zGVhp8okS4CzPl9JxchgE+hjriP5sZaisjEEdej4T5FMZ0/YagTbnUu7bxUcW3AIqqycND6sVbvQnPAvrV1U/4LK40USKvu9w8qDqcWkOFUjtlq9Y855QvFxum9GE4i+11nxsEel82lsYWi2kA==
Received: from AS4PR09CA0003.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::6)
 by PR3PR07MB7019.eurprd07.prod.outlook.com (2603:10a6:102:78::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 09:59:35 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::13) by AS4PR09CA0003.outlook.office365.com
 (2603:10a6:20b:5e0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:35 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 835A54020B44;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 48519700DF75; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 04/20] systemd: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:04 +0200
Message-ID: <20260902095920.2840293-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|PR3PR07MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 183d5887-7163-4167-f11d-08df08d8e4f8
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|13003099007|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	dVgCkTa+YfWzbdBsbZN5nX3vKEK5ZenSDce2DhFxBTKpi9gtSTjjgiZgT65UaOm4+fBj8JHoGIK5KLuVdbD1Oko/MBj6qtcnc4Eap9k4q/F2rycKYg7nx0d5JQdmljH7lw1fV+x4QhoC8DeHu2GWNyAWyAtckmPzEZ9eGMIZxQ0MDNqL3rrcG8OaTvIUdGxSNMGN/oofgQsIdKIa9IAISxt1t7VEVOJhVwxkcLwLBqwHddFUSAvZ1LgpEdyOejQJ6xKBXxZCxrYUrY2L23KXLruChP4Yc765wb9/w3T9WX9M6PWSn6T2PKQth6PeHX3zBQFFgVSig/UgXF6lZMkmkRYt7xpoKyoRqetmaOLupfX08Yfx3Yr294vMyZdAb56B8V+3q8UljHrrD7B+iyHeaBB4H8mqmR8CSRmzKD5CWAdLq26i6r2h5wRt0M0eBY8Jkoe8bwnrgvgupUHCpeULWJ2NtJjVhwMjRNufYOowv7LoJ4usnsTvzcGiyI8upCtzVMPhWQveieYn345U1Ev7MefPEC3MXvVzxztJ2ja1O2jwlJBJOlxOU1GXYDZco6lXmVbn3wxSDUTQyONFwjjqkZU7weaMyAH0Bqhrefo+Xno6bUykh019+31YKFD+Zxd3zH+cYeReLS759q3oH9XSUAZ/SSm2a/AfQ8Kd10clCcQ=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(13003099007)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	J8sIjlvvjG0WTiu7xkbTArq7wDxxWbnRYUTv9jhN497DY/3zQS1QkyClRg1t+gZeMm0OfekKVg2A6xPlx5PhAql1jy9Yb3Srpwr99X/9pax/vZaT3rQqOI4YSgQHe5wmDRr+FLgiydYxMvVCteezGGvW3SRJ80ymHHUfgidNxtDfc8pHZhgxnjBIVvOyuZIlIO02+QuaX/rbfiUr0al/1NcaU/+22u41jIHfsxKAwq0sP2tsau6h6prh/td0+kcP3+L2Rr06jclzhIpxi5OTfHx4wnYvZFm+3c8VkLY5blyT5BWxT/rJHoKEHYe0E4ftDG6X54H1STaTrD4jEo7iUohRXLMUCp3IdTN79yYIc84W3cu0fkj3JXiR2lIXy3dJpBkDc7v5VhS+9g4kiriYcd82HWgYg2khmob5muE+FO+lBi7g9yP37wLGuErH9eVC
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:35.6776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 183d5887-7163-4167-f11d-08df08d8e4f8
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB7019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244914

From: Daniel Turull <daniel.turull@ericsson.com>

systemd's README ("STABLE BRANCHES AND BACKPORTS") documents per-release
stable branches carrying backported patches. The current one, v261-stable,
is branched in the main repository; the README still points at the
systemd-stable repository, which holds the branches up to v255. The major
is a single version part (261 -> 261.1), so upgrades within a major
are stable point upgrades per the OE-Core stable release policy
(ref-manual, "Stable Point Release Upgrades"). STABLE_VERSION_PARTS is
set to 1 accordingly.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/systemd/systemd/blob/v261.1/README#L460
  https://github.com/systemd/systemd/tree/v261-stable

Checked the last point release for feature creep:

  261.2 (Jul 23 2026), against 261.1 (Jun 26 2026): 277 commits, mostly
  fixes. NEWS files both releases under "CHANGES WITH 261" and gives
  neither its own entry. Four items are feature-shaped: refcounting,
  argument handling and JSON output additions, plus one new internal
  string-util flag.

Those are small internal additions on a real, diverged stable branch
rather than mainline drift, and none introduce a new subsystem: closer in
scope to a security-hardening batch than a feature release, though
broader than a pure bugfix release.

These bumps are not free: the scarthgap 255.4 -> 255.13 bump was held for a
v2 because TCLIBC=3Dmusl broke, and was merged once fixed. A point release
being fixes-only upstream does not remove the need to build and test it.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 250.4 -> 250.14 and
scarthgap 255.4 -> 255.21. wrynose has had no point-release bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c19dd5b2afa61ca78dad0b65556ba66e83db57c5)
---
 meta/recipes-core/systemd/systemd.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index f107c4c5da..bbcacf9deb 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,6 +21,11 @@ SRC_URI =3D "git://github.com/systemd/systemd.git;protoc=
ol=3Dhttps;branch=3D${SRCBRANC
=20
 CVE_PRODUCT =3D "systemd"
=20
+# systemd publishes bugfix/security-only releases on its stable/v<major>-s=
table
+# branches (e.g. 261 -> 261.1). The major is a single version part.
+STABLE_VERSION_PARTS =3D "1"
+inherit upstream-stable-release-point
+
 CVE_STATUS[CVE-2019-3815] =3D "not-applicable-platform: only applied to RH=
EL"
 CVE_STATUS[CVE-2026-40223] =3D "fixed-version: fixed in 259.2"
 CVE_STATUS[CVE-2026-40224] =3D "fixed-version: fixed in 259.3"

