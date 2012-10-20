Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPh3q-0002YH-QW
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 23:58:26 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so1160260wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2012 14:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=sALTb3DjfIowKhVtECcJKjVdbV83HGf/K5n6lboKOuA=;
	b=hz8fcN2jpebbQRM3m1EWe6SOymydEp/LHY/gcijRC5fy8/qtsg4sVDFqBwfqu8Ksw+
	fF1AsBhqK7g6AXuMf086sH812DK7AXQkQXN/8mCwAJmZbyKbrxzhMTd0L/yWfludDX6J
	zqTEt4wJjjkxALhF5ZuMPMSJC7yEjOUXGj1/F4+EcCRGsQ713pEiGR1ByvhRDdcxUqDL
	P58t8DiKTideGfgfWM71S04uuaEAQ9uEeX1+1ky9i0r0xAXpy97VMSsUviYj6rU/KkTt
	pHjCTfEkQGTSyIwawFgOLhGq1g+E0Ccyz7XIjw2Q6nqN0nHkYlvjqQds09dAq85L54zD
	KC/Q==
Received: by 10.180.103.38 with SMTP id ft6mr11314902wib.9.1350769506589;
	Sat, 20 Oct 2012 14:45:06 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id ei1sm11996502wid.7.2012.10.20.14.45.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 20 Oct 2012 14:45:06 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 00:44:55 +0300
Message-Id: <1f862ff3b195e8fda9f58bc3a5e5bd083bca3944.1350769062.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350769062.git.andrei@gherzan.ro>
References: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350769062.git.andrei@gherzan.ro>
In-Reply-To: <cover.1350769062.git.andrei@gherzan.ro>
References: <cover.1350769062.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlecTfkKSU9Zv9Trd1RomhdJSpa5ViZ3wow+2y6Cj2pMh9T0sii1/G3EWRuTHsqpAgkrIcc
Subject: [PATCH 2/4] opkg: Add patch to fix removing packages with recommends
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
X-List-Received-Date: Sat, 20 Oct 2012 21:58:26 -0000

While removing a package with opkg, the process shouldn't be blocked if
another package RECOMMENDS the package wanted to be removed. This is
because, while generating the dependencies, opkg adds dependencies to
depended_upon_by even if dependency's type is RECOMMEND. The fix is to
skip dependencies of type RECOMMEND while constructing depended_upon_by.

[YOCTO: #2431]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 ...t-add-recommends-pkgs-to-depended-upon-by.patch |   26 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch

diff --git a/meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch b/meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
new file mode 100644
index 0000000..e581dc0
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
@@ -0,0 +1,26 @@
+While removing a package with opkg, the process shouldn't be blocked if
+another package RECOMMENDS the package wanted to be removed. This is
+because, while generating the dependencies, opkg adds dependencies to
+depended_upon_by even if dependency's type is RECOMMEND. The fix is to
+skip dependencies of type RECOMMEND while constructing depended_upon_by.
+
+Bug info:
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=2431
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: trunk/libopkg/pkg_depends.c
+===================================================================
+--- trunk.orig/libopkg/pkg_depends.c	2011-09-03 05:54:56.000000000 +0300
++++ trunk/libopkg/pkg_depends.c	2012-10-20 22:23:03.783573202 +0300
+@@ -785,8 +785,7 @@
+ 	for (i = 0; i < count; i++) {
+ 		depends = &pkg->depends[i];
+ 		if (depends->type != PREDEPEND
+-		    && depends->type != DEPEND
+-		    && depends->type != RECOMMEND)
++		    && depends->type != DEPEND)
+ 			continue;
+ 		for (j = 0; j < depends->possibility_count; j++) {
+ 			ab_depend = depends->possibilities[j]->pkg;
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 4e83cfb..3a90677 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -12,6 +12,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
   file://0009-pkg_depends-fix-version-constraints.patch \
   file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
   file://opkg-no-sync-offline.patch \
+  file://don-t-add-recommends-pkgs-to-depended-upon-by.patch \
 "
 
 S = "${WORKDIR}/trunk"
-- 
1.7.9.5



