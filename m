Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 13ADF61221
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 05:15:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a6so12955463wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 21:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o5NwHUfj5hK+IOol1Qzhg3cqaJ0XLynoyKUdPapWt+Y=;
	b=NtSCm5vxPrssD2m8Z4dDCxg1ZUUYR1Zdzs4aD/1xH9aMtXwlpxu+0/miEu6wNfIZyA
	13LB3qEV0VYSbLsDxk5FTvsq+M4QOzWY1f4259abTX9DoVBx/s1sKJ9l9lZ0o7JNU6jq
	NLrh7LoHhDUNRsJzmvF17tvABI+3pAOK5bRbP/sOspsvTbk+zhiK8QCTRvJnuvRhIavW
	48nXNdj9GECLK/Eln8+TAZgyuwnMhgLzotiX8C8oKPyx7yXLEBgutMfF/81xaUOoUdPW
	nReUkYXjLiGkx29p+VUN8gojUFFmDtsT4ZTWR8KPJRYScoozykPZoGGA0xLyRhGFX7FN
	QuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o5NwHUfj5hK+IOol1Qzhg3cqaJ0XLynoyKUdPapWt+Y=;
	b=K+V/ZYcTJ7HehGJIBeHjiEitq7TqkpUvoYwtEGB3FFFOesNywhPREI/M8BJ7jB/aAv
	CLGFDROGjPZsLte424zKr0vjDftbfytQY/MZ9oza+jh/i+R5c9b4H7ivLAd629oVEtjB
	r8Y4Ke4iQt6tUw0a52uuQBYdSWgnkfuH3bup5X7o0LxtHckmBqvEGK5KuzpdokNRJ+uO
	rly671f/0aaZse/xnuFwcaA5PkmNQbnzcqGjnIIzq7rUxpeY021pYVFzmlFNcm0ScYYm
	LAPlwW2dWJC3l6/f3jQwE9X79jDP5luTolJdmaIqLA71MrpT0DOYMiXrgpg8GQQ21LmX
	OtfA==
X-Gm-Message-State: APjAAAXh07SjXcxiJ+9iYgoOal5dY5pW23Y7U2BngwLk6z5s+8qNEwla
	fZq9iQMmVN6E0ybqUK9ZUOeWUF/g
X-Google-Smtp-Source: APXvYqzVI7tDQpka6Bh5fpg8rPrr0rHykJTCgb0Vk41hVgLMXOVQ/9e5Ti8mxY7cbveoGxMk1eKNIg==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr8286956wmi.37.1581743721238; 
	Fri, 14 Feb 2020 21:15:21 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y131sm10468242wmc.13.2020.02.14.21.15.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 21:15:20 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 05:15:13 +0000
Message-Id: <20200215051514.58365-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3 1/2] meson.bbclass: Parameterise meson.cross
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
X-List-Received-Date: Sat, 15 Feb 2020 05:15:22 -0000

Add MESON_CROSS_BINARIES, MESON_CROSS_PROPERTIES as a colon separated
list of meson properties which are exported into meson.cross.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3: None
Changes in v2: None

 meta/classes/meson.bbclass | 161 ++++++++++++++++++++-----------------
 1 file changed, 86 insertions(+), 75 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 06034e8b4731..e778e37d7f69 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -34,88 +34,99 @@ MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
