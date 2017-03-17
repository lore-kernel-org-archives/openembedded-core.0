Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B7FEE77A4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489757633; x=1521293633;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VanKmYhLyMHx2UrEJrp/w9UBs7aOmjfZtCfi27kwsg8=;
	b=sVmrYOuKLhmxCg6o0iK59wC+IqaUPdiyLzXxbNKykKbqx7Em/VSESEAh
	VYPb9kPhdFg2zIxE5OKuMoj1bjsL5Q==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 06:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="61661981"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2017 06:33:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C71E02C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 06:33:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:18:32 +0200
Message-Id: <d7dafbaf3a8f36fe1b48eaa5a2e01e7a015fe96c.1489755821.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489755821.git.ed.bartosh@linux.intel.com>
References: <cover.1489755821.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/4] runqemu: output network configuration
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
X-List-Received-Date: Fri, 17 Mar 2017 13:33:51 -0000

runqemu adds network configuration parameters to the kernel
command line to configure guest networking. This works only
for the images that run with external kernel using qemu -kernel
parameter. It doesn't work for the images that use bootloader
to boot kernel as -kernel parameter is not used and network
configuration is not possible to get.

Added host and guest ip addresses and netmask of tap link
to the runqemu output. This should allow external programs
that execute runqemu to get network configuration.

[YOCTO #10833]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1721956..453f9d8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -917,7 +917,9 @@ class BaseConfig(object):
         client = gateway + 1
         if self.fstype == 'nfs':
             self.setup_nfs()
-        self.kernel_cmdline_script += " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
+        netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
+        logger.info("Network configuration: %s", netconf)
+        self.kernel_cmdline_script += " ip=%s" % netconf
         mac = "%s%02x" % (self.mac_tap, client)
         qb_tap_opt = self.get('QB_TAP_OPT')
         if qb_tap_opt:
-- 
2.1.4


