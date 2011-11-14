Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RPwMA-000458-Aj
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 14:13:50 +0100
Received: by bkbzs2 with SMTP id zs2so6038374bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+pl/H2p3SgNrwakauBF70FpwvwyU1ZqAluAOvrHchoQ=;
	b=hxOKAzczk6yiJasdikELL0J5cZHoAqQ2mUZHncTt0QMxcPENRW+YItwiC0ItgjsU0u
	VtqbW/TBmtrqmPedUelW6jFiOJeNkMiv2G0AmrlwJaoLHUhykRKtBdbAO1dBsedom8Gh
	0RP3tSg/ObMSbAXKWeJE7Hb6QUCOFCHC5s8+E=
Received: by 10.204.156.219 with SMTP id y27mr4762488bkw.125.1321276045252;
	Mon, 14 Nov 2011 05:07:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm32187771bkw.5.2011.11.14.05.07.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 05:07:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 14:07:12 +0100
Message-Id: <1321276032-5110-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <1321121979.26881.25.camel@ted>
References: <1321121979.26881.25.camel@ted>
Subject: [PATCH] alsa-lib: use PKGSUFFIX for every package to resolve multiple runtime providers from target and nativesdk
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
X-List-Received-Date: Mon, 14 Nov 2011 13:13:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
index d701031..83e663d 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
@@ -14,7 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch"
@@ -31,17 +31,20 @@ EXTRA_OECONF = "--with-cards=pdaudiocf --with-oss=yes --disable-python"
 
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
-PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc alsa-dev"
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
+PACKAGES =+ "alsa-server${PKGSUFFIX} libasound${PKGSUFFIX} alsa-conf-base${PKGSUFFIX} alsa-conf${PKGSUFFIX} alsa-doc${PKGSUFFIX} alsa-dev${PKGSUFFIX}"
 FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
-FILES_libasound = "${libdir}/libasound.so.*"
-FILES_alsa-server = "${bindir}/*"
-FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
-FILES_alsa-conf-base = "\
+FILES_libasound${PKGSUFFIX} = "${libdir}/libasound.so.*"
+FILES_alsa-server${PKGSUFFIX} = "${bindir}/*"
+FILES_alsa-conf${PKGSUFFIX} = "${datadir}/alsa/"
+FILES_alsa-dev${PKGSUFFIX} += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
+FILES_alsa-conf-base${PKGSUFFIX} = "\
 ${datadir}/alsa/alsa.conf \
 ${datadir}/alsa/cards/aliases.conf \
 ${datadir}/alsa/pcm/default.conf \
 ${datadir}/alsa/pcm/dmix.conf \
 ${datadir}/alsa/pcm/dsnoop.conf"
 
-RDEPENDS_libasound = "alsa-conf-base"
+RDEPENDS_libasound${PKGSUFFIX} = "alsa-conf-base${PKGSUFFIX}"
-- 
1.7.8.rc1



