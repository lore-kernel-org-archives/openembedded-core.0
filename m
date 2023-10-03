Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A84EE7542B
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 17:45:14 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web10.115163.1696355104365726886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 10:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=hOe3yfuR;
 spf=pass (domain: axis.com, ip: 40.107.7.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMrRfcJi8pO2slMJo/wiybwF4ciUuv/3yEyHBLtoXw8gCE8QfYzFYpPeRjJxv4M2bXcBkCseS9E3LKqmFvL93L7JK7lhkNvDeJWGMglXSYdz2Ep/KvjGPyj75f9edUIiicgtguVuYalXaQ1pFl3tNqynvnQgPX00juRzY6E26XbOtxYN9UFaV5KcP4HoHOUq3LoXBICa+S88Ck/IND9AKBsawkujIrjFkVGLxLpqiq+jhR8b88yMxko0rFJpfQKQ26bifWdVw7MQH2KU0GNyvuKpApcYD0X+3FgOU39Wzana3sE0egXUD3a4rBOTiR+Q6clb5lduWkaEON0inElMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVFbfd1zm6FR47OTDm9eSTp9byY0EmPZyVoBmgs0oR8=;
 b=IQdnKj412Fl3tkUGkUS0EIMguohkdwAKXXPsZ5pZ3bHFxEs5tL+Asd/MSjl5Aksoo2kBpvC5hfs9BDSgU2pmQORHxJ3gMsJHxJNLcIbNYJlpm5akLF0qyajGuVhkJhhqwUBaqn7s4Jb7IP7gSlyohzJL1jQY8Ho0oqi027Zo1W/e7bFJKwBB5TDOjzziRufo/lTA8k809q8TgrsQxMfposCjliVpza9L58JU/jXxa8TK0Mr2xz/jU3tMYlqQ2BO0BfjZ3uA/W1GIe+43fQ4phaa9IsdIoMCznv1m01P5xci6/JThp50Xwugx05xYieJ+hOpgFLFR22SH654QCJVIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVFbfd1zm6FR47OTDm9eSTp9byY0EmPZyVoBmgs0oR8=;
 b=hOe3yfuRYBWa8ClZvA8cUXd/5qKY4x4Tr5PuqjCtskohfRPhJoEWwpfyAQWPHozz1ua4sP6VDCCnv8LEz7x2/gd0vnVbOsderzb/zYmALsVVkTg4L7k7klsfnm4Arz0t8P9mfifFefiIzQDTtXq16N/mmhpgrpk4lEDch3ADECc=
Received: from AM6P194CA0099.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::40)
 by AM9PR02MB6914.eurprd02.prod.outlook.com (2603:10a6:20b:269::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 17:45:00 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:209:8f:cafe::8b) by AM6P194CA0099.outlook.office365.com
 (2603:10a6:209:8f::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 3 Oct 2023 17:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 17:45:00 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Oct
 2023 19:44:59 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Oct
 2023 19:44:59 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Oct 2023 19:44:59 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 708961EE3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Oct 2023 19:44:59 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 393HixqV3783098
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Oct 2023 19:44:59 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 393HiwaM3783097
	for openembedded-core@lists.openembedded.org; Tue, 3 Oct 2023 19:44:58 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] packages.bbclass: Correct the check for conflicts with renamed packages
Date: Tue, 3 Oct 2023 19:44:54 +0200
Message-ID: <20231003174454.3783065-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70B:EE_|AM9PR02MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ef9c39-d877-4fe6-c98e-08dbc438774b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L1atnhUf1bavQ8wKS7XNSlHavy6qBy9STTRmUgAartBrZVLXw5CrAEuwv6TxzKOs/cD8Ya0GCzW34AA51E9R0Dai4htJIPDyFzl/obUPRIG6ZZ795ZdXbNyIEyMHG5gt7wP9goVS5W644ddiHRZAQPljmdaf5sanAqi7d2IsyjG0UbfIP8qmf35fDIjjhzRtL9tIYhpHJroL36q3zTQUCjO56JH1YYiFP2cE6w/s/qd/EpGq7VAK+DjGCQ1/xH6T9/2SF53dFQqlY6ELv+5Oqx9TlovmN7+BcR8BIT/bWp0p4RH4ePjHJccDU2bFPM/+Ti+nUUYAhfkHybuH5N4bYB53jwINoRSIPokM5PgRDWc2toX3sULQXHmy5bcvV0CP6hIJe8+Istotz66EyKorcgvyD72dfzsGV5xrQxs7goUKflNe0hJ6Wd6YjrloD2hKu1ltghcpnotmtN+qnDhmJTuYLSBrNU4Qi8BjDwDmRCagkpT1mKn4766z6FrY7Zj/BFXUDdqSD3d1bI3Kw5MMaWuIJR6L29Sn4JGLqGMU2SP4XiwtFEQyQo7o99lnKpJ/9EQBqJDfA55sABki+84twJ+I//IiDbyDPEoob/MCPQjt81W3jxYdrvaFWPuz+pBcyh8cfK7PnaOsOIIYA9IexiPmXGFM8PsjxK1njw94Le4kPdjS6OaqicNk9H/cJ2YKONgA5uZzaIobDkt7z/rry0rTdCcJqqdmY3VIYmBmHXvrToTLsunqDrd26NU3RzzGeA0r2PkkhCd69bFgMe5NQQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(346002)(376002)(396003)(230922051799003)(1800799009)(82310400011)(64100799003)(186009)(451199024)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(6666004)(478600001)(82740400003)(36860700001)(356005)(81166007)(2906002)(6916009)(47076005)(83380400001)(2616005)(426003)(336012)(26005)(1076003)(36756003)(8676002)(316002)(42186006)(8936002)(5660300002)(70586007)(41300700001)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 17:45:00.1100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ef9c39-d877-4fe6-c98e-08dbc438774b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6914
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 17:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188646

The original solution replaced all overrides with the package name that
was being checked. This can have unforseen consequences where some
variable involved in defining the value for the PKG:<package> variable
may rely on some override which is not set as expected. It also meant
that any PKG variable set using an override would not be caught, e.g.,
PKG:${PN}:${MACHINE} =3D "${PN}-dev" (made up example that would always
fail with the old code).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/package.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 0338a5c690..7787042e21 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -508,11 +508,9 @@ python do_package () {
     # Check for conflict between renamed packages and existing ones
     # for each package in PACKAGES, check if it will be renamed to an exis=
ting one
     for p in packages:
-        localdata =3D bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', p)
-        rename =3D localdata.getVar('PKG')
-        if (rename !=3D None) and rename in packages:
-            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but pa=
ckage name already exists'%(p,rename,p))
+        rename =3D d.getVar('PKG:%s' % p)
+        if rename and rename in packages:
+            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but pa=
ckage name already exists' % (p, rename, p))
=20
     ######################################################################=
#####
     # Optimisations

