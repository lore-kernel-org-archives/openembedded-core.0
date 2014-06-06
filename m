Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 803766FC33
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 00:09:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2014 17:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,984,1392192000"; d="scan'208";a="441514485"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2014 17:09:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 17:09:05 -0700
Message-Id: <1402013345-24930-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/4] fontconfig: enable 64 bit file support
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
X-List-Received-Date: Fri, 06 Jun 2014 00:09:08 -0000

When running 32bit code on a large filessytem with 64bit inodes, the
fontcache was not being created correctly because an EOVERFLOW was being
returned from the fstat when reading the 64 inode on a 32bit system.

The fontcache is created at rootfs time on the host system via qemu.

[YOCTO #6338]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
index 797b321..4fa58ab 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
@@ -38,5 +38,7 @@ DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts"
+TARGET_CPPFLAGS += "-D_FILE_OFFSET_BITS=64"
+
 
 BBCLASSEXTEND = "native"
-- 
1.8.3.1


