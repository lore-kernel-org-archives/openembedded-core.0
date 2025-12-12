Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C560D49227
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 13:39:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12880.1765546744707388865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 05:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IS0J+Jgr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444187e08a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC7nLe53574611
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 13:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Q40Cf6ZMawJK7ZPNm0aN
	dbchaJu9++PrzJqHmjJnlVs=; b=IS0J+JgrqHDXJ6DoLu7yuLCNADIJEyznynpk
	8jG9XCiU7GeJetWjOmEQGL78ft2kcTPTAQzx475wj4qWk6M+LEo5lVgb5WXtHOXW
	nmy+v6h7g2f+yLAXJdDx/7XwFgJfcwaHlJzbfbvCuAzFFHJBIe4idE2jib6UE9rZ
	a5bSCK3HDeInnXt+LFv41uXBmuiqrKLzEW8+DHISsJLmP0wxxUhSolHfln04hx6d
	KAd0mInJSIPJxrhsk+sFiDuYaCLDvLBs45ZPphtlP1KdW5XHHnRkL7EeTugOqQi1
	mMRHxNdPxLRqLCcEqlMbO7qT9q58EVRd0uf1zz0dGVNe4K2EeA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01nkeg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 13:39:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 12 Dec 2025 05:39:02 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 12 Dec 2025 05:39:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] gstreamer1.0: install Gst-1.0.gir to ${libdir} for multilib
Date: Fri, 12 Dec 2025 21:39:00 +0800
Message-ID: <20251212133900.344838-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=693c1af7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8
 a=OefPE4xtCbCOlgiW4O0A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jw9IQtX9pJFOZl2uIQVyloNRwYoOkQAu
X-Proofpoint-ORIG-GUID: jw9IQtX9pJFOZl2uIQVyloNRwYoOkQAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEwNyBTYWx0ZWRfXwh1y8qpjJ1CP
 TYEZRuip9P69kbDLlhdvRnMRkvtELCEw8+wDpenaCeJvfohj42PizJYvvRPAVW+lCmviEX80/rJ
 Q2xv8owAQGBSYBsJNyDkPOjesKTI93loug7RGFE6Igv2ey2j1GwmBV9xvP0ccFS4tKA6lk03xiJ
 4FbnPL7e7SusAGRPq4Dv91AdOc6VdYzmykdlpbOi1Sb0mO8i+U1apuBz+2LOMnZOJhtT1K6Ixty
 WVPM4W+KkEg8GkZBZ66QBf7mX0iI8+aj3KY0A9lWeEaCsF9gyYQNNNQCl3qZW1p8XX/44SqlPBE
 7HjU9vFuUE0ksk3SYnzQL+FaJGpK6LEvxJEEJNKernWKAPj91eMYf/4ME/5i23BlX57mNMeX7tg
 NFRbs9iWSP9sNQI+jaZE1Q86c8JpAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 13:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227590

While installing 32 bit gstreamer package and 64 bit gstreamer package to
one rootfs, package management (dnf) reported a conflict failure
|Error: Transaction test error:
|  file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted installs of
gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_64 and lib32-gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_32

Due to upstream commit [1], the size of padding differs between 32 bit
arch and 64 bit arch
...
|typedef struct {
|  /* < private > */
|  gpointer pointer;
|#if GLIB_SIZEOF_VOID_P == 8
|  guint8 padding[8];
|#elif GLIB_SIZEOF_VOID_P == 4
|  guint8 padding[12];
|#else
|  #error "Only 32 bit and 64 bit pointers supported currently"
|#endif
|} GstIdStr;
...

It made the generated Gst-1.0.gir be different for 32 bit and 64 bit packages,
Install Gst-1.0.gir to ${libdir} which splits 32 bit and 64 bit libraries

Submit a patch to upstream to add meson option (gir_dir_prefix) to override default
gir install location (datadir). When multilib is enabled, install .gir files to
${libdir} other than ${datadir}

