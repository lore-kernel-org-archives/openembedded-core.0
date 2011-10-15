Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF1VW-0007Cy-AW
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:30:22 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so3116035bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 03:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=sm6PPhD56aMHaLVTJVSoAzxb2BbNA2seRjPPM/e7hsw=;
	b=tOh86c9KDZHP/iKyx7uiCXhK9vDiH/BhFZyHA2rEX1aK/sEwmlOZTR5kDO7EU2lA3I
	Qb1jTT9E/lW9vaROmTSlqn2Nr1mNOteHmp8O+2pTvWG2Wxv3tVmhshoLbSJDGGue4k1k
	ZLQJRlV1yK1FvjnHkwJRCqx3k5tOlwtuIuaRg=
Received: by 10.223.77.26 with SMTP id e26mr842886fak.37.1318674277462;
	Sat, 15 Oct 2011 03:24:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm9479141fab.12.2011.10.15.03.24.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 03:24:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Oct 2011 12:24:20 +0200
Message-Id: <1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Sat, 15 Oct 2011 10:30:22 -0000

* this way we can use
  EXTRA_DRIMODULES_armv4t += ",glamo" in meta-openmoko layer and
  EXTRA_DRIMODULES_armv4t += ",foo" in meta-bar layer without knowledge
  of other modules in other layers in stack

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 795144a..4557bf8 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -4,9 +4,11 @@ LIB_DEPS += "libdrm expat"
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
 
+EXTRA_DRIDRIVERS = ""
+EXTRA_DRIDRIVERS_x86 = ",i915,i965"
+EXTRA_DRIDRIVERS_x86-64 = ",i915,i965"
 DRIDRIVERS = "swrast"
-DRIDRIVERS_x86 = "swrast,i915,i965"
-DRIDRIVERS_x86-64 = "swrast,i915,i965"
+DRIDRIVERS += "${EXTRA_DRIDRIVERS}"
 
 EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=${DRIDRIVERS}"
 
-- 
1.7.7



