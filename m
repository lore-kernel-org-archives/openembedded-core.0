Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.75])
 by mx.groups.io with SMTP id smtpd.web08.643.1605901927612973160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 11:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OBzGRvh2;
 spf=pass (domain: windriver.com, ip: 40.107.237.75, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCNLohWlRaLNWjgQ6u+R1+WYmuadNof40kQXO9ptl6uXRdOgzVcfr6fQYtdNKVhOi5tNxtyVwHa8alUpAkWKJzCakChc8Z0UoaLVtWY+WZpTxyxrR0oQ/ZIs5RmTSNKkS+XTI1FIvWOmmqnF132Ry2m+JIWUcttoU9Bzr734rQYjDCWZ8DotxhwKLH3YCinftLcBlUhuiCkTpCPGxjiE1sA586YpXxVQW2loaAjcGgh3uMSE0e3ygnf1ivBesQfMAJcVCnMIJ7dL5161jO7ulTanYrGl+Riu5C7NccpzIysjxeT+oRutRaqiXY5c1Y4IMKiQXWgixmB/pPb95gAQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TSwl+I87ad2qIdXRmn3qwDIjCMnZBF9LqQv6zv2NRI=;
 b=cjj9fTVTPZ3AKalgOFv/HBmRynmj0IbLV/FP4Mod4X0HRutropnAcQAr8zD0d5HkB70N7ax44bRvBp7kwc1EE79CDBmXfKtEAXbLr6gEewwAjasuH3Fvn8bvoLmY/ARKmzEJNiNhq5VVXe5NUMpYIs5LRoewN1ZUscgssTSYjzxDptE+7Wywo5oa4BlkK6IA633kc5Lsqv/4dvXReBqImd2Ur7K9Ag9nSFdalwtOT1Q24KzBYWF4qIiHNaS+j4a6E/Ckhjn35AC5A7yK+JfF6HVHMnpBiDjbPSqaHixDwDjoV7QzqeozE7BpOIwk9znjH5AJ5k7WEm4Vl/vm0MFo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TSwl+I87ad2qIdXRmn3qwDIjCMnZBF9LqQv6zv2NRI=;
 b=OBzGRvh2D7LSRsqs2ZqMSlrzWKxkNpbPjNpgatL5jaWaERrhK8lZ0hFF/b/qW64BG+SroIWSLmkrurFg4unRkGRc5SIDUn3GHQX+DIedPIke0d2txXH5wVoJtmr9bQMBVdu5WUHppyGjuAMt50b7Qh+cwEd2OOM4k2gkQJpS9R8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Fri, 20 Nov
 2020 19:52:05 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9%6]) with mapi id 15.20.3499.034; Fri, 20 Nov 2020
 19:52:05 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: helgrind: Intercept libc functions
