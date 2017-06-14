Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D0533782EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:25:40 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v104so37953693wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2Z962WngAupW9oBoRvfmzfKhLctK9Is6MeI06TZiwvU=;
	b=IajvcifruQUtlD9jkryuO6olUpMZHEKpGeE6E6lV7aqncRnhYxTZGsmrFvE1J0EdFP
	yL0uHYyxyTTdXfUuEw23x1XziHC6q0tAwDhczVSgDA4vd1vrOvD8SLaSMBFbL/hMvq8l
	AB/62+42Cly1MCCho83+uDuoTKwYP6TdVyy+eUVF4xhl0f2MCJHdWimPcVE8gIfKqCxB
	QWfRgrE1FE9O+QhK5BwX0aW8FFHqgnKA4QLJ2pxboLWMr/NMpKKerqXssqryKy6jv4yK
	ddmjaSPfLhx5W1uRMriyObusHbVo9yp3sQgTvj+jupJAVGiX9Tcb5KYREU1lvqKm10cg
	JlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2Z962WngAupW9oBoRvfmzfKhLctK9Is6MeI06TZiwvU=;
	b=GEJBqZmE7c98bntEm5WlQLdKj532VtUXCUzYhCFZAO26NVYIuksGyp8ZVdbKRl0Xp7
	VwVE7UYvJSi2GGPSQQ5BuaXfnnP4nd7Q3saWGG9yljXjB6xIsVVSKL9SsYqUEILsuZ7e
	7okTvLHMj++zgxCdHDOq+D26910GeFCqtAIJiKnkkYfNYhZvcL6zzajhvxi7bTBhq9Up
	63ARyjtHU/00CAnxqUYuEmKP6KUs1LIsE4z0fXqJe1pksHyWzTIB0ld0O9+K4Y+Cmh76
	GNNr+FS95/JKGgCUApbp7ie/v6nXzWB2+OIakoFrK8x/VwdAnlPpkw66zK5ZG/a/nDot
	2TkA==
X-Gm-Message-State: AKS2vOzGUEe2t2ZGVlcXAPcQ79C0PUc8Xb+oag0Qih8EPdrhWLOIWKxf
	UzFQDmLUYsLLOS1C
X-Received: by 10.28.199.137 with SMTP id x131mr14527276wmf.71.1497435940606; 
	Wed, 14 Jun 2017 03:25:40 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id v2sm774849wrb.68.2017.06.14.03.25.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 03:25:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:25:38 +0200
Message-Id: <20170614102538.16250-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <CAJTo0LZ4WBk8dtPmjMO5cDcsuz7QXnLaJdDLxc336zPNEJy-vQ@mail.gmail.com>
References: <CAJTo0LZ4WBk8dtPmjMO5cDcsuz7QXnLaJdDLxc336zPNEJy-vQ@mail.gmail.com>
Subject: [PATCHv2] python-3.5: Move bz2.py, lzma.py and _compression.py from python3-misc to python3-compression
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
X-List-Received-Date: Wed, 14 Jun 2017 10:25:41 -0000

* the /usr/lib/python3.5/_compression.py file is possibly incorrectly included
  in python3-misc. This runtime dependency is needed in order to use e.g. gzip.py in runtime:

  >>> import tarfile, zlib, gzip
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    File "/usr/lib/python3.5/gzip.py", line 12, in <module>
      import _compression
  ImportError: No module named '_compression'

* at least python3-tests and lzma and bz2 still in python3-misc are using this as well:
  $ grep -R import.*_compression tmp-glibc/work/aarch64-oe-linux/python3/3.5.2-r1.0/packages-split/
  tmp-glibc/work/aarch64-oe-linux/python3/3.5.2-r1.0/packages-split/python3-compression/usr/lib/python3.5/gzip.py:import _compression
  tmp-glibc/work/aarch64-oe-linux/python3/3.5.2-r1.0/packages-split/python3-misc/usr/lib/python3.5/lzma.py:import _compression
  tmp-glibc/work/aarch64-oe-linux/python3/3.5.2-r1.0/packages-split/python3-misc/usr/lib/python3.5/bz2.py:import _compression
  tmp-glibc/work/aarch64-oe-linux/python3/3.5.2-r1.0/packages-split/python3-tests/usr/lib/python3.5/test/test_bz2.py:import _compression
  tmp-glibc/work/aarch64-oe-linux/python3/3.5.2-r1.0/packages-split/python3-tests/usr/lib/python3.5/test/test_lzma.py:import _compression

  and python3-tests are using it as well, so add new runtime dependency
  on python3-compression

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 6 +++---
 scripts/contrib/python/generate-manifest-3.5.py      | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 3d9532d7b4..65db7e8f20 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -1,6 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
-# Generator: '../../../scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Generator: 'scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
 
  
 
@@ -34,7 +34,7 @@ FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/__pyca
 
 SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell"
-FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/__pycache__/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/__pycache__/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/__pycache__/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/__pycache__/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so ${libdir}/python3.5/lib-dynload/__pycache__/zlib.*.so "
+FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/__pycache__/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/__pycache__/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/__pycache__/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/__pycache__/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so ${libdir}/python3.5/lib-dynload/__pycache__/zlib.*.so ${libdir}/python3.5/bz2.py ${libdir}/python3.5/__pycache__/bz2.py ${libdir}/python3.5/lzma.py ${libdir}/python3.5/__pycache__/lzma.py ${libdir}/python3.5/_compression.py ${libdir}/python3.5/__pycache__/_compression.py "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
@@ -241,7 +241,7 @@ RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
 FILES_${PN}-terminal="${libdir}/python3.5/pty.* ${libdir}/python3.5/__pycache__/pty.* ${libdir}/python3.5/tty.* ${libdir}/python3.5/__pycache__/tty.* "
 
 SUMMARY_${PN}-tests="Python tests"
-RDEPENDS_${PN}-tests="${PN}-core"
+RDEPENDS_${PN}-tests="${PN}-core ${PN}-compression"
 FILES_${PN}-tests="${libdir}/python3.5/test ${libdir}/python3.5/test/__pycache__ "
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 0de8fedbc2..2975e109c9 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -252,7 +252,7 @@ if __name__ == "__main__":
     "py_compile.* compileall.*" )
 
     m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell",
-    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so lib-dynload/zlib.*.so" )
+    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so lib-dynload/zlib.*.so bz2.py lzma.py _compression.py" )
 
     m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
     "hashlib.* md5.* sha.* lib-dynload/crypt.*.so lib-dynload/_hashlib.*.so lib-dynload/_sha256.*.so lib-dynload/_sha512.*.so" )
@@ -400,7 +400,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-terminal", "Python terminal controlling support", "${PN}-core ${PN}-io",
     "pty.* tty.*" )
 
-    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core",
+    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-compression",
     "test" ) # package
 
     m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
-- 
2.13.1


