Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 530D671AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:58:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 11 Jan 2017 11:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="807758406"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2017 11:58:24 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 19:55:24 +0000
Message-Id: <5148bbeee9d8b9c803c9e1be36a42f779e7c222b.1484164023.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 7/7] systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation
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
X-List-Received-Date: Wed, 11 Jan 2017 19:58:24 -0000

This patch makes sure the directory which will contain
the systemd configuration (loader.conf) is created before
the configuration file is written, fixing errors when it
tried to write it to a non-existent directory

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/systemd-boot.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 6718783..6a2cbc8 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -72,6 +72,9 @@ python build_efi_cfg() {
         return
 
     cfile = d.getVar('SYSTEMD_BOOT_CFG')
+    cdir = os.path.dirname(cfile)
+    if not os.path.exists(cdir):
+        os.makedirs(cdir)
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-- 
2.6.6


