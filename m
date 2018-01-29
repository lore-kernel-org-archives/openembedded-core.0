Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 44EFE783FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:01:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 04:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,429,1511856000"; d="scan'208";a="13895514"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2018 04:01:41 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:01:32 +0200
Message-Id: <e2a78fad445b727ba649e5fecb0832ab7494c6db.1517227178.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
References: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/7] meta/lib/oe/package_manager.py: deprecate 'exit 1' as a way to defer to first boot
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
X-List-Received-Date: Mon, 29 Jan 2018 12:01:40 -0000

'exit 1' is not optimal for two reasons:

1) Code is hard to read; it is not obvious that it means 'defer what follows to first boot'.
2) Worse, this hides actual errors in the scriptlets; there is no difference between scriptlet
failing because it's intended to be run on target and scriptlet failing because there's a bug or
a regression somewhere.

The new, supported way is to place the code that has to run on target into pkg_postinst_ontarget(),
or, if a more fine-tuned control is required, call 'postinst-intercepts defer_to_first_boot' from
pkg_postinst() to explicitly request deferral to first boot.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2a07f0e39ad..f7e013437c9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -604,6 +604,9 @@ class RpmPM(PackageManager):
             if line.startswith("Non-fatal POSTIN scriptlet failure in rpm package"):
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
+        if len(failed_scriptlets_pkgnames) > 0:
+            bb.warn("Intentionally failing postinstall scriptlets of %s to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ()." %(list(failed_scriptlets_pkgnames.keys())))
+            bb.warn("If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.")
         for pkg in failed_scriptlets_pkgnames.keys():
             self.save_rpmpostinst(pkg)
 
-- 
2.15.1


