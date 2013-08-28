Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A2CA56BC26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 16:12:31 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so6498982pdj.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=++yM6eM/qjFPzEWKWZSZzgPWotPjuMMn61FAazwaZwg=;
	b=Dkf0TbEReQogrpzrOajN0od9Fm1jFhabIKw4mAOZFg9f7zg0hljER/dJqrUvg5x9lO
	MDqT104+fPiNIu62Cvx+npDHrbhO9NUgGXcb06zn/BQBtiw+HL52txzOMXwQwhm0zs4F
	o4LYaCZVgZ3bNVHGgw4+/p6HxCFS8XyGera8iIVDWnzle5r21poPpm3fcr4EnPvvIfhB
	V+xmTDMbGe0Vmlb4K/lNn7BhDI8NBSIjWzqAkWLlxvRTabH7z+eHKbGoTyRYlhLF4rZd
	Fx9Ip6K9X3vG1swH7/blYpCEAYuPDxXeUBVC8RqMdS2wviET3CSEelcuuzRTgdpNFyE5
	gtqw==
X-Received: by 10.66.246.229 with SMTP id xz5mr4999359pac.128.1377706352718;
	Wed, 28 Aug 2013 09:12:32 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id oj6sm34813047pab.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 09:12:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2013 09:12:22 -0700
Message-Id: <1377706342-15547-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] gtk+3: don't split immodules if we have none
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
X-List-Received-Date: Wed, 28 Aug 2013 16:12:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

Currently we don't enable any immodules for gtk+3, yet we unconditionally call
do_split_packages on a nonexistent path. This results in a return value of
None, which it then tries to join, resulting in a TypeError. Only split the
modules if we have any modules to split.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index f4d5254..204a425 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -94,7 +94,8 @@ python populate_packages_prepend () {
     immodules_root = os.path.join(gtk_libdir, 'immodules')
     printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
-    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
+    if os.path.exists(os.path.join(d.getVar('D', True), immodules_root)):
+        d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES', 1)):
-- 
1.8.3.4


