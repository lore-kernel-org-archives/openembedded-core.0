Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.54])
 by mx.groups.io with SMTP id smtpd.web09.9631.1603097839936768350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 01:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UD4mDjVm;
 spf=pass (domain: windriver.com, ip: 40.107.236.54, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK34wwa+gb98SqNPqJmXYyud3d2ZzWty207nVrE32Loij/3fiY0gjCq0fb/32rhk27fdE0O/zwPxiFSRydtTzCgJp7fEKs9k4X3v4eVnz8Vkz/vLQ3b3np21TlFqbBs7IN4RHgdHc/GDisNtfhZTDHvHi7NF5U5GMkJuUOtgmV/fBt8JyGlprezKNJUED4ZJKeyERkcjgyhAQtOUk9yZZZMnKTDT8044kEjQLnwZvZUE829OxiYJUkRcft5k5GaevlFqBWlrrzwxjs13yz6AvMq9hxrqO4uSqkqdrFf7+zK/GFBpESKF5SVGhRUZFfYS2t2nPzeeT8F+7Z032blpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/J0UpxVlEuEwdTdDO/Tmc3qwPnWD20gLWwH5l7hwKI=;
 b=fJfxOtoasZdLOPCRYu/OQZ3/HLhjBkylyK0uqYcwaE03W16h4OEC8AlHgBiMyF4/K8gCGrlJ+CbZc6DUok4hAj9tuQ1oO3NhJ3FeRjzbol88z5TnqJ3hM1J/tsf44M4qiVfG2uJDbA1bkHkmbEEGRNkqBnjnZuYcPe2gJZRWa5KxD+bIsrRXpD9cERotwUSH7q/U3r9QQ3vM7j66iTqHvp+4+54R5FVsnSAv6xtncRvaZqDaTbZAsB6iISBVMYbN+rQvY6WrOz0vfHVqTclPG5Pq7ZOr4OaO4DAMQcEVlyM1VI80xm2TuF+SkDgwjztKjoW5f1Q+8qnV2P+Uv5brEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/J0UpxVlEuEwdTdDO/Tmc3qwPnWD20gLWwH5l7hwKI=;
 b=UD4mDjVmbN7SXQi0I9bXhcuaOHK1EJCW4HyyzRYRKuXnuG7UunAssbbM9lDbHy4ddSMUmS37YPTjsiLpV/KDJp7fPVzTawSd81xDDfjYXXQ5rERFP6bPhCHhgrK/QNFTFzJiSVg9AC7h1v1oGQqTF7yuY2p9H9gma1+Eh3xzjZQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM5PR11MB2010.namprd11.prod.outlook.com (2603:10b6:3:12::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Mon, 19 Oct
 2020 08:57:18 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 08:57:18 +0000
To: openembedded-core@lists.openembedded.org
From: "Li Wang" <li.wang@windriver.com>
Subject: [OE-core][zeus][PATCH] libarchive: CVE-2020-21674
Message-ID: <cbdaf5a8-7b27-5289-3687-4fb826a85ea4@windriver.com>
Date: Mon, 19 Oct 2020 16:57:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.9 via Frontend Transport; Mon, 19 Oct 2020 08:57:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90581354-8fde-41ba-7883-08d8740cfb41
X-MS-TrafficTypeDiagnostic: DM5PR11MB2010:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB2010241EF7DB85D6555016BAEF1E0@DM5PR11MB2010.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zsgGoOGzEVhjtgtu1ygPmCwEUiXitOceKggJ+rHOCxjSQl6aZ02bsJpaXD99zJ726eBWEZXtn6lnfaUWeaOysBxHXFCHoTJqepMoEETTJ582boLfs1w40p/l76qJtn9tRFyK3PMc7ef815EbAVcGa8iObRiB37FyU94e+24+j+2KyHNmsU7fHwhe1r0QgogK3eppG7a8ZTRUaL5R+0eySFXClTx3NfcMfXmyf4jc2ESyQeC67XhQVVEXEFXIE+OBHaIoBRgguspBzW+tMlpm1p/MyhjeQU5gFHMXuip+tKcqCNdErliTeDKXJvro7dR1WPvnaqeDpUmQo6Bg8/DoIFP1ph0iFCvxWpyffjpiAxbWc3I21wguB6jm5QZ4vgCgP9fyTwvYA4gvvM4NlOKoqDDiLJeDpDUl+LS13/0JBE0zsOf2ESyaruBEXpliFJZpAf15BgTvoYdL4lVI8R9a78Jm0ZGqxPqfD3Lv+ci3QIw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39840400004)(396003)(376002)(186003)(31696002)(52116002)(16526019)(8676002)(6916009)(31686004)(6486002)(8936002)(478600001)(2616005)(26005)(6706004)(956004)(966005)(86362001)(5660300002)(316002)(16576012)(66946007)(66476007)(66556008)(2906002)(36756003)(83380400001)(6666004)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1pAPOFYGGmTRaicxNXcqdcZymiiSj1DgFgBoDOi26BUzOZochFf8nugOHtkFQS8DIXfCGanMS3CRvYr28JDg6yNdRtiU0yaLz5uv0HFnVqodXZV9uWejc1LY64FBmlUfEO72jqkQxdMj38GQxU7y/gafFAdgxd81Q06j4Malk9Vwh7x0x6NaquE0UTUhriLFESKMgvh33Jme5c6Y+Nrsbso7z9L/tT0E9L34bpLYqS9Uzqtmq4n9cmkWGXf7hYTL3hi9pQMIUrm2xWk/O1hDcmPKkgtYdGTTUYWaYwMYZ9g9I5bP9opGQy7qujqENZBoxE6VynwKOrqSBqc5emkjZj9FnJQk7IuNuMoK9CqrNOsNYqiLw25oHPToORynhKgppstnZve5657xVSQl1bRJcT6pxAvUzfjItVNQX7EotZdM4Oj6xOiobRTW2SmLv48TZ0xTcyORT69+LyVzNMCX9zM9CB86vgLPeOzz5N0bHzOQXjP/OC06C8Nq9OycHaVcwf4aZr0HqkfIxFXU6UC+P7PVkLKPDG4lyhpc/0jn4pcv0Ag5ATx2PEoVR8l40Ti3vLFuSf1HDOQIBdzuQvK3o7YWYnCJsaCzWpTKf+kkAIkITumkSneVCIPEgg788vvLU+qHUU4Qp6v3eQfjxxVyWA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90581354-8fde-41ba-7883-08d8740cfb41
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 08:57:18.1134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MdFbgSkIarGEeF0zs+smdktfFfKRAah1Vr6hrntCd36E/YCjC1lDsPmHZKWgU5Bgbs8uCU8sKH231kZBcZRCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2010
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Backport CVE patch from the upstream:
https://github.com/libarchive/libarchive/commit/4f085eea879e2be745f4d9bf57e=
8513ae48157f4

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 =C2=A0.../libarchive/CVE-2020-21674.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 57 +++++++++++++++++++
 =C2=A0.../libarchive/libarchive_3.4.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
 =C2=A02 files changed, 58 insertions(+)
 =C2=A0create mode 100644=20
meta/recipes-extended/libarchive/libarchive/CVE-2020-21674.patch

diff --git=20
a/meta/recipes-extended/libarchive/libarchive/CVE-2020-21674.patch=20
b/meta/recipes-extended/libarchive/libarchive/CVE-2020-21674.patch
new file mode 100644
index 0000000000..63b2a543bd
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2020-21674.patch
@@ -0,0 +1,57 @@
+From 4f085eea879e2be745f4d9bf57e8513ae48157f4 Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.org>
+Date: Sat, 28 Dec 2019 22:58:08 +0100
+Subject: [PATCH] Fix a possible heap-buffer-overflow in
+ archive_string_append_from_wcs()
+
+When we grow the archive_string buffer, we have to make sure it fits
+at least one maximum-sized multibyte character in the current locale
+and the null character.
+
+Fixes #1298
+
+Upstream-Status: Backport
+CVE: CVE-2020-21674
+[https://github.com/libarchive/libarchive/commit/4f085eea879e2be745f4d9bf5=
7e8513ae48157f4]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ libarchive/archive_string.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_string.c b/libarchive/archive_string.c
+index 063f0f2..91ad9ce 100644
+--- a/libarchive/archive_string.c
++++ b/libarchive/archive_string.c
+@@ -75,6 +75,9 @@ __FBSDID("$FreeBSD:=20
head/lib/libarchive/archive_string.c 201095 2009-12-28 02:33
+ #define wmemmove(a,b,i)=C2=A0 (wchar_t *)memmove((a), (b), (i) *=20
sizeof(wchar_t))
+ #endif
+
++#undef max
++#define max(a, b)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((a)>(b)?(a):(b))
++
+ struct archive_string_conv {
+ =C2=A0=C2=A0=C2=A0 struct archive_string_conv=C2=A0=C2=A0=C2=A0 *next;
+ =C2=A0=C2=A0=C2=A0 char=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 *from_charset;
+@@ -804,7 +807,8 @@ archive_string_append_from_wcs(struct=20
archive_string *as,
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 as->s[as->length=
] =3D '\0';
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* Re-allocate b=
uffer for MBS. */
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (archive_stri=
ng_ensure(as,
+-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 as->length + len * 2 + 1) =3D=3D NULL)
++=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 as->length + max(len * 2,
++=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 (size_t)MB_CUR_MAX) + 1) =3D=3D NULL)
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 return (-1);
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 p =3D as->s + as=
->length;
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 end =3D as->s + =
as->buffer_length - MB_CUR_MAX -1;
+@@ -3446,7 +3450,8 @@ strncat_from_utf8_libarchive2(struct=20
archive_string *as,
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 as->length =3D p=
 - as->s;
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* Re-allocate b=
uffer for MBS. */
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (archive_stri=
ng_ensure(as,
+-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 as->length + len * 2 + 1) =3D=3D NULL)
++=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 as->length + max(len * 2,
++=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 (size_t)MB_CUR_MAX) + 1) =3D=3D NULL)
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 return (-1);
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 p =3D as->s + as=
->length;
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 end =3D as->s + =
as->buffer_length - MB_CUR_MAX -1;
+--
+2.17.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb=20
b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
index db45ccf654..e8d93bf0f9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
@@ -34,6 +34,7 @@ EXTRA_OECONF +=3D "--enable-largefile"
 =C2=A0SRC_URI =3D "http://libarchive.org/downloads/libarchive-${PV}.tar.gz=
 \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
CVE-2019-19221.patch \
file://0001-RAR5-reader-reject-files-that-declare-invalid-header.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-20=
20-21674.patch \
 =C2=A0"

 =C2=A0SRC_URI[md5sum] =3D "6046396255bd7cf6d0f6603a9bda39ac"
--=20
2.17.1

