Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPQYa-0006KC-En
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 05:48:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2012 20:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138992445"
Received: from unknown (HELO [10.255.12.167]) ([10.255.12.167])
	by orsmga002.jf.intel.com with ESMTP; 01 May 2012 20:38:46 -0700
Message-ID: <4FA0AC45.9030102@linux.intel.com>
Date: Tue, 01 May 2012 20:38:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335909595.git.nitin.a.kamble@intel.com>
	<b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
In-Reply-To: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
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
X-List-Received-Date: Wed, 02 May 2012 03:48:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 03:00 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> gcc 4.7 uncovers a type mismatch in the code. And this commit fixes the issue:
>
> | /srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7: error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
> | In file included from ./wtf/Platform.h:1217:0,
> |                  from ./config.h:30,
> |                  from wtf/gobject/GOwnPtr.cpp:19:
> | wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously declared here
> NOTE: package qt4-x11-free-4.8.1-r41.1: task do_compile: Failed
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-qt/qt4/qt-4.8.1.inc                   |    1 +
>   .../qt4/qt-4.8.1/fix_conflicting_types.patch       |   29 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>   3 files changed, 31 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
>
> diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
> index 8c38cae..2fc4228 100644
> --- a/meta/recipes-qt/qt4/qt-4.8.1.inc
> +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
> @@ -23,6 +23,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
>              file://gcc47-fix.patch \
>              file://gcc47-fix2.patch \
>              file://disable-fuse-gold-flag.patch \
> +           file://fix_conflicting_types.patch \
>              "
>
>   SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
> diff --git a/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch b/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
> new file mode 100644
> index 0000000..8124505
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
> @@ -0,0 +1,29 @@
> +Upstream-Status: Pending
> +
> +This patch fixes the type mismatch fixing this compile issue:
> +
> +| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7: error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
> +| In file included from ./wtf/Platform.h:1217:0,
> +|                  from ./config.h:30,
> +|                  from wtf/gobject/GOwnPtr.cpp:19:
> +| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously declared here
> +NOTE: package qt4-x11-free-4.8.1-r41.1: task do_compile: Failed
> +
> +
> +Signed-Off-By: Nitin A Kamble<nitin.a.kamble@intel.com>
> +2012/04/30
> +
> +
> +Index:  qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
> +===================================================================
> +--- qt-everywhere-opensource-src-4.8.1/src/3rdparty.orig/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
> ++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
> +@@ -52,7 +52,7 @@ typedef struct _GFile GFile;
> + typedef struct _GHashTable GHashTable;
> + typedef struct _GInputStream GInputStream;
> + typedef struct _GList GList;
> +-typedef struct _GMutex GMutex;
> ++typedef union _GMutex GMutex;
> + typedef struct _GPatternSpec GPatternSpec;
> + typedef struct _GPollableOutputStream GPollableOutputStream;
> + typedef struct _GSocketClient GSocketClient;
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index a59198d..720b1bf 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
>   SECTION = "x11/libs"
>   DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
>
> -INC_PR = "r41"
> +INC_PR = "r42"
>
>   QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
>   QT_GLFLAGS_qemux86 = "-opengl"

Nitin,

