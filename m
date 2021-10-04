Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD503C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 13:29:13 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.92.72.30])
 by mx.groups.io with SMTP id smtpd.web12.9281.1633354152574399098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 06:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=lhwLWZZU;
 spf=pass (domain: outlook.com, ip: 40.92.72.30,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZcBzgbI+syPe1LPF+aKOlupQ4I1mY5egfpKkKfkFlUFevchoe5u5/3HRl1+7N9fklMIRUz1C8RgL8SLnDMZlrGACmDMVCf+SF6nqwIcJ+wk18rrESHHO282acvA+b3p6rHw7ezfDCXCePXxV++HDmXSuDGyeNDdv5JmM5RUgXVN/LY7+cXuzP+Cn+2BPjCCoCE1GUXmUlj7mhp/pg4x89lbJ9M5bYjckiY+xHWRc22SlxYMlezfX2JcGPvVQjDHpoZPkm8ORf3PoTgzjaQznNXBkJYQkxs+p9WcvoS3+ulcjz1RKrE+p1jWadjEcXkBDBIBJWh6RPJzOHjlY7hNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JjJT9w7eXKekYt/giYfBeD4nSqV5OCn6dJ7bysusM4=;
 b=ZVn9QwmajGJOQ6XrzJGsGIOElbECm26FDIayrnUYFMxWvtdRgo+ebUQxCvuzXA1S22q+yArndDsJlXFs1xABf4C+V3EdyUUr+yPR/mZCAWXTqnnDkp2iKkxnY8slnLW+v5iAhR0LQGNoCcJyCdKifCRV3bYrl7vz0kjnDeyYZehx4ENObDh8e2Lb8t5pCctnOF6Yo1JBChpYCM9oWMEkaMVvX3a+tgFdZKHSD6XwonomtdFX11b6pns9U/MRaXi6gH1tPs+h85A2aOIWG03QvI0dYHmedbGHVCXENhtIx4tT1NejLE+3sYH0bqGyBQtIrFQ53Y7F7egONKkOp4p0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JjJT9w7eXKekYt/giYfBeD4nSqV5OCn6dJ7bysusM4=;
 b=lhwLWZZU0NdnS62N9oZP7artz93OWPvFWMiKv/7dvR8ZWDVchgD2KwGwFhHRr+imA1rS3Y04d2tHQyncrXNABIOa1VFw6lA+vqv6W3pZDlN/ZIwMx+SucSQYwejVR/+TkE27Z/TwaSDxvbX/AcLfpqPVoAYB3CKBWQjFcE+j54gJSaTt6r4/Smf8TmqiyWKsE/EsT2OQlofa2zi2PlsRIQ+sl66sWl91Rb0yacnWONaoGIhQdQEDgpfARHa81Dtz+ED+Licxo0RmdT1RX2hf7gqOdNqBPuxwlNzHy4UEixtgxG/MaRnoC94ni4/80hvOHZbkMuDGQ5deMblYwiDL1A==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2770.eurprd09.prod.outlook.com (2603:10a6:208:128::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 13:29:10 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:29:10 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/3] libical: fix append in DEPENDS
Date: Mon,  4 Oct 2021 15:28:51 +0200
Message-ID: 
 <AM9PR09MB4642E51348B43D6184A2DE33A8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [iI8c9V5SXWFLaGbb6BFdarwtZTv0F1T3]
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211004132853.30543-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (46.114.34.242) by
 AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21 via Frontend
 Transport; Mon, 4 Oct 2021 13:29:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 570603f2-6fba-49e2-347b-08d9873af292
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtwQpGLSKUvrClBBalqGM3MCwjIAW89gZaGWc1xhwdKouqWbVQ001yftvsF+z7RlWAAnXXF8HlqPUI094PO7JsLZbGRQYd6vv6ziPOWePSQZkusBK0KXSjvKV/CrgTqkxW290yWVtQn176XYigQ0wZx9kuG5rJh5lHN3pesbGoKXWJ0+jK4xqLL6P6RspDdfIzOGDhiQLWsOShSNnCC1yDWEjZqEU2pT39oAzAiPINwDTf2vb2Y2hK5ChSpNV1LKXainqz9N+aHgaRruflKJnYTtZygPYFbOytVRjiEmYeehQLFAuVZVSWC+88ieP6EkDzOuwanhQNOpyjnUy7JA8x0vxQg0IXlNEKS9kuvKjG29zxAGwj72UDDQoqU9DCoA6HMihClcM7IM5JO/eFQ1eiZmOxfTDjOUkOeCbdepJxxz7JxBYppOcyhp89sX9wIlsNtXYCZLVtDhMZUD6TujEJ6jy0uulGrl0fRbTQ8ihB1S4Efy8a7kjx5O//c+qlbH5IA3P/o/vsQb4edv7UzAoqXw5RE0Q2HhtkRSQoXTf63uKueNOfW/pe+qjaPBcYUiqJ1v+eRS+/KtBURH6hlIOqdmXqOsAu/ZLAXsZ2st9f6q3JoWAsL+7VPjjhH1ul3D15308FzSMsFh0rGjnHjHBD9S+pC61+T38eRENOV+MjZPwIcdg2b56LTx6a+I8cyanLQLrgFa0yn+JEs9TMU4SepIq2Aa8ZWj8WofKYXuaZlB3w==
X-MS-TrafficTypeDiagnostic: AM0PR09MB2770:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Snc1wwsJy1Sbtc6Cjh9Bv1+cyXBNpN3b+6nIgwK6hZEW1NsgperNF6tk4K7y+81SKFwaXBhR2wXIItE8llIBrvlUkUEJ+kMPZGlAT8a8Y/Si0xlsNWCin5rjYbd4X6V3YXZrvqkQLqYkO4rexl8jPwY1GbPW01TZAI1PBBAmtz9kKICKGNzVFGlVXTNIIM1ZKOt1PQeuIFF7yCH71wVH8jfLcpzI66p+eXkEKaS+J2KfOOsdU2gCl4JKXFb6LZUA7KwTETJa6QR2xTo+faEJNCmfSyvabHy8Mnb53RnzWGazf+JoRkB2yD0rYoZuhXc8zI0gLGirr5+hUBb1vlpN5LrhTCbhK5gwPsc9auCCyluu0oUuMj4o/uZJHXsLSoSsxbmVUQc3tYsKfmhS/jlk4Li2uC6QEdfuJKG9kFWGKov19c2oIjrY8fXqlW7LKwz5nQiKdzrBTIy8ni9NXRBgY3mtlZ3NeJKd3rBy44cPpS8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/8ld/SxnTWV9ZzxruDlJwUWhdChUKa9g4B5hJg74q7L3n146T/eo6OA8JvPYX2N2Yp3UirlX5vB9LrtVs8yZ7d90DTcqoWtMB5Y9cGWWKJD5YNmKbIpgBKjEQc5MdloBulsQmSmmmMaSuNM+Y67KWg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 570603f2-6fba-49e2-347b-08d9873af292
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 13:29:10.2732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 13:29:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156587

fix the append with a leading blank, otherwise this messes up
DEPENDS when globally inherited classes add dependecies of their own

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-support/libical/libical_3.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libical/libical_3.0.10.bb b/meta/recipes-=
support/libical/libical_3.0.10.bb
index aa5f11e817..209a50217c 100644
--- a/meta/recipes-support/libical/libical_3.0.10.bb
+++ b/meta/recipes-support/libical/libical_3.0.10.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_URI =3D "https://github.com/libical/libica=
l/releases"
=20
 inherit cmake pkgconfig
=20
-DEPENDS:append:class-target =3D "libical-native"
+DEPENDS:append:class-target =3D " libical-native"
=20
 PACKAGECONFIG ??=3D "icu glib"
 PACKAGECONFIG[bdb] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE_BDB=3DTrue,db"
--=20
2.25.1


