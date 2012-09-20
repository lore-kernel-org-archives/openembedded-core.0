Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEhJY-0004Kn-0g
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 16:01:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2012 06:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="208702986"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2012 06:48:15 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 16:48:03 +0300
Message-Id: <c8246ddf0b655c78db754468ef22fe288b51a887.1348148406.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 6/6] SDK: allow toolchain installation from another directory
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
X-List-Received-Date: Thu, 20 Sep 2012 14:01:12 -0000

This patch will allow one to run the installer from another directory
than the one where it's actually located.

Suppose the installer is in /home/user/test/my/sdk and the current
directory is in a different place. With this patch, one can run the
installer like this:

$ sh ~/test/my/sdk/poky-eglibc-x86_64-arm-toolchain-gmae-1.2+snapshot-20120920.sh

[YOCTO #3135]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 52bae53..9f51562 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -150,10 +150,10 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-payload_offset=$(($(grep -na -m1 "^MARKER:$" $(basename $0)|cut -d':' -f1) + 1))
+payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 echo -n "Extracting SDK..."
-tail -n +$payload_offset $(basename $0) | tar xj --strip-components=4 -C $target_sdk_dir
+tail -n +$payload_offset $0| tar xj --strip-components=4 -C $target_sdk_dir
 echo "done"
 
 echo -n "Setting it up..."
-- 
1.7.9.5



