Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 02ED671D9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0QAAnCO007705; Thu, 26 Jan 2017 10:10:49 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i5YSmbSdtegH; Thu, 26 Jan 2017 10:10:49 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0QAAi9R007702
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 Jan 2017 10:10:45 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cWh0u-0000wU-S9; Thu, 26 Jan 2017 10:10:44 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 10:10:40 +0000
Message-Id: <1485425440-3583-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] staging: Handle overlapping files for build-sysroot
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
X-List-Received-Date: Thu, 26 Jan 2017 10:10:51 -0000

The use of bb.fatal means build-sysroots fails as soon as multiple gdb's are
built with overlapping files, or multiple recipes with overlapping headers
exist.

Change the fatal call into an exception which we can then trap. Also
avoid trying to call readlink on something with isn't a symlink.

This allows build-sysroots to work better under various scenarios.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index b97f261..1fe60ac 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -260,9 +260,11 @@ def staging_copyfile(c, target, fixme, postinsts, stagingdir):
     if os.path.islink(c):
         linkto = os.readlink(c)
         if os.path.lexists(dest):
+            if not os.path.islink(dest):
+                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
             if os.readlink(dest) == linkto:
                 return dest
-            bb.fatal("Link %s already exists to a different location?" % dest)
+            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
         os.symlink(linkto, dest)
         #bb.warn(c)
     else:
@@ -331,7 +333,10 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
                     if l.endswith("/"):
                         staging_copydir(l, targetdir, stagingdir)
                         continue
-                    staging_copyfile(l, targetdir, fixme, postinsts, stagingdir)
+                    try:
+                        staging_copyfile(l, targetdir, fixme, postinsts, stagingdir)
+                    except FileExistsError:
+                        continue
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
     for p in postinsts:
-- 
2.7.4


