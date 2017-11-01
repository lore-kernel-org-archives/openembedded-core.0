Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 91F20780F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:00:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2017 07:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="330573749"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2017 07:00:42 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 16:00:35 +0200
Message-Id: <7b9797995c1affc5c413d25a94d3ea53b4c602f6.1509544185.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 6/6] update-alternatives.bbclass: refuse to manage SysV init scripts
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
X-List-Received-Date: Wed, 01 Nov 2017 14:00:42 -0000

Sanity check for future packages.

[YOCTO #10944]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/update-alternatives.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 65cae7002f..aa01058cf9 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -143,6 +143,10 @@ python perform_packagecopy_append () {
             if not alt_link:
                 alt_link = "%s/%s" % (d.getVar('bindir'), alt_name)
                 d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
+            if alt_link.startswith(os.path.join(d.getVar('sysconfdir', True), 'init.d')):
+                # Managing init scripts does not work (bug #10433), foremost
+                # because of a race with update-rc.d
+                bb.fatal("Using update-alternatives for managing SysV init scripts is not supported")
 
             alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
             alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
-- 
2.13.6


