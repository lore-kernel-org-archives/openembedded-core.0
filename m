Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFp7m-0001Ma-Rr
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 18:06:01 +0100
Received: by mail-ob0-f169.google.com with SMTP id ta14so1264859obb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=0xEoI68NxlaYmNqocgOkM3nQHrOk+hGGHxf0O4jbTYc=;
	b=Sqa2zkO3ormYW39z/bwiG7gy+k6ksyTTsVvTZC7mlbDLr4VSiMsktnILih/6EGhC7I
	I6fsIxDRSoLRmuDD67JUPr1WNGKRkXf/19eamtSqIyEkDZ23yYr6+06TCg56kL3mBdE7
	AvGRbJEdCubpH+rx05cm7LsjFMA4ZzR2a7p2LmppLKz8rgrPn2k9f6RNMHE3/xc9aHgT
	2xmjhsP+KL9Nt/2E3gygIai8dC6ZEXc3testR12CfBRaDcwMK1tbu0f+a6KQYUWQZZXk
	amfOpLNV8ZPcRoP8+i1TvzkBQljEXXb+ujHQkzDBnp3mi1ilAbAXlOUj8G8zIX0RHLBr
	u7rg==
X-Received: by 10.60.14.226 with SMTP id s2mr16258232oec.124.1363193357431;
	Wed, 13 Mar 2013 09:49:17 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id ka6sm26233523obb.3.2013.03.13.09.49.15
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:49:16 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 09:49:12 -0700
Message-Id: <1363193354-6895-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
References: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQny2X6FUSW8Xs+FTLUatputM9GzNg5uAX7XuUx56liq44YvzsqpQQaZIcZ1pJ/AhL9WX7Fo
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v2 1/3] qt-mobility: Add bluez dependency if DISTRO_FEATURES has bluetooth
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
X-List-Received-Date: Wed, 13 Mar 2013 17:06:16 -0000

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



