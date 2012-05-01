Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFgT-000130-Er
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:12:33 +0200
Received: by obhx4 with SMTP id x4so5080093obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dksQwSprCIfbX8f0QhgHhFe5/DKmTYxFMG5+uL9F/g4=;
	b=JvMnkHxtQlSHnxYwZ4rsxeF/WCMXLm51amkb4GqZxjKKz+IFI1ry6/tQE+cdzb5SKc
	CGlM3HTC1zcgVuVqLEjA47k+dDPRtjNzZcZ0AuKe/1C9dviHEOAnzGEgEfhe1CaM1HvL
	m055KOclfR9tYyVWmmbSiYbG0cmLs4ojZvSjQu/KnScs2d1pUhx9UcPlYib6i+/L5MZ1
	JyN13RiQ1TtmCu1hknVUDDoq3SPCMG0pScYebAiko+xQMPZ04mFxjTqoV/qAbyYNO/I9
	NB81qbqhqZnGd3o1WKZID5O50hXIXe9N36IrOsM7ocTuSrHr5nyfMGm7+rUHCEhQ2OaO
	HjCw==
Received: by 10.182.74.8 with SMTP id p8mr10729268obv.41.1335888133321;
	Tue, 01 May 2012 09:02:13 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h2sm20758865obn.20.2012.05.01.09.02.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 09:02:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 11:02:41 -0500
Message-Id: <773a41379bdf51c3f644d188f1e1a356f8ecbc85.1335888041.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/6] distcc: use PACKAGECONFIG for x11 distro feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 16:12:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index ec6ffb3..de181e5 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -4,11 +4,15 @@ compilation of C/C++/ObjC code across machines on a network."
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r7"
+PR = "r8"
 
-DEPENDS = "avahi ${GTKDEP}"
-GTKDEP_libc-uclibc = ""
-GTKDEP = "gtk+"
+DEPENDS = "avahi"
+
+GTKCONFIG = "gtk"
+GTKCONFIG_libc-uclibc = ""
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', '${GTKCONFIG}', '', d)}"
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
@@ -28,8 +32,6 @@ inherit autotools pkgconfig update-rc.d
 
 INITSCRIPT_NAME = "distcc"
 
-EXTRA_OECONF = "--with-gtk"
-EXTRA_OECONF_libc-uclibc = "--without-gtk --without-gnome"
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/default
-- 
1.7.7



