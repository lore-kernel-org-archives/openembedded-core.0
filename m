Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EF1C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:08:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28329.1787681314253705926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=f6lpUlAq;
 spf=pass (domain: axis.com, ip: 40.107.130.33, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6AEANpHQqIzI7U5oCbj5oqV3R+Cu6JGd5KNuvPmbPM+gTR4ZrQxjk8RC/J2gnW8PeHvWKG91Yus2/HWy7JmzbMI8/IH5YM7nUIwvOPRDFaA3C9AJFLG0ZnfZpmcPVuunFfXxLLMXjrtAIW39JiBERv050So4pdLwecc/UTJjRd5lmtLO7CbBF4ZpW8Yl2V1XXgNg5n4OfUCCVaX64wp7bdm/SQWqa9wN5tp04NSQ/BaCRQYcFi6+63H1f+lZuNF+t+G30q2jcmo4mAL1z5Zu6R1RMeWueH43E7Gsb/tZ9x9Lc7jJJot0TneXt9+cY1/f9Gn1218QKrE+NKX5qwAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzkYlRh5s+qP0M6uKvkDcEFmj5E1DlMfBmtpH7BBdGk=;
 b=qvOxlBELrQcQcNOzUhOIAjMh7zle82C5wE+CxZuY5D1E+eEIHlWXLi1wEoTWEqbcLl0Yu749winJ0YIGMbNEdcmMcMMDQdVnPmS+RWu2rsPQTCLelL/MrRLbl24MqFFonFx3E1xOz4U7vTH4XLGvduS9C/vMVc68LQKeuAaoeSm94U98EKcGzydtYek5cxuBBaNDJGguTF1xv4TIylwFUniQUrrRmg5eejaYzFeKW4ZhyBdy3DM11CwmMuqc1a8/sMyZIq9MXjQNkYmUBoN9qGr4VuXjcrVNKLIv124eHWVxXiCzCnO/Ww2LcBK+Bx1l0/e4a593r8LmV83y+qqiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzkYlRh5s+qP0M6uKvkDcEFmj5E1DlMfBmtpH7BBdGk=;
 b=f6lpUlAqzqvAK5nfpitC0i7m13IuyQfOsIqm6A/FjcbON0jt+fs1Go94o0Qf9U/b8Q+LQZ5/ofAuNFIlVKR4etx+fZqD3i9t75/19YHVxVMUPK2TIojWdTIfcFxAUxB8gWEADvm/ng6KC06EdrVkoLB3uuTuR1bA49W28xflqKs=
Received: from DU2PR04CA0273.eurprd04.prod.outlook.com (2603:10a6:10:28c::8)
 by DB9PR02MB7338.eurprd02.prod.outlook.com (2603:10a6:10:242::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:08:27 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::a2) by DU2PR04CA0273.outlook.office365.com
 (2603:10a6:10:28c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 18:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 18:08:27 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 20:08:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 376C125B
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 32DD112B46C; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/5] useradd_base.bbclass: Remove perform_groupmems()
Date: Tue, 25 Aug 2026 20:08:02 +0200
Message-ID: <20260825180805.2990506-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825180805.2990506-1-pkj@axis.com>
References: <20260825180805.2990506-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|DB9PR02MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc8aa4b-ec1f-48ac-beea-08df02d3dc97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	jfHWWZEcyWhuh2E6ZUzEh9BV1zi5czcnqWY0I6fwE5pamQr+F5TyjeH41oWHEv4jNueNHn17frDwoETd+JLZPsjEx+/Netfhbbdxu8m+IP3VMq9LyspEmvwHUEds/qgqqD6hs4klZL5Klam00BKb7e6oDAcV9Nw39N1be1Kg0RKnPE9vIVtr+cY5IkvEJyn7nCv3h5H7siMnVx1PbbhSuCnClkRJu7N3hIypBYrSheIYvKd3XNbY/0Ko0EnnzU1DQ3Q3JIXz2XTiroJgRm305YpN9VqLZ1QfPG3rzzG2kjQfiQSBroe2/Bhe+fwQM2eDySCpkTl0TISp2brfLECtNAXt7c0O1BIVcbWPXmn+WqkAIzNlnnKaEzJDjEGVmcawaH0GOQIGY3TK5LRoBzaQc2S8N7KVX1wCskHxqJQk+b81AKtGZwc37ydOvL+AMImE4PVCeXvR1ubpfW00OVKg/3KtZxBkkIWevUob58TLrnqBDM3vG1AkaMSpr+2lR2NzV0Eb4MZvHIDdCZQFRDkxygi6LuE3mx0y0vtMV0RLY9zAzy38TYQ5IAKe8i40nHV1dKE4GEBIeVEQUNWpC5+I/wTsApuyWzAsAF1jNUi4+urSo8aGVDktCu9sqXtR2/c0MO+dOaUqDSQ/PNDyfZO6gpOsWi9A87Lk32Zg/SDkWvpZiGBRo188EfGthavVYwP2wSfasgn8p96HD7sjf6/qOw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u7HCJP+7yCGUZKtoQ8MjIgIeD/cOYEHdCuUkS2uy9TYnxPEOtX86HdBR4PXOnriWgB9Y68/OX9jnJCR2ydMGEGbA7oIRjNrpLI7Ub7ZoKx3iS/qCBuM0S2SqlQqgz75PfIodO2qNYqZbLFWXtXOmW67l8AYOBncJxaVwFxugpx4xPQCBDochuHl1N0tbyguEnxvhnixaA3HAxkzKTp9UyUe4CRIWGlzurFMZd8zU6p+4p8wxMWkvEepxSw7rNMGBi67iBYxKrK0DGYXwrjeaCz6Vdhr+NP6yNSD99CaKbZO5RivSGafOFg6BaNeJ9wrbZdqy88CVSbuXbnZBarNGRnI/vmh0pI7HjhNjfoIzT6SkHpaPwu2Tp8/yaTQZS7FuMXbijYfzRig/GS0lBv34fZbI/evV4iVCz/esw3NLzGigmXOloVUepvvMfkI61fxY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:08:27.1683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc8aa4b-ec1f-48ac-beea-08df02d3dc97
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244251

It is no longer used after support for GROUPMEMS_PARAM was removed from
useradd.bbclass.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd_base.bbclass | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass
index 5e12880b64..efc9d0a096 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -50,32 +50,6 @@ perform_useradd () {
 	fi
 }
=20
-perform_groupmems () {
-	local rootdir=3D"$1"
-	local opts=3D"$2"
-	bbnote "${PN}: Performing groupmems with [$opts]"
-	local groupname=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($=
i =3D=3D "-g" || $i =3D=3D "--group") print $(i+1) }'`
-	local username=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($i=
 =3D=3D "-a" || $i =3D=3D "--add") print $(i+1) }'`
