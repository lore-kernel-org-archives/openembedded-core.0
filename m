Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id D200D7BEAD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:38:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id m22so1552750wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UVcfRBZzxkG7rhopEiUsRMOLAg4M3iEtTy/TNaZC1hc=;
	b=cPvEMkNz6TqI1wQ5XVSrdBdLcDlI9znEmk9GJujXZQik5RB7HW+igm6r/18mdukWE4
	NNlPn9OgTK7o8Z08DLRKuIjpBjx1CpQwLzcHoxCrcF/Gji5TIf1PEGh7S7oy8ygFcvbw
	QwT3BnQLZDKJ3NPa97uSAGVCWX/+77G8dImmUtItp1aKEVySYjM7e03F/1gDM8U4YTpV
	jm2GTKlrhbTmW7+f4sX4Tac0STiRpKEQ/Wl648gjZSbBBb/vhn1m9J0p/HZb50XYOxq5
	sV71Bk362ZfqfbzSycq0TFkb6ODOKta9hvoDl6X8Dxn00AOcL6m4pbfF4kSMyfjGmH1/
	nHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UVcfRBZzxkG7rhopEiUsRMOLAg4M3iEtTy/TNaZC1hc=;
	b=JCM0gMU8tkoiTUysg6Tqz35zTBu2OPfTNdpVRy33EdQFD6pa+DAJsk7e0nIXUCCvUe
	VRlikj0T/6NlBFszmf7VU8si6COEY4ggPyIN8V4XuB4TtSWT6JsOzSLorIFXHd00y7DP
	G2bFBSUpRgQvn1bwoBe3ontbbMXMF+ZyiaLabZOCy042KoFZ9LbHBo4vRykK2m48Svsv
	HBP20DPpiltgwbesGVYF74dLK18AERKNIWaWPoIm5jtu5//U0yQytjl7ugO+NH8kay4l
	Y83I10wCSFb2i30xzq65PA2TNhF7MErFzDwkcSC7iZ7P566HnE8SslMQW8bdAZKAT0dL
	+rgw==
X-Gm-Message-State: AJcUuke9yx4ZBzmYxopaXNdy5nw/6e5izjAOZ9Pu81apya7SPU+v6iq/
	DYUQrQuN8jAXQDbFVX1vnFx6n+C6qaA=
X-Google-Smtp-Source: ALg8bN6Y6pNXIw4yEkX6NErwZVKvf2NTpPDSr4NcSb9mBxqPcb7wt6iI+kWxTTCEW7QuPIYW71mLDw==
X-Received: by 2002:a1c:90cb:: with SMTP id s194mr9060636wmd.57.1546879115864; 
	Mon, 07 Jan 2019 08:38:35 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o5sm13918958wmg.25.2019.01.07.08.38.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 08:38:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 16:38:19 +0000
Message-Id: <20190107163823.31816-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107163823.31816-1-ross.burton@intel.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
Subject: [PATCH 3/7] meson: fix nativesdk-meson for multilib SDKs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2019 16:38:36 -0000

Multilib SDKs differ only in the environment variables set, so nativesdk-meson's
setup script needs to write a cross file for each environment.

Rename the shipped meson.cross to meson.cross.template, as it cannot be used
directly.  Now that post-relocate scripts are called once for each environment,
the generated meson.cross can be prefixed with TARGET_PREFIX to ensure it is
unique.

Finally rewrite the setup script to use string.Template to perform the expansion
instead of hand-coding the logic.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson/meson-setup.py   | 69 ++++++----------------
 meta/recipes-devtools/meson/meson/meson-wrapper    |  2 +-
 .../meson/nativesdk-meson_0.49.0.bb                | 41 +++++--------
 3 files changed, 36 insertions(+), 76 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipes-devtools/meson/meson/meson-setup.py
index a9749eae9d4..808e2a062f6 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -1,62 +1,31 @@
 #!/usr/bin/env python3
 
 import os
+import string
 import sys
 
-def bail(msg):
-    print(msg, file=sys.stderr)
-    sys.exit(1)
-
-_MARKER = '@@'
-def transform_line(line):
-    # Substitute any special markers of this form:
-    # @@ENV@@
-    # with the value of ENV, split into meson array syntax.
-    start = line.find(_MARKER)
-    if start == -1:
-        return line
-
-    end = line.rfind(_MARKER)
-    if end == start:
-        return line
-
-    # Lookup value of the env var.
-    var = line[start+len(_MARKER):end]
-    try:
-        val = os.environ[var]
-    except KeyError:
-        bail('cannot generate meson.cross; env var %s not set' % var)
+class Template(string.Template):
+    delimiter = "@"
 
