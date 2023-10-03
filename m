Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70341E776E9
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 01:05:41 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.55])
 by mx.groups.io with SMTP id smtpd.web11.98877.1696295137527770477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 18:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=A566AaI+;
 spf=pass (domain: axis.com, ip: 40.107.105.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBjRIQ2ASPnbG/D65AEyCrrSI71xehbEkrXGH0OQO7ekjjsPxRctdJtHa4Rn6FAiZjRKZO49mwD3WQVPSejaO1VDbdm6SVcM8ywBY07nJunMeGRMFwKUzlsHJF9bX9sUdze+1O1MM7CmqxwAmL4bcmU2IqlMpWUmrw/5SH8ffDKEDNHZpPY737EFJ4EsB4ZQeNw+OA8BWVuo9+FhNANjySqZS6lTfsEDH5cui0dQEGwpqF2h46JJAtret5ddh3JKbDcVzX4M4PjUHRd7sodhVJHKEZ1e2wu6qobFbxHneNPDr5rHqgqVZzELKeVApboYTuzWdQu/giLq+SSOG9RGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dT8XsEwTBnVF25bMKsBCFOh5TueYHnG9k66kbNKk/Q=;
 b=HLOm7nusd1Beo0ekiMFTN4cz00xJTZxqmiU4Fo2cgypMQ7q+EvH49FQLrauB8l0IxNeDitOU89pugV9fIDRvUiikceQEc47pGNbv0YI5rJT8j8aD6maJuxjBBEZNVsMXIwfF5qvXGWUgNxT6CkqvnOFMB8vFoc2WpMYy0Vl1SwBsptu1X09wrhvNvC4SGZQPK1sItPSBszYGjOzBfsXSUCNggXWfLwXgxSmLQjqQ3on207afoEKIYtGCsOxqtIAAe9b5teX12xffOXboW+9J6LBpkcp9btTUfRhjGl1Woy7nVXgzq3xL0gv0m9LIKAk4Y6TwOcx7H7eUl5exezYJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dT8XsEwTBnVF25bMKsBCFOh5TueYHnG9k66kbNKk/Q=;
 b=A566AaI+306wPrT2sUc3ndw3xQrYA9dIWs+2mKR0NRqvMGA5VzG2xEptsuYLZV9py/ffFuri99aQHH6Yvc935LWrEr7oBcp7vjapQ3anzzelqloyF6WoN2XJF5RrelKIuI9LJuSIJABmKy0M7RfGGRLGBKFMKtav7mBtd/4mZL4=
Received: from DB8PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:10:be::18)
 by DB9PR02MB6875.eurprd02.prod.outlook.com (2603:10a6:10:218::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 3 Oct
 2023 01:05:34 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::b6) by DB8PR03CA0005.outlook.office365.com
 (2603:10a6:10:be::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 3 Oct 2023 01:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 01:05:34 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Oct
 2023 03:05:33 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Oct 2023 03:05:33 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 66E331072
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Oct 2023 03:05:33 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 39315XUH2892789
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Oct 2023 03:05:33 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 39315XFc2892788
	for openembedded-core@lists.openembedded.org; Tue, 3 Oct 2023 03:05:33 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] autotools.bbclass: Add *.m4 to CONFIGURE_FILES
Date: Tue, 3 Oct 2023 03:05:29 +0200
Message-ID: <20231003010529.2892756-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003010529.2892756-1-pkj@axis.com>
References: <20231003010529.2892756-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|DB9PR02MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 940f7c70-3c0c-491d-115b-08dbc3acd8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nNCSfb6+Bf/BXEjb8R4ISLdyFLM1Ive/F7Ba7zAg5KiXmff5CI2KaqE0W8o3XGzH7jWBcjyzm1q4eexT3S8hg38rM4ENsMOp18vTZ1CHliXBZRfJuog30ZsqZ3sYX3mdlKOlKDGSYlQ5ZbkeyqeV5kCgr5IX48v/jFeq+KLNLWYQOev2Ge3BzhJ6Qzu+tjHe+roS/VXQ8/wbIeB7/BQTD8bR496lOXEGwb1jTOASSK6tXSu2wIxkNV6/o7NTW4TAKh0AvF2HNV+duzyKzPBAj0vIgpqLr7GpE76efKBk6tnuPMY6RCzFEfgJNDQdwtEpnxPbfmzIPYvgVLj13l8jp/2YYTr4NujOhHv88XLRKzOCnj7JxI/Axueva5Y953GJfP6bDLLZDSUy5i1B7UJKO1Rc0SigvWkKUElMdL8CU7L++4bOxrVEzp8QkYFLiYZXMISxk32sbEDRdGwbtqmwmEu5QhFGZm7n4OlS/U/32yFBZxxDNEsCY8NxUkjateHHbqeirgEEUb+kChNlkOv7hRYC7sBpN1JAY2SQLekl0HE5uxAGhckqPwBoXJfVHmy/bZ+S+4cyKdfr8vFnaUwgCgXUHCoAXwH4L0wAaidkYWFBFMEl6NhAf3v/BSYtkKwwA9JlNK+Uccarx6cGPXv/yx/6C3vNxjV/UjhXdsecNmvnbRJEXvZ7oXBNWbxVVQ1Oq7lLFl+TB84sNRRpBScPPoZyABtvmFdHLoc9P+mObxyBulx8v7zNKpnbjfMJhc2PB/K9csjYsdXhbwsuHytyag==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(46966006)(36840700001)(40470700004)(41300700001)(40460700003)(336012)(356005)(316002)(4744005)(8676002)(8936002)(6916009)(40480700001)(70586007)(42186006)(70206006)(83380400001)(36756003)(5660300002)(2616005)(426003)(47076005)(26005)(82740400003)(81166007)(2906002)(6666004)(1076003)(478600001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 01:05:34.4031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 940f7c70-3c0c-491d-115b-08dbc3acd8f3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 01:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188618

This makes do_configure depend on changes to any m4 file when
externalsrc is active.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/au=
totools.bbclass
index a4c1c4be41..5ed21a3d68 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -157,7 +157,7 @@ python autotools_aclocals () {
=20
 do_configure[file-checksums] +=3D "${@' '.join(siteinfo_get_files(d, sysro=
otcache=3DFalse)[1])}"
=20
-CONFIGURE_FILES =3D "${S}/configure.in ${S}/configure.ac ${S}/config.h.in =
${S}/acinclude.m4 Makefile.am"
+CONFIGURE_FILES =3D "${S}/configure.in ${S}/configure.ac ${S}/config.h.in =
*.m4 Makefile.am"
=20
 autotools_do_configure() {
 	# WARNING: gross hack follows:

