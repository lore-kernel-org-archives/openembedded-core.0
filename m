Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A11F67026F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 15:38:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2014 08:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,514,1400050800"; d="scan'208";a="447997174"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2014 08:38:39 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jun 2014 18:42:16 +0300
Message-Id: <d08f8e0059740764416e09815a6416e221d04d9e.1403277454.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403277454.git.cristian.iorga@intel.com>
References: <cover.1403277454.git.cristian.iorga@intel.com>
Subject: [PATCH 1/5] init-install-testfs: add grub serial line support
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
X-List-Received-Date: Fri, 20 Jun 2014 15:38:57 -0000

For automated hardware testing, boot process control
via serial interface is needed. As such, in grub, serial
line support is added upon testmaster image install.

Also add a specific timeout to automatically start
the master image upon start of testing phase.

Tested on multiple hardware targets without issues.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-testfs.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index 116a6b7..6faa233 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -172,6 +172,11 @@ if [ -f /etc/grub.d/00_header ] ; then
     GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
     cat >$GRUBCFG <<_EOF 
+serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1
+terminal_input --append  serial
+terminal_output --append serial
+set timeout_style=hidden
+set timeout=5
 menuentry "Linux" {
     set root=(hd0,1)
     linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
-- 
1.9.1


