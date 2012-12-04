Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1Tfq9q-0002PR-5O
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 11:55:22 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qB4AeuFE007893;
	Tue, 4 Dec 2012 04:40:57 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 15:40:59 +0500
Message-Id: <1354617659-30238-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] qa.py: Toolchain path should not be hardcoded to execute objdump
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
X-List-Received-Date: Tue, 04 Dec 2012 10:55:22 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Currently objdump command is invoked from the STAGING_BINDIR_TOOLCHAIN
directory. In case of external toolchain if this directory doesn't
exist then objdump fails to execute. Instead of hardcoding the path
it should search PATH to find it.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/lib/oe/qa.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 2c51141..d9848c8 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -97,14 +97,14 @@ class ELFFile:
             return self.objdump_output[cmd]
 
         objdump = d.getVar('OBJDUMP', True)
-        staging_dir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
 
         env = os.environ.copy()
         env["LC_ALL"] = "C"
+        env["PATH"] = d.getVar('PATH', True)
 
         try:
             bb.note("%s %s %s" % (objdump, cmd, self.name))
-            self.objdump_output[cmd] = bb.process.run([ os.path.join(staging_dir, objdump), cmd, self.name ], env=env, shell=False)[0]
+            self.objdump_output[cmd] = bb.process.run([objdump, cmd, self.name], env=env, shell=False)[0]
             return self.objdump_output[cmd]
         except Exception, e:
             bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
-- 
1.7.9.5



