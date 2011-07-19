Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3R-0001ds-0V
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396921"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:52 -0700
Message-Id: <9355999b8d7e8f344282426b2399110e0a3e7353.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/22] scripts/hob: wrapper script to run hob gui with a UI specific config file
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:45 -0000

From: Joshua Lock <josh@linux.intel.com>

This ensures any configuration changes made in the GUI are only set when
using hob.
The default hob.local.conf is generated with a line which adds image_types
to INHERITS so that the GUI can introspect the available FSTYPES.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 scripts/hob |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100755 scripts/hob

diff --git a/scripts/hob b/scripts/hob
new file mode 100755
index 0000000..19930ba
--- /dev/null
+++ b/scripts/hob
@@ -0,0 +1,18 @@
+#!/usr/bin/env bash
+if ! (test -r "$BUILDDIR/conf/hob.local.conf"); then
+    cat <<EOM
+You had no conf/hob.local.conf file. An initial version of this configuration
+file has therefore been created for you. This file will be used to store any
+configuration values you set in hob.
+
+EOM
+(cat <<EOF
+INHERIT += "image_types"
+EOF
+) > conf/hob.local.conf
+fi
+
+bitbake -R conf/hob.local.conf -t xmlrpc -u hob
+
+ret=$?
+exit $ret
-- 
1.7.3.4



