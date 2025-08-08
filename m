Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48930C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 05:52:06 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.15091.1754632323117148134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 22:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aTJKR/hp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025080805520097772ec68d15a37814-jb6tbu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025080805520097772ec68d15a37814
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 Aug 2025 07:52:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jLjtK3zBj2WwCFmzSrCE3BfudIQC84vy0eyozRxZkE8=;
 b=aTJKR/hprRYLlGUt5euJLWVaVCu7vcJPJuysVdkk/tXoeDyndmoaRHFOeov/FUZswA5COH
 xFvOxDfPEr9qJ4DzP8KFLCWLukHqNm7nJOWopeP51EQqoIRGH9f8dluV594KhmH5RoJ0JeaI
 kqHGNeGx2bjmqAmLtEdAx7VF36eyHah1pekZOnVtkum881AbIOMX7qqMV9d/GOoXWEjSLuOQ
 vknaD6jGN4TK1XZsrxf/DLnmMcaJ7oeF/dEpSpcKRONMmimNIRhHZwXm3ojpx1TzDdOpH8kA
 nD5Dnk2+S2I/HPCYWCy4dRIihZFrPV1At0qQ8TcGRJhVhBNufESz6pAA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/3] oeqa: rename variable dirs to opts is cases with parallel make
Date: Fri,  8 Aug 2025 07:50:58 +0200
Message-Id: <20250808055059.8851-2-peter.marko@siemens.com>
In-Reply-To: <20250808055059.8851-1-peter.marko@siemens.com>
References: <20250808055059.8851-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 05:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221592

From: Peter Marko <peter.marko@siemens.com>

This is a refactoring commit so that next commit which is fixing
parallel make settings is readable.

Rename makes sense as the variable will contain not only directories but
also parallel make settings afterwards.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/sdk/cases/autotools.py | 22 +++++++++++-----------
 meta/lib/oeqa/sdk/cases/cmake.py     | 22 +++++++++++-----------
 meta/lib/oeqa/sdk/cases/makefile.py  | 20 ++++++++++----------
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cases/autotools.py
index ee6c522551..f641d66015 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -26,23 +26,23 @@ class AutotoolsTest(OESDKTestCase):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
 
-            dirs = {}
-            dirs["source"] = os.path.join(testdir, "cpio-2.15")
-            dirs["build"] = os.path.join(testdir, "build")
-            dirs["install"] = os.path.join(testdir, "install")
+            opts = {}
+            opts["source"] = os.path.join(testdir, "cpio-2.15")
+            opts["build"] = os.path.join(testdir, "build")
+            opts["install"] = os.path.join(testdir, "install")
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
-            self.assertTrue(os.path.isdir(dirs["source"]))
-            os.makedirs(dirs["build"])
+            self.assertTrue(os.path.isdir(opts["source"]))
+            os.makedirs(opts["build"])
 
-            self._run("cd {build} && {source}/configure CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' $CONFIGURE_FLAGS".format(**dirs))
+            self._run("cd {build} && {source}/configure CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' $CONFIGURE_FLAGS".format(**opts))
 
             # Check that configure detected the target correctly
-            with open(os.path.join(dirs["build"], "config.log")) as f:
+            with open(os.path.join(opts["build"], "config.log")) as f:
                 host_sys = self.td["HOST_SYS"]
                 self.assertIn(f"host_alias='{host_sys}'\n", f.readlines())
 
-            self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' -j".format(**dirs))
-            self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
+            self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' -j".format(**opts))
+            self._run("cd {build} && make install DESTDIR={install}".format(**opts))
 
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "cpio"))
+            self.check_elf(os.path.join(opts["install"], "usr", "local", "bin", "cpio"))
diff --git a/meta/lib/oeqa/sdk/cases/cmake.py b/meta/lib/oeqa/sdk/cases/cmake.py
index 070682ef08..32b951c0f8 100644
--- a/meta/lib/oeqa/sdk/cases/cmake.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -29,19 +29,19 @@ class CMakeTest(OESDKTestCase):
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v5.4.1.tar.gz")
 
