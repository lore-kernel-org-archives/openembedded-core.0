Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5C22571B45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 23:15:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2017 15:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,322,1477983600"; d="scan'208";a="1079696747"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2017 15:15:48 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 15:15:44 -0800
Message-Id: <e9bc9ce5c76b5978e5336ab69f6739d4fb18aa98.1483658030.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1483658030.git.randy.e.witt@linux.intel.com>
References: <cover.1483658030.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/2] image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types
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
X-List-Received-Date: Thu, 05 Jan 2017 23:15:54 -0000

Previously if IMAGE_TYPEDEP_* contained a conversion type of the form,
"foo.bar", the dependency on CONVERSION_DEPENDS_bar would not get added
to the task depends for do_rootfs.

[YOCTO #10883]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/image_types.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8f04849..c2ad141 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -17,17 +17,25 @@ def imagetypes_getdepends(d):
                 d += ":do_populate_sysroot"
             deps.add(d)
 
+    # Take a type in the form of foo.bar.car and split it into the items
+    # needed for the image deps "foo", and the conversion deps ["bar", "car"]
+    def split_types(typestring):
+        types = typestring.split(".")
+        return types[0], types[1:]
+
     fstypes = set((d.getVar('IMAGE_FSTYPES') or "").split())
     fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
 
     deps = set()
     for typestring in fstypes:
-        types = typestring.split(".")
-        basetype, resttypes = types[0], types[1:]
-
+        basetype, resttypes = split_types(typestring)
         adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype) , deps)
+
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype) or "").split():
+            base, rest = split_types(typedepends)
+            resttypes += rest
             adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends) , deps)
+
         for ctype in resttypes:
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
             adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype), deps)
-- 
2.7.4


