Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1vx-0007an-0l
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:41 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so3663821wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wAw7z4qiGkX83w9mSfQFHBKB83wnRIBklcWQsE18CvM=;
	b=HEI9v/qi9umm9IGGv9anacux2HhvfkpHL6pyVqDYfwcbZNZrxDvFTeRCabmN+8Nz+q
	i4vsW/3/ATtgYIyMR+eb3oWH20/mLFLbNvpLhQ1hDRVig5Fzp5iuE/XK+nDHErB/UntZ
	qBde8b0e5nfFgWOtWqY9A3bflSRgpytLlIQzweeWBcABKzSGUCW8XA59oEweL9nL97Fw
	UmnK6xuqE2kyqj+6NA3g/iFFMr2RG2kcBW7LXa4z/ViVDJcTVoFaOTF6ETTlYhbWgoe3
	YlRsuyvuVY1I3kHsKOhUqFPTls9gOA/lo3qmkojh8tbTXrtD08SQGlr4mbvF1/uwyRN/
	Pi/Q==
Received: by 10.216.195.143 with SMTP id p15mr6727663wen.167.1343700006921;
	Mon, 30 Jul 2012 19:00:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm4004144wiz.4.2012.07.30.19.00.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 04:00:01 +0200
Message-Id: <1343700001-15097-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] package.bbclass: fix TypeError in runstrip
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 02:11:41 -0000

* some packages have .ko files which are not elf, without this change
  it fails with TypeError, with this change only runstip fails and
  reports where:
  ERROR: runstrip: ''arm-oe-linux-gnueabi-strip'  '/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/emacs-23.4-r0/package/usr/share/emacs/23.4/etc/tutorials/TUTORIAL.ko'' strip command failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6142911..3aaf999 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -291,12 +291,16 @@ def runstrip(file, elftype, d):
         os.chmod(file, newmode)
 
     extraflags = ""
-    # .so and shared library
-    if ".so" in file and elftype & 8:
-        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
-    # shared or executable:
-    elif elftype & 8 or elftype & 4:
-        extraflags = "--remove-section=.comment --remove-section=.note"
+    
+    # split_and_strip_files is calling this with elf_type None, causing:
+    # TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'
+    if elftype:
+        # .so and shared library
+        if ".so" in file and elftype & 8:
+            extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+        # shared or executable:
+        elif elftype & 8 or elftype & 4:
+            extraflags = "--remove-section=.comment --remove-section=.note"
 
     stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
-- 
1.7.8.6



