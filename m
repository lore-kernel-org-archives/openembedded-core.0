Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id BDAF36C13D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:39:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id h18so3693426wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=++2qG7X1fX5sEC8Vv9Yp/40C7BFWzyZwCAWuZyoorNs=;
	b=OG0CigmLDYUJ9FMyFxpQOESHd3NgHlq0NF2m/qFdAHe/hFJO1Z2D+9+bzLkaOMQ6+P
	m762cykX3cu8svZkzASgMWTIKOp7Ay2oX89J5C/p6+AX7YPcuDXmoeBtpSbbqFgvnsKC
	NDp20nammbMNnCOVwexiEgYkstUtgtdkRPpTzubXDb1gg9ij/oTEdrL71SyFuEy8Z1uy
	izWiWNLW0yOcaAY4J1LoIDhFmE0rXgAC97+nTWyz7xWtVLYjVduk1dyyZtX83VBstlKC
	Yox0j8Jmc1BVf3kdORLUZdEzK2KSQza/fEWXB8aFqLdJzLcZIaPNm/82gerKpFFbZsOJ
	3DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=++2qG7X1fX5sEC8Vv9Yp/40C7BFWzyZwCAWuZyoorNs=;
	b=XN5One9KDlVZCtJOyqesm9zlIpyfBn4XR5TqAFZHJHfXGVm4FHkm9abP7B/+/0kdZS
	m4c/a8Am87/HzmYGT+qU/4F8+zrIrctLhyvwOwZS1sCLcvcbAjBgbvhYJ+2J5C3lY+LM
	yNajEwJUL7UcxMH48f3/uOuNX0TBmdrxMYr6dF3PCJMBLCmbjNP8n0UfBtVqL7FkxC0J
	d88shfEXtyRMpWexiCQOq4sY8JFJO5Hgubw9HZVVsIJHTeXMJtArGKjbLNMX0Nw9CAV5
	mePPHoT1+qzFZYQBAWQ3Ad3DCBwSa8PuNsuTlPMKQiERWMtoAMoMPRDpxH1Mh7P7Z6gA
	8qjg==
X-Gm-Message-State: APjAAAVSr9/PvOkzGnJaYIcMD1MtvBwArzaN6PIChu4r0xOKKJXlThw/
	pGcTKyHct+f8wK0VWIqrBPYbPozG
X-Google-Smtp-Source: APXvYqwUv9tYaqK4KouJjk/anMHV4eyj/MrjW+QhLZe0jO96U/PW8Myvqr5OVR0zGlrC34qUCPQKUQ==
X-Received: by 2002:a1c:e188:: with SMTP id y130mr30259522wmg.83.1555508396084;
	Wed, 17 Apr 2019 06:39:56 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	z140sm5105630wmc.27.2019.04.17.06.39.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Apr 2019 06:39:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 15:39:41 +0200
Message-Id: <20190417133941.31087-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][thud] adwaita-icon-theme: do not delete symbolic svg but pack them in ${PN}-symbolic
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
X-List-Received-Date: Wed, 17 Apr 2019 13:39:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes:
* gtk-icon-browser: for symbolic view almost all icons were missing
* xfce's thunar: 'home' and 'up' icons were missing. Had a long discussion with
  XFCE-people [1] and asked here [2].

How could I overlook the most obvious...

[1] https://bugzilla.xfce.org/show_bug.cgi?id=14443
[2] http://lists.openembedded.org/pipermail/openembedded-core/2018-November/275815.html

(From OE-Core rev: 0911e7d2f5443210b594a198ada8465af7a2fc78)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
index 40dd35ba30..6e453a0163 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.28.0.bb
@@ -18,13 +18,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "b25b2d82cbebf2cc9cd469457b604f2c"
 SRC_URI[sha256sum] = "7aae8c1dffd6772fd1a21a3d365a0ea28b7c3988bdbbeafbf8742cda68242150"
 
-do_install_append() {
-	# Build uses gtk-encode-symbolic-svg to create png versions:
-        # no need to store the svgs anymore.
-	rm -f ${D}${prefix}/share/icons/Adwaita/scalable/*/*-symbolic.svg \
-	      ${D}${prefix}/share/icons/Adwaita/scalable/*/*-symbolic-rtl.svg
-}
-
 PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
 
 RREPLACES_${PN} = "gnome-icon-theme"
@@ -37,7 +30,8 @@ FILES_${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.p
                               ${prefix}/share/icons/Adwaita/48x48/*/*.symbolic.png \
                               ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
 FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
-                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png"
+                        ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png \
+                        ${prefix}/share/icons/Adwaita/scalable/*/*-symbolic*.svg"
 FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
                      ${prefix}/share/icons/Adwaita/512x512/"
 FILES_${PN} = "${prefix}/share/icons/Adwaita/ \
-- 
2.20.1


