Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B1DCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 10:31:59 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.44])
 by mx.groups.io with SMTP id smtpd.web10.116379.1697452317361098594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 03:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=GnFru+di;
 spf=pass (domain: navimatix.de, ip: 40.107.13.44, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACzrolDVij9nFBKphshROn5A1ShpjdCjfXsNUFo2XtlDq4MGi2KbAmNkgyVZonljWMA3DkQpfHIw5+oRYI8BeIJ8n9odLX10bZhd4B13iIb3pk4c+/KFgAYFZbw1Pi4NQ4Sxv5fTA1QbExNfb4mNVusFaladYVQtOzKlX9Tqe2bnhKtrkwo7/N+Nuq04DojANv2v2OCBdlUC+ZjLqSxI58eZ7xK72mHj1VlsBafHA/UplI0VRw05mvXS4DGjlBAHehmNQEd+Q+JFhBVPMTuAF25kQYXCZUIosgROBjEbDXcvUfK9v47Ka+dv8aZC6KUTHQEkWIOsj0HuwcrZ0KtB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rBzfeQOdrtJF3k69BFeLsM3fymTAr2laSmNtnug0Ho=;
 b=mczeV5l82Kp3K1MVOJh8xWQTf+L63yOI+7JLo1dk+nt/f+ahCCYudldK3SzEAC1LO5CEzdcnic7T4TZO6EXDNfNGvajS4SpxDmM7lA+F1st6NIIbP4k6pfvzD3gWbaIKDQSjKiI0X/12lPMQU/qfxHrmhP8O+Acc/OPnhkYcnWKQO+tOdMP3Ae2vfrAkwIPmFkTTooY8AKUcMBxSoUjQWwZcgmF6CnxHufffQEObd7gox++AcVPNpxRyNg2IKO5bKN2+VX082p2N8l7vkmbBD99Q3Y2SXgB1A6NMTYtBkzsKHWyEytgbTDAXWpezlCYZRWr4JrPrEKRc3gXxWm5MBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rBzfeQOdrtJF3k69BFeLsM3fymTAr2laSmNtnug0Ho=;
 b=GnFru+dikBMXZNXU0GuwtIYBjfd1qoSVH2hnYp2xOFF4PccvoHu6faxbV7B78gDZsYv5f/edXh1Yt258c5hbdTqDihdGBjN1QkaJ3eiJdTjfyXdO7PSDMPhQM0ZwKOcuau+YORUclNVAyADlkSKOMwzpfXJbhRt6hDnltU+sOgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by AS8PR01MB8553.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:448::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.18; Mon, 16 Oct
 2023 10:31:53 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Mon, 16 Oct 2023
 10:31:52 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] base-files: Remove localhost ::1 from hosts if ipv6 missing
