Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5C771A7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 23:00:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 16 Nov 2016 15:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="902265466"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2016 15:00:34 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 17:05:35 -0600
Message-Id: <3e206a322b8536c7a21a3dfc59003075d4102b66.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/3] buildstats: Place 'Elapsed Time' stat into a single line
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
X-List-Received-Date: Wed, 16 Nov 2016 23:00:33 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

All lines except one (the one containing the 'Elapsed Time') follows the format
'stat: value'. Fix that so post parsing the stats is simpler.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/buildstats.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 599a219..57ecc8f 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -80,8 +80,8 @@ def write_task_data(status, logfile, e, d):
     with open(os.path.join(logfile), "a") as f:
         elapsedtime = get_timedata("__timedata_task", d, e.time)
         if elapsedtime:
-            f.write(d.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
-                                    (e.task, elapsedtime)))
+            f.write(d.expand("${PF}: %s\n" % e.task))
+            f.write(d.expand("Elapsed time: %0.2f seconds\n" % elapsedtime))
             cpu, iostats, resources, childres = get_process_cputime(os.getpid())
             if cpu:
                 f.write("utime: %s\n" % cpu['utime'])
-- 
2.1.4


