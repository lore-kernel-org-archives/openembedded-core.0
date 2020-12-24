Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.70])
 by mx.groups.io with SMTP id smtpd.web11.8097.1608795769294400960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 23:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=j16AxohV;
 spf=pass (domain: windriver.com, ip: 40.107.76.70, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZX4qBHTxzo3kxDp8+3DUCGnvStPBE94yd6qRBLionlBrNQEXAIGW+TaqgyUb9Q/8/Ul7NJgJcFLnlEy+J4a0SKBupp32WVzOjposl39ijb3GlJjzgdrSP4nPPJTA2XA9PzSt+q4LNA/zV66Y11LiIFKXtcXXA30V6Ew50u+TZ7puyQ/QDXhZcvcSY2dqdcyC9lp1lBnpDNV/unrNIADIsGNa9NEx1lTUqQbj0aCrFefeY/zIpy8YF4/3Qrtg4evv7y9OR7YNlHH9WouWQ8KKQTYVyZ820qbfLHA/+qGhjpichspdVgx/Ue4XRly5d/UHv0VC1of+7FI73Wt9zOdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha/Ba6wLGzzWvctE52zAySqzquaq/gc5DlxOgH2FMno=;
 b=SZs9moIku5zhuBAVp6fMmHDSwHSPIQpTenLf/CZTdgGsrXPtKHUaFAp+qCS/fhhx8m+eU8Qc0zECxj9pwfWzND762X8IKhrXbzq3d67Nk16NTxtszaqGuQjgk/TgNdvLdeXoMJUumiCVTjbq80hLkO08UFkQNt9vfA3iIb7Lu9Wxjn4p4lhOo5yh7mh3XAgyWFeSs+SY0n4s4CTyr12xXSgiz2PMRR8DJtFcv7Ie4WNPdvPlSWrdwPWpju5X09gDSXCVFKXXg3BGx+hj/PxQkj73+80uBXvpsbM1nzivAUfuKQd52+yJZCHW+dss7/zcnmXieBScMXyOMgrzg9qn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha/Ba6wLGzzWvctE52zAySqzquaq/gc5DlxOgH2FMno=;
 b=j16AxohVXQZnGtvnZPYdsh9YHoPd3Is5YJxUmcfjh97a7LQGsyjjsQ2kLqp7eXGS+NL3bQpginEhTeA1grkk4s+byYLXKVoMdXFgvkvY4qLz4umKXjhKHTzMLJJGG4rugzLmIJKcvAnlUXkrCVuTgeOSzx28CcpyHjnFwnVBA7Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Thu, 24 Dec
 2020 07:42:46 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::106d:2efa:3adc:3bea]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::106d:2efa:3adc:3bea%4]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 07:42:46 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: support for building nativesdk of mingw
