Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
 by mx.groups.io with SMTP id smtpd.web10.6046.1588858415314116161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=SqQcqa3L;
 spf=pass (domain: pr.hu, ip: 87.242.0.9, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeb-00074S-TT
	for openembedded-core@lists.openembedded.org; Thu, 07 May 2020 15:33:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xpG0PY7m9+niW/6y+D2JF+mE4bQtr2f7MQiXBojFpwg=; b=SqQcqa3LYHtUL86UKJ30PBG64f
	oEDAgrnGb45wK9DuHGGMkm6kbofaNoBdlMplt7sPdHvVkkk0E2bnTiFJMSkE3Pw75aPn+XjRuYURY
	whkPOw9MurVjt5qDJ/1t+/ydb8rA50JDk/AxENn3aXoADHkvga68IS2GiKQB3F62LCH57CGb0+mKX
	2IbBrJMZaAZ1LT5i3eCUl/QZsercFfhrAxzrNyZMtvi/P+0pIvQM8TAQzAAHHS0feePbH/9iPBUnx
	+dLm3IXSbLgodx55Sut8JaYFBD/Er6C6zTX1vZaMwfT0db4JZzfw1xKL5TMZZNURaGnRHjeggpHYY
	k5oTaZeA==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197] helo=zolilaptop.sicom.com)
	by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeX-00055M-Vv; Thu, 07 May 2020 15:33:31 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
Subject: [PATCH v3 4/4] mesa: Add PACKAGECONFIG knob to enable VDPAU state tracker and drivers
Date: Thu,  7 May 2020 15:33:01 +0200
Message-Id: <20200507133301.4336-5-zboszor@pr.hu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507133301.4336-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
 <20200507133301.4336-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Scan-Signature: 62ab2c1fe565f499513796e83ed81713
X-Spam-Tracer: backend.mail.pr.hu -1.0 20200507133331Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: Replaced FILES_${PN}-vdpau-drivers with FILES_mesa-vdpau-drivers
    to match the name in PACKAGES.
v3: Rebased to current master

 meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7a889a5b11..fede691d6f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -144,6 +144,8 @@ PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llv
 PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
 PACKAGECONFIG[va] = "-Dgallium-va=true,-Dgallium-va=false,libva-initial"
 
+PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=true,-Dgallium-vdpau=false,libvdpau"
+
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
@@ -180,6 +182,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
+             mesa-vdpau-drivers \
             "
 
 do_install_append () {
@@ -257,6 +260,7 @@ PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-defaults.conf"
 FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
+FILES_${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
@@ -266,7 +270,7 @@ FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 FILES_libxatracker = "${libdir}/libxatracker.so.*"
 
-FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
+FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-- 
2.26.2

