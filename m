Return-Path: <fgretief@gmail.com>
Received: from mail-lb0-f193.google.com (mail-lb0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id CB2D06AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 16:16:12 +0000 (UTC)
Received: by mail-lb0-f193.google.com with SMTP id v20so1266183lbc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8UmxVHdhTIzTs3nFFVqGVKJVRsnJtajetsUnIwjJ7TE=;
	b=haO/hwR4RNEQDoZBeK0UsTYvzGMp8cTItjFMcFceY+/ueHlqN2GjY6oM+utC/tc083
	h60Qt7uXEofZLX9P1nSjVw7LiGCFrvSYjHQyxipaK6M/Kywj4fZHi8IkJi2goUv7NKfP
	2cMmInRMyhay5h9m2XzC4kGbS8sTflxMh+bfR+FkHIaP1z5925GJglCGaNQW5+zPKiCB
	Z1aydWLgUeLtsQiQ73OvlT6+1ej6nmN1yrA5dUWjqQYlPPtXCvQeuXKlgNwpHPUw12l0
	6ziRxXShtj+o0kvp3eRng47eYuBRGqFcE/eLm84U6UH5/y+pyTG5uYHeke7vbh9v5XJ2
	lUiA==
MIME-Version: 1.0
X-Received: by 10.152.116.7 with SMTP id js7mr6319046lab.11.1376064972556;
	Fri, 09 Aug 2013 09:16:12 -0700 (PDT)
Received: by 10.152.37.102 with HTTP; Fri, 9 Aug 2013 09:16:12 -0700 (PDT)
Date: Fri, 9 Aug 2013 18:16:12 +0200
Message-ID: <CAFpw0gLwDcf-yULb7UDX=MS=PH3=AU0iMf+_0zaG-Ov1mELKyw@mail.gmail.com>
From: Francois Retief <fgretief@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-mingw] eglibc-initial package getting in the way
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
X-List-Received-Date: Fri, 09 Aug 2013 16:16:14 -0000
Content-Type: multipart/alternative; boundary=001a11c2672ae08d5404e38617ab

--001a11c2672ae08d5404e38617ab
Content-Type: text/plain; charset=ISO-8859-1

Hallo,

I am working on a MinGW SDK layer for OpenEmbedded.  At this point, I got
to the
point where the "gcc-crosssdk" package builds successfully.

My next target is to build the "nativesdk-libgcc" package. But the
"nativesdk-eglibc-initial package" is getting in the way. As one can see
from
the log output below, eglibc, it complains that the mingw32 environment is
not
supported.

So I switched TCLIBC in local.conf to "uclibc" in the hope that it would do
better,
but same error message. Same package gets built.

Also there is a BitBake warning about multiple package that provides the
same libc-for-gcc package. But when I run gcc-crosssdk, there is no such
clash.

Thus my question is, where does the eglibc package get included in the
dependency
tree? I worked through the package-depends.dot file to try and find what is
referencing this package but with no luck.

Cheers
  Francois

ps. My MinGW work is captured in this git repository:
 https://github.com/fgretief/meta-mingw.git

$ SDKMACHINE=x86_64-mingw32  bitbake  nativesdk-libgcc  -c compile

Build Configuration:
BB_VERSION        = "1.19.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-19"
TARGET_SYS        = "arm-oe-linux-uclibceabi"
MACHINE           = "qemuarm"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv5 thumb dsp"
TARGET_FPU        = "soft"
meta-mingw        = "master:018333e3c2fd77bdf0a21c042cbc6b28c6eeb42f"
meta              = "master:f192c444c2d88c49738bea4ff4c3af0cc72916de"

