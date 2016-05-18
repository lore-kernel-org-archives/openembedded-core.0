Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C20A16E6B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:24:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2016 09:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="969722867"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2016 09:24:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 344016A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 10:12:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 19:24:14 +0300
Message-Id: <2e1c11f43db9a3fb67b90a6b7a38eae1e3601b62.1463588057.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463588057.git.ed.bartosh@linux.intel.com>
References: <cover.1463588057.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1463588057.git.ed.bartosh@linux.intel.com>
References: <cover.1463588057.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 1/6] image.bbclass: support duplicate compression types
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
X-List-Received-Date: Wed, 18 May 2016 16:24:31 -0000

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
Signed-off-by: Ed Bartosh <eduard.bartosh@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6b9f979..0e81b4e 100644
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
-- 
2.1.4


