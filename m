Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CDB537804E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:59:18 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s66so11557453pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 21:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TkH97Rs0kJdDKrSAQTSYP0F5SrGCXMcHNIFp+Jq3ve8=;
	b=isPHxPACJGrCmq9NxXxiGKLtQGR8Zc+EraNZ1oYikOmMyIERVYA+3WZIC5L1c0kxuc
	yqxYgfLmY4WvEPYj1kgF5wjbPSxJwwsbZ7bNdXhsDyi8s4mRhxiIeLlMUqiFgtBpiC0l
	89p3UOyg40oSUxgkrsOb7KQekXiD2Ab9c/2ARpHUD/29+3ojk7ip0bn4DSe5kRg82iOl
	gvh9ODkDtD09UwQfulBGnJl0kqKXSaQvpbsxadwwt9sfdY9nDVzwdc3VJZXzCV0vIwy8
	KbOXSN9vu8o5a9AxCsDChB1mu3JRcjEiQ9oAxcSy7h0lDlgfmv24cbVvvygPLi8Ehi5z
	PZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TkH97Rs0kJdDKrSAQTSYP0F5SrGCXMcHNIFp+Jq3ve8=;
	b=hO5kAi7bAdlB0PURVyh3SSK9H/XA9Nb42ju7AoEDWPaU1mrXAP/0UmFk269ES/01PX
	URim/diBm4+5Mg5cI/Rr0ukCCrAoRv6sMo4Y81BkwhoYFZuS9c/XiVcN3aHLmpthlF2n
	LZLHS6E7hqOLRLTtrz1yIdaHnmxg8Sk6ao0iejZRSw6Lhp9glNZw3WovVgc7J2P2ImUS
	Maevkq3OT+goxp/j7brfscXxgYrB3lo0vD40ar54j/9HiQn56CQhZEayMMsVweJDUtsJ
	6zkBCfPZI7gxy94b99Et3fSQ/UXSxYc1xLHazpJalfufsOglQ0pwcEEvjBxq5BzfYKdj
	jcNg==
X-Gm-Message-State: AKS2vOzd/rHfObvRyOFf8Cf1j2qQ2SXqReaYnuYP57HPJ7S3kZHdF+G4
	R5QOsIzEJkVbHqhB
X-Received: by 10.99.137.66 with SMTP id v63mr13707796pgd.182.1498712359501;
	Wed, 28 Jun 2017 21:59:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm1831468pfl.41.2017.06.28.21.59.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 21:59:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 21:59:05 -0700
Message-Id: <5a367721dfebd18243bbfed620ee6c6c12f087ff.1498712182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498712182.git.raj.khem@gmail.com>
References: <cover.1498712182.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] epiphany: Fix build errors when compiling with security flags
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
X-List-Received-Date: Thu, 29 Jun 2017 04:59:19 -0000

We need to have some level of optimization level for FORTIFY_SOURCE
to work therefore set --enable-debug=no

Add a patch to fix build error due to unused result of fread

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb     |  6 ++--
 ...bookmarks-Check-for-return-value-of-fread.patch | 32 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
index 77c19331cb..dafad8a793 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
@@ -9,11 +9,13 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
+SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch \
+            file://0001-bookmarks-Check-for-return-value-of-fread.patch \
+           "
 SRC_URI[archive.md5sum] = "e035dc6f64f0c1909de823e03f16b2f3"
 SRC_URI[archive.sha256sum] = "5abc0d0c60591df5236ac9b8979dc9f7d9acbb8ad0902b4772d2b7beea81c58d"
 
-EXTRA_OECONF += " --with-distributor-name=${DISTRO}"
+EXTRA_OECONF += " --with-distributor-name=${DISTRO} --enable-debug=no"
 
 do_configure_prepend() {
     sed -i -e s:help::g ${S}/Makefile.am
diff --git a/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch b/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
new file mode 100644
index 0000000000..ddcd39400c
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
@@ -0,0 +1,32 @@
+From aa2176be32eed2578da82f34d31148f934c11c34 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jun 2017 17:03:45 -0700
+Subject: [PATCH] bookmarks: Check for return value of fread()
+
+Fixes below compiler error
+ignoring return value of 'fread', declared with attribute warn_unused_result
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bookmarks/ephy-bookmark.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/bookmarks/ephy-bookmark.c b/src/bookmarks/ephy-bookmark.c
+index ff0239b..8633ce4 100644
+--- a/src/bookmarks/ephy-bookmark.c
++++ b/src/bookmarks/ephy-bookmark.c
+@@ -217,7 +217,8 @@ ephy_bookmark_init (EphyBookmark *self)
+   bytes = g_malloc (num_bytes);
+ 
+   fp = fopen ("/dev/urandom", "r");
+-  fread (bytes, sizeof (guint8), num_bytes, fp);
++  if (fread (bytes, sizeof (guint8), num_bytes, fp) != num_bytes)
++    g_warning("Unable to read data from /dev/urandom\n");
+ 
+   self->id = g_malloc0 (ID_LEN + 1);
+   for (gsize i = 0; i < num_bytes; i++) {
+-- 
+2.13.2
+
-- 
2.13.2


