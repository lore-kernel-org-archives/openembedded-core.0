Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 700F360621
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 16:17:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 03 Feb 2017 08:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,329,1477983600"; d="scan'208";a="60525975"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 03 Feb 2017 08:17:05 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 530746A4006;
	Fri,  3 Feb 2017 08:16:05 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 17:54:40 +0200
Message-Id: <1486137280-20049-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic: fix call of serial_console_form_kargs
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
X-List-Received-Date: Fri, 03 Feb 2017 16:17:10 -0000

As syslinux module has been recently removed and
serial_consloe_form_kargs became local API in rootfs_pcbios_ext plugin
it should be called without syslinux. prefix.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index bd6fd6c..cb1da93 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -122,7 +122,7 @@ class RootfsPlugin(SourcePlugin):
         syslinux_conf += "ALLOWOPTIONS 1\n"
 
         # Derive SERIAL... line from from kernel boot parameters
-        syslinux_conf += syslinux.serial_console_form_kargs(options) + "\n"
+        syslinux_conf += serial_console_form_kargs(options) + "\n"
 
         syslinux_conf += "DEFAULT linux\n"
         syslinux_conf += "LABEL linux\n"
-- 
2.1.4


