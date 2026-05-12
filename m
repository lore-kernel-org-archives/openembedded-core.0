Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC35FCD4F3D
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:04:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83225.1778612672107656047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=boHtpbL6;
 spf=pass (domain: axis.com, ip: 52.101.70.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2I9k6TlAVHTcf8txMWzdj7ukAlLOVdvy3KiDockhqtSgwI8ebN2qaR0CQ7qd0VuGzetlwHA3tjJejCrCFZge0Wj4xTSn2blfx6DL20Y97F8eH11ZqKuJG07SAy3pPCR/Wed5vgZCqMzsx+xHd8VKQWLrdys8JP111n30HPxv5eRhCnwRvbRRRXc2e8lOkCGNkIltRYdNouyTvfzQqizFf/zWIL5SJW1eDW9gA6HmH2kh+AA+Lz3jACdznx95IPpDglgwipctU7sqZHMATHKrYKMYRarSl2lM/MJldAFx7H9bpWuRWYjjCxymNCCDLogrcjsSRLAgVstVRqBJHwDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra7mB6hFW6jfBkDDnMBo5ILKinnLMagI+csOqsTAIu0=;
 b=mWX3kGk57vo++jfbYmAGiEmTlng3X7VSIIQqqYwaY6NwNfQddKAWEVXD86X2u0bLH4E8i9ftGrffhyjnaKjFjapbQc+wUhroIWspPnoavDUTZVasd1FIUgNdrETnzV/h323sXlXZY4rQZ49XhyqcCjGo2WHW4YhD0Ckp4/6QPdobZ3dcB3mgKtr6aLDtspOpgSf0VMrIhj2wDJcqMLjMSbnRMfQWayuBDkuUH5NOahpaygQOV7hQHM4WB3JCgssqStfiYULXLVn/C5ou/P3kMnkJRI+i+46eHzr5RecSzGT0XVU5bbmDqREOvNJkC1xU2CY+mWPCgSnmbJG7EvCdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra7mB6hFW6jfBkDDnMBo5ILKinnLMagI+csOqsTAIu0=;
 b=boHtpbL6JGZPgPdKJiuexwLoFS5+aR/s/48Q0pBP0T2M+1MmgtPev7VUpaD/3YsXCpIfBBhJM9DGs4zuW/iTaSrSDOYQDAxvjmuSEinsxAowTViCdpfmzGXxxYEDlk7W/goqRbPkOuxRpdVQDLKJrTX8FJjr0WIBS6PUWD7hheA=
Received: from AS9PR05CA0202.eurprd05.prod.outlook.com (2603:10a6:20b:495::31)
 by DU0PR02MB8714.eurprd02.prod.outlook.com (2603:10a6:10:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 19:04:24 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:495:cafe::24) by AS9PR05CA0202.outlook.office365.com
 (2603:10a6:20b:495::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 19:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 19:04:24 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 21:04:24 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3E1B82898
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 21:04:24 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3BBD21247A5; Tue, 12 May 2026 21:04:24 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] useradd_base.bbclass: Emulate the groupmems command using usermod
Date: Tue, 12 May 2026 21:04:14 +0200
Message-ID: <20260512190415.948535-5-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512190415.948535-1-pkj@axis.com>
References: <20260512190415.948535-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|DU0PR02MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 52999844-8d33-435b-056f-08deb059487a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	zhGpSf9edz0LaKhu+e7EcLk9HpxPBIDp5PRUKhrvkMD0GkDylL16KX7sMgrPQsH95tXiJq3ZU99qGf5iWvQN+zaqr5NlX1fk1lhmDlBA678ixQTzaG4kdRLHxR27HEsjVVD6/mgqFyGWIQZ2Zl6aXQqRnX0RXsBvw9+hrrTNoafNIdA/OVSnUi2GUGKeRqKmONvRpZoGFY4gVwyaBQFbHpKC71amygXMzE8bEaOjGYAMHM1eeovVWk6ggplI7q5lzqWl+iQ9y1R7S2Y7XjJ7yJ1p5ftjkJQqz5qkf7gN8YfO1u8/hH9ktKwLvV5wSINj1BP4ju1947//ELUR9p0FVlyQWRKypt40TjDne4mdOE1ndvViWs/OJH06MC1AmNrQUkj8XxnowTlFz6ARUjuBNnjFHIM64hnMoSpDTsFK0p7fL/B+8WTlx8QgWF1yZMYUl3YLx+dCk6/CLEMpZAERN8uvmMdc2KkJceLOLfnOvU+UrENY6qF0+64wD7YisFt+9VsBnHdScYKTchqyqNk/jxHYnZT1A8vdwa5STZe0bsFV4VCOwD1L87bqga47wRqlS+hLgZaC8K4FAtDA4/sX2V8N2ye65rOWqtmvZHM3lPbIvobhpM4rUBoId3PZx0L32gXBjXb6WhaYDcF2L/coOfaYx4v4J33wfXpntjoWntabNGC4dmjo7zaYJasX+UtSmuE/QE2+u1Z6ne+xQvz4nFQoWzv2i+72sYrogj4Z/GM=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0H3OJCQwIaFUFmWY/q85ZSm9L0598TTgEzwZZL3eVgB6oFE6gPLaidRlY6yJV4qhoYot9uxgg5vnWtY4QuXDxr5dQdM4wXLOwRCqVJD2O0/IwxRhEp0FLbGwP2Kd0BTY+fcBHI7v6c3U0a0pTGJomVJQyAZ+Wetz4k2OH3shFwwto87VYpIts54L8sMUa8SRRAG11umyntBokcA3S8tCTFaihH1xwNcDQHvheRt0VNTf7Y3RlaEzSlIPYAWpH8XdQUfQRpHh5VjCNvT3CTS/TYQI8aOptfb/OpUhx53K7ZK6fybPgtt1+X0fpnQv9wBZnFSZnInewHEjPPUR0TCoMp/96HtQStmQkGWktVXq3gGwQA8sGI6/gMI8TOVe12I4eDMslnoYqMREawwuU6if68U0t+K37GQgam5HAmmp5NnMhm8cp5MIuokYKq/gbqse
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:04:24.7337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52999844-8d33-435b-056f-08deb059487a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236906

The groupmems command does to support the --prefix option, which is
being used since commit a7b846ba7d6d63a5e59939d75d9c5fe3e4cbb0e9.
However, the groupmems command can easily be emulated using the usermod
command.

[YOCTO#16277]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd_base.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass
index 5e1c699118..93c648f8c4 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -56,13 +56,14 @@ perform_groupmems () {
 	bbnote "${PN}: Performing groupmems with [$opts]"
 	local groupname=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($=
i =3D=3D "-g" || $i =3D=3D "--group") print $(i+1) }'`
 	local username=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($i=
 =3D=3D "-a" || $i =3D=3D "--add") print $(i+1) }'`
-	bbnote "${PN}: Running groupmems command with group $groupname and user $=
username"
+	local prefix=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($i =
=3D=3D "--prefix") print $(i+1) }'`
+	bbnote "${PN}: Emulating groupmems command using usermod with group $grou=
pname and user $username"
 	local mem_exists=3D"`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(=
,[^,]*\)*$" $rootdir/etc/group || true`"
 	if test "x$mem_exists" =3D "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || t=
rue
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO usermod \${prefix:+--pr=
efix \$prefix} --append --groups \$groupname \$username\" || true
 		mem_exists=3D"`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]=
*\)*$" $rootdir/etc/group || true`"
 		if test "x$mem_exists" =3D "x"; then
-			bbfatal "${PN}: groupmems command did not succeed."
+			bbfatal "${PN}: groupmems command (emulated using usermod) did not succ=
eed."
 		fi
 	else
 		bbnote "${PN}: group $groupname already contains $username, not re-addin=
g it"

