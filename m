Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A507ACDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 10:35:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web11.117457.1697452516379413499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 03:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=x7fSziUM;
 spf=pass (domain: navimatix.de, ip: 40.107.22.78, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVtSbI96UCtRoJZmYq2sHeDcE6piDPPhw0UF0mt/GNECfpD+C1IEtCwduJYdWPGqGBQDK2hr3QoPfKYe+zV+vUTZX3yF3bW2bsy29MplLB8TPfz2KWt/2UWD+FS1Bg4IuPZvVU6FzquCvtvV4CAz92BenuFQRT3hY75rUsSmEFWJ1+lou7dCTQFwN5F+eyD7fPYy+xJNCZJvKySJ1qpSJKQDpXPX887hFxeO0XXzNjz8Gt8RsfAzWMfoXh5LKLRiyP24HtrrxGvzegaIcY1jYMbJHEq/V9jZ3euUfwPCFAR9+m2RCP6tIe+6CpHtF/YkAVSEwBge6fs1LDaVx4R+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiIbQCZ41aBJd3kbvZTBMAett9B/031g8xjAt82/QXk=;
 b=c4WuRI1zbGM0y72n2oW4t5D1HBPbWyo9OruBYqNHOAFOQ3Gs+TOUTm47Lxr61bCavzFm72Y13uiPvCmZf2wGk2LzOWDLMdbpqdM/73U3S89vmTI9GLI6SiwjTfPdnP4g06lqQSfQ2RcTOX5HtL9FbG7IakZ7AeenB18hgoj9t7x2GEjMS1ByDMFW/HP53a+FvY55FzXF4sAsw5yh9hZIZRAczMyLTqrqxVq8AHrig51UkJj8BC0y71bN0PzV/DmlrTxkh0H4INJUnA0FT2LDj3D1PwtvsrYa1at/8WvOXkSlmkYvfDcTG4gFh2LkEyAfvfwIB+fz4uF4PXR/M58nEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiIbQCZ41aBJd3kbvZTBMAett9B/031g8xjAt82/QXk=;
 b=x7fSziUMo4vpjgH9q83lwEPg4sT5XtnaIjlKJHEf0+ZcIaM38vK9oQaEvqyU4WNH/rn26BFNArhLLAco2yGSQqTeutRaEkmveT/hev6G1dV1qzB+8NRxwnCLia/zeEuySwIoqVarwkFo8IwQQets/3ZYxWL+pzIq+KsHkFOlP40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PA4PR01MB10157.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:262::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.16; Mon, 16 Oct
 2023 10:35:12 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Mon, 16 Oct 2023
 10:35:12 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH v4] libtirpc: Support ipv6 in DISTRO_FEATURES
