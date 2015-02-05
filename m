Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8A11B60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:31 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so5953485pdb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bH4Bf9eylafXsAR3FqDU1lm9XIoIojpdep81DHUMVog=;
	b=jNY6VLHCi1MALXU8hRYgNRDRTPkz4QVgf/b+H7rlDeba5ooOzKdgW7MRFUJYkk4CKv
	BwfpLNx873vQa/4hzRkOh9sM2YQ7z6TGgFVAvzQeKkkD5+59YIMoTHc1XkBJyU+O6FJD
	ZcQjfoy0V5QuCgLjIBsX2elephZDEfcNPdbHux5xhNTNeeAqiTG/QUNDCIWfx8vYTnOs
	POo7n8hKrdtePm6t80d/w5bvJL19amcSKDAD7vSn1p6QJ291ajdNDimd4kRfJKjEJRnS
	0zIssGj41SI0eAHtI0190/VMcPQUSaEfas9NeJrukF0cc0h7861e7I+BTZWfl1EBN6vn
	AXnA==
X-Received: by 10.68.195.65 with SMTP id ic1mr6559569pbc.109.1423152273099;
	Thu, 05 Feb 2015 08:04:33 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:18 -0800
Message-Id: <a0758bd9d8c0743422460164df4b57b1221d4da0.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 10/61] bitbake: cache/fetch2/siggen: Ensure we track include history for file checksums
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:31 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, if you reference a file url, its checksum is included in the
task hash, however if you change to a different file at a different
location, perhaps taking advantage of the FILESPATH functionality, the
system will not reparse the file in question and change its checksum to
match the new file.

To correctly handle this, the system not only needs to know if the
existing file still exists or not, but also check the existance
of every file it would have looked at when computing the original file.

We already do this in the bitbake parsing code for class inclusion. This
change uses the same technique to log the file list we looked at and
if files in these locations exist when they previously did not, to
invalidate and reparse the file.

Since data stored in the cache is flattened text, we have to use a string
form of the data and split on the ":" character which is ugly, but is
an internal detail we can improve later if a better method is found.

The cache version changes to trigger a reparse since the previous
cache data is now incompatible.

[YOCTO #7019]

(Bitbake rev: 6c0706a28d72c591f1b75b6e3f3b645859387c7e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 bitbake/lib/bb/cache.py           |  9 ++++++---
 bitbake/lib/bb/fetch2/__init__.py | 35 ++++++++++++++++++-----------------
 bitbake/lib/bb/siggen.py          |  3 ++-
 3 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
index ac0c27f..715da07 100644
--- a/bitbake/lib/bb/cache.py
+++ b/bitbake/lib/bb/cache.py
@@ -43,7 +43,7 @@ except ImportError:
     logger.info("Importing cPickle failed. "
                 "Falling back to a very slow implementation.")
 
-__cache_version__ = "147"
+__cache_version__ = "148"
 
 def getCacheFile(path, filename, data_hash):
     return os.path.join(path, filename + "." + data_hash)
@@ -529,8 +529,11 @@ class Cache(object):
         if hasattr(info_array[0], 'file_checksums'):
             for _, fl in info_array[0].file_checksums.items():
                 for f in fl.split():
-                    if not ('*' in f or os.path.exists(f)):
-                        logger.debug(2, "Cache: %s's file checksum list file %s was removed",
+                    if "*" in f:
+                        continue
+                    f, exist = f.split(":")
+                    if (exist == "True" and not os.path.exists(f)) or (exist == "False" and os.path.exists(f)):
+                        logger.debug(2, "Cache: %s's file checksum list file %s changed",
                                         fn, f)
                         self.remove(fn)
                         return False
diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index c0a4763..378d41e 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -936,22 +936,21 @@ def get_checksum_file_list(d):
         ud = fetch.ud[u]
 
         if ud and isinstance(ud.method, local.Local):
-            ud.setup_localpath(d)
-            f = ud.localpath
-            pth = ud.decodedurl
-            if '*' in pth:
-                f = os.path.join(os.path.abspath(f), pth)
-            if f.startswith(dl_dir):
-                # The local fetcher's behaviour is to return a path under DL_DIR if it couldn't find the file anywhere else
-                if os.path.exists(f):
-                    bb.warn("Getting checksum for %s SRC_URI entry %s: file not found except in DL_DIR" % (d.getVar('PN', True), os.path.basename(f)))
-                else:
-                    bb.warn("Unable to get checksum for %s SRC_URI entry %s: file could not be found" % (d.getVar('PN', True), os.path.basename(f)))
-            filelist.append(f)
+            paths = ud.method.localpaths(ud, d)
+            for f in paths:
+                pth = ud.decodedurl
+                if '*' in pth:
+                    f = os.path.join(os.path.abspath(f), pth)
+                if f.startswith(dl_dir):
+                    # The local fetcher's behaviour is to return a path under DL_DIR if it couldn't find the file anywhere else
+                    if os.path.exists(f):
+                        bb.warn("Getting checksum for %s SRC_URI entry %s: file not found except in DL_DIR" % (d.getVar('PN', True), os.path.basename(f)))
+                    else:
+                        bb.warn("Unable to get checksum for %s SRC_URI entry %s: file could not be found" % (d.getVar('PN', True), os.path.basename(f)))
+                filelist.append(f + ":" + str(os.path.exists(f)))
 
     return " ".join(filelist)
 
-
 def get_file_checksums(filelist, pn):
     """Get a list of the checksums for a list of local files
 
@@ -981,6 +980,10 @@ def get_file_checksums(filelist, pn):
 
     checksums = []
     for pth in filelist.split():
+        exist = pth.split(":")[1]
+        if exist == "False":
+            continue
+        pth = pth.split(":")[0]
         if '*' in pth:
             # Handle globs
             for f in glob.glob(pth):
@@ -988,14 +991,12 @@ def get_file_checksums(filelist, pn):
                     checksums.extend(checksum_dir(f))
                 else:
                     checksum = checksum_file(f)
-                    if checksum:
-                        checksums.append((f, checksum))
+                    checksums.append((f, checksum))
         elif os.path.isdir(pth):
             checksums.extend(checksum_dir(pth))
         else:
             checksum = checksum_file(pth)
-            if checksum:
-                checksums.append((pth, checksum))
+            checksums.append((pth, checksum))
 
     checksums.sort(key=operator.itemgetter(1))
     return checksums
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 28f93ba..ef683ba 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -185,7 +185,8 @@ class SignatureGeneratorBasic(SignatureGenerator):
             checksums = bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task], recipename)
             for (f,cs) in checksums:
                 self.file_checksum_values[k][f] = cs
-                data = data + cs
+                if cs:
+                    data = data + cs
 
         taint = self.read_taint(fn, task, dataCache.stamp[fn])
         if taint:
-- 
1.9.1


