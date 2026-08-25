Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DFDC5DF9C
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11724.1787618778373088338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QxC3ZNYT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0VY0e343615
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	QxC3ZNYTf/OcIqvsY9QWMqGotlTcrH1dJgMW04Lv7N+q1LDsnYr8O7bOyITpNOHs
	bIlzc20TktyHa/x7xdn5TbcuoYSj1wczRyxXezeLvPwJOhZ/KZYBIIEZZXilsjv/
	Bi/+ajXTxITioo5G6Gz1t6PwtSeoRZ615vo+a7E8hNtg1lMUvZRkEZTuxg6+Hx+I
	ond2TGqMjdDi5h0RCC79Oo1tepUgxYvGlA5ShZQlP+wAFY1nVB9tuNSGrWrs3E2K
	DWq076hHw6el9sCg7mSEw5TeUjzqeICoP2tffUCdaYQayhL4EFHI6yinESSOR8QD
	c7BGFvF59DyBRPXxf5KOGQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020121.outbound.protection.outlook.com [52.101.46.121])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100kr7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eE0qgrKWKNkUarmAo1P62i0Stc7wRsJwc5U9zSrBMMviuubUtCyZHh0WSyrEot73e9xuGFNZbef1M9cCSKyvgg+iQVGqM3MH38pT1aPdG+JTV63BBWlLTYpP3Tyz+ys21MATeMDgFoEOsgYTfOYkIwGwKftGhMkid2qxWTpG8utgg2LNLNr+GqNHyFs5wFVuxXjxV/sC2wCckWxMafryG+5Z1Sw4r3Gduj9Cvh7VGOV72PQk7HCTOb6oGXHnsLXEi05c6gQTzg+ZPz8bSClkx8sjsHJViVr36IJUq/mffxu1RDsUINjYmx6FADCy5AsB6Dy0YTHeJDlHiBom0HpNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=MhETqhKMmVpN+GzHWVcuc5dLJXjwuWlaX6avj7AmmUKEHghErHSOKEno4S9gunG8xpclz8yTwdQoCunyibRpBuMZlt/bqg3cUtb+QgqtkpIzA6kVJemqYT+MlrQWVLNkkTdhGZqdh3oon3wkthN+6GXrhhfZBSyRcIjceyI4rVM+bw3v2b1PLBMjA63/80Q5gKxkOY2axeUnVElNUqKElxG+xkYd5mhEYhDv0EDmjQp3bpoJpdNC9lFEvR1O0Bibj/duMRrbDJwrGBFCxaatBiI2riQqkBJs8Gxv5+ukTqY+xvj2vhDYb4NmeiJxDmy3zjRftIpOddSSPe9yjVlMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:13 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:13 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 05/14] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Mon, 24 Aug 2026 17:45:42 -0700
