Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Ycd-0002FG-Be
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:26:46 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE662q007211; Wed, 30 Jan 2013 14:06:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qL2AD2HHqUs4; Wed, 30 Jan 2013 14:06:07 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE62Ii007173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:03 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDy-000834-4o; Wed, 30 Jan 2013 14:01:14 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:00:58 +0000
Message-Id: <a01e2cc12bb2cdd316aafe59315a8b75d543a829.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/17] package: Rename splitfile functions to something more descriptive
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
X-List-Received-Date: Wed, 30 Jan 2013 14:42:15 -0000

The splitfile and splitfile2 function names are confusing and the comments
are also misleading, hard to understand or plain incorrect. This tries to
improve things.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 71c6179..0be84ed 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -223,13 +223,12 @@ python () {
         d.setVar("PACKAGERDEPTASK", "")
 }
 
-def splitfile(file, debugfile, debugsrcdir, d):
-    # Function to split a single file, called from split_and_strip_files below
-    # A working 'file' (one which works on the target architecture)
-    # is split and the split off portions go to debugfile.
+def splitdebuginfo(file, debugfile, debugsrcdir, d):
+    # Function to split a single file into two components, one is the stripped
+    # target system binary, the other contains any debugging information. The
+    # two files are linked to reference each other.
     #
-    # The debug information is then processed for src references.  These
-    # references are copied to debugsrcdir, if defined.
+    # sourcefile is also generated containing a list of debugsources
 
     import commands, stat, subprocess
 
@@ -267,10 +266,8 @@ def splitfile(file, debugfile, debugsrcdir, d):
 
     return 0
 
-def splitfile2(debugsrcdir, d):
-    # Function to split a single file, called from split_and_strip_files below
-    #
-    # The debug src information processed in the splitfile2 is further procecessed
+def copydebugsources(debugsrcdir, d):
+    # The debug src information written out to sourcefile is further procecessed
     # and copied to the destination here.
 
     import commands, stat, subprocess
@@ -875,7 +872,7 @@ python split_and_strip_files () {
                 bb.mkdirhier(os.path.dirname(fpath))
                 #bb.note("Split %s -> %s" % (file, fpath))
                 # Only store off the hard link reference if we successfully split!
-                if splitfile(file, fpath, debugsrcdir, d) == 0 and file_reference != "":
+                if splitdebuginfo(file, fpath, debugsrcdir, d) == 0 and file_reference != "":
                     file_links[file_reference] = file
 
         # The above may have generated dangling symlinks, remove them!
@@ -899,7 +896,7 @@ python split_and_strip_files () {
 
         # Process the debugsrcdir if requested...
         # This copies and places the referenced sources for later debugging...
-        splitfile2(debugsrcdir, d)
+        copydebugsources(debugsrcdir, d)
     #
     # End of debug splitting
     #
-- 
1.7.10.4



