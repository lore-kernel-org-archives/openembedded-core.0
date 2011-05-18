Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMlSD-0007Co-J7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 20:26:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 11:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="4136803"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2011 11:23:45 -0700
Message-Id: <c27fb95384b158cf4829fcee742d05916395236a.1305742944.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305742944.git.sgw@linux.intel.com>
References: <cover.1305742944.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 21:43:42 -0700
Date: Wed, 18 May 2011 11:23:45 -0700
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
X-List-Received-Date: Wed, 18 May 2011 18:26:41 -0000

From: Saul Wold <sgw@linux.intel.com>

This ensures you look up the symbolic link to get the full path

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/utils.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 6bcaf86..a789d41 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -312,7 +312,8 @@ create_wrapper () {
    cmdname=`basename $cmd`.real
    cat <<END >$cmd
 #!/bin/sh
-exec env $@ \`dirname \$0\`/$cmdname "\$@"
+realpath=`readlink -fn \$0`
+exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
 END
    chmod +x $cmd
 }
-- 
1.7.3.4



