Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83713CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=XLJPrk9P;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNGwRuOqmHDRgXkb/MqY0+uFF8NzCwrlYHOXbKOUKYI6KRTxxJhWl0y/YIRCqmnkZs8pc6cT0WV2uLe9ogfhNFud+UTtzovk+k81hoOZng/pIpuZMywyxXjae1wm0/dLvcE85S7ciPc8cNTt8JrZTNLjD/sEprCY7stq56Vaw9WCPSSUY4iG2nbwU6Evzy+zSCeLyyTSE1YUEHSnMLAbq927BCdwZ/c23fD5W1WNae1I67OmrrUbtiaolssJBjCw0pwHHLvGpqKmGo9r1e+HtNdVA8GUVgTMYRuvnwQK/0lcvGXpm6QH4sDjHq57bSE9Soh9/sxcASheoqXvLgNjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=jUx+Tm42+B3j4HsX5y1EW7Z9E1gl1KbeU8pEJU7xEhxx4O8uzwb+D2pGvsl043tJeRLMmYBXWfm0J9ssAOg77FZtdj7iDksq9he3BawZuQnbAwGw12tEICUxlub637LnP207I7TpF8Y1Bt5r7kMdLTh9WWpl8BC+3IAHn+MHEFivPOas+mGHSlQPirCszdDs1Cj5UGxsYw5CrGYEW3fjZXDcI5S3T638TiKdQfmqMDQG0WaK+Z7zUDS+eNDDA+KqxtlGLsBvpjM1FXS95ZD8mfynDC0Ien5w+9RiImUa4388E6l8aWxPMoOkd8UifbukQFNYjbzZ+iwPNBRJxS6srw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=XLJPrk9Prxyy8owj5UFMWhxRekao3016Ou7bE2fvQa3n5Fcb76yN6aGM2oC6utwJJYzKri2lkErYkbWRvVJhSGL/tE+cvBft+eY5T/koYy4+GpRwjldKR/+xyejJjfqdQpO17pmOQXYXS5IaHOT7E74biwc5RXFMiDKBLRyZcb649oRQFVvFjJe4idAGmOBl/tolAJ2v0GOoE4XFwvdqKfNHXg4k2FKN7c6vX2yQdFbJELLidHgL44tMmjzgq0JvFFFpJ6hCAKSuftIcRnp9MR9nRBFpZnO3SgMRNExcUhuzSh0E2V6NlyrKz12QmeO1GvffmDtOgzS39jOS14WC1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:33 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:33 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 16:57:41 +0200
Message-ID: <20231015145749.69995-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c0dcd0-4e99-4e27-1b4c-08dbcd8f3389
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	huqoAedjnVY3sfAGBO8TCxwzBK8jcYrlScxo72zauh2mJTK6UNk7kKHii7wYsBLsSm3KdlyFP91YoHExkUpb+djaLTzjSE7MLQuUokMC5FdJxUnoj9q+xCL530QWm5nXjy8p03VlkoYEKglWzjUs2/p8zqQGhamcEBcCjobx5qi/+NbWDLd6bSnJWoInwl0FVRJIrN3FMydRY03N7c5xGErSn0QJtCm4eZo/dnSM/5HqyTSZkMGIOFyFZ2Fr03JtiEQSr3GCeA3684tlKc0D/UwVq5TFSvcPdIoK5baalG/kzrX4i42rcY3gDP68jl/CLDdJNK9LUFKBYOP+Wvg+QvuNvruivp90goN4qD4oTWNWFzJtjWXUoE7fss7rqBkSiQa6TkQUn0q+nUTLmJKAncbPPjyXzOzb38YYTW0Bou5PrNuaHUltuMwnhqM6tDEmKTCB8nOu64e9t44CxBLvC8nfSIZ514hJNh97TvuvNmWMO2nf+AX1kVnN5aCVubU9WSnVl67JDrpSO0fzxDWzTz3gPeD0aWM/C0FDSMPJnq2F8nfYyDKLgnvauC/zlGtGPNLHOF5tt3zFfI6fwb2hj15XLh0IW8YrkMgEzPNnog8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mVA9oU9EOed6Ss3e36t7i8FSVlwPDjkRiJqR38ZBXK+86pgE3eTo/ph9EQZy?=
 =?us-ascii?Q?fYQrTYFEajkunLejoZRFlQq5S9NhSmErVPRzRgWgz4bXdTgosCLjAocVAMWw?=
 =?us-ascii?Q?3je9nCOzw4dpzbIW/owte1yjvRhN0tWoK79unVoVzoYYLAJitJlOZhYbmJL7?=
 =?us-ascii?Q?5oNiyXDJE1ryGrGYX8T/jGXGUGGEieNaw5F8QUPrd6ZWuyJRJu/Pv0eXM4GJ?=
 =?us-ascii?Q?fus56RncPhHXWNc5i2q0XyOqVzzlq95tmgEEXvqo6TbmophbcRZtf5a+C0CM?=
 =?us-ascii?Q?0NDtK5so+XE8ZE829ol3vEwI8iy3HRhLECpqUEVTW3kOa5czlQFbrH1NBdbW?=
 =?us-ascii?Q?HNEyykm1A4JF73+h/XudtG7sXSZWmEDdG3iG6rXyuR/GmhMl1J3/+h6eZCOo?=
 =?us-ascii?Q?uRGp5GoXK4tJ68qeipuVpGmkVX0NyEqFqIwyesCk8eMacEBJas6+G6E936aG?=
 =?us-ascii?Q?AxdhDeHzbS+wYuunJETMU82PunB0jAqVTdjfGP9rtCp2L2zfHPjM4/subOqN?=
 =?us-ascii?Q?0/o5FBmIr5Ofq2Gop2uxCSFAieLZj3vWB9MBCTG8f/B1AloFNIhKOJHu0wzN?=
 =?us-ascii?Q?4Yax0cytchM5SvLzWg3aU7at5kyHin1wxpg6uGX9AORUxN/xvuF9BLbH7Sqo?=
 =?us-ascii?Q?C8HiOQFiJgC7GDugHuhdEiPJXtwWYk94mSnhZzwjK8Q79B+6wzVoG8tUyJ8e?=
 =?us-ascii?Q?3QhtAWKpTKOHqBPjiHIaL1NE+FyyhHQkYhAWccB4RaSj/Okw9OSqZ5Ztw7O2?=
 =?us-ascii?Q?X96jLOIcMiLpXaLHQNZxmkbYP86+Zd1OgVAbigmQJdqhikPobJCCKlpBSGeB?=
 =?us-ascii?Q?ws4DIWXF1RsKeYCzca13ByA1239j2MOdvZ4SY4PmhI27XSAI2+7pMSkk4WxM?=
 =?us-ascii?Q?BzgbsPg1axuzDXIMj+QhjEW1AdqWNgr/GnviwcKyCFglZBJl/hXs2MvmuyD1?=
 =?us-ascii?Q?RlMpzjC+3spgiPOOCmJ4CfSBE0zuX1jj7uOkyvh/ydAxA+k4GvnN3YL4Zots?=
 =?us-ascii?Q?EzezstA2+BUbIPQgklBmLZvdXc4HW1SCFaCbAdR9pNedxJ37FFF9YN463M+Q?=
 =?us-ascii?Q?WQ52/Qd//i6rKraj+rpvZfzvMnJX8wYTlrUZf3gnuKPmcQOOlCXpgk6TEZjF?=
 =?us-ascii?Q?8OzAdUq706gFm6egFMDupmq1gWuzBHCqKXG2v2WBUaMmgXEMhswDshtfjIVm?=
 =?us-ascii?Q?NPEC1y547uobsxtx1MF4JprEzXFXXunzd8czbZS48Hobzn6gGuZtSDcjoYlN?=
 =?us-ascii?Q?GyF9m/4wUIGsVRJpUCNoaYU8CriZDZKGCVBONXgTL5Q1q+eGfje5Qu6T0RM9?=
 =?us-ascii?Q?OQLWkGbOc4lS6qKwoUd3vqA2EH/PIL9k+PMQYYh2lpMSHatkW5eBVlcVYCA9?=
 =?us-ascii?Q?2hFb+i2rw+d5DQgsbKFSE1bOilYBZYwEZKa0BtPxhTaZ+zhvgRSCO3Fy8Pwc?=
 =?us-ascii?Q?rrccNfHMhmOhGvL1aXL3YXTcWhZ5pJhEFcmbMe/tq3hrDIZlJvhnTeuhzywF?=
 =?us-ascii?Q?O3IvF+pAqfgoQ4eZXiWHxPA55piJdsg6cYZWW1xJHfDpwL4UkP58yuDxZeLX?=
 =?us-ascii?Q?R8+z5ZBh660dQUy09Mayf6LNQnAzKMH9EXiOlUKy?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c0dcd0-4e99-4e27-1b4c-08dbcd8f3389
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:33.3544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qGyllxOVnMtAA8Hq/D9fVriuQfFBnBev8rxs6E/Ap8lyROFx/89V/P4mDFvd7DPaAXTztGVmUKebiS5MQBnvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189148

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

sstate_create_package and sstate_unpack_package functions,
will use the tar provided by tar recipe, which is already
in proper version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 2676f18e0a..5ae6f515f2 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -152,7 +152,9 @@ python () {
     else:
         d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
=20
-    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cros=
ssdk', d) or bb.data.inherits_class('cross', d):
+    is_native =3D bb.data.inherits_class('native', d) or bb.data.inherits_=
class('crosssdk', d) or bb.data.inherits_class('cross', d)
+
+    if is_native:
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
         d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPE=
C}")
         d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
@@ -164,6 +166,8 @@ python () {
         d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
         d.setVarFlag(task, 'network', '1')
         d.setVarFlag(task + "_setscene", 'network', '1')
+        if not is_native:
+            d.appendVarFlag(task, 'deptask', ' tar-replacement-native:do_p=
opulate_sysroot')
 }
=20
 def sstate_init(task, d):
--=20
2.42.0


