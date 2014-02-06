Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B669F60155
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 13:34:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Feb 2014 05:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="479043122"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.186])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2014 05:34:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 13:33:45 +0000
Message-Id: <1391693625-25733-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH v2] conf/bitbake.conf: default HOMEPAGE to blank instead of unknown
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
X-List-Received-Date: Thu, 06 Feb 2014 13:34:00 -0000

The default value for HOMEPAGE of "unknown" has been in place since the
early OE-Classic days, but it doesn't really make sense - "unknown" is
not a valid URL and it just means we have to explicitly check for this
hardcoded string if we're displaying the value in some form of UI, such
as Toaster.

This has required some changes to the packaging classes as they
previously did not expect the value to be blank.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 3 ++-
 meta/classes/package_ipk.bbclass | 3 ++-
 meta/classes/package_rpm.bbclass | 3 ++-
 meta/conf/bitbake.conf           | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5d316aa..bc62c6e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -262,7 +262,8 @@ python do_package_deb () {
         fields.append(["Architecture: %s\n", ['DPKG_ARCH']])
         fields.append(["OE: %s\n", ['PN']])
         fields.append(["PackageArch: %s\n", ['PACKAGE_ARCH']])
-        fields.append(["Homepage: %s\n", ['HOMEPAGE']])
+        if d.getVar('HOMEPAGE', True):
+            fields.append(["Homepage: %s\n", ['HOMEPAGE']])
 
         # Package, Version, Maintainer, Description - mandatory
         # Section, Priority, Essential, Architecture, Source, Depends, Pre-Depends, Recommends, Suggests, Conflicts, Replaces, Provides - Optional
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 2d8e459..5835d36 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -290,7 +290,8 @@ python do_package_ipk () {
         fields.append(["License: %s\n", ['LICENSE']])
         fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
         fields.append(["OE: %s\n", ['PN']])
-        fields.append(["Homepage: %s\n", ['HOMEPAGE']])
+        if d.getVar('HOMEPAGE', True):
+            fields.append(["Homepage: %s\n", ['HOMEPAGE']])
 
         def pullData(l, d):
             l2 = []
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e9a6ac8..32863d7 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -969,7 +969,8 @@ python write_specfile () {
     spec_preamble_top.append('License: %s' % srclicense)
     spec_preamble_top.append('Group: %s' % srcsection)
     spec_preamble_top.append('Packager: %s' % srcmaintainer)
-    spec_preamble_top.append('URL: %s' % srchomepage)
+    if srchomepage:
+        spec_preamble_top.append('URL: %s' % srchomepage)
     if srccustomtagschunk:
         spec_preamble_top.append(srccustomtagschunk)
     tail_source(d)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 57668e1..4fb6a1c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -241,7 +241,7 @@ This package contains documentation."
 
 LICENSE = "INVALID"
 MAINTAINER = "OE-Core Developers <openembedded-core@lists.openembedded.org>"
-HOMEPAGE = "unknown"
+HOMEPAGE = ""
 
 # Package dependencies and provides.
 
-- 
1.8.5.3