Date: Mon, 16 Oct 2023 12:31:23 +0200
Message-ID: <1141e5d627199e9f440cf558859a0857b1e7eac2.1697452283.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0297.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::6) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|AS8PR01MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dcdcb2-afa2-46c1-0c81-08dbce331cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XCK1voe4npSXthv6DnzAmFKvi2oWaG4FswcRJyd963b05YUnlMGvYhnvDyue65R/n2irWPI3k+AeDpy9C+Ap7ViKnqfcGmZFeKyMGg5Wl65JecBK3kfH2f5Nih/Q50z14jvBmUxpdf70Y0KAi9K62xHM5KdrjkVAYza/zxzRma3+Q/8GxuM4CerhtwHnOnyNWP6exdtHNamafOk8Cq71/xYVvpn9yS9XONJK0SzuHgB5Fu0NfV707V4qpKiVTQn+Z2MpbtCKTUzVbGqSlZn3ZMysjy5dWsIv5bxR4jvViBf3G0AZeTYDuRao9AXSP+CQxi9E7w7qcnjM0gvdAhmWqDCa8Z4C24MWTS2UFrZH3haIbCzy4UM/l0ZLZr1VjP+N04gvhz5hGv+1BtBKZ//DV5TZ+EsWvR/jxzd2u3APx23EAhiyt/FerrLGTQjIIjP/ARuMtI5kiQLlQAyVG7FWsSJX+TfuDRFsBQv1XBm5qGkUHq7UrYgPCX/ng6Abm6e4lG4lRxgUV2Ty0+z6j9NDvhZkjwk6DP3R/3ItxvK8PuJeY/j4LS9udLXDx4djnpUEWQpbD562BwDHgvEqJhxR53pQUDKZ2Qa5sPzT2KdxCvObHRjUm++pS5UI9aF2Bt8T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(396003)(376002)(136003)(366004)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(66556008)(478600001)(6486002)(66476007)(66946007)(6666004)(6916009)(107886003)(26005)(41300700001)(6506007)(52116002)(6512007)(316002)(2616005)(38350700005)(4744005)(8676002)(8936002)(2906002)(5660300002)(36756003)(4326008)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z47alHxgx7boCMd2UXU2qGYMxDXqZtjw4zalpK56mq/rE0JQRrINC0FOQyXv?=
 =?us-ascii?Q?u2MNnB+YZrvzEcc3AsS6ClOrNurzN1IZUFCEe3YE1fvc1cRZplmWJ9/X7J+v?=
 =?us-ascii?Q?Ul+MYAxxFw7cIldIlikgiiRn61bCm82AhuACN6adoLjbSXIY2TQwfc7v7Fst?=
 =?us-ascii?Q?1fDusKy+LvqunhEaTx2GpjhXBDLrp1F+wLvVUd6IqXxlZHwl70mgKqylvoM8?=
 =?us-ascii?Q?quQAeYgbu22GzTJ3NPuzB94OKNwq7dWlD/Ixcwx2UcE7nXmGaQYpvPGbngoc?=
 =?us-ascii?Q?fNdGWYGZqD/Z081xlargcwj6djXrG8A3rQYUwcP/Onlrmq2BqvKVmOVho1ol?=
 =?us-ascii?Q?axs9ejK2MZAGz7RMNJjgnYMhLbxDAkNUg3C4Y13w82MLKGvO6OQnQpKnmPGe?=
 =?us-ascii?Q?ZE4rTdz1/IlJ8BMvUDd5j2+4zcs+Aq4SPMaVVA+I2w/ZnR73byJPdVQMpKb5?=
 =?us-ascii?Q?hvLRCc4+vRJXHNjW8vTTFFV1Ydf5PpYwhd26IdAwwRRD/fuOD5yT/pd5+Io3?=
 =?us-ascii?Q?gvhvF9px37cwq0qZdXdqwi11CsxJSzyxGfBIVKvwNWBaa1zGEjbzh5FGgHsD?=
 =?us-ascii?Q?jAds0aPaZV+27EqLFz1jkSNhStZy+SZecL3R1XZ9BTQEEeNhaIMeAc9h5V0O?=
 =?us-ascii?Q?bCqe+6pjtVUDWanlyk595EcAm5ZFMGHCztuTmSfozNz67ddfq+69roqdrrjh?=
 =?us-ascii?Q?ER8CzE3lbVdMQ2sG1Vf5F2BkbWk/CFJRDdE00aMJcP0EW1KubF/kAr8efPwa?=
 =?us-ascii?Q?fGh9q0IEoBQlqNGuf17aW3WoMTKAehrRb2oMUZ8jySUDEecKTI2nIBqw0F8m?=
 =?us-ascii?Q?GuvYFGiRLKdonLsoYQCP+a/40Swf19AQapX5fcW29m3leMxmNz70gZeUQmQo?=
 =?us-ascii?Q?z5l4tVRBAkmfpuQS4Zx+V+yxQiM2brzkxyupe808N1Sz1wv6uucVapIS/WYa?=
 =?us-ascii?Q?1y3kwUpJ774Jzt53LpjArN6Dvcv4Sqnl/6pU5G+LH8YJXhwnZvlKWSWsnaEG?=
 =?us-ascii?Q?msvq6eFshlB2N0x17rNQcxkVjI4Bw29LO6tx4OEh34Ty0tfCebDbse9pQ/3/?=
 =?us-ascii?Q?G7/a5VSz1tO5KcoRpEj495CU6HErswU9LBoDHHRo38K2Jg5cplcEIsvOt+dS?=
 =?us-ascii?Q?ZNIGGlEm3rGQgSc2uRNM3SVrdkAAKhvBKQX9MebZb9ngg/6gQSujZBkYMqPI?=
 =?us-ascii?Q?TAO/dM0LKfurCkNj11FE+Aa852CG9NJsP/I2Kw2ZGSHkSBUHAUZWshQ53160?=
 =?us-ascii?Q?+9YVfNy4ngkS39q3dz/VCniDoY2nRKFLS44/DNM35SLCHBD/amXMbqEIxdWp?=
 =?us-ascii?Q?wsXTdkYM6ptNeXjcHen/toJPYeCYXrSX5cwL54VvqVIWzTsHqhoqnLBxkh1i?=
 =?us-ascii?Q?XGR4b6iCDFT8GFwGvy4EvgQsuBlCx4IafLPtU1zYV2qUF7vDyTfPAXt/Xx8D?=
 =?us-ascii?Q?5RQGMaiHp/ez+o0Xx1l4hH2uCw/QTeOthdlfEWnuzRGZJeEUW3gPIVA4vdxV?=
 =?us-ascii?Q?OLy8zHdU2yPfZFGXIsORzey5vfEiuh6ukqPApoCZJfBwHZkBhpSN23r2U9mt?=
 =?us-ascii?Q?t5pTCzMqiNHho4LAdcynezG/mW6L5oFJGukJv6xlO7qFjtViJ9pXfH4Xm8iG?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dcdcb2-afa2-46c1-0c81-08dbce331cc0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:31:52.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qj38eXc9frNixcez6Um//1x3F5kxg4aQkJyUMus3M3qTEHF+j8sqY+0HT1XluLt0ZsAGc+jCsFG5xbLYLNMQ4YtiJv1sX88IV2JFuTaIOak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 10:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189282

If a distribution doesn't provide IPv6, the mapping of localhost and ::1 ha=
s
to be removed.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index 6ba3971e32..4d246126a2 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -136,6 +136,10 @@ do_install () {
 		echo ${hostname} > ${D}${sysconfdir}/hostname
 		echo "127.0.1.1 ${hostname}" >> ${D}${sysconfdir}/hosts
 	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'false', 'true', d)}; =
then
+		sed -i '/^::1/s/ localhost//' ${D}${sysconfdir}/hosts
+	fi
 }
=20
 do_install:append:libc-glibc () {
--=20
2.34.1


