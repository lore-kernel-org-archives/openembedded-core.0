Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0004FC41513
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:12:59 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.51])
 by mx.groups.io with SMTP id smtpd.web10.25025.1697713976019995483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 04:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=JSAGv2jz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.249.51, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBqaDSwwGp4NeUy2u5ZqpUuNDOLIftX7YJuh41ZJYCeLLtbbxYN0AIl6KEWtYRbvGeAqVrNSQCk2sh0ximagp00Fyi1/LhYKeY2kH84lQYARwuUrw2AdJOzS+Q7tBesWxfWFKjc6pacG9ja84Mt86M3EhgVpU7zhLWEY7In08iE7Py36KpN08oFtN6+exqslzpEK5SMjzKJwbBj0gxhKrMPnLXEZokN6sZRavcZ445RXcLa0iTgxGf6rY9ibIaBRDn8CNoMvR0rWMB2dtktcWSFoKa05uF+lk6ll6ESSESXseWq/KPG6aY+hjE9NepO880LmPaJeRHvfJmtk9hsNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZoswPAWrI4TG1/XMvjXEF0uV2xBRiqWk8+cGqUeAxw=;
 b=CcS7BSRGqci3H4lwQS3+diJqG0S0JpUPYpq76zhcnzEUH1vMi6jDYrgJzKvMfFW4ViwJDmSMZtirrElHZc98zgqnbncv3VJiBIwZrYFF7cX4TSKRl0cTBGLvUYgWpEXCXDRQJNJabmg0LqTAzLUzp7BqNwh89BhA+jlvLkjr5mly4we5MaWBowZWg1nA7HrvRRtaDWpIjn3S5KmGueJXRyuX/XgH+DelRsV/DSa+AYqsfqL+k4LX2sFpOswmnmJuS6x2D/IQg7GWnuYbt0EyO4zP/Rsa82bsAh8ZZiXDp1v5HTLeWGtKtj3EmSIW46fMT6kloOuqEshhWBS/XFRstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZoswPAWrI4TG1/XMvjXEF0uV2xBRiqWk8+cGqUeAxw=;
 b=JSAGv2jzI5arU267PsB0jFWzMf+NaSUH8CoJxCUcHrGapVWEBwRJEw3SpusN7Atpw00MXjBSodDYTbytcD7kMJE/8NKhhrLC5baqDHNT3Car1f+DL75qT8UweG+h32iN4EOAYhF0MqRB2WIrEiNETg5dwriQt9+uGXvaY1VTD6EY4lCDRe7336LCvRxRYTi+GHLi/3I0bK9l4tYH6mfHfUycwnO9BJNoMbSkBX0iprXYz0BvEifky/mhW5QHOd2skbkW+OEBS+Bz6ppL56u8GbVX7QNsaYCM3KZEdvDzk8cFiFkMBzlJ0Uut2hgDGGE2MeLLtKtARR/0TWgevt0V9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by VI1PR06MB6688.eurprd06.prod.outlook.com (2603:10a6:800:18f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 11:12:52 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::e32:a91b:d0c6:e877]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::e32:a91b:d0c6:e877%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:12:52 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [OE-core][PATCH 2/2] systemd: add option to use stub-resolv.conf
