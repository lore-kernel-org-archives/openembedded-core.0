Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9E3CD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:44:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36132.1779799478707430945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=IjxMRsX4;
 spf=pass (domain: axis.com, ip: 52.101.66.9, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3EbFsbe0hX3yz+uaLMeEvDvQzj8JOD7XapACHcSBVnqBwwkVpCcYtW2/9hc0kYIlKT+njShifQvdZhBFR0jHqHmIFynDI0CTmJ4hbpI8Zt9fJQEfLHPjaaw2sBq5PsY8V71yFyvbEC8/qaobDF1fe2BOgza9azFuWAdx/EC74y4Vx4uwzAjnOpxhazwqIXBoG+9d4t/IT24PBUuRHLyiXY+7s3JAGfBXLCwslohHoCmBx5lwa1GfGD3pfG5TI8x2fT4Al3X/ub7cgnr0HAjyKCCsceKVKT5d4F3/yn6nIehdgPJ1hRYSrrIHUit5uN+0DIz8yiSZ78rWI4cuMRo5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD/fmr2zEf/MdlyP9JmtcgvZEwtteQR4ogkhQ12Jfag=;
 b=UlDDL8HJgcpegiR6yUmBzJeitFs/dyKF8isy7bskaZTpu30Qs5Hm5L2x0bgq/dOwMF9eWhAhk8e5wKxk+Daz9H4+1NnN/1o7uMmqFmyyflxKdiAkyhLs4w6mvAi7ltGmruwUL64SH+g/aLmiQrLPK+Rb6/x6ApCXVBE844IKfLeXiMrV3lQN/LmI1k+OOiQnoCm3Qj10Wc1jM3TwerpQuayWWV6OAx+UKejLdxUJgZE0E1ECzrJP6e1sx0M1kVksHnIc28R08a2kekoLW/B4ZI0n1SZHllsRIHa9YacLXeDKVROdP9goe9Ih+UVaaMaYsewzBQEA9Cn75Tc3VJhe1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD/fmr2zEf/MdlyP9JmtcgvZEwtteQR4ogkhQ12Jfag=;
 b=IjxMRsX43vJsLZIjg7SpH1kkepum7eyh/iF9y0yrYkg+HtPM0+dw1BP5J4zS+46ZXVmTWMamFdndICjatrNuRCSCzWFx0wdU6bVzqdVp1iV98cP2S6v9u1VfynJoJ9jV/j3SuaAy0EFj/FT4omvKCTj0r6SGz+ONvpxGSjS8zqc=
Received: from DUZPR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::9) by AS8PR02MB6630.eurprd02.prod.outlook.com
 (2603:10a6:20b:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 12:44:31 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::7f) by DUZPR01CA0134.outlook.office365.com
 (2603:10a6:10:4bc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 12:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 12:44:31 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 26 May
 2026 14:44:30 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 26 May 2026 14:44:30 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 9767A855
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:44:30 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 94826122A1F; Tue, 26 May 2026 14:44:30 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 4/6] useradd_base.bbclass: Emulate the groupmems command using usermod
Date: Tue, 26 May 2026 14:44:18 +0200
Message-ID: <20260526124420.2564500-4-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526124420.2564500-1-pkj@axis.com>
References: <20260526124420.2564500-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AS8PR02MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: e636c6c3-16e0-4f28-0cd4-08debb24884d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	8U1zhdz3bRy8xGlxkLy/npSpp9bY8saQPFj+HQ7H3o2f1w9RaGlen0fhMqMsmFXgs4z/1DPszsqtHhru3xALwsK/VBT74jYOm8iuLAGFZ9KhUbBzBEEyWJ6XuAKppqxNU8zEwQ+1zBKixEWVGZeg17v75Nka6E5LFbZctyo8jgp/KG3A6Rqyq1KZTBmnFMvktCubWTw85zeMVDoJlwFco3CTUu/NaeHjQHye8KA99qX/PLyH3tUupqrfyT2B8NykJRTq3w13SXWOerDvfB1Vih7vIV7UOnln06Pyp8E60qp+PoUGMdCTRs+x4eFGbo6OmoQZ0HgJbttQSRRdEHg7sGfYB+pwfjGZGRI0yxZmlp+3+mZpcQ2vpDOYTzwJH7JpD8To6w/1XIpxdNxkbn+S4Msw9SMG8qQZa9LOV+c7QN89zjxicMy1DW5zhde4jc3sUCbHBji4J7l4tjjn+eMuVLNUxPJtqoc9hp0pcKSACR2FKiuVZ3P15wLMADRYTjbFAe8oRSkZESaVhN0WvnZrOYboJOpKkMUlPKHOMjxX+SIrmEdRIhhZxUvQ5aeb/CJIeend6SJEs28JHK2FuiE0HT8LKbW3ZjcjNZcfBms1rHUtl32B2xM+w+cBay+oWI0c4buYf1nBCrtC/YavJ3+E94C/JVZH80O9cJOu9iqmZWD2ClgtaiUZ2tnt7xZCExaDoUd6FJ4TQ2TyVmNGaxgOO9BzsM2YxITq7w83gwYdcMU=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LCodzIJhcCKTYpDDi2AjC2RoqQzl0gkXYTfzlL9t6ty5ibH+QhO/RNuQIOAHv290CMdk60IaGJOqqGACnFzxJ5zZkpAd1v75C6R7j9iLr+91wkRxcWOys201DSOf6sz/XOztf1LCFaLKc4bBGjNlnNE+K3BHZpZB2epva+ZuD1QiUBRFV1k/4WPqMEN+3JDRah6TvlaPzcIbIxohHS0jY2OyV90Z/HM+zNsTK+OBngDurZxmTZYNn8C/dEJXMioa9P5MWlYYA5027fkPNcpe/Vt8zOUrJodTDyJ4Cex3GdL1w++kxuaat/tSZZLg02Q7uDcd8mpPHHgbLovJ3mJ3cNdXzN4DPBeegqwVrNqXXdDbjcGTKkQFuN/q0MZSvVrSOwvWYeiJuCXF6aVr1KlH1iU3x6sdAJR6Xb8cnh35ZhudFlhm+jSfo1EoxAdqsI9Z
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:44:31.2678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e636c6c3-16e0-4f28-0cd4-08debb24884d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6630
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237606

The groupmems command does to support the --prefix option, which is
being used since commit a7b846ba7d6d63a5e59939d75d9c5fe3e4cbb0e9.
However, the groupmems command can easily be emulated using the usermod
command.

[YOCTO#16277]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Fail if --add and/or --group are not specified.

 meta/classes/useradd_base.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass
index 5e1c699118..5e12880b64 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -56,13 +56,20 @@ perform_groupmems () {
 	bbnote "${PN}: Performing groupmems with [$opts]"
 	local groupname=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($=
i =3D=3D "-g" || $i =3D=3D "--group") print $(i+1) }'`
 	local username=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($i=
 =3D=3D "-a" || $i =3D=3D "--add") print $(i+1) }'`
-	bbnote "${PN}: Running groupmems command with group $groupname and user $=
username"
+	local prefix=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($i =
=3D=3D "-P" || $i =3D=3D "--prefix") print $(i+1) }'`
+	if test "x$groupname" =3D "x"; then
+		bbfatal "${PN}: groupmems: No user specified using --add."
+
+	elif test "x$username" =3D "x"; then
+		bbfatal "${PN}: groupmems: No group specified using --group."
+	fi
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

