Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE24A77003
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 12:53:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2015 05:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="816296207"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2015 05:53:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 15:53:16 +0300
Message-Id: <1443617598-30123-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443617598-30123-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1443617598-30123-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/4] openssh: fix sshd key generation when systemd is in use and rootfs is readonly
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
X-List-Received-Date: Wed, 30 Sep 2015 12:53:06 -0000

[YOCTO #8365]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../openssh/openssh/sshd@.service                   |  4 +++-
 .../openssh/openssh/sshdgenkeys.service             | 21 ++++++++++++++++-----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
index bb2d68e..9d83dfb 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
@@ -4,7 +4,9 @@ Wants=sshdgenkeys.service
 After=sshdgenkeys.service
 
 [Service]
-ExecStart=-@SBINDIR@/sshd -i
+Environment="SSHD_OPTS="
+EnvironmentFile=-/etc/default/ssh
+ExecStart=-@SBINDIR@/sshd -i $SSHD_OPTS
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 StandardInput=socket
 StandardError=syslog
diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index d65086f..148e6ad 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -1,11 +1,22 @@
 [Unit]
 Description=OpenSSH Key Generation
-ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
-ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
-ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
-ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key
+RequiresMountsFor=/var /run
+ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
+ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
+ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
+ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
+ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
+ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
+ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
+ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
 
 [Service]
-ExecStart=@BINDIR@/ssh-keygen -A
+Environment="SYSCONFDIR=/etc/ssh"
+EnvironmentFile=-/etc/default/ssh
+ExecStart=@BASE_BINDIR@/mkdir -p $SYSCONFDIR
+ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key -N '' -t rsa
+ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key -N '' -t dsa
+ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ecdsa_key -N '' -t ecdsa
+ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ed25519_key -N '' -t ed25519
 Type=oneshot
 RemainAfterExit=yes
-- 
2.1.4


