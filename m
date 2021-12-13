Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBE1C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 09:16:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web12.9142.1639387009113439422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 01:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=paCtJyoa;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLidkfOuacvfqzkKQ+bH5O1RmUNgxVp6v7bdbGXC/9lqCHmDnW7I/4+V/+lOp56rJpy0pOjSjSEY25qG4i7xYPgT1Zdnsyoz3x8yUjrVNpESfM2fAzCG+QpuGfjsGjKOcNpv7mdpgTMPNRkM36siZ5q0QRbf5aZQxe+dnyMl4Wr0pz0VibxxLNuKa7njs0wrmUGUOdkFLL8u2SQofBLAAXkXthhfoAG6BoFzZ9LDgBg+yTSYXbIedDxqZRUMYoagKPNaEPIE6wLZFQO42NZTI68Fx0YOZjtjSj0eMfScwXcgsgmrnW0ETj1aMp00uJZ3S5D2tK665ZXDusnqYIxyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxFETK5gkAZDueY90vPk3b3rCUGkZP01Ep+7FuEyJtk=;
 b=Mf7wpoj4w2wyfvIUginuIYAoKd0h7epLPkZ6+fI9a41zfNrcZyKckAlv2KoD+6fEG0sOu68FG2QUyRRTRtH/9khD1PAyD7+PU8pM1Vm0isj6FzBTeINqGcl+jHEk7fzCx9sWi5bpV7kWwrxTSmFoOqHuDTewMdkcODRx6pIq+7ey6o9ubLZuHz9pyO/NAsoXxGtVm84tN2wVMEcCIRG4goT498yGh4Aqv7/yk9B56AqGWZetPf4Tqp2ShetUrkBe1bPd1nKiREcTW7JYvPzim32awF2T9yypn7poSMACGBIt/Lji2LxAjsea1sLrzFiEXL6GHa5mUCab5nI+Bg3m7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxFETK5gkAZDueY90vPk3b3rCUGkZP01Ep+7FuEyJtk=;
 b=paCtJyoa5ZLEwdiNZ+m+h/oXenfXil1WJxS+7NmwqzxlyHnvENj/Yu0DJR7CYEKc8KMpNBnE8pnWNujM6HRkIUMeN1fcbbb077F4acOE4GixMXxhD87SwlKFvSz+yFgZgof0vAELuGFdi1xdyqQjkQ1JBTQEFYhJv05eQpta5Vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0401MB2620.eurprd04.prod.outlook.com (2603:10a6:3:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 09:16:47 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66%5]) with mapi id 15.20.4755.021; Mon, 13 Dec 2021
 09:16:46 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 4/4] mesa: make ligles3-dev RDEPENDS on libgles2-dev
