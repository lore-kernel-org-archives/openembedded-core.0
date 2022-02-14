Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780D6C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 15:45:52 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.73])
 by mx.groups.io with SMTP id smtpd.web09.35815.1644853549364030977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=BvJSJdY3;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.73,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+skTnAvDr/cEda+Ol/Vz5FAOaE925KkGbi6QNB2evItWQsKgpmZ7GB6gjIU8svEgJiPB2eZ/zKIzr3QW+54/TnKSngj1cfUM8wYuW/5JvFEPCvzko80s9Eyub+nd6hf+v+sezhM1z7XKIBIUtO9zmbYd9MwsXVBJpbogmLKuzEHDMZkztXgxEUtzCaRWZ6q1SJFOYvLjbZclzTyKRbXKPYGvBr1bONS4S4tjsBfNGQjHNnQAmNcUsbAxKkkyPo+3TAe+cBPz2DO2Ap28jmnmpTcyp2vgEOE2ae8lt3GOmyTECNjQivZAlfPxXqFEJ6oaNPTdVXbKZO4L4QHo6oVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwtRa/N7AW+KHmFJLYofEZjP+jm4Jfq2y7RRgeeN2XM=;
 b=HH6K9nq2r+m3gxqDDVEc6v+9mnSE9WGH42rg7qRJ/wZ/q8zDXDEECeSojHOA1xAN1BIs/KJMRlT5JgtrzuKQNI38Kg5NZiCT+dYimhR3Ir5URwJMxeSeQhRdveguUU/i3VSoCYManEc5zMshRpG14UslmN25/OwXeDRPMdDjOYHb7UsGiDJ5ncgwBJI5AeykZfitPEUfjaoqIiyQecFLTiCHCDc/7aBAXYRj0ixJVXrba14xjdF3+PjvzUUxkprBgU+ht6rMa8h8EU+emkY6hWmqRdfElmixi4hfcgrZO6tpMzI0P2MEhA6DENkPuV08b9dGEGiSBaOPX4gNtVPUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwtRa/N7AW+KHmFJLYofEZjP+jm4Jfq2y7RRgeeN2XM=;
 b=BvJSJdY3xLYtxQxwI5m5M0yGFFdLSN2czZUieIawAFGmDNTZ6CFUogN5vB4olgn4KsSWewZ8FAq0aHDj3VxHQIvuudl6mB31qSty5/NqMzWdAScL/svs4nAjxJFbeM0nVVj31Rebc7FXpFwzEYIysTY6kgrVObPhtnIPDvEzSFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB8PR08MB3929.eurprd08.prod.outlook.com (2603:10a6:10:ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 15:45:45 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 15:45:45 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 1/5] wic: partition: Support valueless keys in sourceparams