Message-ID: <20260825004555.4111831-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: c07a9d58-ddef-498b-c718-08df0242435e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	NnNaAMjpnGnV0cDlNaXeB9G0/h8d/+EkUy3kewcC5gmiwYVZQQDg4E1clNT/0jrIi5WDjUSW4vxtpx0quFPU+K4piJZUkcNQZIy40jD5eNQWXrbUivzcNMYEzjxLoPoFjPeRrFEIXuhnycPajMoLydyn0SjVae5r5cajZytZXaCuqFcMgP5D1JTqR4x+yxYBEXSlJEyys9uX5enOqJ/3oGng5w6oAIP3to6iKDUMURO6MlHY0P9066ycTpR9J6p2y1cPmM1oBJiBOUsoCraN3QIzduZ1QhblfDUqBL9u0auli5JusU3klTmP2JCfpkFzPx3FPn2BNO0NfnJZMQ38jfkaguyoYAecsnUG11soS59kYmRYoXvyVcjVtQ+YZ0+p4RMgZSpyb3lVOEkJmo20QymK55zvykvynC4UcfDxURvqfTGuF3NF795NRjfUx+x9BIV48Ojz5Q3AdobGMxg9VKqWcVfWB5BdvGghgShGY0Cnd8wK6y3fUIaA4itkLJcMhMKnjYITtWWmh8ds45xLDB8ft+fAlRaYhRxCbEgS/WUW8Cd4x0mUOA6CK+W8EIGPzqbw/hci390Sbtbe5vrjifTXhvTmQ22GH7FZez98JJ6p1kaAu6K84zOOFcXh9Vy+mjh5zPa4C6MxlGtgryYnqygfZu59WS0feLGXhrZRRYJbGtlDrISsCbFEs/tS4pba1vSGBmWitDyXtC+R9uH6x8h24VlAN0EYiasALtXs6qQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pYZRaSw65sUCIPK0bCBHVdhCcWrxxrZ7DVWRK0RJjM7sx+WFEmAMYEZU4wlB?=
 =?us-ascii?Q?6D/7P5fD1mqwouljKnewM95GrAbtoyR0XBOAzB81MY3lJ52i+OMJoodoUSZt?=
 =?us-ascii?Q?0QnS7OXi30U/Zet/AAr+58eJOog6QSHjCDaKotvYfqgQmim3ZB3rINLYlWhf?=
 =?us-ascii?Q?yvSsoRS1un0KXJZ1d+fLrcUCct3aTAIpRYRZbCukd429nGt9ONPD2L8tlDlq?=
 =?us-ascii?Q?sqOGBB0o36fX7Roa3l/mh1r24Rm0F1Rs9mrMe3vpqJfxNOkvbf55AP5RpRPb?=
 =?us-ascii?Q?XsjQBOJETKaNHn935FgL+K1v6bSdkKk20vnpQ+0AWfaDnHZJNUtlvSDcSt4I?=
 =?us-ascii?Q?RwoBz/xAZWzIF8qbp70TUZ+GsdJiqLWNs/HmNDa60QXfu+hYoBD3LJo5e8va?=
 =?us-ascii?Q?PvYFNPAVrkmtIOiuu/ceiZoxnEXDQ5f/yeqI1OuV97sJR84MPh1npBYTuVfB?=
 =?us-ascii?Q?1cmF4CqfhURfGpfbzE3h6nmWuj60W7ZTbCujYpjPIlGLfZdtMAE2/KcqxQYX?=
 =?us-ascii?Q?ydBRqk3aYcONjwGz5rtkt/oQNeqHzEKnyIP1K6rvhvZC0TFocCRqcUKy6ct8?=
 =?us-ascii?Q?I3/m2wUHnKZT/nZVsQMdZPM1z7vNrGpfqF08Xvg/cfDb/dNoQiWd4aIIk/bn?=
 =?us-ascii?Q?FSKVVYcCt/oHU7716s6dxS/LF+s+BUzaeVNadQ9dpluFBZHuHylSWlOBxhfS?=
 =?us-ascii?Q?EUl+wzEQllzjrb97CMvzr89rRtxRmO9xtHZ3NQjHc7xBCkfee+OnUjSYJdyj?=
 =?us-ascii?Q?FpK+hubT8xwf2z9pPn9rPrhX6HJo1liT4RwndZvlgncT/8alyu2+YLRL8Gtl?=
 =?us-ascii?Q?kHE6Ntf+I+FJk0w97mo8edtnEgFCwRUb3UuIqFMTU6u0hl5lSWD46Q+Afdsj?=
 =?us-ascii?Q?BAxbLD9VBGM1tBpQDFC61l5UeNKF77ekWnJ39WZZvT6mjyrYHNhUxje2863p?=
 =?us-ascii?Q?S6RufEqU4TLEUmL6qtS04L9AY/b5vB/AOjT2igaQYrpBg37TA0qROoq1fyiZ?=
 =?us-ascii?Q?Yhrjt84sAqIj6ep20hs8HSnyG3Pze5EdqMEDab9RmIUA6mYGrUzJoc0I6jLz?=
 =?us-ascii?Q?PmeGjHSY7J6jHgxOzeR31QBmBVBA1d8Tmf/KIVN9WsLFP1yPQoxD+d0izGB7?=
 =?us-ascii?Q?XvT6D7Wdx6iy5I0SlSP5T9OSxn5Fm1GzxPUsc1ZmN8mVygxb5CG372EwiZqf?=
 =?us-ascii?Q?ekJfaDg3VBueLYruAMAoirS0yFajM2bJ/NnoK5zt/FLg4lIj4m8HWQuTGVB+?=
 =?us-ascii?Q?04xrYPJVMvZ+22rUSX6KQf5BfGFqTdFRi05by63GSKEqpkQeC3pgSBzX3X1A?=
 =?us-ascii?Q?Sd8/Opg2ueYRr/uz0s6LZIpXlodI5An4Lnu9zmk+ZtBbkEa4Yj7Os8Y17L58?=
 =?us-ascii?Q?wkwHsTCVNxOytmO7KMjF6Vp/+VBBrbGxqRrOyNk8jBOAu+NuSOIp8afLlSX1?=
 =?us-ascii?Q?AfhiSOiLFzfBB9gmt43zELETgE6AtmxyH7Zuu4gOsPLlSzT2J64bMV9LNHia?=
 =?us-ascii?Q?XfCG+vyjjgJOjtmg6lPgR/1l1V7KVNuzLQwrd4abeLSOcxfShJ1blKovD7vc?=
 =?us-ascii?Q?ZTzKXIi3zbJ1KG+u+77TUb5bt+u5DtK4Bz6wNr6Hg5G/4vBJ41/fsFRMN8fS?=
 =?us-ascii?Q?u+aKXRwYL5CjweN/0N+XSCZlfQyylTzclPHfmD6Ew+UksdtYRrqdoIXLi3rg?=
 =?us-ascii?Q?DRLsDQTKXqzsqds+1g7C5VHydEb1SYBKgCmpPvTOUXubcpJg2GDEEuBZBW4N?=
 =?us-ascii?Q?Zb3Q6mCfs/Pu24tOqGFtKLkhNBY1RRg=3D?=
