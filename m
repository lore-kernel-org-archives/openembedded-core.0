Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 30D4B6D86B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 01:52:24 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so5900417eaj.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WFx3yU/X9uHvKowTrtVmWIMvNKge7+F7xVgLbigsrmY=;
	b=LRvYbDb9IoOMBDfdd6RWBb9CY41qs9iCHNrZvvxciYr/oagz0tWpuEraI8HVmaatos
	18MzqNYXgrzXPnlpi0FUSFvKZObmH7qOIuZ9/Nev3e253yDS81jlOVSRt/slV7LlxINo
	3Ry02S59kkHx+BkFu9COfVXomUmOkfhjp1mZkkpgA0xR7Wc3J4t6m4K2NqAINV52pc89
	+czYT0K0Dy1772NrtB7LRXWhGLootzTGCDxHjemdT42QoY5KHPLjQ9efHa9esUN3LSx+
	GF+TkKB9OMA7kc3W9o+Cuo0+EfaZvN4u0jddPu5HFZq6xdqTuYYZuIwWpU7oHkdQ5rvq
	FOcg==
X-Received: by 10.14.202.137 with SMTP id d9mr15218950eeo.23.1385517141820;
	Tue, 26 Nov 2013 17:52:21 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm14479805eem.21.2013.11.26.17.52.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 17:52:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 02:52:23 +0100
Message-Id: <1385517143-2228-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] allarch: Disable icecc for allarch recipes
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
X-List-Received-Date: Wed, 27 Nov 2013 01:52:27 -0000

* Fix icecc.bbclass failing with:
  ERROR: recipe-name NULL prefix
  when it's used with empty TARGET_PREFIX.
* Allarch recipes cannot use compiler at all (even the local one)
  so there is no point of using icecc for them.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 49dbd77..ef8761a 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -90,6 +90,10 @@ def create_path(compilers, bb, d):
     return staging
 
 def use_icc(bb,d):
+    # allarch recipes don't use compiler
+    if icc_is_allarch(bb, d):
+        return "no"
+
     package_tmp = d.expand('${PN}')
 
     system_class_blacklist = [ "none" ] 
@@ -124,6 +128,10 @@ def use_icc(bb,d):
 
     return "yes"
 
+def icc_is_allarch(bb, d):
+    return \
+        bb.data.inherits_class("allarch", d);
+
 def icc_is_kernel(bb, d):
     return \
         bb.data.inherits_class("kernel", d);
-- 
1.8.4.3


