Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62292C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 07:02:11 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.131])
 by mx.groups.io with SMTP id smtpd.web10.2259.1648191728517742177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 00:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=zJvFFQfL;
 spf=pass (domain: arri.de, ip: 40.107.8.131, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1FeDsBCivX8U7y5yGVssxOkuotYBP9yI40OMHM+FFzR8NImX+tF6vesL1gjiOOO8IrvLeXgmhjsByvNQMYAhmn3bJTq1XLM3iS+Cre3zwNw+CdqaaEXdKUw6yrfq+nC5PA+KvXcPu81bECWHIDGYCwNopnNEuzhgGbfNY8lTCmi4labQ1rBnT6OVz6z/TNeSWvBj8I/5QHDyPphHruCx5Uo+3wEVM2ahYoJvEj6ATQjbbPtlfaR6QT0eHJZnRc9QlOau8xPwn1Y9kqpTkJReA6csrbuWj3Rx0ZuqBST+4F+HGc4WUoOSog1Jl8+Dg2Ix+izjSbJGxEPfdZzEgC03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoa2iv3OQ+UATgTXR5CeUedfWpT8DMZtkPAmfkPIKZE=;
 b=YGWGOt+4oG4gxh2yshiSS3OZjwHzIaoGxDTlS91fpTZ7HWmpfFcSFI7jmYoe9IPqF3QUcXxsjTh4otDDhDfMo9vA/kvPBizfs0dHFlUYQXHX5RIHjEKmTLKPa5rtQtHo+s+4J0kajIZjReLYBwUhm/XijF9VlJ/xoShW7719IBxnV1ezjV0mezuQ/HobnRmk+kotxi4JI+gyrST1dWyHfupTLjpj1D94RkyvfPLaV+BwYcr3QJAjHyeu/aVPg9J3877jL4Hn4yynl7ByNSqiEx9+nN/W/XDOFHedJ6XG+LkPrlPCITKOKhnsnwzc+BOZbU6Q+/F/CyrH2BydRYrisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoa2iv3OQ+UATgTXR5CeUedfWpT8DMZtkPAmfkPIKZE=;
 b=zJvFFQfLYueSLZFvoOyPeyQYrfxVTZZj/o1wwWfEhSXtnXp5Px2usuXds/UTsVsomCVz3V5DufKl9Sa7pXr4wm+t28kFQxDKYHjJcIEhebfBpu+jLk/v4cgZW/EObXYxUA3XQRl7MSWKvvIfiqPpMhP0hsz20uo1Ofrs86tGuHI=
Received: from AM7PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:130::30)
 by PAXPR07MB7886.eurprd07.prod.outlook.com (2603:10a6:102:13a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.8; Fri, 25 Mar
 2022 06:53:04 +0000
Received: from VE1EUR02FT030.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::4) by AM7PR03CA0020.outlook.office365.com
 (2603:10a6:20b:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 06:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT030.mail.protection.outlook.com (10.152.12.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 06:53:03 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 07:53:03 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH 4/4] librsvg: reenable nativesdk
Date: Fri, 25 Mar 2022 07:52:26 +0100
Message-ID: <20220325065226.14833-4-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325065226.14833-1-ceggers@arri.de>
References: <20220325065226.14833-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbb71ac5-5dd8-42d0-2f9c-08da0e2c1c05
X-MS-TrafficTypeDiagnostic: PAXPR07MB7886:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR07MB78861461B77F19E40EA978FFBF1A9@PAXPR07MB7886.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S4fQ7/B4/1Edh35/RVs1kBDkvQicgWd+HsHdI5+5GYESFlHZCnuSpwLbHPpK3nnI8NIK7/1/mreu+e1zg00/+3Igu6Pcj2RXRBn86sYhg6C68iqSVbCNqIW/yjybp5XNiUIMQ9BoYKAb2yKxLupjpnvh5MfRMid4YT46+aCdPYu2qMFUMqQ+6i7u17qx0zX+ELmU4qnEVzW9PYnlCsC+WtEgppKD1zSbn8T87u+PjNgcGNYeRWPVTytk2LXS6tdR4ojyXsP9bXTIKmh33HE0qNkXuzecp5P02ENTIAylpnsLduunUs0o879J+CIwQwpYMiXyj85koweRRelNoZZmyUmLKzcQcVxZ9707imzZb+nN64eLofPm0lUyoo1zsIg/lguE+pB30X7ymBgfSHPDXsDocD5E74RCuwqYaljSdrHjKtQIctZeHblnGwUMlfMm6VNoKhsbNwi1U31c/IoQAx3fmMOmMGuyGXp5KDexaBMJg4Fg4qXwNcT+1eOc3Pw1kUp5sZ6s+JDZSOC5XQDv8AJ7RcDazZRNpORzaX+m0iHrrOwy8WxM2YVebB6uArWq9uOj7bIfNf18DDWk+yKZk18N+VvBCcn8O2DW7YP37ECvwJexb0Wj3+VCfvCrsy9K/dOQ9hNUTdIE4bcudyvnasJi7gvuL0Xiasql5gNP0zx0s+5h4YUeZfugEDYrYh/QRxPpvRaAxF2qw6kpaz89q2CS7RqFMJ2Da32CgiOvQMjkF9YGiO457f4oAubgfzqrGrh7/MJAP+oYlv0LDfkXLA==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(6916009)(1076003)(336012)(508600001)(2906002)(40460700003)(107886003)(426003)(356005)(86362001)(81166007)(186003)(2616005)(26005)(316002)(16526019)(82310400004)(4326008)(36860700001)(70206006)(83380400001)(70586007)(8676002)(4744005)(6666004)(5660300002)(8936002)(47076005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:53:03.7329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dbb71ac5-5dd8-42d0-2f9c-08da0e2c1c05
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT030.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7886
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 07:02:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163631

Rust is now available for nativesdk. So the nativesdk build for librsvg
can be enabled again.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-gnome/librsvg/librsvg_2.52.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.52.7.bb
index eb420e732cc8..78eb93c6351e 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380c=
dd255951079008b364516c \
=20
 SECTION =3D "x11/utils"
 DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-int=
rospection rust vala
=20
--=20
2.34.1


