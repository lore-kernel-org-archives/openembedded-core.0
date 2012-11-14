Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TYha8-0007k4-8r
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 19:21:01 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B257CF8121C; Wed, 14 Nov 2012 11:07:05 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5CA4FF81202;
	Wed, 14 Nov 2012 11:07:04 -0700 (MST)
Message-ID: <50A3DDD7.9080205@mlbassoc.com>
Date: Wed, 14 Nov 2012 11:07:19 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Can't build qt4-x11-free
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
X-List-Received-Date: Wed, 14 Nov 2012 18:21:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

| arm-poky-linux-gnueabi-g++  -march=armv5te  -marm -mthumb-interwork  -mtune=arm926ej-s --sysroot=/local/qemuarm_test/tmp/sysroots/qemuarm 
-Wl,-rpath-link,/local/qemuarm_test/tmp/sysroots/qemuarm/usr/lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed 
-Wl,-rpath-link,/local/qemuarm_test/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free-4.8.1-r47.1/qt-everywhere-opensource-src-4.8.1/lib 
-Wl,-rpath-link,/local/qemuarm_test/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free-4.8.1-r47.1/qt-everywhere-opensource-src-4.8.1/lib -shared -o libphonon_gstreamer.so 
.obj/release-shared/abstractrenderer.o .obj/release-shared/artssink.o .obj/release-shared/audioeffect.o .obj/release-shared/audiooutput.o .obj/release-shared/audiodataoutput.o 
.obj/release-shared/backend.o .obj/release-shared/devicemanager.o .obj/release-shared/effect.o .obj/release-shared/effectmanager.o .obj/release-shared/glrenderer.o 
.obj/release-shared/gsthelper.o .obj/release-shared/medianode.o .obj/release-shared/medianodeevent.o .obj/release-shared/mediaobject.o .obj/release-shared/message.o 
.obj/release-shared/phononsrc.o .obj/release-shared/qwidgetvideosink.o .obj/release-shared/streamreader.o .obj/release-shared/videowidget.o .obj/release-shared/volumefadereffect.o 
.obj/release-shared/widgetrenderer.o .obj/release-shared/x11renderer.o .obj/release-shared/moc_devicemanager.o .obj/release-shared/moc_effectmanager.o 
.obj/release-shared/moc_glrenderer.o   -L/local/qemuarm_test/tmp/sysroots/qemuarm/usr/lib 
-L/local/qemuarm_test/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free-4.8.1-r47.1/qt-everywhere-opensource-src-4.8.1/lib -pthread -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 
-lgthread-2.0 -lrt -lxml2 -lgstinterfaces-0.10 -lgstvideo-0.10 -lgstbase-0.10 -lgstaudio-0.10 -L/local/qemuarm_test/tmp/sysroots/qemuarm/usr/lib -lphonon 
-L/local/qemuarm_test/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free-4.8.1-r47.1/qt-everywhere-opensource-src-4.8.1/lib -lpulse-mainloop-glib -lpulse -lglib-2.0 -lQtDBus -lQtXml 
-lQtOpenGL -lQtGui -lQtCore -lGLU -lGL -lpthread
| /local/qemuarm_test/tmp/sysroots/i686-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: cannot find -lGLU

This happens because of this commit:
$ git log meta/recipes-graphics/mesa/mesa-common.inc
commit 662a445b30af4d7538c3e7081dd9403acd006938
Author: Daniel Stone <daniel@fooishbar.org>
Date:   Fri Oct 26 16:00:09 2012 +0100

     mesa: Build separate GLU library

     Mesa has removed GLU from the core tree upstream, so remove it from the
     Mesa build and add the separate tarball as a new recipe.

     (From OE-Core rev: 4395691a44b198ba0b9a969cbade669e8de07a4f)

     Signed-off-by: Daniel Stone <daniel@fooishbar.org>
     Signed-off-by: Ross Burton <ross.burton@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adding 'libglu' to the DEPENDS in
   meta/recipes-qt/qt4/qt4-x11-free.inc:DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
fixes the build, but doesn't that doesn't seem quite right since currently
it's the mesa* recipe which forced this split, but some other instance
of virtual/libgl might not.

So, how do I best to fix the build with this new setup?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


