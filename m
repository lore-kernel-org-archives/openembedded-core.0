Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.44])
 by mx.groups.io with SMTP id smtpd.web12.13653.1602600281818728851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 07:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cVVcgqT6;
 spf=pass (domain: windriver.com, ip: 40.107.76.44, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8CJU/GV6S+AVCPDLOKaHLYajpxoYiNWxquTZQOtytH3eD60yGL71KA1DLskAiZrPe2dBPQ8hJY1j31a0SkMGYG1n9QBgTnGCQOvzVYyOwFKZOltI/F4wcK6KYg1wJyjV6/G9cV4ncHmJ4eT2Kz0zxOfcOjLy5TJRwpcYc+NfOerdx2GVFsf+NGwUFjQSwFWdMVZqVI6QPxJMhO8bzSInaLGqZ2i5p5BiK76whmwhGxYMDOQ9Tv8IyKV9SIIugZ4Z8cvnbplJ3wMfzZCpC7ew99kKgpcJ0sg/tuJIm/3kEI7Y0mJ+hmJZb4Pj0MhNKk6uW5QEUxnl4nbJXSSCG7Egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fcz331yvhBHWHVoPIDQTLAh+9Prk+H6+DxSgBRahuc=;
 b=R5YEunIreX3XYfHaWRtYFgKtLea74qpNrWOj6VhUixnBLWd9HcT8ECnOxQu4lvo/gKP0b4oAMrKQ1Q8uiDdCb2PIw1Mo5lhZeERk2WU7jF7jCr7eACMYkyJmEotjYHw6b7eIxRuMlklVirixtdG+X0O5Q8oNuEUook+FQT4G95zapOUci05iv+/9ILV+Ird3Xs9myC/q+4ITMb7PLIWjUHlZw4vJhUfOJqgPtRFGocOusIYjIa69t0Cz/wcDYAZVmTQSpFIevgr0vqIrkl9L21BvbIWWSNDsGN+1sW7E15wU1VOZ2R9Rr/hEms8tNeaU7gOWCVRWJ+ZRPUlclDxQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fcz331yvhBHWHVoPIDQTLAh+9Prk+H6+DxSgBRahuc=;
 b=cVVcgqT6vaOftkx5nIAhXSKlWcPLyvIOkoXtxPyaPgVOzlHRWncp/eYTvIpwRRpjcuZjq9hcSzIWJGfgrW/c8f4azVDkY3F0tzkZ6DMV6O5pcswY/Q3Qe7ZcqKwxdo46OWVZkEmkYYCBG0DlF3lgsU/5P4Mm6wsiSzFAaFfpdWY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by BY5PR11MB4417.namprd11.prod.outlook.com (2603:10b6:a03:1c0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Tue, 13 Oct
 2020 14:44:40 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94%4]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 14:44:40 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: drd: fix pthread intercept test failures
Date: Tue, 13 Oct 2020 10:44:26 -0400
Message-ID: <20201013144426.888835-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::30) To BYAPR11MB3127.namprd11.prod.outlook.com
 (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-sgaikova-lx.wrs.com (128.224.252.2) by YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Tue, 13 Oct 2020 14:44:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05b8f77a-3fa1-46ca-64a7-08d86f86839b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4417:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4417385D71053953F4C4C0CFFD040@BY5PR11MB4417.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DJJrzTBDCYeFsc29RGqGR5hS3aMbojjgTAPIf5jqsbn0OxvIkwW6mR5fR+EAX+sD5D9wXVd63c93AyNmEip1FCDvGX19lqPaD6T9dHHIFwxrkYTDrwP51UvcKc7N5GdEs7ecYgjLvNKcvSVfuSpuhe83KQJnd3CRyrtwDyhXDJTsawYf+XYroTHNZWXVGfnryWUs5zlsLpNDOJHhLd1pzPm/OsMWLevUUAysZjNgqoF5BZx6x23xDTjWEpj5ccuiQih/l7DoPaG9y41FHmCNFoO1mL2oelUkL0MGAzE1LvSggPO7R2T8awqH4LjyPuVYneSxQ3eoTBwnDR2StfANtweumTcDzk8HZdZ50XsTt5cF3M5WQEsX/k/l8suVM2srS3xxRNHWLfSZkl9gU7CqBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(86362001)(66946007)(44832011)(83380400001)(966005)(1076003)(6512007)(66476007)(66556008)(36756003)(52116002)(6916009)(6666004)(8676002)(5660300002)(83080400001)(186003)(26005)(16526019)(6506007)(316002)(19627235002)(956004)(2616005)(8936002)(478600001)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	b8egZd1sQvAjV2s4VIeSiS8LOTUpPFbjZE3fm/U9ILjMoJray6my13taWXiWccajqZ3GkJ5WNTVwluev65S9l8nTTIaYfJLjnJq0yh7xcoVymyJoGQHNnv/EFen0N2t1UsQkrmL7YeGPLwW2yG4ZOlVrJj7qoxpcrVcn4jcc1o/YtSJknlNSVgsiu9GjnFHztWYHct1NI1RE2MBIrvPFvB7/IHv/zxF9q/alShJdJFJizvpPpwSrrqFFBGXltQev07BQrq3ebY9wtVqaF1tFgz5boOAWdEjL5LZX6u5uEBDWqKYUgZ61oUoZw7f74sP7sJOxVSfK0hOyh422LOAPKoBIE+9pk+2G9InGQYgJSXrcGvhSThHEbENPocoEwj2hHdnzEUNMVPHFsejWgTXZAbp29NLejL+UW0PqyRgoUBEddMy6J26ENaRzSoTeBzWtKm3SI/ulONZSl2qLD6nogk7OyXdSAtcfrPD0Lw2ZHRrXrOHNIYVeF3XHnRbVGkXr49Kz0fvJmctcQsPWgQYml0L3VKNP2wdoxuKz55r1QFYYAhLbbNRWK1fpxKA16nq6nWY/NDApSxnxa/B28hj4k57Egn8+W39KdG+opap2CBsN0v+j2780vjfMuE4u4ALTYCgKQB4OGTmR32oADufYiw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b8f77a-3fa1-46ca-64a7-08d86f86839b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 14:44:39.9953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0sgffRTsegktDnsWxylB0t4gNwPtRi+xTawy79vCTqTr1hlNJ0ws6LaWtr0LPLvtvXTbRN/iO2AFOCoALVDXAjupUd5AaFkyrsXj3S7jQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4417
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

After glibc uprev 2.31 -> 2.32, the following drd ptests
fail with the error "condition variable has not been initialized".

drd/tests/annotate_hb_err
drd/tests/annotate_sem
drd/tests/annotate_rwlock
drd/tests/annotate_order_2
drd/tests/annotate_smart_pointer
drd/tests/annotate_spinlock
drd/tests/monitor_example
drd/tests/pth_cond_race
drd/tests/pth_inconsistent_cond_wait

In glibc 2.32, the POSIX thread functions are in both
libc and libpthread, causing valgrind to misinterpert
test behaviour. This patch tells valgrind to intercept
both the libc and the libpthread functions, resolving
these ptest failures.

Here are the latest test results on qemux86-64:
=3D=3D=3D Test Summary =3D=3D=3D
TOTAL: 728
PASSED: 688
FAILED: 1
SKIPPED: 39

The failed test is in helgrind:
FAIL: helgrind/tests/pth_destroy_cond

Patch can be removed once we uprev valgrind.
See valgrind commit 15330adf7c2471fbaa6a0818db07078d81dbff97.

Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 .../valgrind/0001-drd-Port-to-Fedora-33.patch | 48 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-t=
o-Fedora-33.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedor=
a-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedor=
a-33.patch
new file mode 100644
index 0000000000..37f6ea667d
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.pa=
tch
@@ -0,0 +1,48 @@
+From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sat, 19 Sep 2020 08:08:59 -0700
+Subject: [PATCH] drd: Port to Fedora 33
+
+Apparently on Fedora 33 the POSIX thread functions exist in both libc and
+libpthread. Hence this patch that intercepts the pthread functions in
+libc. See also https://bugs.kde.org/show_bug.cgi?id=3D426144 .
+
+Signed-off-by: Bart Van Assche <bvanassche@acm.org>
+
+This patch was imported from the valgrind sourceware server
+(https://sourceware.org/git/?p=3Dvalgrind.git;a=3Dcommit;h=3D15330adf7c247=
1fbaa6a0818db07078d81dbff97)
+It was modified to remove the changes to the valgrind NEWS file,
+as these are difficult to maintain and don't impact the valgrind=20
+code itself.
+
+Upstream-Status: Backport
+
+Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
+---
+ drd/drd_pthread_intercepts.c | 9 +++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
+index 58c45aaec..c2882e5ab 100644
+--- a/drd/drd_pthread_intercepts.c
++++ b/drd/drd_pthread_intercepts.c
+@@ -174,7 +174,16 @@ static int never_true;
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
+    { return implf argl; }
+ #else
++/*
++ * On Linux, intercept both the libc and the libpthread functions. At
++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
++ * functions in both libc and libpthread. Older glibc versions only have =
an
++ * implementation of the pthread functions in libpthread.
++ */
+ #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
++   { return implf argl; }                                               \
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
+    { return implf argl; }
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.16.1.bb
index d4ca1a7752..7508098b55 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -40,6 +40,7 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrind=
-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.=
patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
+           file://0001-drd-Port-to-Fedora-33.patch \
            "
 SRC_URI[md5sum] =3D "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] =3D "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba=
918cc6720a33ca"
--=20
2.25.1

