Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje2c-000446-Hy
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:10:50 +0200
Received: by fxh10 with SMTP id 10so2396807fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9EsyMEm1OJeuUjT7bBfP4LM1cSnEIa4UPkv/bdR3/1E=;
	b=dDKrPGtmHQeuopvvfUbpks5pap9NVIzc3TS3/mmCkuDi5WTxhVfT4foRPrPRaezww+
	WbPl9bfjBtLDCUV+5tL0rug5W+FEq07MMVd+zqFrsxDPAVPbM9kSJh//6RhrTZY6i/fV
	SBkXQvUm2xTJmmTlAJr0KAzRFhMZW6tfGfIK0=
Received: by 10.223.64.66 with SMTP id d2mr809859fai.116.1311196004165;
	Wed, 20 Jul 2011 14:06:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 12sm433320fad.16.2011.07.20.14.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:06:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:19 +0200
Message-Id: <cd4a85ccaa27bdd77ad06d9300ac71bd6b27e36d.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/10] eglibc-package: don't fail without localedef/gconv
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
X-List-Received-Date: Wed, 20 Jul 2011 21:10:50 -0000

* in some cases we don't have localedef/gconv built
  ie when DISTRO_FEATURES lacks one of libc-charsets, libc-locales, libc-locale-code
  then is better ignore localedef/gconv instead of do_install_locale
  failing like in this bugreport:
  http://bugzilla.yoctoproject.org/show_bug.cgi?id=1209

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index faf68f7..9e71150 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -98,8 +98,12 @@ do_install_locale () {
 	if [ "${base_libdir}" != "${libdir}" ]; then
 		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
 	fi
-	mv ${D}${bindir}/localedef ${dest}${bindir}
-	mv ${D}${libdir}/gconv ${dest}${libdir}
+	if [ -f ${D}${bindir}/localedef ]; then
+		mv -f ${D}${bindir}/localedef ${dest}${bindir}
+	fi
+	if [ -f ${D}${libdir}/gconv ]; then
+		mv -f ${D}${libdir}/gconv ${dest}${libdir}
+	fi
 	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
         mv ${D}${datadir}/i18n ${dest}${datadir}
 	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
-- 
1.7.6



