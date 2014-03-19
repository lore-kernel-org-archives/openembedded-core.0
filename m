Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 343846E8AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 16:24:46 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so23774254ykr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=bZiNgdVLlre/td6xVTTRLQNBvktTDTVIqc7eGfJO7ZQ=;
	b=lGWSbm0vst67gY5QQnQT0S+mXOunG6ky2cM0Mrfa2/an66VgeX1JHsIaLlaC6uzW+J
	BRpfIjFudQi6KuKZRe6FxHQr4djmy8rIykZb8Y8n24FW4DLAiNJLs8fjCipfb/Rana0E
	C0d3Csm41KbRRruBFA1GsPHyiXUHf4BsfptadGQvjLESTU2WKZGJ8LtB/Aak4dAzjgnQ
	iX9GUt8PtSaDKMR/1IJLiHH4cLQh7gj0qTOsKFa73IBnmT7I5G/eYtSUDq7ijcyFy20M
	CkpFK8D0vbACeVifvbtcaeypBilW4+5IH2Q21Es0D2rvgO3hpGG1JiUCDR4g+eEM2Zuv
	kQGg==
X-Received: by 10.236.231.101 with SMTP id k95mr27738317yhq.34.1395246287209; 
	Wed, 19 Mar 2014 09:24:47 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id r3sm23903077yhl.38.2014.03.19.09.24.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 09:24:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 29D35198E98E3; Wed, 19 Mar 2014 13:24:43 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Mar 2014 13:24:41 -0300
Message-Id: <1395246282-8546-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
References: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] cairo: Add 'egl' and 'glesv2' PACKAGECONFIG options
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
X-List-Received-Date: Wed, 19 Mar 2014 16:24:49 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/cairo/cairo.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 5212f8b..b15fbc9 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -12,12 +12,14 @@ SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
+
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
 PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
 PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
-BBCLASSEXTEND = "native"
+PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
+PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
@@ -31,3 +33,5 @@ inherit autotools pkgconfig
 export ac_cv_lib_bfd_bfd_openr="no"
 # Ensure we don't depend on LZO
 export ac_cv_lib_lzo2_lzo2a_decompress="no"
+
+BBCLASSEXTEND = "native"
-- 
1.9.0