Date: Mon, 14 Feb 2022 16:45:17 +0100
Message-ID: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0257.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b6b7a22-d5b7-406b-edce-08d9efd1103c
X-MS-TrafficTypeDiagnostic: DB8PR08MB3929:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB3929E6D47240A710ECEC84C5D7339@DB8PR08MB3929.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GvSnddXHVs4vs6MZol5bp9UEo5yQngcaH+htKCtrL8/qII5EeqwmngCsXSVjzu3a7/cnX2IDeGoBIrj7HRhWQaDKMWxHdyeNEYNeTOp1qqzbpGOBJsoVsqIvraQMFCa5BXfdHf2iGfPB/fiWgFYxOhck/d//ENpEN5mTSoR99O9p6XM2Q3IDVvrL+fj04pB65FquJ/y9h6yXZaI0GUceq2za8uPq5AxxiGNWHt8hxqL2y3mGt/DWCn9TdeM+Vcm6bdZpfXxwDJwe6FPQpE2xvlmZdvIP20ibxiS8NYwqrn9kQziO7NiDnEKnp7UxFuhcVVPqvr3nboW9uURD56PmiVJCiPOSuPAz900DcLVJlEHO+B1CwKemnU4xRX9AyZuwcVYrkLmf2rHjI6UqV3WA3zICajcY7u4lsufvOb7P+aRgGPBgy29fXvj06ygJCYIt9g2svOiEYka9yayc4PrvaUA+VjHyp9bnYI2JpnNCkReZiUAHxbzafYcvKgEdSL2ZUD90x6sLRnWOoz25/RfsHXqdWyy/Qg+FuOCAY4s7sInk0E+dvFP3f/ZZvHtChkdt8eVqIqlaSVn/6M1rI0RC0U5ubD8cIt/sqqBIXe3c1fKNGEMxFUw17dRSwqoyCR8pkNVAOf7lxYGmvY5TIIRbP0ajHj++epnCtriaUPPrBm9Wsxo3EkXO+Uy4lJ5bml0QH/iMmsh+Q1fMQuLe4HTF4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(36756003)(66946007)(316002)(38100700002)(2616005)(66556008)(66476007)(4326008)(6916009)(6486002)(107886003)(1076003)(186003)(26005)(6666004)(6512007)(2906002)(86362001)(508600001)(83380400001)(52116002)(5660300002)(8936002)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UdYxmboXOR/MCv/ToRtOCea3AeytdMIZaP0uAP8OVs3KzPMIEnLDqIBMWJKj?=
 =?us-ascii?Q?sLxTQkcWnFDmXgI0UsJwbFCZbDk3CvwGDr8YWDa3ar/f+RudlOPxP9dHh0q/?=
 =?us-ascii?Q?qqfSHH6QB9XuhH0V97Hsgk8yIpO/xaUQL0ptIFAtRviPRTRgrIgzUD3/tHha?=
 =?us-ascii?Q?8eshsH4oWJHPTDL4lP425bgiEfB8HV8fiMqlDCdYG4IUdT+Gsx2t2etsqr6q?=
 =?us-ascii?Q?JhXOlUCmaY1tQZv5Y3m7h9+vwep2mizf1yZU9pWSSGBxk9oPvX8wy9uIOR7G?=
 =?us-ascii?Q?qbIc/ibxOsFV/21KpOECGaFlo4Rykfweb2/Zbpnb4iFjlYLBIJE1TGEcaLE7?=
 =?us-ascii?Q?qGCJi1xtioUwGXIAV2SSOX05wD/xMz8Ku/x/Jo0k0THxi9+BDiTnQZ/1Q5WB?=
 =?us-ascii?Q?JfVSiR2KydIU7o1bRu7IbcPhX8l5R53Ghs8H25QrUnrZzt/sr8n+OSYQmC86?=
 =?us-ascii?Q?YyMZ+2GxU6Vli41LOzB4pA8VxASnXIbXKFRIyE31Lw798sPw/WAZ0YUk1RLo?=
 =?us-ascii?Q?IgSXglgjE0xyjRZBEpNemq1JB1Q7R7uaSKRUOrBC4Uw+HYiXVSuS3qklv7Pq?=
 =?us-ascii?Q?rw+WDHskIs6CupqvRP/nN6Neuwbcs6z5e7Wdgi/rDLpQLoNqX+tP0LaGDevI?=
 =?us-ascii?Q?6zd7Z4dZbpcA2I2eI4syj5seDyISI4dWF+Nz+5JqLkLOT1k76ZrFxrJ0n6I/?=
 =?us-ascii?Q?8ilsV7+9Nfc6HgOUIJfnQYldLR7FO3y+RfaZvUxnISt31YkuJPfcdUzk13r7?=
 =?us-ascii?Q?DeQ/34il7yCbfkU/xiDztHdY2/q/jyx99cUQLRxHDuKTgu8zBFF1zKB7AfoE?=
 =?us-ascii?Q?8evfNpjZh1v8TOFRH3GQvjhtQXLGvgMHQv66NU39W8mz+vi5P2IirYOGokr3?=
 =?us-ascii?Q?dqum5bJZKW4dowmb8Svl99BbXk9ySyjNyIAT29a0eWowXijptb6dA+K6CyDv?=
 =?us-ascii?Q?O2PSoFFBvBRGyL/v48uQMq0WRuNm6ceztI3ItiTVtjAWygGt0wdGjVAKaOPK?=
 =?us-ascii?Q?maZ/xs+N7sEJYuNZjz269YJguM8Fknvy5DQlN3426zB87chcNZqUqzQBiPlM?=
 =?us-ascii?Q?YyKup6ylekWB3ZFhtznWId9Iq/U760BpKBiC31MH2oko63Amll2451EjEM0N?=
 =?us-ascii?Q?WQZpC+TZ47neo1rrmPbi7awNHbo3HiYijoZTRsHjdRv7jHJQVek+kPxIjTN0?=
 =?us-ascii?Q?HihMCBpareuzAh4Xjgt+vHhO0soMKW4wnmMDQubLrq2eGWof/dbJZlVA/bF7?=
 =?us-ascii?Q?e0R1CU9f4mgL8FAJaGwP4g7+/YWJtOWiq4MuZGg2sC9nQA8NHZ1xoDMRFxrr?=
 =?us-ascii?Q?l232INTcrU2Bw8V1SFTBDG8meEO3tV22Z8GF/+UYMLIdiqKg0ftOqiB4ulyk?=
 =?us-ascii?Q?dYa3v/LtV8uH8ZXuOXWlinu/FpRS9JQYxrHDkFbWSuPh/VbNKSxfdQLIDoNZ?=
 =?us-ascii?Q?ppLJDBYqdD4Ps606RB387a4Gx7LjGagM85UO8FEMgjEJYoT4uDP2TfAFIthw?=
 =?us-ascii?Q?II/aZYR2iNc2DYI2H2N4cXV9nTgvE8yG2ZruK5CcvbGy64H6Ebao9jWY+vD/?=
 =?us-ascii?Q?cXnzizsdHYsiJWfXl/I4vzt9kVQaiFUPLCbznhb0OT6pe5pP6G45tCS7ly7Z?=
 =?us-ascii?Q?7f/VVEmAd6lR+/TrhHlFiEk=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b6b7a22-d5b7-406b-edce-08d9efd1103c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:45:45.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eTJ079+GjmApR3zjrlhprJY9eZ2NJz6TZff+fsrHyx8HI590J2hA7iBQhscIeSG+TPUlFe8BtqwHIQK+Ma23bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 15:45:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161715

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Accept valueless keys in sourceparams without equals sign (=3D) to match
the comment and support Boolean entries.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index a25834048e..09e491dd49 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -171,7 +171,7 @@ class Partition():
             # Split sourceparams string of the form key1=3Dval1[,key2=3Dva=
l2,...]
             # into a dict.  Also accepts valueless keys i.e. without =3D
             splitted =3D self.sourceparams.split(',')
-            srcparams_dict =3D dict(par.split('=3D', 1) for par in splitte=
d if par)
+            srcparams_dict =3D dict((par.split('=3D', 1) + [None])[:2] for=
 par in splitted if par)
=20
         plugin =3D PluginMgr.get_plugins('source')[self.source]
         plugin.do_configure_partition(self, srcparams_dict, creator,
--=20
2.30.2


