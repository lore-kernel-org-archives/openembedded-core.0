Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UI4kN-0002Ei-GW
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:11:07 +0100
Received: by mail-oa0-f51.google.com with SMTP id h2so1091715oag.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 14:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=0xEoI68NxlaYmNqocgOkM3nQHrOk+hGGHxf0O4jbTYc=;
	b=eQcpJ3FUYXMOxM6s6VMffmyVRuGH/XdI7AxncMjCKWS5AugrvDvoxEo4f3rFyqCqkO
	NcnHf4eDfWQSg7zR1JYSCTKFC/FLGZzi/C7hVgpLrw+/oz4P002IOiIX+wNyOdePbzP7
	SS1bBs63PHwYWl3IL6zF95KKNStSo5UFL0vSHcreE2AHxiUeGp558uYAvN18W8J6c3ZM
	vvMtwBWTRvvZGc4qnEQelGE2Pm5Z5sESbJWoJSWy+DIwCdevATAm3DMB55Gh1LwGAXRs
	fgQdXOMyR4+rr7+dvkorHMAJ1OiAlrhSa89mDFr+i5E7w6SbM4GyywK/i3zBZMEFvgTn
	C8ew==
X-Received: by 10.60.171.102 with SMTP id at6mr2714560oec.60.1363730057066;
	Tue, 19 Mar 2013 14:54:17 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id h9sm13500091obg.14.2013.03.19.14.54.14
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 14:54:15 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 14:54:11 -0700
Message-Id: <1363730053-7719-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQnbGWRlWSe8p/HCQpw0LOFBrEpbZI8Gm7ZHecYH+2KeGV21lDeGnXUI2WnAdamrwvM64kmH
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v3 1/3] qt-mobility: Add bluez dependency if DISTRO_FEATURES has bluetooth
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
X-List-Received-Date: Tue, 19 Mar 2013 22:11:08 -0000

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



