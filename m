Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.14350.1604235186590187321
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 04:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cyo9BLOt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id k18so6879093wmj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 04:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFdVtwjNEq3dHsgoYbUEPFQADAgfcyeIo17Pz56Ijl0=;
        b=Cyo9BLOtZw3MRAKCpJQrduDCoHYGXQj7Se0lIVOGDGiLxbQC+X0rY7WIn6UStB4jeE
         j9RzADhoGtSleK1teZoPw4nbI9pijz6SNYFtpdbf/ggiCXsBEzLi7gME2PQwgvW5AK27
         rh6lX6pWuWuM0iBGKO05unoc8ah3ysA8mltzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFdVtwjNEq3dHsgoYbUEPFQADAgfcyeIo17Pz56Ijl0=;
        b=GLeSFxmV8OS4KdmoH/y+OwfrfQOZH5fzpe4D8g4TQHZ6uAgH7CBsYS1pvw4IY7P6CS
         90PJxoaz1PnqwyguHG4R04vtZ05QNNJswjIMb4e9aIB+N7Y7jHpLRh0tjUAfk5usFW7U
         5inaBWzqYtiob24gAmfz+jq5pkJyLOeNFjz1SvZx+4Ky20z1+grkEpkNFhNsQ3ucmroz
         gKKOY4yapypDcUhD5709/cTPpd5YP/5j0w+C8PdHl7Gstljw3ejfza7WQeLgqVJ41q2j
         XXOuMB22PFVnU/WhwwZWdd0RCiw8pd1oVGt7bQtWRGRU9kEPhMoaP93vXZR7dvsbcsrT
         JXEA==
X-Gm-Message-State: AOAM530RbrDT00QriS73YDV3/yW2IvnVLMGIWZ4Gp+Dxq51fRYla0i8h
	ZcmA8rtEfZEj4NJA+JiGK5g8fK/oszsvtQ==
X-Google-Smtp-Source: ABdhPJzaJDdu/jtCix1tB5vQnuftvDJvfRKa1LhXSv3nAEHc5PK2i2Hqaw42XIyYK2lBtpYDdO0AqQ==
X-Received: by 2002:a1c:a7ce:: with SMTP id q197mr2348815wme.138.1604235184822;
        Sun, 01 Nov 2020 04:53:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id v123sm11806735wme.7.2020.11.01.04.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 04:53:04 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Viswanath Kraleti <vkraleti@codeaurora.org>
Subject: [PATCH 2/2] selftest: Add binaryonly example and selftest
Date: Sun,  1 Nov 2020 12:53:02 +0000
Message-Id: <20201101125302.350160-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
References: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a selftest showing how locked sstate can be used to handle
a binary only delivery of some output.

xz is used as an example with a special "binary only" variant of the recipe
which is basically the standard one with some small tweaks so it has its own
recipe and package namespaces.

The test creates its own local sstate directory for the test so it doesn't write
to any main sstate store.

If the xz-binaryonly recipe is built with "binaryonly-secretsource" in BBPATH,
it functions as a normal recipe. The xz-binaryonly-src include file contains
the "secret" recipe build instructions such as where to get the source from
and how to configure it. There is a binaryonly-src bbclass which at the end
of do_install, writes out a locked sstate signatures file showing how to lock
the build to this specific binary sstate object.

If the xz-binaryonly recipe is built without any BBPATH additions but the sstate
signature lock include file is included, the build will look for and use the sstate
object specified and not run any of the configure/compile tasks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xz-binaryonly-src.inc                     | 16 +++++++++
 meta-selftest/classes/binaryonly-src.bbclass  |  9 +++++
 meta-selftest/classes/binaryonly.bbclass      |  9 +++++
 .../xz-binaryonly/xz-binaryonly_5.2.5.bb      | 36 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/binaryonly.py    | 34 ++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 meta-selftest/binaryonly-secretsource/xz-binaryonly-src.inc
 create mode 100644 meta-selftest/classes/binaryonly-src.bbclass
 create mode 100644 meta-selftest/classes/binaryonly.bbclass
 create mode 100644 meta-selftest/recipes-binaryonly/xz-binaryonly/xz-binaryonly_5.2.5.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/binaryonly.py