[1] https://gitlab.freedesktop.org/-/commit/0ee18781f9b210129da23a85236266bf84bafa83#f9880c83c8bdc4d61ac7d51a4a212f602cad5d86_0_39

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ir_prefix-option-to-override-gir-def.patch | 149 ++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.26.7.bb          |   3 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
new file mode 100644
index 0000000000..506e33c61f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
@@ -0,0 +1,149 @@
+From 6fb2149fc5c7b1805c138a52990305a4f53170fa Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@eng.windriver.com>
+Date: Thu, 11 Dec 2025 18:38:24 -0800
+Subject: [PATCH] meson: Add gir_dir_prefix option to override gir default
+ location
+
+Originally, the .gir files would always get installed into the default
+location (datadir).
+
+This commit adds meson option (gir_dir_prefix) to override it as intermediate
+prefix for gir installation under ${prefix}, such as
+
+  $ meson setup -Dgir_dir_prefix=lib64
+
+The .gir files are installed to /usr/lib64/gir-1.0
+
+  Installing gst/Gst-1.0.gir to /usr/lib64/gir-1.0
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10363]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ gst/meson.build                 |  1 +
+ libs/gst/base/meson.build       |  1 +
+ libs/gst/check/meson.build      |  1 +
+ libs/gst/controller/meson.build |  1 +
+ libs/gst/net/meson.build        |  1 +
+ meson.build                     | 23 ++++++++++++++++++++++-
+ meson_options.txt               |  3 +++
+ 7 files changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/gst/meson.build b/gst/meson.build
+index c69a6dc..ebe673d 100644
+--- a/gst/meson.build
++++ b/gst/meson.build
+@@ -322,6 +322,7 @@ if build_gir
+     'export_packages' : pkg_name,
+     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0' ],
+     'install' : true,
++    'install_dir_gir': gst_girdir,
+     'extra_args' : gst_gir_extra_args,
+   }
+   library_def += {'gir': [gir]}
+diff --git a/libs/gst/base/meson.build b/libs/gst/base/meson.build
+index b7aca73..2fb0590 100644
+--- a/libs/gst/base/meson.build
++++ b/libs/gst/base/meson.build
+@@ -89,6 +89,7 @@ if build_gir
+     'include_directories' : [configinc, libsinc, privinc],
+     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
+     'install' : true,
++    'install_dir_gir': gst_girdir,
+     'extra_args' : gst_gir_extra_args,
+   }
+ 
+diff --git a/libs/gst/check/meson.build b/libs/gst/check/meson.build
+index 679a15d..e934526 100644
+--- a/libs/gst/check/meson.build
++++ b/libs/gst/check/meson.build
+@@ -86,6 +86,7 @@ if build_gir
+     'include_directories' : [configinc, libsinc, privinc],
+     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
+     'install' : true,
++    'install_dir_gir': gst_girdir,
+     'extra_args' : gst_gir_extra_args,
+   }
+   library_def += {'gir': [gir]}
+diff --git a/libs/gst/controller/meson.build b/libs/gst/controller/meson.build
+index 9d38af8..411b951 100644
+--- a/libs/gst/controller/meson.build
++++ b/libs/gst/controller/meson.build
+@@ -81,6 +81,7 @@ if build_gir
+     'include_directories' : [configinc, libsinc, privinc],
+     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
+     'install' : true,
++    'install_dir_gir': gst_girdir,
+     'extra_args' : gst_gir_extra_args,
+   }
+   library_def += {'gir': [gir]}
+diff --git a/libs/gst/net/meson.build b/libs/gst/net/meson.build
+index 60ed92c..b81139e 100644
+--- a/libs/gst/net/meson.build
++++ b/libs/gst/net/meson.build
+@@ -67,6 +67,7 @@ if build_gir
+     'include_directories' : [configinc, libsinc],
+     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gio-2.0', 'Gst-1.0'],
+     'install' : true,
++    'install_dir_gir': gst_girdir,
+     'extra_args' : gst_gir_extra_args,
+   }
+   library_def += {'gir': [gir]}
+diff --git a/meson.build b/meson.build
+index e2127f6..7ecfc2d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -629,6 +629,27 @@ if static_build
+   gst_c_args += ['-DGST_STATIC_COMPILATION']
+ endif
+ 
++gir_dir_prefix = get_option('gir_dir_prefix')
++if gir_dir_prefix == '' or gir_dir_prefix == get_option('datadir')
++  gir_dir_prefix = get_option('datadir')
++  gir_dir_pc_prefix = '${datadir}'
++else
++  gir_dir_pc_prefix = '${prefix}' / gir_dir_prefix
++endif
++
++# This is effectively the GIR XML format major version
++gir_suffix = 'gir-1.0'
++
++gst_girdir = prefix / gir_dir_prefix / gir_suffix
++
++
++if build_gir
++  gst_c_args += [
++    '-DGIR_SUFFIX="@0@"'.format(gir_suffix),
++    '-DGIR_DIR="@0@"'.format(gst_girdir),
++  ]
++endif
++
+ # Used in gst/parse/meson.build and below
+ python3 = import('python').find_installation()
+ 
+@@ -680,7 +701,7 @@ pkgconfig_variables = [
+   'exec_prefix=${prefix}',
+   'toolsdir=${exec_prefix}/bin',
+   'pluginsdir=${libdir}/gstreamer-1.0',
+-  'girdir=${datadir}/gir-1.0',
++  'girdir=' + gir_dir_pc_prefix / gir_suffix,
+   'typelibdir=${libdir}/girepository-1.0',
+   'pluginscannerdir=${libexecdir}/gstreamer-1.0'
+ ]
+diff --git a/meson_options.txt b/meson_options.txt
+index 78af552..97c03c6 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -32,6 +32,9 @@ option('examples', type : 'feature', value : 'auto', yield : true)
+ option('tests', type : 'feature', value : 'auto', yield : true)
+ option('benchmarks', type : 'feature', value : 'auto', yield : true)
+ option('tools', type : 'feature', value : 'auto', yield : true)
++option('gir_dir_prefix',
++       type: 'string',
++       description: 'Intermediate prefix for gir installation under ${prefix}')
+ option('introspection', type : 'feature', value : 'auto', yield : true, description : 'Generate gobject-introspection bindings')
+ option('nls', type : 'feature', value : 'auto', yield: true, description : 'Enable native language support (translations)')
+ option('extra-checks', type : 'feature', value : 'enabled', yield : true, description : 'Enable extra runtime checks')
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
index 444165a869..88b1af0796 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch \
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
+           file://0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch \
            "
 SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
 
@@ -56,6 +57,8 @@ EXTRA_OEMESON += " \
     ${@gettext_oemeson(d)} \
 "
 
+EXTRA_OEMESON:append:class-target = " ${@'-Dgir_dir_prefix=${baselib}' if d.getVar('MULTILIBS') else ''}"
+
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-- 
2.34.1