Date: Mon, 16 Oct 2023 12:34:59 +0200
Message-ID: <0c12068667751551517a764808812011bff29eb7.1697452499.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::12) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PA4PR01MB10157:EE_
X-MS-Office365-Filtering-Correlation-Id: 23895c4e-a51f-4003-dc8d-08dbce3393e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f9NkMqy11pGMaNJJtRz373M9VN90mhYnZhc9DMYwkKQmXcx9uZ9RnVzNYvcrOWFLs2y1kncuDn+pRl+/R4H6UvQoh2DC1vX6Cj2a696kC8eJ1nf8FFAhR8gJrEomDNPu9PoOUGKsg/C5xRLTqM9BiBWLVYub2JMKytJzGNuiLUp8fvqx3EPTywrGRLXEBJdLcz2rfUnL4gF2HELJ1a3ZgZ4dACk5WFXSjZt4oibWzq1Rgl4kT4+OIyfcYhwWl2KSBWbZ+ZrpScbB9DijLgNSAGtSj2eE+ABNxsKE8MjATnKOoT3iwpgxGqwnxxqFqHkh0rxQZDTCYW4XfonvltXbzy5h8QsSW2IPX8WTkqMnC8GoGPDX6cUVjtQ80sWr6w1Ok0Y12PuVNt0l46xgtoXyB279vPpWZQkiPUZDEdWam2U+7+JUjxW4XpOKbJiZ7Jtv+O0XmaZCyNB7SqNG3ovANK4PyhMowwmvSspVYaeHOJ+RcNG9t4ouwr60Py5xYIty9d1tiGUzB6AKiQ4l72h7JDRCU5udk56cHnb+vKSPq2tEFJrI/GJ+NJMnhj/IBGN7T0I6LmHaEz391FEecixHYdYdfWcNpiUAdPESr06UXWo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39840400004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(478600001)(6486002)(66476007)(66556008)(66946007)(6666004)(6916009)(83380400001)(86362001)(38100700002)(316002)(6512007)(2616005)(26005)(107886003)(52116002)(66574015)(6506007)(36756003)(5660300002)(41300700001)(38350700005)(8936002)(4326008)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+X9qxzjrgxuWp3e3vaB15MHcDDl+1NItMARZ4H6BBZxGjKH7/NOcehEYbyeA?=
 =?us-ascii?Q?dsIGbr3qoBJ2REpIamT47SRHLhLc3K/5rbcObwDvR0FcbTOV5EIMKnZ9+5GR?=
 =?us-ascii?Q?TfZwo75aaZaRytbkwJYM/wFgPC1+frBfauu99+LfMK2ImnSpv3KvhuDlCedn?=
 =?us-ascii?Q?ioocHmdTkSXbzZ0dMFywt41sVluCxgqzXYYgZUeowQCLmCF8wBiDHSZIcprM?=
 =?us-ascii?Q?D5ekemkp0Olw96GH/mhgbSLliiHsGBYANwHWAGjZcWxtXQYhbBaBiq3pc3j3?=
 =?us-ascii?Q?7XTfJLMJhFJ39gUi3MP7zBan3F2BCzMG1aRIsGSl2G9y/8ICIEn3tRDidkre?=
 =?us-ascii?Q?kZ6j3cSb9qw6qvEmPYa8XYkfKu/dheXA/JjJAeSFM8sTdff7HcwUKdNhv4qI?=
 =?us-ascii?Q?bj6pNArEDjwFOORg8x11eArBrRDp5twvg858ozir2zzjz5JUWIWxS2pmK2Mj?=
 =?us-ascii?Q?uEHgiY0d/SXhg0mdp/JzbSj0PsgAPG6H5TeUsMw1N7EXxirUaI41UehfFm5G?=
 =?us-ascii?Q?BFiRsdRJ0dO2FoyI6/VSrq66+OZSk8P5kniGWfHNzwTxgqkWASeSST8XFSe6?=
 =?us-ascii?Q?IMaDgxL0fV2zYoOrQvPoRmbpsef5QSHdwvy0ozVxcuaNB8oKcJ9jZzFRZdZx?=
 =?us-ascii?Q?BSUa3FUg4cRf8Rg+YkdmlplA/ARJRh1cGt7Dg0KqSx8FuCXZM8NqdCbjiBje?=
 =?us-ascii?Q?QewZMrCFVpur+Md4ZyReUoajCdjT1jXKo7QaAlpEa2gydRY1hmz4es3T/aCY?=
 =?us-ascii?Q?HkAys/4DgGW6ZfmA9115GCwcL9HIrjTBlR4FzxOlcPYS8wmF4q9yCcQQuRPE?=
 =?us-ascii?Q?0TiN4Fb1U/y31VpENBO5BfFb0nkJuCQLCgl1p32o8rN76btyJTVBjqo72B8y?=
 =?us-ascii?Q?znTMriU0Y3vTbofuNN+roqWVi1YKguRXBbaec/rKOfiwyEamDPEBC0Gi20pT?=
 =?us-ascii?Q?LpTPKZw1++xtev9DqrmH8Ema55sfcLeNtQKtNs+Cr7RYk3D9T2JuIFo7AlfF?=
 =?us-ascii?Q?FPvjDVjMza5W1RhRwjMLqx0y5QitfT3mdddpuo0VwWBodc9sl1mJ39DkNZJ1?=
 =?us-ascii?Q?Y/BB8fg4p4im+idBWYLE0JNsvNqcbSvillhdoXWhB8RPTXjWitMgpuUvmYHL?=
 =?us-ascii?Q?Q3eJ/VYcleYuX1TmSS8b1jIRRTabX/prJOOu9mHTEdDB9svKZ+vUKT2SHvOf?=
 =?us-ascii?Q?E8uyHyYhoUhbuzAKJPGyVlGy+1fFhrf12Le4jluPHUDql4thW57TY7Qcxqk+?=
 =?us-ascii?Q?qt5sL/uWsvDT8oiD3oJS8TvNfU8c0SoJVfdJrUx2qlYURCKBS9GQ2hvlYj3d?=
 =?us-ascii?Q?8cMLpuglVhj6ebMV+JksNlBP9lmeTOSxGPT/VGnPKp4szNulwz94CbwMg5Q4?=
 =?us-ascii?Q?WFXqYOEga0JNz3+iPj5QXsidBoAmr3fPQq8kJvurwsDjFThZFfv1+A1z3mTd?=
 =?us-ascii?Q?dTUxm5dXrUye/N6k7qeQxJZyMN3WGWZd4ENQugYJG/Gh5kxvAlDma8i+sH1F?=
 =?us-ascii?Q?kpXHIq8dzkE7ss0/FgDiEL8p/XQ1jGZ9M3xRAg0tRqQ385gRvtFicsHX23e7?=
 =?us-ascii?Q?Odw+lpS/VwOdZI4pn4WmPo14U/DCulX/IVrOFgwmXbkaPZUA4DCGR3Vl4A7a?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 23895c4e-a51f-4003-dc8d-08dbce3393e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:35:12.4201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MCRacsaXd+k/5tMC7GcdWTAsJbgy6QpkbyzEh1x5r9NkdhmDJ+hJoAwdZI5FFNZaGO5hR5h5D4Ht/4udwtvU/jjqzCwIAl27coVUtX1fjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB10157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 10:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189283

If the ipv6 feature for the distribution is not set, the package should not
contain settings for ipv6. This makes rpcbind doesn't try to bind to a IPv6
socket, and complain that this fails.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../libtirpc/libtirpc/ipv6.patch              | 52 +++++++++++++++++++
 .../libtirpc/libtirpc_1.3.3.bb                |  9 +++-
 2 files changed, 60 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipe=
s-extended/libtirpc/libtirpc_1.3.3.bb
index b27c302460..898a952a8b 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df835cce8852481e4=
b2bbbdd23b5e47f3 \
=20
 PROVIDES =3D "virtual/librpc"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
+	file://ipv6.patch \
+"
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/libtirpc/files/li=
btirpc/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[sha256sum] =3D "6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98=
d63ea2e60e12f3"
@@ -21,6 +23,11 @@ inherit autotools pkgconfig
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[gssapi] =3D "--enable-gssapi,--disable-gssapi,krb5"
=20
+PACKAGECONFIG ??=3D "\
+	${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
+
 do_install:append() {
 	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/=
netconfig
 }
--=20
2.34.1


