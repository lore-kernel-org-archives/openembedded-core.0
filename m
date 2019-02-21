Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 21D687CA9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 22:18:46 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id e5so95540plb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 14:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6md6lrUSewvLTsKZBe+/Os50uDjq6PJCpeOiKQPP+NE=;
	b=PQX3PGcobKtimvuozCtrJfrkIm4nDthHC19/z30Ea/tnZVw6VUk7cjafrTpLzOH23p
	wCj/Bg2PiFLIR331Gdzn76GBFP9J/in6rJn15LPGDNkWSTvJDI+QWEytbII2QsYdBEI/
	HnDgAa3CVX6Ph/15Ld4+qCjR6/CsdLmrCChvQI23v9vjeibRpKeJj2QObD2bptdtHoZm
	7PKojo9JBuMeAW3+Ebfbhr+qW+xltrjafevkXxLrchkIkqmturw4Z9fcloYsWdM2Ym3S
	+1HGbG/JJzeMblOGkYeY0K3exOnFmHhk1NQ15Z44M2f/unNw05hrRXOy9vFWHo4dqFlt
	sXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6md6lrUSewvLTsKZBe+/Os50uDjq6PJCpeOiKQPP+NE=;
	b=tTmFdRM0LwxybBbQFHnQIn0Ol3bTeR8G+fxz8lVHwX5o9NfPYLCkBQoJ/FvMvCksl0
	X7q5DPXwQbAJGRHgglersenhQvn4A6kXk1bTNIxRTZ5cO8FfZUkiabceoEf7xbhEL9wW
	SiJcvwZ1XaPtcI0+O49CfgIf68iCsVLKv6NtHB24sWdgVYQZI0Q9JPFJsgEUf6ffu9j9
	62+bOMYQAI4sLhp6D2s1Wf39/Rz1dg4p9e8adedJ8M/IQRD0cHnxU9kHKsS5PMIL4irg
	s1AXMw9WGepctodrpXy+Nx8QIWUykmF2ENAGUvGWHtX88xhqfjDWNBLZCRPdYLKugoUz
	L8/Q==
X-Gm-Message-State: AHQUAuY8+yd8u1S+eLyhS/gsdOVe+x9jzADOEnafedbuIu2t5srlTgVP
	/p65vbVFIOt+petfsXQGmatR+cSk
X-Google-Smtp-Source: AHgI3IZZ5rUIUCOBkX43bqUging5OGsufP9d+MvXcD42iuCZjNNktMT3fOOSkNIslJaPSpSVznmkWg==
X-Received: by 2002:a17:902:108a:: with SMTP id
	c10mr826340pla.131.1550787526683; 
	Thu, 21 Feb 2019 14:18:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::27a8])
	by smtp.gmail.com with ESMTPSA id g6sm51815pgq.18.2019.02.21.14.18.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 14:18:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 14:18:34 -0800
Message-Id: <20190221221834.37807-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gtk+3: Fix build failure with gold linker
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
X-List-Received-Date: Thu, 21 Feb 2019 22:18:46 -0000
Content-Transfer-Encoding: 8bit

Explicitly link in libfribidi

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gtk+/gtk+3/link_fribidi.patch             | 19 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb       |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch b/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
new file mode 100644
index 0000000000..e4bbd799f1
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
@@ -0,0 +1,19 @@
+Link with libfribidi, this is to avoid under linking where these functions are
+used but the library is not linked in, and they are marked undefined by BFD linker
+but gold linker refuses to link
+
+| ./.libs/libgdk-3.so: error: undefined reference to 'fribidi_get_bidi_type'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+--- a/gdk/Makefile.am
++++ b/gdk/Makefile.am
+@@ -55,6 +55,7 @@ LDADD = 					\
+ 	-version-info $(LT_VERSION_INFO)	\
+ 	-export-dynamic 			\
+ 	-rpath $(libdir) 			\
++	-lfribidi	 			\
+ 	$(no_undefined)
+ 
+ #
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
index 799cbd4707..92c9a3ebfb 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0001-Hardcoded-libtool.patch \
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
+           file://link_fribidi.patch \
           "
 SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
 SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
-- 
2.20.1


