Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id B426372DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:36 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2406487pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Cc6nMDtQ6dBcYgWlpghPDnRpvnc2aKPCToN5VzcTfYM=;
	b=NoGv5NzpTgcj2SMVOBmZtsntE7SP8WMJYOJDv224gH2ijVUP7lYgfV0EatdkyhD13V
	zIp3A5+aVk4ZoG69Le5klHX9PhJEJ/+vwnfawEqjJR4yianjq4O1tAec6lKEuiJLKJ9u
	L40fHrttH9O+hqgQHuEpaZxMmfLv9Ex9tKs0T2XK3sWbJjm98IV+aSr94whdYrEE4fug
	Gcaiws+TXvO9S3+fVNeCdh9WelH7zZCj7ssdirG3kIYIrA3R88jbuk6o+yKZKLQTWYdH
	ITTKY6OI8CZGt1fpNPAxgrcyFmH2HGLKyP2rBfxqkGjsIPR60xT/yQdIYnZf+WcpZ8u0
	6Sdg==
X-Received: by 10.68.231.130 with SMTP id tg2mr6922377pbc.32.1423152274960;
	Thu, 05 Feb 2015 08:04:34 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:19 -0800
Message-Id: <efd1d003e82920a53c4f53d1a879403c98a4ce12.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 11/61] bitbake: wget: Add localpaths method which gives localpath with history
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:36 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In some cases for cache purpoes we not only need to know which file
is going to be used but also which paths were considered. Add a
localpaths method which includes the history.

The core which() funciton already supports this, this just extends
the function to preserve the extra data we need. localpath becomes
just a special case of the case with history.

(Bitbake rev: ea5efeac5c1f7986666c979f789786f29fc1619a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 bitbake/lib/bb/fetch2/local.py | 54 ++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/local.py b/bitbake/lib/bb/fetch2/local.py
index 6fa188f..0785236 100644
--- a/bitbake/lib/bb/fetch2/local.py
+++ b/bitbake/lib/bb/fetch2/local.py
@@ -51,29 +51,41 @@ class Local(FetchMethod):
         """
         Return the local filename of a given url assuming a successful fetch.
         """
+        return self.localpaths(urldata, d)[-1]
+
+    def localpaths(self, urldata, d):
+        """
+        Return the local filename of a given url assuming a successful fetch.
+        """
+        searched = []
         path = urldata.decodedurl
         newpath = path
-        if path[0] != "/":
-            filespath = data.getVar('FILESPATH', d, True)
-            if filespath:
-                logger.debug(2, "Searching for %s in paths:\n    %s" % (path, "\n    ".join(filespath.split(":"))))
-                newpath = bb.utils.which(filespath, path)
-            if not newpath:
-                filesdir = data.getVar('FILESDIR', d, True)
-                if filesdir:
-                    logger.debug(2, "Searching for %s in path: %s" % (path, filesdir))
-                    newpath = os.path.join(filesdir, path)
-            if (not newpath or not os.path.exists(newpath)) and path.find("*") != -1:
-                # For expressions using '*', best we can do is take the first directory in FILESPATH that exists
-                newpath = bb.utils.which(filespath, ".")
-                logger.debug(2, "Searching for %s in path: %s" % (path, newpath))
-                return newpath
-            if not os.path.exists(newpath):
-                dldirfile = os.path.join(d.getVar("DL_DIR", True), path)
-                logger.debug(2, "Defaulting to %s for %s" % (dldirfile, path))
-                bb.utils.mkdirhier(os.path.dirname(dldirfile))
-                return dldirfile
-        return newpath
+        if path[0] == "/":
+            return [path]
+        filespath = data.getVar('FILESPATH', d, True)
+        if filespath:
+            logger.debug(2, "Searching for %s in paths:\n    %s" % (path, "\n    ".join(filespath.split(":"))))
+            newpath, hist = bb.utils.which(filespath, path, history=True)
+            searched.extend(hist)
+        if not newpath:
+            filesdir = data.getVar('FILESDIR', d, True)
+            if filesdir:
+                logger.debug(2, "Searching for %s in path: %s" % (path, filesdir))
+                newpath = os.path.join(filesdir, path)
+                searched.append(newpath)
+        if (not newpath or not os.path.exists(newpath)) and path.find("*") != -1:
+            # For expressions using '*', best we can do is take the first directory in FILESPATH that exists
+            newpath, hist = bb.utils.which(filespath, ".", history=True)
+            searched.extend(hist)
+            logger.debug(2, "Searching for %s in path: %s" % (path, newpath))
+            return searched
+        if not os.path.exists(newpath):
+            dldirfile = os.path.join(d.getVar("DL_DIR", True), path)
+            logger.debug(2, "Defaulting to %s for %s" % (dldirfile, path))
+            bb.utils.mkdirhier(os.path.dirname(dldirfile))
+            searched.append(dldirfile)
+            return searched
+        return searched
 
     def need_update(self, ud, d):
         if ud.url.find("*") != -1:
-- 
1.9.1


