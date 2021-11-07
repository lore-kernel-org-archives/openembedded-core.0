Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096C5C433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 16:01:26 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.61])
 by mx.groups.io with SMTP id smtpd.web10.32594.1636300884861557232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 08:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=GE0j3cRu;
 spf=pass (domain: nxp.com, ip: 40.107.2.61, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4lbnAJP2+ItxqIyR2j6e5xnEqO0GmH1Cau6kgLVwOYW29DOlpEUtKGXFbR/4eS38P4zLELlIdIs6DbUcwJ4otzDDmlREcKR+HRlzemVzNkX8rPQHaNLhkynLXOBnWUdbjpHrNag/Xptz502mlMD71PXnJP5Rj2+nHpKqLEgVoV3myBzXpR9x69daWQ+kSmX/jYFWs2EWbM5EhDMXbpwpuzQprWq/OjZyEnXzw2UcFauhmSrNm3qdVh2bpDMH2V4+m34i+FGzb12XlQIXe75xo7NNklKLzl171zg0Ok54o4VnCHrT/rgtfi/NxEBiijy5HJJ9w1ZeZQ+2bLJu+TXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFX2OytuxLJX1g+OFOfEPQp0iMYGfA3h8Vo0eSmOvSE=;
 b=PXpJnlijAjO8h2/5XA31amzHiKsx2qd3Gs/WFsqE6woSw7qfpOE4TAxAwBoXwVj5f73KlV06J+gsZVNz6vhCBUeDCHpWMujXzF/N5VnXx6NCzF+ZUTPaax0LBoVvxWwWOIJbRG01njowu6kx8hDDvPlXQ01upkrvotRWuoC1Qw5Gd/jE7mkgTL4AGk9cljjfgqXSRXnpdtma8YrnwNbRNmV+FfC9vA/QaTqEFs8ZR6GTxf1xlq5FrZ1nIznwgV4RUy7aM9C86jDDn/+GW54ryiM54Fy1CJBYhAsjwUmPDlSQr+w1AYBTUC4DS0p2YSCZrLUPWF3OAqkfw6udM0MKmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFX2OytuxLJX1g+OFOfEPQp0iMYGfA3h8Vo0eSmOvSE=;
 b=GE0j3cRu28Vy1m09Ey17wb73MM1cwFXzizh++/LXDWLgXrhZa5HbaOUhiaKpOfQIUDNyYCZQgMF1JM+SyXOH2R/OTg2hzNLyqx179CphQvO9RO6g2vi7s7Ltk9JHMjeOWVJqM/UyNr5daDs5huG/cE6C5ay4NqIFlMWhnsIjhAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB7PR04MB5259.eurprd04.prod.outlook.com (2603:10a6:10:1b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Sun, 7 Nov
 2021 16:01:22 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.015; Sun, 7 Nov 2021
 16:01:22 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 2/3] nativesdk-packagegroup-sdk-host.bb: Update host tools for
 wayland
Date: Sun,  7 Nov 2021 10:00:05 -0600
Message-Id: <20211107160006.25440-2-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107160006.25440-1-tom.hochstein@nxp.com>
References: <20211107160006.25440-1-tom.hochstein@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 BY3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Sun, 7 Nov 2021 16:01:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 835b08cc-910c-4c33-3a29-08d9a207d806
X-MS-TrafficTypeDiagnostic: DB7PR04MB5259:
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB525944876C0832CBC2642AA2E2909@DB7PR04MB5259.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kbl1oSgHyeBrXumwynPDUNHMSu/hxnloJmGGRS+JKdNQHh2uyaoNaLDaXe0++mxNPjN1HaQwgG8vaHq2FDcn2R/xWHlMoNJG6vMGMsrkQlfz1Js9vbaYh2AbtLUnnfmiZETNtRvd9DwQ/90WxcHxnsu/bykUNfetjAlIv6oR5dy9t6ST2mpGxYGTUESkySk616h2wAPT5golZ/aYPKdoM0udek3AA+eDYJRpTE9h+wFerBzuwwCJZIrs2/jDaeLFcVPaK9IHhK+yvYPzTJlDxe29rhMfVBSJZMAKwPV7m35m7C5qo5UnfB0+G41b7ADtAOGuLkKIhoZqn1gziuk5ql2+K1vZsmkPPxFB/F0ySImvWm9C2NetP2uvTmfJJqFtYr/mgxsDZi184C+ezXpUvtxlctEgxkqStqezhfz3t+dT/UEoEOw8o09ZOjRvV56//vOQ4hrQMQoHACqjJ5ml1PAyJs+G+0WhRxyjuEOlnkoJz0EGklLYK7isoq2d4ZyrcpF+RlI9adza7JXJqxHj8B7Pe2/hqGLmF4RPX19pnsY/CAftrUeRC63Gpl+WXRTHqfm2OJjBnpDrzA1l1vGKkUDM8CN2qPvm/kxaxFAGelGYJadLQXLMtXhJDKSEMY84HxkphDbyxOLB11uvZJDtVLuarXgKwGipGafYkaJ8HkpZiF47XxsQ5GXKyZNw+03Ep2QTXts5NzgPPh8EOzwMEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(5660300002)(38100700002)(6916009)(38350700002)(52116002)(7696005)(508600001)(1076003)(66946007)(6666004)(8676002)(66556008)(6486002)(66476007)(8936002)(2616005)(2906002)(26005)(44832011)(186003)(316002)(4326008)(15650500001)(36756003)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uy8QQ4zb/9Nj8SdFYM2qJ9PS23dr8eduZTYdIiZag9a6JBHoRl73ndwMscax?=
 =?us-ascii?Q?TPImg6c29Fy4uz26TOPpiMjxA+4BBEQV09uQxLehl4FJox8CuBlWebg1xk8Q?=
 =?us-ascii?Q?kd03Tyll8aQQSTXD6ql4oFAo9CLB8khvApWlvjVKEorOwTIHizgPC6ZY0p15?=
 =?us-ascii?Q?HpRzzU2wOMME5nKWISM5jc7ClTyqjR3HVtfiD8SNF4fSlbxLTY+o+0USfxMX?=
 =?us-ascii?Q?Jvd4VuR86tgaMERLDbWg8VHwaUHV7YewZisfPPb5PnS/nabffOgExjnWP3m4?=
 =?us-ascii?Q?OMetdgX5NHK28EI1v2/2Ruy0VsabKKcTKu6XX0meh3bPqcgYSoVtYpa2PIG6?=
 =?us-ascii?Q?9Gb3Y+6YIp/3v4DRBli1ORci/EDSh4QQnskWuDtrhmHjP1fR1exdg5rGQHsC?=
 =?us-ascii?Q?ZjOL6Xlno+aizHNO1P/rduEGF7EDOLDrWlvXFo80euaYI8wMMRhat42ubEv3?=
 =?us-ascii?Q?WLOLF8AutAYOMca8M01zuX/YA3LMD9Ac1V7n0hIXpYkBhab4ZBatDqT1RGdG?=
 =?us-ascii?Q?juQY2WcG9EXkoYMIUu3022o0/x2wnkz1r7HixG9HJZq1qtf8EbuDIWxnRIDG?=
 =?us-ascii?Q?wgr/q6ynuJtH9hv27hcAQueZNhiYOaAuFyR/DgBzgct5tiCRC7pUmlSMfrSl?=
 =?us-ascii?Q?/e763YSzSvhHsEi9T/JUZthj+mmqeNRP7yRy5vGgBe0y6rFPztpPH2pGO65b?=
 =?us-ascii?Q?ZUrgAEaEpPGnZLRZRO/cQJuYCi/fQFGEP2N3JvwPvhxKjdVvgaQjUy3SxItB?=
 =?us-ascii?Q?+388XzoKV1r253CsYColAdYMAAMrMBtMNGiw7yToxA6UYNjSbV1akF1Midtu?=
 =?us-ascii?Q?0mn2Niu9ZtNAsrTL2UB/SEyU86IuIwikBv4W+VGluhQNnBXIio6KV2USnDnc?=
 =?us-ascii?Q?XIJ9AvgN5w6Hx4/dtLvIvFZmKqsJXy8H8kUO2lqHR1GwqpSFEDLAwh57ekQl?=
 =?us-ascii?Q?aVz9k8UyDrPK4EGkr3XBzMxTOYnFkGtgr2/cLSr9cBlq19gokTo82/dPwwmi?=
 =?us-ascii?Q?msESaIjzM3nVFCgrfELpkdS0UKe3j5JnYcoOqYo/4LfgXxpqqksFhyx3vqWd?=
 =?us-ascii?Q?Ce2KkAgMsWTgzL+kAMmVzEEfK0FZNdWtaCPkI+v9EAZeBsu1fxrGXSKQ+hU6?=
 =?us-ascii?Q?pSEyoiISkG0Zzy6J8JRXE9uxK2hPdYL14xW/Q+IHYuoPmbMSLAf+jN/DAeVY?=
 =?us-ascii?Q?Y0eOs9ikHot2LFmtLhuivNIrtWc3R8nIRkt64y22Zg2abfq3RF4W5li1sszg?=
 =?us-ascii?Q?XWG1EY0bFHTqLcU13895WNIEmtGV0m+wnUXVyGEnNfuAdAB+eHdijIMzbjc9?=
 =?us-ascii?Q?ZIHyKWodUY6S1BEue713kh/pnendBCHccOZyvczT2PEWIYfRDSZ+XLupKvKQ?=
 =?us-ascii?Q?Ra3Wgl95Si3TlY4o0aV0QN5AkXlpE39sd2cpgLyzuzVxcptembwLYUGuflYF?=
 =?us-ascii?Q?qYOTJJHR/M+3LsQMNW79TYkpjsxlQcbSQjiHbK6ATBJJ+02zo8K1P92IC3Nv?=
 =?us-ascii?Q?h4kFGEzhe4IRzr1rtr0gzHop9WZF812DkdYyC0i9X61iHmQdc65RqYVUxDDT?=
 =?us-ascii?Q?KLXfmScTC0vnpaRUc2AWdLvALYbnvmM4LQr5h23Ln0vOsWPxnhoqnpyzDS4c?=
 =?us-ascii?Q?Qkr/eXDsZpGTwutZ1v0CZkk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 835b08cc-910c-4c33-3a29-08d9a207d806
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 16:01:22.7451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LpsEZbBA8zVFWyOEYBNFbBhG5Xfb89/SXsgSsjVcZIddKCIyxX2fU0n9C0CZyDcaDsC9qkk7Bhhey/ENdYv3jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 16:01:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157955

The wayland-scanner host tool required to build weston is moved to the
wayland-tools package, so update the SDK host tools list accordingly.

Also, the weston build requires wayland-scanner.pc to find wayland-scanner,
so add wayland-tools-dev.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 39e5002bb7..16752026d0 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -25,7 +25,7 @@ RDEPENDS:${PN} = "\
     nativesdk-makedevs \
     nativesdk-cmake \
     nativesdk-meson \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-tools nativesdk-wayland-tools-dev', '', d)} \
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
     nativesdk-flex \
-- 
2.17.1


