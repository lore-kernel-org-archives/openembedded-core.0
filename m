Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UW1lW-0004cL-Rv
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 11:50:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3R9WB8g013296
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 02:32:11 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sat, 27 Apr 2013 02:32:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Apr 2013 05:32:07 -0400
Message-ID: <f54053a84055f76966843b0b390ad0873a39d3c6.1367050625.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367050625.git.liezhi.yang@windriver.com>
References: <cover.1367050625.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: make hard links for staging files
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
X-List-Received-Date: Sat, 27 Apr 2013 09:50:08 -0000
Content-Type: text/plain

Make hard links for staging files instead of copy to save the disk space
(3G will be saved for a core-image-sato build), and it doesn't affect
much on the build time.

The following directories are affected:
1) The sysroot
2) The DEPLOY_DIR
3) The pkgdata

[YOCTO #4372]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass |    2 +-
 meta/lib/oe/path.py         |    9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 67ddc46..0358d14 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -198,7 +198,7 @@ def sstate_install(ss, d):
     # Run the actual file install
     for state in ss['dirs']:
         if os.path.exists(state[1]):
-            oe.path.copytree(state[1], state[2])
+            oe.path.copyhardlinktree(state[1], state[2])
 
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
         bb.build.exec_func(postinst, d)
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index faa0f61..4f8b66c 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -85,13 +85,18 @@ def copytree(src, dst):
     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def copyhardlinktree(src, dst):
+    """ Make the hard link when possible, otherwise copy. """
     bb.utils.mkdirhier(dst)
+    src_bak = src
     if os.path.isdir(src):
         if not len(os.listdir(src)):
             return	
         src = src + "/*"
-    cmd = 'cp -al %s %s' % (src, dst)
-    check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+    if (os.stat(src_bak).st_dev ==  os.stat(dst).st_dev):
+        cmd = 'cp -afl %s %s' % (src, dst)
+        check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+    else:
+        copytree(src_bak, dst)
 
 def remove(path, recurse=True):
     """Equivalent to rm -f or rm -rf"""
-- 
1.7.10.4



