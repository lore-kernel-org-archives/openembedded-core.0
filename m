Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.78])
 by mx.groups.io with SMTP id smtpd.web10.13551.1605810730078634252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 10:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NKpsniyP;
 spf=pass (domain: windriver.com, ip: 40.107.77.78, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ0DGd7g1Z08jaldx2qum/QNdRTGKC8nOd89cMuCElYHmALSKA6OGq8QUYWWs1Ewtnt5JBaGMj8eUqa55FSjBxsoXgky/guCLBPWOxwPp6i3bp5tAbKEm9V3A6gLYc6rqZJgFTIOQhOrg+ajnMN7jdjQdZDe5Mh1Zs2pDMHc/Pa7iSApJ55s3NXeNsetDmKMzWfHYAegaC9vErgxAJ7XD54vQkkIBwkAMxUUiFNGOVwgPTy/LLIzaGHE0A7dVOc2fKjLdCVwZ7v+RGMFQ2M05M2hT08Gsy5Cb+3cmTJy+BMsf3AtH4eRqnM9oi8ldwOunktjw27tPhXSqV4cQiKNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwcE8lp8Z0+m57DLr7ZUIBvmVMMoXxox+LgFlqdjYyM=;
 b=H56XqCWBDIS0on9adL0qlVfBDVyfQiF1DCVmqzdF8GVisnoS58CDI44wc9ZCdRrTFObx6s871s+tVT6QstvYt74KADT66AnF2i2l/6bp/QxMd3osnWm8lp7Nt0FIjUQtFP6ciWId6fc7/hZoYjxDpogo21T5Sd/za1v5v6dtZRVyVY5D4zPMq8QWsoL3meaHCQnRNK2gmXpgsOVVde8VGW6M1tXn6+qGuvzTh4S/TDwRv048sPpvALUEvmPngV4jgBklrhvGAat/NXP1zyOYGoQFNCF0TGxy/Oi8SXzCtT9plT+2dd+VtXZ5jAj8ca6Z00FbXtd5SU/ZCEDvyOcXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwcE8lp8Z0+m57DLr7ZUIBvmVMMoXxox+LgFlqdjYyM=;
 b=NKpsniyP++47wbC13Y0jZ3zoTdj9hrCjcHXlj6O3eA4Uma+zFHQfj441+YEJ0dwzSRuh7uNhsErqK5Q+0mbuK1FyJT0R3XajYYXQqCc2gXOWXmHLoiYU/vUYxt6WrhCxHmmDGCHAoHghjXQTAWg11wXzo4C0gANUab0cSh99sB0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by BYAPR11MB3528.namprd11.prod.outlook.com (2603:10b6:a03:87::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Thu, 19 Nov
 2020 18:32:07 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9%6]) with mapi id 15.20.3499.034; Thu, 19 Nov 2020
 18:32:07 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: helgrind: Intercept libc functions
