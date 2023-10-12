Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CD1CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:10:43 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.47])
 by mx.groups.io with SMTP id smtpd.web11.17976.1697130637598274840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=vlNH/f4b;
 spf=pass (domain: navimatix.de, ip: 40.107.15.47, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBCeRDKIKgnHDgfdE23Y/8bColc2cULVZlOluh8eCxZdJTtVnhGmlJ+cgsmRt6TcdyFMU46ssn/a/m5n+3BZadEugcMG36JYzm6fFEsL2CbN0tm3mkbH+Z8+vP+nPk1VBaC9tzUviDsz0p+PCpuIc7mZAvyJQFwlAO+ZnuSoU2SDzEoyLJMArPRM+U8TCmgMNzzV2/H4iP6ZRHiN/kD7oIRYScIKwZBhrH8uEmrwzRIV3OVwBaUdcA9b0xLe2c7hJQVnFFqALlYjoPg8mLwvYfgS0pwUrZSoIMfumpUzo31ibrIW8/IvaGOdHURVjSZZvirKpK9yTk6o7mb6zBxP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrZ4pxVgjZGXg/gwBs0xGyKD6x6dNE5pkwyf3u6BrXk=;
 b=dDy0cZuzAaFkzOhsRrgq9DloNnbDV0MfS1mu3UTGE853Wk59er22sl9/o7wUPIx7qs6A/G1CfiFH7NZ3G8oAJvcfvK7AxaovIh9sP8qXcUVAg8YM7CRjk9JjiMrPoBj2mCK1nffge03AXYDaTQ8RSSvacB35FqcEM+Gex+T2DVr4p4+Kw1Hdzete7d/NBzkjoMcrSd0vGDwsCr55VmoxiBRZvAC27YTxFbYEW3pK3yr1OUvtPTbLe06MkbkZNgE4QwNd0rVjSkUKs7RNkrP08Tkflg+iOmrubos5yYuJIM2eIRmKq+fVxfm/MWWZk3UTPlMseiH7Z8CCwTwBdCdG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrZ4pxVgjZGXg/gwBs0xGyKD6x6dNE5pkwyf3u6BrXk=;
 b=vlNH/f4bWuDNIcKoZh6JGzu+lz29nIDXMiYy5xhUiRQc+6tkObLqwh0sCgHzZ7Ifi/M9t3KtwCv8XN7Bvf2dGmG4ah7IETyG60dOd3oYopvBLqeQpnNpkvobcJZOSXAQroMz/sXmoFo18xzvds089qscAgbstlGpblL+Hi4PdD0=
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by AS8PR01MB7448.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:256::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.17; Thu, 12 Oct
 2023 17:10:33 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Thu, 12 Oct 2023
 17:10:33 +0000
From: =?iso-8859-1?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES
Thread-Index: AQHZ/SoUs5cu4AOz5kq5+rnJ1FDFq7BGY5vL
Date: Thu, 12 Oct 2023 17:10:33 +0000
Message-ID: 
 <VI1PR0102MB3136ED4E889CF9917E846BABFCD3A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
References: <178D69637BC0FE4A.21112@lists.openembedded.org>
In-Reply-To: <178D69637BC0FE4A.21112@lists.openembedded.org>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR0102MB3136:EE_|AS8PR01MB7448:EE_
x-ms-office365-filtering-correlation-id: f8f0e5cd-75fe-47cf-e289-08dbcb462523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cVhlmWtsl2IpUplss+sskyi5ly9BWIBM1h6GZ8AXXyttYSyKd3EQEKy2UHlRjIvlNZvJjDzitMIj/gED+BsGuz4FyiymIBwCURWU4KTgtxT47xLb9u2tA+f6vKq9Th9qJBHNQYykwGkaZknSf+7ERR3cQNK9wQomEeVIOeGJSiXvH+1HWNMudsevRZB4g/4gXbfBlLwS6k8WXcj5q8vRmUnl4WRsBIFc8z0lZx5myF4hInDxROGLo1ctPnsZiusYWILYsST3RnPPR0zdOSShEa6Yd8Uff7Wc+IZusQfZnu8kU3LXvO3WbswuNbdr9oUTNORFsdORLFn2wbkx4CLYTPgkkQ3NKxUhMDI3x/YNiE/u7LI2bNI28fqln3p42QwogYX3MY/yX4FuieMv7YYEGN8pfZO658maGkpMwiW7mhRelJUwculm7+ZN+M0up9+Wc3xp2MqxLYXHKMlsWYo+aotpkaH69iJCxI746xzcztR/TmvdHV80Kluh9KBgYfSsDNCcmR9lwR5ypQeLdF5eEvu4Bl4R1VhtZtrMGkhZbhvv8YJYI9X+Yft5CiiZ6U0oCSk2OMb3OeH1cMlLmf7BGuHjo34w2XuhI7WceTSIELU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39840400004)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(66574015)(26005)(83380400001)(19627405001)(9686003)(55016003)(66476007)(76116006)(6916009)(64756008)(66556008)(66446008)(316002)(38070700005)(8936002)(8676002)(5660300002)(166002)(71200400001)(52536014)(38100700002)(2906002)(122000001)(91956017)(66946007)(41300700001)(33656002)(478600001)(7696005)(6506007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0qS6HHMPf5dqUMzHRZdAMdWqrUnm4vohuvXCG0yv58kavfKGu3J/9hnxdG?=
 =?iso-8859-1?Q?DD0jZ2+ErzVjkgf0R+rmuylZAYLzZ59iqgFztPMm7Z0nPgBtjdfAWvrpSf?=
 =?iso-8859-1?Q?GdzSAjOgeX8G7tz69vmf+O1hlw5bB2wogmFj+D/Wd7r1paWOV2gbL+nWEE?=
 =?iso-8859-1?Q?S2cmehtY3wai+nIpYAg2QykKzwHbkDSZjlrPG2PKqWl4LtppkkmEHOQeNI?=
 =?iso-8859-1?Q?z1CikeitS+b5bNS9Zvz5ublPnf2cyoyJhdIh/Ir47SYJsp+NTiBr5TA7+Y?=
 =?iso-8859-1?Q?WMDbwBQ1V2RDl1WPOmjlPpIr/xjDVxxKH1sac7qWBkVO178r6eNDwSHiQo?=
 =?iso-8859-1?Q?LEdy2eYfYtIs2HjzhdCBJi6ZwtJe0hpTab/yltdAlJfTR6KiU3Acx8P+sh?=
 =?iso-8859-1?Q?csaUubHs4IZlWKs5BNNle2U5+bgtEU6ftNlIhgDTSGc5y8jx26DHyadmRD?=
 =?iso-8859-1?Q?/hiWvO6pZIZC4k3tYFqnBf5jGDPaecM80wO+ZF8t4X7ow1uMRfW8bZxJvA?=
 =?iso-8859-1?Q?RM4MhSeVoaQwsQqNcCSFP2nftujLpysigoj3ZmojkY4jjFPsuOdc5bzdR7?=
 =?iso-8859-1?Q?jVQJmJzRxEOC522u5rL1dPs7hrUvhZW0w6gGmLOiXABomQ3Pi1qj5fvwtb?=
 =?iso-8859-1?Q?8JJb8LJmIGWxTDaEWec4FS8qEEySWdKVnEIYaqfrO6wkOvj4WvjA3T7H3n?=
 =?iso-8859-1?Q?8caU3gQJD+sY2lNZQeNx3NxcQsqcDfRBJIwcew9ebabiJJNvmo/sVaAd+B?=
 =?iso-8859-1?Q?sUeX63kNM0kfFNOmW+8NZ8hwmbo1tsrM02oajyCqXGSc3+bX3ekj9W3PtY?=
 =?iso-8859-1?Q?pAHWlHljoAoq2eeXphroXTv3FRx6hiZ1ZNjKpfubOYWAhXazugQ+Zr9cvu?=
 =?iso-8859-1?Q?cxinnPemTeaYEvAJ/dpjndxy7FPZJbvNgfdCFEp2eVHp/zstr6iSkQssdi?=
 =?iso-8859-1?Q?nUYJCxjOirGDP1LRmEhdvOEJ7FlwKjLNVkzj4my88/QER5RPe8nFNxyuju?=
 =?iso-8859-1?Q?zJEnOzvR/zAIGayvgYWsrrqtbkapkaV1/bygEE3bGmiDrNhgWawHWgt0pn?=
 =?iso-8859-1?Q?jZyeh3y3StPH/aeBf3WLhFF6k4u5jubWyrHcuLxlHN5CDPYhlyPepxjY70?=
 =?iso-8859-1?Q?impY7fUSVz0eRBN6TFByLJVWPsdGDbIwzab3kLl5x8hM4sNTiaXu5wbt4R?=
 =?iso-8859-1?Q?nM3BzMSk0EoNLbXqWVF5Yzcr0wmWKwV447KPixmPMtTMEt3nOmO01cKyrS?=
 =?iso-8859-1?Q?220hDofKf02EM7ZvjQUk5msEfCok6BAWkSCm3mpkVo1sFY7aenT4Tn1gf4?=
 =?iso-8859-1?Q?WghrR6qz4mItAnihmKTHpdizBpS6QJPJJ5BIJmR6FucygynkekvQUJV+Cd?=
 =?iso-8859-1?Q?N+QKqtRC7Yk6LOJ19lsCdYUZjdsV9X66CaUXBn2nFLLT74+VsuradUf1Yn?=
 =?iso-8859-1?Q?JBdj5HnwEVlvvY6MdcLBnDF3fTLHHk9w8rwb4cbq995uwLRZS5pGXub7dD?=
 =?iso-8859-1?Q?kf+eKTeus5mrQ/h+LtsrR+ewUwK75FDcqwg5pSNMMzAUvIy4ydZZ61A5PP?=
 =?iso-8859-1?Q?4zWapRd1qb4pSrpJ72eY+vBvTA5bZ+vwN2WTyyqObQyeHeDP7gpR/sIzVr?=
 =?iso-8859-1?Q?W3syaDBrg5IF+RgAKl+dDzTiDollXGXCUS?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0102MB3136ED4E889CF9917E846BABFCD3AVI1PR0102MB3136_"
MIME-Version: 1.0
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f0e5cd-75fe-47cf-e289-08dbcb462523
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 17:10:33.3716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rq6Imb7GXvmn8kLFzQENsdrX82ubVEdU8mL+UDEoNzyiqBd4RAfsywhrZfL91gRyDy+ijofhq0AgEA1m7lGB0j/E9J3dxR6Wi15lJnFdg/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189009

--_000_VI1PR0102MB3136ED4E889CF9917E846BABFCD3AVI1PR0102MB3136_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is only a minor change, because oelint-adv had warned about the space =
after " of PACKAGECONFIG.

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of J=F6rg Sommer via lists.openembedded.org <joerg=
.sommer=3Dnavimatix.de@lists.openembedded.org>
Sent: Thursday, 12 October 2023 18:34
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: J=F6rg Sommer <joerg.sommer@navimatix.de>
Subject: [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATURES

If the ipv6 feature for the distribution is not set, the package should not
contain settings for ipv6. This makes rpcbind doesn't try to bind to a IPv6
socket, and complain that this fails.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
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
+Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
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
+        [AC_HELP_STRING([--disable-ipv6], [Disable IPv6 support @<:@defaul=
t=3Dno@:>@])],
+        [],[enable_ipv6=3Dyes])
+-AM_CONDITIONAL(INET6, test "x$disable_ipv6" !=3D xno)
++AM_CONDITIONAL(INET6, test "x$enable_ipv6" !=3D xno)
+ if test "x$enable_ipv6" !=3D xno; then
+        AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
+ fi
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index d42ab90..b9678f6 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -2,3 +2,8 @@ dist_sysconf_DATA      =3D netconfig bindresvport.blacklis=
t
+
+ CLEANFILES           =3D cscope.* *~
+ DISTCLEANFILES               =3D Makefile.in
++
++if ! INET6
++install-exec-hook:
++      $(SED) -i '/^tcp6\|^udp6/d' "$(DESTDIR)$(sysconfdir)"/netconfig
++endif
+--
+2.34.1
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb b/meta/recipe=
s-extended/libtirpc/libtirpc_1.3.2.bb
index 6980135a92..edb98082f2 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
@@ -11,6 +11,7 @@ PROVIDES =3D "virtual/librpc"

 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://CVE-2021-46828.patch \
+          file://ipv6.patch \
           "
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/libtirpc/files/li=
btirpc/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
@@ -20,6 +21,11 @@ inherit autotools pkgconfig

 EXTRA_OECONF =3D "--disable-gssapi"

+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
+
 do_install:append() {
         test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysco=
nfdir}/netconfig
 }
