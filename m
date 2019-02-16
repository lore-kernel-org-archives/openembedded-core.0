Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB096B180
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:46:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id x7so13427577wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nRkJ8dsOeq3R+7heP39DSYkqPvvBMNZ7UwBQlzsK4d0=;
	b=Brt0TOd/dP47dbAanJYQjbK+QOaLw1otlHLvG43XwXN4uNoKdagNE9Lrqi3M4Rmr10
	764ZVPzaedjISrzkP/b2TWzvbaqMhBQzcOakzbJ6Ngnc1irkLqCOBMagD+fq+qKKrpLT
	ykOK5m8qvIKkz/1MxrzBCHg2prC9p5Ha6/ODo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nRkJ8dsOeq3R+7heP39DSYkqPvvBMNZ7UwBQlzsK4d0=;
	b=anF6FeU8ZLdxXLI+IBl4R4fg9orkT0yMlgtB5S34SdSWvJMInTAGcUb9pQUPgSKoNX
	xg/HSMh3lOs/nC8biQ+94vI6OMQeuOjlXmb9/LRAZYOyQpHL8+nZmjx3kX43OPtwUNUm
	4UqEz6RcahKtj/kVhs1Abq4vGxzEhzmjsw5ap/tor2FBC4YWEGXLVYAJJAh6/KJWPpID
	UVCGSEIU5k/vNWnDl/Z6zQBZP5BWnP+txhG4rm5r3Ukjf4YRMUbHvtOtM2zClESnaF9d
	0uXJyo0bjZeAnjMTy2CkWLsMWX+QX+k5K9i9IDSxlsJuKlYNV7KAH6x373ecQ3tyrImw
	PsOQ==
X-Gm-Message-State: AHQUAuZd+ToYt6HDxuXcABup8nx8XRdxMiDGrhhArVtTyCbRzLq1GQ6G
	heQxE7c4hG9s1f/CbDnpjQCfaEmH9Qo=
X-Google-Smtp-Source: AHgI3IYSBSetWtkobL/B++dt6pwC2xqgPr/pHpIXg/CE7lcmQnwdXLdC/v01qOwmvXIXK1/keTzJ2Q==
X-Received: by 2002:a1c:a98b:: with SMTP id
	s133mr10352602wme.129.1550353601513; 
	Sat, 16 Feb 2019 13:46:41 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm7147773wmk.9.2019.02.16.13.46.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Feb 2019 13:46:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:46:32 +0000
Message-Id: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/7] package: Rework debug source file handling
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
X-List-Received-Date: Sat, 16 Feb 2019 21:46:41 -0000
Content-Transfer-Encoding: 8bit

Currently we parallel process the files we install running dwarfsrcfiles over
each one in parallel threads but requiring a lock to write the results to one
file. This is not ideal for performance and means we can't then use per file
data for other purposes such as source code license processing.

Rework the code so that the list of source files is generated per installed
file and is reusable.

The code still generates a null separated debugsources.list file since this
is used by a shell pipeline but it no longer needs locking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 50 +++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dd1b09a874..749c7d9ea14 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -344,7 +344,7 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
 
     return debugfiles.keys()
 
-def append_source_info(file, sourcefile, d, fatal=True):
+def source_info(file, d, fatal=True):
     import subprocess
 
     cmd = ["dwarfsrcfiles", file]
@@ -363,22 +363,15 @@ def append_source_info(file, sourcefile, d, fatal=True):
         bb.note(msg)
 
     debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
-    # filenames are null-separated - this is an artefact of the previous use
-    # of rpm's debugedit, which was writing them out that way, and the code elsewhere
-    # is still assuming that.
-    debuglistoutput = '\0'.join(debugsources) + '\0'
-    lf = bb.utils.lockfile(sourcefile + ".lock")
-    with open(sourcefile, 'a') as sf:
-        sf.write(debuglistoutput)
-    bb.utils.unlockfile(lf)
 
+    return list(debugsources)
 
-def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir, sourcefile, d):
+def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
     # two files are linked to reference each other.
     #
-    # sourcefile is also generated containing a list of debugsources
+    # return a mapping of files:debugsources
 
     import stat
     import subprocess
@@ -386,6 +379,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     src = file[len(dvar):]
     dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
     debugfile = dvar + dest
+    sources = []
 
     # Split the file...
     bb.utils.mkdirhier(os.path.dirname(debugfile))
@@ -397,7 +391,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
 
     # We ignore kernel modules, we don't generate debug info files.
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
-        return 1
+        return (file, sources)
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -407,7 +401,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        append_source_info(file, sourcefile, d)
+        sources = source_info(file, d)
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
@@ -419,17 +413,26 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     if newmode:
         os.chmod(file, origmode)
 
-    return 0
+    return (file, sources)
 
-def copydebugsources(debugsrcdir, d):
+def copydebugsources(debugsrcdir, sources, d):
     # The debug src information written out to sourcefile is further processed
     # and copied to the destination here.
 
     import stat
     import subprocess
 
-    sourcefile = d.expand("${WORKDIR}/debugsources.list")
-    if debugsrcdir and os.path.isfile(sourcefile):
+    if debugsrcdir and sources:
+        sourcefile = d.expand("${WORKDIR}/debugsources.list")
+        bb.utils.remove(sourcefile)
+
+        # filenames are null-separated - this is an artefact of the previous use
+        # of rpm's debugedit, which was writing them out that way, and the code elsewhere
+        # is still assuming that.
+        debuglistoutput = '\0'.join(sources) + '\0'
+        with open(sourcefile, 'a') as sf:
+           sf.write(debuglistoutput)
+
         dvar = d.getVar('PKGD')
         strip = d.getVar("STRIP")
         objcopy = d.getVar("OBJCOPY")
@@ -933,9 +936,6 @@ python split_and_strip_files () {
         debuglibdir = ""
         debugsrcdir = "/usr/src/debug"
 
-    sourcefile = d.expand("${WORKDIR}/debugsources.list")
-    bb.utils.remove(sourcefile)
-
     #
     # First lets figure out all of the files we may have to process ... do this only once!
     #
@@ -1040,11 +1040,15 @@ python split_and_strip_files () {
     # First lets process debug splitting
     #
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
-        oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, sourcefile, d))
+        results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
 
         if debugsrcdir and not targetos.startswith("mingw"):
             for file in staticlibs:
-                append_source_info(file, sourcefile, d, fatal=False)
+                results.extend(source_info(file, d, fatal=False))
+
+        sources = set()
+        for r in results:
+            sources.update(r[1])
 
         # Hardlink our debug symbols to the other hardlink copies
         for ref in inodes:
@@ -1092,7 +1096,7 @@ python split_and_strip_files () {
 
         # Process the debugsrcdir if requested...
         # This copies and places the referenced sources for later debugging...
-        copydebugsources(debugsrcdir, d)
+        copydebugsources(debugsrcdir, sources, d)
     #
     # End of debug splitting
     #
-- 
2.20.1


