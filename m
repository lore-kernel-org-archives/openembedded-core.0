Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFA9CD6E41
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:44:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35907.1779799475208071950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bEU4BzDQ;
 spf=pass (domain: axis.com, ip: 40.107.162.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh8L+II5OKKAM19cPN3JojD58kJ7ytrgNZ52YtEbZ6vCr7TRPxCqAPKn6tFWIMlmevm2O2j4m3kgh6t1hKOgsvB6H+hOlqSc92n1pNAqu0EotBggU7p/kf7mxUmp4stM94+4w9XNbM6mkQDLHgxL1HZdY7dvT21N+A3DZz+h/RhUiI/kAmFvaCQxpKgBO0+ChW501O0zJ6PSFPmnNCPRtREcV0ty133G5KZWoULb+atTq+BZrFf+7g96YUhvLICFeVLOzYqF3FaYA/quvtNevf5OzkFrEiVzGkmGDkGGMHOVdUEDfIH+tobLA2cOCaupcDvKgDxnGnOhXVEB9kRnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iX2j3IpHnMO+NhX0+pjZAmetoDrMhFAVE4IRGJNCA8M=;
 b=LVd6Tpy0iaNmvLmLN/23MYKG+nucuFS2PO1tQcT0mZtOT7YMbudUIp1itnsvznSaP3Vt56+5vTGW4ujNmnzMCCuqbnjckbQlE+axSmC2erEt9KMCe6iTTmGC4YJ7NFOAnArek1RBGWas+e+sQUVMQfUNz3s52/Gb3eY4rz77ty4j7SJMIVP6R3aojRlq00n1j7zlc+S2rFiiUem33y4zK5+gWAbEAQVXnAjDGHVXZckosTZtvarh2z6fLkNKUGF+Siz3/PchComymAFR0eu3SB+fkFgDNaakknhWj0cAOhOUVjH4Px0hxneosjkPSq5Fpb4iCmWSgdAqYc8O/hRP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iX2j3IpHnMO+NhX0+pjZAmetoDrMhFAVE4IRGJNCA8M=;
 b=bEU4BzDQ68Pdqdi4KCQvxhdoOmMOFrTVRp3x7dSo4f5wX/Q2NM9KRBW8LWH0vaIK1+Ahwy48uc1D8CmWJlkEz9tLq0MeeuEBt/9x/jgzS4p+jAH7kb8ixATQiTPbGdVQUTA2CvEsB4oJvQt7ujWaIE3Jzg2xz/oZ3YGTUBg/hTs=
Received: from DUZPR01CA0156.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::19) by AMBPR02MB11996.eurprd02.prod.outlook.com
 (2603:10a6:20b:725::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 26 May
 2026 12:44:31 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::37) by DUZPR01CA0156.outlook.office365.com
 (2603:10a6:10:4bd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 12:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 12:44:31 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 26 May
 2026 14:44:30 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 26 May 2026 14:44:30 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 9EBAA3B9F
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:44:30 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 9C6D51204BF; Tue, 26 May 2026 14:44:30 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 6/6] extrauser.bbclass: Switch from using --root to --prefix
Date: Tue, 26 May 2026 14:44:20 +0200
Message-ID: <20260526124420.2564500-6-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526124420.2564500-1-pkj@axis.com>
References: <20260526124420.2564500-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AMBPR02MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f3d95a-2dd1-40ca-1e18-08debb24887f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	CMShh8BwQ8x/HUK/D+e2pp8DaJe9mwhRbefTVECW6RR5Dh98thOwZQcCglI4lvPJ3Jr/3G2y+6eEInRGsugELeqovckWGK38ch8fJrczhW4JXuqrGOrDpdtDVQ3mbCi8tULyAMVglFUaonwVPsIXISyZY52D7Z4Slka82ATxZO7hB7hl+7rRCcSZt6IE3axyJJXcIfrfLBgaHQqnw1vPCuvlN9peaq3ENZR2sNSH0A23c/XxPWQJ8kjTqVunc9YkysAY6PFNixeR//Em/wVw9G/mH3ce0h7sdDlQ5t13XVA3K2JBok1TSXOfOd2BWhyJ9PqeX8av23j6CVUtWHHFpZ2EbJGf4eX0ehtpbZWIWnr51splMeRF9GSR3OfX7pXgQfVx0adFZF9hMjGWSY/OpLIv/JF/NjrBq9TSwscikB9UoyCQwYUAp6kaKPzr9NpraFBj/NpzUjHd8Plv4FY5NSPjSYVRky986eotgtP2REGy61lRv9x76GuSoVD9ven0K6L5cCQDR5O041PBk/0EhVQpNdMh0W8PUxAoedGjUeXBd/xC/rS9Tej5k46uyUto94MZ5gzWSF42Ewg8ldx2IGjYd2a1r45A9pswhw/Wik3ZJcNCumjjfXISXp3KSHwGGN+i4uOg3LtFQRxc+OFE0TXbEd4Aam/mVdXXDbNERgwLKRLVAJtYpSACfwNsWk1jQEdjh6vcBvIAqlCwfo2bweonb+C07AtdaEmfol5JuI0=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	d4x5W9+7IV89I0id36Um4UsFc0BQOzHu5ynA7szUkvhdiLUKwvwaWZIxQh51GRw3rbSlMFZNDOHUlew15wzNYI1G/4j3U+OvJHGHayIlUVFUGbbOEr6vm0xchIWIs8X+Jek3eu6AJbcUtWlkjceWrCCVlwYxwo9nhLNwxF3Z04JWvelmlD4GHG/bJsGGDEF9bZibyQsLz126r+X1g/YsQ0x/RD9m/AJCSA7PjeFxx8h4JyFO5Jm7+N09cIr1RzxVh/EC0stdJeoH0Co31gJSXwDc/OtUQyOlzADJTGO7+6+IBE10LLFdQSna6evPge9uTKvV3kuAolvZ8Hl7H2dmaZJIvhRFGUDcan4iuuEI44I3ryeZcdnC6squfSQKcKcNWQlAKcBDKQEMBt5UopF3276EpTk/LiA07aF6WHxsbLXbqDQSJObh6EVETIOgr3zB
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:44:31.5955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f3d95a-2dd1-40ca-1e18-08debb24887f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237603

