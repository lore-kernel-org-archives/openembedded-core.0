Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 848AD7CDE1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 22:58:05 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id AE54F5C0187;
	Fri,  1 Mar 2019 23:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1551481085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=8kueIWOb7vFknR9M25j2lAAUtL23HLmWIGwhoXevxK4=;
	b=eicbUYjQbxDiOeuzFss3q3Q7I9XD+wznkSbAtdLQlDv32IbqjBr0YvmPihvGexgzk0SZkD
	d8vYPjLD4a7WXWbL4RVWNqNCN+jarmBtfJ7XrxWFPQ+dvy6fJkzLQGWRvNIg9U8ZFvDCQU
	9jpz8N6UEo0TMWnlKsGkr4xsFbw6VHw=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 23:58:02 +0100
Message-Id: <20190301225802.62860-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>, liu.ming50@gmail.com
Subject: [PATCH] psplash: improve make-image-header.sh call
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
X-List-Received-Date: Fri, 01 Mar 2019 22:58:05 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Simplify make-image-header.sh call and make sure it gets called in
the current working directory. Also check the return value of the
function call.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 3ad1ef4815..3161a5e3f1 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -74,7 +74,6 @@ ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
 python do_compile () {
     import shutil
     import subprocess
-    import shlex
 
     # Build a separate executable for each splash image
     workdir = d.getVar('WORKDIR')
@@ -84,9 +83,10 @@ python do_compile () {
     outputfiles = d.getVar('SPLASH_INSTALL').split()
     for localfile, outputfile in zip(localfiles, outputfiles):
         if localfile.endswith(".png"):
-            subprocess.call(shlex.split('%s %s POKY' % (convertscript, os.path.join(workdir, localfile))))
+            if subprocess.call([ convertscript, os.path.join(workdir, localfile), 'POKY' ], cwd=workdir):
+                bb.fatal("Error calling convert script '%s'" % (convertscript))
             fbase = os.path.splitext(localfile)[0]
-            shutil.copyfile("%s-img.h" % fbase, destfile)
+            shutil.copyfile(os.path.join(workdir, "%s-img.h" % fbase), destfile)
         else:
             shutil.copyfile(os.path.join(workdir, localfile), destfile)
         # For some reason just updating the header is not enough, we have to touch the .c
-- 
2.13.6


