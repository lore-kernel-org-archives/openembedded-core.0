Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF1VQ-0007Cy-JA
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:30:16 +0200
Received: by bkat8 with SMTP id t8so3116035bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3IzsPtTDh+m0jqEsTSRe3scJohm3j8ZwYN0oIPqRlBc=;
	b=KUSRWb65gGcoiixt2QdEan06Syzy7I2gIoo5VPnWtBcPJy6U+6bOOyhs5DtNnkUBMP
	WmgXKvzmo29uoywikWTzS3igrXr6Ygnf+rnlbqBI0aFLtJHl4udW1peLjAcZv8DoxC0B
	bifU3/hHN3BoItRUxzogd7xrA0zi9JWOJVPLM=
Received: by 10.223.75.25 with SMTP id w25mr10553828faj.15.1318674269657;
	Sat, 15 Oct 2011 03:24:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x22sm9478496faa.5.2011.10.15.03.24.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 03:24:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Oct 2011 12:24:19 +0200
Message-Id: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 1/2] xserver-xorg: remove glx-use-tls again
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
X-List-Received-Date: Sat, 15 Oct 2011 10:30:17 -0000

* khem confirmed that uclibc does support it now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/glx-use-tls.inc         |    7 -------
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    3 +--
 2 files changed, 1 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/glx-use-tls.inc

diff --git a/meta/recipes-graphics/mesa/glx-use-tls.inc b/meta/recipes-graphics/mesa/glx-use-tls.inc
deleted file mode 100644
index 7530872..0000000
--- a/meta/recipes-graphics/mesa/glx-use-tls.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-def get_tls_setting(bb, d):
-    # until we have no prober TLS support in uclibc disable it
-    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
-        return ""
-    return "--enable-glx-tls"
-
-EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 01cdd68..9246b06 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -3,11 +3,10 @@ require xserver-xorg-common.inc
 PROTO_DEPS += "xf86driproto dri2proto"
 LIB_DEPS += "virtual/libgl"
 
-require ../mesa/glx-use-tls.inc
-
 EXTRA_OECONF += "\
                  --enable-dri \
                  --enable-dri2 \
+                 --enable-glx-tls \
                  --with-pic \
                  --with-int10=x86emu \
 "
-- 
1.7.7



