Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E2F517896A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:45:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jan 2018 04:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,330,1511856000"; d="scan'208";a="19851107"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2018 04:45:48 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 14:45:45 +0200
Message-Id: <73e0fef5ce6decfd525eff717c22fc80176bf290.1515415190.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
References: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 3/6] meta/lib/oe/rootfs.py: do not execute defer_to_first_boot when processing postinst_intercept hooks
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
X-List-Received-Date: Mon, 08 Jan 2018 12:45:48 -0000

That hook is empty, and doesn't need to be executed; it merely indicates that packages
that have used it are requesting to defer their postinst scripts to first boot
unconditionally.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d3ec8a56c48..8bf77aea492 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -324,6 +324,10 @@ class Rootfs(object, metaclass=ABCMeta):
             if script == "postinst_intercept" or not os.access(script_full, os.X_OK):
                 continue
 
+            if script == "delay_to_first_boot":
+                self._postpone_to_first_boot(script_full)
+                continue
+
             bb.note("> Executing %s intercept ..." % script)
 
             try:
-- 
2.15.1


