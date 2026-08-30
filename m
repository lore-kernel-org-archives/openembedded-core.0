Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BA6C61DE2
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:36:27 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13800.1788114985007435609
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rQIZQ9/G;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90e8535619bso6584936d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 11:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114984; x=1788719784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/xZ7cirSmTU2tH90xtl/WYdbCgj55YW3MKMz3+msdcM=;
        b=rQIZQ9/Gm26VJ3ESZlX231yjtwE2TxZ8ReLcP+hlMCh9gB/NoZzFPgKoCThZ4oBpgr
         ib76vB1N3MLA3T3tJ/IUVvgUhas74VySpNtoBNUBDLgd+ApUpR3XaH3A4A14m+YzS5PG
         CFpeFvy+WLHjY7IV/AZ2+wppW6yriJQdpHvF3Ik7zpw+NhqwbHK04sBBmUX4qfaXkD3u
         6yUBtklbzC8UZMlN9N4V7azdYWa7YzP1HupRki2/b0VqWWUQFnimve6NQql7C1hPNpHH
         GEkTv8rm65ypxqZSEMp3dPCELJ6bCKao2+7ljigd4WgapT0hQU4to0m6kpCTIYLizWcx
         xRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114984; x=1788719784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/xZ7cirSmTU2tH90xtl/WYdbCgj55YW3MKMz3+msdcM=;
        b=iC5AefNWrPZrO0HtVhzQjyKauTZGzkHljbgGteNBR2usWTSp/tJCBKj+PNY0gtAFE/
         zpL7rvnJ3GmIEYkdpEl4e8Ae8bW7WsKc49OTCR/N/UDmEChsUFxTQSYvftzFe+BwRmss
         J8xfD/PQ5/5dgjx0Ab9EvtWD+UZVItse9iA+CNiN0cOX3Jhb8v0pVOGQrablLOp41lpF
         pQzV4FVHU8LR/5nJHrTlnrQijDmLmiBzq45VWyrVSCHhEuir/oNuS1SZLfOm5dib1ds1
         umsqugqet1ukiNiIZuopSC4bEqPs+C/EWrn5L064kQESLbzQ5GRkOh6X4FtMRBtqM0az
         qguA==
X-Gm-Message-State: AFuF++lBhz9Hc5afkgCG/+26fcMiqDR7H2OhtByuxbPtdRRGFshH4hFF
	Zt31gFjS6Eft1mT6HRtuwrTVkxBKTpZcX416rYSd9B1GWfzW1k2hdccrDvRKzw5t
X-Gm-Gg: AYBFou025oniEQrdWTq0jAO5oO5PLvh3nvnzZ1f7Ok60aXQ1DbhKtZWcOny360hITfc
	/KdjNVjJQtNQz/xrOBLve/1CZUNIoPTFHjj/VjtYwQOOOjxrP6SeU+Hsq/6NxMl6VCl2ekK9v69
	aWxcGZONDdAzycA854TLix8fJcyA4kmjdLynR7U8gb9DjLHq2dnf7MPEHfSUZUMpmBgT1IWcg/C
	7Vz54JmutN3gavNqQjOdMcGif+/vWPTFgAPm4DtvqEeAOvWSqA/G+djS9dC1fweMU9z/Q57KEn2
	UNgw/Wzlabqf3ycms2wepZtR8u8YMSaWoDDXLU0Vr+3SrO0r2a0tgWZfgo1YAbuLCdXbtQSzF+8
	Di8jbjT219xDHyg1GBKL+AffSRDOQp86t5zxasJGHdiK77GlCK0lAARbZsfFYXcaIIY/Ak80VXj
	mA6KNyy6JzGgeU5GI9rVxHxAZ82o3cKqpxcyFeOedfD/2GPFOtPNikdhJ9yLXaImCipsyVXmony
	c5XwUkVeAcROPLiqUDNpekkewPwPQ==
X-Received: by 2002:a05:6214:4f02:b0:90d:255:df33 with SMTP id 6a1803df08f44-90d0255e06cmr183436736d6.30.1788114983853;
        Sun, 30 Aug 2026 11:36:23 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444dae0sm67267116d6.4.2026.08.30.11.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:36:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/sdk: name the commands the host tool cases need
Date: Sun, 30 Aug 2026 14:36:15 -0400
Message-ID: <20260830183616.4026354-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260830183616.4026354-1-twoerner@gmail.com>
References: <20260830183616.4026354-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 18:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244691

These cases identify a tool only by the package carrying it, so they run
whatever the build host provides. gtk3 shows this is not confined to
eSDKs: its glib-2.0-utils check passes on a standard SDK while
glib-compile-resources and glib-mkenums both resolve to /usr/bin.