Was this supposed to fix:
| ccache i586-poky-linux-g++  -m32   -march=i586 
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86 
-c -O2 -pipe -feliminate-unused-debug-types -fpermissive 
-fvisibility-inlines-hidden 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align 
-Wchar-subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter 
-Wno-sign-compare -Wno-switch -Wno-switch-enum -Wundef 
-Wmissing-noreturn -Winit-self -Werror -Wno-c++0x-compat 
-fno-stack-protector -Wno-c++0x-compat -O3 -pthread -fPIC -fPIC -fPIC 
-D_REENTRANT -DNDEBUG -DBUILDING_QT__=1 -DNDEBUG 
-DQT_ASCII_CAST_WARNINGS -DBUILDING_JavaScriptCore -DBUILDING_WTF 
-DENABLE_GLIB_SUPPORT=1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE 
-DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE 
-DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3 
-DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED 
-I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore 
-I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler 
-Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit 
-Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian 
-Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated 
-I../../Source -I../../include -I/include/QtWebKit -I/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include 
-I.moc/release-static -o .obj/release-static/OSRandomSource.o 
wtf/OSRandomSource.cpp
| moc wtf/qt/MainThreadQt.cpp
| ccache i586-poky-linux-g++  -m32   -march=i586 
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86 
-c -O2 -pipe -feliminate-unused-debug-types -fpermissive 
-fvisibility-inlines-hidden 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align 
-Wchar-subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter 
-Wno-sign-compare -Wno-switch -Wno-switch-enum -Wundef 
-Wmissing-noreturn -Winit-self -Werror -Wno-c++0x-compat 
-fno-stack-protector -Wno-c++0x-compat -O3 -pthread -fPIC -fPIC -fPIC 
-D_REENTRANT -DNDEBUG -DBUILDING_QT__=1 -DNDEBUG 
-DQT_ASCII_CAST_WARNINGS -DBUILDING_JavaScriptCore -DBUILDING_WTF 
-DENABLE_GLIB_SUPPORT=1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE 
-DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE 
-DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3 
-DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED 
-I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore 
-I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler 
-Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit 
-Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian 
-Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated 
-I../../Source -I../../include -I/include/QtWebKit -I/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include 
-I.moc/release-static -o .obj/release-static/StringQt.o wtf/qt/StringQt.cpp
| moc wtf/qt/ThreadingQt.cpp
| ccache i586-poky-linux-g++  -m32   -march=i586 
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86 
-c -O2 -pipe -feliminate-unused-debug-types -fpermissive 
-fvisibility-inlines-hidden 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align 
-Wchar-subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter 
-Wno-sign-compare -Wno-switch -Wno-switch-enum -Wundef 
-Wmissing-noreturn -Winit-self -Werror -Wno-c++0x-compat 
-fno-stack-protector -Wno-c++0x-compat -O3 -pthread -fPIC -fPIC -fPIC 
-D_REENTRANT -DNDEBUG -DBUILDING_QT__=1 -DNDEBUG 
-DQT_ASCII_CAST_WARNINGS -DBUILDING_JavaScriptCore -DBUILDING_WTF 
-DENABLE_GLIB_SUPPORT=1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE 
-DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE 
-DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3 
-DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED 
-I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore 
-I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler 
-Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit 
-Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian 
-Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated 
-I../../Source -I../../include -I/include/QtWebKit -I/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include 
-I.moc/release-static -o .obj/release-static/PageAllocationAligned.o 
wtf/PageAllocationAligned.cpp
| ccache i586-poky-linux-g++  -m32   -march=i586 
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86 
-c -O2 -pipe -feliminate-unused-debug-types -fpermissive 
-fvisibility-inlines-hidden 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align 
-Wchar-subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter 
-Wno-sign-compare -Wno-switch -Wno-switch-enum -Wundef 
-Wmissing-noreturn -Winit-self -Werror -Wno-c++0x-compat 
-fno-stack-protector -Wno-c++0x-compat -O3 -pthread -fPIC -fPIC -fPIC 
-D_REENTRANT -DNDEBUG -DBUILDING_QT__=1 -DNDEBUG 
-DQT_ASCII_CAST_WARNINGS -DBUILDING_JavaScriptCore -DBUILDING_WTF 
-DENABLE_GLIB_SUPPORT=1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE 
-DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE 
-DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3 
-DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED 
-I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore 
-I../../../../../include -I. -I../../Source -I../ThirdParty -Iassembler 
-Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit 
-Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian 
-Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated 
-I../../Source -I../../include -I/include/QtWebKit -I/include 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/freetype2 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0 
-I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include 
-I.moc/release-static -o .obj/release-static/PageBlock.o wtf/PageBlock.cpp
| In file included from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gtypes.h:34:0,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/galloca.h:34,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:32,
|                  from wtf/gobject/GRefPtr.cpp:24:
| 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include/glibconfig.h:159:16: 
error: 'struct' tag used in naming 'union _GMutex' [-Werror=permissive]
| In file included from ./wtf/Platform.h:1217:0,
|                  from ./config.h:30,
|                  from wtf/gobject/GRefPtr.cpp:19:
| wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously 
declared here
| In file included from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gasyncqueue.h:34:0,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:34,
|                  from wtf/gobject/GRefPtr.cpp:24:
| 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:71:16: 
error: 'struct' tag used in naming 'union _GMutex' [-Werror=permissive]
| In file included from ./wtf/Platform.h:1217:0,
|                  from ./config.h:30,
|                  from wtf/gobject/GRefPtr.cpp:19:
| wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously 
declared here
| cc1plus: all warnings being treated as errors
| make[2]: *** [.obj/release-static/GRefPtr.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| In file included from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gtypes.h:34:0,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/galloca.h:34,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:32,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gobject/gbinding.h:30,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib-object.h:25,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/gioenums.h:30,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/giotypes.h:30,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/gio.h:28,
|                  from wtf/gobject/GOwnPtr.cpp:24:
| 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/lib/glib-2.0/include/glibconfig.h:159:16: 
error: 'struct' tag used in naming 'union _GMutex' [-Werror=permissive]
| In file included from ./wtf/Platform.h:1217:0,
|                  from ./config.h:30,
|                  from wtf/gobject/GOwnPtr.cpp:19:
| wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously 
declared here
| In file included from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gasyncqueue.h:34:0,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib.h:34,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/buERROR: 
Function failed: do_compile (see 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/temp/log.do_compile.14166 
for further information)
| ild/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gobject/gbinding.h:30,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib-object.h:25,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/gioenums.h:30,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/giotypes.h:30,
|                  from 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/gio/gio.h:28,
|                  from wtf/gobject/GOwnPtr.cpp:24:
| 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:71:16: 
error: 'struct' tag used in naming 'union _GMutex' [-Werror=permissive]
| In file included from ./wtf/Platform.h:1217:0,
|                  from ./config.h:30,
|                  from wtf/gobject/GOwnPtr.cpp:19:
| wtf/gobject/GTypedefs.h:55:15: note: 'union _GMutex' was previously 
declared here
| cc1plus: all warnings being treated as errors
| make[2]: *** [.obj/release-static/GOwnPtr.o] Error 1
| make[2]: Leaving directory 
`/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore'
| make[1]: *** 
[sub-JavaScriptCore-JavaScriptCore-pro-make_default-ordered] Error 2
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory 
`/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/qt4-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source'
| make: *** [sub-webkit-make_default-ordered] Error 2
| ERROR: oe_runmake failed

Your patch is included in this build, but still seems to fail.

Sau!





