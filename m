Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 96CB160842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg5Kn001247; Thu, 22 Aug 2013 12:42:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uuUTeM64EVAr; Thu, 22 Aug 2013 12:42:05 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg2Ab001211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:04 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5V-0001hO-Sk; Thu, 22 Aug 2013 12:30:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:33 +0100
Message-Id: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 01/28] package.bbclass: Fix handling of symlinks in debug packages
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:16 -0000

When copying the sources for the debug source package we use cpio -Ll
which means to copy files as hardlinks and to dereference symlinks.
It appears there is a bug in cpio since -Ll will copy symlinks and
not dereference them. We therefore do a second pass over copied symlinks
resolving them into files. Ideally we would copy these as hardlinks as well
however it doesn't seem worth the extra code and effort for what amounts
to a corner case for a minor space improvement.

This means that the -dbg packages no longer contain broken symlinks.

[YOCTO #5020]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2460d0a..f6f9310 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -316,6 +316,12 @@ def copydebugsources(debugsrcdir, d):
         #if retval:
         #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
 
+        # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
+        # Work around this by manually finding and copying any symbolic links that made it through.
+        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
+        (retval, output) = oe.utils.getstatusoutput(cmd)
+        if retval:
+            bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
 
         # The copy by cpio may have resulted in some empty directories!  Remove these
         cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
-- 
1.8.1.2


