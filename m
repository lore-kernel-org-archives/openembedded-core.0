Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29730CDB483
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 16:35:13 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web11.16865.1697128509287404277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 09:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=hmQQgpsb;
 spf=pass (domain: navimatix.de, ip: 40.107.7.70, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr6ZYn9sSffihAXybBlpo3dIgfHfsbuaGwLbKbcX5PPv1Qh2OHDfkFnhX46IeHYsE/Qtxlzm+tVQdKtCLK+CqejFuG6azyr6U3gKz1OwLu9BB4sm/KU8/liHIU0S7YbvBYejZqkmnXcUKc4Yhscz4VPIYSqZ4uOqNwpU/DLNM53JWPeACLSRRhkmXPJPV1LNKW2eRiwPo46KiHGTh5myqhvYCIJkf2OjPVUUn2tKWB6GsB9vuMf24SKOdq34q+WZ6t+9rqFIixjoiZvLXyayUfVhQHQKm2SrKwWoUnSgPJmKdO9vmVao/remAVKQEoeWH5dPyd3B9kBSMqfglPpXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UV35GI8Tksx1A7TGRJ36/7GfUALy6slW8qw92I65eE=;
 b=BWiDTbf7mZE7izcMlKDjOljqSyHUk8ltOYI9IX9a5bdVBQ8Dl/aI7hQ9XRRe3OvS84KJTHYOCx6VlBsqVhRtxtaj6bIMcBcrj7K7VtEsqBkoMzb5iCVfp+153uOej3c6tQFuRF6pXlr1UqnMgmolP464Iq936bCT3zMUBWXHzAjq7FYtyc/3Zi/wi/g5ePAWGenzvq8qmmxzT2npKkaBdvuDFvYPe1InlNgS6t+JOgIQTU97Fg3RhBGPF8icqe0IZ3esOdVoeSkeJvct1mHhTh0OdDDTKdYvpGag30IJEac0lDrSWfZL12vhV680ima9d9zUVmu8Y7UzrksNX50VLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UV35GI8Tksx1A7TGRJ36/7GfUALy6slW8qw92I65eE=;
 b=hmQQgpsbT5uYbs/Uhkg4bx85P1NLnpB3YhRy6D6eRLzDokeLkafsHCIQX3GNp5pYMSoyl3foRHSoKZWE0GJD40llz6HmRrysqct0I4WzUYHaRrUoOD8YfgUqElR7y8kjcIHqU2UasZlcEws3axwXdbVdzjx3r7v0ViyYx+WnNhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PAXPR01MB9459.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Thu, 12 Oct
 2023 16:35:05 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Thu, 12 Oct 2023
 16:35:04 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
Date: Thu, 12 Oct 2023 18:34:35 +0200
Message-ID: <8cdb84d612c601fcca552024d58358ad80128faa.1697128475.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::17) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PAXPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: b253b115-2265-40b2-479c-08dbcb41300c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kp6BePsVNP6U+rqjOXaqk/JA4rhMr1TSO9bxaxN0HJ9SoQ2EQbc6A1/avNqOOv6E6Zn9V3U7YHYYczRzXnQzzaBS6trp0gI99nkB4c4oJ7CY+Z45GUGJXUbAgYcUxtY6ysmyONwIjb9OcZs+cMj1Wxtqja+6fiioxZuEK7AbBQ+UwS8G9iY24/NyYCS12hu0RX6pMjm/SRn5bigAMXJcCsaoMSXxvVcI21Qn7HSukM+wAomzki2JexpSyMt8EowAVIQuqhVkhEmnBhdFOhaTeU8Z0uhOLXXnZzgG8kmgpsapTIa1SVGk7RC8vHioJ6m5q3pqtkTAVvYvHrHemkBx6JIihNQVsfA71scV0Rf8aJM/rDPwhjdqMW0D1zcoSPpSWJvw3LTJ1VnXYheyqHyxTwLDznglgFMHaZ06zOvKTvoEMSoShZqPqL8eQArrWXYtUm9+Swmt0PqPOgXgWwan+OOAS5rx6Ye1e8PkvJCT1rdaH8xgS+Ehy5E0c9PlLyuoPiSGMtR3huHsJDROWAvNXCLiBXofMLNfZ30f8mHFR/KdoRZU1TH8NMSkEZTgacPAL0IWeUsYlzq4WC88lnRZmiGQHdfWK4EA25eq3HnGH4k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39840400004)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(52116002)(2616005)(6506007)(8936002)(66574015)(6666004)(8676002)(66476007)(4326008)(2906002)(478600001)(6512007)(66556008)(5660300002)(6916009)(83380400001)(66946007)(6486002)(316002)(38100700002)(38350700002)(41300700001)(36756003)(107886003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0CfyaRaqs8qRjA/moQc96Y+J+ourCwsY/hQwJjvjndl+/91adeWWoGvCNHZv?=
 =?us-ascii?Q?NihGNLpgypC17XZ/Ol8eZ42pCZNGds3IYk8akW8Wv24Fj5SOSfbH1KtVY1fj?=
 =?us-ascii?Q?aN8CfUNi5fl0rXk9aSjPNQE8pR5X9pXv5+1I52JMu8anZOyxWzPn7ZKLqHzW?=
 =?us-ascii?Q?XniCDxYyUHEJKJo4pIHmt0zR8DtiHuLMNg64UWCEDB2eZZ8emBVRzAesiX1r?=
 =?us-ascii?Q?tVjwPG3YX/+WHzuLz+4cAk1BAqW9LVoOYtH+DUP/KT8J2/IpPWMBJap8SI0b?=
 =?us-ascii?Q?dzTKtnaCySDnrk8vNmqFCupdvEHIoJ4rc2K4L2U1TVyK4/s74RmuifqjDLDM?=
 =?us-ascii?Q?sJuTTHFFSsNK3c0XXieTigNT3Gj+1QpGimlbPP0up6hD29RX3XWiVPnraUeM?=
 =?us-ascii?Q?WKSvbj4IIhreBjOc8TI7bRGIqIqNWBupT4b8N9gc1MYwW5igJyXq7wfaz7Tm?=
 =?us-ascii?Q?GttMqMEtxoDSsAxhe8lJLJiPz2kVMXVdmAUFVyF97NZNUIul/MJRCOBhaqd5?=
 =?us-ascii?Q?GIB4O2pjvJnynwDtiACSMobdWP9SRDPlYit47nNmc8YVPjjW8jTVSLsYE3A+?=
 =?us-ascii?Q?KzLVUC2mfzwmyMHlOInG7peP86mzAdUo3YRWe9DmoZuyP3N9RvVLGoAZnIF6?=
 =?us-ascii?Q?9AWVcyG5YVVRWkvwzQxU6oRp/iIKGpbrCR3MZQBaxTdHSbvUrEO13RUe+XPs?=
 =?us-ascii?Q?kJXbfvvpgd/KY+GcwO3scJ45TCPc17IZ8rfXPbwIQkX9SGE+3wqNa+MA+n4D?=
 =?us-ascii?Q?bJTHMDr/A2yDT00Asr3ZcGeUN6w0hu07Im2N6iDY0kujMyJ3CPnyfBlPFn4o?=
 =?us-ascii?Q?TKWjViVA1z8DFOr6CgbphB8j/8LoYOPZpdZ7Gv4WazYp/v9ABO28hf9Vb5hR?=
 =?us-ascii?Q?bzPPjfgISS7fT8q8P/imaamvkB0arK/+MNCIxdxQGL7iZ2tTxlZeNGLyojw+?=
 =?us-ascii?Q?9lpSRg0e7Yz+9iobyw2Ok5LpRD1x9HBCUAeW8i7BsRNmD6XdyEhVcvR3VDT9?=
 =?us-ascii?Q?qhzlFQlSYvIYI0x32tw+E8hbQUCBbgeTlI58DyWm/yhoR8dbzo+2c2xsC3r3?=
 =?us-ascii?Q?OIN57cRUw1L9GxIAqH23dIQ2HyFYpaIC3Z47b57zEoFZYmdrgyoysZD3+PIy?=
 =?us-ascii?Q?LXN7fKAvqnUruv8rweSTTnAbzkasVmzspZrwY5YbIPEin1xeWd0IgubJyTqy?=
 =?us-ascii?Q?fYliJHQ6Rvye8GAs2yIo+cu/W3FnsecYYzrSjrJ+htPFJPV7sZHxF+leSeOl?=
 =?us-ascii?Q?yPI8xs5TjWJtqO+wMWlDnjDOPvbqeQdoKeXLIxDCxi3SzeaWLmyRLlmmt5cB?=
 =?us-ascii?Q?s4pp65QXiP8zeHt5P8ZOtecONe58PRndukMIu+yuo0U+th1bInEtdRCyfYZv?=
 =?us-ascii?Q?iAm+lumjs0q6vjx3xLHU7TkiJMelUD11wHwtcsYkrpCndANi6AXxhLKEvQ3e?=
 =?us-ascii?Q?ox+ARybcMyuSSWdhVkz7cQpzs/Kf6koan8kS78F8Qc+B+zpfZklbQzb9gH25?=
 =?us-ascii?Q?miT/3q5Rkr+WclUcXpFMBvqQOdORs7KrdvzkjuFIUz1qiqbKY8Gmkr6oEDt8?=
 =?us-ascii?Q?wxPHVPm83BgK8aONdQYZiBsCw4mxBykUHDeDGO3XXvmR1c0ZM0v6RUzAFiy+?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b253b115-2265-40b2-479c-08dbcb41300c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 16:35:04.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8IqaPIa+8Gdt368FttYh71CYQHbEpWvTyDgCyDLO3GgxaT7dBA2e9dvW5/DGvdCG91JR++JpnXV8s2iHykPe8y4f+CmlAyMGIGt9MNgKS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9459
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 16:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189008

If the ipv6 feature for the distribution is not set, the package should not
contain settings for ipv6. This makes rpcbind doesn't try to bind to a IPv6
socket, and complain that this fails.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../libtirpc/libtirpc/ipv6.patch              | 52 +++++++++++++++++++
 .../libtirpc/libtirpc_1.3.2.bb                |  6 +++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/ipv6.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch b/meta/reci=
pes-extended/libtirpc/libtirpc/ipv6.patch
new file mode 100644
index 0000000000..f746f986f4
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
@@ -0,0 +1,52 @@
+From 077bbd32e8b7474dc5f153997732e1e6aec7fad6 Mon Sep 17 00:00:00 2001
+Message-Id: <077bbd32e8b7474dc5f153997732e1e6aec7fad6.1697120796.git.joerg=
.sommer@navimatix.de>
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
+Date: Thu, 12 Oct 2023 16:22:59 +0200
+Subject: [PATCH] netconfig: remove tcp6, udp6 on --disable-ipv6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If the configuration for IPv6 is disabled, the netconfig should not contai=
n
+settings for tcp6 and udp6.
+
+The test for the configure option didn't work, because it check the wrong
+variable.
+
+Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
+Upstream-Status: Submitted [libtirpc-devel@lists.sourceforge.net]
+Upstream-Status: Submitted [linux-nfs@vger.kernel.org]
+---
+ configure.ac    | 2 +-
+ doc/Makefile.am | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index fe6c517..b687f8d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,7 +64,7 @@ fi
+ AC_ARG_ENABLE(ipv6,
+ 	[AC_HELP_STRING([--disable-ipv6], [Disable IPv6 support @<:@default=3Dno=
@:>@])],
+ 	[],[enable_ipv6=3Dyes])
+-AM_CONDITIONAL(INET6, test "x$disable_ipv6" !=3D xno)
++AM_CONDITIONAL(INET6, test "x$enable_ipv6" !=3D xno)
+ if test "x$enable_ipv6" !=3D xno; then
+ 	AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
+ fi
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index d42ab90..b9678f6 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -2,3 +2,8 @@ dist_sysconf_DATA	=3D netconfig bindresvport.blacklist
+=20
+ CLEANFILES	       =3D cscope.* *~
+ DISTCLEANFILES	       =3D Makefile.in
++
++if ! INET6
++install-exec-hook:
++	$(SED) -i '/^tcp6\|^udp6/d' "$(DESTDIR)$(sysconfdir)"/netconfig
++endif
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb b/meta/recipe=
s-extended/libtirpc/libtirpc_1.3.2.bb
index 6980135a92..edb98082f2 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
@@ -11,6 +11,7 @@ PROVIDES =3D "virtual/librpc"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
 	   file://CVE-2021-46828.patch \
+	   file://ipv6.patch \
 	  "
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/libtirpc/files/li=
btirpc/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
@@ -20,6 +21,11 @@ inherit autotools pkgconfig
=20
 EXTRA_OECONF =3D "--disable-gssapi"
=20
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
+
 do_install:append() {
 	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/=
netconfig
 }
--=20
2.34.1


