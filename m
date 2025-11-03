Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF6CCCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:48 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.142])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16038.1762158104805408144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=rNLGQbzz;
 spf=pass (domain: navimatix.de, ip: 52.101.84.142, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTVSNQsKobn0FJT0Pt9RkSTQG0Z/MA4Wt2q2PXi95JmG+Tl++D6Vq9S0SEUiHAxYgf5Apjr3mfpT//wgbKo/jL/rn6y+ZmgfnZQGupKSCCSppVXzvjUm0hD6Gcs/w0A6Ufx0mYPH5vBdkScWQMSGq3D65FdwPRMICVVuMkvFvFvgKp5leQlinhlLKJvjSOg1dAZPzDlm4iETMM9cf2Qljl6tfW+MV5W2DOc1+jqdJlyAD/lUH5HYj2/KtFfs9SW25cg5WBkoDBl+oTZosMZoxivh+PO773te4PJnj5rwOPWFYbVS3zC16gue4SuBlk8qtUy2Xw5lCyQw0YVMptXRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEL3K66x2Myvis+vYCkmALd4wI7YHQhu2KMlX8kOKPk=;
 b=S4OgcenURDEM+eaH+0R1fWxILfJ2/ybZvrtX4bFk2zxjKEf/PR/lIY0az2RX08w1SboWaQjFXoj+umVxH/Gn9Ok3C/Nzc4BSGEZCGRpnsVSikW+c9twT4JPZUNqKWroAYLbqf4h7UKDmUfRWm0nY/JrHIN3BVAcpN3lsbm9QUn5Ycy7LBAy3kE4WmBiXCjUp771P6dYsrM9I8Z6FDnKG4IimNGOiASQvgI88NFQTYdFnFVdIomayOLOljVfJUfptvLpT0PjPeIwJaK3stDJiKH5/4SxrQOjgDQUuD4/BhYHi8sFjRQZlhzqGoZjGwo2WbnQ+ymIBMB5iLr8lckqiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEL3K66x2Myvis+vYCkmALd4wI7YHQhu2KMlX8kOKPk=;
 b=rNLGQbzzi3aA6/z1IRrmCS3VDBMPgw5rOTIAwhpKm566T/GqfZ5CH8+d+b7JNI0w79TpkNMtGzx7AddfWuo6MvX0MEb5XLRhk8rEE/olGnyn39dA05rFGk7vV3MHEsnadOmVPD8HSpBR7g7pBQP7tEoFo9n+2Hgq+9y3Jl8dtk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB9432.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:21:39 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:39 +0000
Date: Mon, 3 Nov 2025 09:21:38 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone] Upgrade gtk+3 3.24.34 -> 3.24.51
Message-ID: <20251103082021.1301034-2-joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 921742ab-0684-4cef-8fc8-08de1ab2033f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rB9kGa3SNkkPTsbJYur+GujDcgnJMciJ6i0EbT2EEMHSaA1o9n8y3ftb9ZKq?=
 =?us-ascii?Q?2+2d7jnBnjVrrI7IHXnUfABwSmzNb5MGa1sio6YwFWDS+fdfW4qX1/1GicNU?=
 =?us-ascii?Q?/Qr1KyHMlnaN176U6mx85kfDCYprSViji4lGRBdEZqcb0zMQkJIXgkC3dBkh?=
 =?us-ascii?Q?sVlNeQnGFC8RXWat3SRira68c6bVFlBg/++oajLTYbITt4qZi3K/d7dlfgMC?=
 =?us-ascii?Q?CjVyMHrsyNaTKeDDB+vtOlBUSddOwETBXMzIocWN0IfoZp0N/0yKuXk8yxVh?=
 =?us-ascii?Q?lMOAzFkQasCe4Ax0Fx/0FPsWhdjiyCFKA4FLWsAmE2GAjkyeQDDhTdrlfgwO?=
 =?us-ascii?Q?DCC0ndzuC2cOQqO033dkcBHIcqMnfR0rRpjAya74vmD1LnVuApxjX81bLlFq?=
 =?us-ascii?Q?hnPYwPYjsi/8rkjDmTuOidPLDMJu1TP/FmDJ6achsoYRf0qTTCLh8uAluUiZ?=
 =?us-ascii?Q?3zdp5D4troHhHXRdK5o4EWVRReaQKEuDY0wcmFmLzknJs18d7+M04NxC8ICc?=
 =?us-ascii?Q?QuyXfGSCRn1839KJ2nn1n5AzheVgwCmXqyFmPVj3kNukY9rSg5GmsBkVCVHK?=
 =?us-ascii?Q?05db6lR//ByP0A2hnrr9mWTbIi8Iv6PkkqA5XbyetUjwqRV9U0dHHsxBBof7?=
 =?us-ascii?Q?tlMQ57D8S8zuhOCcOwfV9POmBFw8jImYvEyb2up65FVsMobejXx/JsGCUEYf?=
 =?us-ascii?Q?Ck8dvMVdPVC265LtU91uxdt7WPzK2PUDVfyjkulANEgve/dP9PjH7i0Nfx0o?=
 =?us-ascii?Q?0ObwvRtMrQ0EVPTCwvNDGVVCnNZ+QEurOECf6efxcfm5dTSgnfD4KO3oCuh0?=
 =?us-ascii?Q?iObl9FV6EwGcdkndp2Rt5LdU0tS5X2dATXh0pucdRWakBOCJsXzsh/13KSaM?=
 =?us-ascii?Q?hpkafYeVdtMyOB31Fg+qWZwL9ozNYwratvZ7yPii9nS7tvUWuNdMM/Jn1dvR?=
 =?us-ascii?Q?oTi5g5B2Bhz1XKVScTjvitjOopcPA824ifWgXt8n2YnFBgYmHaGWCg7F75yI?=
 =?us-ascii?Q?4SiUAlqwHRNv2mTBQPjKtpVrMfaWgwJiuzWxGIhXPakSUyMoZnwwMO/rJA2f?=
 =?us-ascii?Q?2p0Ow7LwFUiFeJZPiMRU/zv9amYGKcaRF61BidPN36LXKSLX5yq5nKaGdSCV?=
 =?us-ascii?Q?wlitT+yttLy/WVON48CkUdJ4Tg33742DtSw433xjEs6OiR6ZXwAYbAfhvsXy?=
 =?us-ascii?Q?OTGb2BK1RDEtzr+rn+LLeaMl8Qit+JDvEgfBfxmfBTg+5XnQFUjpqiNrsT8b?=
 =?us-ascii?Q?LR3XiC+xfWNoEiCmnM8VA9pEGjpAZhYhib9DtnHHtl3+YiTysx4dhcTbWRzE?=
 =?us-ascii?Q?OGF9jD4w9igiXNO70VuCfHC5xu9JPJcNAtOW5fh3RelOYI5fDt1+9VhKDK4M?=
 =?us-ascii?Q?c5ZX3NDNbP/MWlux+fbuO+vi5PrCXqD6TbNtCGW0y/1STklZIel3Lkd1LFnP?=
 =?us-ascii?Q?kFu7jNQSB8+LB6Kt6DWDCUDTuwBACUiL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QVNPIplNYy7BoMRyxNC8iyhGNJPPkjJXV2D04TwTaUH1L1HUAMOXA5V/6WTa?=
 =?us-ascii?Q?eZKnFWnH7Sa/IKtfZCKV3oEizTE8yDtdYOnh7vN2OuaIBvmxJQTOR0qZW+A2?=
 =?us-ascii?Q?rucleUE2MIUb2uN0LakYfuhax8HidWOsxDZmivqDyrBIbrdenXbcuwHJG7uZ?=
 =?us-ascii?Q?I9mFn0/4feyUOYKrFhiL6y2gt9BrrPhyBp8BFKz8rBO2pzA7/7LnIpxSZbLd?=
 =?us-ascii?Q?jPrjCPV28LfAYS5GBKHZW8xMelYU67hf0dwyX7Vc4LoWN8Gm8OaJ31NBlk9b?=
 =?us-ascii?Q?hmbBV1rq/Ct2MuBfPd14fet3SbeTBl5ykx2BgvkOBVuhWSkrZLFdXhFLr434?=
 =?us-ascii?Q?zxga9SJqYJFlxysAHtCq9qgmGVhUEJ0Mq13FhMVEhnd8OXLgu9wPqgvzaEdK?=
 =?us-ascii?Q?LZ5r2MWZCBYD6qCTtdWnqd/pWhpXgdVCPtI31QPakpXSBdMgkwvwY6URVBtm?=
 =?us-ascii?Q?6l1fw69ehGLRnL3QgDYAQ3ZI0mKw7WCU9sEe9h4GoOnp/qOFK4ALdjRh4ssF?=
 =?us-ascii?Q?AWGBFPsWxt3nWX7ycNWLwNsskUQGvwtqpRoPM7joC7qiJLPIVg5AaW0GF5h/?=
 =?us-ascii?Q?YtFse8/oYhWh2XcibifxpKTmB4Z1L6zpoOJqua+pZiZZsasp4X9LlmxAumHa?=
 =?us-ascii?Q?nswaTjLMu2NcwIfXIo1ni4+VxGRzSInLWtvBwwYWjC1HWZNP0x/x7Hc6PCa7?=
 =?us-ascii?Q?JO5qMK6Bxwsw88xSvZeS1xuL2WtwU0xHxzWtwUPlzfUhK0OrICjhPtnwzJPh?=
 =?us-ascii?Q?idJP1BlZW00BP7yjwIR/6gkw82vNOD6/GD+OkaW0favGOLv7pr43ZxaQA+oJ?=
 =?us-ascii?Q?/9PLqWys9cCET4xf/N5kqR1Zg+1NEjSD9rCXno1tvM67D7qt4d3M/7jdAXQh?=
 =?us-ascii?Q?M9XtgYFV+YTGBAkw/PaVPH52Ie3yxN0kA/0xchosjlqjjzIQiyZ4JTnjJBDx?=
 =?us-ascii?Q?wbIixBArP/6TqX/SRL/vY0/eXqJUDzWgajxhi7kgImObCrMFK7aUallR6QRI?=
 =?us-ascii?Q?hOcSz9kT0wD/OXifHHyceupRkb4Z1Od5AMBOtuzoYVGk4lnTuXON6WChNLUv?=
 =?us-ascii?Q?++Awy65c9c+j8TYyi5Yq5NuWr3DmXiHvwdXsm5k5yBuTzlsrfMXcQpEocFvm?=
 =?us-ascii?Q?G9GscKRRTKapNewQfLakarYwxyyWluPuvAh/MC1SWfDjqV3MY1jtnCiZxmzV?=
 =?us-ascii?Q?mFwulGRBneCSly+3CfPPO4cgksF9rLfCaErxZwgjKlQPzsvN1SHpfhfK87+V?=
 =?us-ascii?Q?jSLSr0IlVLc6eZwRmFjDx2WQzMCR8IuioG/OkoD7MZG6+6kIqoRGVSIRJu3f?=
 =?us-ascii?Q?ahbvWT9Iap1JY35duDoQe47VGarUsE/OX9fCiTWB/O5w/eafFa2FzyUj+Lpq?=
 =?us-ascii?Q?LPb+i4MYzBbmWyPN6NpDkQ3Ktx2RSd0FEUHpxlJzA/zanvx/mBAw7vl8sDH4?=
 =?us-ascii?Q?HivVMZcEQ3mglSGR1xWKUHfHHML1HJGgxlK5Ux19x96jL5zb1e3yCzLwW3L2?=
 =?us-ascii?Q?bo+UaEk1fBiaWyTQSs4PXG6jENhdJQA7oV/PeoWvmiDEqirDxgbD/djbjPSE?=
 =?us-ascii?Q?X+SYipa4xsRQlBLErvFRZuQ7QjmrbhfqkyyAbZX2KFrWSjKYuTEPOGwLdDRv?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 921742ab-0684-4cef-8fc8-08de1ab2033f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:39.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEx4RiCWfTLBDBSkzQF3yPLKQyBa/pcC0OkgW9GLtXfSoObIS4Jo7gvcEJnlG9BXcvIZVwUx4sVP9eQeRsqQ+ipPY5gTrAeaEG0Jzf0vJSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225614

