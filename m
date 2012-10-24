Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQwBy-0001an-1Q
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 10:19:58 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3964882wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=IrKGADr505bkuZp/yI/5or+dZu1OJ5FkZqVrlYQvtqI=;
	b=B0w9YDpXE/Ww0f/MbjvWL8xXNkDgWsj8OeYasSZP0uCuJILj8l0W8IZefVHIuwEW5B
	SfO7ZzH1f7q+R4mrNEZV83KvJvaA7WXbEZ53JxO66EBXCMwJocS3Onj7u91v24BGvrhv
	qO+D94DoaQ22ADc/RNZBw4yBPT+Az4CyZexHK4/974UVfak6QcH/1eh792w31h9I2m9l
	aX13zeeGDXcHLmeFw4upprXwitMtWtADisMVUWXLuQTNpHSzxyQeWfsUNZuMg60Fu2IU
	nVGP5+dfqvzGbYGT5hv2Id5JdnBUQPHNBpdd7LN9IpRsN0WedH/lKE1gTmu/e9ZDd0D5
	1XdA==
Received: by 10.180.94.102 with SMTP id db6mr3866538wib.20.1351065993168;
	Wed, 24 Oct 2012 01:06:33 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id ei1sm3534677wid.7.2012.10.24.01.06.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 01:06:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 10:05:17 +0200
Message-Id: <1351065917-14779-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
References: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V3 4/4] sato-icon-theme: merge sato-icon-theme.inc into recipe
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
X-List-Received-Date: Wed, 24 Oct 2012 08:19:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nothing else needs sato-icon-theme.inc

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../sato-icon-theme/sato-icon-theme.inc            |   24 -------------------
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |   25 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
deleted file mode 100644
index e014a7d..0000000
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Sato Icon Theme"
-HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.openedhand.com/"
-
-LICENSE = "CC-BY-SA-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
-
-SECTION = "x11"
-DEPENDS = ""
-
-inherit autotools pkgconfig allarch gtk-icon-cache perlnative
-
-FILES_${PN} += "${datadir}"
-
-EXTRA_OECONF += "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('sato-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
-
-# Explictly setting "Sato" as the default icon theme to avoid flickering from
-# the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
-pkg_postinst_${PN} () {
-    mkdir -p $D/etc/gtk-2.0
-
-    grep -s -q -e ^gtk-icon-theme-name.*\"Sato\" $D/etc/gtk-2.0/gtkrc || \
-        echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
-}
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index ead2f7d..cb3b68c 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -1,12 +1,33 @@
-require sato-icon-theme.inc
+DESCRIPTION = "Sato Icon Theme"
+HOMEPAGE = "http://www.o-hand.com"
+BUGTRACKER = "http://bugzilla.openedhand.com/"
 
-DEPENDS += "icon-naming-utils-native libxml-simple-perl-native"
+LICENSE = "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
+SECTION = "x11"
 
 PR = "r6"
 
+DEPENDS = "icon-naming-utils-native libxml-simple-perl-native"
+
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch \
            file://0001-Inherit-the-GNOME-icon-theme.patch"
 
 SRC_URI[md5sum] = "86a847f3128a43a9cf23b7029a656f50"
 SRC_URI[sha256sum] = "0b0a2807a6a96918ac799a86094ec3e8e2c892be0fd679a4232c2a77f2f61732"
+
+inherit autotools pkgconfig allarch gtk-icon-cache perlnative
+
+FILES_${PN} += "${datadir}"
+
+EXTRA_OECONF += "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('sato-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
+
+# Explictly setting "Sato" as the default icon theme to avoid flickering from
+# the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
+pkg_postinst_${PN} () {
+    mkdir -p $D/etc/gtk-2.0
+
+    grep -s -q -e ^gtk-icon-theme-name.*\"Sato\" $D/etc/gtk-2.0/gtkrc || \
+        echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
+}
-- 
1.7.6.5



