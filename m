Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.114])
 by mx.groups.io with SMTP id smtpd.web12.9354.1600422625840969898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 02:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@sigmatek.at header.s=selector2 header.b=CbL9lb2l;
 spf=pass (domain: sigmatek.at, ip: 40.107.3.114, mailfrom: christian.perkonig@sigmatek.at)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLAtEawVn2qrHEkrYNXOr1OgrdnLnJUxaNCjEEdPd5ye8PaxI31N+FVJ9HO/PHbcMW6Lb0JmaD675ez2of4BUo+5tFOY6TXFsWNJ213Ab2Bva5C/8U1+GBZl0t7zzNEZ4y2Z2j+BmAwH1GxPaFu872korotho21xLwnZa0XxESMzbZDGW1iV2ljIW0oCptGuuIeCkWR/l5rsR5B4HniewQeiX1XLWRgarGvAa45BHRw3bEwtrnLmFt5nW+mGsTSp1gOOXPmJvS/vRSMWgj/35DE0Ni+5xi5EfcUGnCnXBlu7Pq97eQLZ40YP1TCXgCB3xTxeJjJPduxYjYFqM+o/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZiL4fmSjoQKxMDseob4ZgQKACavJbHWaR+uTtweXJ8=;
 b=E7+PoWhCzEfO36jeEoirLRhASm135euSWu6bwgiyTCvsG4JkfEnFT4wCb1WOeWaDzuj7OLl0D3a97A8Zi35oBNSH+BP0Cs6BFJ118Eg03MoaXKrynXt1ODbUmIrR8rscVkjMC/lyQk4pIakH6fwcfMJEIYiE6jPnfQegmCxLpVglnQfdpoj5k2W8OUnoLbDlsmMgUbOvEgcqHFTM6DE9CAWmBIVmIfI8KlrCgz0X7DlOLrd5t6tOzxd081a6uJ/wzMk7u2ltbOr2HVxS0Pp/LtYGyrvmpI8QYHw0SFRSMl8DNanVu9zD/G2t3QwuyYDjncfoeGNC44sDD4PoZ13gqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZiL4fmSjoQKxMDseob4ZgQKACavJbHWaR+uTtweXJ8=;
 b=CbL9lb2l9d0i+09+i9B/EHwAImopEa8u5a1m067Xg9P3xuh9+UnhlTznVYidOBgMHe3+IAvnvdZePl7ngVVKviCqxjPQUM/1ln2jGFqNzLjSU5qdCHv+hPmPNRVcSpt4H+cz7zG3nDtcwZSd2GZR5GEu5iuRpSCebGuueloeuGU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=sigmatek.at;
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com (2603:10a6:208:d4::14)
 by AM0PR08MB5490.eurprd08.prod.outlook.com (2603:10a6:208:184::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 09:50:23 +0000
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::2427:aa74:d67d:7072]) by AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::2427:aa74:d67d:7072%5]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 09:50:23 +0000
From: "Christian Perkonig" <christian.perkonig@sigmatek.at>
To: openembedded-core@lists.openembedded.org
CC: Christian Perkonig <christian.perkonig@sigmatek.at>
Subject: [PATCH 2/2] meson: set correct cpu and cpu-family for multilib SDKs
Date: Fri, 18 Sep 2020 11:50:04 +0200
Message-ID: <20200918095004.34894-2-christian.perkonig@sigmatek.at>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
References: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
X-ClientProxiedBy: VI1PR07CA0167.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::15) To AM0PR08MB3443.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::14)
Return-Path: christian.perkonig@sigmatek.at
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from LWIUB005.wien.sigaut.org (217.175.200.226) by VI1PR07CA0167.eurprd07.prod.outlook.com (2603:10a6:802:3e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.7 via Frontend Transport; Fri, 18 Sep 2020 09:50:23 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [217.175.200.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b3d1b8c-a6f1-4ef8-c7e1-08d85bb8434f
X-MS-TrafficTypeDiagnostic: AM0PR08MB5490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB549056AC489033FCD7106949963F0@AM0PR08MB5490.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H3K6F/bTQ5Cs/SgKplNk0s4LBenOj5yJoaDjQ4m7Dy+r1+9rVy+NU0HHZf/Wb+8RVZhMQjdppgrG0fGQemEhRRRYk2FXuWGavBFeHxL8FjY9F+SsOvrKFKHV5sfhK3E6HELeO9REPYp9Uihwb/0PdELXLdzxtfWG01kyBYxx+ArP+ScJpHgpkcsC2dQHlEC1b2e9OsbBKaS1IdN19CZ42sH3n+wADG/gokmvtawdK7gZkcTuYj3l3La/UV3h6Fr4zN34luvX4jYvlLGdZG9NiIuc3lMPZcwKj86r8oVvOa7HT16+fwhXSjRqc+0diQ2DfIO8OKgJc1V3/FC6iWk13w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3443.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39840400004)(376002)(346002)(8676002)(8936002)(5660300002)(478600001)(6666004)(36756003)(1076003)(6916009)(6486002)(66476007)(186003)(6512007)(86362001)(66946007)(66556008)(26005)(316002)(107886003)(956004)(2616005)(2906002)(44832011)(52116002)(4326008)(16526019)(6506007)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	y5p9x9O6GUYONLbLqW9oJ1Nn3bCdHYvKRh1HIB9bciWw2ptlzRiKRPvYgiKN8zoY+LVmeP5NHLFZZ7Kf+BfJlpv2epr63GYlH5Omy/IWeoL3ffaA1Ctj6tccGM/ZpgCiYaVMCsWXXJly3e4+FDZzTzIIb9F5sYpoEqJA17uhB8P0WJ1Jqm9T3wniBL0ZNR6fA6z4QQlGmSUfMZh85ePwvk5wF1T2b/L720bXD2gnqGHQf4E3WK/d4LHqGzDUFv5kvteA4Y8huCfaxoZSJnBluEUD1e6O4qqoXplgKB/GHfmIoWkf8UDARmxWA7b9SVLZOT3GGwJFNJCh/g92N+VeRE3JYE5e5LJJGO+5F5ScfmFnxINrNPR1sUl10aaP9JiC9vBDtsM8TOWuy8mrjKZjRWADrutw2XM1YTzRymQN48WHD0mmELSqKy0MwAb5X7MlBxds1WKSgHkb0rVyNAcLsyVGyCd7MxZnyJ2naylbIE17DzEZ7Yc5V+/n1X20yqCDJ2Sw7Z2fc9MGY/Hlhn1MmT35lgEYvSkbQEnN9iXIYBtoexcqevTOWpp4idLlL5uesFI+SkeKMkrIvNYc3Y3A47N0q4MQS03d2+Ajq7VS+MRjX5rMCeHhn1tMsibvStCR02B3hj/JpEdXearMHEz+Pg==
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3d1b8c-a6f1-4ef8-c7e1-08d85bb8434f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3443.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 09:50:23.5546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwJ2Xd+vMpj4V22Sott39C7khlnsLkOAShc6jME1gfTrdZgp9YgueOhUcblJdZZpOED+55oP3USqAN1esuQAN4W6v6kaB9Ww4Er0a2jf30Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5490
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

meson use to cross compile a cross-file. This file is special for
every build environment. So if you have a multilib SDK for aarch64
and arm the cpu_family and the cpu variable in the [HOST]-section
of the cross-file must be set correctly.

Currently these variables are statically set to TARGET_ARCH during
generation of the meson.cross.template file. Now the post-relocate
scripts sets these variable for every environment.

Signed-off-by: Christian Perkonig <christian.perkonig@sigmatek.at>
---
 meta/recipes-devtools/meson/meson/meson-setup.py      | 11 ++++++++++-
 meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb |  8 +++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipe=
s-devtools/meson/meson/meson-setup.py
index 808e2a062f..a6b716c731 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -7,6 +7,10 @@ import sys
 class Template(string.Template):
     delimiter =3D "@"
=20
+
+class TemplateSingle(string.Template):
+    delimiter =3D "@@"
+
 class Environ():
     def __getitem__(self, name):
         val =3D os.environ[name]
@@ -15,6 +19,10 @@ class Environ():
         val =3D '[%s]' % val
         return val
=20
+class SingleEnv():
+    def __getitem__(self, name):
+        return '%s' % os.environ[name]
+
 try:
     sysroot =3D os.environ['OECORE_NATIVE_SYSROOT']
 except KeyError:
@@ -26,6 +34,7 @@ cross_file =3D os.path.join(sysroot, 'usr/share/meson/%sm=
eson.cross' % os.environ[
=20
 with open(template_file) as in_file:
     template =3D in_file.read()
-    output =3D Template(template).substitute(Environ())
+    s =3D TemplateSingle(template).substitute(SingleEnv())
+    output =3D Template(s).substitute(Environ())
     with open(cross_file, "w") as out_file:
         out_file.write(output)
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb b/meta/r=
ecipes-devtools/meson/nativesdk-meson_0.55.1.bb
index 3c8c4fbc37..67fdd2235d 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
@@ -30,6 +30,7 @@ c =3D @CC
 cpp =3D @CXX
 ar =3D @AR
 nm =3D @NM
+ld =3D @LD
 strip =3D @STRIP
 pkgconfig =3D 'pkg-config'
=20
@@ -40,10 +41,11 @@ c_link_args =3D @LDFLAGS
 cpp_args =3D @CPPFLAGS
 cpp_link_args =3D @LDFLAGS
=20
+# Host configuration form the meson point of view=20
 [host_machine]
-system =3D '${SDK_OS}'
-cpu_family =3D '${SDK_ARCH}'
-cpu =3D '${SDK_ARCH}'
+system =3D '${TARGET_OS}'
+cpu_family =3D '@@ARCH'
+cpu =3D '@@OECORE_TARGET_ARCH'
 endian =3D '${@meson_endian("SDK", d)}'
 EOF
=20
--=20
2.25.1