Date: Fri, 20 Nov 2020 11:51:55 -0800
Message-Id: <20201120195155.18584-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To BYAPR11MB3127.namprd11.prod.outlook.com
 (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR13CA0065.namprd13.prod.outlook.com (2603:10b6:a03:2c4::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 19:52:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce3a7151-b566-43eb-4492-08d88d8dc1b0
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5055:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5055E9CC0936AD15240EE81EFDFF0@SJ0PR11MB5055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PS1tZvqZ+r++HQZoCXTjkN2P8LMXRllQsZJSITuzRLCPpOWxVSN+SluwQ4im2dCr6uytn+BQQLGnShkQOv1hsi6NmSuTa9Z1+A+y4ytf2BE9TxZdkVPpTkvOVwb+Rv1BqVI4sM0vMnhPV+ZE5vAvjRy8AbTdCf4NTSjVgBt6CoWtSeWRG98LSbkEP+IlcejGw9+w/JnNvPb7/OBMz+JZE0IZecjQ+7cbFWs5t/C6i9x2cSrWawgVXDYZmRZeFuHh+qyqjRFb2C2i8v86C17xv2qgOaFU05ZY57mOkM3rWbv9p8KMU7W7g35w4B1fDuoI3NwqSajPbz4WOx0SZl2dEqQl/67ad6xSe55xIZXXOPqVVhxhG0HsjMWUMxMw+P7bDHY4HiGbPUAFqzQjGpV79m30l+2WXvPMEB8W+6dKbF++f3BOE20JZ6kwtue/952PhiDQriRrYTLsUqXj4rqgag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(366004)(376002)(8676002)(8936002)(966005)(6916009)(478600001)(6506007)(52116002)(26005)(16526019)(186003)(86362001)(83380400001)(6512007)(6486002)(316002)(66476007)(66946007)(66556008)(2906002)(36756003)(6666004)(1076003)(5660300002)(44832011)(2616005)(956004)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vmjRIAp4CJIB9eN4Jnea83YutZQFTBpaDclM/chzddRh+dEMslfrr1L6cN6qmaI2oqdE/Zg3f2YlpDE+dW2BkvpnXQAYrC8zYWyBJzHsHJVBOk/u3E4b9WmmhokK3p5RC7lRNW7sMQFqGlC2fuX7/Q1//0z35xXx2GP3jN5h1f3I8AWWg4wrz0NLpZBRu5mwj3jJPBnZWXOtTtW1cHmR1s5Jv0jAZKDLjQEh1OtZA1HQUYB2Et6l5sjrXF6kI9c/A7SlnPvOvok05izAJDbMvHFiHKgYwPPiFGjUv4lzFfhsB6MrgM34J0asuBnezbCSbN4u6Ngljvp/taieO3EPXV88L+6ARBCmvhzR4iFEuSMzZLpBvPFdyDS3Dd3KsHEYeD4m3EloUgf2W6XWxduw7IeQgYpZNVsh86CDKzRYyeWjsGtkyzp+1Qs9+sKC/VFZW8zNTT/5KxHgjRhtZhni4iFSPQvGa0aAQVrSwb6sCRykbgsBmBzjLSkw+wVAFrQgVDAYnNcGQhMafF7R4lQhTotcvZ8BcckXHM0Kh7vVTQ+icfdGEDBm9e4clg2OyyjWwU5FtfV43XM3UhO2EVXj8CyY1rDeMm2yAcMsLaT3kNZF6FfRH0YNF42ng4TUWW5bona8SECvtKYMa+AMvrBkuQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3a7151-b566-43eb-4492-08d88d8dc1b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 19:52:05.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScbPNBojkkcpxseopqDsed/KcIAxfJgqV9biBGlCEHSPK8ku46awUnSB1X3tEqgLfNdBpWWLBiJLGzdm6TTK4SLXQ8dfKACoSXGnPvcyrP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
Content-Type: text/plain

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

PTH_FUNC definition needs to be modified in order to
intercept posix thread functions in both libc and libpthread.
In order to handle this in helgrind, weak alias the pthread functions in glibc.
Include a special case for musl.

See https://bugs.kde.org/show_bug.cgi?id=428909 for additional
discussion.

Upstream-Status: Submitted

Signed-off-by: Paul Floyd <paulf@free.fr>
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 ...01-helgrind-Intercept-libc-functions.patch | 54 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
new file mode 100644
index 0000000000..f66df3d2d2
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
@@ -0,0 +1,54 @@
+From cdec010444df5a4328e90d07a2024fdeefcc74b5 Mon Sep 17 00:00:00 2001
+From: Paul Floyd <paulf@free.fr>
+Date: Wed, 18 Nov 2020 12:49:20 -0400
+Subject: [PATCH] helgrind: Intercept libc functions
+
+PTH_FUNC definition needs to be modified in order to
+intercept posix thread functions in both libc and
+libpthread. In order to handle this in helgrind, weak alias
+the pthread functions in glibc.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Paul Floyd <paulf@free.fr>
+Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
+---
+ helgrind/hg_intercepts.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/helgrind/hg_intercepts.c b/helgrind/hg_intercepts.c
+index a10c3a4a3..316140ca6 100644
+--- a/helgrind/hg_intercepts.c
++++ b/helgrind/hg_intercepts.c
+@@ -77,6 +77,11 @@
+ /*---                                                          ---*/
+ /*----------------------------------------------------------------*/
+ 
++#define hg_expand(tok) #tok
++#define hg_str(tok) hg_expand(tok)
++# define hg_weak_alias(name, aliasname) \
++  extern __typeof (name) aliasname __attribute__ ((weak, alias(hg_str(name))))
++
+ #if defined(VGO_solaris)
+ /* On Solaris, libpthread is just a filter library on top of libc.
+  * Threading and synchronization functions in runtime linker are not
+@@ -91,9 +96,16 @@
+ #define CREQ_PTHREAD_T Word
+ #define SEM_ERROR ret
+ #else
++#ifdef MUSL_LIBC
++#define PTH_FUNC(ret_ty, f, args...) \
++   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
++   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
++#else
+ #define PTH_FUNC(ret_ty, f, args...) \
+    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
++   hg_weak_alias(I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f), I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBC_SONAME,f)); \
+    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
++#endif
+ #define CREQ_PTHREAD_T pthread_t
+ #define SEM_ERROR errno
+ #endif /* VGO_solaris */
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index bcba55f327..5db181ac14 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-drd-Port-to-Fedora-33.patch \
            file://0001-drd-musl-fix.patch \
+           file://0001-helgrind-Intercept-libc-functions.patch \
            "
 SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
-- 
2.17.1