Date: Thu, 19 Oct 2023 14:11:52 +0300
Message-ID: <20231019111152.23880-3-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019111152.23880-1-eero.aaltonen@vaisala.com>
References: <20231019111152.23880-1-eero.aaltonen@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::25) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|VI1PR06MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d24b3c6-8aca-49ef-eb73-08dbd094561c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xhJugi7twjjqeP6nriS9ExDTDETMuJaLNbzLfDsLFQnJTD0CkQLREAhZ3BPgbSKDbLT6v56A6Wf0nB1vR+o8UtDL+WM4ZpEYnYFA2PswPj5Ltyq+b3SJkJMeM5XSofeNLIrb3W+rXhs57+jXX3uBTLPLPuRBITOP7drPZRdTeY3AlqHiwzVhgu/r3P9Znn3m9yyUkTR/uwErlffK7RIkT1yDhbViPThf6qZxdzEYr/O6iX4rYvaBrMGTb9LK2da69zcKEkoN8Cz8qsAFIEeC0xqxYwt6h1yrNbbqJgqJqD6b5veaBjLpcgnHw5DN6NJlYB2FKh64VgNB6FZSAcEvgYXBgidrq6qDrMkwwApSV22OfUJdHGYJoUy33IxzmVlobS1AytcwmNn18uQ+Ll7OK+fyXETLftzlA4squxzMIwRdngWuse4VNn3Kps59bRZ5vz2jsbYvinSl+SY9Efp/c2W6fVqOZl1WmT6fb6h771lG8dFohE4I3DaZdmhrB+o/DtDqHQgEjiarMnDO/v/d0EMRcTpAUr2S59iE8O1KYP7ovSpbIgEDcITCApEbyHc4a5Qu5Yv0v/Gi5Zg4laZSVk83nTg9viCIuQvy4lrXT14=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(346002)(366004)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(38350700005)(8676002)(5660300002)(8936002)(83380400001)(36756003)(1076003)(26005)(52116002)(6512007)(9686003)(38100700002)(107886003)(2616005)(6506007)(4326008)(2906002)(86362001)(41300700001)(66476007)(66556008)(66946007)(966005)(478600001)(6486002)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B9JX4fyqtrWfFDBPSO2+oP63aJw+R76lDtzzrODTaoVRayx00AstFlm0jbLQ?=
 =?us-ascii?Q?BKPiIx/z6N93zQyBbYjJV2h4e3FbrvgIHHQ3jG5/BMEm3sn4WZFpRQoNefio?=
 =?us-ascii?Q?k13Il0K5PnREjDyJ4THYvTLrmDlGkKbNYGCTXP9SSogHeluj6X9xSufpE9qd?=
 =?us-ascii?Q?WzDgXdZRA8tG62U3i0kWZxveSUag2BiW2AozpZNWsfVbmSgyAqhtTVvOzJGT?=
 =?us-ascii?Q?T7ACPEOOVRlWnhouK/4IeFZx8pZ3WUnd4HWK+0eVsP6/7C5VVHNNZfg+wjGB?=
 =?us-ascii?Q?4wm+SdZZYfcHM11eXMc4EJZh16JDtTlBQCU8BYsioGj2HRKC79Gzl9/G7mrm?=
 =?us-ascii?Q?k5B+Dr39IbIHWr0BCloutginVYCHf+B4sRNX5h05lWShjpmjzO4m2JD9FGN0?=
 =?us-ascii?Q?CpxKNQm3VDiOK33nlhnU2gNcA/EstqS/9iTjRcAG4WUE7B41luNXWgcpA8MA?=
 =?us-ascii?Q?wCkEDn55asLvhVmeocI/SAFc5sQigntejfAzuBEqQ8duD5XcOJ1+Z/VWIkEC?=
 =?us-ascii?Q?rMNfHuq46Dd0/ioin9J8sklT9MUId4o4tMgKhCYBPDROcHDHnyBH/ktPJTmN?=
 =?us-ascii?Q?qaZdF+IVPAhSuT4bsC56E+A6+kJU5SbTKpaC5UZs+Kl34g1SmWzOQ/a50y/Y?=
 =?us-ascii?Q?CrBapZzv8wKYDr+I5mDDPOKiUzUEbo58FTTFUCYF2TpbCQmy/Zruh5c6q3WO?=
 =?us-ascii?Q?bQV3uNRj47aeBQC9qQbuDokOZLfx700YqQlg6fKr8PrJmXbJ7e2S6FqFdrQ9?=
 =?us-ascii?Q?oo2IRHCtoeEiqfJUu10kFuUjI3LrLVo01cHiay8176MoPwVaFvamH1h8E4eJ?=
 =?us-ascii?Q?F2G9VL/mnVTXq6i03N9KO2gDY/6befgw/vQQlQLZEiZXjjm5B8DwIXI11UOl?=
 =?us-ascii?Q?wN9ZsSTvai03cwSjxs62wbo0OZHqBnpi8MWln6V7sxr7VcrwBXIlQB5YfiQs?=
 =?us-ascii?Q?wXgCSsdLnYvradwJU6r3w+DHHk2VHEb4O+NlHL6yZnT+1d9hUj7eyKOGmpSl?=
 =?us-ascii?Q?8Z2qY2MTlEnvqcr2M/Mc0hGaFdpDHz6mDPOtUkulJo5xAjFedI2b/z9vYwz0?=
 =?us-ascii?Q?4GL2Y+atrXv6lwFlI7L4h8UHAyRacKBFra2Gls04Jdoi0PJzkcL+KsVKFMYo?=
 =?us-ascii?Q?/jCnFao3lyW+Vup7bZhIc/C1ukJ0w9RSBj6EkPHWZgzAMi46VmAw/GlKPZiY?=
 =?us-ascii?Q?fNXm9qNgXbLyFr/Ca5GsLm6nUUS5ZgHIyZR6bmmihMYKe3DiTlh9H9dAn0Bu?=
 =?us-ascii?Q?F0LCmKwuc/DT9d9RXF9EwH9Gs811cpZpr+2yCA3AKjde3icf+21X6DUrNDb5?=
 =?us-ascii?Q?CuBKGd66rKf8QAWw6tl7jDsKXDLX6+roeMFut+HB4X2XcJxrp1Qp3kd85hEI?=
 =?us-ascii?Q?BJU1an8alsGlzMlnQ3hMnNWIpBk1sfSh6MYwgsBJWcVlOkUpCWypvYXEdV20?=
 =?us-ascii?Q?xsI3fuLynROYMRLMGHZvYby+NzfabyhJYdf4hTK5v2pMBP1/GHaMKjST9Atw?=
 =?us-ascii?Q?BT1CCUqQ8TNA7BPyvmnxGA4RYWdtYaFW/LbOIe4DGaau2Cz27xRutM+oEKic?=
 =?us-ascii?Q?kROt5hquQJ5sNFJ0b3DaHUc9gx/JQ32LqukJ+yst/k7tDdTxeHUJ4gdIJg1n?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d24b3c6-8aca-49ef-eb73-08dbd094561c
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:12:52.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsNJQMm7g2BSVURFda8cyH3njUwKcIUP++cBHRjk7HXjP0BpNjqIof/qJXJEvjQJDtVhRhn9svakvL3kbrkQnKowv9/sj9CqXKSSE5MkT5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6688
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 11:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189446

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

