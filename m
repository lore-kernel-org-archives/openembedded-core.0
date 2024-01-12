Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD2AC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:03:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web11.9171.1705071794982679984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Py2X3orX;
 spf=pass (domain: axis.com, ip: 40.107.7.45, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK5l04EmGr6rUVcK1JqF6oZWprBwdhvaVx2gTrKZ0EGULUscYJFdSiPyK1d5mD0CFWT29P0OlnvgUCCTfM9LzKOzu8Rw/2UvoEVAn2Nf/mCVq5IOnvZQfHllB88f5X//zukIb5AuU1OVH5wzdr61M/QNJt71ctl8yIzP0xediNB4m6V7wDu4o8b1BGU7bn0xrXTTYNKn8HoQ0zUWE6akHO6Z0tMJL03SKIYNwe2UlnM42chEvTaqxWmaDy/E7MIwZeMu4lOE6vJwJWIpxX2iemgcRqQYpizXE/xvZHuDpeaTB+wYBrwWSCxVPMIqjtlknSercezhTF+6dX0pe8j21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18Xk1uGdv/ONmsOd1770YT4zhbSArKHtLYoePY3TLkc=;
 b=K4jrKfTRIBhub23mgqCV4cCGees+uq3gmc7YMfg1/8A2Ij6KYBrDllbea9myz8mAawUV0FEoi0bPdg/gdaKo6yVABNd4i6EebduSl/0GHvtG43pwaeKYXHqcx2GB64BETEXqfhzbF3POeqdCg53wbJl5DYtGEEF59dyxbANB2zX39JahGgkgOse66Le1UajIxE8YErAJm9IZBSfX4dHc66ha4unkVKi5u7z/blgiCosAD9izxd3lch6TsGCjTyEGK4CGyS2m/RLDxqpUI2CLlgxAiF+U/M/cai++ZQQsl7UFuYjog7H7xL0ujIKbp4P7MlPKhIq+X3Lf6goRP1/KTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18Xk1uGdv/ONmsOd1770YT4zhbSArKHtLYoePY3TLkc=;
 b=Py2X3orXBs0GSN6R+SzHKrmQFaLtGyQeKDRf9A19hZ+QQJRaQljk46ybp5CKNr14Gsa2nyc5JngeUj8/NPKnfV3TbwcA4sc2iPp3FrxzU/4ZCH5smx7PJCibaMReqCOwgnpdRUBDqd6iKq7FVAXUzNV1wapnVVP3KOKMkfHlEVk=
Received: from DB7PR03CA0082.eurprd03.prod.outlook.com (2603:10a6:10:72::23)
 by DB9PR02MB9801.eurprd02.prod.outlook.com (2603:10a6:10:452::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 15:03:04 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:72:cafe::ed) by DB7PR03CA0082.outlook.office365.com
 (2603:10a6:10:72::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 15:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 15:03:04 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:03:03 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:03:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Jan 2024 16:03:03 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 763C511FAC
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 16:03:03 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 69EEE8F4AC; Fri, 12 Jan 2024 16:03:03 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] insane.bbclass: Python code cleanup in check_32bit_symbols
Date: Fri, 12 Jan 2024 16:03:03 +0100
Message-ID: <20240112150303.3807006-3-olani@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240112150303.3807006-1-olani@axis.com>
References: <20240112150303.3807006-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C1:EE_|DB9PR02MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f529d4-875c-4534-705a-08dc137f93d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+pgeshz2lKyBHdKBS/IRnLVv2G9/LXXLENunX1Qx8dKvvS+ORfPqEyi4Fol9fV1i0hg79etMokskFVh22tkMJFymyn7y/RZJz5N1okIj/CsFOECLWWz9+GYsLeUQBIrviSemB4JBlhQt52OKO3YdO+ea42DC1aLvt7ilOBU5sRl8L9gzf0AnNjgNoBxkd9zd9n3EgBrb8k0ZtvKiO7pzw4jyf69hmdRqLBEvFu+Q5jKdoQq5W6Mj2juywfAVNbHkI82o4qznYFZweNr4FVAl5BeuZhM2FXbM203jIY1fIFDr0hqxfsxvT9cw/FLMGOkD5lh7jnhnBstKg28JxUFiwDZt5Sp6ffY1GBl+mgUjLrCLpUG6Pqv4W5bwzSYVBrExLCvDe7V7V2SuQMaxdo+EdLvTVuyLQFBCwUAt2fAKprIOB29MjMIeLy3/1IguBBOCObK2ARwWdEwvUyyHSLb+sHePnlexl0rdOnYKBsFokOk9+xKKlaPWBQJPz7jqsMQJhpwtod6xYKWpyCYDD25tMNoY7hdezbhy32Cg60A7w16w3ZtVnnYoHUTouQMPg5Ip+mgTF27m8XHy+yrSFO9k0+OgwvVL/C48L5BDnJPPI6ScmLMd4lUN/JJ7RXWiIBw+f4kdHeGagnNji9/IsboU/H0m3+CYO94h5EIUXg00QKqwRlVyIIsWbdmGfKDnDMsV6CnT6wiWb2Vl33PLk4TXtA1QIE95pf+PgFfHHF/VOAbnz5eKHZHBoJXvnI388KCggFWSnQGmYIV3+cNz6/PDyQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(1076003)(26005)(336012)(356005)(6266002)(2616005)(36756003)(47076005)(83380400001)(426003)(36860700001)(82740400003)(81166007)(41300700001)(478600001)(40480700001)(8936002)(40460700003)(8676002)(5660300002)(70206006)(70586007)(6916009)(316002)(2906002)(4744005)(42186006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 15:03:04.0868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f529d4-875c-4534-705a-08dc137f93d3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193588

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


