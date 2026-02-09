Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFEEEE0ADD
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 08:02:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43040.1770624137614890000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 00:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JhMK3F0d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6500d3547a=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6197oYbG3406113
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 08:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=s2j3lYEdYiPkSYWZtUqd
	cS/4Cl/ziIWSjtA/NXHognc=; b=JhMK3F0dI7s+kWXwRzPOUuUA5jMH6wtcDO0F
	0XqYegGjfYW2n8GO/V4fHIgcRZTpSL4AJ7e2/DiGxHIQO/gls45lBkCjFMVLd2I7
	G2T5Xip/V7eozlbjl7bU3p/hVSUCxj0vGZC7ZyLj0bT8YAyQP+c/nSokrFAuO3fb
	jFC5uS/vdw4EzuvPvPcDbyYXuoxaMsGSbf0JJa3lBPq4EvDDLmfOuKYj8dUtf+k6
	OHJgGm8S7+qbPgiN3Yhlx53P69RCd59sEMFvML4DklnIPcOwuVRvRqpctE7WzxXS
	B3Dpv6ciTbztPUMNvrTOzL4dJr8dYiKyKVLsH4OQyHVCO72H1A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwhnhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 08:02:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 00:02:14 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 00:02:14 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] systemd: upgrade from 258.1 to 259.1
Date: Mon, 9 Feb 2026 08:02:13 +0000
Message-ID: <20260209080214.1738300-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=69899488 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=GhQEx97vAAAA:20
 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=uPZiAMpXAAAA:8 a=XkRKQH6RAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8 a=yMhMjlubAAAA:8
 a=BRDUuVQhsF2C282B2_8A:9 a=oScADRl9X9hshwR1:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1gUyE30hU_ULiMxJiLUW:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=uCSXFHLys93vLW5PjgO_:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: jqVVDruUTIP71ZzNpU0Q3fCSPuRmMr1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2NSBTYWx0ZWRfX/sS6CPoPPNe+
 GTjAbHfvnvsbTfe2ACbScqvgtQISZthB7pMPBBBaWwXVqgZ7Nv2A2FNgOT8yByDoc+KncR2NBAC
 Mgu2AaKFYlD58KKLflCxW5OZnTjMxvSpnvuAZO8csxi7gR4QPW7mz0boKJPrxH2oTD3/63jQFvV
 B4215tgYEFeX+UEbOGjlvJXCWE/2q2ivKc8cEYU4AJ0hCG29GXwvum08ZvqMoa6kTJJR0qmA2kn
 Oj1q6VBnzQm2HyfBLGT+taMAlxiczODQ89Pk4Sa95QNbL2cJDco2Vn1QSVC+W6DYZUor0BME9tN
 gTCvf3py6mpgn4Gp3H8ckf7EEW4EwX50lQHhfVrSc2docEAHeRHcTgc+Cm8RrZ7rTsaduMO846B
 G6U7+m98DSXEWuVrDWCT6uESPKsQQ9JOeyoRMtX164++EDOaojrGKWf6ochvg5g0A9ahaMtpLh4
 ElUYUcgA6GafPii6pXg==
X-Proofpoint-ORIG-GUID: jqVVDruUTIP71ZzNpU0Q3fCSPuRmMr1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6197oYbG3406113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 08:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230711

From: Chen Qi <Qi.Chen@windriver.com>

Changes with v259:
https://github.com/systemd/systemd/releases/tag/v259

The 'iptc' PACKAGECONFIG is dropped, because:
"""
systemd-networkd and systemd-nspawn no longer support creating NAT
rules via iptables/libiptc APIs; only nftables is now supported.
"""

Add 'empower' group for systemd. See commit below:
https://github.com/systemd/systemd/commit/3150c342705f4ac27f2b3299ac0961e=
7a70e4451

This new version has big change on musl support.
"""
Incomplete support for musl libc is now available by setting the
"libc" meson option to "musl".
...
This support for musl is provided without a promise of continued
support in future releases.
"""
See https://github.com/systemd/systemd/blob/main/NEWS#L562 for more detai=
ls.

Here are some examples:
- The musl specific '-D_LARGEFILE64_SOURCE' could be dropped because:
  https://github.com/systemd/systemd/commit/fb33d20c072f2e7c3d500f00f8c04=
c99271f34c1
- The 0017-Always-include-netinet-if_ether.h-first.patch and '-D__UAPI_DE=
F_ETHHDR=3D0
  could be dropped because:
  https://github.com/systemd/systemd/commit/8324ef421373c84b5034bf47b84fe=
42d84b1032f
- The 0015-Avoid-sequence-point-error.patch could be dropped because:
  https://github.com/systemd/systemd/commit/ebbc0ea7fd764c870bb8689111138=
b4f73854d42

With the above musl support, here are the changes for this 259.1 recipe:
- Add '-Dlibc=3D${TCLIBC}' configure option.
- The musl warning, do_warn_musl, is removed.
- *ALL* musl specific patches are dropped.
  Any further fix for musl should be sent to systemd upstream.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ..._258.1.bb =3D> systemd-boot-native_259.1.bb} |   0
 ...md-boot_258.1.bb =3D> systemd-boot_259.1.bb} |   0
 ...1.bb =3D> systemd-systemctl-native_259.1.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 ...ntroduce-header-file-and-add-__THROW.patch |  61 ---
 ...k-parse_printf_format-implementation.patch | 411 ------------------
 ...info-related-contents-glibc-specific.patch | 117 -----
 ...override-sys-prctl.h-to-avoid-redefi.patch |  43 --
 ...compliant-strerror_r-from-GNU-specif.patch |  76 ----
 ...util-Make-STRERROR-portable-for-musl.patch |  44 --
 ...-util.h-define-RLIM_FMT-to-fit-musl-.patch |  40 --
 ...ride-malloc.h-define-dummy-malloc_tr.patch |  41 --
 ...tion.c-avoid-using-glibc-ConditionVe.patch |  47 --
 ....c-avoid-boot-time-segfault-for-musl.patch |  31 --
 ...0014-Handle-missing-gshadow-for-musl.patch | 175 --------
 .../0015-Avoid-sequence-point-error.patch     |  35 --
 ...-for-glob-related-codes-and-define-d.patch | 409 -----------------
 ...ays-include-netinet-if_ether.h-first.patch |  40 --
 .../{systemd_258.1.bb =3D> systemd_259.1.bb}    |  33 +-
 19 files changed, 6 insertions(+), 1601 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_258.1.bb =3D> syst=
emd-boot-native_259.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_258.1.bb =3D> systemd-boo=
t_259.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_258.1.bb =3D>=
 systemd-systemctl-native_259.1.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-musl.h-introdu=
