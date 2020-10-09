Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.89])
 by mx.groups.io with SMTP id smtpd.web11.1877.1602276289520193696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 13:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YKYyT2st;
 spf=pass (domain: windriver.com, ip: 40.107.100.89, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crv0qhzA6INDRmAlNsD+Pz1DTb/74jolVHzVcsgP/qOrb648VOMq4T3G/9nwztVoRumZRgXAIcRvcN1VGy8UsVBwwQ6EsJHly4w/owKCV7aAd+4KRXOvSoOlEqq6f/tQN4qEMGXrS+AsbGzUZLu46kTbZLJBOPVvRqi25Jv/JkJJ20VEA4NYEhcCEoPfCMPp708cfH5qFjE4KbSDUnFRcwxvGkt4MfiTNynCxQdthgDKedWZpIMPc6n/k9gfZa/TDBQiRsk4bMQu/XDX3Jvfqz8YEqWMMCWxinrF3IT7caj4dlROMKX8GUvKcCTDD268yic02YyuP0FD/Fl+uiblkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6GzOGwsf4rocLobR4/h+pLuQLSi0WemAJWgATD+xXM=;
 b=H1g/SUM9kMyLpmU9oV8Yc3kSTk8kfd7Hy1KOTSqJvA1LUCXwxJvW00NMJdLnxCXTPFAnBNWJoZLMSzO67b/e+xnzdtfv3FHgtXl2upU5+xHo7LqEH/CeEPjHS/CCGpWB0BvkMw5miA1fSvNaeEDgU2TqEyUrdzQavNRGZQ5oZSs1V83LtPBL5Lss01duRQVFoQesghWX3SWVBV44dUMj82TX/Dpn8tYNwW72v3rUpZYe+3gzs39lOtIuGMdGUx0CkdFn3mLHjx0JyaB+II4OGNIP0bmkI6HC2lRR+yxsbI7rSvFGFzIEGr7lj0ee+M/ZM/tv1VsvXbrbrZGZN41MhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6GzOGwsf4rocLobR4/h+pLuQLSi0WemAJWgATD+xXM=;
 b=YKYyT2stN0DPKHm785RwiWY9Xs2XcT8/gugmabq56JqAr9DjnWWe34J7EcGwPmHlqVgkDLbd1DZuFggiVE3f5zodReA0nWUwZvIzATp2EMVgOcspxLMRk2koBRCUdDbXJvUKXXUWFDBFBp09uOQIA/ECjO389rfVG5yrnFGhLCE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by BYAPR11MB3381.namprd11.prod.outlook.com (2603:10b6:a03:79::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Fri, 9 Oct
 2020 20:44:46 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94%4]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 20:44:46 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: drd: fix pthread intercept test failures
Date: Fri,  9 Oct 2020 16:44:31 -0400
Message-ID: <20201009204431.681565-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::32) To BYAPR11MB3127.namprd11.prod.outlook.com
 (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-sgaikova-lx.wrs.com (128.224.252.2) by YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Fri, 9 Oct 2020 20:44:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f14029ce-2fdd-44bb-9f4e-08d86c942849
X-MS-TrafficTypeDiagnostic: BYAPR11MB3381:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33811A010045A05462D68C5CFD080@BYAPR11MB3381.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TEWBAVibBtdQqJt3Hyvl/l6cvgj4I/dAHSu11wEv+OWTlM3vKo+YweN/DhS36hOPeLJqzuH0YE3R142CPI4lOdOzCY+Bh7oj6DsDAr8aUUDlgTTQWz4/ivJltTxjhkItobHrUSst0eweBayPKSC2NBo2XY4hUt2YC//zIJvje8oYbDopBuhWHPf0aEUvusFlGnJRjY7nVm/mRbqRpdZCDL0c7ySnbrczO8fvFa5JvhPtUPfZ6Kdy8U1tsU+toBNeiC8juWGb73Gosn9VKPFnFBZrMigrumiYf6dHl5aHUcLxPLDswmkpsUouyCpHqDTZuiwJMpEdY48EI1vts1NwvS9GHHNu0sjjScWw8dRLe7dT3e9SCra9BCe5LdbOB3BdFH7eFb3OQsVIDwRufdQVYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(396003)(366004)(1076003)(316002)(83380400001)(5660300002)(6486002)(6506007)(2906002)(83080400001)(44832011)(52116002)(26005)(66476007)(66556008)(16526019)(186003)(8676002)(6666004)(86362001)(19627235002)(66946007)(6512007)(966005)(36756003)(2616005)(6916009)(478600001)(956004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0qIOGMwa5DchaIMMRzaoVAt61URQox5WgB1gl6+DE3lFZrsamtA5DVjvwkLOqZ0RoF+APq3ItON+Lv2COuKcjxAYhTA/1TSlQuyh7KOdaDGTNZZvc3A2iq10zkrtSUt0lkKzkk3MkFrtfMiYfsS2v/MGCSASp5bOqkQ799TtGQ4y3FW+OWKgXZCMlga2iKtmJvun5gDclaeRHX/u0ryTGbnoejd0T1zZcQpAPXwDcTbQYxz7VDqmo342XU0ijM+Ts4Jv531NA6Rt9p7gZl94pe1XBnXrNeUvi93gFHyd4yryYwWrMEtXT3xShqAGqC9H94fuAg5DlPPKOPPg7ojyc350srHHkZRUMLCf3nB+U7Z97hz2ZmwyGwCtrJzdHeKp2CoCKfmcuQOM4DP4XJqsb+VIbVfZG52FF9yU7PyfR1vTfoA43ZPwk5QTJy/9Omd+6eHToW2VqWDUiOZiAK2Ju22ERVpHj1mP6wvA16ibt9PXPt2PSgbaR4NvsfrGnNZepPtxFB7IToSF1YSlSA5Iehk5cMWwOVYHKh9EPmsr3GUUq81K3P5bMqXymuPQ8omapR3A4UEy+OW8oAujh6NvEUxrz7lWdaPa05NH+FtsmqO1QTMW6KCWUSqN44CyLOyYZUxY1yeuLj2vX1bsYW7W6A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14029ce-2fdd-44bb-9f4e-08d86c942849
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 20:44:46.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qU698O4ZHDLh9poJETtAwrSRD6mjOzmYAMHcxeLc1h8YG4a868r4q2g3EjLC0L8A2tcZI37mtfqnzM4CiQT2dV5gyEae+fctKFNEVMbK0rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3381
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
=3D=3D=3D Test Summary =3D=3D=3D                                           =
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
index 0000000000..693403a29d
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
+(https://sourceware.org/git/?p=3Dvalgrind.git), commit id
+15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to
+remove the changes to the valgrind NEWS file, as these are difficult to=20
+maintain and don't impact the valgrind code itself.
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

