Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fC-0002bU-Qb
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:11:59 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401ECv020471; Mon, 4 Feb 2013 00:01:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QRcivUtVUQhB; Mon,  4 Feb 2013 00:01:14 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14018Gu020445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:09 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pg-0000X2-SX; Sun, 03 Feb 2013 23:55:56 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:32 +0000
Message-Id: <e61803b2efc9a2724b95398d5dd50a1c0903d634.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/22] package: Don't export PATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 00:12:32 -0000

PATH is already exported, we don't need to do this each time we run
something, its just noise and overhead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cafab1e..527ef31 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -233,7 +233,6 @@ def splitdebuginfo(file, debugfile, debugsrcdir, d):
     import commands, stat, subprocess
 
     dvar = d.getVar('PKGD', True)
-    pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
     objcopy = d.getVar("OBJCOPY", True)
     debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
     workdir = d.getVar("WORKDIR", True)
@@ -252,14 +251,14 @@ def splitdebuginfo(file, debugfile, debugsrcdir, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        subprocess.call("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, workparentdir, debugsrcdir, sourcefile, file), shell=True)
+        subprocess.call("'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file), shell=True)
 
     bb.mkdirhier(os.path.dirname(debugfile))
 
-    subprocess.call("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile), shell=True)
+    subprocess.call("'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile), shell=True)
 
     # Set the debuglink to have the view of the file path on the target
-    subprocess.call("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file), shell=True)
+    subprocess.call("'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file), shell=True)
 
     if newmode:
         os.chmod(file, origmode)
@@ -275,7 +274,6 @@ def copydebugsources(debugsrcdir, d):
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
         dvar = d.getVar('PKGD', True)
-        pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
         strip = d.getVar("STRIP", True)
         objcopy = d.getVar("OBJCOPY", True)
         debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
@@ -322,7 +320,6 @@ def runstrip(file, elftype, d):
 
     import commands, stat, subprocess
 
-    pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
     strip = d.getVar("STRIP", True)
 
     newmode = None
@@ -345,7 +342,7 @@ def runstrip(file, elftype, d):
     stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
-    ret = subprocess.call("%s%s" % (pathprefix, stripcmd), shell=True)
+    ret = subprocess.call(stripcmd, shell=True)
 
     if newmode:
         os.chmod(file, origmode)
@@ -747,8 +744,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
-        ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, path))
+        ret, result = commands.getstatusoutput("file '%s'" % path)
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.7.10.4



