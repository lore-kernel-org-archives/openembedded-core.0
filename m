Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMlzB-0007vS-Kp
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 21:00:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 May 2011 11:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; d="scan'208";a="438534700"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2011 11:57:41 -0700
Message-Id: <acb069f6d1606913110f0829a4d8f738395d3baa.1305745000.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305745000.git.sgw@linux.intel.com>
References: <cover.1305745000.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 21:43:42 -0700
Date: Wed, 18 May 2011 11:57:41 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/1] utils.bbclass: modify create_wrapper to correctly follow symlinks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 19:00:46 -0000

From: Saul Wold <sgw@linux.intel.com>

This ensures you look up the symbolic link to get the full path

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/utils.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 6bcaf86..1965d2f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -312,7 +312,8 @@ create_wrapper () {
    cmdname=`basename $cmd`.real
    cat <<END >$cmd
 #!/bin/sh
-exec env $@ \`dirname \$0\`/$cmdname "\$@"
+realpath=\`readlink -fn \$0\`
+exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
 END
    chmod +x $cmd
 }
-- 
1.7.3.4



