Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E40F45A0F
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 10:39:34 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.236776.1775990364355322496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 03:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=dak1nc0Q;
 spf=pass (domain: navimatix.de, ip: 40.107.162.139, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuKwtL5MoSQUsVPQ0OR9w5Vhpj2F7CnkE9eCcHJYWXmkz75VR8cY5MC487GSAhfkknQzYF2kDkKIL/C0rXcS7PByy2ArJYot4vp+SnA7/ZYIVxzvA3biFyUHpUPhDuQlA5H1Kam/MFmn6KmPZrS1TSeqLPPKgLsk575Y8RHLEcZ9PCI2Eaa3ENLH6iJtDUwDV6gSHl2CP3vrUOpS7xeIReHNrku69Hr6AOr0v5nI5qM8ymcdBhHxsy9bdrY9FYZYTXHXybIk2wtIsR0B/XqMkH5MR6z1eJ3wpFOmjDm46exDxpQNu7lST91yErolTAqf6Uu83kn+eHeTUeGhdpcBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OSHZN8H1GKIlEvV97I3lNDE+e2hVZcNzwYQYko4CiU=;
 b=M97cZsR8P0YFsYrN8zu3Q2yK8bGxRItRy1wWz4lVzUG0l6XZFkpMA/pk6IFJRBMwACH5q1QtSJ7VzMGloMSW30uLg3R4k+Y/nz9Mtvn7PkVo46A9Cdsn3O2QpnPh1S+PHnHCHUl7Pzg0hsMy8g81eMlkZKTofK9FWzYgsz1TjP5Okh0iybank0lqYJ0ZUV84LZlr0qgQc85wRlKNAcHnTz4HlR7oDDz9uhbakmbNF339I5+Jg0EMqyHV70CvugqbG8dUHnmwecPiLENbthf6jztoPPzJweaFZljajA8UDVSF7IU5RAcLtX7EKARgGkR7alVR8pZUlSUw/P45qUKrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OSHZN8H1GKIlEvV97I3lNDE+e2hVZcNzwYQYko4CiU=;
 b=dak1nc0QGiqEoYgKNAuVv/b4YSAWCW8CYrDQ+bH+1LBgzZChFrMmnR5+1qpIGwRkxm9xkTJERJh2o8AKFJWzYxqd7OuGM252giLuQkMPPfcCBbjuQ9Sj2hfJc9l2SX6oyfRq3jzcktmejlALd5JpHe8lgaHIHX021j2oOGMht8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB9332.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:27e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sun, 12 Apr
 2026 10:39:20 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.046; Sun, 12 Apr 2026 10:39:19 +0000
Date: Sun, 12 Apr 2026 12:39:17 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, rs@ti.com, 
	openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: rs@ti.com, openembedded-core@lists.openembedded.org, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2 1/2] atop: Add packages atop-acctd and atop-gpud
