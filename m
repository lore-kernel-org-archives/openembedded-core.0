Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF0C37834E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 09:12:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2017 02:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,411,1496127600"; d="scan'208";a="996876273"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.40.16])
	by orsmga003.jf.intel.com with ESMTP; 25 Jul 2017 02:12:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 11:12:10 +0200
Message-Id: <3e176daccae81616c04fe2e69de80a2e3e302f9e.1500973912.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500973912.git.paul.eggleton@linux.intel.com>
References: <cover.1500973912.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] wic-tools: ensure pseudo is available
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
X-List-Received-Date: Tue, 25 Jul 2017 09:12:56 -0000

wic will attempt to use pseudo from the wic-tools sysroot to run, but it
was only sure to be in there if do_install had executed - which is not
the case if it had been restored from sstate, in which case it failed
horribly as seen when running the wic.Wic.test_fs_types and
test_mkfs_extraopts tests on the Yocto Project autobuilder recently. Add
an explicit dependency on pseudo-native to ensure it's always there.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/wic-tools.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index c416a2e..d908e48 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 DEPENDS = "\
            parted-native syslinux-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-efi-native cdrtools-native \
-           btrfs-tools-native squashfs-tools-native \
+           btrfs-tools-native squashfs-tools-native pseudo-native \
            "
 DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
-- 
2.9.4


