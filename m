Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F02B37BF07
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:38:37 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b11so1487511wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZW6H3v2kjmjmdUdne1gO47HPokIwryiw52VJWhEONn8=;
	b=iDiwrRhy9mucEh+48Fcu7kCIyIKxI275BWqNOjvljlZRts/1qvdpQWHb1w5Cis5qhE
	SbP852o7IYmW4Or5M8lO7sILGVE3xVwbNNcP4r1WS8r915RIP+KpEllMwyhjJS9xn5bH
	6sHkoTIju9Wl3VS9bckKvCwmHKMKWdJo1FRmCPIoams0E7RV4azmTkxWCA0yCwI0+Mcx
	2MCMJYIDi3xN5fMKxaZ9hB9ZUMyGgb7AuhrTy9QKN+z/eIBsN3XEYnAdWYjGJV+KUSc3
	kpZtLGVPijxEk9ykisztDesM1Q+GDEpadLGQaeqG0d2RZifXJWPx8ReLXqQu1ddlE8X2
	wjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZW6H3v2kjmjmdUdne1gO47HPokIwryiw52VJWhEONn8=;
	b=ow4xtyWSJivAJlWLWdhcmoOdUmDLlkEBJGPvSKOKm3hCb0zmiEsXTGzmbCd3W5k96j
	IpaYBtQzF8SKXYHtqcZ7N/fZgWW6S/wbB4NuWyAUp+/1CKuJJGJc86lcfRX+hkqJ0DRg
	LSFQBRtPUlqUMkNiqsB4VXDu5CVl/1pXG5XZKYDaEJ6FoPeGOr5Z4vboCBQXalr9YQ2r
	GF4fPCSlaWC06dZ3L7MyPVFOmVWjW2heU7CUpnASwQD7B4qp+qoWa5L+4HJDkg16B7un
	9lmo1iotLer2NJVK1V2dF6pwURg1Y4bHQZ7VWQG8a2lIE8/JTyITkaQ4/9E/XisCmqUE
	o01g==
X-Gm-Message-State: AJcUukc6732s49PeOdDFNLQhy9kAH00CkPbfNYDQnGnCgRK3qnTHUXih
	rZ/YuHTZ9lLa8YFtbSgAfS5ZcTJiGwU=
X-Google-Smtp-Source: ALg8bN7e//hbv7ZzAirgEbaG4Rw9divChiIutix61gIbbL0rrTRKCJcu/N69kKznKYwqfnG5UGh9cw==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr9882206wma.114.1546879118368; 
	Mon, 07 Jan 2019 08:38:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o5sm13918958wmg.25.2019.01.07.08.38.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 08:38:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 16:38:21 +0000
Message-Id: <20190107163823.31816-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107163823.31816-1-ross.burton@intel.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
Subject: [PATCH 5/7] oeqa/sdk/cases: clean up DL_DIR handling
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
X-List-Received-Date: Mon, 07 Jan 2019 16:38:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py          | 3 +--
 meta/lib/oeqa/sdk/cases/buildcpio.py       | 3 +--
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 3 +--
 meta/lib/oeqa/sdk/cases/buildlzip.py       | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index 21c91068815..595f3834894 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -20,8 +20,7 @@ class BuildAssimp(OESDKTestCase):
     def test_assimp(self):
         import tempfile
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
-            dl_dir = self.td.get('DL_DIR', None)
-            tarball = self.fetch(testdir, dl_dir, "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz")
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
 
             sourcedir = os.path.join(testdir, "assimp-4.1.0") 
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index ff3e1347d37..9504ee8e053 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -13,8 +13,7 @@ class BuildCpioTest(OESDKTestCase):
     """
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            dl_dir = self.td.get('DL_DIR', None)
-            tarball = self.fetch(testdir, dl_dir, "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz")
 
             dirs = {}
             dirs["source"] = os.path.join(testdir, "cpio-2.12")
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 164a695637a..47d7580fafd 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -20,8 +20,7 @@ class GalculatorTest(OESDKTestCase):
 
     def test_galculator(self):
         with tempfile.TemporaryDirectory(prefix="galculator", dir=self.tc.sdk_dir) as testdir:
-            dl_dir = self.td.get('DL_DIR', None)
-            tarball = self.fetch(testdir, dl_dir, "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
 
             dirs = {}
             dirs["source"] = os.path.join(testdir, "galculator-2.1.4")
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index a7ca239fb49..b7483bfea51 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -9,8 +9,7 @@ class BuildLzipTest(OESDKTestCase):
     """
     def test_lzip(self):
         with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
-            dl_dir = self.td.get('DL_DIR', None)
-            tarball = self.fetch(testdir, dl_dir, "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
 
             dirs = {}
             dirs["source"] = os.path.join(testdir, "lzip-1.19")
-- 
2.11.0


