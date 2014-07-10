Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7E270241
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 19:18:23 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1X5JrM-0000bk-Ga from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jul 2014 12:18:24 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Jul 2014 12:18:24 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.2.247.3; Thu, 10 Jul 2014 12:17:57 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jul 2014 15:18:22 -0400
Message-ID: <1405019902-31691-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Jul 2014 19:18:24.0129 (UTC)
	FILETIME=[B81FAF10:01CF9C73]
Subject: [PATCH] libomxil-0.9.3: Move .so files to main package.
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
X-List-Received-Date: Thu, 10 Jul 2014 19:18:24 -0000
Content-Type: text/plain

The omxregister-bellagio app scans the libdir for the '*.so'
files to get them properly registered.  Make sure they are
included in the base package rather than the dev.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 103d789..e11febc 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -24,12 +24,14 @@ inherit autotools
 EXTRA_OECONF += "--disable-doc --disable-Werror"
 
 FILES_${PN} += "${libdir}/bellagio/*${SOLIBS} \
-                ${libdir}/omxloaders/*${SOLIBS}"
+                ${libdir}/bellagio/*${SOLIBSDEV} \
+                ${libdir}/omxloaders/*${SOLIBS} \
+                ${libdir}/omxloaders/*${SOLIBSDEV}"
 FILES_${PN}-staticdev += "${libdir}/bellagio/*.a \
                           ${libdir}/omxloaders/*.a"
 FILES_${PN}-dev += "${libdir}/bellagio/*.la \
-                    ${libdir}/bellagio/*${SOLIBSDEV} \
-                    ${libdir}/omxloaders/*.la \
-                    ${libdir}/omxloaders/*${SOLIBSDEV}"
+                    ${libdir}/omxloaders/*.la"
 FILES_${PN}-dbg += "${libdir}/bellagio/.debug/ \
                     ${libdir}/omxloaders/.debug/"
+
+INSANE_SKIP_${PN} += "dev-so"
-- 
1.9.1


