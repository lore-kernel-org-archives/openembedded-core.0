Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF06785AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 00:56:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 16:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,434,1508828400"; 
   d="scan'208";a="4472579"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 20 Dec 2017 16:56:42 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 16:56:36 -0800
Message-Id: <20171221005637.34163-6-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171221005637.34163-1-california.l.sullivan@intel.com>
References: <20171221005637.34163-1-california.l.sullivan@intel.com>
Cc: akuster@mvista.com
Subject: [rocko][PATCH 5/6] init-install: fix grub-install command
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
X-List-Received-Date: Thu, 21 Dec 2017 00:56:41 -0000

The grub_version variable was calling 'grub-install -v' (verbose) instead
of 'grub-install -V' (version) causing unexpected failures.

Fixes bug [YOCTO #12111].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 38dcbd96e82b1c40576a0514f053266429dca5d1)
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 572613ecd4..1cac8064a2 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -132,7 +132,7 @@ fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
-grub_version=$(grub-install -v|sed 's/.* \([0-9]\).*/\1/')
+grub_version=$(grub-install -V|sed 's/.* \([0-9]\).*/\1/')
 
 if [ $grub_version -eq 0 ] ; then
     bios_boot_size=0
-- 
2.14.3


