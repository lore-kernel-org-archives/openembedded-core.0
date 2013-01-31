Received: from mail-qa0-f42.google.com ([209.85.216.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <geiseri@geiseri.com>) id 1U0iLQ-0001fK-9y
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 01:49:36 +0100
Received: by mail-qa0-f42.google.com with SMTP id cr7so2177826qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 16:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=eARb3WbKmzuB/PanhiyFFq+g5Sa08QyfmSI242ZKLYM=;
	b=cyBqhd1DVLJ9ZLomHHuXeowGTeaEesQ8PiNBS5T3C8fIGYjFZDTPQrmlkEiz8puYts
	ERY2IS2ozW6ywSqVYoK7Ymq3YpRV1+JnjJmzPQTTDYjc/403YMH6h+MOe2UJyjowW5CQ
	bSkHXpz1bnR3pN/Q4EFSJor2ij7KwddPbq9ELfX4qSMELirMupCzbuD2HihFIRHPc/oQ
	v8vw1YdjYv5aVwdUCYsgVanZNfyWg4e4FI1bFW6glESXcd84f9J0xn3lxs7mMn4j8Xd3
	RK8/s3Rp+CIiGG1beXeznwsBxQd1k5ibRTSy8D5hf72jxWytyjSZJijov6GjD2wRXGcS
	H0fg==
X-Received: by 10.49.34.146 with SMTP id z18mr8286535qei.29.1359592434159;
	Wed, 30 Jan 2013 16:33:54 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPS id df6sm2978863qab.6.2013.01.30.16.33.52
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 16:33:53 -0800 (PST)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 19:33:21 -0500
Message-Id: <1359592401-16494-1-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQktmAsVu6E4fV9wTZoL8XVPKoUQm240Xq+gSRMgiOGpqz4IKkJuuWUkBBobVwktR0UhhQrW
Subject: [PATCH v2] mesa-dri: add extra dri drivers
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
X-List-Received-Date: Thu, 31 Jan 2013 00:49:36 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

 * By default enable only swrast.  This needs to
   be here or for some reason qemuarm tries to
   detect the intel dri libraries and fails.
 * For x86 and x86-64 clear out the field so mesa
   enabled all of the modules.

 builds properly with qemux86 qemuarm and qemux86-64

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 1f6ec78..2a9afb5 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -1,12 +1,12 @@
 DEPENDS += "libdrm expat udev"
 X11_DEPS += "dri2proto"
 
-DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86 = ",i915,i965"
-DRIDRIVERS_append_x86-64 = ",i915,i965"
+DRIDRIVERS = "--with-dri-drivers=swrast"
+DRIDRIVERS_x86 = ""
+DRIDRIVERS_x86-64 = ""
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
-EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--enable-dri ${DRI_DRIVERS}"
 EXTRA_OECONF += "--enable-gbm"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
-- 
1.7.9.5



