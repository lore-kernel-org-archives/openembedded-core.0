Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qze23-00005l-V5
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 02:24:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2011 17:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,321,1312182000"; d="scan'208";a="48351286"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.9])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2011 17:19:24 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:19:18 -0700
Message-Id: <174de23258fce7cbf17b12d75ca6bc300206c12e.1315008793.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315008793.git.josh@linux.intel.com>
References: <cover.1315008793.git.josh@linux.intel.com>
In-Reply-To: <cover.1315008793.git.josh@linux.intel.com>
References: <cover.1315008793.git.josh@linux.intel.com>
Subject: [PATCH 2/2] scripts/hob: notify the user when the GUI won't launch immediately
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
X-List-Received-Date: Sat, 03 Sep 2011 00:24:24 -0000

If the wrapper script needs to build pseudo before we can launch hob we need
to notify the user so they aren't shocked by the action of launching a GUI
and seeing a bunch of text whiz by on the console.

Fixes [YOCTO #1435]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 scripts/hob |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/hob b/scripts/hob
index bb88a76..480413b 100755
--- a/scripts/hob
+++ b/scripts/hob
@@ -22,6 +22,11 @@ EOF
 ) > conf/hob-post.conf
 fi
 
+# Users don't like to launch GUI's and see a bunch of text whiz by, notify them
+if [ ! -e "$BUILDDIR/pseudodone" ]; then
+    echo "Before we can launch the GUI we need to build some native tools required for running"
+fi
+
 bitbake -r conf/hob-pre.conf -R conf/hob-post.conf -u hob
 
 ret=$?
-- 
1.7.6



