Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5129B75C61
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 17:19:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 06 May 2016 10:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="974219506"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 06 May 2016 10:19:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 57E366A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 11:06:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 17:58:45 +0300
Message-Id: <830b24567c00109edbcb64eef2337abd938e3481.1462545440.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462545440.git.ed.bartosh@linux.intel.com>
References: <cover.1462545440.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462545440.git.ed.bartosh@linux.intel.com>
References: <cover.1462545440.git.ed.bartosh@linux.intel.com>
Subject: [RFC][PATCH 2/7] image.bbclass: support duplicate compression types
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
X-List-Received-Date: Fri, 06 May 2016 17:19:08 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

When a derived distro adds a certain type, say zip, to
COMPRESSIONTYPES and later OE-core does the same, we end up with the
type being listed twice, and that would have undesired effects
(commands generated twice).

So to support such loosely coupled extension, we de-duplicated the
list of types first.

Alternatively, such a situation could also be treated as error. But that
seems unnecessary because typically commands for the same type will also
do the same thing.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass       | 10 +++++++++-
 meta/classes/image_types.bbclass |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4542e95..56a4ddd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -297,7 +297,15 @@ python setup_debugfs () {
 
 python () {
     vardeps = set()
-    ctypes = d.getVar('COMPRESSIONTYPES', True).split()
+    # We allow COMPRESSIONTYPES to have duplicates. That avoids breaking
+    # derived distros when OE-core or some other layer independently adds
+    # the same type. There is still only one command for each type, but
+    # presumably the commands will do the same when the type is the same,
+    # even when added in different places.
+    #
+    # Without de-duplication, gen_conversion_cmds() below
+    # would create the same compression command multiple times.
+    ctypes = set(d.getVar('COMPRESSIONTYPES', True).split())
     old_overrides = d.getVar('OVERRIDES', 0)
 
     def _image_base_type(type):
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d13bdf5..40a4a1b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -16,7 +16,7 @@ def imagetypes_getdepends(d):
                 deps.append(i)
 
     deps = []
-    ctypes = d.getVar('COMPRESSIONTYPES', True).split()
+    ctypes = set(d.getVar('COMPRESSIONTYPES', True).split())
     fstypes = set((d.getVar('IMAGE_FSTYPES', True) or "").split())
     fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").split())
     for type in fstypes:
-- 
2.1.4


