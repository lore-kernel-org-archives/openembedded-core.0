Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhj3-0007kg-Qn
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgQ7005212; Tue, 7 May 2013 13:58:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hLlQE0O2wTXr; Tue,  7 May 2013 13:58:51 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CweRY005195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:41 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRI-0005cc-AN; Tue, 07 May 2013 13:56:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:56:05 +0100
Message-Id: <1367931368-21504-13-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/15] sanity/patch.py: Remove commands module usage
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
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000

The commands module is removed in python3. Use the subprocess module instead
and the pipes module to replace the mkargs usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass |    6 +++---
 meta/lib/oe/patch.py        |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 63ea079..3836c04 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -342,13 +342,13 @@ def check_gcc_march(sanity_data):
         f = open("gcc_test.c", "w")
         f.write("int main (){ __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4; return 0;}\n")
         f.close()
-        import commands
+        import subprocess
 
         # Check if GCC could work without march
-        status,result = commands.getstatusoutput("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test")
+        status,result = subprocess.getstatusoutput("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test")
         if status != 0:
             # Check if GCC could work with march
-            status,result = commands.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
+            status,result = subprocess.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
             if status == 0: 
                 result = True
             else:
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index cbc5cd9..8de73a7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -17,7 +17,7 @@ class CmdError(bb.BBHandledException):
 
 
 def runcmd(args, dir = None):
-    import commands
+    import subprocess, pipes
 
     if dir:
         olddir = os.path.abspath(os.curdir)
@@ -27,10 +27,10 @@ def runcmd(args, dir = None):
         # print("cwd: %s -> %s" % (olddir, dir))
 
     try:
-        args = [ commands.mkarg(str(arg)) for arg in args ]
+        args = [ pipes.quote(str(arg)) for arg in args ]
         cmd = " ".join(args)
         # print("cmd: %s" % cmd)
-        (exitstatus, output) = commands.getstatusoutput(cmd)
+        (exitstatus, output) = subprocess.getstatusoutput(cmd)
         if exitstatus != 0:
             raise CmdError(exitstatus >> 8, output)
         return output
-- 
1.7.10.4



