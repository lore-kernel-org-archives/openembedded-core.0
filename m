Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJau-00043l-5A
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:37:00 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EcaH59g9qzTwZQnQij9maV8NXRHNMxETdF/g9ppMrW4=;
	b=MEMX54/x6nsaxXC7byhi1vsThSp2R27L0YVIJEBs+9EtG4jdQQw+MId/NAi8h7V0ID
	BCcigfsJqkX+mG/JIfnlEFSfQ314VCXpSRVHLlOvMLWj4z7/KqKrfxTX/SGuu5+IbHNh
	hvtm20DgglUzFrKSA4bQCno4s1E3ArmDX06h8=
Received: by 10.204.131.140 with SMTP id x12mr2387421bks.33.1318505478652;
	Thu, 13 Oct 2011 04:31:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm3261516bkv.8.2011.10.13.04.31.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:31:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:23 +0200
Message-Id: <2cc413f0ed15f89540dd54217bba6e75d0415120.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 05/20] mesa: move common patches which could be used in both mesa-dri and mesa-xlib from mesa-dri to mesa
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
X-List-Received-Date: Thu, 13 Oct 2011 11:37:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc         |    3 +++
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    2 --
 .../mesa/{mesa-dri => mesa}/cross2.patch           |    0
 .../mesa/{mesa-dri => mesa}/crossfix.patch         |    0
 .../mesa/{mesa-dri => mesa}/i586/matypes.h         |    0
 .../mesa/{mesa-dri => mesa}/uclibc.patch           |    0
 6 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/cross2.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/crossfix.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/i586/matypes.h (100%)
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/uclibc.patch (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index d8e800e..b3d1c8f 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -18,6 +18,9 @@ S = "${WORKDIR}/Mesa-${PV}"
 
 PROVIDES = "virtual/libgl"
 
+# for mesa-dri and mesa-xlib
+FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-glu \
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index ea4acc6..1e0d95e 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -1,7 +1,5 @@
 include mesa-common.inc
 
-FILESPATH =. "${FILE_DIRNAME}/mesa-dri:"
-
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://uclibc.patch \
            "
diff --git a/meta/recipes-graphics/mesa/mesa-dri/cross2.patch b/meta/recipes-graphics/mesa/mesa/cross2.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri/cross2.patch
rename to meta/recipes-graphics/mesa/mesa/cross2.patch
diff --git a/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch b/meta/recipes-graphics/mesa/mesa/crossfix.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
rename to meta/recipes-graphics/mesa/mesa/crossfix.patch
diff --git a/meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h b/meta/recipes-graphics/mesa/mesa/i586/matypes.h
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h
rename to meta/recipes-graphics/mesa/mesa/i586/matypes.h
diff --git a/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch b/meta/recipes-graphics/mesa/mesa/uclibc.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
rename to meta/recipes-graphics/mesa/mesa/uclibc.patch
-- 
1.7.7



