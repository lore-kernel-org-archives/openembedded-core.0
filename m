Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id E68FB607FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 20:40:57 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so1992198ykq.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 13:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=3LWryQgrAtJP4mnZxiUSJMTeDdWBdfq2PDudJSmf1/o=;
	b=mnDZJclWhlb3K0XsvgCe5TN3hc06fWFU6OBwXPDefUO5uT++3hdzhG+UbLPqjE2Nax
	w44ORxd0KDc5cnkSGzAW2BSzwWL6WkOVWaStqeXzE/GYJLYIZV5EdOY6n64dP85L3cXF
	DGhrGcAchrmvZfL+fDdzOu01i7stK6VMBf+6VJSMJLryhfqY2d5217zrRAnCuhG4Yd3Q
	W6arNUzrrKmKH7B0zniS3JUhfMQYas6R3iqFY3QdEqKsQGE7u1V02AY2ayiLsxWIOUyc
	5TbDbuDWuNpF2XC0yDoox0/mE9gXAkUe15mhJWBuiJS1z8cbUs8t77ag7FKQtlLyGC2C
	ayzw==
X-Received: by 10.236.152.9 with SMTP id c9mr9016273yhk.25.1398890457997;
	Wed, 30 Apr 2014 13:40:57 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	j46sm44838037yhc.14.2014.04.30.13.40.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 13:40:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id A97241A768281; Wed, 30 Apr 2014 17:40:53 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Apr 2014 17:40:53 -0300
Message-Id: <1398890453-24966-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] alsa-tools: Enable GTK support for X11, Wayland and DirectFB
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
X-List-Received-Date: Wed, 30 Apr 2014 20:41:00 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index dfa9b97..3113481 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://mips_has_no_io_h.patch \
            file://autotools.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
+           ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', '', \
+                                    'file://makefile_no_gtk.patch', d)}"
 
 SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
 SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
@@ -20,7 +21,7 @@ inherit autotools-brokensep
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', 'gtk+', '', d)}"
 PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
 
 # configure.ac/.in doesn't exist so force copy
-- 
2.0.0.rc0


