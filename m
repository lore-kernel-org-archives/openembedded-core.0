Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REj3a-0007WH-PN for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:48:19 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EEnE6K020028 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:49:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9iQxsUgRAxCt
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:49:14 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EEnB5X020014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:49:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 15:42:28 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318603356.2342.20.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 14:48:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 603438e..795144a 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -4,7 +4,11 @@ LIB_DEPS += "libdrm expat"
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
 
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers"
+DRIDRIVERS = "swrast"
+DRIDRIVERS_x86 = "swrast,i915,i965"
+DRIDRIVERS_x86-64 = "swrast,i915,i965"
+
+EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=${DRIDRIVERS}"
 
 python populate_packages_prepend() {
 	import os.path
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 6a4f9a9..5d25127 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -2,7 +2,3 @@ include mesa-common.inc
 include mesa-${PV}.inc
 include mesa-dri.inc
 PR = "${INC_PR}.0"
-
-EXTRA_OECONF += "--with-dri-drivers=swrast,i915,i965"
-
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 15cde60..a0e1945 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -7,5 +7,3 @@ DEFAULT_PREFERENCE = "-2"
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-




