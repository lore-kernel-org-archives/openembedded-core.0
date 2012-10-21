Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPxqw-0003Rz-67
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 17:54:14 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1416024wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 08:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=sALTb3DjfIowKhVtECcJKjVdbV83HGf/K5n6lboKOuA=;
	b=VtP1wWcP9EM/ht8Brc6RArb1sEgQ4uCmoucfMjfvsq3d6htXAJBxpgvv43m5d7374v
	4n22BVLj7grZsve9Pl2w5cGWZihSyzDKG9NVmfLsYEYKSdQdtkoVIbxQRK8LFOhc13NS
	rC7X1vXJ2Gbq7gkEoSI15EkcpPIJK1uOUUBEiuMzNjxd96ASsr5ylOmRGYLjVva/Y4ze
	UZ+/GtY0G3B+4tdtpnyx6eoqVyCdO5nddiiTRLH5Bzg6yPYKv8XFfnRwigVVmPvVcGvS
	L484WOouYy6wu9ov+JcEIygDmrj2s6+o4FHFPPEAqqoOBGZEOeeUqYexdHUjOvXpPuw5
	sJUw==
Received: by 10.216.213.28 with SMTP id z28mr4308196weo.47.1350834052967;
	Sun, 21 Oct 2012 08:40:52 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id j8sm46423462wiy.9.2012.10.21.08.40.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Oct 2012 08:40:52 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 18:40:40 +0300
Message-Id: <1f862ff3b195e8fda9f58bc3a5e5bd083bca3944.1350833713.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
References: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
In-Reply-To: <cover.1350833713.git.andrei@gherzan.ro>
References: <cover.1350833713.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkyzK1f6RVK7YUtHCT/WjXw4frbODcIJVPBbsuSsZXFNQdyBXOFzGHhQNZ9aDnWtbN7wmQc
Subject: [PATCH V2 2/5] opkg: Add patch to fix removing packages with recommends
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
X-List-Received-Date: Sun, 21 Oct 2012 15:54:14 -0000

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



