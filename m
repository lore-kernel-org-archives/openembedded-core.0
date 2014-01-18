Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 644E06E7E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:39 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so2248190eak.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sc0gAgUBH54aNAmcG0oKfXGOOCmp0SFv3wCGgNlMK4A=;
	b=x7vRsxvodYtuBmOYfydymuvYvDkSSydDSGSwyoe0czHqAB80YCJtu0kP3XoDypm0OS
	KV6B5NEyLG/T+fcH5ddhC+s1o17qEcAPmCvzJLVetNTNEXbzBYl8DJu7gNrucpzy7kZl
	1qwsJ5tkQ2l14S8NwuAKQclW0v05zgmUmZKqUcSwQtiNtYMaXdIhepaQt3+ZYAERZHB7
	PsC1uwV/Ub74nVcna+8uXJbwwPvRvsitNS+pZHIcLC920uWzUwqmBaHAfCeep2HbxnhW
	DnE5j8j9gLVKbF/z/Htwy/yJM/CYmuNpL88kqud5Ostrq/occl9L6JbU/oNqSjy9SI5x
	bxQg==
X-Received: by 10.14.127.132 with SMTP id d4mr2843853eei.66.1390053683395;
	Sat, 18 Jan 2014 06:01:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n7sm35473055eef.5.2014.01.18.06.01.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:43 +0100
Message-Id: <929c7c10ad8efd6391a3bca0104f8e0eea617ac3.1390052658.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052658.git.Martin.Jansa@gmail.com>
References: <cover.1390052658.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052658.git.Martin.Jansa@gmail.com>
References: <cover.1390052658.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] package.bbclass: add getter of additional metadata
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:39 -0000

From: Leonid Borisenko <ive.found@gmail.com>

Two variables are searched for value of additional package metadata:

  * PACKAGE_ADD_METADATA_<PKGTYPE>
  * PACKAGE_ADD_METADATA

First found variable with defined value wins.

<PKGTYPE> is a parameter of getter and expected to be a distinct name
of specific package type. For example: 'DEB' or 'RPM'.

Variable can contain multiple [one-line] metadata fields, separated by
literal sequence '\n'. Separator can be redefined through variable flag
'separator'. Getter returns found value with separator replaced with
newline character.

As side-effect, searched variables acquired flags 'type' (equals to
'list') and 'separator'.

Signed-off-by: Leonid Borisenko <ive.found@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 768047c..561800a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -363,6 +363,17 @@ def get_package_mapping (pkg, basepkg, d):
 
     return pkg
 
+def get_package_additional_metadata (pkg_type, d):
+    base_key = "PACKAGE_ADD_METADATA"
+    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
+        if d.getVar(key) is None:
+            continue
+        d.setVarFlag(key, "type", "list")
+        if d.getVarFlag(key, "separator") is None:
+            d.setVarFlag(key, "separator", "\\n")
+        metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
+        return "\n".join(metadata_fields).strip()
+
 def runtime_mapping_rename (varname, pkg, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
 
-- 
1.8.5.2


