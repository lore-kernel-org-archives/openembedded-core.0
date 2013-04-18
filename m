Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1USpWU-0001Js-BM
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:09:19 +0200
Received: by mail-ea0-f172.google.com with SMTP id g14so221744eak.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 06:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=JL4jVQsOfpHOFtLKLiZmDTwe15EKs9fudQueWRGNuh8=;
	b=h6GKndEbpumKgngSIbSMCkNGTy7wCqF7g+Dt55VtwCvHbVhvnf/CWo9Q+9vDl75xYT
	ke1RSpXhtlDS+//64Dmni7doom94P4t1CqlOXCY4Q8RTLeNbitH5yLLXry3HgptgEfh5
	vN4ayZXDShql+ajwFsc7lPouWr0cWLYVrEuWEFd0anPbPEurAwglabNDLg3iNZB0ygeR
	4f93pfsFGCn4TvXh3Yscb2+zE9Kwrbgg01w68zIJjZIa/K2NRjRTKWD+PjVZ4kzA1Xvs
	f2eyxrmTGeHELWU4V2KCmbwdzwcyFXPwQdp4AAJ4VxaqTSMJjUYXB5zsTzX2eljzeMct
	kvYA==
X-Received: by 10.14.107.69 with SMTP id n45mr30381869eeg.23.1366293101081;
	Thu, 18 Apr 2013 06:51:41 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm16030946eei.4.2013.04.18.06.51.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 06:51:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 15:51:30 +0200
Message-Id: <1366293090-31353-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQm3yIOw9penO5ukD/VPMul1HLOW+8Q1YNsxRTSsICk+09lVrkq8xUk4nmekthL2Phw88uGe
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gnome-icon-theme: add missing icon-cache inherit
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
X-List-Received-Date: Thu, 18 Apr 2013 14:09:30 -0000

When installing this manually the icon cache won't get refreshed.

Rearrange recipe to comply the the styleguide as well.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index ab541ed..920ee4f 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -1,17 +1,16 @@
 DESCRIPTION = "GNOME 2 default icon themes"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/gnome"
 
 LICENSE = "LGPLv3+ | CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7e289d90fc8bdceed5e3f142f98229e"
 
-SECTION = "x11/gnome"
+PR = "r5"
+
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
-RDEPENDS_${PN} = "hicolor-icon-theme"
-RRECOMMENDS_${PN} = "librsvg-gtk"
-PR = "r4"
 
-FILES_${PN} += "${datadir}/*"
+inherit autotools perlnative gtk-icon-cache
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
            file://iconpath-option.patch"
@@ -21,4 +20,5 @@ SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a
 
 EXTRA_OECONF = "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
 
-inherit autotools perlnative
+FILES_${PN} += "${datadir}/*"
+RRECOMMENDS_${PN} += "librsvg-gtk"
-- 
1.8.1.4



