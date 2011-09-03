Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qze23-00005l-8E
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 02:24:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2011 17:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,321,1312182000"; d="scan'208";a="48351285"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.9])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2011 17:19:24 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:19:17 -0700
Message-Id: <b53adc180f983f025811d52bde2d7918385f182a.1315008793.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315008793.git.josh@linux.intel.com>
References: <cover.1315008793.git.josh@linux.intel.com>
In-Reply-To: <cover.1315008793.git.josh@linux.intel.com>
References: <cover.1315008793.git.josh@linux.intel.com>
Subject: [PATCH 1/2] scripts/hob: update to match recent hob changes
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
X-List-Received-Date: Sat, 03 Sep 2011 00:24:23 -0000

hob now uses both a pre and post file, update the wrapper script to generate
and use both of these.

Addresses [YOCTO #1281]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 scripts/hob |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/hob b/scripts/hob
index 19930ba..bb88a76 100755
--- a/scripts/hob
+++ b/scripts/hob
@@ -1,18 +1,28 @@
 #!/usr/bin/env bash
-if ! (test -r "$BUILDDIR/conf/hob.local.conf"); then
+if ! (test -r "$BUILDDIR/conf/hob-pre.conf"); then
     cat <<EOM
-You had no conf/hob.local.conf file. An initial version of this configuration
-file has therefore been created for you. This file will be used to store any
+You had no conf/hob-pre.conf file. An initial version of this configuration
+file has therefore been created for you. This file will be used to store
+configuration values you set in hob.
+
+EOM
+touch conf/hob-pre.conf
+fi
+
+if ! (test -r "$BUILDDIR/conf/hob-post.conf"); then
+    cat <<EOM
+You had no conf/hob-post.conf file. An initial version of this configuration
+file has therefore been created for you. This file will be used to store
 configuration values you set in hob.
 
 EOM
 (cat <<EOF
 INHERIT += "image_types"
 EOF
-) > conf/hob.local.conf
+) > conf/hob-post.conf
 fi
 
-bitbake -R conf/hob.local.conf -t xmlrpc -u hob
+bitbake -r conf/hob-pre.conf -R conf/hob-post.conf -u hob
 
 ret=$?
 exit $ret
-- 
1.7.6



