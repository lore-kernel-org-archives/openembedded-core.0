Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DECEC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 13:59:24 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.137])
 by mx.groups.io with SMTP id smtpd.web09.11978.1645019960127226080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 05:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=vwJYlM04;
 spf=pass (domain: arri.de, ip: 40.107.3.137, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NY4H7VO0kihYOGt6pz/i2QIeuw8rDiN8UVsjusgdtJz99gjeq/x7UQcW4UnOrLj8nsJ9PGDHwSEFkePhhF4ZvUMG/ePEvMVlrJnOTcSGdfJBLZnzdMVXAtQYyx5zezz2V7CA1cxLGQnStQuXSyfr2xU6hVuhVkJRHinf1Yz9oPruNM1vddA9NqfIukhWjRw/k3w+Gs/vwTb34wcgf4Z4itWB0MVI/T9nOO3Bqy86z3m9hjOwuYvYRv9OG/2pfRBv7Y6E0eRacCOcPtl6TJ7aBP7S7CZDXPWuoLE0a2L1LwZgZTLnLvspQ0MH6mdE7e1iLSV1nEJa2WlXNp93qsPVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSKS/cVcACO+RbERl2VDwBNsAhNzo0PfQXN7mJIwCgs=;
 b=gESdvsVIrF6xUIqpNTjVUYidn76sTtLwBLF+3u+euOuN/PtVNfG5DEW7bQRm3WHnW8GqClFJwVLYB42xljZmWXEnR4fTn9OVhQdAFLjnYKBjGW2AsTQSEX4kxM9I+XzzVnqXVhsflwnxyqQ3TKvQ8jfsOdWZUVLeL5rvWaT7kjbFeWbg1MxBOCMBGiLWFWK/pzf7Cp5dUcrX6FV2X6SNHRPbC9U8lzui+DMyHz1PyVuQ8DKTrTU2jHVxZQMfjzFzpYePvGHl1lZZdE3BHzat+3OVPpIjMWmdT9EMQJLL9jGzUtq3MCjnaOrlXN74eDqvRE8XgXJV23pDTFuel9RnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSKS/cVcACO+RbERl2VDwBNsAhNzo0PfQXN7mJIwCgs=;
 b=vwJYlM04Es+AhZ/E9WUBI869oo1rJnK0OkRwfRQ1qoY2rIteNJcXDTaAuSyhmHFl8MKRfHTWExlMTG0m7bZ2CufKN9n+nX0MAMs1Hi4xT2R+l1PEsZONgD3Rcw9MANhFn7t7gDIiP8UvDjr/c3HzW/pfFyCN4uFd4LkuY10UXgY=
Received: from AM6P194CA0096.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::37)
 by PR3PR07MB6553.eurprd07.prod.outlook.com (2603:10a6:102:67::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Wed, 16 Feb
 2022 13:59:16 +0000
Received: from VE1EUR02FT016.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::24) by AM6P194CA0096.outlook.office365.com
 (2603:10a6:209:8f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 13:59:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT016.mail.protection.outlook.com (10.152.12.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 13:59:15 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 14:59:15 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 14:59:15 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 14:59:15
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH] graphviz: native: create
 /usr/lib/graphviz/config6 in populate_sysroot
Date: Wed, 16 Feb 2022 14:59:05 +0100
Message-ID: <20220216135905.30163-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05cd60fc-db87-4f32-bb1b-08d9f15484ed
X-MS-TrafficTypeDiagnostic: PR3PR07MB6553:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR07MB655349771A9CC08C3D8E6664BF359@PR3PR07MB6553.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uP+fzdOuHwUyFl6dgQ7g8NpAmrFc4DMBPihOPSv/8O6/1hS4Xz7sGaNyypl/g7PV/4VfWLBiUC27JnjVpvU0vGZzrNA6i9U7JD8VjaiCW/TMp73r5kJG7D6j7b/ovLY5T3jy1Yg9oD9bB6Z01eSRbnMbFVATXqVjXc/XQtkzyw2vm2Ipq96cFVzmtYWfCnLBIkvRMcbRu5azAuHzRpGOBX+ZxhaEVNrnkKsUhpR8pkR1qbKp73m+t2ixS56hgCV7P3OLY0Zv14+I+npT1kx6T3ayiC3z/XWfzEpDS1nCB9vOg/8tC90J9IqrheyIEu15TMumToerTMbFj54VK+zgX7yYsdOVVUfLfhH5zn53pWcmuW7fmpr8UkCQsge4Lyb512Lx8Sr/GdrL8vfqdY4dn4rD3J/f31FUZVq6a3Xm71yVuQ+EKz1CEpGKs0pua4l7bBvHQk0fJ/ALkF8zZec5LZ2vvMCwPMvzzW97gWdTEZQkp7CpJq6CgYL3iiqLpj88eU30mghVA0H46UYWIYr/f1jDg2hfV3OSTozehbKzgGDv1Wji14rLNC2jZGVp8M4idCiQaDoETb/irKRLaC2DvXUaag551i7jYqC/gUK2KC7b0ScIPw68PlqBPR25oK3ReuQzL9acmTaOudgCiQMdst9C4BTfrHhY5ZKgFYQPQzRuKEoH4zlC9CRCSHDm+CARuIp7+zpdfx3Sb6FvfCBC8g==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(81166007)(1076003)(8936002)(26005)(16526019)(426003)(186003)(2616005)(2906002)(6666004)(86362001)(70586007)(316002)(36756003)(83380400001)(82310400004)(336012)(36860700001)(70206006)(40460700003)(8676002)(4326008)(47076005)(508600001)(54906003)(6916009)(5660300002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:59:15.8886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05cd60fc-db87-4f32-bb1b-08d9f15484ed
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT016.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 13:59:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161778

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
index 8fe837b75ceb..cc57761bc4fe 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
@@ -74,6 +74,17 @@ do_install_append_class-nativesdk() {
 }
 FILES_${PN}_class-nativesdk +=3D "${SDKPATHNATIVE}"
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
+SYSROOT_PREPROCESS_FUNCS_append_class-native =3D " graphviz_sstate_postins=
t"
+
 PACKAGES =3D+ "${PN}-python ${PN}-perl ${PN}-demo"
=20
 FILES_${PN}-python +=3D "${libdir}/python*/site-packages/ ${libdir}/graphv=
iz/python/"
--=20
2.34.1


