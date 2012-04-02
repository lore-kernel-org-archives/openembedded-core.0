Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SEfvD-0002BE-QX for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 13:59:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q32BoaF8008156
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Apr 2012 12:50:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03987-08 for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2012 12:50:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q32BoO0P008150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Apr 2012 12:50:27 +0100
Message-ID: <1333367425.647.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Apr 2012 12:50:25 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gst-ffmpeg: Fix build failures from sstate relocation
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
X-List-Received-Date: Mon, 02 Apr 2012 11:59:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a similar situation to:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3c96a5386355969428163ddb60216cc989e00b3d
    
Builds were failing with a failure in configure:
    
| checking for i586-poky-linux-gcc... ccache  i586-poky-linux-gcc  -m32   -march=i586 -L/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib
| checking whether the C compiler works... no
| configure: error: in `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/gst-ffmpeg-0.10.13-r2/gst-ffmpeg-0.10.13':
| configure: error: C compiler cannot create executables
| See `config.log' for more details
    
config.log shows:
    
configure:3976: ccache  i586-poky-linux-gcc  -m32   -march=i586 -L/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  >&5
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/../../libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: cannot find crt1.o: No such file or directory
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/../../libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: cannot find crti.o: No such file or directory
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/../../libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: cannot find crtbegin.o: No such file or directory
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/../../libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: cannot find -lgcc
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/../../libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: cannot find -lgcc_s
collect2: ld returned 1 exit status
    
The reason being the --sysroot option is missing from the gcc commandline and
its looking in nightly-x86, not nightly-world in this case.
    
There is no reason to add extra -L options to the compiler, the sysroot already
takes care of this. We can therefore simply remove this incorrect CC line.
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 3b607bf..a166290 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
 SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
 
-PR = "r2"
+PR = "r3"
 
 GSTREAMER_DEBUG ?= "--disable-debug"
 EXTRA_OECONF = "--with-ffmpeg-extra-configure=\"--target-os=linux\" ${GSTREAMER_DEBUG}"
@@ -37,6 +37,3 @@ FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"



