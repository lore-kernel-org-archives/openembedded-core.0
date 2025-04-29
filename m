Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF27C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 12:50:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.18996.1745931022807997493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 05:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E3j6m/0N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ede096d73so40484055e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745931020; x=1746535820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFykX1segeiScsLzgfF//qUcytVuXwPe7gDQSuBtj+0=;
        b=E3j6m/0NePhJA8AvnVt/P6h3innhmB48vzW3TOzxuZbkcZLdRdT/2R363lDvwlPqeH
         eS/4PX41/Sz+x/Lp52YzXOu32D4kxlxetXLkX1E4qZg/mdblP2Z1D/jp0hRMhQn4TLLv
         qAYvy566k4h/FnZ/8NhG8yYrsIv8jXXsg7umM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745931020; x=1746535820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFykX1segeiScsLzgfF//qUcytVuXwPe7gDQSuBtj+0=;
        b=Wiu9bmj0QU97U35XX4YXBZ4sQdO4+2wV5MYbEu0tKyd7R/taHTAU+dZG1vU70wnrwY
         flv+LwfN7VdwxcpwfmjwxQCUYnayCLWT+vrOEfw0iToARkgE9o6czWigyNUi+UXELpME
         QqnvB3cosz4xiXk8oZQS+ExA0lQvyA1emnM8a1bUYYvG67UGHz5VOCVKvwWKeOL2drMM
         82k0QFb/IMXELU5IqcmxVKOjfNt7ky3J2RlMJbMFC6L3gmUKT2s7C4csgBM33CcYfeca
         kVUMOlR2gWS5Giv17zJ8n38KzwYJkgbI1eYuXfBLmslTOoVI+7zAgAgqmLl3f8McAmYg
         DmQg==
X-Gm-Message-State: AOJu0YxhYEbyIBtxYegWM8UC/17/2VA6pEyTqH6yxf1rJNcX+4Qv5eQN
	QtHg5AkePMkDo/2kpHbwdJiI9+VcnGluFRLkqH5hnaOs0RnBavAbwiXBCca5vUkN0+VSdg5OMkt
	U
X-Gm-Gg: ASbGncsUrAc4s8sv6mDM8RF4bZ29bQoQkzAQP+GW1l10+TWu4uY6IH6pxuv9xK7K4ud
	Jd5JYM7lB5CZbkVesJDThLgzyWIzRc5fbgH9vHLiVmRO/004kAa4vewFHF9PriqVT02pOsAVapA
	B7coHzLK308XCsgPtCKH1tdTWjD3o33OjDO6FedcAcD1CTeprQt00gKSrbLmxxHNpTYQapVvel8
	NW/zMXAoCJg+OBfAxTcmxG1OWEwd5jaTSB7hP9TIGYwsBDHOVxAcRJrgNgx1LI61yyNS/m1Eq09
	9rYTl6VPHp4RH4sbGuY7HOjNl4L+HJM1zPhLiHMkDZ4S96milMRRKHLiOrd+qbnOJFytNA==
X-Google-Smtp-Source: AGHT+IHt8+dVQLwTAxmvhAUhkwkMnDiIUIgx9xLN2Rqk71R9bB9Ptfo9oihPnZxKkNDIllsaVsS2zg==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-441ac84f25bmr37077515e9.2.1745931020136;
        Tue, 29 Apr 2025 05:50:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3ccf:8af4:a5fb:d268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm161978405e9.7.2025.04.29.05.50.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:50:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest-ed: Upgrade to version 1.21/1.20.2
Date: Tue, 29 Apr 2025 13:50:18 +0100
Message-ID: <20250429125018.1807886-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 12:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215660

Older versions do not compile with GCC 15. We had different versions to test
GPLv3 exclusion.

1.21 compiles with gcc 15 and 1.20.2 has a CFLAGS tweak to allow it to work
with gcc 15 too.

1.21 is licensed under GPL-2.0 so we need to rework some of the tests.

Tweak the gplv3 test by adding a special override of LICENSE to then test
the license exclusion code.

Modify the archiver selftests to use the new version.