-            dirs = {}
-            dirs["source"] = os.path.join(testdir, "assimp-5.4.1")
-            dirs["build"] = os.path.join(testdir, "build")
-            dirs["install"] = os.path.join(testdir, "install")
+            opts = {}
+            opts["source"] = os.path.join(testdir, "assimp-5.4.1")
+            opts["build"] = os.path.join(testdir, "build")
+            opts["install"] = os.path.join(testdir, "install")
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
-            self.assertTrue(os.path.isdir(dirs["source"]))
+            self.assertTrue(os.path.isdir(opts["source"]))
             # Apply the zlib patch https://github.com/madler/zlib/commit/a566e156b3fa07b566ddbf6801b517a9dba04fa3
             # this sed wont be needed once assimp moves its zlib copy to v1.3.1+
-            self._run("sed -i '/#  ifdef _FILE_OFFSET_BITS/I,+2 d' {source}/contrib/zlib/gzguts.h".format(**dirs))
-            os.makedirs(dirs["build"])
+            self._run("sed -i '/#  ifdef _FILE_OFFSET_BITS/I,+2 d' {source}/contrib/zlib/gzguts.h".format(**opts))
+            os.makedirs(opts["build"])
 
-            self._run("cd {build} && cmake -DASSIMP_WARNINGS_AS_ERRORS=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DASSIMP_BUILD_ZLIB=ON {source}".format(**dirs))
-            self._run("cmake --build {build} -- -j".format(**dirs))
-            self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**dirs))
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.5.4.1"))
+            self._run("cd {build} && cmake -DASSIMP_WARNINGS_AS_ERRORS=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DASSIMP_BUILD_ZLIB=ON {source}".format(**opts))
+            self._run("cmake --build {build} -- -j".format(**opts))
+            self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**opts))
+            self.check_elf(os.path.join(opts["install"], "usr", "local", "lib", "libassimp.so.5.4.1"))
diff --git a/meta/lib/oeqa/sdk/cases/makefile.py b/meta/lib/oeqa/sdk/cases/makefile.py
index e1e2484820..0dcf94c6d7 100644
--- a/meta/lib/oeqa/sdk/cases/makefile.py
+++ b/meta/lib/oeqa/sdk/cases/makefile.py
@@ -23,14 +23,14 @@ class MakefileTest(OESDKTestCase):
         with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
 
-            dirs = {}
-            dirs["source"] = os.path.join(testdir, "lzip-1.19")
-            dirs["build"] = os.path.join(testdir, "build")
-            dirs["install"] = os.path.join(testdir, "install")
+            opts = {}
+            opts["source"] = os.path.join(testdir, "lzip-1.19")
+            opts["build"] = os.path.join(testdir, "build")
+            opts["install"] = os.path.join(testdir, "install")
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir], stderr=subprocess.STDOUT)
-            self.assertTrue(os.path.isdir(dirs["source"]))
-            os.makedirs(dirs["build"])
+            self.assertTrue(os.path.isdir(opts["source"]))
+            os.makedirs(opts["build"])
 
             cmd = """cd {build} && \
                      {source}/configure --srcdir {source} \
@@ -39,7 +39,7 @@ class MakefileTest(OESDKTestCase):
                      CXXFLAGS="$CXXFLAGS" \
                      LDFLAGS="$LDFLAGS" \
                   """
-            self._run(cmd.format(**dirs))
-            self._run("cd {build} && make -j".format(**dirs))
-            self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
-            self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "lzip"))
+            self._run(cmd.format(**opts))
+            self._run("cd {build} && make -j".format(**opts))
+            self._run("cd {build} && make install DESTDIR={install}".format(**opts))
+            self.check_elf(os.path.join(opts["install"], "usr", "local", "bin", "lzip"))

