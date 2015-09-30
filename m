Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1A247705C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 12:53:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2015 05:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="816296229"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2015 05:53:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 15:53:18 +0300
Message-Id: <1443617598-30123-4-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443617598-30123-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1443617598-30123-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/4] dropbear: fix key generation when systemd is in use and rootfs is readonly
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
X-List-Received-Date: Wed, 30 Sep 2015 12:53:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear/dropbear@.service   | 3 ++-
 meta/recipes-core/dropbear/dropbear/dropbearkey.service | 9 +++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear/dropbear@.service b/meta/recipes-core/dropbear/dropbear/dropbear@.service
index 6fe9942..b420bcd 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear@.service
+++ b/meta/recipes-core/dropbear/dropbear/dropbear@.service
@@ -4,8 +4,9 @@ Wants=dropbearkey.service
 After=syslog.target dropbearkey.service
 
 [Service]
+Environment="DROPBEAR_RSAKEY_DIR=/etc/dropbear"
 EnvironmentFile=-/etc/default/dropbear
-ExecStart=-@SBINDIR@/dropbear -i -r /etc/dropbear/dropbear_rsa_host_key $DROPBEAR_EXTRA_ARGS
+ExecStart=-@SBINDIR@/dropbear -i -r ${DROPBEAR_RSAKEY_DIR}/dropbear_rsa_host_key $DROPBEAR_EXTRA_ARGS
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 StandardInput=socket
 KillMode=process
diff --git a/meta/recipes-core/dropbear/dropbear/dropbearkey.service b/meta/recipes-core/dropbear/dropbear/dropbearkey.service
index ccc21d5..c49053d 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbearkey.service
+++ b/meta/recipes-core/dropbear/dropbear/dropbearkey.service
@@ -1,8 +1,13 @@
 [Unit]
 Description=SSH Key Generation
-ConditionPathExists=|!/etc/dropbear/dropbear_rsa_host_key
+RequiresMountsFor=/var /var/lib
+ConditionPathExists=!/etc/dropbear/dropbear_rsa_host_key
+ConditionPathExists=!/var/lib/dropbear/dropbear_rsa_host_key
 
 [Service]
+Environment="DROPBEAR_RSAKEY_DIR=/etc/dropbear"
+EnvironmentFile=-/etc/default/dropbear
 Type=oneshot
-ExecStart=@SBINDIR@/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
+ExecStart=@BASE_BINDIR@/mkdir -p ${DROPBEAR_RSAKEY_DIR}
+ExecStart=@SBINDIR@/dropbearkey -t rsa -f ${DROPBEAR_RSAKEY_DIR}/dropbear_rsa_host_key
 RemainAfterExit=yes
-- 
2.1.4


