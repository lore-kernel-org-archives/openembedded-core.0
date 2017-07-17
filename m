Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D12C077BD9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467486"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:10 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:12 -0500
Message-Id: <af81171508625c84610921017cb372a29e0738a3.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 04/30] bb/server/process: Handle EINTR on idle_commands select
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If a signal is sent like SIGWINCH the select could be interrupted
so ignore the InterruptError like in XMLRPC server [1].

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/bitbake/lib/bb/server/xmlrpc.py#n307

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 bitbake/lib/bb/server/process.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/server/process.py b/bitbake/lib/bb/server/process.py
index f8d67678558..a8ba4681c64 100644
--- a/bitbake/lib/bb/server/process.py
+++ b/bitbake/lib/bb/server/process.py
@@ -186,7 +186,12 @@ class ProcessServer(Process, BaseImplServer):
             nextsleep = self.next_heartbeat - now
 
         if nextsleep is not None:
-            select.select(fds,[],[],nextsleep)
+            try:
+                select.select(fds,[],[],nextsleep)
+            except InterruptedError:
+                # ignore EINTR error, nextsleep only used for wait
+                # certain time
+                pass
 
     def runCommand(self, command):
         """
-- 
2.11.0


