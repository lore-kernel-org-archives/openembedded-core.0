Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QPpys-0002pl-Sc
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 07:53:07 +0200
Received: by pxi6 with SMTP id 6so1112131pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=n9HLEG5XeAR6ZpbSugyL5TIr+lFbRgB/AOZNl3HvMBg=;
	b=Q7DcCoNZ53VDmiGhFK3H7k42wemyljofLG1SqdJyN+SK5LVLH9mHIaD/YAOy4sGfot
	IkVpwkWcOQd/MBdwETgwbnIeDCxgL0g2QWnSVPF8Dq6keBvyOwlWpNGo9VCCGepsuT4r
	q1UZqFzglUIU/iXU5PRZGpj5y2pjuJLS6J8lo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=izz/zHIwaG1NEZEAY8faelw7gCi2y6HO6m7X2vWsj5V4ngxwVr4nOWZ0oSciVxCxbK
	ONxh+7kLLnmYsNFBQGFQdiFW2wJRca2zLYlCf5b/aCAo7c4EKUNpAZjUHzoFN6UUXRSj
	MK+rliA+Y41c00s91FEnrqM4OpRIxNKKokg6I=
Received: by 10.68.36.106 with SMTP id p10mr739742pbj.203.1306475362321;
	Thu, 26 May 2011 22:49:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm237666pbb.34.2011.05.26.22.49.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 22:49:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 22:49:12 -0700
Message-Id: <d3b32060780ab911241307646f8c20bc8c7e6624.1306475241.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <6148af9a1476623e4df7e5965de787c8b73792c0.1306475241.git.raj.khem@gmail.com>
References: <6148af9a1476623e4df7e5965de787c8b73792c0.1306475241.git.raj.khem@gmail.com>
In-Reply-To: <cover.1306475241.git.raj.khem@gmail.com>
References: <cover.1306475241.git.raj.khem@gmail.com>
Cc: Khem Raj <kraj@juniper.net>
Subject: [PATCH 3/3] shared-mime-info_0.90.bb: Fix more parallel build issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 05:53:07 -0000

From: Khem Raj <kraj@juniper.net>

While building for beagleboard with -j4 I ended up failures in
generating and checking xml files. This is a backport from upstream that
fixes the issue.

Signed-off-by: Khem Raj <kraj@juniper.net>
---
 .../files/fix-parallel-build-backport.patch        |   26 ++++++++++++++++++++
 .../shared-mime-info/shared-mime-info_0.90.bb      |    5 ++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch

diff --git a/meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch b/meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch
new file mode 100644
index 0000000..a78e6a8
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch
@@ -0,0 +1,26 @@
+Backport fix for https://bugs.freedesktop.org/show_bug.cgi?id=32127
+
+Upstream-Status: Inappropriate [Backport]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 68e31f61f5e50e5222bc05437d1123e932922796 Mon Sep 17 00:00:00 2001
+From: Samuli Suominen <ssuominen@gentoo.org>
+Date: Mon, 06 Dec 2010 19:46:57 +0000
+Subject: Fix parallel build
+
+https://bugs.freedesktop.org/show_bug.cgi?id=32127
+---
+Index: shared-mime-info-0.90/Makefile.am
+===================================================================
+--- shared-mime-info-0.90.orig/Makefile.am	2011-05-25 15:50:18.000000000 -0700
++++ shared-mime-info-0.90/Makefile.am	2011-05-25 15:50:45.153489305 -0700
+@@ -72,7 +72,7 @@
+ create-pot:
+ 	$(MAKE) -C po shared-mime-info.pot
+ 
+-check: freedesktop.org.xml check-translations
++check: create-pot freedesktop.org.xml check-translations
+ 	if test -n $(XMLLINT) ; then \
+ 		if test -e $(top_builddir)/freedesktop.org.xml; then \
+ 		xmllint --noout --valid $(top_builddir)/freedesktop.org.xml;	\
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
index a806b36..cbbd0fe 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
@@ -1,7 +1,8 @@
 require shared-mime-info.inc
 PR = "r0"
 
-SRC_URI += "file://fix-parallel-build.patch"
-
+SRC_URI += "file://fix-parallel-build.patch \
+            file://fix-parallel-build-backport.patch \
+           "
 SRC_URI[md5sum] = "967d68d3890ba3994cfce3adf5b8f15b"
 SRC_URI[sha256sum] = "52c9f84a8c72de631a0458542980b1728560f59845eb5e93e1dbe825f4b72304"
-- 
1.7.4.1



