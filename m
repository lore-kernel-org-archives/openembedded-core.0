Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1111EC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 13:48:43 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.90])
 by mx.groups.io with SMTP id smtpd.web12.11843.1645019311492404450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 05:48:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=tzBBIhVi;
 spf=pass (domain: arri.de, ip: 40.107.1.90, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCHD4krOMzXKVIYFXn65naHJqamdIJn2/DaDnf2zUe/Qa9gBD/r/ttarb4Z1jzkKgTcOwHC5dOVjSvnOQjRPgOM6HTlQTgOnp8a0V6Gh/Dd+P9srRo6YDv/EkFdea7w0cRMeZQVoYcHcL68wn/OyFnjW3w8CYrzKSWt6VWEUlhn28e6vBRqG47Ba6acUMeuajdEqu9nAbd0etQTZg5XW+Odk057/xDpqHXn5bIvoAxR0dAHIHfYblXtO3OrAFfYy1ayagFh2vQsu7C4YqJmIrHMF0/8Yex9rLl4+iCm5c/NSDySVMoiFDRENzzIrvzBDQO+kOtNioY0S4T0CkYtW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ28BIe6z2emn3pjVE/IMUQyzL6CZ1q4PmR/j2yy5iA=;
 b=WEphBf/cCTrrispeSJrUrY8A/5aIeQDjgjFjB/gPYrlR5YODtFobH3CTiThkgYbDDcGdltLQVwSyIgnfTvjgNRHXIcRDpg1HqdJhUW4+qVp56v/XzHebCif1DkUYOWs7hSU+BJS7Z/fb+V808iJlVK8xOZuYo8RC4n2M2NcFzCls/mziTFQJyn6AERsFdgtQ1aNhCLf4mgFkplb1k/C/3DklQAmaOd88Ws6W1R6nFCsmuiTxm+nf0FGL//WPYZFQyRevKA58kfhcRHmRGkD77FjLM3F40pDZMR2O+iyrsllICFOMHvcuwKFJOAhX60icheqwOnjtMlFYOGvw28jPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJ28BIe6z2emn3pjVE/IMUQyzL6CZ1q4PmR/j2yy5iA=;
 b=tzBBIhVijPdFJymyN6wMBdgO83qBs5SbT3Eiwcf46nHuvyMrW3rOAeTZ3qfetr4KXvqhrQdV/YVKOI0vWnBN+pXmu4gwi7oqsOZgAnRy1c1c2YQPsYKQ1VzNdhRl07y9Dmx6th7wSIOSnhFK7sYurHRfy6H/aI/dSgg51oMMkg8=
Received: from FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::19)
 by DB6PR07MB4214.eurprd07.prod.outlook.com (2603:10a6:6:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 13:48:26 +0000
Received: from VE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::b2) by FR3P281CA0028.outlook.office365.com
 (2603:10a6:d10:1c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.7 via Frontend
 Transport; Wed, 16 Feb 2022 13:48:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT063.mail.protection.outlook.com (10.152.13.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 13:48:25 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 14:48:25 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 14:48:25 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 14:48:24
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH] graphviz: native: create
 /usr/lib/graphviz/config6 in populate_sysroot
Date: Wed, 16 Feb 2022 14:48:14 +0100
Message-ID: <20220216134814.9557-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2514c1b6-218c-4dd6-e5c7-08d9f1530182
X-MS-TrafficTypeDiagnostic: DB6PR07MB4214:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR07MB421497D178D5FBA500FE49DABF359@DB6PR07MB4214.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5PdYXD06f1qmE3L+4Ay+3tEGyAHDftyBHdmeILMpgUWpMb1y++0ArR2n6lOO0+3nQBWsWOSh2QNqPVuMeQd1GHRTcSuGCGsF/qgp8fu9qvAJzIm06OD4k2EVjx+cCT2qExAO6kKIBnhnKaMkepwmFllviKiTVb5+YGb8UkGMS+0W8vVGPRfnyUIYdvNVG4nwkwnWqt9iUDuaT6SWD8a/J2pHLdgH+LU7YUTHqmt7PES1fKmH58UYpK1t9rDH2UhMlgp8ejLovoqJ9YpFmIeRei6780Zel0MZ4SRxF051LcNi8tNX632ldT/ZRK6Pia7bRbNgAansvTI7DF1Ee6MJ/x8Wg02+PITdQtqQfta171jYzCL6zTa/hhT9gLe/BCH3klxv9vSnv3KpKAn9PWU/FnhCwK+xbGAL/8FIm/cZtxYrxsuzv2otGYfyZZ5rB0l6nBK7jl914H5DG0Csd2V2MR7zQo7hoCHG4CCEj+CmeZlw8ZZJi8P56aqp2AXeh9QOd/Z9/x5aV0k9mmzIH7d/rtvArcdeHh3vH3fvCwlCCyoCkwOXTBkb1Z38oyDm4MkFIrEqxBC7I0ueFIi2LqC8PSyKbvdTf+gUwy0OiW5k9BbqoMj3KDQGLXKLKDdMDywawSwrixzB2CCKk7lvWhZ0anKzaazholUxv1u7PgaPZs5I91FN9LMCCEcfidCCFtRi
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(26005)(47076005)(83380400001)(6666004)(5660300002)(36756003)(2616005)(336012)(16526019)(1076003)(186003)(426003)(8676002)(36860700001)(81166007)(316002)(4326008)(508600001)(356005)(70586007)(8936002)(70206006)(2906002)(86362001)(6916009)(54906003)(82310400004)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:48:25.9102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2514c1b6-218c-4dd6-e5c7-08d9f1530182
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR07MB4214
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 13:48:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161776

The `dot` tool requires to be run once after installation in order to
create its configuration file.

The do_prepare_recipe_sysroot task uses do_populate_sysroot in order to
prepare the recipe-sysroot-native. Package postinstall scripts are not
executed for -native packages, but files under ${BINDIR}/postinst-* are.

This is quite the same as graphviz-setup.sh does for nativesdk. The
general idea has been taken from
OECORE/meta/classes/pixbufcache.bbclass.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb b/meta-oe=
/recipes-graphics/graphviz/graphviz_2.44.1.bb
index 7d2515e07549..203e0206fbfe 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
@@ -74,6 +74,17 @@ do_install:append:class-nativesdk() {
 }
 FILES:${PN}:class-nativesdk +=3D "${SDKPATHNATIVE}"
=20
+# create /usr/lib/graphviz/config6
+graphviz_sstate_postinst() {
+    mkdir -p ${SYSROOT_DESTDIR}${bindir}
+    dest=3D${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
+    echo '#!/bin/sh' > $dest
+    echo '' >> $dest
+    echo 'dot -c' >> $dest
+    chmod 0755 $dest
+}
+SYSROOT_PREPROCESS_FUNCS:append:class-native =3D " graphviz_sstate_postins=
t"
+
 PACKAGES =3D+ "${PN}-python ${PN}-perl ${PN}-demo"
=20
 FILES:${PN}-python +=3D "${libdir}/python*/site-packages/ ${libdir}/graphv=
iz/python/"
--=20
2.34.1


