Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 157F26BE7E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:26:41 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w61so3828002wes.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kd9fDtuStPAwCIhUbonxk02nbIMdEY60bLTF559antc=;
	b=jblwrB0A4+H5fSuvgTEOWCjRtvYQ/o9iVzwcFX/6y0pPrIoIgqOZ7aRLQ7WuXAJPur
	oCituBiOO3mRgu4dbOUmZfhXl6Veumh5EFxWCboEK9Dg5zg9aQfYIblAyGCxc8dnY6gB
	VUAXRrj145m2pCLiAgho3QtwjEg87mJ/bzC7Rlp16SWIyDU8CTs7XukbcIwYnnUT3KS/
	kuk/6kwkS5UvO8E/ZgHzk6tEuqXsTzVVOa1fOWFYF+Lb+HtuMQIBKXFMgm+Vj9uNtF2e
	QiQN74gwz/c/xuun7+v/hQUUtwKD6wItilMzX/Zd3gwmzRXeBU2QKYovH8ipM1RwVf06
	IX3A==
X-Gm-Message-State: ALoCoQnWrqx3DECoTGbAvQVcj9Ule0j+c6jgdihZ3V8T9TAZB10frFo/PIAvBIpQ0/MAugP8pH4Q
X-Received: by 10.194.118.228 with SMTP id kp4mr6995034wjb.94.1393878382889;
	Mon, 03 Mar 2014 12:26:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id z1sm40783012wjq.19.2014.03.03.12.26.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 12:26:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 20:26:19 +0000
Message-Id: <1393878379-27866-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lib/oe: drop custom implementation of oe.path.relative
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
X-List-Received-Date: Mon, 03 Mar 2014 20:26:42 -0000

As we now require Python 2.7 and os.path.relpath() was added in 2.6 we can now
drop the reimplementation in oe.path.

oe.path.relative is simple now a wrapper that changes the order of the arguments
and it's use discouraged.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/path.py |   18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 46783f8..413ebfb 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -21,23 +21,7 @@ def relative(src, dest):
     foo/bar
     """
 
-    if hasattr(os.path, "relpath"):
-        return os.path.relpath(dest, src)
-    else:
-        destlist = os.path.normpath(dest).split(os.path.sep)
-        srclist = os.path.normpath(src).split(os.path.sep)
-
-        # Find common section of the path
-        common = os.path.commonprefix([destlist, srclist])
-        commonlen = len(common)
-
-        # Climb back to the point where they differentiate
-        relpath = [ os.path.pardir ] * (len(srclist) - commonlen)
-        if commonlen < len(destlist):
-            # Add remaining portion
-            relpath += destlist[commonlen:]
-
-        return os.path.sep.join(relpath)
+    return os.path.relpath(dest, src)
 
 def make_relative_symlink(path):
     """ Convert an absolute symlink to a relative one """
-- 
1.7.10.4


