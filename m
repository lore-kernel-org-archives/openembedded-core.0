Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C249ECDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:17:51 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.64])
 by mx.groups.io with SMTP id smtpd.web11.9639.1697113066331358938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 05:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ImqXSiQT;
 spf=pass (domain: navimatix.de, ip: 40.107.247.64, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVv4ZgUbIGBZ1WTtwzwy1z0uFzFmSkQqdWids+txy6HWJ+fske79IbDLQ9ZA7fxawSgL/JaEKEHQXcVBta5b32x4bxF7/uSeRjM4o8/JLokveehvkUqmzO6jjn1Owod2skKc/pERAr2CEpgEAeoyyzWhiDzWIDbD2ZMiQW7uaBIhB+48QIvoFW3lKIDOwnu93DD4bjHWr6NA2kkH0g69aUIfVxT5Fcvj9KEeJeOfsJD2PxWV9mOLIuTLx5L4/E4PJCFUL/x9JkLQFRKCNQpB9SMb8P2QcN97015rwNdTD7Z5K6cUr4vNw8SK6G3xptW2plWeQPrEWFG5bm+x12VYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzqGOZheA39SmB5PqI0qhhdXWt3kJUI6OnzZEIW/kM0=;
 b=KMGl7Ln2jI/bxE7iY1waI78WraorAWACSHoQqwHx6XYWnDU6O+xETGB/ZCRmihxPYPOSEDhI5U3hrksD6/qUiqAatPlEK43x17tq23ysF9sK9P6W6LGyPq2Ta7SJWT/KHTX2MBhc2BWNa08fZn4Iq0WXjjKTQY9nOuY372XN2+PB6MO8ukKzO1xKIcOkR+gi0+TlUbHj2sw/XMs3ZBgtmH1tqVsWexL89fv46maK2V+LDOeA0y9fKRY1xat4KpmXFQRTZ15D/fGAaI/xOD4MwhqFKCb6LMt+oAgSQhHCMNgxArgAyEWKNl/faL65eyS5Byf5N2suieoYFy+NykQRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzqGOZheA39SmB5PqI0qhhdXWt3kJUI6OnzZEIW/kM0=;
 b=ImqXSiQTM1wTOkGMT+2oe57w2QEyDKQiVh1tQJbiuN/mPORZyGtqgs3mMi2tejDIz0U7XKYItvovywHVLzMlcX+Kg8ky0i/IG/FaWeuvxj5YedlAcjRIQKsHUKKLBKDeQ99Wyjo/HMqWuua3gMfMshGFAl0+Cc4NX8gukDlI1zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by AS8PR01MB7174.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:252::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29; Thu, 12 Oct
 2023 12:17:42 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Thu, 12 Oct 2023
 12:17:42 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] libtirpc: Support ipv6 in DISTRO_FEATURES
