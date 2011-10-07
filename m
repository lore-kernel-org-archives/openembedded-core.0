Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDxm-0005jd-L9
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:11:58 +0200
Received: by mail-yw0-f47.google.com with SMTP id 7so3895515ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YgYNMpbZbl0qxfLFb+LA2iZM6AKDo3YVQy4Od2/bFtI=;
	b=B+qrM6LRvJpQhjtwBgEPaLs3UseQY2Btj5EUeBo9n8xODDtb8+WtnM2NTMxai6kXMF
	lUgG08csmmm0ufq30e0Rex7+KoTRNaAkFGMgTSCe9T67JQ5MwBY911eYIp5ekZvKhIUm
	BczCJ9JhLpGQKqCtAEoLveyZndY7XXROW+f+Q=
Received: by 10.223.64.65 with SMTP id d1mr11889740fai.32.1318007183365;
	Fri, 07 Oct 2011 10:06:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n1sm13590291fad.20.2011.10.07.10.06.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:06:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:02 +0200
Message-Id: <7ba7c68c4d193b35f52f4927a9e8311613c4e708.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 07/31] xserver-xorg-common: improve packaging
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
X-List-Received-Date: Fri, 07 Oct 2011 17:11:58 -0000

* add ${bindir} and protocol.txt to ${PN}
* SecurityPolicy is now in ${PN}-security-policy
* package .la files to ${PN}-dev
* README.compiled is lately in ${localstatedir}/lib/xkb so add it too to ${PN}-doc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index c0fcf8b..0a5d8b6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -58,14 +58,13 @@ PACKAGES =+ "${PN}-security-policy \
 
 RDEPENDS_${PN} += "xserver-xf86-config xkeyboard-config"
 
-FILES_${PN} = "${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/xserver/SecurityPolicy ${libdir}/xorg/modules/*.so ${libdir}/xorg/modules/*/*.so ${libdir}/xorg/modules/*/*/*.so /etc/X11 "
-FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled"
-
+FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
+FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
+FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled ${localstatedir}/lib/xkb/README.compiled"
 FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
                     ${libdir}/xorg/modules/*/.debug \
-		    ${libdir}/xorg/modules/*/*/.debug \
-		    "
-
+                    ${libdir}/xorg/modules/*/*/.debug \
+                    "
 FILES_${PN}-security-policy += "${libdir}/xserver/SecurityPolicy"
 FILES_${PN}-sdl = "${bindir}/Xsdl"
 FILES_${PN}-fbdev = "${bindir}/Xfbdev"
-- 
1.7.7