Other variables:  (from -e output)
TCLIBC            = "uclibc"
SDK_PREFIX        = "x86_64-oesdk-mingw32-"
TARGET_PREFIX     = "x86_64-oesdk-mingw32-"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
virtual/nativesdk-x86_64-oesdk-mingw32-libc-for-gcc
(virtual:nativesdk:/opt/core-oe/sources/openembedded-core/meta/recipes-core/eglibc/
eglibc_2.18.bb
 virtual:nativesdk:/opt/core-oe/sources/meta-mingw/recipes-devtools/mingw-w64/
mingw-w64-runtime_2.0.8.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/opt/core-oe/tmp-uclibc/work/x86_64-nativesdk-oesdk-mingw32/nativesdk-eglibc-initial/2.18-r0/temp/log.do_configure.23538)
ERROR: Logfile of failure stored in:
/opt/core-oe/tmp-uclibc/work/x86_64-nativesdk-oesdk-mingw32/nativesdk-eglibc-initial/2.18-r0/temp/log.do_configure.23538
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'common-mingw', 'bit-64',
'x86_64-mingw32', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| aclocal.m4:5: error: Exactly version 2.68 of Autoconf is required but you
have 2.69
| aclocal.m4:5: the top level
| autom4te: m4 failed with exit status: 63
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-oesdk-mingw32
| checking for x86_64-oesdk-mingw32-gcc... x86_64-oesdk-mingw32-gcc
--sysroot=/opt/core-oe/tmp-uclibc/sysroots/x86_64-nativesdk-oesdk-mingw32
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether x86_64-oesdk-mingw32-gcc
--sysroot=/opt/core-oe/tmp-uclibc/sysroots/x86_64-nativesdk-oesdk-mingw32
accepts -g... yes
| checking for gcc... gcc
| checking whether we are using the GNU C++ compiler... yes
| checking whether x86_64-oesdk-mingw32-g++
--sysroot=/opt/core-oe/tmp-uclibc/sysroots/x86_64-nativesdk-oesdk-mingw32
accepts -g... yes
| checking for x86_64-oesdk-mingw32-readelf... x86_64-oesdk-mingw32-readelf
| checking for sysdeps preconfigure fragments... x86_64 checking whether
x86_64-oesdk-mingw32-gcc
--sysroot=/opt/core-oe/tmp-uclibc/sysroots/x86_64-nativesdk-oesdk-mingw32
compiles in -mx32 mode by default... no
|
| configure: running configure fragment for add-on libidn
| configure: running configure fragment for add-on nptl
| checking add-on ports for preconfigure fragments... aarch64 alpha am33
arm hppa ia64 m68k microblaze mips powerpc tile
| checking for assembler and linker STT_GNU_IFUNC support... no
| checking whether .text pseudo-op must be used... yes
|
| checking sysdep dirs... configure: error: Operating system mingw32 is not
supported.
|
| ERROR: Function failed: do_configure (log file is located at
/opt/core-oe/tmp-uclibc/work/x86_64-nativesdk-oesdk-mingw32/nativesdk-eglibc-initial/2.18-r0/temp/log.do_configure.23538)
ERROR: Task 235
(virtual:nativesdk:/opt/core-oe/sources/openembedded-core/meta/recipes-core/eglibc/
eglibc-initial_2.18.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 602 tasks of which 595 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:

virtual:nativesdk:/opt/core-oe/sources/openembedded-core/meta/recipes-core/eglibc/
eglibc-initial_2.18.bb, do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--001a11c2672ae08d5404e38617ab
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hallo,<br><br>I am working on a MinGW SDK layer for OpenEm=
bedded.=A0 At this point, I got to the <br>point where the &quot;gcc-crosss=
dk&quot; package builds successfully. <br><br>My next target is to build th=
e &quot;nativesdk-libgcc&quot; package. But the <br>
&quot;nativesdk-eglibc-initial package&quot; is getting in the way. As one =
can see from <br>the log output below, eglibc, it complains that the mingw3=
2 environment is not <br>supported.<br><br>So I switched TCLIBC in local.co=
nf to &quot;uclibc&quot; in the hope that it would do better, <br>
but same error message. Same package gets built.<br><br>Also there is a Bit=
Bake warning about multiple package that provides the same libc-for-gcc pac=
kage. But when I run gcc-crosssdk, there is no such clash.<br><br>Thus my q=
uestion is, where does the eglibc package get included in the dependency <b=
r>
tree? I worked through the package-depends.dot file to try and find what is=
 <br>referencing this package but with no luck.<br><br>Cheers<br>=A0 Franco=
is<br><br>ps. My MinGW work is captured in this git repository:<br>=A0<a hr=
ef=3D"https://github.com/fgretief/meta-mingw.git">https://github.com/fgreti=
ef/meta-mingw.git</a><br>
<br><span style=3D"font-family:courier new,monospace">$ SDKMACHINE=3Dx86_64=
-mingw32=A0 bitbake=A0 nativesdk-libgcc=A0 -c compile<br><br>Build Configur=
ation:<br>BB_VERSION=A0=A0=A0=A0=A0=A0=A0 =3D &quot;1.19.1&quot;<br>BUILD_S=
YS=A0=A0=A0=A0=A0=A0=A0=A0 =3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=A0=A0 =3D &quot;Fedora-19&quot;<br>TARGET_SYS=A0=A0=A0=A0=
=A0=A0=A0 =3D &quot;arm-oe-linux-uclibceabi&quot;<br>MACHINE=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 =3D &quot;qemuarm&quot;<br>DISTRO_VERSION=A0=A0=A0 =3D &quo=
t;oe-core.0&quot;<br>TUNE_FEATURES=A0=A0=A0=A0 =3D &quot;armv5 thumb dsp&qu=
ot;<br>
TARGET_FPU=A0=A0=A0=A0=A0=A0=A0 =3D &quot;soft&quot;<br>meta-mingw=A0=A0=A0=
=A0=A0=A0=A0 =3D &quot;master:018333e3c2fd77bdf0a21c042cbc6b28c6eeb42f&quot=
;<br>meta=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D &quot;master:f192c444c=
2d88c49738bea4ff4c3af0cc72916de&quot;<br><br>Other variables:=A0 (from -e o=
utput)<br>
TCLIBC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D &quot;uclibc&quot;<br>SDK_PREFI=
X=A0=A0=A0=A0=A0=A0=A0 =3D &quot;x86_64-oesdk-mingw32-&quot;<br>TARGET_PREF=
IX=A0=A0=A0=A0 =3D &quot;x86_64-oesdk-mingw32-&quot;<br><br>NOTE: Resolving=
 any missing task queue dependencies<br>NOTE: Preparing runqueue<br>
ERROR: Multiple .bb files are due to be built which each provide virtual/na=
tivesdk-x86_64-oesdk-mingw32-libc-for-gcc <br>(virtual:nativesdk:/opt/core-=
oe/sources/openembedded-core/meta/recipes-core/eglibc/<a href=3D"http://egl=
ibc_2.18.bb">eglibc_2.18.bb</a> <br>
=A0virtual:nativesdk:/opt/core-oe/sources/meta-mingw/recipes-devtools/mingw=
-w64/<a href=3D"http://mingw-w64-runtime_2.0.8.bb">mingw-w64-runtime_2.0.8.=
bb</a>).<br>=A0This usually means one provides something the other doesn&#3=
9;t and should.<br>
NOTE: Executing SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>ERROR: =
Function failed: do_configure (log file is located at /opt/core-oe/tmp-ucli=
bc/work/x86_64-nativesdk-oesdk-mingw32/nativesdk-eglibc-initial/2.18-r0/tem=
p/log.do_configure.23538)<br>
ERROR: Logfile of failure stored in: /opt/core-oe/tmp-uclibc/work/x86_64-na=
tivesdk-oesdk-mingw32/nativesdk-eglibc-initial/2.18-r0/temp/log.do_configur=
e.23538<br>Log data follows:<br>| DEBUG: Executing python function sysroot_=
cleansstate<br>
| DEBUG: Python function sysroot_cleansstate finished<br>| DEBUG: SITE file=
s [&#39;endian-little&#39;, &#39;common-mingw&#39;, &#39;bit-64&#39;, &#39;=
x86_64-mingw32&#39;, &#39;common&#39;]<br>| DEBUG: Executing shell function=
 autotools_preconfigure<br>
| DEBUG: Shell function autotools_preconfigure finished<br>| DEBUG: Executi=
ng shell function do_configure<br>| aclocal.m4:5: error: Exactly version 2.=
68 of Autoconf is required but you have 2.69<br>| aclocal.m4:5: the top lev=
el<br>
| autom4te: m4 failed with exit status: 63<br>| checking build system type.=
.. x86_64-pc-linux-gnu<br>| checking host system type... x86_64-oesdk-mingw=
32<br>| checking for x86_64-oesdk-mingw32-gcc... x86_64-oesdk-mingw32-gcc=
=A0 --sysroot=3D/opt/core-oe/tmp-uclibc/sysroots/x86_64-nativesdk-oesdk-min=
gw32<br>
| checking for suffix of object files... o<br>| checking whether we are usi=
ng the GNU C compiler... yes<br>| checking whether x86_64-oesdk-mingw32-gcc=
=A0 --sysroot=3D/opt/core-oe/tmp-uclibc/sysroots/x86_64-nativesdk-oesdk-min=
gw32 accepts -g... yes<br>
| checking for gcc... gcc<br>| checking whether we are using the GNU C++ co=
mpiler... yes<br>| checking whether x86_64-oesdk-mingw32-g++=A0 --sysroot=
=3D/opt/core-oe/tmp-uclibc/sysroots/x86_64-nativesdk-oesdk-mingw32 accepts =
-g... yes<br>
| checking for x86_64-oesdk-mingw32-readelf... x86_64-oesdk-mingw32-readelf=
<br>| checking for sysdeps preconfigure fragments... x86_64 checking whethe=
r x86_64-oesdk-mingw32-gcc=A0 --sysroot=3D/opt/core-oe/tmp-uclibc/sysroots/=
x86_64-nativesdk-oesdk-mingw32 compiles in -mx32 mode by default... no<br>
| <br>| configure: running configure fragment for add-on libidn<br>| config=
ure: running configure fragment for add-on nptl<br>| checking add-on ports =
for preconfigure fragments... aarch64 alpha am33 arm hppa ia64 m68k microbl=
aze mips powerpc tile<br>
| checking for assembler and linker STT_GNU_IFUNC support... no<br>| checki=
ng whether .text pseudo-op must be used... yes<br>|<br>| checking sysdep di=
rs... configure: error: Operating system mingw32 is not supported.<br>|<br>
| ERROR: Function failed: do_configure (log file is located at /opt/core-oe=
/tmp-uclibc/work/x86_64-nativesdk-oesdk-mingw32/nativesdk-eglibc-initial/2.=
18-r0/temp/log.do_configure.23538)<br>ERROR: Task 235 (virtual:nativesdk:/o=
pt/core-oe/sources/openembedded-core/meta/recipes-core/eglibc/<a href=3D"ht=
tp://eglibc-initial_2.18.bb">eglibc-initial_2.18.bb</a>, do_configure) fail=
ed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 602 tasks of which 595 didn&#39;t need to be=
 rerun and 1 failed.<br>Waiting for 0 running tasks to finish:<br><br>Summa=
ry: 1 task failed:<br>=A0 virtual:nativesdk:/opt/core-oe/sources/openembedd=
ed-core/meta/recipes-core/eglibc/<a href=3D"http://eglibc-initial_2.18.bb">=
eglibc-initial_2.18.bb</a>, do_configure<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
<br></span><br></div>

--001a11c2672ae08d5404e38617ab--
