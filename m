Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKAwC-0006ju-0y for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 18:12:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PH4jK4023888 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 17:04:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id s3MHOHrtkykF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 17:04:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PH4dEh023883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 17:04:42 GMT
Message-ID: <1364230487.3097.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 16:54:47 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: package.bbclass: Handle subprocess errors correctly
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
X-List-Received-Date: Mon, 25 Mar 2013 17:12:04 -0000
X-List-Received-Date: Mon, 25 Mar 2013 17:12:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If an error occurs in subprocess.call() we currently don't catch it. In particular
we have issues where debugedit is segfaulting unnoticed. This fixes up
various code paths to catch the errors.

[YOCTO #4089]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b6f8767..958f616 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -254,14 +254,23 @@ def splitdebuginfo(file, debugfile, debugsrcdir, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        subprocess.call("'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file), shell=True)
+        cmd = "'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file)
+        retval = subprocess.call(cmd, shell=True)
+        if retval:
+            bb.fatal("debugedit failed with exit code %s (cmd was %s)" % (retval, cmd))
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
-    subprocess.call("'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile), shell=True)
+    cmd = "'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile)
+    retval = subprocess.call(cmd, shell=True)
+    if retval:
+        bb.fatal("objcopy failed with exit code %s (cmd was %s)" % (retval, cmd))
 
     # Set the debuglink to have the view of the file path on the target
-    subprocess.call("'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file), shell=True)
+    cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
+    retval = subprocess.call(cmd, shell=True)
+    if retval:
+        bb.fatal("objcopy failed with exit code %s (cmd was %s)" % (retval, cmd))
 
     if newmode:
         os.chmod(file, origmode)
@@ -298,10 +307,17 @@ def copydebugsources(debugsrcdir, d):
         processdebugsrc += "fgrep -z '%s' | "
         processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
 
-        subprocess.call(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir), shell=True)
+        cmd = processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir)
+        retval = subprocess.call(cmd, shell=True)
+        if retval:
+            bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
+
 
         # The copy by cpio may have resulted in some empty directories!  Remove these
-        subprocess.call("find %s%s -empty -type d -delete" % (dvar, debugsrcdir), shell=True)
+        cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
+        retval = subprocess.call(cmd, shell=True)
+        if retval:
+            bb.fatal("empty directory removal failed with exit code %s (cmd was %s)" % (retval, cmd))
 
         # Also remove debugsrcdir if its empty
         for p in nosuchdir[::-1]:
@@ -431,7 +447,10 @@ python perform_packagecopy () {
     # Start by package population by taking a copy of the installed
     # files to operate on
     # Preserve sparse files and hard links
-    subprocess.call('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar), shell=True)
+    cmd = 'tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar)
+    retval = subprocess.call(cmd, shell=True)
+    if retval:
+        bb.fatal("file copy failed with exit code %s (cmd was %s)" % (retval, cmd))
 
     # replace RPATHs for the nativesdk binaries, to make them relocatable
     if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d):




