Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F6BC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 22:50:55 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web10.4146.1636411853947300562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 14:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=EDUhSOBJ;
 spf=pass (domain: nxp.com, ip: 40.107.14.42, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXAsZG/wSaSQ3+ORjd+4C3ehAG53hXOlaKLq7f2R7S0w76IOujQanKebQpjDx8Bo44mmXF/Ga1TkSGWci0X+h/JFrKsme2telF43PAJxYZmF2uqR94MZ10KGq4O9WceF05J3hxtb6eGKRfL29B4Pzihq/DpUxoRU9ly1VE3qxCmI0PAhl71xDzwXjTDdX8Ltb1ywyFNje875p6RAMMNyFOkNKmyMQzgxnuvH7ipHiXvitQ0ppeukFQAN3XZNhFXYGG+BjcUjD/WuPPJeHIKFZffuuSUtNFxYTxBJXrGu7QhahdyGXj86L7l28agbeH94mYtq6wsEOv0XPTDv0l6dTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v7V6Z8tcSeujlyXlbSh6WxiWEAyudN7fX65d/aABvs=;
 b=Id44mjWOZ9cjFgDHl0Dax+SJrI/FxxJxgb1lYfUYSXtjVb2E+AvVdwURTPx1/ZwruP/W8Un0t+8g3vmcxv0FNQZBsvv6tynJ82Tx32L4W0NQc4M4x/7C2JxBMz43F5xlVKL+j9R9CbGaMO9Xlphs1DdrTumKYyLi5TU0+jhBH7DNnZBEAX2d1pVs6WyBgf3EV/Wec9/ypH+ED2NZmruvkko8QrWvtXctjmCYJBxwA2IAzmx2bFSHGvwrA+DYRayUYi8KdKeYMuPP43Lry7Y0b30x1qD80SnpagxFY3PWOKA8WVC02SK7uI4jWwRQWNWSK11Oux4flQW+6StTPMsk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v7V6Z8tcSeujlyXlbSh6WxiWEAyudN7fX65d/aABvs=;
 b=EDUhSOBJu5mGlr2VrvvyQ/Xu6dN/sWmi0jX/+ANB1BKlmvXufJJR13stG9ly5Ink88GuB89emsQ6W0oInQSYzK/5ylDWDXxpq2WA0zEI6q+oc5n5WBXNyUPbA052zMWfKvXCoDR+pQwnbUZwhHTqSRaJFX6GD0eXDdL/ewpFz8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB6PR0401MB2661.eurprd04.prod.outlook.com (2603:10a6:4:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 22:50:51 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 22:50:51 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [honister][PATCH 1/3] wayland: Fix wayland-tools packaging
Date: Mon,  8 Nov 2021 16:50:09 -0600
Message-ID: <20211108225011.24741-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 22:50:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02f2679a-2ff6-4b51-341f-08d9a30a3661
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2661:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0401MB26610465A744EA09195488D5E2919@DB6PR0401MB2661.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LRXBgG9tLGC2RyiqIaheedVx0k3J4try6+zp8YLHPAWGLBNC/9E0wn0W7iSVbBZN3mn+5pd49jyhO+YDjLX8d2JzDzrl+55mfsK4umpKhTIzv9OAQZOsCUErapMiLTgJ1COiSL08MTdr7FqNmkQzvKYRi/LQU3GPeto40Ul9e65ztOYDZd4c1/mxbuRMOhmHHjrNQw8VX1nUIF+7PByhrK0JGo5jQlK05TMR9NCd3k9Y9TH9CvN25JYSTIMK7sJhW/hwBVh33hlbPrsCFfvFiPwwqFlonpGIdVcVYkSilHH5mxutT2l5LK2kBIulSnO71zKjXL+7PhhoGzEcHxiQoc4Oulk7g1IXszxivYZEhEAqX2TPAw5JS1GSK8psO6vxsNKuDOYpZnIZBdK99cSVL7XsIXuathVM/CmWCBBHf5RLBzmNdTXC0JBc+JlON7rRvQL40zMtifKhQLXLmfVHA8ZklSslbqQmcGhM747t9bzx9xiM8HEeyTMaEeq/svdQtl1eQRkq59dRp0ClXFW+9m3PSSDiW0582JhB05xBDGJjnETO/J7yrAWGzRS6ulXtidZlyaxNd9KTBRFm/4XW2jvsfZsGOJY26U4siepx5iu7xcDtQxiQ17Bekne0Qj6wHS3ev5hefKtzhAFUALDi/UFpWnAoXT8e+UMFPlQvdUbVYICxZYMjn1CN5hlNOJGozHsgKJFb7aeJp4z276iqTw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66556008)(5660300002)(66476007)(316002)(86362001)(38100700002)(8676002)(54906003)(1076003)(36756003)(4326008)(38350700002)(6666004)(66946007)(7696005)(52116002)(6916009)(26005)(508600001)(6486002)(83380400001)(44832011)(2616005)(956004)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WIuwj1Z7Mvc4yD4nqByfCkz7QQp9Zmb7yKRNOe0QYEh6RPpMuCwDWzQGDbhp?=
 =?us-ascii?Q?Ds+TwpP266kePZb0biaqCGKz7RPmQfBIItQztauSmeFzh/G7oZN1ARVEcTAV?=
 =?us-ascii?Q?taKQrivurKwnwvtrU4tCZv1i3PlVt19XriTWSeSU61URpHRJ815HMeioW5Z6?=
 =?us-ascii?Q?CjKcdT7IJakry4ZPs/s4fdzY+EAD3e5h//NuztCx7lCbr2AndnsTcxmvyPIp?=
 =?us-ascii?Q?dTlXuHAg9zvlEyZvubp6xeEIP2tm8vFvlKhCcRqpQG/agoewr8hfAQS2Wa8o?=
 =?us-ascii?Q?nzT+UCwStraAI0xysnIZUUU0HUH9zdJ/u32bEX19td/KIdoyHJq2+7Nzt4g4?=
 =?us-ascii?Q?RPZZmV4VDxbdJvzMQ9oShVyfrShipirbtkJzsgZE9k2o5HuUWdRD8aZrnsJ0?=
 =?us-ascii?Q?tdEIG5S6DepdNyA+752qil+r+aHi4ckSqNciRUz6hHgmmPLzV8VGDUer42Wm?=
 =?us-ascii?Q?Cs6wVeFqioc1KrEy2iS0oNGDw2UZMl1TmieV2sPe+7WRLeOw8mOKP6aFJINS?=
 =?us-ascii?Q?5RCK6OSMSe1HRJHNCoXQxnqftFo6pS0T+pNaJG8KFyrTjactY+ZE3WhSaH7t?=
 =?us-ascii?Q?tFKYX5tIwW7fcSm5NPKNdNb3VaaVl/tQ5AGlfbcFno3He91iyq/Amz1q21gk?=
 =?us-ascii?Q?Xh0WkqARnaYwY15JgzrArgMitWi9gBcnmH7AoXa33XVY7iLTMCavBDcJDSNu?=
 =?us-ascii?Q?vQpxjV+fa0GGiFpvV9+f3veBctb46LbkLDueIE8GyhgzahO1/ImJBg/70uNV?=
 =?us-ascii?Q?CxD8fsn8vc4TqDn83VWEBNvbmTgd+KPVnpZ4WMtIPsVgynx3czBs7B6swICk?=
 =?us-ascii?Q?g/lrEY322SRMYzPCIwYQAuCEFfgVbe3F6t3FYTefUcWEuvk68KnRnWSDNsck?=
 =?us-ascii?Q?dGBeYDZ5Izinf5qkSLj33q1YGoXkmBQ8e76JDmLSf3APqEJEDR9gnaseHzSv?=
 =?us-ascii?Q?Ml0VDBpKZGQAvQkAdDaNQ0TUGo9jMVS2v8UG7/PVcy40kR3P1NZW6JuVqUw/?=
 =?us-ascii?Q?6q9zRNUyZh/BDfy7ZioGVdFoL230REFab2tHuSAOqM2hWRaHociqGmVRlyq3?=
 =?us-ascii?Q?NtskIYMi1+Ftk5NZmGUb3moGq+0e4eKhVLhznzBTcsKElMFyBixf1b7rkHtr?=
 =?us-ascii?Q?6lhhqklH7v3meEll3UTZ6/doobrk85bprk1Ykh/MlYF9xcF+u9dYRWPoTTQT?=
 =?us-ascii?Q?Q0Wgt46gF/2iIOh3HS2TJ6bukBVNCPlwjiCgJnBXhjfrv3T451vOwfYGiavK?=
 =?us-ascii?Q?vYUZOvsKxeXTFWyblxxrmpLeXxA5DtZDL8D32r06pp+4FGEBW2tk5ebkgJT6?=
 =?us-ascii?Q?fO/xQ5rwjHUG1VW3zytRlHLiGFutrsib29QLJ3RtygmLsIH2bcBhd2T1UsYw?=
 =?us-ascii?Q?uAz5DWNkd6KojigyCK6csnwuSiBsskrnZdmX0JdBhk+Ctk7MQZl1NnkgkYOL?=
 =?us-ascii?Q?LA7H+OLQMsXAxoEnmDbs6JkBH/Uf5ETN03NdNcrYvo2fChanWzRxpMgrMSdE?=
 =?us-ascii?Q?P3zduJJ6q1GlbqZ7+WtYinumiY8K0ilrMGzWW1CzLFqnSj2+d0bT85OpasqB?=
 =?us-ascii?Q?keHNop+EEP5CyftDBrSkY13dkyOmJ5ctW5iotJk/U60ijxcujob/xJNQM0JO?=
 =?us-ascii?Q?v8ySifmA8t35vvFwiZot+FY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02f2679a-2ff6-4b51-341f-08d9a30a3661
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 22:50:50.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6fy9e7J530/rmBtx+0cObh2pQSlelvl7r1rw0tLJNwx2243uaZspuxt1vBvVby86k3M0xZQ0HgqSU1qDX+7HZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2661
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 22:50:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157991

There are some packaging problems due to the wayland-tools packaging
implementation. The wayland-tools package currently looks like this:

wayland-tools
=E2=94=94=E2=94=80=E2=94=80 usr
    =E2=94=9C=E2=94=80=E2=94=80 bin
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 wayland-scanner
    =E2=94=94=E2=94=80=E2=94=80 share
        =E2=94=94=E2=94=80=E2=94=80 wayland
            =E2=94=9C=E2=94=80=E2=94=80 wayland.dtd
            =E2=94=9C=E2=94=80=E2=94=80 wayland-scanner.mk
            =E2=94=94=E2=94=80=E2=94=80 wayland.xml

The files wayland.dtd and wayland.xml belong in the main package,
while wayland-scanner.mk belongs in wayland-dev.

Fix the wayland.dtd and wayland.xml packaging by prepending the
wayland-tools package and dropping the main package FILES variable
override. The file wayland-scanner.mk is included in the main
package by default, and so must be explicitly added to wayland-dev.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a31fbec45d24df5b74091940d0e0b2daf34d8492)
---
 meta/recipes-graphics/wayland/wayland_1.19.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes=
-graphics/wayland/wayland_1.19.0.bb
index d6e468497d..5f8b972f76 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -52,10 +52,10 @@ sysroot_stage_all:append:class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR=
}/${datadir}/aclocal/
 }
=20
-PACKAGES +=3D "${PN}-tools"
+PACKAGES =3D+ "${PN}-tools"
=20
-FILES:${PN} =3D "${libdir}/*${SOLIBS}"
-FILES:${PN}-tools +=3D "${bindir} ${datadir}/wayland"
+FILES:${PN}-tools =3D "${bindir}/wayland-scanner"
+FILES:${PN}-dev +=3D "${datadir}/${BPN}/wayland-scanner.mk"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.17.1


