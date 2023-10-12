Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36CACDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:56:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web11.14079.1697122557982129286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=cKE3WpQk;
 spf=pass (domain: navimatix.de, ip: 40.107.20.53, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7HUnVQsZPv1efdQFUvLLEPujtcA14wX8+Ucu1F+PXaXk0pAFy6vvZ+2lJNMmlAm4HLcr9UrWHvaKLBOf0VBYWrfpk2UKv2hm7L6R53XglaO640Dr71I0liqZHZXW/mnOzw9o0FSD1ZHT41A52mG8kkltC02MnlBK35XU63WcPiA3dkVmNL7UkcSuJ4W4Dhh99Dtw04evw/VzMB1S6+KjPtGCJOgUQ6Dc+a7jG3BBNw0rBIZ1bDjMk8uU+1xl8v/Ez88X1j2c4zpObb2c0w21tgCHj6j94CIig2S2RMSUm9JOI5vbansimLhQTeChtNDaB4pBdzkJn4gpaG0Wk1L3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s2qFH1s+o9XAusRVYLUy1XRFBulMi7birKhPv94sWk=;
 b=h9HpuX1ck1HmBNev+ILf+27da+RwU3KN2EhX5uSWGtbf2t2q/u2U6RcyG3w+4CE/zryBLDyb1vOdYPKz/C8iScUMYh5YsWthrC6Te8aOiKwf2MkyG/N5sYmFJWaXNaXKz1kUcjbE4VJQGFjt9uk7QHjPezLxD099aV40EFxYaTUDtUOUbqh1dK3EeDMIIgvvzODybcRV0ybjuzGuOQuwhIxFoVqpajFcmQVk9n/v7fInt5AtToYejehg2XgpKpfzWv5NsaBNOz3/XhfEwjW9+TZ7gcIcuRVtXWIlKvy9ABJBAOIxsTlCccwrokPHHGdOGBKkTR47WdjlZenJIpPz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s2qFH1s+o9XAusRVYLUy1XRFBulMi7birKhPv94sWk=;
 b=cKE3WpQkocG9nCVnJilbwRa6+oHalHGhRMETreqYYRa3WoHiN1bpXDjGARd/zsk+TQ1funxajtJcOpsKoJ3rfRIF/U16La7L7dgs1mMtvwEoUavMBED7x9JCyQ+wn10CAS0aQE7tV54gViYo+hhaFUgw8CXE/xNmWHENFkwXAiQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DBBPR01MB10531.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:535::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29; Thu, 12 Oct
 2023 14:55:54 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Thu, 12 Oct 2023
 14:55:54 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH v2] libtirpc: Support ipv6 in DISTRO_FEATURES