Date: Thu, 12 Oct 2023 14:17:22 +0200
Message-ID: <0970d630a7876bb902557710603578d0d82d8047.1697113042.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::7) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|AS8PR01MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e8e7d9-6c7f-4ee7-0708-08dbcb1d3bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dLd2trTGDtd3jd2fojmHToPjkLcKY4lPzeHZBZ4WLZmGmHvIhfAHZik6eLmMMiGxf1khacHWFEkeReAzUpcF9jWnIVzsjidAVAEYnjj3RcTb9SSo2bIPMlAeHBDk3VTQL8yRVNkZpDME26D7XYR/YP19bb2N7bgP9T3VaCyw/Bu41EnCB4NlI/LWvUbn6UKEM2LyGhFMYmZGlC8FJMNPn7LNFF0v8PtKYhhDtbWG3vYYB5CVM7buuwPVS6rE2fW+uBzFt99/mg7BmYeH1+BZkh9wjEX3LQocOC4WFdqbbWHU2oP4YuQyJmZfO6JUiYJI9cGKt0wrVwZ74T3vKrvdqlHfinAY9stwZ1FAGSHAF4Dfil6OiRN3ECki4MOt9AGIacQn6UBtXsJssOe+X9wdrLWyYZ1AtFACUNa8qj0w3VU0CD4r9fH3ZCuz1kWZ+yMEpaWngClz5jXvN4I9A1srJcO3ugUaWCFKyYaw2yPlwbfsVNc95N08giNUhfPAQdgzCdw3jinr5hnm7iaMLmv6fywgdcRhRCcIBovHLCgD2ttgehGXmI2InDQVJ1Jg47r6+JPw1jJcgVRMr12pThMcONsWd34mGUr5jebxdSqHqdRXwdIewOgOgHbMpFMm1bb5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(366004)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6512007)(26005)(66574015)(2616005)(107886003)(6486002)(41300700001)(5660300002)(8936002)(8676002)(4326008)(86362001)(2906002)(316002)(6916009)(66476007)(36756003)(66556008)(66946007)(6666004)(52116002)(6506007)(478600001)(38350700002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BIvmKxy1M9n1Z9MZuieObn1Rl99nEvesb45UtI6VI0xDB/TMV83n+PVX9LhU?=
 =?us-ascii?Q?JoiFZaw7v/7uhb0K+eNv7nmxpJssUMWmKMKxhv0kjQ3AyaIIUHd/u7a9iMkG?=
 =?us-ascii?Q?a5I3wEKLnzftaUOGhaIiokIbP75M+eV+N77r4K6VniWUp/tudPXlOeS21wN2?=
 =?us-ascii?Q?dWdUGdi3pHWjRGgfqLnnV3/w2f1bRx2vpVWQaHRtBnM59C77eu+WYDN64bpq?=
 =?us-ascii?Q?DETHlRL5Mx6hBHjJF5/KMcQw5Wc6Ksh3EUNkUyWYpi7yFgfS9PsbgSYfaYtq?=
 =?us-ascii?Q?YQPXzUMpTUjGNHAFUm+Uu12UfpCc6adNswZwLyKepHX0wr+g0xBCULDjYAoY?=
 =?us-ascii?Q?0B3unmsxt9BKKviAG3bnuFly1mITEizNYejYAnP+lttxmwgYgrk8XWfPqhSy?=
 =?us-ascii?Q?FTE56o67AnQrW+kggsaRSp5CT4ODRV6HPYZfwJyVwcH0xpqb4x72VTU7Kn4H?=
 =?us-ascii?Q?tPo17GQorYUP58chBeWCRl97nzXnH6WJ+PunN6bdk10VYaPFI6JEXxrAmgyK?=
 =?us-ascii?Q?MIEOigl2uO3rw2XjG0fq19hz5eNQkR180zyGgF7dqwBMFoVMXvoOn7/YbSL2?=
 =?us-ascii?Q?HIPdpBEksrf6QUGPk/gNI3w42FlVRxb7d4iKzlcaKV0qhmRP5pKq1j9iEBJI?=
 =?us-ascii?Q?2rE92nPolMRv5WZU/PkgM4jifzo3RqYtgXdICsL+x2dhbbg9bmQSJjQuwaij?=
 =?us-ascii?Q?qGZbQ0VvhACG0O3oXY2LK5eFEAZAHAsmARIGQRUFee6rhAoyaRMk81ewcGN3?=
 =?us-ascii?Q?s7MtlbpT05dfp5zzVzzH3HJkYtfvgZBPNTos+n0mP3H0ejPHUfLkkCaj7bgf?=
 =?us-ascii?Q?wXGiWwRAluglYgkenVSr9UumQatSnPgN3yGoO2DMo3HqaKcqu+PSWRLt5uy0?=
 =?us-ascii?Q?dS+6HHlZjoLg4Q5nyWOTYmpf7C7KKgW4k2B6zeR+u/p3WL/y1R81W94PkT1D?=
 =?us-ascii?Q?6Mx/wsAyvt22bMvs6mh1rPMkS8v6oSiXd9v/2euttBUnAkh5BPUBkTk0E+Us?=
 =?us-ascii?Q?BUmYNv2x/bgLqNnFvYAWdqk/YPgQUtDgQA3fk9PSqujZZi7s8ENckCHTk9NW?=
 =?us-ascii?Q?A6LNNciF18gmPZ8FjQtYA8UITzMVJr4NZT7HaOS7pN3a7M63Nb+9Tf9RsxpN?=
 =?us-ascii?Q?2JZT5/SaoYIHY8hcxj8vNY9s0zfBkTg+80C9Ycfsu2VExiaOZjMyxnnyoGbO?=
 =?us-ascii?Q?G7+1lWd0zSVxwdLHJLQIvWw/FiBJP96Xkvd3ShqfMnAPf/icdp1jIVCGdG5V?=
 =?us-ascii?Q?MZ6TrKybYwZOW56gieNbHvwfC0J5T+J4BJArToCzvNj6QY6iY/eJEJe011zF?=
 =?us-ascii?Q?15kXkuPironVs303tGrF6Ll8ADql4zcdyLKoVWthUISs9UNhmfFuzwC9ifdd?=
 =?us-ascii?Q?Bljcv5Xifzy1pSKOSsFUTP4DAwHypmXrM2pq8suDC8t2Z2OIQaa4666oy4XH?=
 =?us-ascii?Q?e4N+ubnDKc3Wu5s1tDS+XOePyx6SkEBPS1mY5tRrWweqKCZp997vtjRdHp3V?=
 =?us-ascii?Q?CrHmYhj4F93qQo/GiRgsliD7Yu3ZSpi51IODX3JQpCHxabefZQv00ascphBp?=
 =?us-ascii?Q?E4waAJk1faPJLnSvPDuCc3NykQzAbUvtiIY510vcdf5hAAlHjrqOtJVJMPZU?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e8e7d9-6c7f-4ee7-0708-08dbcb1d3bf6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 12:17:42.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vk7Ke2so7zIYrWkl3chWcoYq8opr1NsNPLHBFQrlsSQmrLeshA3zuLOUx7xVhn5TJO7VdbUK0CLcwr0GIjpDYL7PjoXJxIHJdvA/hy7HWSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 12:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188993

If the ipv6 feature for the distribution is not set, the package should not
contain settings for ipv6. This makes rpcbind doesn't try to bind to a IPv6
socket, and complain that this fails.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb b/meta/recipe=
s-extended/libtirpc/libtirpc_1.3.2.bb
index 6980135a92..14db4a5eda 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
@@ -20,8 +20,20 @@ inherit autotools pkgconfig
=20
 EXTRA_OECONF =3D "--disable-gssapi"
=20
+PACKAGECONFIG ??=3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
+
 do_install:append() {
-	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/=
netconfig
+	if test -e ${D}${sysconfdir}/netconfig
+	then
+		if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'false', 'true', d)}
+		then
+			sed -i '/^tcp6\|^udp6/d' ${D}${sysconfdir}/netconfig
+		fi
+		chown root:root ${D}${sysconfdir}/netconfig
+	fi
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


