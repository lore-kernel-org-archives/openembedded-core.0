Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF1jU-0007S1-9R
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:44:48 +0200
Received: by bkat8 with SMTP id t8so3130069bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=QimvF7WN9YTEZ25CxJqr0hm1+ePhZCgcrnNt+/v3x8o=;
	b=WK99y0ooGjRIQJooskqN1Ie6u5o+4b5BwYFiaR+RgInEGLDsiVxEitWmxf1DhaJOlQ
	M/1R8CYhZC+5td+kWYfuoQUuIgndR9AzsQPLeGgjqyRTLc3RmHcSym9mgYQsuW8T/eG/
	8OZKZkkorYDoSr1hMukFJAiooTsDyw5LJVc4Q=
Received: by 10.223.16.82 with SMTP id n18mr10147993faa.2.1318675142300;
	Sat, 15 Oct 2011 03:39:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r16sm9550174fam.8.2011.10.15.03.39.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 03:39:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Oct 2011 12:38:52 +0200
Message-Id: <1318675132-9265-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
References: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
Subject: [PATCH] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Sat, 15 Oct 2011 10:44:48 -0000

* this way we can use
  EXTRA_DRIDRIVERS_armv4t += ",glamo" in meta-openmoko layer and
  EXTRA_DRIDRIVERS_armv4t += ",foo" in meta-bar layer without knowledge
  of other modules in other layers in stack
* actually it's like old MACHINE_DRI_MODULES from OE-classic but renamed
  to indicate that it should be used for architecture not machine

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 795144a..ef0e8cf 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -4,11 +4,11 @@ LIB_DEPS += "libdrm expat"
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
 
-DRIDRIVERS = "swrast"
-DRIDRIVERS_x86 = "swrast,i915,i965"
-DRIDRIVERS_x86-64 = "swrast,i915,i965"
+EXTRA_DRIDRIVERS = ""
+EXTRA_DRIDRIVERS_x86 = "i915,i965"
+EXTRA_DRIDRIVERS_x86-64 = "i915,i965"
 
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=swrast,${EXTRA_DRIDRIVERS}"
 
 python populate_packages_prepend() {
 	import os.path
-- 
1.7.7