perl needs two names because the recipe installs it twice:
nativesdk-perl creates ${bindir}/perl, and perl-native creates
${bindir}/perl-native/perl, kept off PATH so recipes running "env perl"
do not find it.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/sdk/cases/gtk3.py    | 3 ++-
 meta/lib/oeqa/sdk/cases/maturin.py | 8 +++++---
 meta/lib/oeqa/sdk/cases/meson.py   | 2 +-
 meta/lib/oeqa/sdk/cases/perl.py    | 4 ++--
 meta/lib/oeqa/sdk/cases/python.py  | 2 +-
 meta/lib/oeqa/sdk/cases/rust.py    | 2 ++
 6 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/gtk3.py b/meta/lib/oeqa/sdk/cases/gtk3.py
index cdaf50ed3842..336df6491c77 100644
--- a/meta/lib/oeqa/sdk/cases/gtk3.py
+++ b/meta/lib/oeqa/sdk/cases/gtk3.py
@@ -18,7 +18,8 @@ class GTK3Test(MesonTestBase):
     def setUp(self):
         super().setUp()
         self.ensure_target_package("gtk+3", "libgtk-3.0", recipe="gtk+3")
-        self.ensure_host_package("glib-2.0-utils", "libglib-2.0-utils", recipe="glib-2.0")
+        self.ensure_host_package("glib-2.0-utils", "libglib-2.0-utils",
+                                 recipe="glib-2.0", binary="glib-compile-resources")
 
     """
     Test that autotools and GTK+ 3 compiles correctly.
diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases/maturin.py
index e3e8edc7819c..1476e6f19a38 100644
--- a/meta/lib/oeqa/sdk/cases/maturin.py
+++ b/meta/lib/oeqa/sdk/cases/maturin.py
@@ -16,10 +16,12 @@ errors_have_output()
 
 class MaturinTest(OESDKTestCase):
     def setUp(self):
-        self.ensure_host_package("python3-maturin")
+        self.ensure_host_package("python3-maturin", binary="maturin")
+        self.python3 = self.ensure_host_package("python3-core", recipe="python3",
+                                                binary="python3")
 
     def test_maturin_list_python(self):
-        out = self._run(r"""python3 -c 'import sys; print(f"{sys.executable}\n{sys.version_info.major}.{sys.version_info.minor}")'""")
+        out = self._run(r"""%s -c 'import sys; print(f"{sys.executable}\n{sys.version_info.major}.{sys.version_info.minor}")'""" % self.python3)
         executable, version = out.splitlines()
 
         output = self._run("maturin list-python")
@@ -32,7 +34,7 @@ class MaturinTest(OESDKTestCase):
 class MaturinDevelopTest(OESDKTestCase):
     def setUp(self):
         machine = self.td.get("MACHINE")
-        self.ensure_host_package("python3-maturin")
+        self.ensure_host_package("python3-maturin", binary="maturin")
 
         if not (
             self.tc.hasHostPackage("packagegroup-rust-cross-canadian-%s" % machine)
diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/meson.py
index 7540d8ba5539..04ab22c73cf1 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -25,7 +25,7 @@ class MesonTestBase(OESDKTestCase):
             self.skipTest(f"{self.id()} does not support eSDK (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15854)")
 
         self.ensure_host_package("meson")
-        self.ensure_host_package("pkgconf")
+        self.ensure_host_package("pkgconf", binary="pkg-config")
 
     def build_meson(self, sourcedir, builddir, installdir=None, options=""):
         """
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index a72bd2461a6b..330d472f2013 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -11,9 +11,9 @@ errors_have_output()
 
 class PerlTest(OESDKTestCase):
     def setUp(self):
-        self.ensure_host_package("perl")
+        self.perl = self.ensure_host_package("perl", binary=("perl", "nativeperl"))
 
     def test_perl(self):
-        cmd = "perl -e '$_=\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/;print'"
+        cmd = "%s -e '$_=\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/;print'" % self.perl
         output = self._run(cmd)
         self.assertEqual(output, "Hello, world")
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index b990cd889ad9..cbc7fb69b2d1 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -11,7 +11,7 @@ errors_have_output()
 
 class Python3Test(OESDKTestCase):
     def setUp(self):
-        self.ensure_host_package("python3-core", recipe="python3")
+        self.ensure_host_package("python3-core", recipe="python3", binary="python3")
 
     def test_python3(self):
         cmd = "python3 -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf521..20e05089af1b 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -29,6 +29,7 @@ class RustCompileTest(OESDKTestCase):
         machine = self.td.get("MACHINE")
         if not self.tc.hasHostPackage("packagegroup-rust-cross-canadian-%s" % machine):
             raise unittest.SkipTest("RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain")
+        self.ensure_sdk_binary("cargo")
 
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
@@ -50,6 +51,7 @@ class RustHostCompileTest(OESDKTestCase):
         machine = self.td.get("MACHINE")
         if not self.tc.hasHostPackage("packagegroup-rust-cross-canadian-%s" % machine):
             raise unittest.SkipTest("RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain")
+        self.ensure_sdk_binary("cargo")
 
     def test_cargo_build(self):
         sdksys = self.td.get("SDK_SYS")

