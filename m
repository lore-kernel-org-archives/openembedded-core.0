Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D9CC43217
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 21:44:38 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web09.34586.1665956665904487827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 14:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=kcye0Lo7;
 spf=pass (domain: nxp.com, ip: 40.107.6.40, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKZmy1X3dHZ3JZDzKj4Y7becSK8C6CzIy9EY01i2LhKeSF1L5d81qqp7cmip9DZw6kcztRjLjRBPzaG5AbNfiy2imAuZ7omml2HHRxYZRuWhN6fBEGKkpGlhf3DZxg/q/inlwlnQjqbngkmWDopTEf0wNiutXtQudNCyGXhS4f7WowUnbw6c6aeYNENUuMj3qYLgILkoLh7ArXXk7NtOMXfYf1/jhla0lD67rIgzylAi9hnwFWPW/LXmyMDKByuvaEmJQyHRDjIAlRF+u4PYeg3wK0RH/I4GqH3jubRWCt9nPB7Iu1UOyB2pf8izUK/f9lZ5Ks8hAcl9yXCkNRIxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1oadbhITAw1xusKez2vwR3p/Ihzxwm17QEd8HGALak=;
 b=HmfNnGqryzF/AiA6+EgUadj7zwWFh6DFKO1VCwzww5NPu/ZOWRdvrHGsWlPsb/msFKpXcQvZLak/QzmpAjj1pt7tETqRK4bnWNYhGc5TQzcpww2FvH3ziLcujwqDcpeclt5Be+RoGIf/vwuS6u9cFSPJuRaGKCnLxhk53DkGDVn1gB262oEzB5jxNMCBXZMr7wcneG8CbK83umgjYTbYldIyVr/21VYExFDPqSTL/NqCi8Fb2CaowQFKy8YOlHFY8JD+P8xncsw0CdSHUOnU5zXR3tu00lyhI7/hTprW7WcCKKImvGvCzxT5ZZ7oCMeRT3P24qF+/h37jn+rbtBXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1oadbhITAw1xusKez2vwR3p/Ihzxwm17QEd8HGALak=;
 b=kcye0Lo7tGqXas0pRAcJeIwdIhiI6c/Yo5fo85U+6TiEuCQOYwhTsNmJX8VhIBXXwdKyDC2RDzBqa5ZXdy7+F8Y6kwuufhju1ukJLera8wNxY+Q4qWo28wKjLeCkV2rBAmD0QQBj93DlDyW1v7bOTlMQ1jVJDFvtlDzmVkiRirM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sun, 16 Oct
 2022 21:44:20 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef%3]) with mapi id 15.20.5723.033; Sun, 16 Oct 2022
 21:44:19 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] vulkan-loader: Move libvulkan.so to main package