Date: Mon, 13 Dec 2021 10:16:28 +0100
Message-ID: <20211213091628.2037474-4-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213091628.2037474-1-quentin.schulz@theobroma-systems.com>
References: <20211213091628.2037474-1-quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::35) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AS9PR06CA0108.eurprd06.prod.outlook.com (2603:10a6:20b:465::35) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 09:16:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8dc164e-de98-4a15-aa17-08d9be19498c
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2620:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB26201BFAA85FE164FBCFFA71C2749@HE1PR0401MB2620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7A4yLZWzOPqGkBuJiEoYPAqYLQSZpqtTYNErISV4sHNmwV6IMoOeY5gJaBgHimxWC6rbxomcDiPu6szZ/vDmu+NS+WwxHnlIxrexs+I9Zz3oOujJFs0bwcudLipnuUwLA3v6fwv51WwJcuhaV7WU2e0F+SABCwQupbJkgW2Z+L5ujXdYBRevfsxkblozKpe/01mU+eLMJe/OutqHFhI0s9y3Gavm1bmRAdAUngqekBdZDWRY7F5NJqJML6k9Jn3duDnZm7iCM5+jF8REctxiT9tKNyziF4UxBAEzbQfkCJkQakTAMtebe6tCdQJOhh+VPII3KsQVcPqZV4kqQnMoQYIC/hvMriSrOolazK1Dmk0w2rburktOUXCMOrDEgZQBiG7+oFiy8h2CogHjIuYVAJfmsyVWmr+KpwpiVWYf0vcJk/avlgkg670JdC+tJZmS1+P8PFmg6/H6GKi0GFcRnKIEod5u65mlFLNzLSZgYuKh4EgKOFq5LZOYlHTF1Hp+EQhRmc1JnPkiBy+QhkqorubFpwaD4Og6TyBPOKxnZGfwMTANlZfc3QMn/1ZPP0d3gyBsBIetJ15TBIqTU38COSSxaM2miEJ96kCwkCMOjLWMCeKl1n49Dim075Xk4vDM/BwYrQigrsgln2dGUH+MOoWL9IFxwtmGN+L50ONvSPQJSugbt5DmLbSxja8S/pY5XovduhS0BjMKTD2rtgMmdVwFRCmSPRZbHxXBNEGHoMXMPDpxrDYuomcEILMxYujlba+NgYQOSFZTijl3BjJTXfIulIVo4ES3F9hyizoxFw8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(8676002)(8936002)(36756003)(956004)(6916009)(2616005)(26005)(4326008)(6486002)(38100700002)(86362001)(52116002)(186003)(316002)(44832011)(54906003)(66476007)(66556008)(6666004)(66946007)(1076003)(508600001)(966005)(16799955002)(5660300002)(83380400001)(2906002)(38350700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VvsrhcKhcNg8ydTu+Rj3Jgyr7Dcpxggv2vKIMlb5uFIZHsSs5LdNdDauXqQh?=
 =?us-ascii?Q?B0eWAhx9bcPVOu6wDXTpzEqCLL08Ksio1PqpaCUgLi+A9YNYVeNLfdhK6twM?=
 =?us-ascii?Q?sctlh6jADuDhXroNFOW/3zCUdkLnycX5OP4znkFnwb0CYL10HK9AB+c3gB2q?=
 =?us-ascii?Q?xweSjLlUdlki0tmadmy9tAHdVJ0lrSNfgtTxpG5iBHwGGJ2bwAk0zlybmjJ1?=
 =?us-ascii?Q?x+DOeicuKeAsi9vPRxTK5TEc2zM9fzKdCh2FQRAL29ihM78e3SB7rw8Ji52b?=
 =?us-ascii?Q?rChvbE1MFi0PgDYIXfUEMOrJLBo8Zly+1Rv8jHrP9mWQMWoHeazuRsfWOhf5?=
 =?us-ascii?Q?1r9L1L2exPTZDv05G8P5+XDkwpzv/alTgrmLbvFYbo1wWrK99pe1MgF/E0xb?=
 =?us-ascii?Q?GlZI3A2mkicSeqf0lp1pJwQeG/rBsgSycx76YOkfTpZgb79yzczXF8jERXWU?=
 =?us-ascii?Q?rN/1NBmUeLhacKYAZP2yhIf/m0tVHORl2mOliOkHy+TJFs1i3Hdtgk9siXnv?=
 =?us-ascii?Q?yJUAYikyp5llc1zy/ORcRFFIKivnB+93fJ5z2fmnhYAgrqsgTyJPlCD8k3zl?=
 =?us-ascii?Q?UfMskD4nDy1j7gItJnOEWNStgLlAFU0klxeOpx6cmX8bmd2XxjJ+yFltbjxH?=
 =?us-ascii?Q?/Vejnxh1ehCp6id3ljSRGSYS51ohhvyv21f56/k550xa77DZFMLJdsTNiCpK?=
 =?us-ascii?Q?/iAiapBIOPkS6Z2MpN9Pjp1Gkiane5l1VKCeBXn+V6KmU2W82z/AmUkS5fcK?=
 =?us-ascii?Q?ghYuz7dt6fM79nNswnKifuPnhK6g+3efZ9h0n8VTMnQ1K+pxxBm+lj9bvsVi?=
 =?us-ascii?Q?ZuXf2rToERy4a1MOu7R0TQawk65JlRu+4C32S6jXOOJIHxNipIa+UdQcDAtH?=
 =?us-ascii?Q?zCv2yBYApqUyUgwhNMLOU9oTPoQpaH9jstbMtUWEpPVyKx9RqfF2HwSE+UV+?=
 =?us-ascii?Q?iH1DwB9jaI2Ej4WPETAOP2KCEFxXH20Cj7/Z9KPsB33txtIfisK6UlcIAdKQ?=
 =?us-ascii?Q?M1wn3WWwODqWcU4JDg3+Fr9I25PlOshwEY4MAW4UkSdDMcZVvpkHMAR3YJ8e?=
 =?us-ascii?Q?vrJ0pxhU9FgKEv0z7l/laxsDI/wt1LsBZvlS20VOaAd+e61lDyiDG4C7cwp8?=
 =?us-ascii?Q?X3uFplwLPYAbuHYZe/jkwhBkb/+F7ElWPvG8y2Ie5oSU1YbMJcaaxxtld20u?=
 =?us-ascii?Q?VWJElCLzMPHtfzR2Zg9P7EXfhkH5amJUOacHqD2U1KpJKyIDFkai3Zo+a/2G?=
 =?us-ascii?Q?vSxwPOLbJdjRp2k6ltY+WvjYAVQ2uXt9+GhsHGDztm93bQ5UPsJIyS629mWB?=
 =?us-ascii?Q?GCmLnEPhkJylzKsYiAJS+Q4D+Iqj6pSWInl6ln7GdMoDSJhrEIpwRQavgs1H?=
 =?us-ascii?Q?lQMH2xUy8pdwr4WOsUntQcngiI5lIPXIBjwreEJt36AVop5gkJ5BfAeZ3D9J?=
 =?us-ascii?Q?jTMmbVGjA4xGGnO7bbyGzw/yOSeaXt9hWOMoZNGbYbDmmbE39sYuYwD36SsP?=
 =?us-ascii?Q?LChuG5mj8l+Er3AtS4+KfkF3rsSlRYW3Be5vSnUaPlDtG7IRvN8ZQP5tcbxi?=
 =?us-ascii?Q?k3rcKqAVgMdg+FqRf+h9jEwGXuKtLwn9s7TyRMv+/v6vaA8Wlq0x1JhI1wat?=
 =?us-ascii?Q?/gKz77lHov+5BugbLAY946slDMvzGifVqpWQdlYa8K/JIKDgi4ssw2I5tLRr?=
 =?us-ascii?Q?LhBfA6oSYIcmQxUA7+6/fI0js1oh4LvELliQb3F8VuUyq4Jlmt70w8fzag4g?=
 =?us-ascii?Q?BJseiDTKbw=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8dc164e-de98-4a15-aa17-08d9be19498c
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:16:46.8300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QZGZPMDObBcF4YNazMleMu3qby1VgHmlQIqLhuNc5VMM8MY9RHj+z8Q45QqQVqmB3gCiprBdkf4Dyz5CA3mGBgRiNA60+Gw73J0xNKz5szVl6rHa4U6HqA1KFE/5whk+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 09:16:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159616

Khronos documentation[1] says that include/GLES2/gl2ext.h can be used
for OpenGL ES 3 specification as well as for OpenGL ES 2.
There can be applications including GLES2/gl2ext.h instead of
GLES3/gl3ext.h meaning we should probably bring in GLES2/gl2ext.h if
someone asks for development package of libgles3.

[1] https://www.khronos.org/registry/OpenGL/index_es.php#headers

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

added in v2

 meta/recipes-graphics/mesa/mesa.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 6d6fc607f9..64702f8168 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -186,8 +186,12 @@ CFLAGS:append:armv6 =3D " -DMISSING_64BIT_ATOMICS"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS:${PN}-dev =3D ""
=20
-# Add dependency so that GLES3 header don't need to be added manually
-RDEPENDS:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
+# Khronos documentation says that include/GLES2/gl2ext.h can be used for
+# OpenGL ES 3 specification as well as for OpenGL ES 2.
+# There can be applications including GLES2/gl2ext.h instead of GLES3/gl3e=
xt.h
+# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
+# development package of libgles3.
+RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
--=20
2.33.1