Date: Thu, 24 Dec 2020 15:41:48 +0800
Message-Id: <20201224074148.10007-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0011.apcprd03.prod.outlook.com
 (2603:1096:202::21) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0302CA0011.apcprd03.prod.outlook.com (2603:1096:202::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.13 via Frontend Transport; Thu, 24 Dec 2020 07:42:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5dfca9c-eb21-4259-1203-08d8a7df815d
X-MS-TrafficTypeDiagnostic: SA0PR11MB4685:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB46850E6A1514AD15D802D52382DD0@SA0PR11MB4685.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ZUl3VIo3d+CWoO9S0SYOcRO2sqt80c9T46sz7C+CIKLTpa7AJSpNGOg0hCPv0hR1BsDfXNsNHc88IRHzXV2xAr8jwi/gbISQfx4SvQft24zJmP0+HxXuRgBL/fS/dmjhmzIV/32F56u08yTWK3+g9p7N5b7oEdYm2PCNTyDKOToVxo+12IaJNWJOCT0XdBYIcFID2ZP3Dz8MlGCufstf+pN8FVNJLODGMvTiDBrl62jnHGtI7FNQrJBI3iw1pT11OV+p/1i3B8P89x1kPhrrR6Sq7pGZ24Y3iCf7u03XENLVQzB9PlxpDxJlGwFARaKVpWzboALcAtCZBOv8Xb00pfawBhk3K/drOO+Bl0tdvDXFNH/xIRfN0KSg6V21K1fqLVYM0etkBjHpDI3OwwBdxrQffRXyZEt/CHri/gZ9TJoK8P696bN0s25wRvilKLVQLEzKp/JvyLJLW2OErLpDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(346002)(396003)(366004)(186003)(52116002)(2906002)(478600001)(86362001)(1076003)(16526019)(26005)(6506007)(5660300002)(83380400001)(66476007)(316002)(66556008)(66946007)(2616005)(44832011)(956004)(8936002)(6512007)(8676002)(6916009)(36756003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?vV8CtWSk9lqYpYHrxNaen6/8Ew2ItSRoVk0osorFcudmzWIDLehSUQXdw2wE?=
 =?us-ascii?Q?J+R8VZfyS+4/3uTD7ektp/2AgGv76BTfZtwA4Uh880zQ/3SsNHRLbM4EYC6f?=
 =?us-ascii?Q?b+XIn1SrO4PlxgPaqDhsWzYINLLftLmmh91+MVX4LRT3u/5+hiarWCzdMs4Q?=
 =?us-ascii?Q?A1Mo8gA6xsZrdYHRPFlSQMbdgMmNA+xRTLbTHrIxtdDGwzhaxrTkwgNSbprH?=
 =?us-ascii?Q?8Jjp8YIynV6jzQvb0yc4MeeWX8bXJMjDwQP0EZYnw8+wSE3lIIW7VmYG2IGu?=
 =?us-ascii?Q?f34/ByUYnjq6VSVgalatT1J8BTi7XX0r1/dp1eyDnIgM3+3l15ptm6ThWxZW?=
 =?us-ascii?Q?V1jH8H1QTkWfeNpap7VPekXghjIxIHgkeYIsAW4o50VQXC+qy56IHbJ+vtm5?=
 =?us-ascii?Q?akLzJlz2+VnhsVDllsa5UOWjfI1FZPIJFJs6KZZD4BHiZUO1Tr8DNnmF2430?=
 =?us-ascii?Q?xJKIDZ/s+5sSjsWm3WWZ3+8gbguUgG3O/yV/kehtopOama2VptQvYnF96tLl?=
 =?us-ascii?Q?vZaRFySPokeG+fuRT28y6oGA7vY9sJzwwtu9py4ImZTnI4dlvQHRAiYT/Feo?=
 =?us-ascii?Q?ZMGBibPbeoE7bAM8spbYomflQrIdaIdJ1aHKzYQ0g40qy6rT/9KXiZAWFKyI?=
 =?us-ascii?Q?b6aFoY/nUdwxCzCFo1tM5OeolZZJ/QZ/bF+KqsSo6YyLpXy0/4xFFXyqZO5M?=
 =?us-ascii?Q?TF+wt/naRh6ilJM/FE4syJTLOdRGgoM43HeNHb2dMtNz2X0MXGWcIzncvt+r?=
 =?us-ascii?Q?pex8m7E/foOE36YC60Uzi5Tf/yFC8dZAgHSCxnGz/iKyoNe/vPil20x2fagz?=
 =?us-ascii?Q?MvhS0vACkGEIWZ35fkC9/wl9ZmVL2dOcemJw7mRw+xzE/DdmtjxCg3TUCBjG?=
 =?us-ascii?Q?3wF9dOMYLqLlUq0mfMWglVfbKp/+OoYIdZroEaHK5ocqICz6esV+yKeTSXmK?=
 =?us-ascii?Q?6dexZCk0+0xWyYzt3vXPuvdJ/nY3g4SRFrpECc2d2tCTv6hElUzMOyAoSZXV?=
 =?us-ascii?Q?jkjS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 07:42:46.0792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dfca9c-eb21-4259-1203-08d8a7df815d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aJ200wBxHXXGUZGjQZ6SICk+oVIbLM1kIZVz7WGXEXIduKM+JTdgUjDvs1PKMlQMug1pyWoOqtft6m1ZGSpfE/5/kub9HEfqDg+FQnTSmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
Content-Type: text/plain

* add support for mingw32
* Engines are installed in a slightly different path, which is
  urgly, patch it to make the path shorter
* since commit 	70da1f956bfbb627691c47eba7451182aca758e3
  'openssl: Add c_rehash to misc package and add perl runtime dependency'

  package openssl-misc have dependency on perl, and perl then
  have depenency on another 3 recipes, db/gdbm/libxcrypt, which
  don't support mingw well, so workaround by don't support
  c_rehash.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ile.tmpl-don-t-add-prefix-for-libdir.patch | 32 +++++++++++++++++++
 .../openssl/openssl_1.1.1i.bb                 | 10 ++++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/files/0001-unix-Makefile.tmpl-don-t-add-prefix-for-libdir.patch

diff --git a/meta/recipes-connectivity/openssl/files/0001-unix-Makefile.tmpl-don-t-add-prefix-for-libdir.patch b/meta/recipes-connectivity/openssl/files/0001-unix-Makefile.tmpl-don-t-add-prefix-for-libdir.patch
new file mode 100644
index 0000000000..028431b1b2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/files/0001-unix-Makefile.tmpl-don-t-add-prefix-for-libdir.patch
@@ -0,0 +1,32 @@
+From 8fe5c9421acfaff35b637e7ad55d1df598bb7081 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 22 Dec 2020 09:22:10 +0800
+Subject: [PATCH] unix-Makefile.tmpl: don't add prefix for libdir
+
+we pass libdir to Configure, don't use prefix again to
+avoid engineer dir set to:
+/opt/poky/3.2+snapshot/sysroots/x86_64-w64-mingw32/usr/opt/poky/3.2+snapshot/sysroots/x86_64-w64-mingw32/usr/lib/engines-1_1
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Configurations/unix-Makefile.tmpl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index bbafb98..eecb63e 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -244,7 +244,7 @@ LIBDIR={- our $libdir = $config{libdir} || "lib";
+           File::Spec::Win32->file_name_is_absolute($libdir) ? "" : $libdir -}
+ ENGINESDIR_dev={- use File::Spec::Win32;
+                   our $enginesdir =
+-                      File::Spec::Win32->catdir($prefix,$libdir,
++                      File::Spec::Win32->catdir($libdir,
+                                                 "engines-$sover_dirname");
+                   our ($enginesdir_dev, $enginesdir_dir, $enginesdir_file) =
+                       File::Spec::Win32->splitpath($enginesdir, 1);
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index c63ba3c8e7..7470c6978e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -22,6 +22,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
+SRC_URI_append_mingw32_class-nativesdk = " \
+           file://0001-unix-Makefile.tmpl-don-t-add-prefix-for-libdir.patch \
+           "
 
 SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
 
@@ -116,6 +119,9 @@ do_configure () {
 	mingw32-x86_64)
 		target=mingw64
 		;;
+	mingw32-i686)
+		target=mingw
+		;;
 	esac
 
 	useprefix=${prefix}
@@ -198,8 +204,7 @@ FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
                       ${libdir}/ssl-1.1/openssl.cnf* \
                       "
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-# ${prefix} comes from what we pass into --prefix at configure time (which is used for INSTALLTOP)
-FILES_${PN}-engines_append_mingw32_class-nativesdk = " ${prefix}${libdir}/engines-1_1"
+FILES_${PN}-engines_mingw32_class-nativesdk = "${libdir}/engines-1_1"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
@@ -208,6 +213,7 @@ CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-misc = "perl"
+RDEPENDS_${PN}-misc_remove_mingw32_class-nativesdk = "perl"
 RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
 
 RDEPENDS_${PN}-bin += "openssl-conf"
-- 
2.17.1