Date: Thu, 12 Oct 2023 16:55:32 +0200
Message-ID: <64a7ca1412df4f236a8416ef4d3c0f1dc3208d1d.1697122532.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::18) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DBBPR01MB10531:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a15b5df-a500-4fe6-54bb-08dbcb3355a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8/2XoH8rN81YpNVfq/6T1blJNrq935lurMzcozJHkIRgJwLRiofpvWdwleKlDkp7P6YKOPQlClhs3iELA2ScL3S5mtqsCo7uav04ArQp3O+4eBsq5E70fEFDtNysS1LhJbIWuqo/kKgJCJXg3M1JsddhEn41VZb7dkTEZFDJYbxuJNO2mH0Ddgayz1XWsuSYVsdEY+vzHCOau6u3eYdWuLQJBI9E2s9Va/b5uuoy35rrrGIWSo1yp+MLfj8TVoeitOH/ozCwkJzvaUMWhM5EDj0P7u1doZovz1ffFSS6ShRLq+zojGtMQpcgBvTnV6oGQcvsJSfmeGqTWLiN1prQGUzxZdu4d8/GkRchb137uuo2d8yF/UFVNFt0cChd1t+uU9xEmL6lFaB7Yjw6wszwT2kWMUBXHwUDHPsRo7hzNA1orfqB0rXVobIRT1lyM7GGRG/0S/m2YBac7JyKp0NadGlsSLUIwO4jnITjmgIfqgdXSq6Vsqlk7pOMWpUeIrmwNhuWWbwLDFxQJ+xqTSeJmszhBN1czv7P7ep8V1Nq3aBJbznY4lcheo2i6Fb+arRRI15/Q/SpuZptlg/u9rJfbzvDovipC1BJnxJJPWlkD6U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(376002)(396003)(136003)(366004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(38350700002)(6506007)(52116002)(478600001)(83380400001)(26005)(2616005)(66574015)(6512007)(66476007)(2906002)(41300700001)(5660300002)(86362001)(6486002)(4326008)(8676002)(8936002)(6666004)(6916009)(316002)(66946007)(66556008)(36756003)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o5OIhdqOMwrThgRDmJHv08ynCfv1PDpEOSaIUIMWJZGDRpVXtFNVhIn9g8Qi?=
 =?us-ascii?Q?oF9oSSyOT/MeSdY3PQqvgKspa7n14aMfE/nzCrxg0JjXAqqzi+594P2gxpUn?=
 =?us-ascii?Q?eaTmZvkZHkolIHenivL/UgeQnlSTTZbMw4p70HT5DFXOJxNawNePlzFP6Gw+?=
 =?us-ascii?Q?hV/bYyqmM0MwFkRNkmmw1dvP6yJeqPpvzCAkY6subdkT4/sjlPFiY0Wwo4TP?=
 =?us-ascii?Q?I58qdpz12X53/kokmjGTf/dJcUReXf1ZWaJCwfK5IBHYYr/CVCkVuYXw/Osk?=
 =?us-ascii?Q?xya4+8HiXjjfxai0qVShj5LHyt0X1JYjfSmJvgd1znZMFfHzEjRqRA7we69x?=
 =?us-ascii?Q?G7khUGLKf6bB/y5CQJ7aAdcG7lwoeozLuPbdz2Oc+86wPNm5/e0bc4StOnLc?=
 =?us-ascii?Q?LJc0oV3Yf/Fa5tf/l8FocBr/boLFVBcD5XWpdXmwF6MDzJ2WXJ4StyyrYr6A?=
 =?us-ascii?Q?MdVtM7MJaXA6KFDLm20RdGKLWVKcRaUexzd4uIchzYCndOl+D4mCxjPI+cQU?=
 =?us-ascii?Q?tncu3u1hUl7mYZXHvofLlAGLzQcN8KxT2sTlsuXuRyel3rl/uDiOibw6YhU6?=
 =?us-ascii?Q?sHy8RtEmikJK+5V5vOmtEMIupYnBoVkZw2V/0B9SUGHKTBj033xaKcOG3iZZ?=
 =?us-ascii?Q?yR0flrkDsxtt09N+wdcQvZxfMnNg45eNX2lFUTZFj+XjFi9eiJK4ZYRPEWE2?=
 =?us-ascii?Q?gh9nGEqKdcmM9FF3zsYq57PcVGiP53gfCaLq0t0jSEp+CHvlKeFq7YEgDuSj?=
 =?us-ascii?Q?sqVrpsPCvEjXVck8RHufAOXkHYRDKaDOl8WDOe1FRoPfmo8AllRL+5KciDGq?=
 =?us-ascii?Q?wKqu+ixz35FvdGtpNjjUUDZFU6pz4TWFv/+bHW4I2+GTlCJ2LKmO2A5JY5gC?=
 =?us-ascii?Q?u5utyZE9BlAlBGfZ61Qg6sRAHD2rMAcn2gyJlS/jUMvv9F9QxKJ2kbyWfg+j?=
 =?us-ascii?Q?ZT3RLJ43Be5uB1cOVdlqS2P7lV0N7c9qFbJ61NCgyb3iEquVhHyzqvY3qrWy?=
 =?us-ascii?Q?Ogg8S+U81nvecal1RiNm/++T2zk+OfIpsDWKT7J0cHZpmf5dbRW55T9oUGZq?=
 =?us-ascii?Q?zMAnkm25mNOxyYAHG7JugQScjaBHXlrC/7vCH3AxJYI5RJEyCWFn1h7+ajc3?=
 =?us-ascii?Q?dHwUNCwKa9W6YXbXUve8Ah3q5/M37gXfAJRePlUMxyUNqOLdTGrLNe/R5uxf?=
 =?us-ascii?Q?WWDtpohCG195WGJLCQjE2vhw9W+BDm+la2Qr1jH//J3n9/G571VskVWZyp7p?=
 =?us-ascii?Q?cdYoMIS1opW9KBmHXzEXZOcqarpDTjvifHmI9fpKnngUVZfPQ0C0Qle3jU1A?=
 =?us-ascii?Q?dDf7E4yLi7xeICLJBPZqsHQyTdXPfJ3cVNtu9DSQFGq5noKXDyW039soyQ+F?=
 =?us-ascii?Q?nQv2HoJyZlXnnniiup2KLdmMcNQgjKTqFZ6gQsGgTdnQkwGs36vMR77Vlvcb?=
 =?us-ascii?Q?ncaZ2TSc3ERMdLuEERHN64Jib9NBoEJ59LRhNxT1+XeUNzKKy7wDzhBjA2yZ?=
 =?us-ascii?Q?LUhSGZo2hlYQnOrXP/N16rcKMg3gDSVRoEdpJbYXgCjBe3uGs2SJT4mnqIah?=
 =?us-ascii?Q?gHDGrWv/iy6j8ZB9KLGPXfJg42FWszvV8QPp+x7a4zQCateFWm9TSG0afCsN?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a15b5df-a500-4fe6-54bb-08dbcb3355a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 14:55:54.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mW3J6hOzmq1pZE4nq9XXF1gkvYd058H7AFxTNTGk8s4PBNKJ79woX47Me7mPs7SOgA61O/4/PlULA2gNoHA1+rBiZImnYBXEDL87pJCtIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB10531
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189004

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
index 6980135a92..dca5a964a8 100644
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
+PACKAGECONFIG ??=3D " \
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


