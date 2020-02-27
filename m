Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDDA605DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:25:05 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j7BfW-0007BA-DF
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Feb 2020 06:25:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Z7p9I4og7mjxVgu6AWVxSZ5pj3WPzZ/vZfKcJt3udI=;
	b=Ps0r8mungLZ/BFcI/y4rChawfK
	eHmcLh1BZjyC/AVHHHnId8m0XfFQVF4acQK+igZKFsoY71FngxWQog8cZV5SvL03+JoDuM0wZE50A
	0lCbAWy06w8D89dhxEyqJyNhzQjFz2K/1C5dUXM5NWHL2XvKDQPFzyk2s9+gJysnaMROn+t9dzpT6
	YgSR4GxscxynBBV2/4ZqWQMa8vEr0I6CkvuW7HXqE30Wbs6L91CrFRId0hk5s+MiSUEZEuZ/Qjsud
	yGrbmm3iNjYcx1qPdTNSFYjvKJtN77wk8XLiS4KcoKeL64XjXUbKH9cQmgd2JIlK5NOHr2PSEwppv
	WTaX2JsQ==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j7BfS-00020C-FQ; Thu, 27 Feb 2020 06:25:04 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 06:24:48 +0100
Message-Id: <20200227052448.65435-5-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227052448.65435-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -2.0 (--)
X-Scan-Signature: b6eb8dd8d4e483f7ae84ef827401bc57
X-Spam-Tracer: backend.mail.pr.hu -2.0 20200227052504Z
Subject: [PATCH v2 4/4] mesa: Add PACKAGECONFIG knob to enable VDPAU state tracker and drivers
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
X-List-Received-Date: Thu, 27 Feb 2020 05:25:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: Replaced FILES_${PN}-vdpau-drivers with FILES_mesa-vdpau-drivers
    to match the name in PACKAGES.

 meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 479d3223fa..800e8813c7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -144,6 +144,8 @@ PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llv
 PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
 PACKAGECONFIG[va] = "-Dgallium-va=true,-Dgallium-va=false,libva-initial"
 
+PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=true,-Dgallium-vdpau=false,libvdpau"
+
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
@@ -179,6 +181,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
+             mesa-vdpau-drivers \
             "
 
 do_install_append () {
@@ -256,6 +259,7 @@ PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-defaults.conf"
 FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
+FILES_mesa-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
@@ -265,7 +269,7 @@ FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 FILES_libxatracker = "${libdir}/libxatracker.so.*"
 
-FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
+FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-- 
2.24.1


