Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29642.1793867185526627759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=gVVh3Dai;
 spf=pass (domain: prevas.dk, ip: 40.107.162.4, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwKIK9MJ8szsMt2fPsuAW/66VYJEfoAb4jSBIwjyTaI3eRsnD5t+ChezwD8ex9Tg4Dq0z7ShX5dmILLWORt4c6nMdM+zIKYGE3vlWMe+WUOUl2D7gMOAO2HRFJBN9B7wplBjidKV8Kj2CZJ8Tl9IrlBvXHQYx/hBTjwXVvVvpIYLGpcveqnsetKKbCpo9I9QNGsV9/iRg9JXoEyE8IaHgmo7MjSwoftXEiIseU2gcR1B03uTOnFKFdn4XlwaPdkecyzfdMel9BR9roX6qN/P8Ty017zJJwogWfa73wZ84wpC+XE4+WjTnl4ovWyFHiaikYXPaTgJg1V98WsWJwhNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIR1gEOly+P5dUEO7KxVL0v9uB8sQJJ05FSEcYZB1Vs=;
 b=f2HSkcr5G7i9kUEGGAMQ+on502yxEP7WuU0vMwW/VQviCMCQImbzIJBl8V9SS9kegGSIPRl+GHCHKrEnLv5uY7X/Ao7xD040OqnyI7sLNJlPHB3PF5EgsMu+A+X5D5WcB3oefXvrQ5JVJas2VIS5cwCbA3GEuQKFxWlczDu/5KOZwy/ciQi/KkwBwqSqCO1o2oMo5AQoJJXOJy2cBOtqMUc7y+cP4LCy45r2CtLalSfM/CCiV9I5BfPZwqRVpYrshYaO1FO/bVq5cyRczOKTBSU5hICaBl/qFAjn/i1zpdKQvQaFS4G/T4+LuBVE75YFNPdMH4r5ogNYbtQnxtLFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIR1gEOly+P5dUEO7KxVL0v9uB8sQJJ05FSEcYZB1Vs=;
 b=gVVh3Dai4/p+JqRKfPFIkbhcNgjt2v7iRAG+Pe282welT213zrC7QqIOUGbZd2gSS96IeDZcEHjqS1ssRuJHFRsPUCouPFOTPpjSDVXlGDLjeft5KGc5pPUbVz6khB4FMa8/if34LITYRI4WZWqKCIndURVq3P7LmGVm2bv5V0k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ca::21)
 by AM7PR10MB909885.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:182::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 08:26:20 +0000
