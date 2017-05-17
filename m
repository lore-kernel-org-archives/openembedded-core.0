Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DD73077D82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:48:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="969439696"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 17 May 2017 06:48:11 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 6C51E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:47:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:47:44 +0000
Message-Id: <90077847e2257518577c87c2ea181f382e9c5a19.1495028624.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028624.git.ed.bartosh@linux.intel.com>
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 1/7] systemd-boot: create output dir if it doesn't exist
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
X-List-Received-Date: Wed, 17 May 2017 13:48:11 -0000

build_efi_cfg function creates configuration files for
systemd-boot entries in 'S' directory. This directory
may not exist when api is called, which breaks the build.

Creating the directory if it doesn't exist should fix
this issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/systemd-boot.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 4e69a2c6b5..4412fb1ef7 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -99,6 +99,8 @@ python build_efi_cfg() {
             bb.fatal('OVERRIDES not defined')
 
         entryfile = "%s/%s.conf" % (s, label)
+        if not os.path.exists(s):
+            os.makedirs(s)
         d.appendVar("SYSTEMD_BOOT_ENTRIES", " " + entryfile)
         try:
             entrycfg = open(entryfile, "w")
-- 
2.12.0


