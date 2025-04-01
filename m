Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96AAC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:32:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.89])
 by mx.groups.io with SMTP id smtpd.web10.16516.1743507111046690231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=h98OhUlQ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.89, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIDdc0UVU7PFBPgiWo5pgxdt3XA7tzjkHWPeUTnhKaFmF1Hot3r13WTpaSEJ+wv7MWrnrU084GamnkM8Xvhh1XH/CulfTpvJ79gthO5K6idL48Tb56ZWyJnE+JKlCTnHEbMDGHjrfeymNyM6lOKvD47Y4DSX7cvzbhOE2JhLBUbaZIE/mXwmnPC/+HVGsmMSmi96TovsXvVhtt/7PGnQWon4TRFnmjkCndeP22DJaGCO4h1ZtuS+qR5aOS6MmvJkRf2FK6i4aE1GxbpVhvra5WwFmJfDSNMRboGWtZOc4MNncy5sr+N8FT3qzdhw2/mW7zjhCz+uU0LSglAn5ytVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSfWam6klg55iMxT+O+BcgW+5YNb/KHTskmpUmG21rk=;
 b=H4Hn/I9ZN8m6i/4dMDYWvck+UV3R67iYGnLnkcU3mBGCOY0CGgQIXoG2ZQt6hJr49jTq3lURQPsAxdItZwvFgQGUpGDHSoRcMwfdhHgE5O+nhS7k5lY8IH/J3L5zVJy72Mb6LKwzka2PVJZv9vvCP4zauCK2bHjQVzV5O8hWFBlmSdjWm0mBoBPbgn20h3wyTFvjgQNtfvVmU7GRCC1fENUfp2GMK2l+IBh7ZNJFxW1aBXhaWKEKyVZ0pLvkJQq/Gr2tA4BZciaszYwCn3EYp7jVQGfkG3VoMlp2lRH9CGmPtmoFQC70sgKOrJ7tFP4imB2LDg8AMuWsvAg5KneJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSfWam6klg55iMxT+O+BcgW+5YNb/KHTskmpUmG21rk=;
 b=h98OhUlQbdfy9Mh+OmZRKZP4d8qgKhONvembtfM5dOWHwzXSz5wPB1wpy7EFNrWQF20nV55/3cyeYBCGqDVyfR40cTLc7dwWRS3pEWWucvsalHMqLyNvj5xX399m53R+u9Ra+Hz9do7C+JRE8OsxrQ9cT+zcdkMSF0TbxyUARJ12K6rAOq7HQjlkamfviJX/bHuDR9U3BS9fgFMdfQSr03B7g6CzQh+TD1GoqLiY5rPoxZR6KiOa/GizPd6mV5nfBUcQhF8Pn/VFDSWTuBgAqnJjxgzSgDTUYd/ookK+zlTWZjGmasvADsa6J0aedpUwsPfW4c9fPDpQ1v2BRfLGZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7147.eurprd06.prod.outlook.com (2603:10a6:102:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Tue, 1 Apr
 2025 11:31:49 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 11:31:49 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 6/6] recipes-connectivity: Drop dbus from RDEPENDS:${PN}
