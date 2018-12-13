Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 975CB6D576
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so1657139plp.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=K/5bKjVnKlCTqXuMV4c83POTaRjsiWK3hZnwUOH6U7g=;
	b=TziNw+Yxgvah4gunt26OcttQj49H9FfM9jbEAU+4p9R3HNPpPdk+ceJG2z1gCQE28a
	8u4vrCvCF+beUJVp4qGf2AMEQkjo1tgurpq/ekeBS9tPSyoLDRIn7IHwQhr7OsNxZGgU
	eUpU4Kbt/5QRrRbGM6eWuFdNXjz/4gKP5GBPNQms0Z93bbBTMAO3EBXJvfVYpft52ehH
	XEWe2Aw0FJD9lVKc5kjt1ozssS5Egp4SVMhP0INSHM0ms2qdcnp+2sFrZQAjMrhMFRrN
	KoRV6KY4UIk1Ru+4R7KLlvt1TggghiDK6ypwKPhDQCygrjUvsj8Nq5XgA/NJrmYnkk3Q
	gddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K/5bKjVnKlCTqXuMV4c83POTaRjsiWK3hZnwUOH6U7g=;
	b=m43oM0/yBJi8coBNngpiYEFf5dj8iwsId7CjDkVVZAU/DZ0b2WXo2/ILu0c0NYsl1K
	7e0R8BdX6T5UBxPgK8zJQ6eK4OWYVd8DWaZbxhXyvQlb1GXh2B4LzCCb/imUzAlDw+0v
	a6qGl1EW1GVydRLa1IzG+fDmcyHhO+6Br2MHIK0ZpPqizlfpLgfB/CtW8iQm2tdz0FLl
	jm6gzF5z0tOOB9ZXLC80JCOlnJVOVChIL8aWWwthtciCI9P6VirSfhowgjJvwy33JNJz
	7ZENIIr/+mnYuBcXSolxyeIv7VDzeuj7hxJubS6RILOMCGR06OvH1EMrf+c1WrE1wW9N
	GkwA==
X-Gm-Message-State: AA+aEWb2hauWg6osSQxsd+T9in/2Yozik2C/e4gpEyao3fd/8/tgiCuN
	T+VsnmOHgTb9nNFGqN7bd5TxyarL
X-Google-Smtp-Source: AFSGD/VPawAmWqmwnPDFfUhwo+ltY0zxTuFNEqNTW18HOxLgMxhg5ESZerIikm4h+w0UMkeKpVfndw==
X-Received: by 2002:a17:902:784d:: with SMTP id
	e13mr462463pln.188.1544737162493; 
	Thu, 13 Dec 2018 13:39:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:26 -0800
Message-Id: <0ed89f2d5860bfdcea61796de17f152f0b37fc8f.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 18/45] oeqa: don't litter /tmp with temporary directories
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:21 -0000

From: Ross Burton <ross.burton@intel.com>

If we need to create a temporary directory in targetbuild or buildproject use
tempfile.TemporaryDirectory so that when the test case is finished, the
directory is deleted.

Also synchronise the logic and don't possibly store the temporary directory in
self.tmpdir as nothing uses that.

(From OE-Core rev: db0e658097130d146752785d0d45f46a3e0bad71)

(From OE-Core rev: d39252324a13580cc96f0694b88bc10515e030a0)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/buildproject.py | 3 ++-
 meta/lib/oeqa/utils/targetbuild.py  | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index 721f35d..88e7b7f 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -17,7 +17,8 @@ class BuildProject(metaclass=ABCMeta):
         self.uri = uri
         self.archive = os.path.basename(uri)
         if not tmpdir:
-            tmpdir = tempfile.mkdtemp(prefix='buildproject')
+            self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
+            tmpdir = self.tempdirobj.name
         self.localarchive = os.path.join(tmpdir, self.archive)
         self.dl_dir = dl_dir
         if foldername:
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 1202d57..b8db7b2 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -20,8 +20,9 @@ class BuildProject(metaclass=ABCMeta):
         if not tmpdir:
             tmpdir = self.d.getVar('WORKDIR')
             if not tmpdir:
-                tmpdir = tempfile.mkdtemp(prefix='buildproject')
-        self.localarchive = os.path.join(tmpdir,self.archive)
+                self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
+                tmpdir = self.tempdirobj.name
+        self.localarchive = os.path.join(tmpdir, self.archive)
         if foldername:
             self.fname = foldername
         else:
-- 
2.7.4


