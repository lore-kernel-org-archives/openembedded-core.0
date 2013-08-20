Return-Path: <net147@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2264D61883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 10:15:30 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so236878pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eOpI7pHtBWyrLSxxI9RwEuhMrVkurr9juVIdb5h7l3w=;
	b=ctygEwIMFKqdD4jZei3MvOnpHYXSzfffOeEuXfzgywKOsqfu8xeGjBcKhb/VnsRQbn
	K02rboIl0qw+ZAHZkg80SEd4VrjXOT9mPGRnvB5oZaeyMr6pVbgrf6h6N4oNs/ui9BHF
	dITOc5FgIVbaHDG4WJNtEaqWQiWLxunswZCUdCzqmPSQ5+Hi4hLdaYsMSPwtSNfY5wCy
	GFbwjgwI4tp+oyZELIc7Y4JW9eR4R2CeAgEbaLb/bpZUibZ2fEkeVkFQfzCSm23vd2cU
	Gw734Yt4tRN3oVPH+eGrVYpAd4O9f7NBB+Nzex0nIpmiYiehE9R2LqY+RJpHBnTZTuo5
	xWfg==
X-Received: by 10.66.159.40 with SMTP id wz8mr2732163pab.135.1376993730744;
	Tue, 20 Aug 2013 03:15:30 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ef10sm2917737pac.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 03:15:30 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 20:10:41 +1000
Message-Id: <1376993441-15007-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] mesa: enable additional drivers for gallium-llvm x86/x86-64
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
X-List-Received-Date: Tue, 20 Aug 2013 10:15:30 -0000

The additional Gallium drivers are needed for open source ATI Radeon
and NVIDIA graphics drivers.

The radeonsi and r600 drivers require LLVM 3.3 built with r600
PACKAGECONFIG so they must be explicitly enabled by adding r600 to the
mesa PACKAGECONFIG.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 447e186..e985d67 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -50,6 +50,10 @@ PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disa
 PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
 
 GALLIUMDRIVERS = "swrast"
+GALLIUMDRIVERS_LLVM33 = "${@base_contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
+GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', '', ',${GALLIUMDRIVERS_LLVM33}', d)}"
+GALLIUMDRIVERS_append_x86 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS_append_x86-64 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
-- 
1.8.3.4