The current version 3.24.34 fails to build gtk+3-native with Debian 13:

../../gtk+-3.24.34/gtk/gtklabel.c: In function =E2=80=98gtk_label_style_upd=
ated=E2=80=99:
../../gtk+-3.24.34/gtk/gtklabel.c:4235:32: error: passing argument 1 of =E2=
=80=98gtk_widget_queue_resize=E2=80=99 from incompatible pointer type [-Win=
compatible-pointer-types]
 4235 |       gtk_widget_queue_resize (label);
      |                                ^~~~~
      |                                |
      |                                GtkLabel * {aka struct _GtkLabel *}
In file included from ../../gtk+-3.24.34/gtk/deprecated/gtkmisc.h:33,
                 from ../../gtk+-3.24.34/gtk/gtklabel.h:32,
                 from ../../gtk+-3.24.34/gtk/gtklabel.c:30:
../../gtk+-3.24.34/gtk/gtkwidget.h:663:65: note: expected =E2=80=98GtkWidge=
t *=E2=80=99 {aka =E2=80=98struct _GtkWidget *=E2=80=99} but argument is of=
 type =E2=80=98GtkLabel *=E2=80=99 {aka =E2=80=98struct _GtkLabel *=E2=80=
=99}
  663 | void       gtk_widget_queue_resize        (GtkWidget           *wid=
get);
      |                                            ~~~~~~~~~~~~~~~~~~~~~^~~=
~~~

This was fixed somewhere between 3.24.34 and 3.24.51. Therefore, upgrade th=
e
recipe with the commits from master.

 ...Do-not-try-to-initialize-GL-without-libGL.patch |  57 --
 .../0003-Add-disable-opengl-configure-option.patch | 872 -----------------=
----
 meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch  |  39 -
 meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch   |  19 -
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch         | 747 +++++++++++++++++=
+
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb           |  18 -
 .../gtk+/{gtk+3.inc =3D> gtk+3_3.24.51.bb}           |  66 +-
 7 files changed, 782 insertions(+), 1036 deletions(-)