X-Exchange-RoutingPolicyChecked: 
	ev3ODyGQEIZxpNP1z4dH0ZNOGuhoa5kdHQqTkwqNUYf92hp6H9IpZsNr9gDHYRdODzlUPfkATxrj1JO5fVUkXTMF43JM4TzvrNwxSeziKpgH5YcaWL5C6bywPPr62zztX+/wiC0O3FT/EPQtoVCdbauQFFBF2hmkvcdBqMtVegFRzTF9TT/Op5t+DnESrYmJ2+/uzmLXozJPAsuos+A819wpFb6UXpAV2ArYvQ+rxzySRIerk2ObrJoWkEFh01sZQWC5PzosLEz4J6PeVsEGqgQ7BH3bV2Ovj1OBZ47VzAMAB49vKJ0NKcMsqZ6dTfPqaOq7D4N4d+Py0guybavWww==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07a9d58-ddef-498b-c718-08df0242435e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:13.2134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEoEsNdzhWdlqTy9rEOoBp6H7jHAXXl7chIVv1SAiYnqD0kv/NTL7KYDufIvQa8MJFBAYyIGPnsxHeevoKOABubrBei+fq/TEfzNWZQSEms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Z06beDI_RfpJilc1dnbN83f1jwnrE-AG
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8ce5d8 cx=c_pps
 a=pjPKNKgC2VgaEdt9hcwoBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: U1UycVgfz7sMNksnZU2f378xWyV-mChV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX5kFOipJhUXUG
 d4AEcVxCzEzXu4/kczg5LN29JxgN3OmUvXUVTZ58BFf1b9VMxM/uQgEpqYepMbGRM2Ycu+54xZk
 3sgF6qvbUGkQm5raN/zU4tbvWvlUL94c+y/wh9XonbNekaS5Q+HE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX56/pVAaeOhA5
 tAHP8sJak7rqyWIlXOe5j4m15dmb/KWCcYjGfYYTHZFqVFxeorO90pR1jYyuKlE2iYSeL1KPDPW
 BaCtQXDdCxT1pMqurxiOvJkHAJ7PCpaflTkqMAb+ISxXE3o5IbNL8jTvbERExtDFEFUt1NhYGDV
 Sdi7OT8fKUHEdF3N55w8RwtvSmFa+x+QULZNKMpXRyMsm8rIWVw9+FDtlPU3JBBoH/FDLR5PC+p
 5Z+wVC+7vpKmLwZUcnBQ6Eftkv5Pu7qOAnbSGObSC/HFmdTTEqn4l4EowzGUDLh/Fh1wSr1ZrzA
 LPCIB3fvEADFspY6dc72EgnoO8bn7oio2uuDEKe/FDIGyGtI6oRGjbZjGWNiDAw/FiF3skN8GGI
 YROoCVYR/ijpt7L9V4ynNgIkLtDopSGwq0lQd2jvhL40038v8Lx332+7ip+UBSJI+0CRdShlEFM
 WIS+rlxgEO78NMUareg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244162

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

