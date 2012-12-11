Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TiTtT-0000xK-5m
	for Openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 18:45:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Dec 2012 09:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,260,1355126400"; d="scan'208";a="179492583"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Dec 2012 09:28:47 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, daniel@fooishbar.org,
	martin.jansa@gmail.com, richard.purdie@linuxfoundation.org
Date: Tue, 11 Dec 2012 09:28:03 -0800
Message-Id: <c821b739192090a224f7293426f1fe3eb063834d.1355246231.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1355246231.git.nitin.a.kamble@intel.com>
References: <cover.1355246231.git.nitin.a.kamble@intel.com>
Subject: [Patch v2 1/1] create-pull-request: detect trailing white space
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
X-List-Received-Date: Tue, 11 Dec 2012 17:45:24 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Add logic in the create-pull-request to detect and warn about the
trailing white space inserted by patches.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 scripts/create-pull-request |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 9a8913d..9692bf1 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -229,3 +229,11 @@ Review their content, especially the summary mail:
 When you are satisfied, you can send them with:
     send-pull-request -a -p $ODIR
 EOM
+
+# Check the patches for trailing white space
+egrep -q -e "^\+.*\s+$" $ODIR/*
+if [ $? -ne 1 ]; then
+	echo
+	echo "WARNING: Trailing white space detected at these locations"
+	egrep -nH --color -e "^\+.*\s+$" $ODIR/*
+fi
-- 
1.7.3.4



