Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D324ECE590
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 00:02:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.32])
 by mx.groups.io with SMTP id smtpd.web11.10944.1725926548051528652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 17:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=e2KPRZsv;
 spf=pass (domain: axis.com, ip: 52.101.67.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBqrNqWcO1NYuKzv3FzgtzGX7dDg20ZZIF6KnFRuT7t5li/rKDsR28ky1Hx1hF4WpGTGmjZ/gNeiz1+lu3E74tQtR6LRxc7CzgIGQ9eBW4Czu9ZpZQVbNJOj/Ln1xAWL8lNkO0+JaNi07saWw5SMw1m20vynDTB94X5J+/3s/4rTHKr6ChAUqI2kxNqB6rQRq+/75JbGh0Pk+eVuItO78RB94YtAcGkNLKRL468sPodAHXLwrHFZio9ZLFqRIEoM+H5XRnC3Ng0Ooux6Hg63DGBCPB4/hQtFVNFn1nyfb4ZAR4Z1WLWVFCIyTjTSETvuz/YQvxIR9wkYt0ul/eJHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mC28uC89KhadimqFnJ0Iaq6eMbKBMSuu9RIbuR0SIU=;
 b=qpurb9KECKvEXYr9rovkYk9xZdRz8LQYZdVxnNhfWQV55UMOXuxaNWka763t5Ah5fEGtmZ+CTbJc74bMxO2eXGSkA2LGA62zoriVDB6coA5msgG8CAl/rR6PglglWKHWgPuEZ4z833ykrX1S9EbWOWaG+ZdyABcDaPrc9+7lEjRl99PuF72rb00pE4WmvVcR5cTkLQvRtbc9lwZt07n70yYQX9N8IS4GuggcLCihx+LKTUvlK7T83k8KlANGq2rjBfh1b0BOcrs2caYHId3IAo6DJbKpDf2JpgSwr8bLFi7ROAXfCbf00DvbOTG/8qgO/UBNPUwz0vhUspPK2il5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mC28uC89KhadimqFnJ0Iaq6eMbKBMSuu9RIbuR0SIU=;
 b=e2KPRZsvxBuClwECqwwacqfEaOgPvflvEwfRFtQ7DFVZ34Z5Ttn/DTUurThYC8SfoZ8+3rVjsj1FtnGqTGYEY6ac3XQjlA7HIAH89uTZ6UHivHI46lC57vhFwdbJzz8EUmoewgvMgJMsmuruD/+ypgSPWsW1VhJWSQO4Pxso42w=
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by AS8PR02MB7064.eurprd02.prod.outlook.com (2603:10a6:20b:2ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 00:02:15 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::80) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 00:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 00:02:15 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Sep
 2024 02:02:13 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Sep
 2024 02:02:13 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Sep 2024 02:02:13 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id AD74C24A
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 02:02:13 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 48A02DIp3330238
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 02:02:13 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 48A02D2k3330237
	for openembedded-core@lists.openembedded.org; Tue, 10 Sep 2024 02:02:13 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/2] bluez5: Install /etc/bluetooth/main.conf
