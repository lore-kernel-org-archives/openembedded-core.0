Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062D4C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:16 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web10.6992.1637765289962517376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=XZe8WkoV;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFPxIhI4ewAtQkJsjggM38+Xg73k4/RRJyivJO+jRVGYkp3YJPjqs3MhDixi/iOVRHdnVcX51PuhBVy3oi3IVl0LFhoPNbOgkMHGWQRnXN0+JX0ydubih9GBAdFcf6PVs6Cxp3mtKioxRQbQkp9vuh3U0P4SSJwLHyaA8d10aCdkI/IBkGHt8QrwUO7LlOkU2elb2hZOnTBIz7c3b4/dK8KIDOS25Fqp0XxuMXoQvBzLmPKjd+mXGasZGN8yH9u/oSoOipL5mKYLqkM0sXtdhJYMou9M6YWEasIoeZOf7fshpQ+3mvejQbMvK+fCqKXP9TK9Oacg1MIa31jQ2Q9bVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peJRgd6cp8iI83YYju3NDmFLnOG07Zv21wVhpU5ilsM=;
 b=NZQDTclOang6A1Nk4urY0SA3sKnNs/dVFrPPbQbkAKqvko1wLt6yU4ACS5FUHQYAn9zcFnjULXx3UZWiRNvPhs6kDpiMJZG2mCFDWO38tT/ewTBye0HEcd2kNcy60+wVkrwGkJrYURV7xDVrYBNXcpCwU2UztAA9UGfZZYm6TD9Uvmfa0fEHF9BEpIg4ZVxUF/MaVf7NqXmjKFdS0DXuexKDr1CF0p5w0JYC17yHP2kOFxfm/I/2p6z6UWqDEU2VsaychU7hFjsTOMkkboEyxjy9koRBu5J56GURV/s9dusqDxSg1PqgMQRDrm0Lf1mTtmJpFgCFnGQEYnOfld83cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peJRgd6cp8iI83YYju3NDmFLnOG07Zv21wVhpU5ilsM=;
 b=XZe8WkoVIFQNKk0lh4ubWI6VGqhx4tUNJxiK4lJ96LdSa2qHUyeUH+ndRr/erg49rkF5GoR9gIKSmqDAjEY4xWVjPcxb187GLrF/upIPXukpj4Oe2YkYYyAnp2u06QoYTFqUD8eLL0B6XuLNzpsh78MqJj0+hk5xgqvaS0RSbqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:10 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:09 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 11/15] angular: Add support for angular projects
