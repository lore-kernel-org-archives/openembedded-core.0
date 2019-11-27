Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 66B667FC94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:16 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b11so7778262wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UQQ+ktMG3+feDVwhH3dIY91PbFkI3ddQxW0M18BavEc=;
	b=Ftmb69mk/CStyViogrj7ookl3pWOOyLPxHQ+sIW7sAIeFipjBYYkW70GOm3VAqzkwk
	XpSJtYbtHGFBTSoCaxDLir5MCXURKgWpedpylZYnGUMnvXbs9zlrjlIHjJ37fpyWZBO7
	u7I8wVKEPMAMGxayxBkjxdcvXtgiiBT2UGwHQ2VSGXbMTwmSm4wBD9rogNhwQsylKFaX
	3xkMy55Z1X2Efc7vs8jMGfCR5AkPlTpCTzws/xvCt0jcqPwSNDmLJS5QtHK38rF6wvE/
	Q+yT6xkPGARxi5TRTOgdsIvGABYvrM2byIkwRrjbwI/000n2Uk3ogLHf0OR2fICFhj9t
	dRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UQQ+ktMG3+feDVwhH3dIY91PbFkI3ddQxW0M18BavEc=;
	b=JF+MrBvt01TKfWA/dxOs8eq3oMBrCkcgiEgVUuk99ozurAwozY2jtBKm2jl8I83egC
	iIBkDx0nsCZuw+IZ20LNgXun0dC/mtHM+ckO2KdpQ+YY9zWBeg8Bq2ocSGYw/ajCrytD
	iVdNfu+3nBoBD/+MIWAr2B3PZAzh7O/IYqXXurxEb4i6TLE4DeqX9GB4RjeCfoOLBkP2
	A5zA+wem+Qj4KyxOmFL3NFGJbasuFrsTZOw7PfpCVTo3HXJsbrPsePkRpvlCXir9Z7Vf
	XPV9afG8LJMrKhE7uBzjCBCeVq12WF4Iu3MhsU+2e846tCzUh/btKr2Ge7jV9gNW/ynD
	jbGw==
X-Gm-Message-State: APjAAAXLjyeSYpK/V+LmjWAVtEpSOlaVRCIF7HtzR8uARWWIn7Q1PCfJ
	OQdCUgO0IkpLRTVU2G1Y5HdGiNVx
X-Google-Smtp-Source: APXvYqxKbh+7A1XBLoKNLqnjSQISSgA9bbuyXc/cctgjZv09IBmNu52JiC48z0fRiUyO8jFLx8XuLw==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr5610247wmk.150.1574872816766; 
	Wed, 27 Nov 2019 08:40:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:39:58 +0100
Message-Id: <20191127164003.115980-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/14] lrzsz: fix issues with newer versions of gettext
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:17 -0000

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