-	local prefix=3D`echo "$opts" | awk '{ for (i =3D 1; i < NF; i++) if ($i =
=3D=3D "-P" || $i =3D=3D "--prefix") print $(i+1) }'`
-	if test "x$groupname" =3D "x"; then
-		bbfatal "${PN}: groupmems: No user specified using --add."
-
-	elif test "x$username" =3D "x"; then
-		bbfatal "${PN}: groupmems: No group specified using --group."
-	fi
-	bbnote "${PN}: Emulating groupmems command using usermod with group $grou=
pname and user $username"
-	local mem_exists=3D"`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(=
,[^,]*\)*$" $rootdir/etc/group || true`"
-	if test "x$mem_exists" =3D "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO usermod \${prefix:+--pr=
efix \$prefix} --append --groups \$groupname \$username\" || true
-		mem_exists=3D"`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]=
*\)*$" $rootdir/etc/group || true`"
-		if test "x$mem_exists" =3D "x"; then
-			bbfatal "${PN}: groupmems command (emulated using usermod) did not succ=
eed."
-		fi
-	else
-		bbnote "${PN}: group $groupname already contains $username, not re-addin=
g it"
-	fi
-}
-
 perform_groupdel () {
 	local rootdir=3D"$1"
 	local opts=3D"$2"

