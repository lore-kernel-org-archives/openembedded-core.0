Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C406FC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 08:20:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3524.1790324439011171621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 01:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OiBr82Ga;
 spf=pass (domain: est.tech, ip: 52.101.72.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMPU4302DkD+cyz/CxffX0wiTKfY6EzmjS4LNgxuGJ1Zsj0De5N9a9/G1Vd0GDa3MFuvSYmIJ3PqaF9wyzvipErFQZxHYqsRssZ6j+w73lPe8PJswYvy60lFuDuftAodlPrJznFSlUoRP0i+2JIqhjVNzQxrAA/a3I+E9OJdA/bi70XfHlpg1gO6v8qmPpq9/iHYA2h5sTI/0Gp4kmVdrXcND/gE/zmcXJPnlLnknYasy1KmVYSaItM9E6OUp8H50WM1iLwG+dpWb/CZh1/TqYITJAhyQ+3UPTTjNNXu0auWKmur10qeSpphb4SLZh3MRWpRWnQVHdUkOjsEpKtWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l7kDbSvK/FWjCHpgbBlFpbRN24c2qFWngou8tLSOXs=;
 b=uAOtH95W2GmxJPDct2jFcPCmYvnX6dJ7s1graWJerT4JdEztFQ5OGwpCXRYq7z3n3Qbbz/8wVWVTr3t4xEpq0vbS/ayRbvcU19DKBH8Xj0SyXn0OkuqcBbKpOQfRBBYIXLw3uRTrFSw59+uJKYq4V0bOyQhffYbu+HuV6jXCJLuPLeBdUrWkfpgdC/3bz/lhzAw9CXTPO0YASIZGe5ao9eAwD66BBzT6wuydODU33/tlBqY4sXAf2eo69EEpFavccf05uKN1lcESYpETVUHm6E6IChdEn7kt5yEU/bOjuiXlNuEsM6TdThrAq+wHka0jq3dKXl+4wRUp4U0xTU4YSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2l7kDbSvK/FWjCHpgbBlFpbRN24c2qFWngou8tLSOXs=;
 b=OiBr82GaM0/sL2aBfxI7zHxCBLVvCJIhyTtitmzwNEHzgcDiE/0zLc8P0fbOv7g5Q2euQ+EW0sAPEiIqb+ttkDjjBr2lxhYgbkMInbBRd5k4wH70T9QESIy2N/WO0VHeiU99WwOaqoHli6vErtkTzzrvnORhWqI5kZUZrY0Ubhz1sCQ4jkenX3cY6IePUzpKsbQHFTuaLbjHEeu0HbzziJ4Hp4mufa19qJNbXP8UsbjUzKgbQTVycCMT6mbB4umjMwr3bReCVF2SroUPuzJhNdc8my9k4A69TdXjTh/r0kKxe1bNwtu6Yqt+HUvE5XB5/xN8BYmxquuCAVKpK5iQXw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3637.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 08:20:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 08:20:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rt-tests: drop Makefile CC/AR patch and use EXTRA_OEMAKE
Date: Fri, 25 Sep 2026 10:20:30 +0200
Message-ID: <20260925082031.83588-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3637:EE_
X-MS-Office365-Filtering-Correlation-Id: c608709b-8b0c-4a51-8298-08df1addde48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|3023799007|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BbuCUy+XyjutsPTjSh7ocAbZzkbudpKD/eCSeFneSKURsbrZrOCw2iENZ3i1flGyrhCpqOFR4AzCCm2688Kh/PaXE0nsijhxl0oM5Z0buC0RmwzK5/wvf9NbeQ96gMKpzAokg0xxNk4ImuyuPdNdhPTLQFp60EM1uUEUJh1QJydKvDaERM3ynSUlfd7qzeq7qWUZ3XhU2I0U3Zb6pf33QIVA0MOs8Gr/fCqQg3KYIi9n4a8jJwbMXdR+Grtn5O3shyXrLubhXTTf5kjD0M9m6e094auCDlOsjRctfnR+cAU9CGdCU8ho+5T2lD+oP4M0EkqmnQJsNU0HNhHoiSbL7hhDFJkiQHdFLLSfoPnSpSGgL3JhNhS8hnRLjK1DVWbj+0BVp9q1JB1z3Ny3NzRIVBXrPrw19VJfJXiPiwOsNd5vym7l3dbtXUXL3XBjA12OuQKGfkCYX5fUWY10TMvJ55EM/aOt+hFQzkXfgG+dKfUdxL9mcwNVI6ED2F2HbCfOLv2RAusQ9wyW+XEEQFULweL4GX1I2sy7wQE9cWIfWRMMwR0Rq8696qZP1Xg1lAEhCi6qKNPpOLwdVcVmuY8hr/6Wb/f3USdfE+oD84FR2NPoNJxLH0cP7qaxzJeCNPj6EDwxHtQgHmmtujr+NaM8LTKZHuqlL+SFwwTA7VCzVVE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(3023799007)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LR072SbagehWw/VGluq1vWmfAZy0DXYfGeN/Bcyn6st4dfHMpJc9EW54kMdN?=
 =?us-ascii?Q?1DzyfkcGvn7mOikdCF1MONN+CnbUgq6Mn8s46oIWzx0iCkdz1NmSWe3EWyyn?=
 =?us-ascii?Q?tEcyOya/Rzyp6KhGDrOeCMYKwW9uF/5SsDNeFjSarcCy3sTNGzwNFehkHX+e?=
 =?us-ascii?Q?CcCLV5TkIj8DOVQB17S6rswac6WmWaMJn3FtmP/dOgWl45p3n77ihPsrIAj/?=
 =?us-ascii?Q?CcRc7c3Pa6MRGcLtlrZwQgmb+oEQ90gSZXwDTYoxJ03Fl5puHBabMEt604oT?=
 =?us-ascii?Q?NGAdvScMrlcCUbo80j25oDLJ0F/BOS58gHk2CifSWxgbXOsIkSS4GCpoE5CG?=
 =?us-ascii?Q?j0WCE8h7QSGJx1xnSVWO9JFHDRb/EBOpnW6jfg3w8Iwjiro66MlHkf6yrkL3?=
 =?us-ascii?Q?bniSLiwJ8F8rCV2mbfoqPOt2ZeF+f+0p6cCw9zXuWjyVuPyKKpxOnyhBdhE9?=
 =?us-ascii?Q?miE4Gn9UW5y4GfULwJHvplvtcDZX1+MN6xz1/jvRsP+nHoAsJB4l7nY7EHOB?=
 =?us-ascii?Q?Xg+nFp+F6w6yYfaWynLMvm5qHc8BJLPI2ln9K0l6DuS3IuDcQ0FcFrUe2HVw?=
 =?us-ascii?Q?a4bbHlTO0/Y9R02l7nQqr/L72oRxEW2teLFXlgLEvMr8pz7ce+3YUCzP7gH1?=
 =?us-ascii?Q?04zjbwHzAcqnao2K2FRu8hoNkHkmb/pJjO9SgLpX0CylKDQtBmLeK+h5ijpW?=
 =?us-ascii?Q?uClRXmL0T+D0vF1oYFHG0vWgKBeqD+2GFwR6NR379/WpW3TyV4I8YzhgI33A?=
 =?us-ascii?Q?2NlWKGQYbz0M7zU4sq9QHlHu+fv3CeZLiJVE/WEOBnks7UPH3xZZhIrNlMez?=
 =?us-ascii?Q?hV3GGflh/elyN5Xm9n0fm6Armi4oH1BzUQvuaUTAw6vqJzXFzNsBiX2bwchy?=
 =?us-ascii?Q?eFo7MXW13+EiNXw6moOi0cdHWaWO4vFRV6mg9BhklgVZ7siuMo9w3t0UJ6fU?=
 =?us-ascii?Q?1asAKWbuVO2M1AZJKIjOrIIsMTZKpIPbgRgBjd6QGsKlB9n+mXY/8zrnTOMy?=
 =?us-ascii?Q?uyAtNqu7ldhH3Cb3+Dvu9BVyQaGOdw8pGJAbLp5ACfirACXFqlhW1emkm0Jt?=
 =?us-ascii?Q?Ho0W0BKqBBpUWD/bp3ejjiTN+hh1g6K6gusvD4K5JgH5oQmRbhHMaAcwbEnR?=
 =?us-ascii?Q?BZsbX5vdTz6RLbUfq82GXOJMfwTE3dQfojXYjTYy4mYj0CLfUx3ogc1ya8Gc?=
 =?us-ascii?Q?AGyZnpeAgBAfAWzsfyEEMDenaKjlUTt+CkGBrLIIvysR0qDNbwvnm2Z3fg8k?=
 =?us-ascii?Q?bdOQJ2gOljkiJ3jpnPYBnja5VVzV+LBaZjFfcvRvuWBhn1UvZ+uxH580bVsm?=
 =?us-ascii?Q?vojm5ksuCIjHkUMQDcJLapvJ9rULV8xjb2tzmQlEGJGrKUL9rQv2g/kSC3eo?=
 =?us-ascii?Q?8hnGG24fwlJLPpAOBAv2Lzd4KjHmcrWrdWj7KHOT/nMVhRfX1K5bznjpErp6?=
 =?us-ascii?Q?3RtM2OIU04Ju0oSVAW9Psl6Nryc4ZcZ+jm0F8qQPeBWZcLDOymFTzhDI5RVX?=
 =?us-ascii?Q?bPw4wD5gryt8+6lGKlJ/s8Yoo6WmGDtyvyEMiP6bIdjAR1j53pczbLKCL/hR?=
 =?us-ascii?Q?t64ePfL6WeZ64i3g0aQNCCNPHU3VC0M+HQ2BnYx2wu2DkquCkKnH8r2RawDm?=
 =?us-ascii?Q?Hb58w2V11OonRhO/a4YP5kZh085leUXu3qu6MMfz23nBp96vgMyNREaYFgVi?=
 =?us-ascii?Q?UKQ6TeuObpgAb9LureMN5PrxER0s5GmX02YWBD9GaYglJ07p/FHwfbPHi7bv?=
 =?us-ascii?Q?h5DvDCUOvQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c608709b-8b0c-4a51-8298-08df1addde48
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 08:20:33.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KASbmcAp996Fvkxv2AEK98pLtz6ZlMB2Y+ZZmLcnOdkL84UqGhr0x+maMHTZEkl4Pb8pwmOeS6V4VQN5ogGOXmUVBkZhQyToF0mSVXB0xUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 08:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246606

- The 0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch changed
  upstream's 'CC =3D' / 'AR =3D' to '?=3D' so OE's toolchain would take eff=
ect.
  Passing CC/AR via EXTRA_OEMAKE overrides the makefile assignments on the
  command line instead, so the local patch is no longer needed

- Verified by building qemux86-64 and qemuarm64: both do_compile and do_ins=
tall
  use the cross CC/AR (e.g. aarch64-oe-linux-gcc)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Allow-for-CC-and-AR-to-be-overridden.patch | 33 -------------------
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |  6 +++-
 2 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-=
CC-and-AR-to-be-overridden.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-=
AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Al=
low-for-CC-and-AR-to-be-overridden.patch
deleted file mode 100644
index a39781908ec..00000000000
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-b=
e-overridden.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7cf4cf097895bd4c3f3d3a6f783c766b3173cf1a Mon Sep 17 00:00:00 2001
-From: Randy Witt <randy.e.witt@intel.com>
-Date: Fri, 16 Oct 2020 16:54:30 -0700
-Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
-
-The Makefile previously allowed for this but it was removed upstream in
-commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
-
-Signed-off-by: Randy Witt <randy.e.witt@intel.com>
-
-Upstream-Status: Inappropriate [other]
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 83d2a33..e757839 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,8 +2,8 @@
- include feature/test-feature.mak
-=20
- VERSION =3D 2.10
--CC =3D $(CROSS_COMPILE)gcc
--AR =3D $(CROSS_COMPILE)ar
-+CC ?=3D $(CROSS_COMPILE)gcc
-+AR ?=3D $(CROSS_COMPILE)ar
-=20
- OBJDIR =3D bld
-=20
---=20
-2.43.0
-
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-=
tests/rt-tests_git.bb
index aea3d82e202..d722755f522 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -12,7 +12,6 @@ inherit ptest
 SRC_URI +=3D " \
             file://run-ptest \
             file://rt_bmark.py \
-            file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patc=
h \
            "
=20
 # rt-tests needs PI mutex support in libc
@@ -21,6 +20,11 @@ COMPATIBLE_HOST:libc-musl =3D 'null'
 # Do not install hwlatdetect
 EXTRA_OEMAKE +=3D "PYLIB=3D''"
=20
+# Upstream Makefile hardcodes CC/AR with '=3D' (git.kernel.org rt-tests co=
mmit
+# 7763cf316d78). Pass them as make command-line args so they override thos=
e
+# assignments, avoiding a local Makefile patch.
+EXTRA_OEMAKE +=3D "CC=3D'${CC}' AR=3D'${AR}'"
+
 do_install() {
         oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MANDIR=3D${=
mandir} \
                            INCLUDEDIR=3D${includedir}