Message-ID: <5a2e6c6a750bb04263768f47307607f17b77f4fe.1775990357.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <20260410182747.1646597-2-rs@ti.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260410182747.1646597-2-rs@ti.com>
X-ClientProxiedBy: BE1P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::22) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 3961c4c0-18a1-4321-3cf5-08de987fc0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	s6xHqE5Wo+Si8T8tnxt5qpHIqqq5fxayZzLS87gapDqOK/QRBEf/hZ6EerFLyhiTyNFYwanBf8ihOGXc0OuttZDEccricFZDnsSJRRjaqiSBQSRWSDQ7s7DUr7Fm1QqTadcYVJriuXM3B7LwhWMI9xPsabtam2MA5KP6eHFTgsapkNs2gRisYJzQ4XakQgiEeFtPVbX/6TgUYBaeMxQRXz3chUS9++xlBbHnr8QPDSYUtJe8cqYZOPapXeX+7JESIJjxxmZEDzmElVAsdFPqfzVixCwfLOK+9VzwcwXfdgltl3p8oZeo0lrQ9EWjaoNUhq0AJj2PBvZWD4rSl8wwykmrq2XBU97ylq3Dpg/fovzhvuPR/KPd5hIf3ugmqpEJwVyZULqfnUpc53/d5iRSb0/XTB9c/LOkGUprQTB/PLnXoXTdEjRbPRU3cK3GW0NBjMlQi4muGYL8YeBrZYPFsWxLakV7DQeb10s8xTP4q3ClaMXilqH9qe/p7plrHNIVrdSYmfIySkgQUS0RbzC94DkYAbBBFj1MXuWsIilmGzP/Gy6+BCMNtywI1PlfxsaXdwjJ95v5Sc+rqDF20LUrYteN3gESDuPWZQcBPC8g/n8Ezzmiayt3Z9wNO/+SiQATdxYhFq5Rcv36x4C7ww5qQK8iocGobWB8dZzj7v1E2Def5KnSJJ0+bEhV6pWMiV8M
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RQBrFiesXXwA+uMYd6yZ/FlHLHiM8fBJ1a4OHlxzm+zDQuwgDqM7pooB+aQ4?=
 =?us-ascii?Q?CFajCbmTAtZCsswfiCYg9AcLD8Rgka1KGMSfDQp8OZmiP0AOgqpzUpNYP9k9?=
 =?us-ascii?Q?64v6QeKH8RRgc38oqs8PJzMkwYgIJIAe2uTMFa129TN0Hsfr5lI+AoV4STis?=
 =?us-ascii?Q?3NSQ+pibgAxR8BClx1NaY+Zlv0iyuHI5PPfYv0MATUAzBDVugj6t8M1DRG9l?=
 =?us-ascii?Q?X+N/K55xIib9X9zwwEHyNf6h4MM7YYbusl8IULqjt02hWxC2bHBx/8zYzJ+X?=
 =?us-ascii?Q?3tpBxLdINREugjJ2EIe4akTDSpv2Py1PM+TjUYjpeZkA980X7L12HcV8EUFZ?=
 =?us-ascii?Q?RLDIcc+kxauquQrRfQaAgHEJBzF9LN+pC1TTvl4NnaK9am3gop4kD074cSJJ?=
 =?us-ascii?Q?p0fVRJn/F6aMX4zlowDLZX7F6LBYPBeSRj9NnK4DRFH0tBp761RQoAEXBgYK?=
 =?us-ascii?Q?1lU1S+Ypbfm8G6V5lylH6yTDv1AvdrCX1G9XTjxuFH2ieJjwx1OkotTblYAF?=
 =?us-ascii?Q?qZoAdjN5Zx4ppwroHPEWNlqAdkQtzbax+xujjSXffUkjuBcnItJ3sN9ec1xd?=
 =?us-ascii?Q?/HR3WlDHTbv2sWFx+M/RB3ZrzSIKbfTzOLx9dcqFVe2nw/59fX/v6DG4Kqao?=
 =?us-ascii?Q?96TX6tjrhN+BMHD1NJDTSquajQSYAnaWQdb7QVeplQwdU1jjaxQxXMm3oxaj?=
 =?us-ascii?Q?aV1gCTX3yRKyvIgaSkGZgO/hSo1womZCN62HSXKax7ceCp/wra0rrBPW7gam?=
 =?us-ascii?Q?dkFQBDWkIVo8tMEUXLYrKauhhHAysAse+J7FCAqb2V2Pz3Udn3zmFLNp18TS?=
 =?us-ascii?Q?nCYT33Rm0nJnqvlnSPpcIzuybxQGSSnqd1IF9pVPIYAnpJ9ajRkGiNY7WUEf?=
 =?us-ascii?Q?Bgc3ZuiW7s7clXl0z85ZD/0YLczszfmCi0UKQ0dhFsN6vUSsXRpW0Zy0jEg1?=
 =?us-ascii?Q?SEDV+RA3yHfJSx3BBXSVW1r7EkSRcmsL3W9YLcvTd4d1bhszBb/D44fTySQZ?=
 =?us-ascii?Q?hn3HWi24ux3pRz3AyH8/lrSfYMW69CUW9bS+OfTDVp78JGIejRHmzanOJonr?=
 =?us-ascii?Q?4bMc4U6ZmgefYi70mTWjd/UZfcul2ZthXogKjKnwMZ4qysoGg2ulEjJZ7Xr5?=
 =?us-ascii?Q?afHYoKtc1/7MZzUignr0Yh70bEWDKy+EHCaYydUhty1ZHl7bftpGFx3WVbjN?=
 =?us-ascii?Q?jT1K/UTCX3tLY5weEa+89tzD0cFE6WwL/iNK2+kqdXc9++Wds6QofAstp7fE?=
 =?us-ascii?Q?F8AKpFN9tv1lUtQuo0vaQuCpeRGi/gPdOZsiz4Ka2dRw/9Ysg/Fwi80LyIzm?=
 =?us-ascii?Q?cGVY+53HwFaM1yUlQMbj5Q2GC+j8vtrR4EUtm1SeeCvkq10ohTSGzKgfZNHD?=
 =?us-ascii?Q?CFqeS/005Tcr7Gqw/TT25EJNYF4KEvAXjDTsxQkKyWXIo2ZoGvQZOAhMFUYV?=
 =?us-ascii?Q?8CM/WvO83zj89Gum8ohbO7Mf+g6Hpv9dWnAHR6zYhovj7JvQaDhJflyF81Xj?=
 =?us-ascii?Q?+dm5gnSu7NeQ8937F0IwqE7ppIzAdl8TgEoJ4DU5sbeD3/K/hkjBewHvheia?=
 =?us-ascii?Q?AM732mX9THyRlpfIyRQy9cPc7jM/of50TYNcMCfNlBu/GRtLXylmfVqwGyao?=
 =?us-ascii?Q?woH0vM8O3lE7a9Me1RGCXbrhZ7NOoxtdcltxyusOR6rlMUrFLSTSpDaY/dnz?=
 =?us-ascii?Q?TehRXzrwAm1FKwUuz2UkN/08xqE3WxjIZPgYJTS/+CBuVrvf6sW94oOfZzOj?=
 =?us-ascii?Q?nuwcbE+ueflhFZiK1ztjhWKMgHXhYoI=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3961c4c0-18a1-4321-3cf5-08de987fc0b2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2026 10:39:19.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZM0U6uSaIMNt9K7825yUjw+cHtvHEm4Yry974bDeME93YcFyW828hbMJKb1l+LIz5uqS8X0Zd1B4uHmy+GWsCqZWgTz5zY9dw536XZLlIp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB9332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 10:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235061

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

