Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE467FA3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:12:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id n1so35166604wra.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UQQ+ktMG3+feDVwhH3dIY91PbFkI3ddQxW0M18BavEc=;
	b=FOVTST6qxvyiAO1/CI1MhIs4VY/+q8zZS/ROIz0EpLCaoFcUyhwuFNCQ1nUvTnxyWX
	dcuARX6lvu+a55BksnxsV0pkQB3dlNfKs163shCKmzGhNRjpBnrgjRlec7M3fSXRwvXz
	yms2gv8fq9GWbCMOYIsdNhCKWP7wv1DK8Ad2l9oMqRbUOaQRdFEYpXec7nA2KI4k1Fvk
	Q9O3xhOI/zBE+nDdSo5tap+n23wmINebeu0V6GL1myPk0jPRn2veytfc9g0pcig016aU
	oy60A7U3D2cW5DJApr6fwfWOfOwtJl4Eb9w/ffwAnPVBqDkA5A6WSWP4uDPM/PtMIKOi
	BxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UQQ+ktMG3+feDVwhH3dIY91PbFkI3ddQxW0M18BavEc=;
	b=HiK0hcxeTaBQFYvv2cgFCa/N9+aKmUN9pz7XxA34cpxk1eIU4s3RFC1nVrGS5VzWLQ
	APidAQr/5NWz35blrKOiucLWgYN3zms13atFwTRus//Bds1vOuE+KE2m1Mfymk5qKHPJ
	8ognUNh6Z6PAg7TQ9bmdLUAmwpZ1vjN26XeMdRRvMG/qQ92J9N+wI/9vy4zFG7yzPSTe
	TcVzRaYf62kQqezqUA2kSqD+hKoTkwzek8n+8Z3LHEEWD2l0ch5bw+YcwWWS4D3DNMkN
	TDQcGiBD2/vEsJH7KdFVOSO+/pmECJtbnoO+mKUn44Mk9TzYkBYcv1vhRcRoWozshO/9
	lhmQ==
X-Gm-Message-State: APjAAAVrZ5pMnr6Mqj+VfqZ0t6u1eCVL+XheALf06MA/Js42sdl5d2i3
	2UVLan1tThjIDxQzAiogQCMgn/TT
X-Google-Smtp-Source: APXvYqxL/P3gfjDEZi9CTEsPNMXFoRHSUhfA1y6P45TtzQoL4Jn/lkscLPZ7Yigj0jkTQJcz9Z2dcg==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr1728578wrr.32.1575033129578;
	Fri, 29 Nov 2019 05:12:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v17sm637224wrt.91.2019.11.29.05.12.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 05:12:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 14:11:43 +0100
Message-Id: <20191129131152.128311-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/15] lrzsz: fix issues with newer versions of gettext
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
X-List-Received-Date: Fri, 29 Nov 2019 13:12:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-issues-with-recent-gettext-versions.patch | 42 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       | 11 ++---
 2 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch
new file mode 100644
index 00000000000..c8a05f3818b
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0009-Fix-issues-with-recent-gettext-versions.patch
@@ -0,0 +1,42 @@
+From 245c104267363c13f2ba83eca4409c673ee99fcf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 21 Nov 2019 12:34:56 +0100
+Subject: [PATCH] Fix issues with recent gettext versions
+
+[external] is required by recent gettext versions,
+USE_INCLUDED_LIBINTL is no longer defined by the gettext m4
+macro and was never documented anyway.
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.in     | 2 +-
+ intl/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index aa20263..4bde433 100644
+--- a/configure.in
++++ b/configure.in
+@@ -256,7 +256,7 @@ AC_SUBST(CFLAGS)
+ AC_SUBST(LDFLAGS)
+ AC_SUBST(LIBS)
+ 
+-AM_GNU_GETTEXT
++AM_GNU_GETTEXT([external])
+ 
+ AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME",[locale directory])
+ 
+diff --git a/intl/Makefile.in b/intl/Makefile.in
+index bbac1d5..7629a94 100644
+--- a/intl/Makefile.in
++++ b/intl/Makefile.in
+@@ -138,7 +138,7 @@ libgnuintl.h.msvc-static libgnuintl.h.msvc-shared README.woe32 Makefile.msvc
+ DISTFILES.obsolete = xopen-msg.sed linux-msg.sed po2tbl.sed.in cat-compat.c \
+ COPYING.LIB-2 gettext.h libgettext.h plural-eval.c libgnuintl.h
+ 
+-all: all-@USE_INCLUDED_LIBINTL@
++all: all-no-no
+ all-yes: libintl.$la libintl.h charset.alias ref-add.sed ref-del.sed
+ all-no: all-no-@BUILD_INCLUDED_LIBINTL@
+ all-no-yes: libgnuintl.$la
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 34556b2c294..47962bcfffc 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -13,14 +13,15 @@ DEPENDS = ""
 PR = "r6"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
-	   file://autotools.patch \
-	   file://makefile.patch \
-	   file://gettext.patch \
-	   file://acdefine.patch \
-	   file://lrzsz_fix_for_automake-1.12.patch \
+           file://autotools.patch \
+           file://makefile.patch \
+           file://gettext.patch \
+           file://acdefine.patch \
+           file://lrzsz_fix_for_automake-1.12.patch \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
            file://include.patch \
+           file://0009-Fix-issues-with-recent-gettext-versions.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.17.1