Date: Sun, 16 Oct 2022 16:43:57 -0500
Message-ID: <20221016214357.596913-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To PR3PR04MB7308.eurprd04.prod.outlook.com
 (2603:10a6:102:80::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7308:EE_|VI1PR04MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 99154c61-4047-41ad-e999-08daafbf94ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q1g0uKme7zrX+eIGjy8R9dscQOYAf7olmIFPA3Duh0hjk3qo2O3uzCEzgy0eLW9TtJAlY4lBEYnGlGfiSz5sZ92tYQOuCWWbx5+h9NPxkUc78xMIOomvjj7wKrjefB4ZwLEGGA6G3ZAw56e1+JEK6YZdfAa0UXCuEdxOwziOSGrtyZMfXAFIt0Cie4l3q/MW1pxQmO7iUZhfEchGBmgB0q+2+1DbjiJsalaiMvmRQmDWetM+kVK68A3B/3+3J7jWedSNgLJPI2Hf0KOyrjL6H29vXeimLJ26BFfDFkWvLr8VyxAshEIAmOj32kkRw49oIk6EwMUzZJx7XVtSkzatAJOy7okdOtJnbwd5faDdwjqXsyz6hjL0jYh1m5wudVRgA9HSNRkv6vqEflht1dW6GuRrQLGRT0VoBZN/x4E4YFrREXMJkhq71VVAVPw1wXmkchffWSqDEBd9gfuJZ1VOROw4NaXKqb10w3bc4tu0tNAKB/vkWRsW2mupGnImwuG4sbF44CkxtHZRZwsQtOJf/mmVZ3+WRhp8j9by6r9qL7RQhW2PZJJO/ZU2klAh2Xaw700VdRucTglRxPwrkSLSxY63XtZwc+fDFWb1jgL2+8w30vZHdNoK0t22LTxHBtn2wwvrHxMCh9qxzHVCGHA0Y6t1hXULNkjFSPtkTgrkWeynTYQ+Fm1Uq8lPNmHLFNGFQxFRx7AWaHuUTmp7DipeHWKya+JGDF0KpbAXXJRDyu0IfRe3NpBQ/golJkA7cbG3Dcv+4B0snHZ2lMXV68AqHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39850400004)(346002)(366004)(451199015)(36756003)(86362001)(5660300002)(44832011)(2906002)(38350700002)(38100700002)(2616005)(186003)(1076003)(6486002)(52116002)(6506007)(316002)(478600001)(6512007)(26005)(6916009)(66946007)(66556008)(66476007)(41300700001)(8936002)(4326008)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XvnhLVgYiB/JmQ/yrJHARkG/yGcdibK+g03int6wQLRWvoAVUIgyXSZWUXUH?=
 =?us-ascii?Q?xFN/ZECU+LKK/HybfDF+iixCpBFdLdHzguGWbmzWiA1HjM9XmQKsYIx+uPlX?=
 =?us-ascii?Q?ePpDMSpjqpIbAB0bOiitLSAMrrMOroBUf7HnJi4V8Se9TsPu60x4y/GrRcLi?=
 =?us-ascii?Q?acM3Y3QCnlcYs8Gpq0bBCDO34JPoBqgCHE+Z7HBvRZgiPTfJ60FItGCVo3S6?=
 =?us-ascii?Q?8YIwrP+MzgoRGCNAInU3z+AVA9+sPdLMjGqsDfrsno9WpjaME3+f8uvIx7tT?=
 =?us-ascii?Q?CihoUpZCLx69eUXn5wwLAZbcLcQ2RWH9IGCd6W9xC8b0CLoQzBU3AJqxoy3s?=
 =?us-ascii?Q?sh11gDUAl4NHEp5PMauvMmFAV/54mx6cMooZtZmcy9PafV+5VlHM4RLHbPiq?=
 =?us-ascii?Q?sU4ksrKZi2hW8TMMfALk0TRbABad8ZIR510KnDGW6Ykw9V8LpfwnnWTz9RzV?=
 =?us-ascii?Q?XnUA/T/CP6zQqhNWmFFhp7YfH4joa+5bihCYTcD+58FlEg5x+9HGIzbHVyA/?=
 =?us-ascii?Q?bhirXkXQLrlUt1YVPr3OfJGMm1suSXRQUJiZbsiDTezt9rYWZdXDla74i1J0?=
 =?us-ascii?Q?5p6yPPI8Hw60CubS88q2gGRx4jprVcc4TXzKAApxx8mSdTm2nYAmC4Tmh5QK?=
 =?us-ascii?Q?FyYXsP/sv3EmQjJ+goKSZJoF+vupRcmZtcIgxHzNPHvxbHk9km3ta+uPxuBS?=
 =?us-ascii?Q?IkjMarPs3v35RyKhtZW1FtOgxMyP6xt4TJl1SlYhj4/qSGPvLl7YAn5q00Zw?=
 =?us-ascii?Q?oNsTt5kmIAv3Yrn3xJUtSAxeihXHmpM5lYLIFGkWB/WN03cdXN3X6tCUEg0H?=
 =?us-ascii?Q?H3ThTj8Jh36jIk9ZKxUMnf9IB8LUmtz0m5vH4/v5xtzgAD7AulnikN7uLYps?=
 =?us-ascii?Q?8IOWcFFgveuRWeS2kgoDiAAERsIqTD8EEJk9WYtfxsXQr0IKDvqiH79EdTV8?=
 =?us-ascii?Q?GeyXDMMrRwvP63x6gPQvFS224XZKlMK0IZ9yRrSwSjJybYr5Sc5JR/+j8men?=
 =?us-ascii?Q?oLq+2QRkY6IAZaFnf5MfRbeQiQHQ5gQVFzPvTQaORfDxWYXGOI7xcwJ9Mc50?=
 =?us-ascii?Q?fjiJmJlQ8fXiKIyIOLesJtt42hnf7bESisIy/RhozxUP9yIr15z1EcjpmyDb?=
 =?us-ascii?Q?Mx69XpIOwDxRuSsQeud4mUak7Djpd5wy5lrSUtgLeQ9zAgo0LBivajd9DGDF?=
 =?us-ascii?Q?17Ql4XV/64B1J/VCfrcaXVYxTNFiKBNAa3+OBrQb7ezwl2+qdMiVqOtaJ0aE?=
 =?us-ascii?Q?ZjHVi3a72CSznrb1hQlTeeQIwL+eEvSicIlvji60BeqYGDAl+tcCpDGzF8sg?=
 =?us-ascii?Q?jr3MPw/SO4yfWO/TAelWxHuCXqtiLW7Q8j2nucvS1knp7HS/yyK+GEgalmPP?=
 =?us-ascii?Q?39rFopmAK7yOurctLP/XyFqZhpNzVsUtk2/+j90MBfVmd704fVPgxRpYfSeM?=
 =?us-ascii?Q?YpDNjWVvvMi7tGV87dW/MunVr8mrQ2dE9wpW7it3QmHttbrLSUinhEb3CZKM?=
 =?us-ascii?Q?feMzIoDxyR01VpjJ0oBgVZ6NSRY1csU7uRTvtiVGws+ZLbsXIEuqmsxPZqRn?=
 =?us-ascii?Q?rf2CCYENIDiquQe1JaMpzglLW7Dmsm9K/AqLIwqE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99154c61-4047-41ad-e999-08daafbf94ae
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2022 21:44:19.7732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZvgbT5JlGjZjWUGzNTWcHM/kjAwnt5erFuc4DCaq5lR6TvICILseWjav0kDk5hePUPT1YX4Smf4BvvcS4ji0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 21:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171900

Since libvulkan.so is commonly loaded dynamically, put it in the main
package.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb b/meta=
/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
index 15a079879b..698ce112dc 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
@@ -35,6 +35,11 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES=
', 'wayland x11', d)}"
 PACKAGECONFIG[x11] =3D "-DBUILD_WSI_XLIB_SUPPORT=3DON -DBUILD_WSI_XCB_SUPP=
ORT=3DON, -DBUILD_WSI_XLIB_SUPPORT=3DOFF -DBUILD_WSI_XCB_SUPPORT=3DOFF, lib=
xcb libx11 libxrandr"
 PACKAGECONFIG[wayland] =3D "-DBUILD_WSI_WAYLAND_SUPPORT=3DON, -DBUILD_WSI_=
WAYLAND_SUPPORT=3DOFF, wayland"
=20
+# libvulkan.so is commonly loaded dynamically, so put it in the main packa=
ge
+SOLIBS =3D ".so*"
+FILES_SOLIBSDEV =3D ""
+INSANE_SKIP:${PN} +=3D "dev-so"
+
 RRECOMMENDS:${PN} =3D "mesa-vulkan-drivers"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
--=20
2.25.1


