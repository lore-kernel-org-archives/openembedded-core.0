Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E250965C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:29:45 +0000 (UTC)
Received: by qgt47 with SMTP id 47so17490455qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=4q7ByeSx2mysRIC4IjS/m7uWh31jax7wvSVOtAb2ous=;
	b=m5qMWsKBKrHFcv9fdYXbYw7qMxPLOv/gWRosmHPVorIcFg4WV0d6ygsCLBI4h8pEGk
	wZR3PeZkfTWX3FPZwkceVhVeP/3P0n5NxoMf0Gk20jCDpYF6bS1earELZ/BXTtUDIN4o
	bZRvVkftzI2KgDztwE9s3lRJOQlGPXkQBTJpB8gt7fsTaabsdYkHOJ/A14i3P4Kxqp6x
	TF3yjBKTRSafcpzCFyHuFDr0FJpw1V3SG/WMf5s11L5H0WUnej57yAQVs/yXz/KFLC9o
	LYBGYqGwmQZ1LF4iBZCGmiJl6/qheKQUOERIjau35LQhwyNKp3hBLmfrQJKgQU0ngQU9
	ZaTg==
X-Received: by 10.140.145.145 with SMTP id 139mr42478678qhr.100.1444750185562; 
	Tue, 13 Oct 2015 08:29:45 -0700 (PDT)
Received: from localhost ([177.194.195.186]) by smtp.gmail.com with ESMTPSA id
	h198sm1350713qhc.47.2015.10.13.08.29.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 08:29:44 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 13 Oct 2015 12:29:39 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Oct 2015 12:29:37 -0300
Message-Id: <1444750177-22377-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] lib/oe/image.py: Fix dependency handling for compressed types
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
X-List-Received-Date: Tue, 13 Oct 2015 15:29:46 -0000

The dependency code needs to also include the dependency of base
types. For example:

 - sdcard.gz image with ext4

The dependency chain needs to include:

 - sdcard
 - ext4
 - gz

Until this change, the ext4 dependency were not being taken into
account when using the compressed one.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/lib/oe/image.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index b0d81a6..b9eb3de 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -54,14 +54,16 @@ class ImageDepGraph(object):
             base_type = self._image_base_type(node)
             deps = (self.d.getVar('IMAGE_TYPEDEP_' + node, True) or "")
             base_deps = (self.d.getVar('IMAGE_TYPEDEP_' + base_type, True) or "")
-            if deps != "" or base_deps != "":
-                graph[node] = deps
-
-                for dep in deps.split() + base_deps.split():
-                    if not dep in graph:
-                        add_node(dep)
-            else:
-                graph[node] = ""
+
+            graph[node] = ""
+            for dep in deps.split() + base_deps.split():
+                if not dep in graph[node]:
+                    if graph[node] != "":
+                        graph[node] += " "
+                    graph[node] += dep
+
+                if not dep in graph:
+                    add_node(dep)
 
         for fstype in image_fstypes:
             add_node(fstype)
-- 
2.6.1