For some users these programmes might be useful.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/atop/atop_2.12.1.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/atop/atop_2.12.1.bb b/meta-oe/recipes-=
support/atop/atop_2.12.1.bb
index 4ca74edbaf..92665fa464 100644
--- a/meta-oe/recipes-support/atop/atop_2.12.1.bb
+++ b/meta-oe/recipes-support/atop/atop_2.12.1.bb
@@ -7,7 +7,7 @@ etc. At regular intervals, it shows system-level activity r=
elated to the CPU, \
 memory, swap, disks (including LVM) and network layers, and for every proc=
ess \
 (and thread) it shows e.g. the CPU utilization, memory growth, disk \
 utilization, priority, username, state, and exit code."
-HOMEPAGE =3D "http://www.atoptool.nl"
+HOMEPAGE =3D "https://www.atoptool.nl"
 SECTION =3D "console/utils"
=20
 LICENSE =3D "GPL-2.0-only"
@@ -51,16 +51,19 @@ do_install() {
     # /var/log/atop will be created in runtime
     rm -rf ${D}${localstatedir}/log
     rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
-
-    # remove atopacct related files
-    rm -rf ${D}${sbindir} ${D}${mandir}/man8
 }
=20
 inherit systemd
=20
+PACKAGES =3D+ "${PN}-acctd ${PN}-gpud"
+
 SYSTEMD_SERVICE:${PN} =3D "atop.service atopgpu.service atop-rotate.servic=
e"
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
 FILES:${PN} +=3D "${systemd_unitdir}/system-sleep ${systemd_system_unitdir=
}/atop-rotate.timer"
+FILES:${PN}-acctd +=3D "${sbindir}/atopacctd ${mandir}/man8/atopacctd.8"
+FILES:${PN}-gpud +=3D "${sbindir}/atopgpud ${mandir}/man8/atopgpud.8"
=20
 RDEPENDS:${PN} =3D "procps"
+RDEPENDS:${PN}-gpud =3D "python3-core"
+RRECOMMENDS:${PN} =3D "${PN}-acctd ${PN}-gpud"
--=20
2.53.0


