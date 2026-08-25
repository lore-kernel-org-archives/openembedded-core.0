Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4517C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 08:50:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17240.1787647842986041621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=E18QEiO+;
 spf=pass (domain: est.tech, ip: 52.101.72.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTXNm9RwbByEeZ0L1d/l2QHTSIuGNfJ63ML86SjeduDoBWZ63c9uarob/RFCPNlfD2wl/7aieY8fGrc9QAcdFIFn14ChKq/9gaPuRj14/dHBVcPi5CVSClYrVthW7tqpncta2lTq4bb3i0SVidzMlUi30OLdVIHqdWhlt0Tx3Z786m356Xfz+4o1u43kffLM27CxakTPgTeagisY/cSjVvZFj84QVFCKaU2YNWpc7kO3JHAWbBjcey3fdDhzkW/12dKnhw7H05LyWDb1sY8f1W2P0o3dop3hFhrpXVDkZPz0Ojhyl1XP5krtUfl+VkBXWbXBreouA+HrOwxT1DHprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8RXGRGTwy6LD/VsY+WKzVmU3YNAgM41F3J/idqwbHY=;
 b=IG5LxJVzHJRUmB4Pqipz96vPqEOyf3LJI97goEkxQKecPv3OD7ztn34FeoM3ki821FE6i5SADINrv3ol7Eib761lQcjtrUnLg/PfSAroe2iLxk0ytPi8VxZxdxrvkWIIXAcNbrgWZ2LlsdL2CvHA7USZxw9ZzlzrBJs7JPElRc6WXkbH/w4Fb7ZHvL0Md3SsJdhsK1KU7iGtFRYCIIFnbe2i20BDo97XdwtzIew3KSXD6/VRP5XYgS7fpp4QxNlLB3sFOKxdKMHCtisVga8EbyS1DCCVJM4teLQ5dBQRwZ2DRFk/o80Ih3d6d6pB04Py/WOC0nvruB33wzH3Dhyf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8RXGRGTwy6LD/VsY+WKzVmU3YNAgM41F3J/idqwbHY=;
 b=E18QEiO+/UqsWn0ppZYfkvlqIxACTQ8vxNNkemcZbuCk9tkg8E7K627qp6sj3QtC8cTC44UpZG1Ha0etcAsSEVxMX8qFHdrcH8nUeNW+LyP9RIlUHwofJIChb3NfUNz13KluXFt8vx/sayx6MkaXqcF3W+N8bd78Abq+dREbGSvMDhBoEK4bDpKrVO7vWj80kYoLvC5hlByakGBgMqFvkzDH7oSvGCrfpg2uvTx8fB9/Zux2PWXZHic/wwn52K1XJzrJSS9O7ZS6KND4a6zjGki2ppqiYfVlebHh/d8GDDubZvdw6132+03Yp/9G/EwKGuf0yNydhM433aoOpEMleA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0934.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 08:50:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 08:50:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] netbase: upgrade 6.5 -> 6.6