Date: Thu, 19 Nov 2020 10:31:51 -0800
Message-Id: <20201119183151.16752-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To BYAPR11MB3127.namprd11.prod.outlook.com
 (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR02CA0060.namprd02.prod.outlook.com (2603:10b6:a03:54::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:32:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6a5ed10-953f-4caf-e545-08d88cb96b73
X-MS-TrafficTypeDiagnostic: BYAPR11MB3528:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35281638057FE034A34AA39DFDE00@BYAPR11MB3528.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fPta5g9b4VNoHVHmMMeSeVlCbnstiNXrROKOriY+LYEKzCR0JM/KR7oYfDsPwC/PMBdvkM/oWaPN4qf3TaW3KpKdxGGxPfcqkctrx6KBtaUTEzQNDrX6pitmTAHjFiaOWKZGS/zvSeWCxTgXAoMWJMFHLXI22g7z7sJOcCRCEKfdhKKO8GQGkvMkel8hMHwiUuEhCGatZ5iim6tjpnOSG5wcqHzOf1mi4JUnpAuiGLjP3JW08XlO/kdT+rEFKEW6sM3qYa8LES+8bjIBO5n7koO+mD4h78FOUZtIKOg9a4tPzpAI64y1zkhvNM7VAzfIA7RRnNp/Er1Y+B/t+5EWEEVSxtnOfqttF1EEmY7emLuh0xXsEpNrgnKd7jcayLTwGFYY2Eg+9nUV4WQs/hdN8CyG0cw7YaRVK2TBTcnwoN/AoB2IKf8OybDu41ocq4ukT7Q60SSwMkA+KllPFOKtZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(2616005)(44832011)(5660300002)(6916009)(6512007)(16526019)(86362001)(6486002)(8936002)(26005)(36756003)(186003)(6506007)(956004)(52116002)(8676002)(6666004)(478600001)(66556008)(66946007)(66476007)(1076003)(2906002)(83380400001)(316002)(966005)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XTsOO4PpIAyRQeTkz7WXncMuffQMC0sQ4wJEuaIf+XUsRHM+ZgNWFdk0BAtoOkevBhL1Wuvhojc7ewJYFh8IznRX+XJmNq0c7TpoHrEDdtk3aQiVryQaMCj5/xyKzgX0vMMgS5TaAFxt8Gz6y5T0skapnabLb2ICN3PopL8Dh9nOt7cR65fIgL6sxDP+MNEK/ireJ4FjCUL1Yt2s78rch8/x4WFtyAreArlXF8yTETFiG31epzNmcvhugpq/8vso0hpAdalVm6vaEYqP3nLoWnBDYanYroEIT7Mbo3tvLm5zMsqlS1T1So8H0fECHjpn9ovguGF9ygfl880JC/qdMDMdPUNCOPjV8BqMuINwSdCG4HBWDRKigB2zsm+DKBRD5pJqkTE60wddl+dFEDY/OqRRU9YI23LwAnA4VpSaldLjq0rlPPOLdYCyCv8AzBvQ09KI03K6eqlu+2VEldPJONZ9pYIZifxOEvjgDC5bzyuxFpnbc+Vz3XdNJyBLJNTn+DjTgn8/e40nHTm2MCMT4C6+ai7UPP66RZqOZNq7bKa/K3Dt17OXeNIkLLn7rq0mVPxc8+pILXu1UfTe+W706W/eAvN4LPYh9lD0YwxC0OSE0Q+GL+/JAhqdPpUjhv54TATYKvR5XhU42JuTnw235g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a5ed10-953f-4caf-e545-08d88cb96b73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 18:32:07.4789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqgu2aVmsgb5p6WCoaCpSGBf5ZbYCQCUJc7n4ldhQVBWXYzWeV+eLlQbTNMjFhUyWhqaenWgiqdifTLCIFr9GQojo8azILXQodJEAWxv6tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3528
Content-Type: text/plain

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

PTH_FUNC definition needs to be modified in order to
intercept posix thread functions in both libc and libpthread.
In order to handle this in helgrind, weak alias the pthread functions in glibc.
This also prevents any need for a special case for musl, where
these definitions aren't duplicated.

See https://bugs.kde.org/show_bug.cgi?id=428909 for additional
discussion.

Signed-off-by: Paul Floyd <paulf@free.fr>
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 ...01-helgrind-Intercept-libc-functions.patch | 45 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
new file mode 100644
index 0000000000..b3ab329bd8
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
@@ -0,0 +1,45 @@
+From d02cafce8dd29df0309935beefbfbca1d8e29862 Mon Sep 17 00:00:00 2001
+From: Paul Floyd <paulf@free.fr>
+Date: Wed, 18 Nov 2020 12:49:20 -0400
+Subject: [PATCH] helgrind: Intercept libc functions
+
+Signed-off-by: Paul Floyd <paulf@free.fr>
+
+PTH_FUNC definition needs to be modified in order to
+intercept posix threa functions in both libc and
+libpthread. In order to handle this in helgrind, weak alias
+the pthread functions in glibc.
+
+Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
+
+---
+ helgrind/hg_intercepts.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/helgrind/hg_intercepts.c b/helgrind/hg_intercepts.c
+index a10c3a4a3..4b571bef9 100644
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
+@@ -93,6 +98,7 @@
+ #else
+ #define PTH_FUNC(ret_ty, f, args...) \
+    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
++   hg_weak_alias(I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f), I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBC_SONAME,f)); \
+    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
+ #define CREQ_PTHREAD_T pthread_t
+ #define SEM_ERROR errno
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