ce-header-file-and-add-__THROW.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-add-fallback-p=
arse_printf_format-implementation.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-Make-mallinfo-=
related-contents-glibc-specific.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-add-src-includ=
e-override-sys-prctl.h-to-avoid-redefi.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0008-distinguish-XS=
I-compliant-strerror_r-from-GNU-specif.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-errno-util-Mak=
e-STRERROR-portable-for-musl.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0010-src-basic-form=
at-util.h-define-RLIM_FMT-to-fit-musl-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0011-src-include-ov=
erride-malloc.h-define-dummy-malloc_tr.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0012-src-shared-con=
dition.c-avoid-using-glibc-ConditionVe.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-build-path.c-a=
void-boot-time-segfault-for-musl.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0014-Handle-missing=
-gshadow-for-musl.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0015-Avoid-sequence=
-point-error.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-Fix-the-segfau=
lt-for-glob-related-codes-and-define-d.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0017-Always-include=
-netinet-if_ether.h-first.patch
 rename meta/recipes-core/systemd/{systemd_258.1.bb =3D> systemd_259.1.bb=
} (96%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_258.1.bb b/met=
a/recipes-core/systemd/systemd-boot-native_259.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_258.1.bb
rename to meta/recipes-core/systemd/systemd-boot-native_259.1.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_258.1.bb b/meta/recip=
es-core/systemd/systemd-boot_259.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_258.1.bb
rename to meta/recipes-core/systemd/systemd-boot_259.1.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb =
b/meta/recipes-core/systemd/systemd-systemctl-native_259.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_259.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
index daf37060d7..39ef398007 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e=
6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420=
a007368f2"
=20
-SRCREV =3D "67a1069b7269cc23c3d04a2fb0cf110abe7abf31"
-SRCBRANCH =3D "v258-stable"
+SRCREV =3D "6a36f1c7420dcb8e5176796676047f058466fe7a"
+SRCBRANCH =3D "v259-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branc=
h=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0004-musl.h-introduce-head=
er-file-and-add-__THROW.patch b/meta/recipes-core/systemd/systemd/0004-mu=
sl.h-introduce-header-file-and-add-__THROW.patch
deleted file mode 100644
index 63dc991f3a..0000000000
--- a/meta/recipes-core/systemd/systemd/0004-musl.h-introduce-header-file=
-and-add-__THROW.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From ca53ef485929773cbb2e4b1d2dd3d15204409d70 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 29 Sep 2025 11:04:09 +0800
-Subject: [PATCH 04/16] musl.h: introduce header file and add __THROW
-
-1. Introduce musl.h in preparation to hold musl related header workaroun=
ds.
-2. Define __THROW as empty to avoid compilation error.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/include/override/musl.h      | 8 ++++++++
- src/include/override/net/if.h    | 2 ++
- src/include/override/sys/mount.h | 2 ++
- 3 files changed, 12 insertions(+)
- create mode 100644 src/include/override/musl.h
-
-diff --git a/src/include/override/musl.h b/src/include/override/musl.h
-new file mode 100644
-index 0000000000..6d747c1005
---- /dev/null
-+++ b/src/include/override/musl.h
-@@ -0,0 +1,8 @@
-+#ifndef _MUSL_H
-+#define _MUSL_H    1
-+
-+#ifndef __THROW
-+#define __THROW
-+#endif
-+
-+#endif /* musl.h */
-diff --git a/src/include/override/net/if.h b/src/include/override/net/if=
.h
-index 1914b596e3..1606be0fef 100644
---- a/src/include/override/net/if.h
-+++ b/src/include/override/net/if.h
-@@ -4,6 +4,8 @@
- #include <features.h>
- #include <linux/if.h>   /* IWYU pragma: export */
-=20
-+#include <musl.h>
-+
- #define IF_NAMESIZE       16
-=20
- extern unsigned int if_nametoindex(const char *__ifname) __THROW;
-diff --git a/src/include/override/sys/mount.h b/src/include/override/sys=
/mount.h
-index 33a843b8f4..1b9d00ee60 100644
---- a/src/include/override/sys/mount.h
-+++ b/src/include/override/sys/mount.h
-@@ -9,6 +9,8 @@
- #include <stdint.h>
- #include <sys/ioctl.h>
-=20
-+#include <musl.h>
-+
- /* Since glibc-2.37 (774058d72942249f71d74e7f2b639f77184160a6), sys/mou=
nt.h includes linux/mount.h, and
-  * we can safely include both headers in the same source file. However,=
 we cannot do that with older glibc.
-  * To avoid conflicts, let's not use glibc's sys/mount.h, and provide o=
ur own minimal implementation.
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0005-add-fallback-parse_pr=
intf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0005=
-add-fallback-parse_printf_format-implementation.patch
deleted file mode 100644
index 8afdec943b..0000000000
--- a/meta/recipes-core/systemd/systemd/0005-add-fallback-parse_printf_fo=
rmat-implementation.patch
+++ /dev/null
@@ -1,411 +0,0 @@
-From e826bec34abac24b6a595919d965b888227d1687 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH 05/16] add fallback parse_printf_format implementation
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-[Rebased for systemd 258]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build                     |   1 +
- src/basic/meson.build           |   5 +
- src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++
- src/basic/parse-printf-format.h |  55 +++++++
- src/basic/stdio-util.h          |   2 +-
- 5 files changed, 335 insertions(+), 1 deletion(-)
- create mode 100644 src/basic/parse-printf-format.c
- create mode 100644 src/basic/parse-printf-format.h
-
-diff --git a/meson.build b/meson.build
-index 238b935372..0df7ecbe67 100644
---- a/meson.build
-+++ b/meson.build
-@@ -697,6 +697,7 @@ foreach header : [
- endforeach
-=20
- foreach header : [
-+        'printf.h',
-         'sys/sdt.h',
-         'threads.h',
-         'valgrind/memcheck.h',
-diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 79af468381..a06d0b4745 100644
---- a/src/basic/meson.build
-+++ b/src/basic/meson.build
-@@ -166,6 +166,11 @@ endforeach
- generated_sources +=3D generated_gperf_headers
- basic_sources +=3D generated_gperf_headers
-=20
-+if conf.get('HAVE_PRINTF_H') !=3D 1
-+        basic_sources +=3D [files('parse-printf-format.c')]
-+endif
-+
-+
- ############################################################
-=20
- filesystem_sets_py =3D files('filesystem-sets.py')
-diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-fo=
rmat.c
-new file mode 100644
-index 0000000000..49437e5445
---- /dev/null
-+++ b/src/basic/parse-printf-format.c
-@@ -0,0 +1,273 @@
-+/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
-+
-+/***
-+  This file is part of systemd.
-+
-+  Copyright 2014 Emil Renner Berthing <systemd@esmil.dk>
-+
-+  With parts from the musl C library
-+  Copyright 2005-2014 Rich Felker, et al.
-+
-+  systemd is free software; you can redistribute it and/or modify it
-+  under the terms of the GNU Lesser General Public License as published=
 by
-+  the Free Software Foundation; either version 2.1 of the License, or
-+  (at your option) any later version.
-+
-+  systemd is distributed in the hope that it will be useful, but
-+  WITHOUT ANY WARRANTY; without even the implied warranty of
-+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-+  Lesser General Public License for more details.
-+
-+  You should have received a copy of the GNU Lesser General Public Lice=
nse
-+  along with systemd; If not, see <http://www.gnu.org/licenses/>.
-+***/
-+
-+#include <stddef.h>
-+#include <string.h>
-+
-+#include "parse-printf-format.h"
-+
-+static const char *consume_nonarg(const char *fmt)
-+{
-+        do {
-+                if (*fmt =3D=3D '\0')
-+                        return fmt;
-+        } while (*fmt++ !=3D '%');
-+        return fmt;
-+}
-+
-+static const char *consume_num(const char *fmt)
-+{
-+        for (;*fmt >=3D '0' && *fmt <=3D '9'; fmt++)
-+                /* do nothing */;
-+        return fmt;
-+}
-+
-+static const char *consume_argn(const char *fmt, size_t *arg)
-+{
-+        const char *p =3D fmt;
-+        size_t val =3D 0;
-+
-+        if (*p < '1' || *p > '9')
-+                return fmt;
-+        do {
-+                val =3D 10*val + (*p++ - '0');
-+        } while (*p >=3D '0' && *p <=3D '9');
-+
-+        if (*p !=3D '$')
-+                return fmt;
-+        *arg =3D val;
-+        return p+1;
-+}
-+
-+static const char *consume_flags(const char *fmt)
-+{
-+        while (1) {
-+                switch (*fmt) {
-+                case '#':
-+                case '0':
-+                case '-':
-+                case ' ':
-+                case '+':
-+                case '\'':
-+                case 'I':
-+                        fmt++;
-+                        continue;
-+                }
-+                return fmt;
-+        }
-+}
-+
-+enum state {
-+        BARE,
-+        LPRE,
-+        LLPRE,
-+        HPRE,
-+        HHPRE,
-+        BIGLPRE,
-+        ZTPRE,
-+        JPRE,
-+        STOP
-+};
-+
-+enum type {
-+        NONE,
-+        PTR,
-+        INT,
-+        UINT,
-+        ULLONG,
-+        LONG,
-+        ULONG,
-+        SHORT,
-+        USHORT,
-+        CHAR,
-+        UCHAR,
-+        LLONG,
-+        SIZET,
-+        IMAX,
-+        UMAX,
-+        PDIFF,
-+        UIPTR,
-+        DBL,
-+        LDBL,
-+        MAXTYPE
-+};
-+
-+static const short pa_types[MAXTYPE] =3D {
-+        [NONE]   =3D PA_INT,
-+        [PTR]    =3D PA_POINTER,
-+        [INT]    =3D PA_INT,
-+        [UINT]   =3D PA_INT,
-+        [ULLONG] =3D PA_INT | PA_FLAG_LONG_LONG,
-+        [LONG]   =3D PA_INT | PA_FLAG_LONG,
-+        [ULONG]  =3D PA_INT | PA_FLAG_LONG,
-+        [SHORT]  =3D PA_INT | PA_FLAG_SHORT,
-+        [USHORT] =3D PA_INT | PA_FLAG_SHORT,
-+        [CHAR]   =3D PA_CHAR,
-+        [UCHAR]  =3D PA_CHAR,
-+        [LLONG]  =3D PA_INT | PA_FLAG_LONG_LONG,
-+        [SIZET]  =3D PA_INT | PA_FLAG_LONG,
-+        [IMAX]   =3D PA_INT | PA_FLAG_LONG_LONG,
-+        [UMAX]   =3D PA_INT | PA_FLAG_LONG_LONG,
-+        [PDIFF]  =3D PA_INT | PA_FLAG_LONG_LONG,
-+        [UIPTR]  =3D PA_INT | PA_FLAG_LONG,
-+        [DBL]    =3D PA_DOUBLE,
-+        [LDBL]   =3D PA_DOUBLE | PA_FLAG_LONG_DOUBLE
-+};
-+
-+#define S(x) [(x)-'A']
-+#define E(x) (STOP + (x))
-+
-+static const unsigned char states[]['z'-'A'+1] =3D {
-+        { /* 0: bare types */
-+                S('d') =3D E(INT), S('i') =3D E(INT),
-+                S('o') =3D E(UINT),S('u') =3D E(UINT),S('x') =3D E(UINT=
), S('X') =3D E(UINT),
-+                S('e') =3D E(DBL), S('f') =3D E(DBL), S('g') =3D E(DBL)=
,  S('a') =3D E(DBL),
-+                S('E') =3D E(DBL), S('F') =3D E(DBL), S('G') =3D E(DBL)=
,  S('A') =3D E(DBL),
-+                S('c') =3D E(CHAR),S('C') =3D E(INT),
-+                S('s') =3D E(PTR), S('S') =3D E(PTR), S('p') =3D E(UIPT=
R),S('n') =3D E(PTR),
-+                S('m') =3D E(NONE),
-+                S('l') =3D LPRE,   S('h') =3D HPRE, S('L') =3D BIGLPRE,
-+                S('z') =3D ZTPRE,  S('j') =3D JPRE, S('t') =3D ZTPRE
-+        }, { /* 1: l-prefixed */
-+                S('d') =3D E(LONG), S('i') =3D E(LONG),
-+                S('o') =3D E(ULONG),S('u') =3D E(ULONG),S('x') =3D E(UL=
ONG),S('X') =3D E(ULONG),
-+                S('e') =3D E(DBL),  S('f') =3D E(DBL),  S('g') =3D E(DB=
L),  S('a') =3D E(DBL),
-+                S('E') =3D E(DBL),  S('F') =3D E(DBL),  S('G') =3D E(DB=
L),  S('A') =3D E(DBL),
-+                S('c') =3D E(INT),  S('s') =3D E(PTR),  S('n') =3D E(PT=
R),
-+                S('l') =3D LLPRE
-+        }, { /* 2: ll-prefixed */
-+                S('d') =3D E(LLONG), S('i') =3D E(LLONG),
-+                S('o') =3D E(ULLONG),S('u') =3D E(ULLONG),
-+                S('x') =3D E(ULLONG),S('X') =3D E(ULLONG),
-+                S('n') =3D E(PTR)
-+        }, { /* 3: h-prefixed */
-+                S('d') =3D E(SHORT), S('i') =3D E(SHORT),
-+                S('o') =3D E(USHORT),S('u') =3D E(USHORT),
-+                S('x') =3D E(USHORT),S('X') =3D E(USHORT),
-+                S('n') =3D E(PTR),
-+                S('h') =3D HHPRE
-+        }, { /* 4: hh-prefixed */
-+                S('d') =3D E(CHAR), S('i') =3D E(CHAR),
-+                S('o') =3D E(UCHAR),S('u') =3D E(UCHAR),
-+                S('x') =3D E(UCHAR),S('X') =3D E(UCHAR),
-+                S('n') =3D E(PTR)
-+        }, { /* 5: L-prefixed */
-+                S('e') =3D E(LDBL),S('f') =3D E(LDBL),S('g') =3D E(LDBL=
), S('a') =3D E(LDBL),
-+                S('E') =3D E(LDBL),S('F') =3D E(LDBL),S('G') =3D E(LDBL=
), S('A') =3D E(LDBL),
-+                S('n') =3D E(PTR)
-+        }, { /* 6: z- or t-prefixed (assumed to be same size) */
-+                S('d') =3D E(PDIFF),S('i') =3D E(PDIFF),
-+                S('o') =3D E(SIZET),S('u') =3D E(SIZET),
-+                S('x') =3D E(SIZET),S('X') =3D E(SIZET),
-+                S('n') =3D E(PTR)
-+        }, { /* 7: j-prefixed */
-+                S('d') =3D E(IMAX), S('i') =3D E(IMAX),
-+                S('o') =3D E(UMAX), S('u') =3D E(UMAX),
-+                S('x') =3D E(UMAX), S('X') =3D E(UMAX),
-+                S('n') =3D E(PTR)
-+        }
-+};
-+
-+size_t parse_printf_format(const char *fmt, size_t n, int *types)
-+{
-+        size_t i =3D 0;
-+        size_t last =3D 0;
-+
-+        memset(types, 0, n);
-+
-+        while (1) {
-+                size_t arg;
-+                unsigned int state;
-+
-+                fmt =3D consume_nonarg(fmt);
-+                if (*fmt =3D=3D '\0')
-+                        break;
-+                if (*fmt =3D=3D '%') {
-+                        fmt++;
-+                        continue;
-+                }
-+                arg =3D 0;
-+                fmt =3D consume_argn(fmt, &arg);
-+                /* flags */
-+                fmt =3D consume_flags(fmt);
-+                /* width */
-+                if (*fmt =3D=3D '*') {
-+                        size_t warg =3D 0;
-+                        fmt =3D consume_argn(fmt+1, &warg);
-+                        if (warg =3D=3D 0)
-+                                warg =3D ++i;
-+                        if (warg > last)
-+                                last =3D warg;
-+                        if (warg <=3D n && types[warg-1] =3D=3D NONE)
-+                                types[warg-1] =3D INT;
-+                } else
-+                        fmt =3D consume_num(fmt);
-+                /* precision */
-+                if (*fmt =3D=3D '.') {
-+                        fmt++;
-+                        if (*fmt =3D=3D '*') {
-+                                size_t parg =3D 0;
-+                                fmt =3D consume_argn(fmt+1, &parg);
-+                                if (parg =3D=3D 0)
-+                                        parg =3D ++i;
-+                                if (parg > last)
-+                                        last =3D parg;
-+                                if (parg <=3D n && types[parg-1] =3D=3D=
 NONE)
-+                                        types[parg-1] =3D INT;
-+                        } else {
-+                                if (*fmt =3D=3D '-')
-+                                        fmt++;
-+                                fmt =3D consume_num(fmt);
-+                        }
-+                }
-+                /* length modifier and conversion specifier */
-+                state =3D BARE;
-+                do {
-+                        unsigned char c =3D *fmt++;
-+
-+                        if (c < 'A' || c > 'z')
-+                                continue;
-+                        state =3D states[state]S(c);
-+                        if (state =3D=3D 0)
-+                                continue;
-+                } while (state < STOP);
-+
-+                if (state =3D=3D E(NONE))
-+                        continue;
-+
-+                if (arg =3D=3D 0)
-+                        arg =3D ++i;
-+                if (arg > last)
-+                        last =3D arg;
-+                if (arg <=3D n)
-+                        types[arg-1] =3D state - STOP;
-+        }
-+
-+        if (last > n)
-+                last =3D n;
-+        for (i =3D 0; i < last; i++)
-+                types[i] =3D pa_types[types[i]];
-+
-+        return last;
-+}
-diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-fo=
rmat.h
-new file mode 100644
-index 0000000000..1d4e8ac914
---- /dev/null
-+++ b/src/basic/parse-printf-format.h
-@@ -0,0 +1,55 @@
-+/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
-+
-+/***
-+  This file is part of systemd.
-+
-+  Copyright 2014 Emil Renner Berthing <systemd@esmil.dk>
-+
-+  With parts from the GNU C Library
-+  Copyright 1991-2014 Free Software Foundation, Inc.
-+
-+  systemd is free software; you can redistribute it and/or modify it
-+  under the terms of the GNU Lesser General Public License as published=
 by
-+  the Free Software Foundation; either version 2.1 of the License, or
-+  (at your option) any later version.
-+
-+  systemd is distributed in the hope that it will be useful, but
-+  WITHOUT ANY WARRANTY; without even the implied warranty of
-+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-+  Lesser General Public License for more details.
-+
-+  You should have received a copy of the GNU Lesser General Public Lice=
nse
-+  along with systemd; If not, see <http://www.gnu.org/licenses/>.
-+***/
-+
-+#pragma once
-+
-+#if HAVE_PRINTF_H
-+#include <printf.h>
-+#else
-+
-+#include <stddef.h>
-+
-+enum {				/* C type: */
-+  PA_INT,			/* int */
-+  PA_CHAR,			/* int, cast to char */
-+  PA_WCHAR,			/* wide char */
-+  PA_STRING,			/* const char *, a '\0'-terminated string */
-+  PA_WSTRING,			/* const wchar_t *, wide character string */
-+  PA_POINTER,			/* void * */
-+  PA_FLOAT,			/* float */
-+  PA_DOUBLE,			/* double */
-+  PA_LAST
-+};
-+
-+/* Flag bits that can be set in a type returned by `parse_printf_format=
'.  */
-+#define	PA_FLAG_MASK		0xff00
-+#define	PA_FLAG_LONG_LONG	(1 << 8)
-+#define	PA_FLAG_LONG_DOUBLE	PA_FLAG_LONG_LONG
-+#define	PA_FLAG_LONG		(1 << 9)
-+#define	PA_FLAG_SHORT		(1 << 10)
-+#define	PA_FLAG_PTR		(1 << 11)
-+
-+size_t parse_printf_format(const char *fmt, size_t n, int *types);
-+
-+#endif /* HAVE_PRINTF_H */
-diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index 052087ce15..62a6b6b316 100644
---- a/src/basic/stdio-util.h
-+++ b/src/basic/stdio-util.h
-@@ -1,10 +1,10 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
-=20
--#include <printf.h>
- #include <stdio.h>
-=20
- #include "forward.h"
-+#include "parse-printf-format.h"
-=20
- _printf_(3, 4)
- static inline char* snprintf_ok(char *buf, size_t len, const char *form=
at, ...) {
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0006-Make-mallinfo-related=
-contents-glibc-specific.patch b/meta/recipes-core/systemd/systemd/0006-M=
ake-mallinfo-related-contents-glibc-specific.patch
deleted file mode 100644
index ea901e5bc5..0000000000
--- a/meta/recipes-core/systemd/systemd/0006-Make-mallinfo-related-conten=
ts-glibc-specific.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From ec5bda959aa2820acc4b6c72668cfb50a745de86 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 29 Sep 2025 12:52:35 +0800
-Subject: [PATCH 06/16] Make mallinfo related contents glibc specific
-
-musl does not define mallinfo related contents.
-And systemd has removed support for checking, and has assumed it
-always exists[1], so these contents need to made glibc specific.
-
-[1] https://github.com/systemd/systemd/commit/abb99d3168259136187f81e0f7=
01cda712ffd78d
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/include/override/malloc.h      |  3 ++-
- src/libsystemd/sd-event/sd-event.c | 14 ++++++++++----
- src/shared/selinux-util.c          | 10 +++++++++-
- 3 files changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/src/include/override/malloc.h b/src/include/override/malloc=
.h
-index d0080b6cbc..c129713831 100644
---- a/src/include/override/malloc.h
-+++ b/src/include/override/malloc.h
-@@ -2,7 +2,7 @@
- #pragma once
-=20
- #include_next <malloc.h>
--
-+#ifdef __GLIBC__
- #if !HAVE_MALLINFO2
- struct mallinfo2 {
-         size_t arena;    /* non-mmapped space allocated from system */
-@@ -37,3 +37,4 @@ static inline struct mallinfo2 mallinfo2(void) {
-         };
- }
- #endif
-+#endif
-diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-even=
t/sd-event.c
-index 6cb496c541..79d574f5a9 100644
---- a/src/libsystemd/sd-event/sd-event.c
-+++ b/src/libsystemd/sd-event/sd-event.c
-@@ -1867,9 +1867,9 @@ _public_ int sd_event_trim_memory(void) {
-          * NULL callback parameter. */
-=20
-         log_debug("Memory pressure event, trimming malloc() memory.");
--
-+#ifdef __GLIBC__
-         struct mallinfo2 before_mallinfo =3D mallinfo2();
--
-+#endif
-         usec_t before_timestamp =3D now(CLOCK_MONOTONIC);
-         hashmap_trim_pools();
-         r =3D malloc_trim(0);
-@@ -1881,7 +1881,7 @@ _public_ int sd_event_trim_memory(void) {
-                 log_debug("Couldn't trim any memory.");
-=20
-         usec_t period =3D after_timestamp - before_timestamp;
--
-+#ifdef __GLIBC__
-         struct mallinfo2 after_mallinfo =3D mallinfo2();
-         size_t l =3D LESS_BY(before_mallinfo.hblkhd, after_mallinfo.hbl=
khd) +
-                 LESS_BY(before_mallinfo.arena, after_mallinfo.arena);
-@@ -1892,7 +1892,13 @@ _public_ int sd_event_trim_memory(void) {
-                    LOG_MESSAGE_ID(SD_MESSAGE_MEMORY_TRIM_STR),
-                    LOG_ITEM("TRIMMED_BYTES=3D%zu", l),
-                    LOG_ITEM("TRIMMED_USEC=3D" USEC_FMT, period));
--
-+#else
-+        log_struct(LOG_DEBUG,
-+                   LOG_MESSAGE("Memory trimming took %s",
-+                               FORMAT_TIMESPAN(period, 0)),
-+                   LOG_MESSAGE_ID(SD_MESSAGE_MEMORY_TRIM_STR),
-+                   LOG_ITEM("TRIMMED_USEC=3D" USEC_FMT, period));
-+#endif
-         return 0;
- }
-=20
-diff --git a/src/shared/selinux-util.c b/src/shared/selinux-util.c
-index f7c4c7d2f8..b669475180 100644
---- a/src/shared/selinux-util.c
-+++ b/src/shared/selinux-util.c
-@@ -91,10 +91,13 @@ static int open_label_db(void) {
-         struct selabel_handle *hnd;
-         /* Avoid maybe-uninitialized false positives */
-         usec_t before_timestamp =3D USEC_INFINITY, after_timestamp =3D =
USEC_INFINITY;
-+#ifdef __GLIBC__
-         struct mallinfo2 before_mallinfo =3D {};
--
-+#endif
-         if (DEBUG_LOGGING) {
-+#ifdef __GLIBC__
-                 before_mallinfo =3D mallinfo2();
-+#endif
-                 before_timestamp =3D now(CLOCK_MONOTONIC);
-         }
-=20
-@@ -104,11 +107,16 @@ static int open_label_db(void) {
-=20
-         if (DEBUG_LOGGING) {
-                 after_timestamp =3D now(CLOCK_MONOTONIC);
-+#ifdef __GLIBC__
-                 struct mallinfo2 after_mallinfo =3D mallinfo2();
-                 size_t l =3D LESS_BY(after_mallinfo.uordblks, before_ma=
llinfo.uordblks);
-                 log_debug("Successfully loaded SELinux database in %s, =
size on heap is %zuK.",
-                           FORMAT_TIMESPAN(after_timestamp - before_time=
stamp, 0),
-                           DIV_ROUND_UP(l, 1024));
-+#else
-+                log_debug("Successfully loaded SELinux database in %s",
-+                          FORMAT_TIMESPAN(after_timestamp - before_time=
stamp, 0));
-+#endif
-         }
-=20
-         /* release memory after measurement */
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-add-src-include-overr=
ide-sys-prctl.h-to-avoid-redefi.patch b/meta/recipes-core/systemd/systemd=
/0007-add-src-include-override-sys-prctl.h-to-avoid-redefi.patch
deleted file mode 100644
index ee1b4689a2..0000000000
--- a/meta/recipes-core/systemd/systemd/0007-add-src-include-override-sys=
-prctl.h-to-avoid-redefi.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 62d0b5c1689076468e95b5473bffd599b51f8d8e Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 29 Sep 2025 14:14:44 +0800
-Subject: [PATCH 07/16] add src/include/override/sys/prctl.h to avoid
- redefinition error
-
-The linux/prctl.h has all the needed macros, what we need is the
-prctl function definition. This avoids error of redefinition.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/include/override/sys/prctl.h | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
- create mode 100644 src/include/override/sys/prctl.h
-
-diff --git a/src/include/override/sys/prctl.h b/src/include/override/sys=
/prctl.h
-new file mode 100644
-index 0000000000..20468bd30f
---- /dev/null
-+++ b/src/include/override/sys/prctl.h
-@@ -0,0 +1,17 @@
-+#ifndef _SYS_PRCTL_H
-+#define _SYS_PRCTL_H
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#include <stdint.h>
-+#include <linux/prctl.h>
-+
-+int prctl (int, ...);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0008-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd=
/0008-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
deleted file mode 100644
index 73819375c8..0000000000
--- a/meta/recipes-core/systemd/systemd/0008-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From bbe0096367618026fe5ebb81c266fd50084f113a Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 08/16] distinguish XSI-compliant strerror_r from GNU-spe=
cific
- strerror_r
-
-XSI-compliant strerror_r and GNU-specific strerror_r are different.
-
-       int strerror_r(int errnum, char *buf, size_t buflen);
-                   /* XSI-compliant */
-
-       char *strerror_r(int errnum, char *buf, size_t buflen);
-                   /* GNU-specific */
-
-We need to distinguish between them. Otherwise, we'll get an int value
-assigned to (char *) variable, resulting in segment fault.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/libsystemd/sd-bus/bus-error.c        | 11 ++++++++++-
- src/libsystemd/sd-journal/journal-send.c |  5 +++++
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/b=
us-error.c
-index bc0164c1b4..e69ffe4f75 100644
---- a/src/libsystemd/sd-bus/bus-error.c
-+++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -400,7 +400,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
-                         return;
-=20
-                 errno =3D 0;
-+#ifndef __GLIBC__
-+                strerror_r(error, m, k);
-+                x =3D m;
-+#else
-                 x =3D strerror_r(error, m, k);
-+#endif
-                 if (errno =3D=3D ERANGE || strlen(x) >=3D k - 1) {
-                         free(m);
-                         k *=3D 2;
-@@ -585,8 +590,12 @@ const char* _bus_error_message(const sd_bus_error *=
e, int error, char buf[static
-=20
-         if (e && e->message)
-                 return e->message;
--
-+#ifndef __GLIBC__
-+        strerror_r(ABS(error), buf, ERRNO_BUF_LEN);
-+        return buf;
-+#else
-         return strerror_r(ABS(error), buf, ERRNO_BUF_LEN);
-+#endif
- }
-=20
- static bool map_ok(const sd_bus_error_map *map) {
-diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/s=
d-journal/journal-send.c
-index e838e7e0d7..28b6e014c0 100644
---- a/src/libsystemd/sd-journal/journal-send.c
-+++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -338,7 +338,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
-                 char* j;
-=20
-                 errno =3D 0;
-+#ifndef __GLIBC__
-+                strerror_r(_saved_errno_, buffer + 8 + k, n - 8 - k);
-+                j =3D buffer + 8 + k;
-+#else
-                 j =3D strerror_r(_saved_errno_, buffer + 8 + k, n - 8 -=
 k);
-+#endif
-                 if (errno =3D=3D 0) {
-                         char error[STRLEN("ERRNO=3D") + DECIMAL_STR_MAX=
(int) + 1];
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0009-errno-util-Make-STRER=
ROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0009-errn=
o-util-Make-STRERROR-portable-for-musl.patch
deleted file mode 100644
index 4a9a05147a..0000000000
--- a/meta/recipes-core/systemd/systemd/0009-errno-util-Make-STRERROR-por=
table-for-musl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7ce68a17deeda43c31a5de5956bad4c92481f1ca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jan 2023 23:39:46 -0800
-Subject: [PATCH 09/16] errno-util: Make STRERROR portable for musl
-
-Sadly, systemd has decided to use yet another GNU extention in a macro
-lets make this such that we can use XSI compliant strerror_r() for
-non-glibc hosts
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Rebased for v258
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/errno-util.h | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
-index 5fe337cfb1..dee34167cb 100644
---- a/src/basic/errno-util.h
-+++ b/src/basic/errno-util.h
-@@ -13,8 +13,16 @@
-  * https://stackoverflow.com/questions/34880638/compound-literal-lifeti=
me-and-if-blocks
-  *
-  * Note that we use the GNU variant of strerror_r() here. */
--#define STRERROR(errnum) strerror_r(ABS(errnum), (char[ERRNO_BUF_LEN]){=
}, ERRNO_BUF_LEN)
-+static inline const char * STRERROR(int errnum);
-=20
-+static inline const char * STRERROR(int errnum) {
-+#ifdef __GLIBC__
-+        return strerror_r(ABS(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_B=
UF_LEN);
-+#else
-+        static __thread char buf[ERRNO_BUF_LEN];
-+        return strerror_r(ABS(errnum), buf, ERRNO_BUF_LEN) ? "unknown e=
rror" : buf;
-+#endif
-+}
- /* A helper to print an error message or message for functions that ret=
urn 0 on EOF.
-  * Note that we can't use ({ =E2=80=A6 }) to define a temporary variabl=
e, so errnum is
-  * evaluated twice. */
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0010-src-basic-format-util=
.h-define-RLIM_FMT-to-fit-musl-.patch b/meta/recipes-core/systemd/systemd=
/0010-src-basic-format-util.h-define-RLIM_FMT-to-fit-musl-.patch
deleted file mode 100644
index d6281b015b..0000000000
--- a/meta/recipes-core/systemd/systemd/0010-src-basic-format-util.h-defi=
ne-RLIM_FMT-to-fit-musl-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From adf7bd6cf6305f5454cfb1ad4f1755880e831f7e Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 29 Sep 2025 14:41:52 +0800
-Subject: [PATCH 10/16] src/basic/format-util.h: define RLIM_FMT to fit m=
usl's
- rlim_t definition
-
-musl always defines rlim_t to be "unsigned long long".
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/format-util.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index e42f788ce6..9275f9615d 100644
---- a/src/basic/format-util.h
-+++ b/src/basic/format-util.h
-@@ -39,6 +39,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
- #  error Unknown timex member size
- #endif
-=20
-+#ifdef __GLIBC__
- #if SIZEOF_RLIM_T =3D=3D 8
- #  define RLIM_FMT "%" PRIu64
- #elif SIZEOF_RLIM_T =3D=3D 4
-@@ -46,6 +47,9 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
- #else
- #  error Unknown rlim_t size
- #endif
-+#else
-+#define RLIM_FMT "%llu"
-+#endif
-=20
- #if SIZEOF_DEV_T =3D=3D 8
- #  define DEV_FMT "%" PRIu64
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0011-src-include-override-=
malloc.h-define-dummy-malloc_tr.patch b/meta/recipes-core/systemd/systemd=
/0011-src-include-override-malloc.h-define-dummy-malloc_tr.patch
deleted file mode 100644
index 0571165440..0000000000
--- a/meta/recipes-core/systemd/systemd/0011-src-include-override-malloc.=
h-define-dummy-malloc_tr.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9173921022c74067f35078d0a4de686cc504e182 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 29 Sep 2025 14:49:13 +0800
-Subject: [PATCH 11/16] src/include/override/malloc.h: define dummy
- malloc_trim/malloc_info for musl
-
-For malloc_trim:
-As we're not releasing any stack, just return 0 to match the
-malloc_trim's meaning in glibc.
-
-For malloc_info:
-There's no real malloc_info implementation in musl, define a dummy
-one which always return -1 to indicate error.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/include/override/malloc.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/include/override/malloc.h b/src/include/override/malloc=
.h
-index c129713831..0b09bf6de6 100644
---- a/src/include/override/malloc.h
-+++ b/src/include/override/malloc.h
-@@ -37,4 +37,12 @@ static inline struct mallinfo2 mallinfo2(void) {
-         };
- }
- #endif
-+#else
-+#include <stdio.h>
-+static inline int malloc_trim(size_t s) {
-+        return 0;
-+}
-+static inline int malloc_info(int options, FILE *stream) {
-+        return -1;
-+}
- #endif
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0012-src-shared-condition.=
c-avoid-using-glibc-ConditionVe.patch b/meta/recipes-core/systemd/systemd=
/0012-src-shared-condition.c-avoid-using-glibc-ConditionVe.patch
deleted file mode 100644
index 6734c47f3c..0000000000
--- a/meta/recipes-core/systemd/systemd/0012-src-shared-condition.c-avoid=
-using-glibc-ConditionVe.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 3deaad26b98ce024a938aa61c1609cbd038da369 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 29 Sep 2025 14:59:27 +0800
-Subject: [PATCH 12/16] src/shared/condition.c: avoid using glibc
- ConditionVersion
-
-The ConditionVersion on glibc is glibc specific.
-And musl does not export programming interface to get its version.
-So it cannot be extended to musl.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/shared/condition.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/shared/condition.c b/src/shared/condition.c
-index b09eff1bfb..4899bd6c39 100644
---- a/src/shared/condition.c
-+++ b/src/shared/condition.c
-@@ -2,7 +2,9 @@
-=20
- #include <fcntl.h>
- #include <fnmatch.h>
-+#ifdef __GLIBC__
- #include <gnu/libc-version.h>
-+#endif
- #include <sys/stat.h>
- #include <sys/utsname.h>
- #include <time.h>
-@@ -254,10 +256,10 @@ static int condition_test_version(Condition *c, ch=
ar **env) {
-=20
-         if (streq(word, "systemd"))
-                 return condition_test_version_cmp(p, STRINGIFY(PROJECT_=
VERSION));
--
-+#ifdef __GLIBC__
-         if (streq(word, "glibc"))
-                 return condition_test_version_cmp(p, gnu_get_libc_versi=
on());
--
-+#endif
-         /* if no predicate has been set, default to "kernel" and use th=
e whole parameter as condition */
-         if (!streq(word, "kernel"))
-                 p =3D c->parameter;
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0013-build-path.c-avoid-bo=
ot-time-segfault-for-musl.patch b/meta/recipes-core/systemd/systemd/0013-=
build-path.c-avoid-boot-time-segfault-for-musl.patch
deleted file mode 100644
index e4d2c198f9..0000000000
--- a/meta/recipes-core/systemd/systemd/0013-build-path.c-avoid-boot-time=
-segfault-for-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a4b921b8d408e0f1c9d035a3ec93c3da3fe42352 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 3 Jul 2024 07:18:42 -0700
-Subject: [PATCH 13/16] build-path.c: avoid boot time segfault for musl
-
-This function, at runtime, should return -ENOEXEC. For musl, it
-somehow segfaults. I think it's related to getauxval, but it's
-really does not matter, just return -ENOEXEC.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/build-path.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/build-path.c b/src/basic/build-path.c
-index 577ff72bce..3a7876798c 100644
---- a/src/basic/build-path.c
-+++ b/src/basic/build-path.c
-@@ -152,6 +152,7 @@ int get_build_exec_dir(char **ret) {
-          */
-=20
-         static int runpath_cached =3D -ERRNO_MAX-1;
-+        return -ENOEXEC;
-         if (runpath_cached =3D=3D -ERRNO_MAX-1) {
-                 const char *runpath =3D NULL;
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshado=
w-for-musl.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-=
gshadow-for-musl.patch
deleted file mode 100644
index a512e3d650..0000000000
--- a/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow-for-m=
usl.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From 6018d55f5fcab127fef9acbd250cdc185983ba59 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH 14/16] Handle missing gshadow for musl
-
-gshadow usage is now present in the userdb code. Mask all uses of it to
-allow compilation on musl
-
-Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-[Rebased for v247]
-Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
-[Rebased for v258]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/include/override/gshadow.h | 10 ++++++++++
- src/shared/user-record-nss.c   | 20 ++++++++++++++++++++
- src/shared/userdb.c            |  7 ++++++-
- 3 files changed, 36 insertions(+), 1 deletion(-)
- create mode 100644 src/include/override/gshadow.h
-
-diff --git a/src/include/override/gshadow.h b/src/include/override/gshad=
ow.h
-new file mode 100644
-index 0000000000..568a9bb2d9
---- /dev/null
-+++ b/src/include/override/gshadow.h
-@@ -0,0 +1,10 @@
-+#ifndef _GSHADOW_H
-+#define _GSHADOW_H    1
-+
-+#if ENABLE_GSHADOW
-+#include_next <gshadow.h>
-+#else
-+struct sgrp;
-+#endif
-+
-+#endif /* gshadow.h */
-diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index 10a5a75e9f..24db7c953d 100644
---- a/src/shared/user-record-nss.c
-+++ b/src/shared/user-record-nss.c
-@@ -296,8 +296,10 @@ int nss_group_to_group_record(
-         if (isempty(grp->gr_name))
-                 return -EINVAL;
-=20
-+#if ENABLE_GSHADOW
-         if (sgrp && !streq_ptr(sgrp->sg_namp, grp->gr_name))
-                 return -EINVAL;
-+#endif
-=20
-         g =3D group_record_new();
-         if (!g)
-@@ -313,6 +315,7 @@ int nss_group_to_group_record(
-=20
-         g->gid =3D grp->gr_gid;
-=20
-+#if ENABLE_GSHADOW
-         if (sgrp) {
-                 if (looks_like_hashed_password(utf8_only(sgrp->sg_passw=
d))) {
-                         g->hashed_password =3D strv_new(sgrp->sg_passwd=
);
-@@ -328,6 +331,7 @@ int nss_group_to_group_record(
-                 if (r < 0)
-                         return r;
-         }
-+#endif
-=20
-         r =3D sd_json_buildo(
-                         &g->json,
-@@ -355,6 +359,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
-         assert(ret_sgrp);
-         assert(ret_buffer);
-=20
-+#if ENABLE_GSHADOW
-         for (;;) {
-                 _cleanup_free_ char *buf =3D NULL;
-                 struct sgrp sgrp =3D {}, *result =3D NULL;
-@@ -383,6 +388,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
-                 buflen *=3D 2;
-                 buf =3D mfree(buf);
-         }
-+#else
-+        return -ESRCH;
-+#endif
- }
-=20
- int nss_group_record_by_name(
-@@ -393,7 +401,9 @@ int nss_group_record_by_name(
-         _cleanup_free_ char *sbuf =3D NULL;
-         _cleanup_free_ struct group *result =3D NULL;
-         bool incomplete =3D false;
-+#if ENABLE_GSHADOW
-         struct sgrp sgrp, *sresult =3D NULL;
-+#endif
-         int r;
-=20
-         assert(name);
-@@ -402,6 +412,7 @@ int nss_group_record_by_name(
-         if (r < 0)
-                 return r;
-=20
-+#if ENABLE_GSHADOW
-         if (with_shadow) {
-                 r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
-                 if (r < 0) {
-@@ -413,6 +424,9 @@ int nss_group_record_by_name(
-                 incomplete =3D true;
-=20
-         r =3D nss_group_to_group_record(result, sresult, ret);
-+#else
-+        r =3D nss_group_to_group_record(result, NULL, ret);
-+#endif
-         if (r < 0)
-                 return r;
-=20
-@@ -429,13 +443,16 @@ int nss_group_record_by_gid(
-         _cleanup_free_ char *sbuf =3D NULL;
-         _cleanup_free_ struct group *result =3D NULL;
-         bool incomplete =3D false;
-+#if ENABLE_GSHADOW
-         struct sgrp sgrp, *sresult =3D NULL;
-+#endif
-         int r;
-=20
-         r =3D getgrgid_malloc(gid, &result);
-         if (r < 0)
-                 return r;
-=20
-+#if ENABLE_GSHADOW
-         if (with_shadow) {
-                 r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
-                 if (r < 0) {
-@@ -447,6 +464,9 @@ int nss_group_record_by_gid(
-                 incomplete =3D true;
-=20
-         r =3D nss_group_to_group_record(result, sresult, ret);
-+#else
-+        r =3D nss_group_to_group_record(result, NULL, ret);
-+#endif
-         if (r < 0)
-                 return r;
-=20
-diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 49850ff216..f4217c0971 100644
---- a/src/shared/userdb.c
-+++ b/src/shared/userdb.c
-@@ -1551,13 +1551,15 @@ static int groupdb_iterator_get_one(UserDBIterat=
or *iterator, GroupRecord **ret)
-                 if (gr) {
-                         _cleanup_free_ char *buffer =3D NULL;
-                         bool incomplete =3D false;
-+#if ENABLE_GSHADOW
-                         struct sgrp sgrp;
--
-+#endif
-                         if (streq_ptr(gr->gr_name, "root"))
-                                 iterator->synthesize_root =3D false;
-                         if (gr->gr_gid =3D=3D GID_NOBODY)
-                                 iterator->synthesize_nobody =3D false;
-=20
-+#if ENABLE_GSHADOW
-                         if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS=
_SHADOW)) {
-                                 r =3D nss_sgrp_for_group(gr, &sgrp, &bu=
ffer);
-                                 if (r < 0) {
-@@ -1570,6 +1572,9 @@ static int groupdb_iterator_get_one(UserDBIterator=
 *iterator, GroupRecord **ret)
-                         }
-=20
-                         r =3D nss_group_to_group_record(gr, r >=3D 0 ? =
&sgrp : NULL, ret);
-+#else
-+                        r =3D nss_group_to_group_record(gr, NULL, ret);
-+#endif
-                         if (r < 0)
-                                 return r;
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0015-Avoid-sequence-point-=
error.patch b/meta/recipes-core/systemd/systemd/0015-Avoid-sequence-point=
-error.patch
deleted file mode 100644
index c3401068cb..0000000000
--- a/meta/recipes-core/systemd/systemd/0015-Avoid-sequence-point-error.p=
atch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5dbeaee2085d3edcf20983fce4208eb174e46422 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 9 Oct 2025 15:19:09 +0800
-Subject: [PATCH 15/16] Avoid sequence-point error
-
-See https://www.openwall.com/lists/musl/2025/09/30/4
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/shared/cpu-set-util.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/shared/cpu-set-util.c b/src/shared/cpu-set-util.c
-index 7a155c12d4..a9c57fc31c 100644
---- a/src/shared/cpu-set-util.c
-+++ b/src/shared/cpu-set-util.c
-@@ -97,9 +97,11 @@ char* cpu_set_to_mask_string(const CPUSet *c) {
-         for (size_t i =3D c->allocated * 8; i > 0; ) {
-                 uint32_t m =3D 0;
-=20
--                for (int j =3D (i % 32 ?: 32) - 1; j >=3D 0; j--)
--                        if (CPU_ISSET_S(--i, c->allocated, c->set))
-+                for (int j =3D (i % 32 ?: 32) - 1; j >=3D 0; j--) {
-+                        --i;
-+                        if (CPU_ISSET_S(i, c->allocated, c->set))
-                                 SET_BIT(m, j);
-+                }
-=20
-                 if (!found_nonzero) {
-                         if (m =3D=3D 0)
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0016-Fix-the-segfault-for-=
glob-related-codes-and-define-d.patch b/meta/recipes-core/systemd/systemd=
/0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch
deleted file mode 100644
index 41dbabfff7..0000000000
--- a/meta/recipes-core/systemd/systemd/0016-Fix-the-segfault-for-glob-re=
lated-codes-and-define-d.patch
+++ /dev/null
@@ -1,409 +0,0 @@
-From bedd0563f4b142aa6376a2ad1e2884d2c0dc3e45 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 13 Oct 2025 17:07:57 +0800
-Subject: [PATCH 16/16] Fix the segfault for glob related codes and defin=
e
- dummy macros
-
-systemd switches to use its own free function to free gl_pathv
-located by glob() function. This causes segfault error for musl.
-
-The backtrace is like below:
-get_meta (p=3Dp@entry=3D0x7ffff7b39fa8 "/proc/sys/net/ipv4/conf/all/rp_f=
ilter")
-    at /usr/src/debug/musl/1.2.5+git/src/malloc/mallocng/meta.h:131
-    131             assert(!((uintptr_t)p & 15));
-
-Why so? Because it's expected that people use globfree to do the memory
-freeing work. Invoking free on gl_pathv[*] is not freeing the correct
-memory address.
-
-The key line in musl's globfree is as below:
-  free(g->gl_pathv[g->gl_offs + i] - offsetof(struct match, name));
-
-So we can see the addree is not gl_pathv[*], it's
-gl_pathv[*] - offsetof(struct match, name).
-
-To address this issue, revert the following codes:
-1. Revert "glob-util: rework safe_glob()"
-   This reverts commit 2a5f950e5643a74bef70b1c3c46ec33ad0e3fd41.
-2. Revert "glob-util: drop unused _cleanup_globfree_"
-   This reverts commit f117272f6645fc2fe9751898770603ed07d15cea.
-
-There is no functional change.
-
-Also, define dummy macros to make things compile for musl.
-
-Note:
-If systemd later adopts some dramatic change for glob, we might
-need to adopt other methods instead of doing the revert. In this
-version, reverting is prefered because there is NO functional change.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/glob-util.c       | 96 ++++++++++++++++++-------------------
- src/basic/glob-util.h       | 12 ++---
- src/core/exec-credential.c  |  6 +--
- src/core/execute.c          |  8 ++--
- src/include/override/glob.h |  6 +++
- src/test/test-glob-util.c   | 27 ++++++-----
- src/tmpfiles/tmpfiles.c     | 20 +++++---
- 7 files changed, 95 insertions(+), 80 deletions(-)
- create mode 100644 src/include/override/glob.h
-
-diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index 5843ef088f..a9c62151af 100644
---- a/src/basic/glob-util.c
-+++ b/src/basic/glob-util.c
-@@ -6,83 +6,81 @@
- #include "dirent-util.h"
- #include "errno-util.h"
- #include "glob-util.h"
-+#include "log.h"
- #include "string-util.h"
- #include "strv.h"
-=20
--DEFINE_TRIVIAL_DESTRUCTOR(closedir_wrapper, void, closedir);
--
--int safe_glob_full(const char *path, int flags, opendir_t opendir_func,=
 char ***ret) {
--        _cleanup_(globfree) glob_t g =3D {
--                .gl_closedir =3D closedir_wrapper,
--                .gl_readdir =3D (struct dirent* (*)(void *)) readdir_no=
_dot,
--                .gl_opendir =3D (void* (*)(const char *)) (opendir_func=
 ?: opendir),
--                .gl_lstat =3D lstat,
--                .gl_stat =3D stat,
--        };
--        int r;
--
--        assert(path);
-+static void closedir_wrapper(void* v) {
-+        (void) closedir(v);
-+}
-=20
-+int safe_glob(const char *path, int flags, glob_t *pglob) {
-+        int k;
-+
-+        /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to =
be set. */
-+        assert(!(flags & GLOB_ALTDIRFUNC));
-+#ifdef __GLIBC__
-+        if (!pglob->gl_closedir)
-+                pglob->gl_closedir =3D closedir_wrapper;
-+        if (!pglob->gl_readdir)
-+                pglob->gl_readdir =3D (struct dirent *(*)(void *)) read=
dir_no_dot;
-+        if (!pglob->gl_opendir)
-+                pglob->gl_opendir =3D (void *(*)(const char *)) opendir=
;
-+        if (!pglob->gl_lstat)
-+                pglob->gl_lstat =3D lstat;
-+        if (!pglob->gl_stat)
-+                pglob->gl_stat =3D stat;
-+#endif
-         errno =3D 0;
--        r =3D glob(path, flags | GLOB_ALTDIRFUNC, NULL, &g);
--        if (r =3D=3D GLOB_NOMATCH)
-+        k =3D glob(path, flags | GLOB_ALTDIRFUNC, NULL, pglob);
-+        if (k =3D=3D GLOB_NOMATCH)
-                 return -ENOENT;
--        if (r =3D=3D GLOB_NOSPACE)
-+        if (k =3D=3D GLOB_NOSPACE)
-                 return -ENOMEM;
--        if (r !=3D 0)
-+        if (k !=3D 0)
-                 return errno_or_else(EIO);
--
--        if (strv_isempty(g.gl_pathv))
-+        if (strv_isempty(pglob->gl_pathv))
-                 return -ENOENT;
-=20
--        if (ret) {
--                *ret =3D g.gl_pathv;
--                TAKE_STRUCT(g); /* To avoid the result being freed. */
--        }
--
-         return 0;
- }
-=20
--int glob_first(const char *path, char **ret) {
--        _cleanup_strv_free_ char **v =3D NULL;
--        int r;
-+int glob_first(const char *path, char **ret_first) {
-+        _cleanup_globfree_ glob_t g =3D {};
-+        int k;
-=20
-         assert(path);
-=20
--        r =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE, &v);
--        if (r =3D=3D -ENOENT) {
--                if (ret)
--                        *ret =3D NULL;
-+        k =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE, &g);
-+        if (k =3D=3D -ENOENT) {
-+                if (ret_first)
-+                        *ret_first =3D NULL;
-                 return false;
-         }
--        if (r < 0)
--                return r;
--
--        assert(!strv_isempty(v));
-+        if (k < 0)
-+                return k;
-=20
--        if (ret) {
--                /* Free all results except for the first one. */
--                STRV_FOREACH(p, strv_skip(v, 1))
--                        *p =3D mfree(*p);
-+        if (ret_first) {
-+                assert(g.gl_pathv && g.gl_pathv[0]);
-=20
--                /* Then, take the first result. */
--                *ret =3D TAKE_PTR(*v);
-+                char *first =3D strdup(g.gl_pathv[0]);
-+                if (!first)
-+                        return log_oom_debug();
-+                *ret_first =3D first;
-         }
-=20
-         return true;
- }
-=20
- int glob_extend(char ***strv, const char *path, int flags) {
--        char **v;
--        int r;
--
--        assert(path);
-+        _cleanup_globfree_ glob_t g =3D {};
-+        int k;
-=20
--        r =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE|flags, &v);
--        if (r < 0)
--                return r;
-+        k =3D safe_glob(path, GLOB_NOSORT|GLOB_BRACE|flags, &g);
-+        if (k < 0)
-+                return k;
-=20
--        return strv_extend_strv_consume(strv, v, /* filter_duplicates =3D=
 */ false);
-+        return strv_extend_strv(strv, g.gl_pathv, false);
- }
-=20
- int glob_non_glob_prefix(const char *path, char **ret) {
-diff --git a/src/basic/glob-util.h b/src/basic/glob-util.h
-index ea3e869319..4fa23f5048 100644
---- a/src/basic/glob-util.h
-+++ b/src/basic/glob-util.h
-@@ -5,18 +5,16 @@
-=20
- #include "forward.h"
-=20
--typedef DIR* (*opendir_t)(const char *);
--
--int safe_glob_full(const char *path, int flags, opendir_t opendir_func,=
 char ***ret);
--static inline int safe_glob(const char *path, int flags, char ***ret) {
--        return safe_glob_full(path, flags, NULL, ret);
--}
-+/* Note: this function modifies pglob to set various functions. */
-+int safe_glob(const char *path, int flags, glob_t *pglob);
-=20
- /* Note: which match is returned depends on the implementation/system a=
nd not guaranteed to be stable */
--int glob_first(const char *path, char **ret);
-+int glob_first(const char *path, char **ret_first);
- #define glob_exists(path) glob_first(path, NULL)
- int glob_extend(char ***strv, const char *path, int flags);
-=20
- int glob_non_glob_prefix(const char *path, char **ret);
-=20
-+#define _cleanup_globfree_ _cleanup_(globfree)
-+
- bool string_is_glob(const char *p) _pure_;
-diff --git a/src/core/exec-credential.c b/src/core/exec-credential.c
-index 5e2bc8edd9..32cbb4d4d0 100644
---- a/src/core/exec-credential.c
-+++ b/src/core/exec-credential.c
-@@ -556,20 +556,20 @@ static int load_credential_glob(
-         assert(search_path);
-=20
-         STRV_FOREACH(d, search_path) {
--                _cleanup_strv_free_ char **paths =3D NULL;
-+                _cleanup_globfree_ glob_t pglob =3D {};
-                 _cleanup_free_ char *j =3D NULL;
-=20
-                 j =3D path_join(*d, ic->glob);
-                 if (!j)
-                         return -ENOMEM;
-=20
--                r =3D safe_glob(j, /* flags =3D */ 0, &paths);
-+                r =3D safe_glob(j, 0, &pglob);
-                 if (r =3D=3D -ENOENT)
-                         continue;
-                 if (r < 0)
-                         return r;
-=20
--                STRV_FOREACH(p, paths) {
-+                FOREACH_ARRAY(p, pglob.gl_pathv, pglob.gl_pathc) {
-                         _cleanup_free_ char *fn =3D NULL;
-                         _cleanup_(erase_and_freep) char *data =3D NULL;
-                         size_t size;
-diff --git a/src/core/execute.c b/src/core/execute.c
-index c384e9dd63..3d6546c037 100644
---- a/src/core/execute.c
-+++ b/src/core/execute.c
-@@ -897,7 +897,7 @@ static int exec_context_load_environment(const Unit =
*unit, const ExecContext *c,
-         assert(ret);
-=20
-         STRV_FOREACH(i, c->environment_files) {
--                _cleanup_strv_free_ char **paths =3D NULL;
-+                _cleanup_globfree_ glob_t pglob =3D {};
-                 bool ignore =3D false;
-                 char *fn =3D *i;
-=20
-@@ -913,7 +913,7 @@ static int exec_context_load_environment(const Unit =
*unit, const ExecContext *c,
-                 }
-=20
-                 /* Filename supports globbing, take all matching files =
*/
--                r =3D safe_glob(fn, /* flags =3D */ 0, &paths);
-+                r =3D safe_glob(fn, 0, &pglob);
-                 if (r < 0) {
-                         if (ignore)
-                                 continue;
-@@ -921,9 +921,9 @@ static int exec_context_load_environment(const Unit =
*unit, const ExecContext *c,
-                 }
-=20
-                 /* When we don't match anything, -ENOENT should be retu=
rned */
--                assert(!strv_isempty(paths));
-+                assert(pglob.gl_pathc > 0);
-=20
--                STRV_FOREACH(path, paths) {
-+                FOREACH_ARRAY(path, pglob.gl_pathv, pglob.gl_pathc) {
-                         _cleanup_strv_free_ char **p =3D NULL;
-=20
-                         r =3D load_env_file(NULL, *path, &p);
-diff --git a/src/include/override/glob.h b/src/include/override/glob.h
-new file mode 100644
-index 0000000000..a8f1829766
---- /dev/null
-+++ b/src/include/override/glob.h
-@@ -0,0 +1,6 @@
-+#pragma once
-+
-+#include_next <glob.h>
-+
-+#define GLOB_BRACE 0
-+#define GLOB_ALTDIRFUNC 0
-diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index a9880f15c8..754dc77447 100644
---- a/src/test/test-glob-util.c
-+++ b/src/test/test-glob-util.c
-@@ -9,7 +9,6 @@
- #include "fs-util.h"
- #include "glob-util.h"
- #include "rm-rf.h"
--#include "strv.h"
- #include "tests.h"
- #include "tmpfile-util.h"
-=20
-@@ -55,25 +54,31 @@ TEST(glob_exists) {
- TEST(safe_glob) {
-         char template[] =3D "/tmp/test-glob-util.XXXXXXX";
-         const char *fn, *fn2, *fname;
--        _cleanup_strv_free_ char **v =3D NULL;
-=20
--        ASSERT_NOT_NULL(mkdtemp(template));
-+        _cleanup_globfree_ glob_t g =3D {};
-+        int r;
-+
-+        assert_se(mkdtemp(template));
-=20
-         fn =3D strjoina(template, "/*");
--        ASSERT_ERROR(safe_glob(fn, /* flags =3D */ 0, &v), ENOENT);
-+        r =3D safe_glob(fn, 0, &g);
-+        assert_se(r =3D=3D -ENOENT);
-=20
-         fn2 =3D strjoina(template, "/.*");
--        ASSERT_ERROR(safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &v), ENOENT=
);
-+        r =3D safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &g);
-+        assert_se(r =3D=3D -ENOENT);
-=20
-         fname =3D strjoina(template, "/.foobar");
--        ASSERT_OK(touch(fname));
-+        assert_se(touch(fname) =3D=3D 0);
-=20
--        ASSERT_ERROR(safe_glob(fn, /* flags =3D */ 0, &v), ENOENT);
-+        r =3D safe_glob(fn, 0, &g);
-+        assert_se(r =3D=3D -ENOENT);
-=20
--        ASSERT_OK(safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &v));
--        ASSERT_EQ(strv_length(v), 1u);
--        ASSERT_STREQ(v[0], fname);
--        ASSERT_NULL(v[1]);
-+        r =3D safe_glob(fn2, GLOB_NOSORT|GLOB_BRACE, &g);
-+        assert_se(r =3D=3D 0);
-+        assert_se(g.gl_pathc =3D=3D 1);
-+        ASSERT_STREQ(g.gl_pathv[0], fname);
-+        ASSERT_NULL(g.gl_pathv[1]);
-=20
-         (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
- }
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 4342ed70ab..2e1fd87f54 100644
---- a/src/tmpfiles/tmpfiles.c
-+++ b/src/tmpfiles/tmpfiles.c
-@@ -2575,21 +2575,25 @@ finish:
- }
-=20
- static int glob_item(Context *c, Item *i, action_t action) {
--        _cleanup_strv_free_ char **paths =3D NULL;
-+        _cleanup_globfree_ glob_t g =3D {
-+#ifdef __GLIBC__
-+                .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
-+#endif
-+        };
-         int r;
-=20
-         assert(c);
-         assert(i);
-         assert(action);
-=20
--        r =3D safe_glob_full(i->path, GLOB_NOSORT|GLOB_BRACE, opendir_n=
omod, &paths);
-+        r =3D safe_glob(i->path, GLOB_NOSORT|GLOB_BRACE, &g);
-         if (r =3D=3D -ENOENT)
-                 return 0;
-         if (r < 0)
-                 return log_error_errno(r, "Failed to glob '%s': %m", i-=
>path);
-=20
-         r =3D 0;
--        STRV_FOREACH(fn, paths)
-+        STRV_FOREACH(fn, g.gl_pathv)
-                 /* We pass CREATION_EXISTING here, since if we are glob=
bing for it, it always has to exist */
-                 RET_GATHER(r, action(c, i, *fn, CREATION_EXISTING));
-=20
-@@ -2601,21 +2605,25 @@ static int glob_item_recursively(
-                 Item *i,
-                 fdaction_t action) {
-=20
--        _cleanup_strv_free_ char **paths =3D NULL;
-+        _cleanup_globfree_ glob_t g =3D {
-+#ifdef __GLIBC__
-+                .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
-+#endif
-+        };
-         int r;
-=20
-         assert(c);
-         assert(i);
-         assert(action);
-=20
--        r =3D safe_glob_full(i->path, GLOB_NOSORT|GLOB_BRACE, opendir_n=
omod, &paths);
-+        r =3D safe_glob(i->path, GLOB_NOSORT|GLOB_BRACE, &g);
-         if (r =3D=3D -ENOENT)
-                 return 0;
-         if (r < 0)
-                 return log_error_errno(r, "Failed to glob '%s': %m", i-=
>path);
-=20
-         r =3D 0;
--        STRV_FOREACH(fn, paths) {
-+        STRV_FOREACH(fn, g.gl_pathv) {
-                 _cleanup_close_ int fd =3D -EBADF;
-=20
-                 /* Make sure we won't trigger/follow file object (such =
as device nodes, automounts, ...)
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0017-Always-include-netine=
t-if_ether.h-first.patch b/meta/recipes-core/systemd/systemd/0017-Always-=
include-netinet-if_ether.h-first.patch
deleted file mode 100644
index 1cd9622540..0000000000
--- a/meta/recipes-core/systemd/systemd/0017-Always-include-netinet-if_et=
her.h-first.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 675460e529f7373d042db581da3fdc3c9c25bf63 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 15 Oct 2025 15:48:09 +0800
-Subject: [PATCH 17/17] Always include netinet/if_ether.h first
-
-When compiling systemd with musl, we get many ethhdr redinition
-errors. This is because netinet/if_ether.h in musl does not check
-__UAPI_DEF_ETHHDR and expects programs to include it before other
-kernel headers.
-See https://www.openwall.com/lists/musl/2025/10/14/2
-
-To avoid this redefinition error, and to avoid resolving conflicts
-every time we upgrade systemd, use '-include netinet/if_ether.h' to
-make sure this file header is included first.
-
-The major consideration behind such method is maintenance.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 0df7ecbe67..842f058f04 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2006,7 +2006,7 @@ config_h =3D configure_file(
-         output : 'config.h',
-         configuration : conf)
-=20
--userspace_c_args +=3D ['-include', 'config.h']
-+userspace_c_args +=3D ['-include', 'config.h', '-include', 'netinet/if_=
ether.h']
-=20
- jinja2_cmdline =3D [meson_render_jinja2, config_h]
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-co=
re/systemd/systemd_259.1.bb
similarity index 96%
rename from meta/recipes-core/systemd/systemd_258.1.bb
rename to meta/recipes-core/systemd/systemd_259.1.bb
index 41f1e756cb..bbec7c9af5 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_259.1.bb
@@ -31,25 +31,6 @@ SRC_URI +=3D " \
            file://0003-Do-not-create-var-log-README.patch \
            "
=20
-# patches needed by musl
-SRC_URI:append:libc-musl =3D " ${SRC_URI_MUSL}"
-SRC_URI_MUSL =3D "\
-               file://0004-musl.h-introduce-header-file-and-add-__THROW.=
patch \
-               file://0005-add-fallback-parse_printf_format-implementati=
on.patch \
-               file://0006-Make-mallinfo-related-contents-glibc-specific=
.patch \
-               file://0007-add-src-include-override-sys-prctl.h-to-avoid=
-redefi.patch \
-               file://0008-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
-               file://0009-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
-               file://0010-src-basic-format-util.h-define-RLIM_FMT-to-fi=
t-musl-.patch \
-               file://0011-src-include-override-malloc.h-define-dummy-ma=
lloc_tr.patch \
-               file://0012-src-shared-condition.c-avoid-using-glibc-Cond=
itionVe.patch \
-               file://0013-build-path.c-avoid-boot-time-segfault-for-mus=
l.patch \
-               file://0014-Handle-missing-gshadow-for-musl.patch \
-               file://0015-Avoid-sequence-point-error.patch \
-               file://0016-Fix-the-segfault-for-glob-related-codes-and-d=
efine-d.patch \
-               file://0017-Always-include-netinet-if_ether.h-first.patch=
 \
-               "
-
 PAM_PLUGINS =3D " \
     pam-plugin-unix \
     pam-plugin-loginuid \
@@ -110,8 +91,6 @@ PACKAGECONFIG:remove:libc-musl =3D " \
 # https://github.com/seccomp/libseccomp/issues/347
 PACKAGECONFIG:remove:mipsarch =3D "seccomp"
=20
-TARGET_CC_ARCH:append:libc-musl =3D " -D__UAPI_DEF_ETHHDR=3D0 -D_LARGEFI=
LE64_SOURCE"
-
 # Some of the dependencies are weak-style recommends - if not available =
at runtime,
 # systemd won't fail but the library-related feature will be skipped wit=
h a warning.
=20
@@ -151,8 +130,6 @@ PACKAGECONFIG[idn] =3D "-Didn=3Dtrue,-Didn=3Dfalse"
 PACKAGECONFIG[ima] =3D "-Dima=3Dtrue,-Dima=3Dfalse"
 # importd requires journal-upload/xz/zlib/bzip2/gcrypt
 PACKAGECONFIG[importd] =3D "-Dimportd=3Denabled,-Dimportd=3Ddisabled,gli=
b-2.0"
-# Update NAT firewall rules
-PACKAGECONFIG[iptc] =3D "-Dlibiptc=3Denabled,-Dlibiptc=3Ddisabled,iptabl=
es"
 PACKAGECONFIG[journal-color] =3D ",,,less"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Denabled,-Dlibcurl=3Ddisab=
led,curl"
 PACKAGECONFIG[kmod] =3D "-Dkmod=3Denabled,-Dkmod=3Ddisabled,kmod,libkmod=
"
@@ -241,6 +218,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-=
Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
                   -Ddbus=3Ddisabled \
                   -Dtests=3Dfalse \
+                  -Dlibc=3D${TCLIBC} \
                   "
=20
 # Hardcode target binary paths to avoid using paths from sysroot or wors=
e
@@ -447,6 +425,7 @@ USERADD_PACKAGES =3D "${PN} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '$=
{PN}-networkd', '', d)} \
 "
 GROUPADD_PARAM:${PN} =3D "-r systemd-journal;"
+GROUPADD_PARAM:${PN} +=3D "-r empower;"
 GROUPADD_PARAM:udev =3D "-r render"
 GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit=
_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'coredum=
p', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
@@ -784,6 +763,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/60-drm.rules \
                ${nonarch_libdir}/udev/rules.d/60-evdev.rules \
                ${nonarch_libdir}/udev/rules.d/60-fido-id.rules \
+               ${nonarch_libdir}/udev/rules.d/60-gpiochip.rules \
                ${nonarch_libdir}/udev/rules.d/60-infiniband.rules \
                ${nonarch_libdir}/udev/rules.d/60-input-id.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-alsa.rules \
@@ -810,6 +790,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/80-net-setup-link.rules \
                ${nonarch_libdir}/udev/rules.d/81-net-bridge.rules \
                ${nonarch_libdir}/udev/rules.d/81-net-dhcp.rules \
+               ${nonarch_libdir}/udev/rules.d/82-net-auto-link-local.rul=
es \
                ${nonarch_libdir}/udev/rules.d/90-image-dissect.rules \
                ${nonarch_libdir}/udev/rules.d/90-vconsole.rules \
                ${nonarch_libdir}/udev/rules.d/90-iocost.rules \
@@ -848,12 +829,6 @@ python __anonymous() {
         bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], P=
ACKAGECONFIG[openssl] and PACKAGECONFIG[cryptsetup]")
 }
=20
-python do_warn_musl() {
-    if d.getVar('TCLIBC') =3D=3D "musl":
-        bb.warn("Using systemd with musl is not recommended since it is =
not supported upstream and some patches are known to be problematic.")
-}
-addtask warn_musl before do_configure
-
 ALTERNATIVE:${PN} =3D "halt reboot shutdown poweroff \
                      ${@bb.utils.contains('PACKAGECONFIG', 'resolved', '=
resolv-conf', '', d)}"
=20
--=20
2.43.0


