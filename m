Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu5b-0005YU-OZ
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:36:27 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gYvxvZgqSxxlk1hv0NcdUctg8vBdCANiZVxg4BoXSuM=;
	b=NeSUuCm3BIppNOBE4Ez1ZwBdNedcwwsB2NBEJ3WfMxVsC6VT5kbsov5Mgwqneyvs+R
	8K0e/jOdJyxpMjSshEs2bXPI9sYFcWl/adVgOfjLc1d1wjrvgLfRasfvqgsuyLi9Iir2
	JcqfQZQff777Dvtxn0xSwwOjqxufREI39HmYA=
Received: by 10.205.112.6 with SMTP id eq6mr9013241bkc.16.1321029011419;
	Fri, 11 Nov 2011 08:30:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m12sm1768621bkg.14.2011.11.11.08.30.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:30:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:45 +0100
Message-Id: <64d5589ab525887107195846f988959ad39093ed.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 09/22] mesa-common: install internal GL headers to libgl-dev
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
X-List-Received-Date: Fri, 11 Nov 2011 16:36:27 -0000

* this is just work around
* better fix would be as RP suggested:
  Ideally we should write a patch fixing the Makefile so dri-swrast
  installs the pieces the xserver needs to build. Does it need both
  sarea.h and dri_interface.h or just the latter?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index b8f2289..ca2d931 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -51,3 +51,8 @@ FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_libegl-dbg += "${libdir}/egl/.debug/*"
+
+do_install_append () {
+    install -d ${D}/${includedir}/GL
+    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
+}
-- 
1.7.8.rc1



