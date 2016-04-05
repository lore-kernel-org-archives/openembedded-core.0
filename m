Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09CD1731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 00:11:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2016 17:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,442,1455004800"; d="scan'208";a="925407312"
Received: from anandsan-mobl.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.254.19.102])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2016 17:12:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  4 Apr 2016 17:11:56 -0700
Message-Id: <1459815116-5236-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] runqemu-gen-tapdevs: Add note about NetworkManager & tap devices
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
X-List-Received-Date: Tue, 05 Apr 2016 00:12:01 -0000

NetworkManager can clobber tap devices if left alone, this gives a
note about how to set tap* as unmanaged

[YOCTO #8587]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu-gen-tapdevs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index d3b27be..624deac 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -85,6 +85,15 @@ for ((index=0; index < $COUNT; index++)); do
 	fi
 done
 
+if [ $COUNT -gt 0 ]; then
+	echo "Note: For systems running NetworkManager, it's recommended"
+	echo "Note: that the tap devices be set as unmanaged in the"
+	echo "Note: NetworkManager.conf file. Add the following lines to"
+	echo "Note: /etc/NetworkManager/NetworkManager.conf"
+	echo "[keyfile]"
+	echo "unmanaged-devices=interface-name:tap*"
+fi
+
 # The runqemu script will check for this file, and if it exists,
 # will use the existing bank of tap devices without creating
 # additional ones via sudo.
-- 
2.5.0