Date: Wed, 24 Nov 2021 15:47:35 +0100
Message-ID: 
 <20211124144739.2250-12-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dc33a58-3e5f-4a5a-0e07-08d9af596ee5
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5801D5347A859FDE9CC8C602D7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yq/dK6T1ynfwDgW5bYzkKfI+yYm/WL7I8sgC3IRhN+K7856se1jMg/VsCDHsJ6F3uBHtNk2XhX/Zn9ZB0lZhKg2/zK5maJyWqa1tg9G8daWPJMa0Kt26iw5UZD9qN09JBBTMtOyb9FXLczwQbDykRB7Eh1ilhhGpVlqXJt4q4U6ZTA+I1VCks93hSo/rqWhfxElT7xAKeP8ohXoGL7V9YF2CrV8shlT3ihsje7i0jyQxJXekZ+FdqQmRtchTkpjmouC9rNgEe3GxPXWvc5t++kfGgRkIh4mRRwL6Iee1iNEdHPjMxgNC9bayO9pisUN6B2bufIuh6p7U0TvOj1e6QE89bODiVfCH1aWWXca+3mzmWKeZNYbBDaG4AWisM2CyhkroBTLvAceaJIuiHq3gd7qR0pGtcCuUyZo2K5fKOy1kI9OEhEvq1q8UaEdq59R2nU/tmls39jtc5RgYIQTGhRuSTnOmjUSpXnEVDXociZ0BvnnIvnv3pHbQ3gGJUlVgufSzQjzPaOAsBQk/pQLmOXv+bmbMSsAnOulfscCeu6TSF7+E0ngppA1SMiQkr5Lgixc72U0y3CqJSMKNHzk5QWF9FOBOAR/Vnt6ItZ7w3yazP/1X+yg8fXKNIpPkdsoYg5u4PaCOgDd9+l59qenCvp+BH7QOURF81P6MHKgHJO2NSuWnG6jWyd+ehN8b2CQoLoojT+ZtV4QKc9uD/RWuzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(186003)(26005)(1076003)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h6lQoiFmrmobne77ZTMQv3D2Pgxk6ftwqrGUwFBK/iirw/rCemSmm44hdUHy?=
 =?us-ascii?Q?CIs7Esuh7PAhf+s0fhaQnZOBGTa8LloZQa314WDcjAA4MXSIA7Sp84sxlviK?=
 =?us-ascii?Q?xqBSlLpewJFLIYXuKbQpWN8cTKUVXY7xy8CUEVO20G9o5wns3W460KB/NVtk?=
 =?us-ascii?Q?E1yE1T/l4tCYlZC3adMbu7fITE//SZ7HTd5Bys69Lp9H7B/r9s5LlEQ/vDr+?=
 =?us-ascii?Q?A3XCC2i/eVBK112tfPYfXSTrdi4cv6G2Lokgt6mMIPvEIcuSWtY7uSUHMWSk?=
 =?us-ascii?Q?b5TOU4Lj7r5nhSHlcFhpy3wuoAU3LMbAgsxV00peL/I3LERB0xfUbEbtcfnB?=
 =?us-ascii?Q?Xvut93hufWQUyS2bp4rqbtiyRqDo2zTZd30qqkJ6Je1vMqBJobba4z9OtjP1?=
 =?us-ascii?Q?PpM/pl8059Qivp0Tr2IECHdhuKIGvZAUiN4ite947yQHRFc9XuSIuX9NfPvu?=
 =?us-ascii?Q?IWKz7KrUoIG567qETpJvGtdb0QHj8BXNVzZgDTJy20rtqymzHI0ZG04io2H/?=
 =?us-ascii?Q?4TKA1nkhbEdWRdAMTXlhTXIMVYkMnPKXJ4ciAzp1FHSNmxuttzpJyWsBX3l0?=
 =?us-ascii?Q?F7iPY4jnQkCWJaK4fNJgU+qaOgxIpDo8UIIVsjUJsb+mw8eNX+qHB/ix5kpw?=
 =?us-ascii?Q?QlCnl/tBaoRVXWrCwC8A7ZMH+ogMwhnZEqlizjj6VxJ06TKlLUPDxLgpsFTw?=
 =?us-ascii?Q?tSotTrGPaRAkA/pRuw0AJtnX/werGdjiqrJBjRWf2xYL34MDJrC0uvWHr6/P?=
 =?us-ascii?Q?7jwtdXsSPl60JS2ev2cClVUIV+I+wep8BL7Da0BhIgTuGQHqkLRyk5gIe6hC?=
 =?us-ascii?Q?iudz9cWH4KdqkwxZH/j1uEitiHK3U2CvOfmMZs9iFNcs3hFMquan19dnnU4g?=
 =?us-ascii?Q?0PuGevKRiqKKteXjjBpkcljqYnDyIM1I9GnNLFDOF0kedB5rCzzEMBuh1ybq?=
 =?us-ascii?Q?fB3lIYW/b5cd8to3FBhpfqlG3p7lZmBUOZa2lYukMCWOWbgd0bvWWb4pikLL?=
 =?us-ascii?Q?aY5WA35GMpwZLuBZSNZl1Icl0+gNa8ufJOjFhBa59+tQR4Jn8EYjj1ub0NsF?=
 =?us-ascii?Q?oBwmEDL1KrS1fD3gMw/a4Rrc6Ch5/72aPdvH3pl9npUa81ALR4VSlSk+R5VN?=
 =?us-ascii?Q?4g2FDHSwj2/1GMgZZwWjVyKlV0qsOeBXg/0k8ttuv1t5APu3GMSl3y9ByCu3?=
 =?us-ascii?Q?JjEgzl/fmDsNDdvpmuPEMPxeBeCIMZtbp+f8ICUQGmaf2uXKCNBAvkLyyU3V?=
 =?us-ascii?Q?W2SuWDC9RclQdYw1ffX9lXaBlZmzIEvNeeP73YJ/x21PLhUQX8GY1yFLdQL8?=
 =?us-ascii?Q?YFw4w+wRiBnNRtSOAFUZzTUvWxBNCgAvFB9bWr3UvAUUE//HwEMhfgY5pJbM?=
 =?us-ascii?Q?6bheab7SzizpWvkx7f7R4nb/0CuDqMeVC6k9b9kJl7tOt2l2kDl9NMWUnR2Y?=
 =?us-ascii?Q?ZqLEyi46cBdVzufSfOWEZBksZJ3IL9L7OzzsGuU8EXkDv2m4hurWVHsnGlBt?=
 =?us-ascii?Q?EDhnTtJhJeWI1M0uK/tTifs8lu3Ikx4lE/7Mp3nBIOB7mFietpOFGBu5nxFA?=
 =?us-ascii?Q?DGnHB+18f4xxuPBeqhchIUC7oqY6JVX31WbdDtEhlX+8OQrhpKRbnbZuMtKH?=
 =?us-ascii?Q?KQwwipxcXNS9rGFs3cIHT2A=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8dc33a58-3e5f-4a5a-0e07-08d9af596ee5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:09.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yXPplO8Nq1B2Wm5QTtFXKjpXkiG87kwpH7upwVwgKE1WVCr5DSImzwyipyghzPOdW7TYo7MeGECjZyKpA0Qs1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158704

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/angular.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/classes/angular.bbclass

diff --git a/meta/classes/angular.bbclass b/meta/classes/angular.bbclass
new file mode 100644
index 0000000000..7560da4460
--- /dev/null
+++ b/meta/classes/angular.bbclass
@@ -0,0 +1,30 @@
+# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH & Co. KG
+# Author: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# A bbclass to build angular projects and install its dist folder.
+#
+# Usage:
+#  inherit angular
+#
+#  ANGULAR_BASE_HREF:
+#       Base url for the application being built.
+#
+#  ANGULAR_DEPLOY_URL:
+#       URL where files will be deployed.
+
+inherit npm_build_dist karma
+
+ANGULAR_BASE_HREF ?=3D "/${BPN}/"
+ANGULAR_DEPLOY_URL ?=3D "${ANGULAR_BASE_HREF}"
+
+EXTRA_OENPM_BUILD =3D "\
+    --prod \
+    --base-href ${ANGULAR_BASE_HREF} \
+    --deploy-url ${ANGULAR_DEPLOY_URL} \
+    --output-path ${NPM_DIST} \
+"
+
+EXTRA_OENPM_TEST =3D "\
+    --browsers=3DChromeHeadless \
+    --watch=3Dfalse \
+"
--=20
2.20.1