Based on a patch from Khem Raj <raj.khem@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../selftest-ed/selftest-ed_0.5.bb            | 23 ----------
 .../selftest-ed/selftest-ed_1.14.1.bb         | 38 ----------------
 .../selftest-ed/selftest-ed_1.20.2.bb         | 44 +++++++++++++++++++
 .../selftest-ed/selftest-ed_1.21.1.bb         | 42 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/archiver.py      | 18 ++++----
 meta/lib/oeqa/selftest/cases/bbtests.py       |  3 +-
 6 files changed, 97 insertions(+), 71 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
 delete mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
 create mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb
 create mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb

diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
deleted file mode 100644
index 1a140a532f9..00000000000
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Line-oriented text editor -- selftest GPL-2.0-or-later version"
-HOMEPAGE = "http://www.gnu.org/software/ed/"
-SECTION = "base"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
-                    file://main.c;beginline=1;endline=17;md5=36d4b85e5ae9028e918d1cc775c2475e"
-
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/ed/ed-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
-SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
-
-inherit autotools texinfo
-
-S = "${WORKDIR}/ed-${PV}"
-
-EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}' 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
-
-CONFIGUREOPTS:remove = "--disable-dependency-tracking"
-CONFIGUREOPTS:remove = "--disable-silent-rules"
-EXTRA_OECONF:remove = "--disable-static"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
deleted file mode 100644
index b92740de32a..00000000000
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Line-oriented text editor -- selftest variant"
-HOMEPAGE = "http://www.gnu.org/software/ed/"
-
-LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
-                    file://ed.h;endline=20;md5=4e36b7a40e137f42aee718165590d125 \
-                    file://main.c;endline=17;md5=c5b8f78f115df187af76868a2aead16a"
-
-SECTION = "base"
-
-# LSB states that ed should be in /bin/
-bindir = "${base_bindir}"
-
-SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
-RECIPE_NO_UPDATE_REASON = "This recipe is used in selftest and shouldn't be updated otherwise"
-
-SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
-SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
-
-S = "${WORKDIR}/ed-${PV}"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-inherit texinfo
-
-do_configure() {
-	${S}/configure
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' install
-	# Info dir listing isn't interesting at this point so remove it if it exists.
-	if [ -e "${D}${infodir}/dir" ]; then
-		rm -f ${D}${infodir}/dir
-	fi
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb
new file mode 100644
index 00000000000..d4232b72ee4
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Line-oriented text editor"
+HOMEPAGE = "http://www.gnu.org/software/ed/"
+DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+                    file://ed.h;endline=20;md5=c3212b6c53b09668107420af9368c0ef \
+                    file://main.c;endline=17;md5=e5d2ae5ddd1ecb87dc71702c06dd06dc \
+                    "
+
+SECTION = "base"
+
+CVE_PRODUCT = "gnu:ed"
+
+# LSB states that ed should be in /bin/
+bindir = "${base_bindir}"
+
+# Upstream regularly removes previous releases from https://ftp.gnu.org/gnu/ed/
+SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
+
+SRC_URI[sha256sum] = "65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523"
+
+S = "${WORKDIR}/ed-${PV}"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+# for gcc 15 true/false change
+CFLAGS += "-std=gnu17"
+
+inherit texinfo
+
+do_configure() {
+	${S}/configure
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
+}
+BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb
new file mode 100644
index 00000000000..acd1ce5907e
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Line-oriented text editor"
+HOMEPAGE = "http://www.gnu.org/software/ed/"
+DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
+
+LICENSE = "GPL-2.0-only"
+LICENSE:gplv3test = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
+                    file://ed.h;endline=20;md5=a24e7f91c0fb83e65a746f5994762a49 \
+                    file://main.c;endline=17;md5=fd6ad9f1853f123f4ae7a31d59761f09 \
+                    "
+
+SECTION = "base"
+
+CVE_PRODUCT = "gnu:ed"
+
+# LSB states that ed should be in /bin/
+bindir = "${base_bindir}"
+
+# Upstream regularly removes previous releases from https://ftp.gnu.org/gnu/ed/
+SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
+
+SRC_URI[sha256sum] = "d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b"
+
+S = "${WORKDIR}/ed-${PV}"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+inherit texinfo
+
+do_configure() {
+	${S}/configure
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
+}
+BBCLASSEXTEND = "native"
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 3cb888c5067..612ec675a78 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -190,28 +190,28 @@ class Archiver(OESelftestTestCase):
         Test that the archiver works with `ARCHIVER_MODE[src] = "original"`.
         """
 
-        self._test_archiver_mode('original', 'ed-1.14.1.tar.lz')
+        self._test_archiver_mode('original', 'ed-1.21.1.tar.lz')
 
     def test_archiver_mode_patched(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] = "patched"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-patched.tar.xz')
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.21.1-r0-patched.tar.xz')
 
     def test_archiver_mode_configured(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[src] = "configured"`.
         """
 
-        self._test_archiver_mode('configured', 'selftest-ed-native-1.14.1-r0-configured.tar.xz')
+        self._test_archiver_mode('configured', 'selftest-ed-native-1.21.1-r0-configured.tar.xz')
 
     def test_archiver_mode_recipe(self):
         """
         Test that the archiver works with `ARCHIVER_MODE[recipe] = "1"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-recipe.tar.xz',
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.21.1-r0-recipe.tar.xz',
                                  'ARCHIVER_MODE[recipe] = "1"\n')
 
     def test_archiver_mode_diff(self):
@@ -220,7 +220,7 @@ class Archiver(OESelftestTestCase):
         Exclusions controlled by `ARCHIVER_MODE[diff-exclude]` are not yet tested.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-diff.gz',
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.21.1-r0-diff.gz',
                                  'ARCHIVER_MODE[diff] = "1"\n')
 
     def test_archiver_mode_dumpdata(self):
@@ -228,7 +228,7 @@ class Archiver(OESelftestTestCase):
         Test that the archiver works with `ARCHIVER_MODE[dumpdata] = "1"`.
         """
 
-        self._test_archiver_mode('patched', 'selftest-ed-native-1.14.1-r0-showdata.dump',
+        self._test_archiver_mode('patched', 'selftest-ed-native-1.21.1-r0-showdata.dump',
                                  'ARCHIVER_MODE[dumpdata] = "1"\n')
 
     def test_archiver_mode_mirror(self):
@@ -236,7 +236,7 @@ class Archiver(OESelftestTestCase):
         Test that the archiver works with `ARCHIVER_MODE[src] = "mirror"`.
         """
 
-        self._test_archiver_mode('mirror', 'ed-1.14.1.tar.lz',
+        self._test_archiver_mode('mirror', 'ed-1.21.1.tar.lz',
                                  'BB_GENERATE_MIRROR_TARBALLS = "1"\n')
 
     def test_archiver_mode_mirror_excludes(self):
@@ -247,7 +247,7 @@ class Archiver(OESelftestTestCase):
         """
 
         target='selftest-ed'
-        target_file_name = 'ed-1.14.1.tar.lz'
+        target_file_name = 'ed-1.21.1.tar.lz'
 
         features = 'INHERIT += "archiver"\n'
         features += 'ARCHIVER_MODE[src] = "mirror"\n'
@@ -285,7 +285,7 @@ class Archiver(OESelftestTestCase):
             bitbake('-c deploy_archives %s' % (target))
 
         bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
-        for target_file_name in ['ed-1.14.1.tar.lz', 'hello.c']:
+        for target_file_name in ['ed-1.21.1.tar.lz', 'hello.c']:
             glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', target_file_name)
             glob_result = glob.glob(glob_str)
             self.assertTrue(glob_result, 'Missing archive file %s' % (target_file_name))
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 1cec77b72c2..51934ef70de 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -233,6 +233,7 @@ INHERIT:remove = \"report-error\"
 
     def test_non_gplv3(self):
         self.write_config('''INCOMPATIBLE_LICENSE = "GPL-3.0-or-later"
+OVERRIDES .= ":gplv3test"
 require conf/distro/include/no-gplv3.inc
 ''')
         result = bitbake('selftest-ed', ignore_status=True)
@@ -241,7 +242,7 @@ require conf/distro/include/no-gplv3.inc
         arch = get_bb_var('SSTATE_PKGARCH')
         filename = os.path.join(lic_dir, arch, 'selftest-ed', 'generic_GPL-3.0-or-later')
         self.assertFalse(os.path.isfile(filename), msg="License file %s exists and shouldn't" % filename)
-        filename = os.path.join(lic_dir, arch, 'selftest-ed', 'generic_GPL-2.0-or-later')
+        filename = os.path.join(lic_dir, arch, 'selftest-ed', 'generic_GPL-2.0-only')
         self.assertTrue(os.path.isfile(filename), msg="License file %s doesn't exist" % filename)
 
     def test_setscene_only(self):

