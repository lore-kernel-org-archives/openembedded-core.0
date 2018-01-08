Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E269E7896A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:45:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jan 2018 04:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,330,1511856000"; d="scan'208";a="19851146"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2018 04:45:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 14:45:48 +0200
Message-Id: <c65a02c71f073f92dc150428376058d4cc7eb7a8.1515415190.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
References: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 6/6] package_rpm.bbclass: run pre/post installation scriptlets using sh -e
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
X-List-Received-Date: Mon, 08 Jan 2018 12:45:51 -0000

This allows catching errors in the scriptlets which would otherwise
go unnoticed, e.g. this sequence:

====
bogus_command
proper_command
====

would work just fine. Note that this patch needs all of the preceding
patches, as otherwise running failing scriptlets with -e would defer
them to first boot, instead of properly reporting failure and aborting
the package installation.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b08608c8466..f4b6d0b65f2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -465,12 +465,12 @@ python write_specfile () {
 
         # Now process scriptlets
         if splitrpreinst:
-            spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
+            spec_scriptlets_bottom.append('%%pre -n %s -p "/bin/sh -e"' % splitname)
             spec_scriptlets_bottom.append('# %s - preinst' % splitname)
             spec_scriptlets_bottom.append(splitrpreinst)
             spec_scriptlets_bottom.append('')
         if splitrpostinst:
-            spec_scriptlets_bottom.append('%%post -n %s' % splitname)
+            spec_scriptlets_bottom.append('%%post -n %s -p "/bin/sh -e"' % splitname)
             spec_scriptlets_bottom.append('# %s - postinst' % splitname)
             spec_scriptlets_bottom.append(splitrpostinst)
             spec_scriptlets_bottom.append('')
@@ -559,12 +559,12 @@ python write_specfile () {
     spec_preamble_top.append('')
 
     if srcrpreinst:
-        spec_scriptlets_top.append('%pre')
+        spec_scriptlets_top.append('%pre -p "/bin/sh -e"')
         spec_scriptlets_top.append('# %s - preinst' % srcname)
         spec_scriptlets_top.append(srcrpreinst)
         spec_scriptlets_top.append('')
     if srcrpostinst:
-        spec_scriptlets_top.append('%post')
+        spec_scriptlets_top.append('%post -p "/bin/sh -e"')
         spec_scriptlets_top.append('# %s - postinst' % srcname)
         spec_scriptlets_top.append(srcrpostinst)
         spec_scriptlets_top.append('')
-- 
2.15.1


