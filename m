Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rns-0001GK-Ie
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:52 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123691bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=aqvmWb14ej1Eibz6lK+TllFPitGNhRZwxQoVehOdDJc=;
	b=rEszM3UaxWha9BTjQrnKhZR4k3Ilqwm/6Y0qB/GkYmxmMuDKer/MSVpsSlDziblzDQ
	a/WRYX/gHOgtBTF98ZG6qvi2ATWG08comqwXYmuCldnWe1Y7m5Jr9rKTSms/+Al5SHyM
	UkaYKkwGFmJSsiJwivKqzKnKjTiW6/jQFIrN8=
Received: by 10.204.129.4 with SMTP id m4mr830279bks.251.1316630432215;
	Wed, 21 Sep 2011 11:40:32 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:31 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:57 +0400
Message-Id: <1316630404-10336-10-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 10/17] gettext: shut up unshipped files warning
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:52 -0000

It seems nobody uses preloadable_libintl.so in OE world. It's not
included in any package. To stop oe-core from emiting a unshipped files
warning, remove that file in the end of do_install.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 2c0b2f8..fabd126 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r3"
+PR = "r4"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -90,4 +90,9 @@ FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${docdir}/libasprintf/autosprintf.html \
                              ${infodir}/autosprintf.info \
                             "
+
+do_install_append() {
+    rm -f ${D}${libdir}/preloadable_libintl.so
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.2.5