Date: Tue, 25 Aug 2026 10:50:36 +0200
Message-ID: <20260825085036.25882-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0323.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::22) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0934:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d31c65d-bb79-4531-289d-08df0285ef23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	h5rYqI8lla3emySbAlMGGKddy5r1ak6FLkkUkiUpcnpjyv3FbBPRYlzN1wvaeH0+Sjd5XbQLVdsVibILU7jCKmOK/0fT4IE8HYvnLWCzoxZsqjB8pDCmv+/hsECgR21M9XoOJ6BmhgrX6Bf+Bj4hv6dML16V/q5vx6+qsCcTpx6ew9Frq1WQ/Vlum/+f9DmjC7ABbNVTLMmpEpVw5BBFEyAd/boAuDWDDr+dPJcuD3j+AjH/LTGY43AOuHpx+dyWu6S+omflKhBu8BW8EyeJJBXdq+DkV/KGIbkWpeVwICOClYKOk19nKZ9h26OFR/LKRdxmq0Z76HVUOKBW3DWxGbkoQz/JUVwY1f7L+U5kQ6NCFxryjN6v0eFOx5PT7yyN8C9RGPYNesKhtIDVPcOzxpbuMoTCMMT3tu6k+jzqeflGHUjvyL0LBpkCnhy5Kz7Kj1IoXWFRSX2v9awYVbvjohu1wMLYvRsKMv/y7/PmwsOMnlDoxTP61ptcw6sO+mZ2WQNmHeJEuxSGIB3ofkO3QVRVSxLzon0d3aS55F/GMNsdXNH2Zj5AjJAWbrX9b8v4alGpYg8hBZceta+NauNenU9EoXAKNEUps8JCoRm32Pj+ooETQyzdX+Yu61Taj5SiXRt2len/oCX32Gm2pizy4wat1nMyAatI2eiRcc1Guzg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VdJOT3AMTW5EgdtlQHHjoeDN0j0klbQzSHntFLe47J8BQ4CMeUzIGcXcMF7i?=
 =?us-ascii?Q?ZixA4TmiPFGdfdZ9wXpINuQc7/FS/Ey8ciCwlA14+XbGiT9V8UQ4w05PyqZt?=
 =?us-ascii?Q?V1aCLtVm/vrjeYJyV+bRQf82+ix4SU6kPC+0JlldKcblTfuSc4jwKsfYH0tF?=
 =?us-ascii?Q?7TJYT+tW+MGW5u1XGzLcuxD+ojKwQWIwzr1dFxPlv+Vpwh7ZJjsFAhbG9uDE?=
 =?us-ascii?Q?kb97bwaEmiu09OYMRUtI+lXvUsGsjxl5wds42fRxpYuRRjVIQ8znMcw17UBl?=
 =?us-ascii?Q?vxYf00c+HBQ8U2s8Sl8xh5qwYTcl70Mc+XETUuseJJmYxSCmMyAZ93kLzUC2?=
 =?us-ascii?Q?DjXOpwrorqO717OM/nBIXF47qojn6EmIWcCUqVUFE2pNyzUbP50oM30JHsYn?=
 =?us-ascii?Q?qeF3Wc8w4I884eVTFXYnxMQqfLXeo/lBixDPHD/dtvSaREp6YQPJ92B6Nroc?=
 =?us-ascii?Q?NDboSapOgYgud0VCtc19lI/dwJYnC5rbvLggvTpMoWFU70iU5gd+0XJPXKLY?=
 =?us-ascii?Q?abefoItyDI1TT6B1YGvGN63YLUO+ewRee7Kw0mQqFX3SUPhYiMCZrL8PL84c?=
 =?us-ascii?Q?mPnjPefbjRZXxf9HsWmDFrXvEQh62ymlkE3HUeXvUnI7ke6YjvgfiVAP/vST?=
 =?us-ascii?Q?avsck/+yZXwoZjnCLCOW5L2p44RxNte/IJncRcmYgbC23C1T1UHiFUzTgGC+?=
 =?us-ascii?Q?YKiHsba6KE87n7zaauDtOhMiHz3KTIyECL3a+eH0E37IaPsmuPBInD2tZjjb?=
 =?us-ascii?Q?oGvKC/m5jLZcTbsYqJyOArBKHzgQUjfnQvnmwjaVAUUrXV0DdCEv4UKBf39H?=
 =?us-ascii?Q?VX4O88WU+c9na93ys+UNCoVeKTfJcu66SzTz04eAA1Ogy0J2dBM5bE9ALd+1?=
 =?us-ascii?Q?Kv17bOwrTvtIqa1ux0TO6M7UguapxNpIEt7dMadNN5vaLjBuddKCa/S/cI2e?=
 =?us-ascii?Q?ow2Ef5z3tR8BMpGpIdG4QDBzPX3BPCWX+XJ7LwgKourS92Y7tlc1PkVa0GeU?=
 =?us-ascii?Q?AsQMarWEZAV4vgBBXxGRWEXZIqfv6UYaA2dA/KG36vyhftWjuy1xCauq0Nfe?=
 =?us-ascii?Q?MbbIs8hE4b5mXyuwEXlCxD/+1NNUH/Bh7SKl/aFUfbBvPJ6X594lqil5XPKr?=
 =?us-ascii?Q?CiN8adPKFzx4UJXcbiwWath23PpI0jXiWz0rDv/BxB0vixlac5REuDAUngtA?=
 =?us-ascii?Q?frVI1lQPrI8ELgW6hPxSYjUf3SNmZVDz6azmoL6TkZzpdamjmQAS6PNp7on7?=
 =?us-ascii?Q?L6KRKxH9U4mV1auG2gSBbdjKK137vSUfqW8t/HtD/VlHsjBHPRV3eg9MTCo0?=
 =?us-ascii?Q?7B39LkJDWY17Kh8Qr1jdHokd+fr4F9E8GMCNwcEsDr5H7SD1TitElW+s+dnT?=
 =?us-ascii?Q?hboOjN/LMEml5IkyPE58nJFM+ejdctsY29W7DPMN3N1OINlBAYo++09EDLw1?=
 =?us-ascii?Q?eIc5gr0CWc1YublhF4/MRRtxCK0mujBEQnzSsEeQBcC2m4AZ3Wi4/Yz+lgWv?=
 =?us-ascii?Q?yYUA30nRSVlyrnfYtgbouQWfW3Ob2eawXB0hON5IKhVAP5ssaxWmdOXGnkDi?=
 =?us-ascii?Q?7Wjsd+tT9QBKEApY345uDVgXxCuXNaHXaHFIPIgViCjhpf6ThA1IxBhAbAmE?=
 =?us-ascii?Q?xRjxzN/ZYKpR2/d6xOemULPBuRSes8Hr7m85UhEi0/ulpWlDV4MpQKIhNTG8?=
 =?us-ascii?Q?AOH20XGSkUW5q9RhU6tfPGrNnsX+g0PrK4uAvlMZ996pXows6oq0/R+5O+4g?=
 =?us-ascii?Q?jj9/W/0FXmCNt6OonBg/3V8PnCVzWCg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d31c65d-bb79-4531-289d-08df0285ef23
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 08:50:37.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRzqCkMx5RTHoUQfPvnzvy1vV5xH8aay5NjUW/MvGYKpI/MRqjS7K9vrHaKT1zoqHXR5pZFZ/cTPkwVnTFoyTzf9PYkFUUt4xuAGerDbCD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0934
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244212

