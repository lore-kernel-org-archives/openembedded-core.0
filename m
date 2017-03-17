Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9458E77A5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489757647; x=1521293647;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=D3hdzxe1fT6efjZejtxGDLY3RUhSvJhShSsO7IwTkVo=;
	b=TjsVUk7y6+KWjQkuMyF6WX6MqZhDNTbQ+qVlF+9S8Nhkle/IJAq3GEWB
	uT2eY6b53KX8Md6VZkrH3q+QG4pgHw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 06:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="1109546028"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2017 06:34:07 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 7DA492C8002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 06:34:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:18:34 +0200
Message-Id: <261af641ec99b02c9654ef68f46824cdbfe6c81b.1489755821.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489755821.git.ed.bartosh@linux.intel.com>
References: <cover.1489755821.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/4] qemurunner: configure guest networking
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
X-List-Received-Date: Fri, 17 Mar 2017 13:34:05 -0000

Configured guest network interface through serial connection
when kernel is not run by qemu.

This should make it possible to test wic images with testimage.

[YOCTO #10833]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 7e5f588..9ef7629 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -195,6 +195,7 @@ class QemuRunner:
             time.sleep(1)
 
         out = self.getOutput(output)
+        netconf = False # network configuration is not required by default
         if self.is_alive():
             logger.info("qemu started - qemu procces pid is %s" % self.qemupid)
             if get_ip:
@@ -215,6 +216,10 @@ class QemuRunner:
                                      out, re.MULTILINE|re.DOTALL)
                     if match:
                         self.ip, self.server_ip, self.netmask = match.groups()
+                        # network configuration is required as we couldn't get it
+                        # from the runqemu command line, so qemu doesn't run kernel
+                        # and guest networking is not configured
+                        netconf = True
                     else:
                         logger.error("Couldn't get ip from qemu command line and runqemu output! "
                                      "Here is the qemu command line used:\n%s\n"
@@ -287,6 +292,14 @@ class QemuRunner:
                 if re.search("root@[a-zA-Z0-9\-]+:~#", output):
                     self.logged = True
                     logger.info("Logged as root in serial console")
+                    if netconf:
+                        # configure guest networking
+                        cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
+                        output = self.run_serial(cmd, raw=True)[1]
+                        if re.search("root@[a-zA-Z0-9\-]+:~#", output):
+                            logger.info("configured ip address %s", self.ip)
+                        else:
+                            logger.info("Couldn't configure guest networking")
                 else:
                     logger.info("Couldn't login into serial console"
                             " as root using blank password")
-- 
2.1.4


