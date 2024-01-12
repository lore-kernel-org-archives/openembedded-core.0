Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85944C47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:14:14 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.72])
 by mx.groups.io with SMTP id smtpd.web10.9473.1705072448548497641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=St1ZL/BH;
 spf=pass (domain: axis.com, ip: 40.107.104.72, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3p5M9bVwR8DjLE7KHELfSzaif8tS65/zPuuVnqu8fWmblWdYWjmPWbraB+iiHTJIuK63ggt8pbQ/CtwkdkEdXKobwmYjkNe6Jiz+a/EpcjWheCO/OdNSFyAHaAQmhXl+rI7ic90yRjprkqYYoz+xrtNj79YVgawrnMpXYCAkSsA0Gdlne8kZ2vAETyzqDJMUILGZDJPpoykHXN1dtWsYT9h09tlzYdN3MYIxn4fdj5IsYRuKkvFj6WmaH2bHx6l6ijlRLeSts98FIpuv/JrA0rFSxBEHKuQOYdCj10M0TusDgo01RVztQrE2OBTWlxPREmqzeJAen3cfND7i2V0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8HoeD8f33Uy8XZICcnYCzJ4Dz5kbNTvDzvS9GwL+jg=;
 b=Ss3cD0RoP0XhNiv/BGnstCbnJJQsCK4HZXZxY4UU4uwH/NpGLS8/j3j8aLfVObNlE0X/aB3Ta3cn3lXwpgUZ2/8IS3jCvceoJhQ6qYybdzJ8BzYXfrYpgUG99ynB2pC5D4klx8EXFBbm4dl8gaMpUGSX0HO4gHObAEsxAOTpYvxAqPDg0KtelW9AVrpHwJ155Pp3OULayiOB5P5K5afYxX4oVqPuy9q6tfJzOD6suXJq3PTfkcRXdbZ8htYbDZAiAnEXrKOh9yneoZXEN79wbxy322n22sQtVxYmxVZW+5p7AwvOt3DACx0SoX7Oxy962PCH/OcM53B+PyGCCD//OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8HoeD8f33Uy8XZICcnYCzJ4Dz5kbNTvDzvS9GwL+jg=;
 b=St1ZL/BHdiXBS6f2PkAHLooRAnRlBCC0xyDUGDBhYZv5bqOZniAF3xLKwhobGmE9fqieqqlSHF+r3sHWWGFxHmG0qB5DgLtI9zcm+HepIZQnYggi57RQTI0Nq/7qvVyPjsmCHQbuiwXAv69kWRCtkmZ/htTU0pOnVDKeCsOLeKY=
Received: from AM0PR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::16) by DB9PR02MB7371.eurprd02.prod.outlook.com
 (2603:10a6:10:248::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 15:14:04 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:208:aa:cafe::15) by AM0PR01CA0147.outlook.office365.com
 (2603:10a6:208:aa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 15:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Fri, 12 Jan 2024 15:14:04 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:14:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Jan 2024 16:14:03 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B075711FA9
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 16:14:03 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id A3ADA8F4A6; Fri, 12 Jan 2024 16:14:03 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 3/3] insane.bbclass: Python code cleanup in check_32bit_symbols
Date: Fri, 12 Jan 2024 16:14:03 +0100
Message-ID: <20240112151403.3810910-3-olani@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240112151403.3810910-1-olani@axis.com>
References: <20240112151403.3810910-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|DB9PR02MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e5e082-dae0-4f2e-fda5-08dc13811da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G5zZIrvev5McMIwkmU/Z5GwMZJNKJnheap8D8TUk/FXfQfM0ZUrfKygjDeAgTLjdrzXIk/QdaY5eVJpKfn/8x9c7U+CKyEuaK/J05gGhgQ1dRa6//FYXIWQa5V3rTV0F2WIbz+eFkyvoK8ti9eu7wr0ylITm/888JaR/2PZrPtMl762PRfWVQT8zgNWDqJnZAEia5WDiTZfs6OaRKSEUGQw+BVw0x0M6tLBKD9nolEIHxspjbrAIwjScpD3uORPewCBIrMZwDvfgLeYUnICfWlNeKdBpbyf2Gjc1uaquSMw1InYp5OWpl37KDxvbJ0Z7uR4d7Eb+rzy9koukhQwCZAM0R+73YvFHpdItiVqZ0DzMLLJh/Dkn/9Ci7pkrBSrEEAe/LnGdSBCZqXZn6KloeWvaT7rajVPh3Ps29I4ukr/7bxtR4IlWYI1DnAIgr6r8KqsQvSXBYKg6Tu7k8x3A5Ak9oRdlQlL/I/N4kBL/vQovkCDVYXQfxBLTCDsLQi/ue+sE4FlqLEDFZNyYFaYkO1wX2QpSreD3PHIfA7pqmIAYUNFRTZt9eG/4c6K4Ss+t30BddNrRxgqm2G6LMFXQk+LWVzrGs9368+1MH4DxY8dBzEqLcglHRXqTPysC3RDAxHHjAlftpKoPy4tWwI5Li88Cl+qP64w+z/uQgonee+j3ga4umcuY/Oj5vJQYa2aqW3StMBf5/pyXEsrzVEQZLbgNT2tDhTlOwero8zZJunpcfxoURRQfgZl1YKbHqgez0luGhiAFjPq9cs0mtSWssg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(83380400001)(5660300002)(356005)(81166007)(8676002)(8936002)(2906002)(6266002)(2616005)(336012)(47076005)(426003)(1076003)(26005)(40460700003)(40480700001)(36860700001)(82740400003)(478600001)(36756003)(70586007)(70206006)(6916009)(42186006)(316002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 15:14:04.8097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e5e082-dae0-4f2e-fda5-08dc13811da0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193590

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes-global/insane.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 1ff6a319c4..26457764ce 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -514,9 +514,9 @@ def check_32bit_symbols(path, packagename, d, elf, mess=
ages):
     """
     Check that ELF files do not use any 32 bit time APIs from glibc.
     """
-    thirtytwo_bit_time_archs =3D set(('arm','armeb','mipsarcho32','powerpc=
','x86'))
+    thirtytwo_bit_time_archs =3D {'arm','armeb','mipsarcho32','powerpc','x=
86'}
     overrides =3D set(d.getVar('OVERRIDES').split(':'))
-    if not(thirtytwo_bit_time_archs & overrides):
+    if not (thirtytwo_bit_time_archs & overrides):
         return
=20
     import re
@@ -1606,7 +1606,7 @@ do_unpack[postfuncs] +=3D "do_qa_unpack"
=20
 python () {
     import re
-   =20
+
     tests =3D d.getVar('ALL_QA').split()
     if "desktop" in tests:
         d.appendVar("PACKAGE_DEPENDS", " desktop-file-utils-native")
--=20
2.39.2


