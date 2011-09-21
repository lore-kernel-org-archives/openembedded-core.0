Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Ro6-0001GK-LM
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:46:07 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123691bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wq3JKhAl6cZ75wtaEK0aCiklih2oVoJRFLygzwkO4jQ=;
	b=PIrc3bxZ3Ld4AaJPV+OI2wZ+WsVXI/jAs+4c/+046SNM290WJDQTuKs5d5ex/FhDA/
	s5iQvvQ62uOKnLhy87IxCcAed962PxFRCWtyyvaRuMt5Y30pGvY2/ePkhTgj4ySYG6x9
	PZXX0MajxxAUhK5uR82QTYy4bCrW/mjz2XnsQ=
Received: by 10.204.139.20 with SMTP id c20mr897890bku.218.1316630437784;
	Wed, 21 Sep 2011 11:40:37 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:37 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:40:00 +0400
Message-Id: <1316630404-10336-13-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 13/17] libxml2: reinclude a -staticdev package
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
X-List-Received-Date: Wed, 21 Sep 2011 18:46:10 -0000

libxml2 provides a libxml2.a library, which wasn't included in any of
the packages. Usually static libs are included into a -staticdev
package, but this package wasn't generated for libxml2, due to
libxml2.inc redeclaring PACKAGES variable (to include libxml2-utils).
Replace PACKAGES setting with expansion to include all default packages
(and so -staticdev package with libxml2.a).

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc      |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index cf789b2..6f79333 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -37,7 +37,7 @@ python populate_packages_prepend () {
 		bb.data.setVar('PKG_libxml2', '${MLPREFIX}libxml2', d)
 }
 
-PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-utils ${PN} ${PN}-doc ${PN}-locale"
+PACKAGES += "${PN}-utils"
 
 FILES_${PN}-dev += "${bindir}/*-config ${libdir}/xml2Conf.sh"
 FILES_${PN}-utils += "${bindir}/*"
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 3909839..74860af 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
-- 
1.7.2.5



