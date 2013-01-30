Received: from mail-qa0-f46.google.com ([209.85.216.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <geiseri@geiseri.com>) id 1U0XuO-0006NA-VH
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 14:41:03 +0100
Received: by mail-qa0-f46.google.com with SMTP id o13so2022129qaj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 05:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=jk/KclQ6DLD5jVzUdIg0SxzSRsCqgQJNO/9Pff8VZZA=;
	b=pWqQEOpvqSgL9LJsfeFByHtcSkrrXLYPukvqgOKopqZ2iJLJfcb5bBZuj/cIb3Nfoz
	GIReVcuBkBSrRO04KjXkXYR5P+TD7xnrnXcsbd2IbNi9l32dUw+8QH8Y+VufugiyHvY3
	UaTSUPx5yVsaT8EDlFKw/EQpQwpWz8PPbWodg+uSvppoqCTdeK4ekJ7R9i3qGgbVK4mo
	7RAj96KB5phLDS1GDjmD2ETGYZzbxRls9OOW/94BVFs5HuQp8iADfmmgPSHiU5AHynH6
	VrZOJTX8k3fzY16Q+9ZC1+GtdgU+Flo4ykQDqwawdkDspCg0CNF8SN1ymbNKFGB6e/Kp
	26tw==
X-Received: by 10.229.135.18 with SMTP id l18mr1171957qct.121.1359552319439;
	Wed, 30 Jan 2013 05:25:19 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPS id z5sm1001703qer.8.2013.01.30.05.25.18
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 05:25:18 -0800 (PST)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 08:26:11 -0500
Message-Id: <1359552371-27121-1-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnBcy5vw1zNZTqx4m8vpVLt/eInK5Fqa3ucGmr15amI9l/NOk/FEtx/tyvYQmNeMcIdDjPj
Subject: [PATCH] mesa-dri: add extra dri drivers
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
X-List-Received-Date: Wed, 30 Jan 2013 13:41:03 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

On x86 the ATI and NVidia drm drivers are valid to build.
Currently there are _append_x86 and _append_x64 lines that
explicitly add i915 and i965.  For consistency I think that
the ATI and NVidia drm driver should be added. In classic
these were tunable via the machine configuration files. I
would argue we should go back to that so we should make
the DRIDRIVERS field something that can be defined there.

* Made the DRIDRIVERS field overridable.
* Add ATI and NVidia DRI drivers to the build list for
  x86 and x86_64.

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 1f6ec78..12e9dd5 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -1,9 +1,9 @@
 DEPENDS += "libdrm expat udev"
 X11_DEPS += "dri2proto"
 
-DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86 = ",i915,i965"
-DRIDRIVERS_append_x86-64 = ",i915,i965"
+DRIDRIVERS ?= "swrast"
+DRIDRIVERS_append_x86 = ",i915,i965,nouveau,r200,radeon"
+DRIDRIVERS_append_x86-64 = ",i915,i965,nouveau,r200,radeon"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
-- 
1.7.9.5