--
2.34.1


--_000_VI1PR0102MB3136ED4E889CF9917E846BABFCD3AVI1PR0102MB3136_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted1">
This is only a minor change, because oelint-adv had warned about the space =
after &quot; of
<font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted1">PA=
CKAGECONFIG</span></font>.<br>
</div>
<div class=3D"elementToProof"><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of J=F6rg Sommer via lists.openembedded.org &lt;joerg.sommer=3Dnavimati=
x.de@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, 12 October 2023 18:34<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> J=F6rg Sommer &lt;joerg.sommer@navimatix.de&gt;<br>
<b>Subject:</b> [OE-core] [PATCH v3] libtirpc: Support ipv6 in DISTRO_FEATU=
RES</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">If the ipv6 feature for the distribution is not se=
t, the package should not<br>
contain settings for ipv6. This makes rpcbind doesn't try to bind to a IPv6=
<br>
socket, and complain that this fails.<br>
<br>
Signed-off-by: J=F6rg Sommer &lt;joerg.sommer@navimatix.de&gt;<br>
---<br>
&nbsp;.../libtirpc/libtirpc/ipv6.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 52 +++++++++++++++++++<br>
&nbsp;.../libtirpc/libtirpc_1.3.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 +++<br>
&nbsp;2 files changed, 58 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/libtirpc/libtirpc/ipv6.patch=
<br>
<br>
diff --git a/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch b/meta/reci=
pes-extended/libtirpc/libtirpc/ipv6.patch<br>
new file mode 100644<br>
index 0000000000..f746f986f4<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch<br>
@@ -0,0 +1,52 @@<br>
+From 077bbd32e8b7474dc5f153997732e1e6aec7fad6 Mon Sep 17 00:00:00 2001<br>
+Message-Id: &lt;077bbd32e8b7474dc5f153997732e1e6aec7fad6.1697120796.git.jo=
erg.sommer@navimatix.de&gt;<br>
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D &lt;joerg.sommer@navimatix.=
de&gt;<br>
+Date: Thu, 12 Oct 2023 16:22:59 +0200<br>
+Subject: [PATCH] netconfig: remove tcp6, udp6 on --disable-ipv6<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+If the configuration for IPv6 is disabled, the netconfig should not contai=
n<br>
+settings for tcp6 and udp6.<br>
+<br>
+The test for the configure option didn't work, because it check the wrong<=
br>
+variable.<br>
+<br>
+Signed-off-by: J=F6rg Sommer &lt;joerg.sommer@navimatix.de&gt;<br>
+Upstream-Status: Submitted [libtirpc-devel@lists.sourceforge.net]<br>
+Upstream-Status: Submitted [linux-nfs@vger.kernel.org]<br>
+---<br>
+ configure.ac&nbsp;&nbsp;&nbsp; | 2 +-<br>
+ doc/Makefile.am | 5 +++++<br>
+ 2 files changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/configure.ac b/configure.ac<br>
+index fe6c517..b687f8d 100644<br>
+--- a/configure.ac<br>
++++ b/configure.ac<br>
+@@ -64,7 +64,7 @@ fi<br>
+ AC_ARG_ENABLE(ipv6,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [AC_HELP_STRING([--disable-ipv6=
], [Disable IPv6 support @&lt;:@default=3Dno@:&gt;@])],<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [],[enable_ipv6=3Dyes])<br>
+-AM_CONDITIONAL(INET6, test &quot;x$disable_ipv6&quot; !=3D xno)<br>
++AM_CONDITIONAL(INET6, test &quot;x$enable_ipv6&quot; !=3D xno)<br>
+ if test &quot;x$enable_ipv6&quot; !=3D xno; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_DEFINE(INET6, 1, [Define to =
1 if IPv6 is available])<br>
+ fi<br>
+diff --git a/doc/Makefile.am b/doc/Makefile.am<br>
+index d42ab90..b9678f6 100644<br>
+--- a/doc/Makefile.am<br>
++++ b/doc/Makefile.am<br>
+@@ -2,3 +2,8 @@ dist_sysconf_DATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D netcon=
fig bindresvport.blacklist<br>
+ <br>
+ CLEANFILES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D cscope.* *~<br>
+ DISTCLEANFILES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D Makefile.in<br>
++<br>
++if ! INET6<br>
++install-exec-hook:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(SED) -i '/^tcp6\|^udp6/d' &quot;$(DESTDI=
R)$(sysconfdir)&quot;/netconfig<br>
++endif<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb b/meta/recipe=
s-extended/libtirpc/libtirpc_1.3.2.bb<br>
index 6980135a92..edb98082f2 100644<br>
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb<br>
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb<br>
@@ -11,6 +11,7 @@ PROVIDES =3D &quot;virtual/librpc&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2021-46828.patch">file://CVE-2021-46828.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://i=
pv6.patch">file://ipv6.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/proje=
cts/libtirpc/files/libtirpc/">https://sourceforge.net/projects/libtirpc/fil=
es/libtirpc/</a>&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)/&quot;<br>
@@ -20,6 +21,11 @@ inherit autotools pkgconfig<br>
&nbsp;<br>
&nbsp;EXTRA_OECONF =3D &quot;--disable-gssapi&quot;<br>
&nbsp;<br>
+PACKAGECONFIG ??=3D &quot;\<br>
+&nbsp;&nbsp;&nbsp; ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \<br>
+&quot;<br>
+PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6&quot;<br>
+<br>
&nbsp;do_install:append() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test -e ${D}${sysconfdir}/=
netconfig &amp;&amp; chown root:root ${D}${sysconfdir}/netconfig<br>
&nbsp;}<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0102MB3136ED4E889CF9917E846BABFCD3AVI1PR0102MB3136_--

