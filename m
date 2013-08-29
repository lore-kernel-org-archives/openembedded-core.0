Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id BA67D6BEC1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:29:11 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so674424pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ftcF4kUFHxHAyfu65f5VBENRH12srpNzzYKNX46tffE=;
	b=sVtBtTi5pCJAal9Y1mco3ESAL2MOQta1JWbKZinMUkOwb2P2oNuVTvAoNUAzXeoS6a
	y6XgE4dPFDYDf69K9EG/LhaqO1c06hqa8A8mKyZd6KHkxfA9BKRsztnIrPbEp8OSzeqp
	3REUkLgBfNHw9BdP9AEAp2LI4c5kvtpjPvcCXWPSPELVRAnEtHzZVDhNhs9DdylXz4+5
	t++MCvNuWp1lOWkxrkKDyHjcrUdPt8mM23VBcT2kFMssTbOTQPzamjp1iyzp1lknymKS
	O3UFK+Dw6mhE4ppfR4fCudD4/FxWUg1d0X9fFCY6MiSjb6zQn/5s6eFp1QXK3+r/qokP
	f7jw==
X-Received: by 10.66.230.233 with SMTP id tb9mr5538331pac.38.1377793752801;
	Thu, 29 Aug 2013 09:29:12 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id oj6sm41942127pab.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:29:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 09:28:55 -0700
Message-Id: <1377793736-7995-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] gtk+3: only set GTKIMMODULES_PACKAGES if we have immodules
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
X-List-Received-Date: Thu, 29 Aug 2013 16:29:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index f4d5254..e769ca5 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -94,7 +94,10 @@ python populate_packages_prepend () {
     immodules_root = os.path.join(gtk_libdir, 'immodules')
     printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
-    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
+    immodules = do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')
+    if immodules:
+        d.setVar("GTKIMMODULES_PACKAGES", " ".join(immodules))
+
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
     if (d.getVar('DEBIAN_NAMES', 1)):
-- 
1.8.3.4


