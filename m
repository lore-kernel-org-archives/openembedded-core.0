Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 201146F730
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 18:33:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Mar 2014 11:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,671,1389772800"; d="scan'208";a="500525322"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.240])
	by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2014 11:33:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 11:33:02 -0700
Message-Id: <1395081182-21903-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] openssh: Update init file to add ED25519 Key generation
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
X-List-Received-Date: Mon, 17 Mar 2014 18:33:44 -0000

[YOCTO #5983]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh/init | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index e7f3971..37c8e7b 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -20,6 +20,7 @@ mkdir -p $SYSCONFDIR
 HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
 HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
 HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
+HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
 
 check_for_no_start() {
     # forget it if we're trying to start, and /etc/ssh/sshd_not_to_be_run exists
@@ -51,10 +52,14 @@ check_keys() {
 		echo "  generating ssh ECDSA key..."
 		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
 	fi
-	if [ ! -f /etc/ssh/ssh_host_dsa_key ]; then
+	if [ ! -f $HOST_KEY_DSA ]; then
 		echo "  generating ssh DSA key..."
 		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
 	fi
+	if [ ! -f $HOST_KEY_ED25519 ]; then
+		echo "  generating ssh ED25519 key..."
+		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
+	fi
 }
 
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
-- 
1.8.3.1


