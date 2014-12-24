Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id AA690726F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 16:32:00 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hq12so3024792vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=BwqTOzjhWoBwE/tHTqhfeKy4hOUQt84isk9KVcY54J4=;
	b=DxAMyHr7s3O4CyOXVwYFnS6LFkb0/vwOhGp0Djj5zY0Otl6BulLVFcJnZoEfKBPCSh
	OWyY739bNEnpQh7L3yqWIo4zSo16ffjErD45yNzngt3TZbe266Ws3sjucuE+YwSClxDY
	Q652+vTwLPv9pwoI3pSt3KuXx1yEUZgRVyKGit9r2P/1s/EjkLm7fu0JiU+WzeUocQje
	+xyB6B9oOoP/SZrEu8ArxGkPX1HMuO5CRl62fmokkFvOWLa34J8wQ3jECkHLJr9NhG5y
	q2A+aUZSl/v3sfFGNTAn2OkspTRQqimxUyq8PRh9CZjyoGwMgfiZQm8BjObRZ3ynq/36
	PcFw==
X-Received: by 10.220.11.68 with SMTP id s4mr13989086vcs.0.1419438721615;
	Wed, 24 Dec 2014 08:32:01 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id ey1sm6065973vdb.23.2014.12.24.08.31.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Dec 2014 08:32:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Dec 2014 14:32:11 -0200
Message-Id: <1419438731-623-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419438731-623-1-git-send-email-otavio@ossystems.com.br>
References: <1419438731-623-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/3] lib/oe/image.py: Handle compressed IMAGE_TYPEDEP values
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
X-List-Received-Date: Wed, 24 Dec 2014 16:32:06 -0000

When computing the dependency graph for the image generation, we need
to take into account the compression type and identify the base type
it relates to. This allow for a more robust graph generation even when
using composed image types.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/lib/oe/image.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 7e080b0..f9c8f84 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -48,11 +48,13 @@ class ImageDepGraph(object):
         graph = dict()
 
         def add_node(node):
+            base_type = self._image_base_type(node)
             deps = (self.d.getVar('IMAGE_TYPEDEP_' + node, True) or "")
-            if deps != "":
+            base_deps = (self.d.getVar('IMAGE_TYPEDEP_' + base_type, True) or "")
+            if deps != "" or base_deps != "":
                 graph[node] = deps
 
-                for dep in deps.split():
+                for dep in deps.split() + base_deps.split():
                     if not dep in graph:
                         add_node(dep)
             else:
@@ -72,6 +74,18 @@ class ImageDepGraph(object):
         for item in remove_list:
             self.graph.pop(item, None)
 
+    def _image_base_type(self, type):
+        ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
+        if type in ["vmdk", "live", "iso", "hddimg"]:
+            type = "ext3"
+        basetype = type
+        for ctype in ctypes:
+            if type.endswith("." + ctype):
+                basetype = type[:-len("." + ctype)]
+                break
+
+        return basetype
+
     def _compute_dependencies(self):
         """
         returns dict object of nodes with [no_of_depends_on, no_of_depended_by]
-- 
2.1.3