This corresponds to commit a7b846ba7d6d63a5e59939d75d9c5fe3e4cbb0e9,
which updated useradd.bbclass to use the --prefix option instead of the
--root option when specifying the destination directory.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New in v2.

 meta/classes/extrausers.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbcl=
ass
index bfb70b7180..5f72612696 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -38,25 +38,25 @@ set_user_group () {
 		# this setting is actually a serial process. So we only retry once.
 		case $cmd in
 			useradd)
-				perform_useradd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
+				perform_useradd "${IMAGE_ROOTFS}" "--prefix ${IMAGE_ROOTFS} $opts"
 				;;
 			groupadd)
-				perform_groupadd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
+				perform_groupadd "${IMAGE_ROOTFS}" "--prefix ${IMAGE_ROOTFS} $opts"
 				;;
 			userdel)
-				perform_userdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
+				perform_userdel "${IMAGE_ROOTFS}" "--prefix ${IMAGE_ROOTFS} $opts"
 				;;
 			groupdel)
-				perform_groupdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
+				perform_groupdel "${IMAGE_ROOTFS}" "--prefix ${IMAGE_ROOTFS} $opts"
 				;;
 			usermod)
-				perform_usermod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
+				perform_usermod "${IMAGE_ROOTFS}" "--prefix ${IMAGE_ROOTFS} $opts"
 				;;
 			passwd-expire)
 				perform_passwd_expire "${IMAGE_ROOTFS}" "$opts"
 				;;
 			groupmod)
-				perform_groupmod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
+				perform_groupmod "${IMAGE_ROOTFS}" "--prefix ${IMAGE_ROOTFS} $opts"
 				;;
 			*)
 				bbfatal "Invalid command in EXTRA_USERS_PARAMS: $cmd"

