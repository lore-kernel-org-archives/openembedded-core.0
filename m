Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.89])
 by mx.groups.io with SMTP id smtpd.web09.10765.1609748023147797457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 00:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AKyJ5yKY;
 spf=pass (domain: windriver.com, ip: 40.107.93.89, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkCfjlpc9mXAV8hcn+7ZLtnz5p2x5TCZ94oqCAqMXFZUdDrAOyNon2va4M78jjLeuDVliaGOzK6mASCr6JgvcjrN+Lb7WRD2ETYlfCowQ4z9LKMz5HXd8ljjfRRLzcN72OVMm8u6JK6+0zmYUA14qw1LqfZqkvQ1QgTHXeLhfovlLojtrX66nqLo+u8WLHLRbRh268/3moABg/CPJuvXCq6mVPdl/BlGrJ6+8H2mIvWi+VlsEerpCljTQbBaqtWMxhf7OhbhIbFdRTOQisySWIKrqHFhlb6DhyEnVHLev2eyBHQnunG/GA8oCzua0h1xET8r5MTiI9UFGglJNggDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n3WhCcm0+ZJef1tpi2Vfsh8M51sZd1CArGnA+Gfj0k=;
 b=eIm3tghHRRt3GcSXKPt+gbqNvo6oQdEiYfQ6Go5ITza5jZXi6hGWvAV8GGvU0rbp2hR12THWqSiszWjvzzz79E2/xpI/VEzC8S+KhvgrqJ03Mqq0Rpdk/k0H0Yx7okz+XUghTf04m8gyLMpecOaqIcCtOpVyAj+dXLJjfc7FiiOaGzgOHYBbiQY1/ai6bfPxtk/lBV/4wJP4zMBiICRMQLX8oXAlEeI+wFonj3Ef5WTwdnGymjNG642Md3L3xL/9+suHrj17ZIz/9GdXRNr3tlPVCSy9sjWLZdBgd5fjIKVxmzgRDkTZV6UsDUW3sgmg4CTrdiw9Yb7TLw/yIpTrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n3WhCcm0+ZJef1tpi2Vfsh8M51sZd1CArGnA+Gfj0k=;
 b=AKyJ5yKYqGpSWk/Qkpv8vjxOi6CkG5oZn1t2u8wp/qz6vQWG9dl1UsecIFj6g1FhU2YhVaBdUSSaib1EyAJz6l+VmcioEqyG6O3hn/4vLonZRDQPmH/3xrnDukvHaQFhTd6Mr7pcQ4Dpy1nfp0MjdSEehsM1+i0RyXHeCI1cfpY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 08:13:40 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 08:13:40 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: support for building nativesdk of mingw
Date: Mon,  4 Jan 2021 16:13:24 +0800
Message-Id: <20210104081324.32745-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTXPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::28) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTXPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 08:13:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b3c1d8-b09f-4a0b-b75c-08d8b088a53b
X-MS-TrafficTypeDiagnostic: SA2PR11MB5148:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5148846D5DC935C87771EE1782D20@SA2PR11MB5148.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3ALhz6FRYplM38zpM1hrg5VwiFyCm7y2UHyJZBkhl1Du9BuV0TgS/b6hkrio4Jm7ha9zAaPJd9Z9iBmL0dSEjEKVpGl5DaoBigytmimYWKDvSfmjBvm6rStBZOyThpugzCtZ/UboUi78XZQhNyd6z0Q9BbZskHhAWjSd5lzgLPcHubiY8omrbrwIh8xh7iY3Bo56fuKx2SHNv2hdNoAUPv0NDhUGVchcJh5nNf+RhkwfSadKSFhhrqKWdP46GWG/KN1Fl0WMBSO1VzpfE6drDmMqJXLciO8QXM1YpDoxFsS83IozsTl/WkQqRVhhzw5+3A47gnNARhFLpMVsNYCsCC813ImurUaFUCzRa5KP3C20cWbNWPEnMFAWiKev/DN97cpeorQSjGY8AjgjJQAlxhp6MgZSbolZbe78Q+TY2+98DqWTlHQwmg42jAbEQSH35Uy9Dp74AMDz691UDpBk/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(6916009)(36756003)(16526019)(186003)(2616005)(26005)(86362001)(6506007)(44832011)(956004)(66946007)(66556008)(66476007)(1076003)(8936002)(6486002)(6512007)(478600001)(83380400001)(6666004)(2906002)(8676002)(52116002)(316002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?5rRbisyYt217gyNxmwivzntS82A00UgI/KvTI7yVnKYldYsjLXt0JULEAxRw?=
 =?us-ascii?Q?aaqRBHWb1uYv7GZKCgjVBa3Jim1h6vfvJtll8wsuxiy5sVUrzBhGtrg+ztVh?=
 =?us-ascii?Q?Bloe1mN3QRTgQ2uAEWgXEIXT4jLVd3qJtiuSgpGK4rJpMLnTqlZyNSjfczO6?=
 =?us-ascii?Q?qt2BuFMVlhJpcyBiIJgWoAnZi5ZNUB+2KXUhfUYMWdi//8zdiOVGXdAGQKjc?=
 =?us-ascii?Q?MWmdvHTVBfdx4g+ti+0DqoDvc3FXXYVhgufFj18nNy4Yd1rBpq+yBkD+4njY?=
 =?us-ascii?Q?gv6iynB4p0+06hrXnKm/3f9dNZ+54eTJBGMnwLNjvvQXB1lnkhpCUo0zfp+K?=
 =?us-ascii?Q?6PrNYI0Q5KYdF/Z5nR7AnLDx6IliGt0O9VRLlaKdnCMQvE6TOwtRRXJJG235?=
 =?us-ascii?Q?no7e0Eon8NvVlUcrPu8kYmwXILAYWPsr02Ofgv+bejGuHHYZrTv2se8DsJKI?=
 =?us-ascii?Q?O0ZQFyFSl02qqxi2i8EY4Jhj8sGUbHSikri9Wc32hE6dQ92vZSBEilVSI62Y?=
 =?us-ascii?Q?TWrC3yRE98i2QVyY0lkaq5/3eURdsjRY7uixzU3lknp3hDC0ZYVoUPdfjJEw?=
 =?us-ascii?Q?07h96QK9HiokGP7BvHq+ddk24Tt88ipHMASSZyDdw1DQrdFa0sJpoexmX6tW?=
 =?us-ascii?Q?89F4G/cow6zGqYhZDg9rw7mAp59ufv8TRVBgaaK9jNZwOt7vfBZmvC2eqVX3?=
 =?us-ascii?Q?oGU8I435CmYo0BK0rBxbkDczJQnVpsxP7rOx1MhKPY2G//l2JuRn41JPtxeV?=
 =?us-ascii?Q?m+3qH0Zx9s4rOcXA2xIkGGQKtjBUM6HLHEfETLDgKwTSOjtKa/lpm6p9oTYn?=
 =?us-ascii?Q?eXWGcy1hZfDeRunRh2wd34ZAyLxDPQb/ZCw4YtQNxgshp5BsCVasyO2UKAoQ?=
 =?us-ascii?Q?25OzQWNGi6rZDocdJEgkekbMArrcJpgdisvNg4ur8X5ipK5cb97wbRhteLEN?=
 =?us-ascii?Q?lx0MUDZevZCIsUUT9Yb83/npvRqiRyhiXYFGTne9jIya0ad6GIv+ZjqdCK9m?=
 =?us-ascii?Q?JXL0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 08:13:40.5810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b3c1d8-b09f-4a0b-b75c-08d8b088a53b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6wxMeU8/utVh7QCYKftyDFdr+aCPJ/FdGtWAHKegfiO/B57hGCUBDsOXg1mfeLxOuHNEwo4CLqSV6cyllbzSIcHDPvF+HV8TxwoKb4kaCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
Content-Type: text/plain

* add support for mingw32
* Engines are installed in a slightly different path, which is
  urgly, patch it to make the path shorter

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ile.tmpl-don-t-add-prefix-for-libdir.patch | 32 +++++++++++++++++++
 .../openssl/openssl_1.1.1i.bb                 |  9 ++++--
 2 files changed, 39 insertions(+), 2 deletions(-)
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
index c63ba3c8e7..9465166ab1 100644
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
-- 
2.17.1

