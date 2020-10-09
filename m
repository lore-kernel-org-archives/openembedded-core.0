Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.55])
 by mx.groups.io with SMTP id smtpd.web11.165.1602265492371596838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 10:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Fr31chNV;
 spf=pass (domain: windriver.com, ip: 40.107.68.55, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAhovfp83PlvsWm7SwYlAJfkd6/Rih/Lx7vJuHh3+8bd84koiLuCpEckgyxiFhqixxqX6R6Ntjwngfc2CjUYymjR6dc+Zh6uR6Ym4JJ0a3kEL7AhVj+o6JPVBIekw5dIDau/Sb91nEhlrq4LSn4r/c7kSzLZ1OSVE4KqB4100rjIwxEO60lidHcws3/BBjTCH3QghwFO9hzMZkknuxBaf8m1VdjvItP94MnG4EZM1F7yXxV5Bbt0/0GgjPz7TiGR/+koKVBsNnTO1sThrkR7B2P8bwzBXzgHDk13tLC3l0r14djKggwGrZlnaFfDLVuqT0cvVBMgZHaA8noN8oGi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDIlXljiAGCNnb0Ygs1YfGhHf6TkIPNKBI7eyqcnFH0=;
 b=IcPN/VSuwsRMKudUoHbhnL3Es8F3Dd/U45bFjD6iXtsAqIAeNlhlafRuF9e5yRhYLJH4YUENgG8OOV8C3EMpt6C5QxSTugGQZn1R4HmCMe93y6NFO7RJCWStNlm++v+VP0dBP+LDN/sAd7dqRu/hyCV4w2zERMOFeNEQVaULl80qgPtJOaqJ8jEULg3wMDBJTrhqHhibvAX5ytQeLRjTSFiuMZws2ushL0qoAL1GApXXmjYtl4PhZjoTnoXzu0Ny6yGRiBecLWvEVaR84eY2jPTrejzhrErzbdb8pdH0T5k/dv1x1BDSK2634RpRdHNr5IPd0Ii8svGecbWWuM9JiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDIlXljiAGCNnb0Ygs1YfGhHf6TkIPNKBI7eyqcnFH0=;
 b=Fr31chNVreohWLup+am6ID3+2QrTUvVD3ckFSUUV8baZMzulC+NlZN+PjpnnCTSwPnv7v/RnltwOIjQCh3thtiUttQ3QULFCVZzD9MPSMrn2+AIHP1w8lXm0CgrgEU/5NBdjssuGGU7rxyUCJEBINqlBd6glc4Xc2ia3Z88ytYw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (20.177.227.224) by
 BYAPR11MB3126.namprd11.prod.outlook.com (20.177.225.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.43; Fri, 9 Oct 2020 17:44:50 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94%4]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 17:44:49 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: drd: fix pthread intercept test failures
Date: Fri,  9 Oct 2020 13:44:36 -0400
Message-ID: <20201009174436.3243814-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To BYAPR11MB3127.namprd11.prod.outlook.com
 (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-sgaikova-lx.wrs.com (128.224.252.2) by YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 17:44:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5e201e7-47da-4704-8440-08d86c7b051b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3126:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31266F86A22AD6395B81C209FD080@BYAPR11MB3126.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LogH93x7Nkp9lFnYQYMir1QeyvqP85qRbwY7dcvm6nDAf2mFPgK1acZFbT1r5rF8EshIYgco8voGXuwRT1SSdxA8tvMCWabhZ1XvGCO9ktKkM19lZWodN7Yz3iVQVeCtwEbkbB+Vw3stSBdkFqukFW413cO7XcjZNz56nSDBax64HAHaPI0qSOUJ2tDg8qHKcQfU3HyeqsF76nV2XaqmFr8iJmNPDVV2Ba8I2CtmZlLURNmZacOQ010RX4BxDWNkrxadU/Qr6lsXq4p7P6dUTfRfixd6kBaT0bnpsxB+N8i0Y/tl/K7EDgToyr4m1eCt3Fq+PrhlvDC44VvbKKa55n9iTzyZHubn+7HQcQH/J9ZM53MFyVYITSOLhNZXCQ9B/KpjHi2VCUyH4UWLyIn7wg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(66476007)(66556008)(6916009)(66946007)(478600001)(966005)(1076003)(956004)(2616005)(52116002)(83080400001)(19627235002)(8936002)(86362001)(6666004)(6506007)(2906002)(316002)(26005)(6512007)(83380400001)(6486002)(44832011)(5660300002)(8676002)(36756003)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6YWfpFxaUU9IOl3cdS/AyCD0MBqhrYDKDYnNQI/+Yt5/GAUUk+QghoxfV4mYbzNcFzs2zWkyM9i8185Y72SmqtFgTEgfs40NGmtJY/PiAX/Iq8hWb3r4Ha7cseNRcX1fbI3OM35trmFNIJslhVzibfWaMVgJcmGkpPZ17Y9RjMJ1NKPtBH+tkUwd21H0ZMTpdGgg521WSImtOyNXDdbTDQ/fZEUB8Iuv9esWCEF9rjWHGcy8Cdk9o+TFA1D69iGRho3mkT4fQNwu2MSPkujS4HIK9WwpBzejEmRdVjhfMgmtAZHk8kfm0r6H40/GgTfrUpisSDyne6xHV7g35hLRJ4CXMEDvWWndShTtj24Wifpqc+s939xCZp/xEqu6uHUzDYi+v4Sk8GvsmkywFDG8ou5Qm3FBl2PzR9SQohT5UZv8YWp0ndPNVAQWNy7jcO4bquTsHgoqXqxO8J9/osz7DI9+dQpNj++5nlSBFu7zkbwLGeXD/GMsBY1QEfiqprjsyVnPLz3UR4RrEH/rQ2eVGY0GJfnh49YNOK11LIyX7Sf1vxKwvQ+MAsziExXErxXZXyjB6//HjawfnyvvdcaI7/zq0WIgtNrZadcNsMqiYJxXugR+lQDMvEVZ+z7sz+z4DTo0Dv5PcP5NIR3vTBMBJQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e201e7-47da-4704-8440-08d86c7b051b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 17:44:49.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XClJzpQ5FsCLxw7jKw6qm6DckNa538DtKyKenmRHrl85Ary90kLrW+4l4lmcQFEVbd8ie4j6wOflJ0NjB06xNHSzZIZDIppYDTK5PWHT1xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3126
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

After glibc uprev 2.32 -> 2.32, the following drd ptests
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
the pthread functions in libc, resolving these ptest
failures. Patch can be removed once we uprev valgrind.

Upsteam-Status: Backport

Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 .../valgrind/0001-drd-Port-to-Fedora-33.patch | 46 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-t=
o-Fedora-33.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedor=
a-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedor=
a-33.patch
new file mode 100644
index 0000000000..bca3d9b892
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.pa=
tch
@@ -0,0 +1,46 @@
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

