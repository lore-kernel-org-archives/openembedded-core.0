Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id E621F7239F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 21:08:14 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id c9so1136270qcz.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 13:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=VqVRRwmZppXwv0ECePtUzMSa3aYAiJXjAmcDWsYgi00=;
	b=WuDstUdOPNo6EKlaQA7jJsjV9nq7WPwE4HiLsONeFZ/B49sSzq7JqaEPIx7uTsdCKR
	eDWTMrim2llWi8cKCA3f+kbUOhj1GS5mZbwX/NypNj0PgjY8/wLSTfvF5BM05ut8yfsz
	rS0mLlVTWOIA5PshjcRZUjlQOSkMh5o+FHRY9Hz99NhrAViYwKXkICPf79FxH7E2aRv3
	Vs3kcn4H8j/uYWjU3HO0VEIDH+veBUn34DXO9HjWj+Z2M+QarFYNDXIckSEwVLLBxn9/
	vzBdh3HuOXTDRklCwExv+BfG4q+kXfBmOiHmVaa28++B2iklgUpzru/T8f2+GJeEGzbW
	X4eg==
X-Received: by 10.140.91.11 with SMTP id y11mr1056915qgd.52.1418159294721;
	Tue, 09 Dec 2014 13:08:14 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id d7sm2187042qar.27.2014.12.09.13.08.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Dec 2014 13:08:13 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  9 Dec 2014 19:07:57 -0200
Message-Id: <1418159277-3620-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
References: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Tue, 09 Dec 2014 21:08:15 -0000

When computing the dependency graph for the image generation, we need
to take into account the compression type and identify the base type
it relates to. This allow for a more robust graph generation even when
using composed image types.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/lib/oe/image.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 7e080b0..efc0329 100644
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


