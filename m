Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 676E471A2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:02:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 28 Dec 2016 05:02:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="802981698"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2016 05:02:52 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 15:02:43 +0200
Message-Id: <1482930164-15721-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 7/8] oeqa.utils.metadata: have layer name as an attribute in xml
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
X-List-Received-Date: Wed, 28 Dec 2016 13:02:51 -0000

Have the layer name as an attribute instead of of the name of the
element itself. That is, have <layer name="layer_name"/> instead of
<layer_name/>. A bit better XML design.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index d5cc290..6331c21 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -90,12 +90,14 @@ def write_metadata_file(file_path, metadata):
     with open(file_path, 'w') as f:
         f.write(xml_doc.toprettyxml())
 
-def dict_to_XML(tag, dictionary):
+def dict_to_XML(tag, dictionary, **kwargs):
     """ Return XML element converting dicts recursively. """
 
-    elem = Element(tag)
+    elem = Element(tag, **kwargs)
     for key, val in dictionary.items():
-        if isinstance(val, MutableMapping):
+        if tag == 'layers':
+            child = (dict_to_XML('layer', val, name=key))
+        elif isinstance(val, MutableMapping):
             child = (dict_to_XML(key, val))
         else:
             child = Element(key)
-- 
2.6.6


