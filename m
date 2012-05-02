Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SPfSQ-0006zV-F5
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 21:43:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 May 2012 12:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="136277565"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2012 12:33:40 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 2 May 2012 12:33:40 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.126]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.202]) with mapi id
	14.01.0355.002; Wed, 2 May 2012 12:33:40 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/6] qt4: fix compilation issue
Thread-Index: AQHNJ+Xlj9vFWvrki0WBjT3zrQBvj5a2T7OAgACVVPA=
Date: Wed, 2 May 2012 19:33:39 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030A6886@ORSMSX106.amr.corp.intel.com>
References: <cover.1335909595.git.nitin.a.kamble@intel.com>
	<b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
	<4FA0AC45.9030102@linux.intel.com>
In-Reply-To: <4FA0AC45.9030102@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] qt4: fix compilation issue
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
X-List-Received-Date: Wed, 02 May 2012 19:43:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, May 01, 2012 8:39 PM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH 1/6] qt4: fix compilation issue
>=20
> On 05/01/2012 03:00 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > gcc 4.7 uncovers a type mismatch in the code. And this commit fixes
> the issue:
> >
> > | /srv/home/nitin/builds/build-
> gcc47/tmp/sysroots/qemux86/usr/include/
> > | glib-2.0/glib/gthread.h:58:7: error: 'union' tag used in naming
> 'struct _GMutex' [-Werror=3Dpermissive] In file included from
> ./wtf/Platform.h:1217:0,
> > |                  from ./config.h:30,
> > |                  from wtf/gobject/GOwnPtr.cpp:19:
> > | wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was
> previously
> > | declared here
> > NOTE: package qt4-x11-free-4.8.1-r41.1: task do_compile: Failed
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> > ---
> >   meta/recipes-qt/qt4/qt-4.8.1.inc                   |    1 +
> >   .../qt4/qt-4.8.1/fix_conflicting_types.patch       |   29
> ++++++++++++++++++++
> >   meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
> >   3 files changed, 31 insertions(+), 1 deletions(-)
> >   create mode 100644
> > meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
> >
> > diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc
> > b/meta/recipes-qt/qt4/qt-4.8.1.inc
> > index 8c38cae..2fc4228 100644
> > --- a/meta/recipes-qt/qt4/qt-4.8.1.inc
> > +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
> > @@ -23,6 +23,7 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-
> everywhere-opensource-src-${PV}.
> >              file://gcc47-fix.patch \
> >              file://gcc47-fix2.patch \
> >              file://disable-fuse-gold-flag.patch \
> > +           file://fix_conflicting_types.patch \
> >              "
> >
> >   SRC_URI[md5sum] =3D "7960ba8e18ca31f0c6e4895a312f92ff"
> > diff --git a/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
> > b/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
> > new file mode 100644
> > index 0000000..8124505
> > --- /dev/null
> > +++ b/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
> > @@ -0,0 +1,29 @@
> > +Upstream-Status: Pending
> > +
> > +This patch fixes the type mismatch fixing this compile issue:
> > +
> > +| /srv/home/nitin/builds/build-
> gcc47/tmp/sysroots/qemux86/usr/include
> > +| /glib-2.0/glib/gthread.h:58:7: error: 'union' tag used in naming
> 'struct _GMutex' [-Werror=3Dpermissive] In file included from
> ./wtf/Platform.h:1217:0,
> > +|                  from ./config.h:30,
> > +|                  from wtf/gobject/GOwnPtr.cpp:19:
> > +| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was
> > +| previously declared here
> > +NOTE: package qt4-x11-free-4.8.1-r41.1: task do_compile: Failed
> > +
> > +
> > +Signed-Off-By: Nitin A Kamble<nitin.a.kamble@intel.com>
> > +2012/04/30
> > +
> > +
> > +Index:
> > +qt-everywhere-opensource-src-
> 4.8.1/src/3rdparty/webkit/Source/JavaScr
> > +iptCore/wtf/gobject/GTypedefs.h
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +---
> > +qt-everywhere-opensource-src-
> 4.8.1/src/3rdparty.orig/webkit/Source/Ja
> > +vaScriptCore/wtf/gobject/GTypedefs.h
> > ++++ qt-everywhere-opensource-src-
> 4.8.1/src/3rdparty/webkit/Source/Jav
> > ++++ aScriptCore/wtf/gobject/GTypedefs.h
> > +@@ -52,7 +52,7 @@ typedef struct _GFile GFile;  typedef struct
> > +_GHashTable GHashTable;  typedef struct _GInputStream GInputStream;
> > +typedef struct _GList GList; -typedef struct _GMutex GMutex;
> > ++typedef union _GMutex GMutex;
> > + typedef struct _GPatternSpec GPatternSpec; typedef struct
> > + _GPollableOutputStream GPollableOutputStream; typedef struct
> > + _GSocketClient GSocketClient;
> > diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > b/meta/recipes-qt/qt4/qt4-x11-free.inc
> > index a59198d..720b1bf 100644
> > --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> > @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
> >   SECTION =3D "x11/libs"
> >   DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext
> libxrender libxrandr libxcursor"
> >
> > -INC_PR =3D "r41"
> > +INC_PR =3D "r42"
> >
> >   QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-
> opengl', '-no-opengl', d)} "
> >   QT_GLFLAGS_qemux86 =3D "-opengl"
>=20
> Nitin,
>=20
> Was this supposed to fix:
> | ccache i586-poky-linux-g++  -m32   -march=3Di586
> --sysroot=3D/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86
> -c -O2 -pipe -feliminate-unused-debug-types -fpermissive -fvisibility-
> inlines-hidden -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align -Wchar-
> subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-
> sign-compare -Wno-switch -Wno-switch-enum -Wundef -Wmissing-noreturn -
> Winit-self -Werror -Wno-c++0x-compat -fno-stack-protector -Wno-c++0x-
> compat -O3 -pthread -fPIC -fPIC -fPIC -D_REENTRANT -DNDEBUG -
> DBUILDING_QT__=3D1 -DNDEBUG -DQT_ASCII_CAST_WARNINGS -
> DBUILDING_JavaScriptCore -DBUILDING_WTF
> -DENABLE_GLIB_SUPPORT=3D1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -
> DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE
> -DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3
> -DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED -
> I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore -
> I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler
> -Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit -
> Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject -
> I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-
> everywhere-opensource-src-
> 4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian
> -Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated -
> I../../Source -I../../include -I/include/QtWebKit -I/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I.moc/release-static -o .obj/release-static/OSRandomSource.o
> wtf/OSRandomSource.cpp
> | moc wtf/qt/MainThreadQt.cpp
> | ccache i586-poky-linux-g++  -m32   -march=3Di586
> --sysroot=3D/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86
> -c -O2 -pipe -feliminate-unused-debug-types -fpermissive -fvisibility-
> inlines-hidden -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align -Wchar-
> subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-
> sign-compare -Wno-switch -Wno-switch-enum -Wundef -Wmissing-noreturn -
> Winit-self -Werror -Wno-c++0x-compat -fno-stack-protector -Wno-c++0x-
> compat -O3 -pthread -fPIC -fPIC -fPIC -D_REENTRANT -DNDEBUG -
> DBUILDING_QT__=3D1 -DNDEBUG -DQT_ASCII_CAST_WARNINGS -
> DBUILDING_JavaScriptCore -DBUILDING_WTF
> -DENABLE_GLIB_SUPPORT=3D1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -
> DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE
> -DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3
> -DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED -
> I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore -
> I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler
> -Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit -
> Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject -
> I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-
> everywhere-opensource-src-
> 4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian
> -Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated -
> I../../Source -I../../include -I/include/QtWebKit -I/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I.moc/release-static -o .obj/release-static/StringQt.o
> wtf/qt/StringQt.cpp
> | moc wtf/qt/ThreadingQt.cpp
> | ccache i586-poky-linux-g++  -m32   -march=3Di586
> --sysroot=3D/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86
> -c -O2 -pipe -feliminate-unused-debug-types -fpermissive -fvisibility-
> inlines-hidden -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align -Wchar-
> subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-
> sign-compare -Wno-switch -Wno-switch-enum -Wundef -Wmissing-noreturn -
> Winit-self -Werror -Wno-c++0x-compat -fno-stack-protector -Wno-c++0x-
> compat -O3 -pthread -fPIC -fPIC -fPIC -D_REENTRANT -DNDEBUG -
> DBUILDING_QT__=3D1 -DNDEBUG -DQT_ASCII_CAST_WARNINGS -
> DBUILDING_JavaScriptCore -DBUILDING_WTF
> -DENABLE_GLIB_SUPPORT=3D1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -
> DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE
> -DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3
> -DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED -
> I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore -
> I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler
> -Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit -
> Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject -
> I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-
> everywhere-opensource-src-
> 4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian
> -Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated -
> I../../Source -I../../include -I/include/QtWebKit -I/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I.moc/release-static -o .obj/release-static/PageAllocationAligned.o
> wtf/PageAllocationAligned.cpp
> | ccache i586-poky-linux-g++  -m32   -march=3Di586
> --sysroot=3D/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86
> -c -O2 -pipe -feliminate-unused-debug-types -fpermissive -fvisibility-
> inlines-hidden -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align -Wchar-
> subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-
> sign-compare -Wno-switch -Wno-switch-enum -Wundef -Wmissing-noreturn -
> Winit-self -Werror -Wno-c++0x-compat -fno-stack-protector -Wno-c++0x-
> compat -O3 -pthread -fPIC -fPIC -fPIC -D_REENTRANT -DNDEBUG -
> DBUILDING_QT__=3D1 -DNDEBUG -DQT_ASCII_CAST_WARNINGS -
> DBUILDING_JavaScriptCore -DBUILDING_WTF
> -DENABLE_GLIB_SUPPORT=3D1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -
> DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE
> -DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3
> -DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED -
> I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore -
> I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler
> -Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit -
> Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject -
> I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-
> everywhere-opensource-src-
> 4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian
> -Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated -
> I../../Source -I../../include -I/include/QtWebKit -I/include
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include
> -I.moc/release-static -o .obj/release-static/PageBlock.o
> wtf/PageBlock.cpp
> | In file included from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/gtypes.h:34:0,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/galloca.h:34,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:32,
> |                  from wtf/gobject/GRefPtr.cpp:24:
> |
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-
> 2.0/include/glibconfig.h:159:16:
> error: 'struct' tag used in naming 'union _GMutex' [-Werror=3Dpermissive]
> | In file included from ./wtf/Platform.h:1217:0,
> |                  from ./config.h:30,
> |                  from wtf/gobject/GRefPtr.cpp:19:
> | wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously
> declared here
> | In file included from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/gasyncqueue.h:34:0,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:34,
> |                  from wtf/gobject/GRefPtr.cpp:24:
> |
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/gthread.h:71:16:
> error: 'struct' tag used in naming 'union _GMutex' [-Werror=3Dpermissive]
> | In file included from ./wtf/Platform.h:1217:0,
> |                  from ./config.h:30,
> |                  from wtf/gobject/GRefPtr.cpp:19:
> | wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously
> declared here
> | cc1plus: all warnings being treated as errors
> | make[2]: *** [.obj/release-static/GRefPtr.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | In file included from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/gtypes.h:34:0,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/galloca.h:34,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:32,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/gobject/gbinding.h:30,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib-
> object.h:25,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/gio/gioenums.h:30,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/gio/giotypes.h:30,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/gio.h:28,
> |                  from wtf/gobject/GOwnPtr.cpp:24:
> |
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-
> 2.0/include/glibconfig.h:159:16:
> error: 'struct' tag used in naming 'union _GMutex' [-Werror=3Dpermissive]
> | In file included from ./wtf/Platform.h:1217:0,
> |                  from ./config.h:30,
> |                  from wtf/gobject/GOwnPtr.cpp:19:
> | wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously
> declared here
> | In file included from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/gasyncqueue.h:34:0,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:34,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/buERROR:
> Function failed: do_compile (see
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-
> r42.1/temp/log.do_compile.14166
> for further information)
> | ild/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/gobject/gbinding.h:30,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib-
> object.h:25,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/gio/gioenums.h:30,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/gio/giotypes.h:30,
> |                  from
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/gio.h:28,
> |                  from wtf/gobject/GOwnPtr.cpp:24:
> |
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/sysroots/qemux86/usr/include/glib-
> 2.0/glib/gthread.h:71:16:
> error: 'struct' tag used in naming 'union _GMutex' [-Werror=3Dpermissive]
> | In file included from ./wtf/Platform.h:1217:0,
> |                  from ./config.h:30,
> |                  from wtf/gobject/GOwnPtr.cpp:19:
> | wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously
> declared here
> | cc1plus: all warnings being treated as errors
> | make[2]: *** [.obj/release-static/GOwnPtr.o] Error 1
> | make[2]: Leaving directory
> `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-
> everywhere-opensource-src-
> 4.8.1/src/3rdparty/webkit/Source/JavaScriptCore'
> | make[1]: ***
> [sub-JavaScriptCore-JavaScriptCore-pro-make_default-ordered] Error 2
> | make[1]: *** Waiting for unfinished jobs....
> | make[1]: Leaving directory
> `/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-
> x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-
> everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source'
> | make: *** [sub-webkit-make_default-ordered] Error 2
> | ERROR: oe_runmake failed
>=20
> Your patch is included in this build, but still seems to fail.
>=20
> Sau!
>=20
>=20
This is not failing for me.

Nitin



