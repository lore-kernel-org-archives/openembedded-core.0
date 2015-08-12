Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED0C73D64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 22:14:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 15:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,664,1432623600"; d="scan'208";a="540760405"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 15:14:15 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 14:05:54 +0000
Message-Id: <a6eb4a696d4ce710ede1f6f0772d79681448b7a0.1439387979.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 4/6] qemurunner.py: Performance improvements in run_serial
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
X-List-Received-Date: Wed, 12 Aug 2015 22:14:15 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This allow to search for the prompt after a command is
run so it can avoid waiting for the timeout.

Also corrected identation issues

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 3e604d8..0458447 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -284,14 +284,18 @@ class QemuRunner:
         stopread = False
         endtime = time.time()+5
         while time.time()<endtime and not stopread:
-                sread, _, _ = select.select([self.server_socket],[],[],5)
-                for sock in sread:
-                        answer = sock.recv(1024)
-                        if answer:
-                                data += answer
-                        else:
-                                sock.close()
-                                stopread = True
+            sread, _, _ = select.select([self.server_socket],[],[],5)
+            for sock in sread:
+                answer = sock.recv(1024)
+                if answer:
+                    data += answer
+                    # Search the prompt to stop
+                    if re.search("[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
+                        stopread = True
+                        break
+                else:
+                    sock.close()
+                    stopread = True
         if data:
             if raw:
                 status = 1
-- 
1.8.4.5


