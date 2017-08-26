Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCE17831F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:59:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7QIx6xC024814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:59:06 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 26 Aug 2017 11:59:06 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Aug 2017 14:58:58 -0400
Message-ID: <1503773938-13918-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gnome-themes-standard: drop .la file as unused
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
X-List-Received-Date: Sat, 26 Aug 2017 18:59:09 -0000
Content-Type: text/plain

oe-core commit 51b3ee298635b11d5784caaa0ac1c8f4034c25a5
[gnome-themes-standard: Fix packages so dev-pkgs image generation
works] disabled generation of the -dev pkg. Since a libtool archive
file was no longer being picked up by the -dev pkg the build will fail
with a QA issue (if ERROR_QA includes installed-vs-shipped):

ERROR: gnome-themes-standard-3.22.3-r0 do_package: QA Issue:
gnome-themes-standard: Files/directories were installed but not
shipped in any package:
/usr/lib64/gtk-2.0/2.10.0/engines/libadwaita.la

The libtool archive file is mostly useless in modern Linux with a
single shared library file so instead of including this in the -dev
pkg we simply drop it.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
index 3b41328..55ee277 100644
--- a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
+++ b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
@@ -25,6 +25,9 @@ do_install_append() {
         # Only building Adwaita, remove highcontrast files
         rm -rf ${D}${prefix}/share/themes/HighContrast \
                ${D}${prefix}/share/icons
+
+	# The libtool archive file is unneeded with shared libs on modern Linux
+	rm -rf ${D}${libdir}/gtk-2.0/2.10.0/engines/libadwaita.la
 }
 
 # There could be gnome-theme-highcontrast as well but that requires
-- 
2.7.4