-    # Transform into meson array.
-    val = ["'%s'" % x for x in val.split()]
-    val = ', '.join(val)
-    val = '[%s]' % val
+class Environ():
+    def __getitem__(self, name):
+        val = os.environ[name]
+        val = ["'%s'" % x for x in val.split()]
+        val = ', '.join(val)
+        val = '[%s]' % val
+        return val
 
-    before = line[:start]
-    after = line[end+len(_MARKER):]
-
-    return '%s%s%s' % (before, val, after)
-
-# Make sure this is really an SDK extraction environment.
 try:
     sysroot = os.environ['OECORE_NATIVE_SYSROOT']
 except KeyError:
-    bail('OECORE_NATIVE_SYSROOT env var must be set')
-
-cross_file = os.path.join(sysroot, 'usr/share/meson/meson.cross')
-tmp_cross_file = '%s.tmp' % cross_file
+    print("Not in environment setup, bailing")
+    sys.exit(1)
 
-# Read through and transform the current meson.cross.
-lines = []
-with open(cross_file, 'r') as f:
-    for line in f:
-        lines.append(transform_line(line))
+template_file = os.path.join(sysroot, 'usr/share/meson/meson.cross.template')
+cross_file = os.path.join(sysroot, 'usr/share/meson/%smeson.cross' % os.environ["TARGET_PREFIX"])
 
-# Write the transformed result to a tmp file and atomically rename it. In case
-# we crash during the file write, we don't want an invalid meson.cross file.
-with open(tmp_cross_file, 'w') as f:
-    for line in lines:
-        f.write(line)
-    f.flush()
-    os.fdatasync(f.fileno())
-os.rename(tmp_cross_file, cross_file)
+with open(template_file) as in_file:
+    template = in_file.read()
+    output = Template(template).substitute(Environ())
+    with open(cross_file, "w") as out_file:
+        out_file.write(output)
diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index b2e00da513f..d4ffe60f9a1 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -10,5 +10,5 @@ fi
 unset CC CXX CPP LD AR NM STRIP
 
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-     --cross-file "$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.cross" \
+     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
      "$@"
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
index 721ee8c8f12..55c57775e06 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
@@ -5,9 +5,6 @@ inherit nativesdk
 SRC_URI += "file://meson-setup.py \
             file://meson-wrapper"
 
-def meson_array(var, d):
-    return "', '".join(d.getVar(var).split()).join(("'", "'"))
-
 # both are required but not used by meson
 MESON_SDK_ENDIAN = "bogus-endian"
 MESON_TARGET_ENDIAN = "bogus-endian"
@@ -17,32 +14,31 @@ MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
 MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CXXFLAGS}"
 MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_LDFLAGS}"
 
-# This logic is similar but not identical to that in meson.bbclass, since it's
-# generating for an SDK rather than a cross-compile. Important differences are:
+# The cross file logic is similar but not identical to that in meson.bbclass,
+# since it's generating for an SDK rather than a cross-compile. Important
+# differences are:
 # - We can't set vars like CC, CXX, etc. yet because they will be filled in with
 #   real paths by meson-setup.sh when the SDK is extracted.
 # - Some overrides aren't needed, since the SDK injects paths that take care of
 #   them.
-addtask write_config before do_install
-do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
-do_write_config() {
-    # This needs to be Py to split the args into single-element lists
-    cat >${WORKDIR}/meson.cross <<EOF
+do_install_append() {
+    install -d ${D}${datadir}/meson
+    cat >${D}${datadir}/meson/meson.cross.template <<EOF
 [binaries]
-c = @@CC@@
-cpp = @@CXX@@
-ar = @@AR@@
-nm = @@NM@@
-ld = @@LD@@
-strip = @@STRIP@@
+c = @CC
+cpp = @CXX
+ar = @AR
+nm = @NM
+ld = @LD
+strip = @STRIP
 pkgconfig = 'pkg-config'
 
 [properties]
 needs_exe_wrapper = true
-c_args = @@CFLAGS@@
-c_link_args = @@LDFLAGS@@
-cpp_args = @@CPPFLAGS@@
-cpp_link_args = @@LDFLAGS@@
+c_args = @CFLAGS
+c_link_args = @LDFLAGS
+cpp_args = @CPPFLAGS
+cpp_link_args = @LDFLAGS
 
 [host_machine]
 system = '${SDK_OS}'
@@ -50,11 +46,6 @@ cpu_family = '${SDK_ARCH}'
 cpu = '${SDK_ARCH}'
 endian = '${MESON_SDK_ENDIAN}'
 EOF
-}
-
-do_install_append() {
-    install -d ${D}${datadir}/meson
-    install -m 0644 ${WORKDIR}/meson.cross ${D}${datadir}/meson/
 
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
     install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
-- 
2.11.0