Date: Tue, 10 Sep 2024 02:02:09 +0200
Message-ID: <20240910000209.3330191-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240910000209.3330191-1-pkj@axis.com>
References: <20240910000209.3330191-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|AS8PR02MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab052e4-6c84-432e-515e-08dcd12bd40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RzFZjODFlwc/wufv2zBsKomv2Q18s6NvBjrT6cJJY2ewMVgyb9zN8tUt9IDv?=
 =?us-ascii?Q?iEWogEHphw/Q6TABkj4LCzZl6E6BmM49Jd5S2ntC+Y4UW/6+7k1szXkbN5bR?=
 =?us-ascii?Q?b6x961M/mP2q2yNw6uRofWGPGOWqJ7rYAzYw21yUNR/biWsPGedWMrbSeuht?=
 =?us-ascii?Q?3RKANX1KyVVpsdvPThXy8e2EjmWqHiEueTo//GCEABs2goDvS7Falw6kaKd/?=
 =?us-ascii?Q?/HnfdjpotF34mQgKTr4DkUXgyxqrCwyrxjXSYqJPUhzHbbJl9tnKSoXwRx5E?=
 =?us-ascii?Q?wtOAUy7/OLvi5zVWSIB3utWGfln9ggE1rFH4Y+0gRpT/hTxYoTyfhi2uHBbK?=
 =?us-ascii?Q?5PPz+DTPVZUvQqwEKDBTHbhehA+PuJyqvzMNC5Kq5ZqR5IVOwwZkJ1wqZ6qJ?=
 =?us-ascii?Q?xYnBOzypx9KxthYcQs7uIF0ZsOIVXAQ9Ub5d6T00Sx0zxcKV51dwvHPKCmD8?=
 =?us-ascii?Q?2cT3Gl1I8tnAd6g6OT4NGGTHLDK3N/H6YMBcmS8Fy7lXQ0Nu8mkn5EYhVwaF?=
 =?us-ascii?Q?yh3zgBai6BcfK0D+91xcoVJ8h+asPfLvSQsEp+ULHzb96zYDQIkkWiy1S9tM?=
 =?us-ascii?Q?VbtG3zaFgPt6D2EvcBBNHGVFBXkZvjV1nTFEpoBHBNauLpPbUxNrxgZ0Ees+?=
 =?us-ascii?Q?N5pJp1TwSKBt27ssgnN9fI6WkWaHsj7pf//gVVoF3Iwz2ZfzPMwhruqZFAJL?=
 =?us-ascii?Q?xKpwghAaBHkmXdjQ/i1b2zuqUfEOa7s8ghPi571r5fko0OQow4d9dwCYW7NP?=
 =?us-ascii?Q?OLdiOPjMGYnrlU5ATyjTS0cj07MNKy6+W/TNVVRJDcr70vS8AWyKkdi66UBf?=
 =?us-ascii?Q?9msJtw6UXcYkq8lcFlTwWEvuozfaYBPxS52tOKZIfA/OgZdBriqHgODt3wIJ?=
 =?us-ascii?Q?0z7yTuo7HcqWdhlcS3M3mf/SUXeOAbwIdVAwPtikqABwR3cDX0nGnqnwD5TB?=
 =?us-ascii?Q?e9CBk6sBk2Nn/3neK8nqRGIYF0KQxws4JmczWuIXRo6NLzHDeVPZjDR0oj/6?=
 =?us-ascii?Q?iz8g61zYkC0+w3q0VOFiijxFYptnSDndiQn4Kh/F2qBSTljQrwEjjR5AM5+u?=
 =?us-ascii?Q?7T0uMJaVM46F1Tp1/uwV8vd6SZ3FNCq06Om08xg4TRLEWPtBQOoqKVZRLXIV?=
 =?us-ascii?Q?Z0XI3njRcru9lebOv39FnxDkkazr2IO1Jtww4iKdOIb5fboVW/92AO8B4DNk?=
 =?us-ascii?Q?3+rl0rv5nc55SXy21hZhw0wKZlBbo5DvN5hEw0etBIrLf4UgJgeZXjoEqKLn?=
 =?us-ascii?Q?ngox43APD2VSBb3N+MuTEurYh6Jd28m9LeHMd+Mfysqr58GbQczPHLXLFW4n?=
 =?us-ascii?Q?HTGbKg3apIiS4rWOnUPRGx6+yrVPKIa5RGamVW6C7mpSE76xcVpWgOEbZ11m?=
 =?us-ascii?Q?vpQTOuDG8EhwIQ42j/GHGyyKRcrJceEbXrCy4KIfqTbGr+EtPaydma7NBL7m?=
 =?us-ascii?Q?WULMBqVsXpn8Ltlch4rODDrVlj/SPTLz?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 00:02:15.0715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab052e4-6c84-432e-515e-08dcd12bd40f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 00:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204327

This matches what is installed in /etc/bluetooth by bluez 5.73+.

Also remove the if-statements testing the existence of the other files
installed to /etc/bluetooth as they are not needed (the files have
existed since bluez 4.0).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index e10158a6e5..fd0f58f3fc 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -87,13 +87,10 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
=20
-	install -d ${D}${sysconfdir}/bluetooth/
-	if [ -f ${S}/profiles/network/network.conf ]; then
-		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bl=
uetooth/
-	fi
-	if [ -f ${S}/profiles/input/input.conf ]; then
-		install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/blueto=
oth/
-	fi
+	install -d ${D}${sysconfdir}/bluetooth
+	install -m 0644 ${S}/src/main.conf ${D}${sysconfdir}/bluetooth
+	install -m 0644 ${S}/profiles/network/network.conf ${D}${sysconfdir}/blue=
tooth
+	install -m 0644 ${S}/profiles/input/input.conf ${D}${sysconfdir}/bluetoot=
h
=20
 	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
 		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/blu=
etooth

