Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJjfx-0002x6-Qk
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 13:33:10 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2012 04:20:06 -0700
Received: by mail-we0-f175.google.com with SMTP id t44so241371wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 04:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=hH6bmD1+ZcW71RcoKzSpZU9UcNn3DLgqlWzpin1FvEk=;
	b=KkUq8Yzo2/eeWkDgUGm4scLgyc+P+cp+M3SphDX4OJ8GHn26kKsCk1aqSzw3zCPAXU
	mdAIQ9/21gW8Fy9XOmvB/60gfl7rVOsByub40mRT4v4/Y+iview+3BQDZb3Z5HusozRs
	pKXE6Lhi1SbCdKH20Jm02syx3nILDR97ZEAZ1HCG56JJON55mH0GhEDZXDZxM7ntB8aQ
	wn5/E1LyaR7uBO9Vci9qQAx8zw/AKKCzvUF2ZrQ+gtvN0WLOGUPFLidwvZIjP11CXGhZ
	GylO9O/2/ziDfmgO8ZkhyULDXj/I50d4wy4xA+2AbRaBDHu2buufAUnnvyVXhHMEFcZy
	f2NQ==
Received: by 10.180.93.106 with SMTP id ct10mr12211917wib.8.1349349603895;
	Thu, 04 Oct 2012 04:20:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gg4sm14096089wib.6.2012.10.04.04.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 04:20:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 12:19:03 +0100
Message-Id: <1349349543-23599-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm8a5FWodIFXHhIF21hsmdQ/gK70vma1Abnk2MAdSsDWcd9jf+/A3jD5+Ej7VOY52/a+RMW
Subject: [PATCH] sato-icon-theme: use gtk-icon-cache helper class
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
X-List-Received-Date: Thu, 04 Oct 2012 11:33:10 -0000

Instead of explicitly updating the icon cache use the helper class that also
forces a loader update at the same time.  This eliminates the possibility of
updating the icon cache without any gdk-pixbuf loaders.

Also check that the Sato icon theme isn't already set to avoid appending to the
file every time the postinst runs.

[YOCTO #2399]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc   |   15 +++++++--------
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb            |    2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index 9fd1012..0bd4814 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -8,18 +8,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
 SECTION = "x11"
 DEPENDS = ""
 
-inherit autotools pkgconfig allarch
+inherit autotools pkgconfig allarch gtk-icon-cache
 
 FILES_${PN} += "${datadir}"
 
 EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
 
-#explictly setting "Sato" as default icon theme to avoid icon missing due to
-#tricky race condition
+# Explictly setting "Sato" as the default icon theme to avoid flickering from
+# the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
 pkg_postinst_${PN} () {
-        if [ "x$D" != "x" ]; then
-                exit 1
-        fi
-        gtk-update-icon-cache -q /usr/share/icons/Sato
-        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
+    mkdir -p $D/etc/gtk-2.0
+
+    grep -s -q -e ^gtk-icon-theme-name.*\"Sato\" $D/etc/gtk-2.0/gtkrc || \
+        echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
 }
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index 108f8e8..6405359 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -2,7 +2,7 @@ require sato-icon-theme.inc
 
 DEPENDS += "icon-naming-utils-native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch \
-- 
1.7.10