-def meson_array(var, d):
-    items = d.getVar(var).split()
-    return repr(items[0] if len(items) == 1 else items)
-
-# Map our ARCH values to what Meson expects:
-# http://mesonbuild.com/Reference-tables.html#cpu-families
-def meson_cpu_family(var, d):
-    import re
-    arch = d.getVar(var)
-    if arch == 'powerpc':
-        return 'ppc'
-    elif arch == 'powerpc64' or arch == 'powerpc64le':
-        return 'ppc64'
-    elif arch == 'armeb':
-        return 'arm'
-    elif arch == 'aarch64_be':
-        return 'aarch64'
-    elif arch == 'mipsel':
-        return 'mips'
-    elif arch == 'mips64el':
-        return 'mips64'
-    elif re.match(r"i[3-6]86", arch):
-        return "x86"
-    elif arch == "microblazeel":
-        return "microblaze"
-    else:
-        return arch
-
-# Map our OS values to what Meson expects:
-# https://mesonbuild.com/Reference-tables.html#operating-system-names
-def meson_operating_system(var, d):
-    os = d.getVar(var)
-    if "mingw" in os:
-        return "windows"
-    else:
-        return os
-
-def meson_endian(prefix, d):
-    arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
-    sitedata = siteinfo_data_for_machine(arch, os, d)
-    if "endian-little" in sitedata:
-        return "little"
-    elif "endian-big" in sitedata:
-        return "big"
-    else:
-        bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
+MESON_CROSS_BINARIES ??= "c:CC \
+                          cpp:CXX \
+                          ar:AR \
+                          nm:NM \
+                          strip:STRIP \
+                          readelf:READELF"
+
+MESON_CROSS_PROPERTIES ??= "c_args:CFLAGS \
+                            c_link_args:LDFLAGS \
+                            cpp_args:CXXFLAGS \
+                            cpp_link_args:LDFLAGS"
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
-do_write_config() {
-    # This needs to be Py to split the args into single-element lists
-    cat >${WORKDIR}/meson.cross <<EOF
+python do_write_config() {
+    def meson_array(var):
+        items = d.getVar(var).split()
+        return repr(items[0] if len(items) == 1 else items)
+
+    # Map our ARCH values to what Meson expects:
+    # http://mesonbuild.com/Reference-tables.html#cpu-families
+    def meson_cpu_family(var):
+        import re
+        arch = d.getVar(var)
+        if arch == 'powerpc':
+            return 'ppc'
+        elif arch == 'powerpc64' or arch == 'powerpc64le':
+            return 'ppc64'
+        elif arch == 'armeb':
+            return 'arm'
+        elif arch == 'aarch64_be':
+            return 'aarch64'
+        elif arch == 'mipsel':
+            return 'mips'
+        elif arch == 'mips64el':
+            return 'mips64'
+        elif re.match(r"i[3-6]86", arch):
+            return "x86"
+        elif arch == "microblazeel":
+            return "microblaze"
+        else:
+            return arch
+
+    # Map our OS values to what Meson expects:
+    # https://mesonbuild.com/Reference-tables.html#operating-system-names
+    def meson_operating_system(var):
+        os = d.getVar(var)
+        if "mingw" in os:
+            return "windows"
+        else:
+            return os
+
+    def meson_endian(prefix):
+        arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
+        sitedata = siteinfo_data_for_machine(arch, os, d)
+        if "endian-little" in sitedata:
+            return "little"
+        elif "endian-big" in sitedata:
+            return "big"
+        else:
+            bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
+
+    def meson_write_props(var, f):
+        for property in d.getVar(var).split():
+             (k, v) = property.split(':')
+             print("{} = {}".format(k, meson_array(v)), file=f)
+             d.appendVarFlag("do_write_config", "vardeps", v)
+
+    with open(oe.path.join(d.getVar('WORKDIR'), "meson.cross"), "w") as f:
+        print("""\
 [binaries]
-c = ${@meson_array('CC', d)}
-cpp = ${@meson_array('CXX', d)}
-ar = ${@meson_array('AR', d)}
-nm = ${@meson_array('NM', d)}
-strip = ${@meson_array('STRIP', d)}
-readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
-llvm-config = 'llvm-config${LLVMVERSION}'
+llvm-config = 'llvm-config{}'""".format(d.getVar("LLVMVERSION")), file=f)
+
+        meson_write_props('MESON_CROSS_BINARIES', f)
 
+        print("""\
 [properties]
 needs_exe_wrapper = true
-c_args = ${@meson_array('CFLAGS', d)}
-c_link_args = ${@meson_array('LDFLAGS', d)}
-cpp_args = ${@meson_array('CXXFLAGS', d)}
-cpp_link_args = ${@meson_array('LDFLAGS', d)}
-gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
-
-[host_machine]
-system = '${@meson_operating_system('HOST_OS', d)}'
-cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
-cpu = '${HOST_ARCH}'
-endian = '${@meson_endian('HOST', d)}'
-
-[target_machine]
-system = '${@meson_operating_system('TARGET_OS', d)}'
-cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
-cpu = '${TARGET_ARCH}'
-endian = '${@meson_endian('TARGET', d)}'
-EOF
+gtkdoc_exe_wrapper = '{}/gtkdoc-qemuwrapper'""".format(d.getVar('B')), file=f)
+
+        meson_write_props('MESON_CROSS_PROPERTIES', f)
+
+        print("[host_machine]", file=f)
+        print("system = '{}'".format(meson_operating_system('HOST_OS')), file=f)
+        print("cpu_family = '{}'".format(meson_cpu_family('HOST_ARCH')), file=f)
+        print("cpu = '{}'".format(d.getVar('HOST_ARCH')), file=f)
+        print("endian = '{}'".format(meson_endian('HOST')), file=f)
+
+        print("[target_machine]", file=f)
+        print("system = '{}'".format(meson_operating_system('TARGET_OS')), file=f)
+        print("cpu_family = '{}'".format(meson_cpu_family('TARGET_ARCH')), file=f)
+        print("cpu = '{}'".format(d.getVar('TARGET_ARCH')), file=f)
+        print("endian = '{}'".format(meson_endian('TARGET')), file=f)
 }
 
 CONFIGURE_FILES = "meson.build"
-- 
2.17.1


