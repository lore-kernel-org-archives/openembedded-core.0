Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA7174A35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 17:42:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id 96so438829wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=twqqlOwGNUHyNH/dsoB013j2RXvRy+Jcg3Npt81l+MI=;
	b=BjYUWPxYfYnRoa0Fm8IActN+E5cSkhvIZ+p38d2WoEQ9pSCv0SPGFq1LUIG+t9a+hV
	u4PpJFU2Y3Sgl5IQMkQriB4+l8hxTImdHjauXYCz4UdYKtoUwkbmhuorRBRAtKsOwUT5
	MzT/4Vfw4FK1vutIKFUMcesYON6EcQnhYHT7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=twqqlOwGNUHyNH/dsoB013j2RXvRy+Jcg3Npt81l+MI=;
	b=B+mghFhCqoWT6rfCFpcDIV+WFXpct2MfLkWKBDlzZzqY71Wi28RDqRS6s2AlP/f6lC
	OuElvtcdcb+zB7HMWgcmm4cC827MhFtenCP00Rq86ghhXmeMjTOaBZWdvWjk4jMMdJiO
	pgqvohgkLu3a1+kXjBa32g2ZDw+hmoZZRFb096dVMGap+OrvJAIhYhlT+NJb8YCG6lJ/
	9UvpDEudCfU+gcN2wfyhjgPcGiaRd5Nka5ZkZ5HZMUMOH/slXnY6Ew7Uw2KuqGaqljX5
	IoP2O6vTzM/h0XCETE50FoMqdZZaVuNIzGAcSVt3X1XbfAVfL8iowVpWC40gNwQlfO8c
	7wJQ==
X-Gm-Message-State: AJcUukf8tXa7l13ryqFpNnP/Zx3z+8rYgib9kt2gJ9cUNe6d6IHkctw3
	fSl5mdHUApRhZ/9DASLi4LSYfLyyI14=
X-Google-Smtp-Source: ALg8bN64ksPhLDUq+lhxMB39d3tlN0E/8A1XH90W+NVQogOgM7ptkHQIQ9jfdKood9gDMiYL3vn9Qg==
X-Received: by 2002:a05:6000:108d:: with SMTP id
	y13mr29812841wrw.135.1548870147486; 
	Wed, 30 Jan 2019 09:42:27 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u10sm2308751wrr.33.2019.01.30.09.42.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:42:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 17:42:25 +0000
Message-Id: <20190130174225.22044-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] package: Rework debug source file handling
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
X-List-Received-Date: Wed, 30 Jan 2019 17:42:27 -0000
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
 meta/classes/package.bbclass | 48 +++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dd1b09a874..6a06b357b7e 100644
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
2.19.1


