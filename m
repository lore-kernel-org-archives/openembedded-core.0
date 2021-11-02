Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01A7C4332F
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.493.1635871641167980503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509746"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509746"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:41 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575192"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/24] meson: install native file in sdk
Date: Wed,  3 Nov 2021 00:44:02 +0800
Message-Id: 
 <2ea62c23bf9d37e46d3cd9aa7527c535994d4b77.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157801

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Without a native environment file, find_program() can't
locate the native program inside SDK.

That stops wayland compositor using wayland scanner.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6aed1084006727e3baf70ab9d1f70d9d2d6c01f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../meson/meson/meson-setup.py                |  8 ++++
 .../meson/meson/meson-wrapper                 |  1 +
 .../meson/nativesdk-meson_0.58.1.bb           | 46 +++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipes-devtools/meson/meson/meson-setup.py
index 7ac4e3ad47..daaa551de2 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -27,9 +27,17 @@ except KeyError:
 
 template_file = os.path.join(sysroot, 'usr/share/meson/meson.cross.template')
 cross_file = os.path.join(sysroot, 'usr/share/meson/%smeson.cross' % os.environ["TARGET_PREFIX"])
+native_template_file = os.path.join(sysroot, 'usr/share/meson/meson.native.template')
+native_file = os.path.join(sysroot, 'usr/share/meson/meson.native')
 
 with open(template_file) as in_file:
     template = in_file.read()
     output = Template(template).substitute(Environ())
     with open(cross_file, "w") as out_file:
         out_file.write(output)
+
+with open(native_template_file) as in_file:
+    template = in_file.read()
+    output = Template(template).substitute({'OECORE_NATIVE_SYSROOT': os.environ['OECORE_NATIVE_SYSROOT']})
+    with open(native_file, "w") as out_file:
+        out_file.write(output)
diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index d4ffe60f9a..d4b5187f8d 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -11,4 +11,5 @@ unset CC CXX CPP LD AR NM STRIP
 
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
      --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
+     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
      "$@"
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
index 5657397ddc..7b77041c7e 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
@@ -13,8 +13,54 @@ SRC_URI += "file://meson-setup.py \
 #   real paths by meson-setup.sh when the SDK is extracted.
 # - Some overrides aren't needed, since the SDK injects paths that take care of
 #   them.
+def var_list2str(var, d):
+    items = d.getVar(var).split()
+    return items[0] if len(items) == 1 else ', '.join(repr(s) for s in items)
+
+def generate_native_link_template(d):
+    val = ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}',
+           '-L@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
+           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${libdir_native}',
+           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
+           '-Wl,--allow-shlib-undefined'
+        ]
+    build_arch = d.getVar('BUILD_ARCH')
+    if 'x86_64' in build_arch:
+        loader = 'ld-linux-x86-64.so.2'
+    elif 'i686' in build_arch:
+        loader = 'ld-linux.so.2'
+    elif 'aarch64' in build_arch:
+        loader = 'ld-linux-aarch64.so.1'
+    elif 'ppc64le' in build_arch:
+        loader = 'ld64.so.2'
+
+    if loader:
+        val += ['-Wl,--dynamic-linker=@{OECORE_NATIVE_SYSROOT}${base_libdir_native}/' + loader]
+
+    return repr(val)
+
 do_install:append() {
     install -d ${D}${datadir}/meson
+
+    cat >${D}${datadir}/meson/meson.native.template <<EOF
+[binaries]
+c = ${@meson_array('BUILD_CC', d)}
+cpp = ${@meson_array('BUILD_CXX', d)}
+ar = ${@meson_array('BUILD_AR', d)}
+nm = ${@meson_array('BUILD_NM', d)}
+strip = ${@meson_array('BUILD_STRIP', d)}
+readelf = ${@meson_array('BUILD_READELF', d)}
+pkgconfig = 'pkg-config-native'
+
+[built-in options]
+c_args = ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@var_list2str('BUILD_OPTIMIZATION', d)}]
+c_link_args = ${@generate_native_link_template(d)}
+cpp_args = ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@var_list2str('BUILD_OPTIMIZATION', d)}]
+cpp_link_args = ${@generate_native_link_template(d)}
+[properties]
+sys_root = '@OECORE_NATIVE_SYSROOT'
+EOF
+
     cat >${D}${datadir}/meson/meson.cross.template <<EOF
 [binaries]
 c = @CC
-- 
2.31.1