Date: Tue,  1 Apr 2025 11:31:29 +0000
Message-ID: <20250401113129.3531757-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401113129.3531757-1-niko.mauno@vaisala.com>
References: <20250401113129.3531757-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003852.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:1a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 703cd8a2-8401-4545-e589-08dd7110caec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GBGTAUwJpVCA+/2TkgJzr7bzZNJzetIBF29KkdOkaNWk5hUqsETf9HEXqaG2?=
 =?us-ascii?Q?Efb8nsjA5iHVm8WYkhvwm9ltshwBzyZtyWeSO0aRneqQCp10ZktPFA4na/q6?=
 =?us-ascii?Q?otUTN5xKXH2Ojcn9N2ZsVKJw7H58oqyKnDWnYysWC1GALptcI70oKRpHuf+o?=
 =?us-ascii?Q?P3N4rwj6WOvZoCe1Pnr2iUXdjsY7lH/SIdITMsdRBsuxOI68W5z88nZAaaCS?=
 =?us-ascii?Q?L4wgWSymSuzBUxAoS9w/0/6944cwuVTRlUQIQDK1fgZX3XQKdi3++OXk7XKv?=
 =?us-ascii?Q?BVvprmpNnfaiUUstSc8bgZk+ljcOEV0Axeqm5Q0WkXlSWHxF2p67xsEYv3at?=
 =?us-ascii?Q?pQAFJvAS0+Y2ZOqAFWPJMequZ30Qm47vR1LnPWnGASM6Auq54piDnXYlrLr8?=
 =?us-ascii?Q?jMjspD4sqOXgdXEJeKJTJ2d25WbT2gfidJJ5nWJhKjmMKUBFJlf425Fjn7J9?=
 =?us-ascii?Q?5oYSds1L1WDlxcXuT3O9vSSORCGBnTAyCscsd3Yr+gmBWuNroX291aRH6Ou3?=
 =?us-ascii?Q?CKkZp3V+N6+japbgDfuw0prsdxOX4qRrB9dso2ySFT3DJsV2QQ1h0qchsNwW?=
 =?us-ascii?Q?cX6pJd6SS1/INKQy9hcoOSDtaFeHxSppE6YDMQ+3Td6Xnm6D1eDj7LB15eFd?=
 =?us-ascii?Q?BSiPYem5kAoSDpigkP12Tw6G5u6Y/n6BNwIxYfs8L8dSjrQuOzxBcz2H8B0U?=
 =?us-ascii?Q?KHGWlRJByodO6rZniU69T0d2Pc4YvgOjoHuDWnEfP7FsMbzwrXZSOhlacQfj?=
 =?us-ascii?Q?S8Frl1R1EpAbAfcQ/BGd0IdidAJMH5vZ1KAWjA6YVyYtHyHEcI+4s3cVA9B/?=
 =?us-ascii?Q?Y9wDBUOJADtUVEFSpzL+3Cc+SKXIaurvyq8WQIo2Bnbg8A2Pw4ePvnY042X+?=
 =?us-ascii?Q?dpUv3s5q/IQk12OLTn9rNapZex2PC4X0LmwOEdjG+27HO5r4MGtAHCER0F36?=
 =?us-ascii?Q?4rDK30T8xij8skhcH4l3zS3jQptzmAKh2IeKaNOZd2xlEkMPuDz0bI/0hLSU?=
 =?us-ascii?Q?K+zQb55IQXz8hcODsyHoxou+WmO4tMsw+Qs9YVm8rUSTcJx4oqYDvhIAUT+5?=
 =?us-ascii?Q?scEupTx2B+K9CZIcNWAxDnkOelEMk3ccaqcLznML+0RYOLIGslCHAMmmd3/b?=
 =?us-ascii?Q?8Ml9fAnl39NSVxLfAhoIY6J0qUZlzQIyefhLR6bvh1M7g49XN5ziRJ9niltB?=
 =?us-ascii?Q?Ruen8pSGWtOYO+frtZ8fcgyUzhkP0UK8+LYxciiCEznGS3ojMZR2ZbII4WFr?=
 =?us-ascii?Q?+D1+yctFuX2bsEnR+x1vgdP4YjcigPnOK5YPfVUxlT5JYgwlDykpPS+V+S62?=
 =?us-ascii?Q?hO9RHnekKBuL1RP1jBFAlEbV4/hvnJiAZWrH9IkFiXSfcxeKEp5104KewxyO?=
 =?us-ascii?Q?DfQR0rL+4DaUKnu4Fq8qgmVPaA1MeMufotY1JY6RqyMSt4Xee3cJLLdBXQUH?=
 =?us-ascii?Q?/Nqb3B2yNdPtFOgMIEBGxPBMs/g+qTdH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N4z8mfqrl1B6xO0Ivp7JJUVNttEs3uvqO/ArshYhrSAqRBw/Ma6JgyiIKlfx?=
 =?us-ascii?Q?lRYMr9YOFG33/j9xV/5PjY0i56XpwkC4N0vOrtZpx6t3zUR2nkxOnHVWEg2X?=
 =?us-ascii?Q?d4ZBBeR9NRPrYnUqPSVPSM/rye7JYalupFhij/bXiNJbqPusRPvEFOBrh9Yb?=
 =?us-ascii?Q?AINsisE/VNB8yac9TjN3ZJIbhjc5zfpX4GMQYxxHv9fn4wyiD/FR44TLTpYx?=
 =?us-ascii?Q?4NFn7JgsTiSqYvOpf04fxXsK46iN60oNLyAanEXVZqLIk0krChJvvgdceaz/?=
 =?us-ascii?Q?jrBhkIgCcFuoH2mLXhr05LUlNpUBucJmQriJzhVHQHz36NSE3YXPcG0KsI8Y?=
 =?us-ascii?Q?idlrLem3S2XbZ4C96ppNAbfplnLGlZQ/uLN1HoFiLwr41PW9i/uuxhWc/Oyb?=
 =?us-ascii?Q?z7gglDhD3jSCQZv44vI8JLdrBWm+3KnLLQM7ipzH5A+GTql8tZch78QTiLkz?=
 =?us-ascii?Q?8E1oRPcjRzQ78YryA4ng3X05lX1gAw8smydrvaxLB9FC/cWsduaXnistXJwK?=
 =?us-ascii?Q?VxnvtzrROcjkp2Exk3ZBsP0P85+PkH4u+KKJRPSSj/OAS1zNJS8Lc0VAJmTi?=
 =?us-ascii?Q?0hSeHcK4cYuEY+SUV8CGs0kZgWXZdm0PazsKzbtJMdZzNXbV5unrXafRi5hT?=
 =?us-ascii?Q?IOjKRdbzjY1SAyysdJBePtm1dvmFORbA8fDePkMxEQQy6K/rJTblV1mCsQr8?=
 =?us-ascii?Q?BeQDc/J6JiVCeLESxbpxtKs36rzkKldklqezvuF7X8LjPtK1x7RZj6IZVSDu?=
 =?us-ascii?Q?DF4C0fD0uSAJZ/dQPNFbRhX9KGHhObFg+6BGa/fWW0ZIV1GMP/ISR63S9BMa?=
 =?us-ascii?Q?wMnb0/VAnVLl+bQRtHGgyV5HA4KLC9mro1GgAqCdr/3+FCECOKPLZLGKCHIk?=
 =?us-ascii?Q?5jAYQ+k9yEOEewcQLIbIr5IT50F2MJgLMXIYrtu6+cne9tmju8XdYdcIidPF?=
 =?us-ascii?Q?AbbushMMveZQ059JG/vNBoaCJcMI7rq8WMvU297lC0DJJ8/ntSx2yVsV7jq7?=
 =?us-ascii?Q?xx0vexcL2H9D7q9YjkVUCmT4EslrLs1bCJ6J0lp3QLld8b073wh36SkrExj3?=
 =?us-ascii?Q?eyKXaC07VvjtK4fhq0ZpsX1RYGeJTHPrv2lahdqHTTuXpfHpfli+SvJ95lBA?=
 =?us-ascii?Q?VUW8ZI4j03Z6f/NYx440StQEbluiWjEe9UQeK2wL1bEdOnjFmkAgjuwVguMV?=
 =?us-ascii?Q?gwjs9UetPrleb6pmRxpl1jHo0o+MBbnca+IoXprCDj+kjIeTAyl02HSykqKt?=
 =?us-ascii?Q?y+VAjbhNpoW5kGMpf6NhSK5OUH0gExd97h/ql0K44rHLASoEKV1jHKsjdC8T?=
 =?us-ascii?Q?036FVULeJetXZHdCRwDhW9xKX1+iWK9K9c9sKvQZJDoxMH6i38m8Uewf+HwE?=
 =?us-ascii?Q?uRFtLLLsD9tgt36epDZmAj9+s3zAtcCIkWkMcZbI+KfrWH42nL6HkPSLsMKA?=
 =?us-ascii?Q?ZxnW2grr96Xq0EOzx1DwnejvutB1giHQDkEvJq5ZzBji4d4BzKv02zaBI7JF?=
 =?us-ascii?Q?ny3CqAkad4v9tNWFbgcjdc/ob5tVDO5ltEWd9YUOv6GyITmgaYRFPA5lJeix?=
 =?us-ascii?Q?6fFko6koQpBL0d+/3KXCRWaMUp/+7sLGuqZJT+xjUQFQOevwAgZ+5OD6tFlf?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703cd8a2-8401-4545-e589-08dd7110caec
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:31:49.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTjKTZP7CxR/mSDZ/3fO8qH0JriPJEDezDBr7AExF0xm9QYJHvTYzGN6Y3OX06r8vVuRMdlHugtuCbjbWzAHHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214021

