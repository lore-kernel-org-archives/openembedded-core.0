Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66946C021AB
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18173.1739955343800058983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414568d945=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6rk1x009216
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:55:43 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kgrv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:55:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 00:55:41 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 00:55:41 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 1/2] qemu: fix compile error with lttng-ust
Date: Wed, 19 Feb 2025 16:55:01 +0800
Message-ID: <20250219085502.2297068-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: a6aLzXhL0g65a6Kk580rybnZ3N66LGUt
X-Proofpoint-ORIG-GUID: a6aLzXhL0g65a6Kk580rybnZ3N66LGUt
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b59c8e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=ID6ng7r3AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=FrdAwnLtbqzxO-SMORIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1011
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190070
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51J6rk1x009216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211689

From: Kai Kang <kai.kang@windriver.com>

When PACKAGECONFIG ust is enabled for qemu, it fails to compile:

| In file included from trace/trace-ust-all.h:44179,
|                  from trace/trace-ust-all.c:13:
| /path_to/qemu/6.2.0-r0/recipe-sysroot/usr/include/lttng/tracepoint-even=
t.h:67:10:
    error: #include expects "FILENAME" or <FILENAME>
|    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Backport upstream commit to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...-fix-compilation-with-lttng-ust-2.13.patch | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-trace-fix-compil=
ation-with-lttng-ust-2.13.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index bee30cd56f..02afafc2e8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -128,6 +128,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
            file://CVE-2024-3446-0005.patch \
            file://CVE-2024-3446-0006.patch \
            file://CVE-2024-3447.patch \
+           file://0001-trace-fix-compilation-with-lttng-ust-2.13.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-trace-fix-compilation-w=
ith-lttng-ust-2.13.patch b/meta/recipes-devtools/qemu/qemu/0001-trace-fix=
-compilation-with-lttng-ust-2.13.patch
new file mode 100644
index 0000000000..d3cb19c839
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-trace-fix-compilation-with-ltt=
ng-ust-2.13.patch
@@ -0,0 +1,75 @@
+From e32aaa5a19e24233180042f84a0235a209de71cc Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Mon, 28 Mar 2022 12:47:13 +0400
+Subject: [PATCH] trace: fix compilation with lttng-ust >=3D 2.13
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+On Fedora 36, with lttng-ust 2.13.1, compilation fails with:
+
+In file included from trace/trace-ust-all.h:49085,
+                 from trace/trace-ust-all.c:13:
+/usr/include/lttng/tracepoint-event.h:67:10: error: #include expects "FI=
LENAME" or <FILENAME>
+   67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
+tracepoint file name") from 2012, starting from lttng-ust 2.1, the API
+was changed to expect TRACEPOINT_INCLUDE to be defined as a string.
+
+In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
+macro"), in 2021, the compatibility macro was removed.
+
+Use the "new" API from 2012, and bump the version requirement to 2.1 to
+fix compilation with >=3D 2.13.
+
+According to repology, all distributions we support have >=3D 2.1 (cento=
s
+8 has oldest with 2.8.1 afaict)
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20220328084717.367993-2-marcandre.lureau@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/e32aaa5]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ meson.build                              | 4 ++--
+ scripts/tracetool/format/ust_events_h.py | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 04ce33fef1..861de93c4f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -455,8 +455,8 @@ if 'CONFIG_GIO' in config_host
+ endif
+ lttng =3D not_found
+ if 'ust' in get_option('trace_backends')
+-  lttng =3D dependency('lttng-ust', required: true, method: 'pkg-config=
',
+-                     kwargs: static_kwargs)
++  lttng =3D dependency('lttng-ust', required: true, version: '>=3D 2.1'=
,
++                     method: 'pkg-config', kwargs: static_kwargs)
+ endif
+ pixman =3D not_found
+ if have_system or have_tools
+diff --git a/scripts/tracetool/format/ust_events_h.py b/scripts/tracetoo=
l/format/ust_events_h.py
+index 6ce559f6cc..b99fe6896b 100644
+--- a/scripts/tracetool/format/ust_events_h.py
++++ b/scripts/tracetool/format/ust_events_h.py
+@@ -29,8 +29,8 @@ def generate(events, backend, group):
+         '#undef TRACEPOINT_PROVIDER',
+         '#define TRACEPOINT_PROVIDER qemu',
+         '',
+-        '#undef TRACEPOINT_INCLUDE_FILE',
+-        '#define TRACEPOINT_INCLUDE_FILE ./%s' % include,
++        '#undef TRACEPOINT_INCLUDE',
++        '#define TRACEPOINT_INCLUDE "./%s"' % include,
+         '',
+         '#if !defined (TRACE_%s_GENERATED_UST_H) || \\'  % group.upper(=
),
+         '     defined(TRACEPOINT_HEADER_MULTI_READ)',
+--=20
+2.47.1
+
--=20
2.47.0


