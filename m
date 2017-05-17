Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 118C271A72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 07:30:47 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id w50so439667wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 00:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G4qwpmUNIxCMfX8qyjS3wE1Pklhcf1pxxzgEnZcWHsA=;
	b=DvPSD1wRaKJXtMlHlUCFZJ3gWMxFITcCqngRVsY9FoD+xYneqKCtaZUrOBrM+upJRx
	iefDKtAsGkPB+LBlVyrnv0e35CP6REW67lsO4wc42WMr1k0+JxEFpckSin9jO0mvPNcd
	vytxRvXH9wmnJopKx2yZPqmiXqhlhM7eeY3WnP+IpdRvv8i8Y3bbBehrNciqWack4gh9
	RYx1VQWqYO0Iwd90TeyVYtdRyPLij6X7OH/6aObs9LDS2RCL24l07VcEiY9zDMVc17EI
	kj93Mykc88oNLjco/4S9/l7Jk75zd+gHj24uhnXDWqj3+am1/VZ2koz5mV9jSz1WC4eg
	RL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G4qwpmUNIxCMfX8qyjS3wE1Pklhcf1pxxzgEnZcWHsA=;
	b=aexnGLUKfBEHAcZ/0SFi4Kw9m9VzqQBDAZz59zt8N8VNOb3rRCaMoP8IRB3yMFgzpF
	/4C5wf/eyICOhckKDvHaOG8pXIDitx3z1YHlZPF/3UHzZPVdUkUJ3Q7Ega3gmvRk0xhx
	s4S5uFYlFpP8XRCMug3J16Q9kQNyxa6ZdDlAJlWJNPB5R7pviCTMgsgv19DKtVaWROeV
	sELmYonrGsTG9ttb2EeJ9io4F780sHw+zeXNTWHDD4PAd5C0NDMHHNKRw5Te7uXBvhuH
	IzobHa2MTpe5PkgIvfY0uZhiC5hawW+p6VuOTqpOzFhqLm2ipS3078YPeZCs/1oaO9Ke
	DuoA==
X-Gm-Message-State: AODbwcDpLbs6Q9L/LFLlC1nAJLArZPbl5061G1sXyWz1dyLeNJoLfkCw
	ooo3QRb5YhlPjw==
X-Received: by 10.223.134.238 with SMTP id 43mr1108860wry.80.1495006248422;
	Wed, 17 May 2017 00:30:48 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id v7sm1195946wme.5.2017.05.17.00.30.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 00:30:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 09:31:38 +0200
Message-Id: <20170517073138.23672-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] python-3.5: add runtime dependency from python3-compression on python3-misc
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
X-List-Received-Date: Wed, 17 May 2017 07:30:52 -0000

* the /usr/lib/python3.5/_compression.py file is possibly incorrectly included
  in python3-misc, either it should be moved to python3-compression or this
  runtime dependency is needed in order to use e.g. gzip.py in runtime:

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
  that's why I've just added runtime dependency without moving the _compression.py to different package.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 1e20f00c64..6815b39bc3 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -33,7 +33,7 @@ RDEPENDS_${PN}-compile="${PN}-core"
 FILES_${PN}-compile="${libdir}/python3.5/py_compile.* ${libdir}/python3.5/__pycache__/py_compile.* ${libdir}/python3.5/compileall.* ${libdir}/python3.5/__pycache__/compileall.* "
 
 SUMMARY_${PN}-compression="Python high-level compression support"
-RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell"
+RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell ${PN}-misc"
 FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/__pycache__/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/__pycache__/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/__pycache__/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/__pycache__/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so ${libdir}/python3.5/lib-dynload/__pycache__/zlib.*.so "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 075860c418..2c29a29843 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -253,7 +253,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-compile", "Python bytecode compilation support", "${PN}-core",
     "py_compile.* compileall.*" )
 
-    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell",
+    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-threading ${PN}-shell ${PN}-misc",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so lib-dynload/zlib.*.so" )
 
     m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
-- 
2.13.0


