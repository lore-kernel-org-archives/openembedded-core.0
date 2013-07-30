Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id EC8356B0AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 09:28:00 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 02:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="275216583"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 02:28:01 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 72E296A4093
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 02:27:59 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 12:28:19 +0300
Message-Id: <9d42582cb74d9a7564c68f10998d7e0f9ff25617.1375176217.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1375176217.git.stefanx.stanacar@intel.com>
References: <cover.1375176217.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1375176217.git.stefanx.stanacar@intel.com>
References: <cover.1375176217.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 3/4] oeqa/utils/qemurunner: tweak console bootparam and ip command
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
X-List-Received-Date: Tue, 30 Jul 2013 09:28:01 -0000

Sync serial baud rate with default inittab which should
help with apparent boot fails. Also keep a console on tty1.

Also we shouldn't assume eth0 it the right interface.
(systemd images can rename interfaces to something else).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 02e0a4a..45b3ccb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -25,7 +25,7 @@ class QemuRunner:
         self.rootfs = rootfs
 
         self.streampath = '/tmp/qemuconnection.%s' % os.getpid()
-        self.qemuparams = 'bootparams="console=ttyS0" qemuparams="-serial unix:%s,server,nowait"' % self.streampath
+        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial unix:%s,server,nowait"' % self.streampath
         self.qemupid = None
         self.ip = None
 
@@ -76,7 +76,7 @@ class QemuRunner:
                 if not match:
                     bb.note("Couldn't get prompt, all I got was:\n%s" % match.group(0))
                     return False
-                console.write("ip addr show eth0 | sed -n '3p' | awk '{ print $2 }' | cut -f 1 -d \"/\"\n")
+                console.write("ip addr show `ip route list | sed -n '1p' | awk '{print $5}'` | sed -n '3p' | awk '{ print $2 }' | cut -f 1 -d \"/\"\n")
                 (index, match, text) = console.expect([r"((?:[0-9]{1,3}\.){3}[0-9]{1,3})"],10)
                 console.close()
                 if match:
-- 
1.8.3.1


