Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 156526B553
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 22:09:06 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so486748eek.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ngJVCkORDxKH7xoRxm5x4hnkOQwvSRF53Fm7yCUa9V8=;
	b=JqPwzFS48G6cMDZfni9xmE0paNZ2YwXDS8/lBhBI6/HtrSaqwme5xylknEdE6htTqf
	P5NHU+gxm16GWFL1W/O0ecr+nkmYkq8+Dob/useGZ3YShwFXu8aHEGyOSbzYx04Q08rj
	SNe42zSPaIIVKxlhdQTWUIvhWB9qUCOmjl8MPFtaJkhnt8xhRd4rzZwwo/afEIeIISTG
	q5gUM46QoWwFtIaP5zJ17F4qnFEY/EDG0bk6S1O/rdf06ZZ4y+4t03tYnwSmFxUt6IfH
	Os9baP9KDMMHRNNl1hkVOqT6Oa+vD57G8usnDS/P9l4vMiV3kP4gdZvuCuljdZE8pHnl
	1Tng==
X-Received: by 10.15.33.74 with SMTP id b50mr139106eev.140.1375826946632;
	Tue, 06 Aug 2013 15:09:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm5037235eeh.15.2013.08.06.15.09.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 15:09:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 00:09:49 +0200
Message-Id: <1375826989-15923-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] buildhistory: use bb.utils.mkdirhier instead of os.makedirs
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
X-List-Received-Date: Tue, 06 Aug 2013 22:09:07 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* Multiple do_fetch[prefunc] can happen at the same time and
  if not os.path.exists(pkghistdir):
    os.makedirs(pkghistdir)
  isn't safe
* Use bb.utils.mkdirhier which doesn't raise error when directory exists

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7be442e..33b670d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -169,7 +169,7 @@ python buildhistory_emit_pkghistory() {
 
     packagelist = packages.split()
     if not os.path.exists(pkghistdir):
-        os.makedirs(pkghistdir)
+        bb.utils.mkdirhier(pkghistdir)
     else:
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
@@ -268,7 +268,7 @@ def write_pkghistory(pkginfo, d):
 
     pkgpath = os.path.join(pkghistdir, pkginfo.name)
     if not os.path.exists(pkgpath):
-        os.makedirs(pkgpath)
+        bb.utils.mkdirhier(pkgpath)
 
     infofile = os.path.join(pkgpath, "latest")
     with open(infofile, "w") as f:
@@ -580,7 +580,7 @@ python write_srcrev() {
     srcrevs, tag_srcrevs = _get_srcrev_values(d)
     if srcrevs:
         if not os.path.exists(pkghistdir):
-            os.makedirs(pkghistdir)
+            bb.utils.mkdirhier(pkghistdir)
         old_tag_srcrevs = {}
         if os.path.exists(srcrevfile):
             with open(srcrevfile) as f:
-- 
1.8.3.2


