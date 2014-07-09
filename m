Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A70BB7039B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 23:17:35 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1X517I-000646-OP from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jul 2014 16:17:36 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Jul 2014 16:17:36 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 9 Jul 2014 16:17:35 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jul 2014 19:17:34 -0400
Message-ID: <1404947854-1308-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Jul 2014 23:17:36.0487 (UTC)
	FILETIME=[F861F770:01CF9BCB]
Subject: [PATCH] gstreamer1.0-omx: Use variables for CORE_NAME processing.
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
X-List-Received-Date: Wed, 09 Jul 2014 23:17:38 -0000
Content-Type: text/plain

Use the "libdir" and "sysconfdir" variables rather than
hard-coding "/usr/lib" and "/etc".

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index b76786b..b423863 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -13,7 +13,7 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 PR = "r1"
 
 GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
-GSTREAMER_1_0_OMX_CORE_NAME ?= "/usr/lib/libomxil-bellagio.so.0"
+GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
 
 EXTRA_OECONF += "--disable-valgrind --with-omx-target=${GSTREAMER_1_0_OMX_TARGET}"
 
@@ -31,7 +31,7 @@ python __anonymous () {
 }
 
 set_omx_core_name() {
-	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}/etc/xdg/gstomx.conf"
+	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}${sysconfdir}/xdg/gstomx.conf"
 }
 do_install[postfuncs] += " set_omx_core_name "
 
-- 
1.9.1