diff --git a/meta-selftest/binaryonly-secretsource/xz-binaryonly-src.inc b/meta-selftest/binaryonly-secretsource/xz-binaryonly-src.inc
new file mode 100644
index 00000000000..cd2294ba90e
--- /dev/null
+++ b/meta-selftest/binaryonly-secretsource/xz-binaryonly-src.inc
@@ -0,0 +1,16 @@
+LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
+                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
+                    "
+
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI[md5sum] = "0d270c997aff29708c74d53f599ef717"
+SRC_URI[sha256sum] = "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10"
+UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
+
+CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
+
+inherit binaryonly-src
+
diff --git a/meta-selftest/classes/binaryonly-src.bbclass b/meta-selftest/classes/binaryonly-src.bbclass
new file mode 100644
index 00000000000..75bc5e2ca7b
--- /dev/null
+++ b/meta-selftest/classes/binaryonly-src.bbclass
@@ -0,0 +1,9 @@
+do_install[postfuncs] += "write_binaryonly_lockedsig"
+
+python write_binaryonly_lockedsig () {
+    outputfile = d.expand("${TOPDIR}/binaryonly-lockedsigs-demo.inc")
+
+    with open(outputfile, "a+") as f:
+        f.write('SIGGEN_LOCKEDSIGS_t-%s += "%s:do_install:%s"\n' % (d.getVar("PACKAGE_ARCH"), d.getVar("PN"), d.getVar("BB_TASKHASH")))
+        f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "t-%s"\n' % (d.getVar("MACHINE"), d.getVar("PACKAGE_ARCH")))
+}
diff --git a/meta-selftest/classes/binaryonly.bbclass b/meta-selftest/classes/binaryonly.bbclass
new file mode 100644
index 00000000000..4903c7cd934
--- /dev/null
+++ b/meta-selftest/classes/binaryonly.bbclass
@@ -0,0 +1,9 @@
+python () {
+    if not bb.data.inherits_class('binaryonly-src', d):
+        bb.build.deltask("do_fetch", d)
+        bb.build.deltask("do_unpack", d)
+        bb.build.deltask("do_patch", d)
+        #bb.build.deltask("do_prepare_recipe_sysroot", d)
+        #bb.build.deltask("do_configure", d)
+        #bb.build.deltask("do_compile", d)
+}
\ No newline at end of file
diff --git a/meta-selftest/recipes-binaryonly/xz-binaryonly/xz-binaryonly_5.2.5.bb b/meta-selftest/recipes-binaryonly/xz-binaryonly/xz-binaryonly_5.2.5.bb
new file mode 100644
index 00000000000..366c6e9751c
--- /dev/null
+++ b/meta-selftest/recipes-binaryonly/xz-binaryonly/xz-binaryonly_5.2.5.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Utilities for managing LZMA compressed files"
+HOMEPAGE = "https://tukaani.org/xz/"
+SECTION = "base"
+
+BPN = "xz"
+
+# The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only file
+# which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
+# and the LGPL bits are under lib/, which appears to be used for libgnu, which
+# appears to be used for DOS builds. So we're left with GPLv2+ and PD.
+LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_${PN}-dev = "GPLv2+"
+LICENSE_${PN}-staticdev = "GPLv2+"
+LICENSE_${PN}-doc = "GPLv2+"
+LICENSE_${PN}-dbg = "GPLv2+"
+LICENSE_${PN}-locale = "GPLv2+"
+LICENSE_liblzma-bin = "PD"
+
+# We try to include the secret source but don't fail if we can't
+include xz-binaryonly-src.inc
+
+inherit binaryonly
+
+inherit autotools gettext
+
+PACKAGES =+ "liblzma-bin"
+DEBIAN_NOAUTONAME_liblzma-bin = "1"
+FILES_liblzma-bin = "${libdir}/liblzma*${SOLIBS}"
+
+inherit update-alternatives
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "xz xzcat unxz \
+                     lzma lzcat unlzma"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/lib/oeqa/selftest/cases/binaryonly.py b/meta/lib/oeqa/selftest/cases/binaryonly.py
new file mode 100644
index 00000000000..3901d41db0b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/binaryonly.py
@@ -0,0 +1,34 @@
+#
+# SPDX-License-Identifier: MIT
+#
+# Author: Richard Purdie <richard.purdie@linuxfoundation.org>
+#
+
+import shutil
+import tempfile
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_test_layer
+
+class BinaryOnly(OESelftestTestCase):
+    def test_binaryonly(self):
+        # We need to create our own local sstate directory but use the main sstate as a mirror for speed
+        tempdir = tempfile.mkdtemp(prefix='sstate_binaryonly')
+        testlayer = get_test_layer()
+        sstate_path = get_bb_var("SSTATE_DIR")
+        topdir = get_bb_var("TOPDIR")
+        self.append_config("SSTATE_DIR = \"%s\"" % tempdir)
+        self.append_config("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = 'warn'")
+        self.track_for_cleanup(tempdir)
+        self.append_config("SSTATE_MIRRORS += \"file://.* file:///%s/PATH\"" % sstate_path)
+
+        enable_source = "BBPATH .= ':%s/binaryonly-secretsource'" % testlayer
+        self.append_config(enable_source)
+        bitbake("xz-binaryonly -c clean")
+        bitbake("xz-binaryonly")
+        bitbake("xz-binaryonly -c clean")
+
+        enable_lockfile = "require ${TOPDIR}/binaryonly-lockedsigs-demo.inc"
+
+        self.remove_config(enable_source)
+        self.append_config(enable_lockfile)
+        bitbake("xz-binaryonly")
-- 
2.25.1

