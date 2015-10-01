Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id E5F0977088
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:49:54 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AOAgCYOQ1W/5tjdVteHAEBgwkjMW65TIQhAQ2BUSAKhXkCgTE4FAEBAQEBAQGBCoQlAQEESwE9UVcZiDIBCL0RAY5ZAQEIAiCGc4oSF4IXDEGBMQWHNo5DhRaHfokGkk0fAQFChAQ8MwGJdwEBAQ
X-IPAS-Result: A2AOAgCYOQ1W/5tjdVteHAEBgwkjMW65TIQhAQ2BUSAKhXkCgTE4FAEBAQEBAQGBCoQlAQEESwE9UVcZiDIBCL0RAY5ZAQEIAiCGc4oSF4IXDEGBMQWHNo5DhRaHfokGkk0fAQFChAQ8MwGJdwEBAQ
X-IronPort-AV: E=Sophos;i="5.17,617,1437429600"; d="scan'208";a="28843000"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 01 Oct 2015 15:49:50 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZheF4-0007Uf-Ow; Thu, 01 Oct 2015 15:49:50 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 15:49:49 +0200
Message-Id: <1443707390-26567-2-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443707390-26567-1-git-send-email-clopez@igalia.com>
References: <1443707390-26567-1-git-send-email-clopez@igalia.com>
Subject: [PATCH 1/2] webkitgtk: Use ON/OFF for cmake switches.
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
X-List-Received-Date: Thu, 01 Oct 2015 13:49:55 -0000

  * This is a cosmetic patch.

  * Using ON/OFF instead of True/False is exactly the same for cmake
    (is case insensitive).

  * But WebKitGTK+ preffers (and uses) the first option. So when you
    check which values were enabled for the build (at log.do_configure)
    you will see that every option that was not modified will print either
    OFF or ON, meanwhile the options modified by this recipe will print
    True or False. For example:

         [...]
         --  ENABLE_THREADED_COMPOSITOR                OFF
         --  ENABLE_PLUGIN_PROCESS_GTK2 .............. ON
         --  ENABLE_MINIBROWSER                        True
         [...]

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index 859d0cb..e92c6b1 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -34,26 +34,26 @@ DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		-DCMAKE_BUILD_TYPE=Release \
-		-DENABLE_INTROSPECTION=False \
-		-DENABLE_MINIBROWSER=True \
-	        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-DENABLE_WEBGL=True', '-DENABLE_WEBGL=False', d)} \
+		-DENABLE_INTROSPECTION=OFF \
+		-DENABLE_MINIBROWSER=ON \
+	        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-DENABLE_WEBGL=ON', '-DENABLE_WEBGL=OFF', d)} \
 		"
 
 # Javascript JIT is not supported on powerpc
-EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=False "
-EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=False "
+EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
 
 # ARM JIT code does not build on ARMv5/6 anymore, apparently they test only on v7 onwards
-EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=False "
-EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=False "
+EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
 
 # binutils 2.25.1 has a bug on aarch64:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
-EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=False "
+EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
-EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=False "
-EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=False "
+EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=OFF "
 
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
-- 
2.1.4