Received: from DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e639:bdd4:4bb5:6361]) by DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e639:bdd4:4bb5:6361%7]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 08:26:20 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] image-buildinfo.bbclass: add missing vardeps to buildinfo_target function
Date: Thu,  5 Nov 2026 09:26:16 +0100
Message-ID: <20261105082616.2991341-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVZP280CA0060.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::16) To DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4ca::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB8248:EE_|AM7PR10MB909885:EE_
X-MS-Office365-Filtering-Correlation-Id: e4449261-f431-406b-13d6-08df3b167819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261102123227099003|11063799006|56012099006|261009223027099003|261021121427099003|261022075727099003|261028144727099003|261026140227099003|261026121527099003|261022115727099003|261022105027099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: DoalMFjb/v9nUymvARWRYtktMXYjg5Nr3coH79JOiJwzQL+fj8d9GWsljfXKhXAZA0TljyHlZcgzftSKGhtNTyN669WoaOLCEYZiUdAbsoQexA/XSx92wLjBogGZDyR4aJ1/4sEUVRbp05HxMvQ9uwLXCNm5jbzJ6agDBDOdvZ/waKcyaP5DQVdp9fb0v+Sw0pYtD61+RXC8hwGTrwN2CJeFGRUShBbyL9wCr5J9qTc7z0MDIYaom0kHbekSs0eid2dslxwnrKEQb6OmgUYRkYL9vIVAH7kCzdTcud5Cg99LMN/3dhpPLKD5nILoJokoVeDopLu3DU3gX/uKqLAkl2rP6Asm76Vp4gtk2ducY4DdqYk9NhisCQEj9ARum8wYRQT+OJOGiJI65BtJwYziArvut6ZKUdK+5qSeJ21rpkGIcNPNSFRnHnukyWgzOH5qO6od6BKoysthqr8p1qzs9G5xRbKRq11Iucl3scg0F4jEGdzBY+1+7QEkPfmFcHjJ58CnFv4ZCcxf9cn6ktKqNsLs5L1PfJMHCYYfxAds66pWxaibjaqiuVPvbSrBmcPHuAeXzoLRSw2Y4JxQaEW/YxD8p9/zbwRClmPJMZRgfzC8w7AxRqSgAh04mWsuWTorEhsU0Y2/t0orltNQ4Q5ujNnRQ6qMsZrtDcTgYRffPw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261102123227099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022115727099003)(261022105027099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9i/nd8kUpRah1/dnnkbh9X1JoGlKRrqiFMo2/aQ7XAzyWhBlEkkDlGqKI2y?=
 =?us-ascii?Q?vG1pFYU8hXpN+GunNEK9QoCqbKiRAYEu2YlGf4kFluFByATCPqVsv4ey1eYq?=
 =?us-ascii?Q?7UYjizt59w6F4Ng7UfhB/QtpcE6biriZei60xZWA5GZXnCyzhJzSj+IHQvuS?=
 =?us-ascii?Q?5Oxylele37tYptlb2ImRPbnhbShWWJQWu2qre/HEIV1kHBadPls9r7ivhRIJ?=
 =?us-ascii?Q?lnI/PRK35LDITMBFmA/e3zUiuDu7yKk2E+2DuWhPXBa4tr38nGi5Q2uJKjku?=
 =?us-ascii?Q?yyuG5hMkRsRCB4vNu/wubj0oDUY1IL2HeRaO4xHVg7bwfv4ibxtBahHP1a2H?=
 =?us-ascii?Q?xY5sgyPLEdAxR6IRYnnJRHWOP1ip85x2U9Jbaf/PCSRHOAxBXv8idOO3+wNU?=
 =?us-ascii?Q?3mqnduC1Rc2Z6itiNbFpwePXeyrcNZK590z1MINscmnlsn5Z9NaxBIbWxjyw?=
 =?us-ascii?Q?310damgF/sfqA4unWTTxgaEyi3u6gDd1zmgUUjd+WSDOq5y96yWG9jBYmt7Z?=
 =?us-ascii?Q?bdZeTndtI+IG/FxDuZL2ya21xaifaTK/KiHA8PBDke2Jv/AmfTtLmq5Z72p4?=
 =?us-ascii?Q?2KZOuuX/8IK3Tx0VpjBb3QSokgGV6JWuMxzSfltJ4SMy58+g2QtikK44K5LG?=
 =?us-ascii?Q?fkM6FgmxAD4K1uW3uyZNJfH+A7+RKswwpXzZTvEHo82f/nPAECNNNcWWlEOB?=
 =?us-ascii?Q?MAt9UYj2YuFbZ2xw0/trL+SuFH3Zjh9l/+Wvsavj48Vgr/lK+nxybNKFWXja?=
 =?us-ascii?Q?9tRvlWmgjJBjRlwIhl1F2O/SvCjIQOQg6PTzwjQ1nPcpctShO6MM6rUfPhZ2?=
 =?us-ascii?Q?xAiyPSPnp1bbUy8t6qMH38qlbLb93KhyGmNeT3Vmn4m1Wbi75Ra6Y04C+QlS?=
 =?us-ascii?Q?MCxjrJ5DovzqkckZHsh1i3FwYdsO8bYlUn1pOBRk4AeXgV6BpsmlPH3+xCiy?=
 =?us-ascii?Q?yR+WRh8u+nvMR6J581lzv8bLoAVyJymQsjINvHheu5qiYkpNDIxgSkCV9EuO?=
 =?us-ascii?Q?Zi5vlAfULAimcXNu/jNXtQyOIwYQokVrPJnuXigL4z40LlDfXnmjzrh9v+oc?=
 =?us-ascii?Q?FtEcJmyOkZdX80gMFy6RyrHxKPoKfQ+Ol4+Esh36TV/70E4BhSepRSdHMrfw?=
 =?us-ascii?Q?nHVUuayNn6Vko0N69FrJ0c9YPeGN1FHLHULUMhbHqaD9mCqT65x2k8p9700a?=
 =?us-ascii?Q?kGTeEvipqEb8aFxvWzgFVqCqkhWEOVF1nFKqS31lwGIieio+faAqphNp2VWj?=
 =?us-ascii?Q?zkJDTK+eLA0mK/vzis2pLhl1m7d8hX3xRl+/x8gPMlfVIKfJ3jcS/Pk2RRma?=
 =?us-ascii?Q?I9EeKCXuj88BMWRnXXjiqbtR/E3JbpvtGNstkKCYVzJ4RG6f6lh3AAm0Bupp?=
 =?us-ascii?Q?86tQUqvp5zLko1IlHj/uyc2tm9N4RpZhCaN8pFfOQmCXq6DFXnZ+JWswjhw+?=
 =?us-ascii?Q?FpAaT8XbL+dAHwO5Nv/AOaELevja3iEPOG2ce0DvCt77eTBkX9nmwa2ZMQL5?=
 =?us-ascii?Q?qONd8Q9NHiAsGtgQ86JYtNlMqYVJG5fNubnRxhIekxakgGFblnBeWWgJDAq8?=
 =?us-ascii?Q?kP1E1ozdiH5EooXT63RNcL7QoWyJePaayseYMnxJcKW+c8GtG4UvunjAm4WG?=
 =?us-ascii?Q?kD7h8WgP3Phl9nTDJBamg3ZCXXqhFbJlA0OEnG6xaTAoMN0jiM6bujfuq/cG?=
 =?us-ascii?Q?3qUL6n+Q2B8mbPz2HsmFd+IqiAfoF/Loph3m0/4PW+1npFnHxaUeV5XhvBom?=
 =?us-ascii?Q?xyeA/pbiqSQnhacGQ7fPyCOg5Ht2M/M=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: e4449261-f431-406b-13d6-08df3b167819
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB8248.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:26:20.1758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+lETmn7yh+4Iv81df6EevuUyb4X6Mk022nFZK62diK7Lb20aoFIhmQqMuOQBo02vtyZ9ZZ9COdwEpbxmR+H5DMszK3wcP61wPGBqA17nJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB909885
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249458
Content-Type: text/plain; charset="utf-8"

From: Rasmus Villemoes <ravi@prevas.dk>

Bitbake does see that buildinfo_target depends on the value of
${IMAGE_BUILDINFO_VARS} itself. So adding an element to that list does
cause do_rootfs to run again.

But bitbake does not know that the value is a list of variable names
whose values are fetched, so changing one of the mentioned variables
does not guarantee that do_rootfs gets re-run.

Fix that by adding all the ${IMAGE_BUILDINFO_VARS} as [vardeps] for
buildinfo_target.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/classes/image-buildinfo.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buil=
dinfo.bbclass
index ec57c04e55..de0becd432 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -41,6 +41,8 @@ def buildinfo_target(d):
         vars =3D (d.getVar("IMAGE_BUILDINFO_VARS") or "")
         return image_buildinfo_outputvars(vars, d)
=20
+buildinfo_target[vardeps] +=3D "${IMAGE_BUILDINFO_VARS}"
+
 python buildinfo() {
     if not d.getVar('IMAGE_BUILDINFO_FILE'):
         return
--=20
2.56.0

