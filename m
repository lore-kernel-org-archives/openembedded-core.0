Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTI0F-0004r9-Hi
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 19:57:05 +0100
Received: by ghy10 with SMTP id 10so1735456ghy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=O/IRiqd9TY7MDeaYpXdf1Lat7f8GBQr/BS/yURNt4Y8=;
	b=Ov8mNLG8PvaZKizNsx/EmIDIgLiqc1KL4JhI2Ipp4xz2z6wMogvEARzc292Rj95+I2
	9TIpVwk+5/rpVALR+c4FA6N6Ryq2r6+MJTwZbYbBMkCnbDVKPrBvbz8lXnI+cIz+5C5f
	lgD1FAd6Om8A94umW1GPOK3A14KGam4dw55uE=
Received: by 10.236.22.136 with SMTP id t8mr37424436yht.30.1322074231001;
	Wed, 23 Nov 2011 10:50:31 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i50sm26371069yhk.11.2011.11.23.10.50.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 10:50:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2011 18:50:20 +0000
Message-Id: <7966ec0d9378a3144b7e957e1ba0a59456cfae79.1322074182.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1322074182.git.otavio@ossystems.com.br>
References: <cover.1322074182.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1322074182.git.otavio@ossystems.com.br>
References: <cover.1322074182.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] xserver-xorg: only use --disable-dga in xserver-xorg-lite
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
X-List-Received-Date: Wed, 23 Nov 2011 18:57:05 -0000

Xorg VESA driver calls DGAInit enforcing this symbol to be available
to the driver to work so we revert back to only disable DGA for lite
flavor of Xorg.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
index 2c5bb0a..8b0808d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
@@ -3,7 +3,7 @@ SRC_URI += "file://crosscompile.patch"
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "4cdf54dc569b6a5548257c93a45dcd3d"
 SRC_URI[sha256sum] = "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393cab2ca3f8817276f6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 2559397..c1a552e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -100,7 +100,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --disable-acfb \
                  --disable-ccfb \
                  --disable-mcfb \
-                 --disable-dga \
                  --disable-xinerama \
                  --disable-xf86misc \
                  --disable-xorgcfg \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index be84e9e..57615f5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -3,4 +3,5 @@ require xserver-xorg-common.inc
 EXTRA_OECONF += "\
                  --disable-dri \
                  --disable-glx \
+                 --disable-dga \
 "
-- 
1.7.2.5



