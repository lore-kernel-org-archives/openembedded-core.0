Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhj0-0007kM-H8
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgdA005214; Tue, 7 May 2013 13:58:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jYGx-AbgE22c; Tue,  7 May 2013 13:58:43 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwcWt005187
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:39 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRG-0005bu-Hm; Tue, 07 May 2013 13:56:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:55:57 +0100
Message-Id: <1367931368-21504-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/15] classes/lib: Update to use print as a function call
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

In python 3 print is a function call. In some cases bb.note is a more
appropriate call to make.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass |    7 ++++---
 meta/classes/sstate.bbclass |    6 +++---
 meta/lib/oe/path.py         |    2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 766e97e..d4a8f5e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -367,15 +367,16 @@ def check_sanity(sanity_data):
     try:
         from distutils.version import LooseVersion
     except ImportError:
-        def LooseVersion(v): print "WARNING: sanity.bbclass can't compare versions without python-distutils"; return 1
-    import commands
+        def LooseVersion(v):
+            print("WARNING: sanity.bbclass can't compare versions without python-distutils")
+            return 1
 
     # Check the bitbake version meets minimum requirements
     minversion = sanity_data.getVar('BB_MIN_VERSION', True)
     if not minversion:
         # Hack: BB_MIN_VERSION hasn't been parsed yet so return 
         # and wait for the next call
-        print "Foo %s" % minversion
+        print("Foo %s" % minversion)
         return
 
     if 0 == os.getuid():
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 77ec402..9a76a6b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -261,7 +261,7 @@ def sstate_installpkg(ss, d):
         # Add sstateinst to each filename in fixmepath, use xargs to efficiently call sed
         sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" % (sstateinst, fixmefn, sstate_sed_cmd)
 
-        print "Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd)
+        bb.note("Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd))
         subprocess.call(sstate_hardcode_cmd, shell=True)
 
         # Need to remove this or we'd copy it into the target directory and may 
@@ -408,14 +408,14 @@ def sstate_hardcode_path(d):
     # This has the side effect of making sure the vfs cache is hot
     sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, xargs_no_empty_run_cmd, sstate_sed_cmd)
 
-    print "Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd)
+    bb.note("Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd))
     subprocess.call(sstate_hardcode_cmd, shell=True)
 
         # If the fixmefn is empty, remove it..
     if os.stat(fixmefn).st_size == 0:
         os.remove(fixmefn)
     else:
-        print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd)
+        bb.note("Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd))
         subprocess.call(sstate_filelist_relative_cmd, shell=True)
 
 def sstate_package(ss, d):
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index d8eb802..da044ba 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -55,7 +55,7 @@ def make_relative_symlink(path):
         depth += 1
 
     if not ancestor:
-        print "make_relative_symlink() Error: unable to find the common ancestor of %s and its target" % path
+        print("make_relative_symlink() Error: unable to find the common ancestor of %s and its target" % path)
         return
 
     base = link.partition(ancestor)[2].strip('/')
-- 
1.7.10.4



