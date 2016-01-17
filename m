Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 91B5177118
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:38:04 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id yy13so325933695pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oIoWwLMU16pLOJGvFxTudS++cGB3jmIKfxXcOn268dA=;
	b=p4rW3FeBkuDx97l3qji3M0pQA3c3uD6fI+cLxOpmwlUPcM2Ig7Ncw9XYj7Ar7E9keJ
	MgKlsioZYRk6QmfV9wx4aZPM9W22uWSgRZokus962e4I7P4rubaGbUPOrSwxpGMynowB
	zgmRLEQpr0jnrtPBzGi4hrlxnDLQtRvFuYm9L0bS9ms4ykJbt5IceaOSm71aJjyOwGXi
	bQ6fH2zMfownRBp+ckI5XM/OQgU28SUtZrsEp9zPhMBk8ecbe1bcgICtc8lsTR+Iwxgf
	FgsQ90jNiVAGefGURPCYbhnudN1Io1vxA2tkPgJe+CP6LdxF9KQ4TbU5xEOEKp3l6Vkk
	Uvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oIoWwLMU16pLOJGvFxTudS++cGB3jmIKfxXcOn268dA=;
	b=WP3HofCiYvS6klqoEqFazbY8MPVb7RQf4MxQZweDx3icaA/uhEz1xxXBBylemD9GI4
	dKfBDWvEQOX0Rps4a82/f3DFRsG9b2Os3eILi7ItPM7raYv2y5ezPzEDt3s2M3UW0dhg
	58F4D7gmXgCLGhHnzl0J0wFxdxM50FR0iRwbvq22LrDCA0Hs0tacfs4yYlWC0Zz3Lz9d
	fnNCNwcVjSuB2FTHECXIMF4twlJP4LNd8jplkGYeKwwVXuMkGxaLr2PRqm2L/msZRB87
	qIMqgR/UyBO/EJpiBVB0lDhuthMd08m87ta5hkAsYWlLYPuAzGTOEpd/xZn3uVuGVysX
	CvMw==
X-Gm-Message-State: ALoCoQmlgFCRutTC9xcxyt7r/txl8t3JWWWftJJAurSrSuBFJrREfUARW8TBGwiC2iEKfeuoBeSYHBiJ9tMv38YYBXsoAesXvg==
X-Received: by 10.66.255.97 with SMTP id ap1mr28558999pad.135.1453030686007;
	Sun, 17 Jan 2016 03:38:06 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:38:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:46 -0800
Message-Id: <42693947b7a7e405da3eaa7d1b225ae4b78c932a.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 73/73] glib-2.0: Fix locale location on musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:38:06 -0000

gettext.m4 macro does not detect musl triplets and falls back to
${libdir}/locale

It ends up with lot of packging warning
"files installed but not packaged"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{uclibc.patch => uclibc_musl_translation.patch}  | 20 +++++++++++---------
 meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb        |  2 +-
 meta/recipes-core/glib-2.0/glib.inc                  |  4 ++++
 3 files changed, 16 insertions(+), 10 deletions(-)
 rename meta/recipes-core/glib-2.0/glib-2.0/{uclibc.patch => uclibc_musl_translation.patch} (51%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch b/meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch
similarity index 51%
rename from meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch
rename to meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch
index 2a154fd..7aa6217 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/uclibc.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/uclibc_musl_translation.patch
@@ -5,16 +5,18 @@ based systems therefore lets set DATADIRNAME to "share".
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-Index: glib-2.38.2/m4macros/glib-gettext.m4
+Index: glib-2.46.1/m4macros/glib-gettext.m4
 ===================================================================
---- glib-2.38.2.orig/m4macros/glib-gettext.m4	2013-11-07 07:29:13.000000000 -0800
-+++ glib-2.38.2/m4macros/glib-gettext.m4	2014-03-15 14:51:54.712135644 -0700
-@@ -239,7 +239,7 @@
- 	      [CATOBJEXT=.mo
-                DATADIRNAME=lib])
- 	    ;;
--	    *-*-openbsd*)
-+	    *-*-openbsd* | *-*-linux-uclibc*)
+--- glib-2.46.1.orig/m4macros/glib-gettext.m4
++++ glib-2.46.1/m4macros/glib-gettext.m4
+@@ -243,6 +243,10 @@ msgstr ""
  	    CATOBJEXT=.mo
              DATADIRNAME=share
  	    ;;
++	    *-*-musl* | *-*-linux-uclibc*)
++	    CATOBJEXT=.gmo
++            DATADIRNAME=share
++	    ;;
+ 	    *)
+ 	    CATOBJEXT=.mo
+             DATADIRNAME=lib
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
index 04951f4..937ae65 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://glib-2.0-configure-readlink.patch \
            file://run-ptest \
            file://ptest-paths.patch \
-           file://uclibc.patch \
+           file://uclibc_musl_translation.patch \
            file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
 	   file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 86f7e0e..66082a2 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -73,6 +73,10 @@ do_install_append () {
 	fi
 }
 
+do_install_append_libc-musl () {
+	rm -f ${D}${libdir}/charset.alias
+}
+
 RDEPENDS_${PN}-ptest += "\
             gnome-desktop-testing \
             tzdata \
-- 
2.7.0