Add option to use the stub-resolv.conf file, which is the systemd
upstream's recommended default mode
https://www.freedesktop.org/software/systemd/man/systemd-resolved.service.h=
tml#/etc/resolv.conf

This enables the resolution of Multicast DNS and Link-Local Multicast
Name Resolution names for programs that do not use Name Service Switch.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 meta/recipes-core/systemd/systemd_254.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/s=
ystemd/systemd_254.bb
index e0ee2da412..83cd854b87 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -228,6 +228,8 @@ PACKAGECONFIG[xz] =3D "-Dxz=3Dtrue,-Dxz=3Dfalse,xz"
 PACKAGECONFIG[zlib] =3D "-Dzlib=3Dtrue,-Dzlib=3Dfalse,zlib"
 PACKAGECONFIG[zstd] =3D "-Dzstd=3Dtrue,-Dzstd=3Dfalse,zstd"
=20
+RESOLV_CONF ??=3D ""
+
 # Helper variables to clarify locations.  This mirrors the logic in system=
d's
 # build system.
 rootprefix ?=3D "${root_prefix}"
@@ -339,8 +341,9 @@ do_install() {
 		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_pr=
efix}/lib/tmpfiles.d/systemd.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.s=
ystemd
 	else
-		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/=
systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.s=
ystemd
+		resolv_conf=3D"${@bb.utils.contains('RESOLV_CONF', 'stub-resolv', 'run/s=
ystemd/resolve/stub-resolv.conf', 'run/systemd/resolve/resolv.conf', d)}"
+		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../${re=
solv_conf}%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+		ln -s ../${resolv_conf} ${D}${sysconfdir}/resolv-conf.systemd
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; t=
hen
 		rm ${D}${exec_prefix}/lib/tmpfiles.d/x11.conf
--=20
2.25.1


