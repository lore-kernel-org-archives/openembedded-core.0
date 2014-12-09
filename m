Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id D888C72499
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 20:25:09 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id w8so971391qac.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 12:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=9XG8+lFFgk7OfyCpUtbz2GPuf8Vw1aJwZ+pJfeTyyUs=;
	b=CTeAOCW6BXTJV2dItumsRR9sDsqUGWWRwSOBO4bm3c4tTDsWjbYb1XvPleJPSCSFJf
	9X0RS0iMUAtFoSJWKPCBOhkfU/fER/RLWcfAArc0sm5Jjsc5E1yjHra48jC9YNOe7I0G
	i0qGFTt3gtU/WZ/N584GOxppun8QAhuBT1PLLpZcn3lUhKez4ICtXE70DOoTl0aGYWrs
	DzO4kqvi+PFZpoJW0Pk+8RgWXfZQ1vJ2Azil06bp4cpxWCMX7xsMnds/dpvosx29vyH7
	ZDK8QKIsj/LC8Qd0F/yd0w/zAy7rTXJR1FmjdgoePO24weJIa/DyD4y2jZCbMO6tsd/a
	44hA==
X-Received: by 10.229.104.199 with SMTP id q7mr849363qco.8.1418156709667;
	Tue, 09 Dec 2014 12:25:09 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id
	a103sm1628956qge.29.2014.12.09.12.25.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Dec 2014 12:25:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  9 Dec 2014 18:24:48 -0200
Message-Id: <1418156688-1564-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418156688-1564-1-git-send-email-otavio@ossystems.com.br>
References: <1418156688-1564-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] lib/oe/image.py: Handle compressed IMAGE_TYPEDEP values
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
X-List-Received-Date: Tue, 09 Dec 2014 20:25:15 -0000

When computing the dependency graph for the image generation, we need
to take into account the compression type and identify the base type
it relates to. This allow for a more robust graph generation even when
using composed image types.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/lib/oe/image.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 7e080b0..9ac7d3d 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -48,6 +48,7 @@ class ImageDepGraph(object):
         graph = dict()
 
         def add_node(node):
+            node = self._image_base_type(node)
             deps = (self.d.getVar('IMAGE_TYPEDEP_' + node, True) or "")
             if deps != "":
                 graph[node] = deps
@@ -72,6 +73,18 @@ class ImageDepGraph(object):
         for item in remove_list:
             self.graph.pop(item, None)
 
+    def _image_base_type(self, type):
+        ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
+        if type == "vmdk" or type == "live" or type == "iso" or type == "hddimg":
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