Since each of these recipes already have 'dbus' in their DEPENDS,
explicit runtime dependency declaration to dbus is not stricly
necessary, because dbus-lib has runtime recommendation for
${VIRTUAL-RUNTIME_dbus} which in turn induces pulling also the
preferred runtime D-Bus package to rootfs.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   | 1 -
 meta/recipes-connectivity/connman/connman.inc | 4 ----
 meta/recipes-connectivity/neard/neard_0.19.bb | 2 --
 meta/recipes-connectivity/ofono/ofono_2.15.bb | 1 -
 4 files changed, 8 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index d626872103..c1f52c5f1b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c=
09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0=
e09 \
                     file://src/main.c;beginline=3D1;endline=3D24;md5=3D0ad=
83ca0dc37ab08af448777c581e7ac"
 DEPENDS =3D "dbus glib-2.0"
-RDEPENDS:${PN} +=3D "dbus"
 PROVIDES +=3D "bluez-hcidump"
 RPROVIDES:${PN} +=3D "bluez-hcidump"
=20
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-c=
onnectivity/connman/connman.inc
index 133e8616da..804c2db9a7 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -118,10 +118,6 @@ RPROVIDES:${PN} =3D "\
 	${@bb.utils.contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)=
} \
 	"
=20
-RDEPENDS:${PN} =3D "\
-	dbus \
-	"
-
 PACKAGES_DYNAMIC +=3D "^${PN}-plugin-.*"
=20
 def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_ski=
p):
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-c=
onnectivity/neard/neard_0.19.bb
index b04187bcc5..9e0ac6aa69 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -37,8 +37,6 @@ do_install:append() {
 	fi
 }
=20
-RDEPENDS:${PN} =3D "dbus"
-
 # Bluez & Wifi are not mandatory except for handover
 WIRELESS_DAEMON ??=3D "wpa-supplicant"
 RRECOMMENDS:${PN} =3D "\
diff --git a/meta/recipes-connectivity/ofono/ofono_2.15.bb b/meta/recipes-c=
onnectivity/ofono/ofono_2.15.bb
index 40eeb3a086..bb4133eeda 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.15.bb
@@ -37,7 +37,6 @@ PACKAGES =3D+ "${PN}-tests"
 FILES:${PN} +=3D "${systemd_unitdir}"
 FILES:${PN}-tests =3D "${libdir}/${BPN}/test"
=20
-RDEPENDS:${PN} +=3D "dbus"
 RDEPENDS:${PN}-tests =3D "\
     python3-core \
     python3-dbus \
--=20
2.39.5