Source: debian/changelog [1]

netbase (6.6) unstable; urgency=3Dmedium

  * services: renamed datametrics (1645) to sightline, which is the
    official name.
  * services: renamed z3950 (143/tcp) to z39-50, which is the
    official name. The old name is kept as an alias.
  * services: renamed snmp-trap (162) to snmptrap, which is the
    official name. The old name is kept as an alias.
  * services: renamed imap2 (143/tcp) to imap, which is the official name.
    The old name is kept as an alias.
  * services: renamed sip-tls (5061) to sips, which is the official name.
    The old name is kept as an alias.
  * services: removed some historical or not actually used ports:
    rmtcfg (1236/tcp), rtcm-sc104 (2101/udp), sgi-cmsd (17001/udp),
    sgi-crsd (17002/udp), sgi-gcd (17003/udp), sgi-cad (17004/tcp),
    asp (27374).

 -- Marco d'Itri <md@linux.it>  Mon, 24 Aug 2026 00:53:38 +0200

Update S to ${UNPACKDIR}/work to match the new tarball structure

License-Update:  copyright content, see [2]

[1] https://salsa.debian.org/md/netbase/-/blob/debian/6.6/debian/changelog
[2] https://salsa.debian.org/md/netbase/-/commit/392d1b45a2e3d41e6a791dbc81=
7e83953cd9cb8d

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../netbase/{netbase_6.5.bb =3D> netbase_6.6.bb}            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/netbase/{netbase_6.5.bb =3D> netbase_6.6.bb} (77%=
)

diff --git a/meta/recipes-core/netbase/netbase_6.5.bb b/meta/recipes-core/n=
etbase/netbase_6.6.bb
similarity index 77%
rename from meta/recipes-core/netbase/netbase_6.5.bb
rename to meta/recipes-core/netbase/netbase_6.6.bb
index c6cf798421..cab95a8603 100644
--- a/meta/recipes-core/netbase/netbase_6.5.bb
+++ b/meta/recipes-core/netbase/netbase_6.6.bb
@@ -3,14 +3,16 @@ DESCRIPTION =3D "This package provides the necessary infr=
astructure for basic TCP/
 HOMEPAGE =3D "http://packages.debian.org/netbase"
 SECTION =3D "base"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D78dd2c7c6f487348e4a009=
2c17a19d42"
+LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D03a03b9cf1aa619e30b1c9=
d53141163e"
 PE =3D "1"
=20
 SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
=20
+S =3D "${UNPACKDIR}/work"
+
 inherit allarch
=20
-SRC_URI[sha256sum] =3D "9116047aebbaa1698934052d01c6e09b4c3aed643e93df63d2=
ddcbec243c26d1"
+SRC_URI[sha256sum] =3D "31f7e8a37f3f07010e484f74bcbee503923b38d1a36c6a1132=
6b804acc07224e"
=20
 UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/"
=20
@@ -21,5 +23,3 @@ do_install () {
 	install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
 	install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
 }
-
-S =3D "${UNPACKDIR}/netbase"

