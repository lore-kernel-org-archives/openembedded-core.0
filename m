Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.6953.1624716109775274806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jun 2021 07:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hSYzeLe8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id i94so14031157wri.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jun 2021 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLUj/Q07vfPx5yt2UQT7Rs1PzMKTwbkBJF6DZKV+7IA=;
        b=hSYzeLe8Is/kfaK02W/nNvogScuvgdMBnkag0xC+bsK+ZyqL+LhFQ+xKu2SBy4gt4R
         ZZAgnFT6JQ0kxZZ5E9lwgMcf28YX0tDhtFf/oyhxLH0Y203m+ptyeFiGpjFHaFdgHNFh
         lYlZUD10wXIgiSvL5QiKBkUvpWj1autRjMQ7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLUj/Q07vfPx5yt2UQT7Rs1PzMKTwbkBJF6DZKV+7IA=;
        b=uICsDh5tCdOZB3NgFW2sZRyKSC+ZTN/HTfux0lWTaJGzFoygD9RMigUk9A853TCET8
         H2pm2vHcbO4QY2Hg8wqATUgqL8f9nzGL4ffymieUcH+haMaoQah5602kzBnXzAruDDrT
         95D9UG5eJLjs2tVGHd6c3YXwkhIho2g6ebbSfQR5ol3IyPldm3D2ihPXQEPuE9gMyvni
         QS/G9dVQYoBvtYHnOAwgbO0zXvgXl3xyom5hpKfSXkV9IUZzpruBfHaBltR/9FkuNQEM
         7EYSjIytHDV5jPGiGQ5oOZQK7JsxpqA94kY6NEiQAYsCOIuq2zhho8nBRn4V85/+TjiJ
         p0FQ==
X-Gm-Message-State: AOAM5317nLeIJxQgoFPs3gGEe/kArEJ4Pvnd20pLleEw7DxkRgrSORLP
	U+DtTnkonIGiskdVnvgUrxIdrxa6A/hsjw==
X-Google-Smtp-Source: ABdhPJy9NsoQdJC6ZcmS2hfab3VY0dsdcxjX2x42g1l1QojO9g68qU4JcpOWxP1faIM49SQU0m/fxg==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr17500119wrv.343.1624716107750;
        Sat, 26 Jun 2021 07:01:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2c6f:d408:8eb3:4ab2])
        by smtp.gmail.com with ESMTPSA id t82sm8201652wmf.22.2021.06.26.07.01.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 07:01:47 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] selftest/fetch: Avoid occasional selftest failure from poor temp file name choice
Date: Sat, 26 Jun 2021 15:01:46 +0100
Message-Id: <20210626140146.3646503-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The temp file name may contain "_" characters. Switch to a temporary directory
and a fixed filename to avoid this to avoid errors like:

bb.data_smart.ExpansionError: Failure expanding variable PN, expression was
${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}
which triggered exception ParseError:
ParseError in /tmp/tmpd_f2__to.bb: Unable to generate default variables from
filename (too many underscores)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/fetch.py | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index 67e85d3e4c7..cd15f651291 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -55,25 +55,26 @@ MIRRORS_forcevariable = "git://.*/.* http://downloads.yoctoproject.org/mirror/so
 
 
 class Dependencies(OESelftestTestCase):
-    def write_recipe(self, content):
-        f = tempfile.NamedTemporaryFile(mode="wt", suffix=".bb")
-        f.write(content)
-        f.flush()
+    def write_recipe(self, content, tempdir):
+        f = os.path.join(tempdir, "test.bb")
+        with open(f, "w") as fd:
+            fd.write(content)
         return f
 
     def test_dependencies(self):
         """
         Verify that the correct dependencies are generated for specific SRC_URI entries.
         """
-        with bb.tinfoil.Tinfoil() as tinfoil:
+
+        with bb.tinfoil.Tinfoil() as tinfoil, tempfile.TemporaryDirectory(prefix="selftest-fetch") as tempdir:
             tinfoil.prepare(config_only=False, quiet=2)
 
             r = """
             LICENSE="CLOSED"
             SRC_URI="http://example.com/tarball.zip"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("wget-native", d.getVarFlag("do_fetch", "depends"))
             self.assertIn("unzip-native", d.getVarFlag("do_unpack", "depends"))
 
@@ -82,8 +83,8 @@ class Dependencies(OESelftestTestCase):
             LICENSE="CLOSED"
             SRC_URI="https://example.com/tarball;downloadfilename=something.zip"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("wget-native", d.getVarFlag("do_fetch", "depends"))
             self.assertIn("unzip-native", d.getVarFlag("do_unpack", "depends") or "")
 
@@ -91,8 +92,8 @@ class Dependencies(OESelftestTestCase):
             LICENSE="CLOSED"
             SRC_URI="ftp://example.com/tarball.lz"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("wget-native", d.getVarFlag("do_fetch", "depends"))
             self.assertIn("lzip-native", d.getVarFlag("do_unpack", "depends"))
 
@@ -100,6 +101,6 @@ class Dependencies(OESelftestTestCase):
             LICENSE="CLOSED"
             SRC_URI="git://example.com/repo"
             """
-            f = self.write_recipe(textwrap.dedent(r))
-            d = tinfoil.parse_recipe_file(f.name)
+            f = self.write_recipe(textwrap.dedent(r), tempdir)
+            d = tinfoil.parse_recipe_file(f)
             self.assertIn("git-native", d.getVarFlag("do_fetch", "depends"))
-- 
2.30.2

