Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFARY-0000Tj-C3
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 22:39:41 +0100
Received: by mail-oa0-f54.google.com with SMTP id n12so4980724oag.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=0xEoI68NxlaYmNqocgOkM3nQHrOk+hGGHxf0O4jbTYc=;
	b=XLDa05YlG3oJ6RPhIbHDiLMZWaCc/U+4jEWn12QKYE+6zIaLFFXJ3u9TqM+9LeAyK/
	LL0AbVH2HwPTRsycZu102DvJuNdukk/EuG2iSj8pzHMUWL2SShkdR/zSvS1lFnd29gJc
	nu3R1px6d9lieCE3uJhjkvbxpNFxHUdv1h1XN1u9kXLfoz5paRWqNV8Xcl45Ck6peU+v
	GNIJmUEb3gDXnrEvtIFJEq0TuM+jZQSor6dk2JIbau75vxbVJobPkNlF798kpmujOqw1
	Jk0AyLIQ/xMmPcSJ4yG0HEhIGkg9w6SqFFeG4vpGM2BbRilrECMusjHxYenJSUQACk2W
	Rj/g==
X-Received: by 10.60.29.37 with SMTP id g5mr10175653oeh.140.1363036981598;
	Mon, 11 Mar 2013 14:23:01 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id i19sm18709868obf.0.2013.03.11.14.23.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 14:23:00 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 14:23:03 -0700
Message-Id: <1363036984-29155-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363036984-29155-1-git-send-email-eu@felipetonello.com>
References: <1363036984-29155-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQkVUACZ1DxHbl488WrKDfgOaZJE9WLFuPAWj8OpiZKBpDXwSo9fqSwZrusT9vqS0atE3k8V
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH 1/2] qt-mobility: Add bluez dependency if DISTRO_FEATURES has bluetooth
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
X-List-Received-Date: Mon, 11 Mar 2013 21:39:41 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Some modules doesn't requires bluez4 to compile. So it's unnecessary to have
it as dependency.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 7778630..e5e671e 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -1,5 +1,6 @@
 HOMEPAGE = "http://qt.nokia.com"
-DEPENDS += "pulseaudio bluez4"
+DEPENDS += "pulseaudio"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
@@ -30,6 +31,8 @@ qtm_plugins	:= "/usr/lib/${qtm_dir}/plugins/QtMobility"
 qtm_data	:= "/usr/share/${qtm_dir}"
 qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
 
+qtm_bluezflag ?= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'yes', 'no', d)}"
+
 do_configure_prepend() {
 	cp qtmobility.pro qtmobility.pro.old
 	sed -e 's@...QT_INSTALL_DATA.@${qtm_data}@' <qtmobility.pro.old >qtmobility.pro
@@ -49,7 +52,7 @@ do_configure_prepend() {
 	echo QT_MOBILITY_EXAMPLES = ${qtm_examples} >>./config.pri
 	echo QT_MOBILITY_DEMOS = ${qtm_demos} >>./config.pri
 	echo QT_CONFIG ${qtm_glflags} >>./config.pri
-	echo bluez_enabled = yes >>./config.pri
+	echo bluez_enabled = ${qtm_bluezflag} >>./config.pri
 	echo ${qtm_extra_config} >>./config.pri
 	echo CONFIG += ${qtm_embedded} >>./config.pri
 }
-- 
1.7.9.5



