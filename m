Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D398CC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 21:02:50 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.72])
 by mx.groups.io with SMTP id smtpd.web09.2975.1665090158733395378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 14:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com
 header.s=selector1 header.b=z2hlLrY9;
 spf=pass (domain: seco.com, ip: 40.107.14.72,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJDLKePUg1KI+qTz/o2xmhga5w3l2IYCl9uRXbsdwlgXG5NdcXZa6lkNTx7H+FAKVJGXZ0iNEEy4qxxH2IsDcrQmOZU44CdCP0KoNypqMi+rLqSLnNi5QDUoj867ICQ/Xn/bjCFSK4E5oOEnkX5Igbz4DCm3zyX+R+smqDkEzz5dDSDO6yC16Ih19CWO4H2OZ70foEio83V5NAVoIKdsM1ugMQMNVPpp6erDUxUILmMVnDT9mEvWyt8BSlJ1USg/JTZt04tpF8i2HXxI+I2e0h72WmHHo686wQA9rhv1nHYGrSRkSxd1XCc6lSlNBKVlyE/SrPxNO6Jh6id+6ZECCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmpB5+0M98qGegfNR/ZTWrAbaRzzvlkSLgvEYfte2QU=;
 b=CRGlV5M8X4lt3+3cepJ/Uv0V4khoHfOVKQcbdSgi1wXaVJypuFouarTcyfcr78tRvKdy6iqkPBZ7xU/IISrSe9DzenJYHrDn0PbdCZAuK9xhAaPoFTGc/IUn8W/zpS4IHYsBHHMLCj1ZXz+W9gBSMqvMNUgvwJW2UOHhOSncfKVdAY7i+cYLp3RFbJ7Xq0e+pHpfxzP1Yv/yqZI9DEABTSmRI5D/SLh1cRPrOiGQbT3Bhg9ocFufoTC885lRM83NBNEsXQOdrKDNbqgymOSztr8729RKs2vRkE9GAksXhLVZI4U//iQ6ynbekmdzxdFqZjcJ5xXk/VVypHRkguOQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmpB5+0M98qGegfNR/ZTWrAbaRzzvlkSLgvEYfte2QU=;
 b=z2hlLrY9yZ0SMA9lCCIhfCWIhDii1Myej7t3A8qZwMrdhgaMOr5R9hm/shRKyQVYAvelQqiTS1o9RapappKr8BopbHgOKXVSRWoDEhgO/ARmEoGSCBN6/HM1+/jnBqVs5eQT4Zz1zXx/g3OzWH2UCGrlISgmF/F/brmXWrC1QBMbCrF1Pm8U60+ysNbRMttw+eZ0HC1ptiX8sv/8Iw63cpUyGvupb/PtEGVigx0JLigE6IzG0/4q8ZDizGKf8WMgELjlaeiHg6jgj+AR0P4XLWoV+oLyKtd6Pl3cCGXm5pk8OUgFq2+r1g8mK31F4oaMi3YciZZCN8kgLcHgIVVplw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB8268.eurprd03.prod.outlook.com (2603:10a6:10:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 21:02:34 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 21:02:33 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: openembedded-core@lists.openembedded.org
CC: Pavel Zhukov <pavel.zhukov@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] dbus: Fix incorrect path for container sockets
Date: Thu,  6 Oct 2022 17:02:09 -0400
Message-ID: <20221006210210.1744501-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0029.namprd14.prod.outlook.com
 (2603:10b6:208:23e::34) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b253c8-4d1f-44ba-845d-08daa7de16f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WhKJndU/k7SMjCKUBnEOeRT7ksCDnVMPrk5+4XO2WI7hTIVSylOKJ2xlre3w/PO6SpCaa9xj3KCC/cQeFvvsJLPRsmTYTtxd/ZrwsbTFA1DTy9G+ZSYaYI+li+71XZ7eZNiC9qowtGOSwI0zWirDj/yW6UyLLqLlV68s8/1uEn1cgl6oqLX+RcmJOLEEV8V4KDZOS+5Pp1tfPXRyuGr0w+pQzf2Oky6cbDCLMQDIu+C3eRivFY0ij+PfVLd7rs/52SsQV9lIPszKC9o3+f3ApEcntpJuE7AjEwk1f0PotocvKuWSdAiZ6aDUv0FPN2KfhobehbLVLUj37Or0uOJm7lP2pvidhrhTUaJUCeHuGdycd6ZWVTSWpu976X0OiSsyiL3OVXj6QA3PocZAFyUzOnUDfAvxIsDmGMquKy/bYJWiunt8QeNa544N0qpRcrcKikR2TvKlXjdzXXqvzjBomiJcvMN+/KD9xXnCMoRP03P8XyMriCoAP0DCxBkeKDDvN+m7aVUrhmYSkUFqAR01hpZ9sxEg9D7yItLy7qJIfhueyZb4SrsbtiGwNeAXE1mc9JRSrbhd6Eg8vkgwGqPdMAh+Ap++3XmZkQaWo5NK9J0KjgBU/Uf0uygohQKZ12znUy0jMU+IflJysuNo6KFZCvbWjA3bHs7cuJEcZkW3CiUphMugE9+OnR5IKYofSTXGI5K0kVnzUx46AcRXgbCYzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(366004)(39850400004)(451199015)(66476007)(8676002)(66556008)(66946007)(38350700002)(44832011)(4326008)(54906003)(6916009)(6486002)(36756003)(5660300002)(966005)(41300700001)(316002)(478600001)(1076003)(6506007)(38100700002)(26005)(186003)(107886003)(8936002)(6512007)(6666004)(83380400001)(2616005)(86362001)(52116002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4rR0Ye62y68wCBSwrP3Rqep4/LenD1vtpEe0iFHBHilnYDmD27681UjLdm++?=
 =?us-ascii?Q?OnXCziJxew6QMIvZHfRkeExsYVO7Qpe0yq735L9qIqdy9xBUAe+HZgD38bkz?=
 =?us-ascii?Q?6QfZzbUfyrN6vd1tSw3hCMgGq6CPxsqen8p/nwC/PPq/GR7A4ehn6D2qCpff?=
 =?us-ascii?Q?gywI6sxRGZvo4fowvQr3YMKRTTdk2eSP23fUFM+dZ37oJpnGJm0vB6tzjptY?=
 =?us-ascii?Q?Zb6d2JmcFlhxi1B1+QvUPuVfUBjt05Bk8eTKr/tQYdmbtgqTlKPnGBAXJzY8?=
 =?us-ascii?Q?sIDm9FEyshAwy0Eftwf02ZRKPUW1Rwgye3npYrugo2JUsNuRJmlQwmFS3CgD?=
 =?us-ascii?Q?V6/LcugEcIjZhQaRe8jdGkt7ae8rM4seFNBD1J9S4eJ4BtXsbqtgcsvOJHlJ?=
 =?us-ascii?Q?qt8loRMR4HP5Jlheg5UhBmoJrbDoSkwOdQbkq0j6FXrECVXiN17r9XoA0ZAT?=
 =?us-ascii?Q?PukJwDyl3Gfye5mjF0ZVwvdgzSYUD206aMSoxsO30yRldsXPtVMes3ewhB9K?=
 =?us-ascii?Q?n9vqmiXwBH/wOut9lK9hECtU1bsQf7U6gK7GtBhSYVUbt0RLINluNY417c8/?=
 =?us-ascii?Q?7AOkGFxna13kLifaD2FhupOf9rk83DZpSwdzYr0jGcwZUrV/TrK6cPfxQ22U?=
 =?us-ascii?Q?VJ5TS6N1MIkhwhSuf1U4PrFlNzrbsCMbEPpla2h7ULA2IrJBZxfrznYbgXf6?=
 =?us-ascii?Q?HnMy+/lNUWgUGEpttWBpVVgdgPlcldJClk1qCfeFirg+d+y7RLgwK4w68Fu7?=
 =?us-ascii?Q?SCQPn5WqfEwJCQw0BSlvE1Splm22YRT2SNtDirSLSv59S/sqNSjcttyOJFUF?=
 =?us-ascii?Q?t484Wt9HOYKUf054pqoYnlumB0KqR7Ggwv5nKyKaT9fFq5P4nILpdjLJxld0?=
 =?us-ascii?Q?3A4uAkXhHZpFVX6PGwrvSDYY8zrGLiqlJ4IpvtZ1WJCScqCxmLMq5cprznBa?=
 =?us-ascii?Q?3IXPAAB+/ifHrnYI9n4mQsXwif73a63i2zRRlMe0zoNuucF0TJZI0lzRZdcv?=
 =?us-ascii?Q?TEyMQDH2cuC2tqp4JoQ0841NvU2XyTVRSkVtGz/1gVVxbsKDY8YeHFJ4YTmA?=
 =?us-ascii?Q?ag/uPzAgOci1P6l2MYMmI7haXuJp0jyvczjpTOPQOkW+bPiWx6u0IZcPyJlZ?=
 =?us-ascii?Q?RUGtSr89M+1T5B42xzLIfoSFsgHsm3BTbsGZs7j8AyPnDdr1lsNtd2wwAFNj?=
 =?us-ascii?Q?cVSlhX3Eiiue30Zkd6j/8Oev6pHLx17oXz0jPkmFpOSjTusfXE/Df7aaa6DE?=
 =?us-ascii?Q?gosmzjJN+9FqFnriU7KsrTAVYlA3orq0C846961D0b+7BQyUmkJgC2zACn4H?=
 =?us-ascii?Q?6P8YIF/+jNsfbtgpi6nMGlfTa2ZzhK0JQv+rXPBy8AQ7XsKYvzB2uz4Y9u1N?=
 =?us-ascii?Q?owQKHxVoLKf2waHKaF/ZkdRq/C/uOyxQR7vLTZJz15OJCCCbbsH6RQTHW1h3?=
 =?us-ascii?Q?J2JSRjjzklqnq7+UTY4VHhCLgyVXfqqTBFtdLh0fWJeXsfC+4GtZrAfb1Yqm?=
 =?us-ascii?Q?oJGM1pvH/r4KO9A0OXVBiyViLCXn1xOJc6D8kEpLfbjjKmbz9gG4AD0z8wn/?=
 =?us-ascii?Q?Dz3Tw9Rt7+scGa1ivcbc0mwIXa5P4epLr5fZGM22qxg/WohP0mf2zVKMGHDW?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a7b253c8-4d1f-44ba-845d-08daa7de16f5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 21:02:33.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rstKZX1WbTM0gBzyRg7F+6ktKJowuAXoReiRZSyC2znomdnqnY1c+1Ve5mUc6ALAavitFvGwckCbSlK64LuWCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8268
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 21:02:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171513

I noticed the following warning from systemd-tmpfiles while booting:

    /usr/lib/tmpfiles.d/dbus.conf:13: Line references path below legacy dir=
ectory /var/run/, updating /var/run/dbus/containers

The offending line [1] is

    d @EXPANDED_RUNSTATEDIR@/dbus/containers 0755 @DBUS_USER@ - - -

We do not set runstatedir, so it defaults to /var/run. Set runstatedir
to /run to avoid this problem.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/master/bus/tmpfiles.d/d=
bus.conf.in#L13

Fixes: 4df1a16e5c ("dbus: Specify runstatedir configure option")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/recipes-core/dbus/dbus_1.14.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus=
/dbus_1.14.0.bb
index 0046b9fda2..9fb1f777bd 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -21,6 +21,7 @@ EXTRA_OECONF =3D "--disable-xml-docs \
                 --disable-doxygen-docs \
                 --enable-largefile \
                 --with-system-socket=3D/run/dbus/system_bus_socket \
+                --runstatedir=3D/run \
                 --enable-tests \
                 --enable-checks \
                 --enable-asserts \
--=20
2.35.1.1320.gc452695387.dirty


