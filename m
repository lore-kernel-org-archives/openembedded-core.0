Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFNB9-0002E2-9M
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 12:43:19 +0200
Received: by weyt44 with SMTP id t44so1172783wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=p8on5FuH/GISZVmUNhcGoyTDv8PqC5kZUoV8MSLJVUw=;
	b=lhUN8Ktvb4vmfR5brutXSUyiZGCmRudYNp2+Fct/Yz5R97l9cyHEZnRpT4Uxjsm1SU
	KC51A6QNtSS7oOkGtQLkK/dO4c7C3tdcc4XOHlrZZa6tOfKdC9CZTHsgqzMS1Dm6cN9A
	31w7uri+w47KBOc39s/JONxlwgSu8lQrNCMkCjrnapVFdKHfrLzS24LKSxm1vjTOdWzS
	clcM/RodCP6WnUcCY/DSEWl14sLXG5kcn4Cg40RP4RThqVaakZT0isY75e/VPHUIc838
	lwW8cnjwIUdQUmzGE3FonUaOfqOyyczNaVotKdJPr3FeD0JnJzwdKlktqvfRUpaDpxR+
	LM/w==
Received: by 10.216.66.7 with SMTP id g7mr4520583wed.146.1348309834234;
	Sat, 22 Sep 2012 03:30:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm3261136wid.1.2012.09.22.03.30.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 03:30:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 12:30:32 +0200
Message-Id: <1348309833-13334-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH] qemu-native: fix build on hosts without libX11 installed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 10:43:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_1.2.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
index 7091f6d..191ee48 100644
--- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
 SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI_append_virtclass-nativesdk = "\
     file://relocatable_sdk.patch \
@@ -29,4 +29,8 @@ do_configure_prepend_virtclass-nativesdk() {
 		sed -i 's/-lX11//g' Makefile.target
 	fi
 }
+do_configure_prepend_virtclass-native() {
+	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
+	sed -i 's/-lX11//g' Makefile.target
+}
 
-- 
1.7.12



