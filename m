Return-Path: <fgretief@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id EC86061222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 13:34:05 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so4720953lab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lV9R+qLylOU43QbDCzesLWiwk8dR89aK5sU85TWK0fQ=;
	b=mAoLul3eFite/8WuHp15h+9gR1IryMBhgIf8l0nwQTY9jAW6uMfYSYKbgVnbQWLlRn
	t+v7GMv6Ihy0r8uBDepvbklKXLLgOQ9S4Pnw6rcyCXg7Qgw116+Xxkhs9PZYr2vJR4jX
	y6307g7VPQT4CSAFPAPm0HUlXqWnP1YbFW0Jn7o+tbhnph9ZR/0fz+6OP61lF162vtcs
	uOqWHElVgdSt4Iy/U7P7JzKElfog31b/QgTHkbt+fitl3goyxxPQN+vcx9Z+hkqJJLzb
	EiLhkAEwysJh2EVUFnJ1FrQ6ZJgCdJerjLRfH+JC0jfiCDs7HtJaa6JIsrTqUnhEfcef
	uKXw==
MIME-Version: 1.0
X-Received: by 10.112.209.2 with SMTP id mi2mr5491655lbc.63.1376314445638;
	Mon, 12 Aug 2013 06:34:05 -0700 (PDT)
Received: by 10.152.37.102 with HTTP; Mon, 12 Aug 2013 06:34:05 -0700 (PDT)
In-Reply-To: <6741EAAB26B57F4995668065CB62D86B33934034@IRSMSX102.ger.corp.intel.com>
References: <6741EAAB26B57F4995668065CB62D86B33933627@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKhTFiKC8BwPhtULqmtkuzgYV3MVPOCLn64ibgGYjuaGA@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33933DFC@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKiRwXD8gJhG+7XDSHSGEvZY3YBR5MxBZieVMYPd_sL1g@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33934034@IRSMSX102.ger.corp.intel.com>
Date: Mon, 12 Aug 2013 15:34:05 +0200
Message-ID: <CAFpw0gKCKapZsVm-sShNcfN_sE+hQM=1oWPoz-=g-PRMnzwTiw@mail.gmail.com>
From: Francois Retief <fgretief@gmail.com>
To: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Yocto toolchain for Windows
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
X-List-Received-Date: Mon, 12 Aug 2013 13:34:07 -0000
Content-Type: multipart/alternative; boundary=001a11c33a66a1b1e004e3c02d8f

--001a11c33a66a1b1e004e3c02d8f
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

My understanding is that MinGW is the libc library for Win32 environments.
So we need to "replace" eglibc with mingw for all code that execute on the
Win32 platform.  In the case of OpenEmbedded, it is all packages that start
with "nativesdk-" when is SDKMACHINE=3D"x86_64-mingw32".

Over the weekend I worked on this by disabling the eglibc recipes and
seeing what packages are missing.  The eglibc recipe provides the
"virtual/nativesdk-libc" package. My understanding is that this virtual
package must be implemented by MingGW.  In the process I also found that
pthreads-win32 was needed and added a recipe for this.

I ended up at a point where nativesdk-zlib is actually looking for libc and
not finding it.  Currently I am trying to understand exactly what is
required by "nativesdk-*" packages, and what mingw provides, in the hope of
understanding where the mismatch is or where my understanding of the system
breaks down.  ;-)

Will keep you posted.

Cheers,
  Francois

$ SDKMACHINE=3Dx86_64-mingw32 bitbake nativesdk-zlib
...
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j2 -e MAKEFLAGS=3D
| x86_64-oesdk-mingw32-gcc
--sysroot=3D/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32 -shared
-Wl,-soname,libz.so.1,--version-script,zlib.map
-isystem/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/o=
ecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/include
-O2 -pipe  -fPIC -D_LARGEFILE64_SOURCE=3D1 -o libz.so.1.2.8 adler32.lo
crc32.lo deflate.lo infback.lo inffast.lo inflate.lo inftrees.lo trees.lo
zutil.lo compress.lo uncompr.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo
-lc -L/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/oec=
ore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib
-Wl,-rpath-link,/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr=
/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib
-Wl,-O1 -L/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local=
/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib
-Wl,-rpath-link,/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr=
/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib
-Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/lib
-Wl,-O1
| x86_64-oesdk-mingw32-gcc
--sysroot=3D/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32
-isystem/opt/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/o=
ecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/include
-O2 -pipe -o minigzip64 minigzip64.o -L. libz.a
| /opt/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x86_64-oesdk-mingw32/gc=
c/x86_64-oesdk-mingw32/4.8.1/ld:
cannot find -lc
| collect2: error: ld returned 1 exit status
| make: *** [libz.so.1.2.8] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
...


On 12 August 2013 12:13, Sywula, Krzysztof M
<krzysztof.m.sywula@intel.com>wrote:

>  Francois,****
>
> I tried compiling the same eglibc version as Yocto uses under
> mingw32/Cygwin. Apparently there is no port for these.****
>
> ** **
>
> Mingw32:****
>
> $ ../eglibc-2.17/libc/configure****
>
> checking build system type... i686-pc-mingw32****
>
> checking host system type... i686-pc-mingw32****
>
> checking for gcc... gcc****
>
> checking for suffix of object files... o****
>
> checking whether we are using the GNU C compiler... yes****
>
> checking whether gcc accepts -g... yes****
>
> checking for gcc option to accept ISO C89... none needed****
>
> checking how to run the C preprocessor... gcc -E****
>
> checking for g++... g++****
>
> checking whether we are using the GNU C++ compiler... yes****
>
> checking whether g++ accepts -g... yes****
>
> checking for readelf... readelf****
>
> checking for sysdeps preconfigure fragments... x86_64****
>
> configure: running configure fragment for add-on libidn****
>
> configure: running configure fragment for add-on nptl****
>
> checking add-on ports for preconfigure fragments... aarch64 alpha am33 ar=
m
> hppa****
>
> ia64 m68k mips powerpc tile****
>
> *** The GNU C library is currently not available for this platform.****
>
> *** So far nobody cared to port it and if there is no volunteer it****
>
> *** might never happen.  So, if you have interest to see glibc on****
>
> *** this platform visit****
>
> ***     http://www.gnu.org/software/libc/porting.html****
>
> *** and join the group of porters****
>
> ** **
>
> Cygwin:****
>
> $ ../eglibc-2.17/libc/configure****
>
> checking build system type... i686-pc-cygwin****
>
> checking host system type... i686-pc-cygwin****
>
> checking for gcc... gcc****
>
> checking for suffix of object files... o****
>
> checking whether we are using the GNU C compiler... yes****
>
> checking whether gcc accepts -g... yes****
>
> checking for gcc option to accept ISO C89... none needed****
>
> checking how to run the C preprocessor... gcc -E****
>
> checking for g++... g++****
>
> checking whether we are using the GNU C++ compiler... yes****
>
> checking whether g++ accepts -g... yes****
>
> checking for readelf... readelf****
>
> checking for sysdeps preconfigure fragments... x86_64****
>
> configure: running configure fragment for add-on libidn****
>
> configure: running configure fragment for add-on nptl****
>
> checking add-on ports for preconfigure fragments... aarch64 alpha am33 ar=
m
> hppa ia64 m68k mips powerpc tile****
>
> *** The GNU C library is currently not available for this platform.****
>
> *** So far nobody cared to port it and if there is no volunteer it****
>
> *** might never happen.  So, if you have interest to see glibc on****
>
> *** this platform visit****
>
> ***     http://www.gnu.org/software/libc/porting.html****
>
> *** and join the group of porters****
>
> ** **
>
> ** **
>
> To see why is eglibc needed do:****
>
> bitbake <recipe> -c populate_sdk =96g****
>
> and:****
>
> less package-depends.dot****
>
> ** **
>
> That=92s what it gives:****
>
> "nativesdk-eglibc-initial" [label=3D"nativesdk-eglibc-initial
> :2.17-r3\nvirtual:nativesdk:/build/kmsywula****
>
> 3/poky/meta/recipes-core/eglibc/eglibc-initial_2.17.bb"]****
>
> "nativesdk-eglibc-initial" ->
> "virtual/x86_64-pokysdk-mingw32-gcc-initial-crosssdk"****
>
> "nativesdk-eglibc-initial" -> "nativesdk-linux-libc-headers"****
>
> "nativesdk-eglibc-initial" -> "chrpath-replacement-native"****
>
> "nativesdk-eglibc-initial" -> "autoconf-native"****
>
> "nativesdk-eglibc-initial" -> "automake-native"****
>
> "nativesdk-eglibc-initial" -> "libtool-native"****
>
> "nativesdk-eglibc-initial" -> "kconfig-frontends-native"****
>
> "nativesdk-eglibc-initial" -> "gnu-config-native"****
>
> ** **
>
> ** **
>
> So as long as there is no port for mingw32/Cygwin we are blocked. Any
> ideas?****
>
> ** **
>
> Thanks,****
>
> Krzysztof****
>
> ** **
>
> *From:* Francois Retief [mailto:fgretief@gmail.com]
> *Sent:* Friday, August 09, 2013 6:33 PM
>
> *To:* Sywula, Krzysztof M
> *Subject:* Re: Yocto toolchain for Windows****
>
> ** **
>
> Hi Krzysztof,****
>
> Yup, that is the same point where I am stuck at the moment. I sent an
> email to oe-core mailing list about this issue.
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-August/082=
509.html
> ****
>
> Hoping for a response from the OE community soon.****
>
> Cheers,****
>
>   Francois****
>
> ** **
>

--001a11c33a66a1b1e004e3c02d8f
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Krzysztof,<br><br></div><div class=3D"gmail_e=
xtra">My understanding is that MinGW is the libc library for Win32 environm=
ents. So we need to &quot;replace&quot; eglibc with mingw for all code that=
 execute on the Win32 platform.=A0 In the case of OpenEmbedded, it is all p=
ackages that start with &quot;nativesdk-&quot; when is SDKMACHINE=3D&quot;x=
86_64-mingw32&quot;.<br>
<br></div><div class=3D"gmail_extra">Over the weekend I worked on this by d=
isabling the eglibc recipes and seeing what packages are missing.=A0 The eg=
libc recipe provides the &quot;virtual/nativesdk-libc&quot; package. My und=
erstanding is that this virtual package must be implemented by MingGW.=A0 I=
n the process I also found that pthreads-win32 was needed and added a recip=
e for this.<br>
<br>I ended up at a point where nativesdk-zlib is actually looking for libc=
 and not finding it.=A0 Currently I am trying to understand exactly what is=
 required by &quot;nativesdk-*&quot; packages, and what mingw provides, in =
the hope of understanding where the mismatch is or where my understanding o=
f the system breaks down.=A0 ;-) <br>
<br></div><div class=3D"gmail_extra">Will keep you posted.<br></div><div cl=
ass=3D"gmail_extra"><br></div>Cheers,<br></div>=A0 Francois<br><br><span st=
yle=3D"font-family:courier new,monospace">$ SDKMACHINE=3Dx86_64-mingw32 bit=
bake nativesdk-zlib<br>
...</span><br><span style=3D"font-family:courier new,monospace">Log data fo=
llows:<br>| DEBUG: Executing shell function do_compile<br>| NOTE: make -j2 =
-e MAKEFLAGS=3D<br>| x86_64-oesdk-mingw32-gcc=A0 --sysroot=3D/opt/tmp-eglib=
c/sysroots/x86_64-nativesdk-oesdk-mingw32 -shared -Wl,-soname,libz.so.1,--v=
ersion-script,zlib.map -isystem</span><span style=3D"font-family:courier ne=
w,monospace"><span style=3D"font-family:courier new,monospace">/opt</span>/=
tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/oecore-x86_64/=
sysroots/x86_64-oesdk-mingw32/usr/include -O2 -pipe=A0 -fPIC -D_LARGEFILE64=
_SOURCE=3D1 -o libz.so.1.2.8 adler32.lo crc32.lo deflate.lo infback.lo inff=
ast.lo inflate.lo inftrees.lo trees.lo zutil.lo compress.lo uncompr.lo gzcl=
ose.lo gzlib.lo gzread.lo gzwrite.lo=A0 -lc -L</span><span style=3D"font-fa=
mily:courier new,monospace"><span style=3D"font-family:courier new,monospac=
e">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local=
/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib -Wl,-rpath-link,</span=
><span style=3D"font-family:courier new,monospace"><span style=3D"font-fami=
ly:courier new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-=
oesdk-mingw32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib=
 -Wl,-rpath,/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib =
-Wl,-O1 -L</span><span style=3D"font-family:courier new,monospace"><span st=
yle=3D"font-family:courier new,monospace">/opt</span>/tmp-eglibc/sysroots/x=
86_64-nativesdk-oesdk-mingw32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk=
-mingw32/lib -Wl,-rpath-link,</span><span style=3D"font-family:courier new,=
monospace"><span style=3D"font-family:courier new,monospace">/opt</span>/tm=
p-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/oecore-x86_64/sy=
sroots/x86_64-oesdk-mingw32/lib -Wl,-rpath,/usr/local/oecore-x86_64/sysroot=
s/x86_64-oesdk-mingw32/lib -Wl,-O1<br>
| x86_64-oesdk-mingw32-gcc=A0 --sysroot=3D</span><span style=3D"font-family=
:courier new,monospace"><span style=3D"font-family:courier new,monospace">/=
opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk-oesdk-mingw32 -isystem</spa=
n><span style=3D"font-family:courier new,monospace"><span style=3D"font-fam=
ily:courier new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-nativesdk=
-oesdk-mingw32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/in=
clude -O2 -pipe -o minigzip64 minigzip64.o -L. libz.a<br>
| </span><span style=3D"font-family:courier new,monospace"><span style=3D"f=
ont-family:courier new,monospace">/opt</span>/tmp-eglibc/sysroots/x86_64-li=
nux/usr/libexec/x86_64-oesdk-mingw32/gcc/x86_64-oesdk-mingw32/4.8.1/ld: can=
not find -lc<br>
| collect2: error: ld returned 1 exit status<br>| make: *** [libz.so.1.2.8]=
 Error 1<br>| make: *** Waiting for unfinished jobs....<br>| ERROR: oe_runm=
ake failed</span><br><span style=3D"font-family:courier new,monospace">...<=
/span><br>
<br><div><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 12 Au=
gust 2013 12:13, Sywula, Krzysztof M <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:krzysztof.m.sywula@intel.com" target=3D"_blank">krzysztof.m.sywula@intel.=
com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">





<div link=3D"blue" vlink=3D"purple" lang=3D"EN-IE">
<div>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">Francois,<u></u><u></u></span=
></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">I tried compiling the same eg=
libc version as Yocto uses under mingw32/Cygwin. Apparently there is no por=
t for these.<u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">Mingw32:<u></u><u></u></span>=
</p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">$ ../eglibc-2.17/libc/configu=
re<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking build system type...=
 i686-pc-mingw32<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking host system type... =
i686-pc-mingw32<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for gcc... gcc<u></u=
><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for suffix of object=
 files... o<u></u><u></u></span></p><div class=3D"im">
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether we are using=
 the GNU C compiler... yes<u></u><u></u></span></p>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri=
&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether gcc ac=
cepts -g... yes<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for gcc option to ac=
cept ISO C89... none needed<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking how to run the C pre=
processor... gcc -E<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for g++... g++<u></u=
><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether we are using=
 the GNU C++ compiler... yes<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether g++ accepts =
-g... yes<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for readelf... reade=
lf<u></u><u></u></span></p><div class=3D"im">
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for sysdeps preconfi=
gure fragments... x86_64<u></u><u></u></span></p>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri=
&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">configure: running conf=
igure fragment for add-on libidn<u></u><u></u></span></p><div class=3D"im">
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">configure: running configure =
fragment for add-on nptl<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking add-on ports for pre=
configure fragments... aarch64 alpha am33 arm hppa<u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">ia64 m68k mips powerpc tile<u=
></u><u></u></span></p>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri=
&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** The GNU C library i=
s currently not available for this platform.<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** So far nobody cared to po=
rt it and if there is no volunteer it<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** might never happen.=A0 So=
, if you have interest to see glibc on<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** this platform visit<u></u=
><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">***=A0=A0=A0=A0 <a href=3D"ht=
tp://www.gnu.org/software/libc/porting.html" target=3D"_blank">http://www.g=
nu.org/software/libc/porting.html</a><u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** and join the group of por=
ters<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">Cygwin:<u></u><u></u></span><=
/p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">$ ../eglibc-2.17/libc/configu=
re<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking build system type...=
 i686-pc-cygwin<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking host system type... =
i686-pc-cygwin<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for gcc... gcc<u></u=
><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for suffix of object=
 files... o<u></u><u></u></span></p><div class=3D"im">
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether we are using=
 the GNU C compiler... yes<u></u><u></u></span></p>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri=
&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether gcc ac=
cepts -g... yes<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for gcc option to ac=
cept ISO C89... none needed<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking how to run the C pre=
processor... gcc -E<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for g++... g++<u></u=
><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether we are using=
 the GNU C++ compiler... yes<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking whether g++ accepts =
-g... yes<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for readelf... reade=
lf<u></u><u></u></span></p><div class=3D"im">
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking for sysdeps preconfi=
gure fragments... x86_64<u></u><u></u></span></p>
</div><p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri=
&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">configure: running conf=
igure fragment for add-on libidn<u></u><u></u></span></p><div class=3D"im">
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">configure: running configure =
fragment for add-on nptl<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">checking add-on ports for pre=
configure fragments... aarch64 alpha am33 arm hppa ia64 m68k mips powerpc t=
ile<u></u><u></u></span></p>

</div><p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri=
&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** The GNU C library i=
s currently not available for this platform.<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** So far nobody cared to po=
rt it and if there is no volunteer it<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** might never happen.=A0 So=
, if you have interest to see glibc on<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** this platform visit<u></u=
><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">***=A0=A0=A0=A0 <a href=3D"ht=
tp://www.gnu.org/software/libc/porting.html" target=3D"_blank">http://www.g=
nu.org/software/libc/porting.html</a><u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">*** and join the group of por=
ters<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">To see why is eglibc needed d=
o:<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">bitbake &lt;recipe&gt; -c pop=
ulate_sdk =96g<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">and:<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">less package-depends.dot<u></=
u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">That=92s what it gives:<u></u=
><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; [label=3D&quot;nativesdk-eglibc-initial :2.17-r3\nvirtual:nativesdk=
:/build/kmsywula<u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">3/poky/meta/recipes-core/egli=
bc/<a href=3D"http://eglibc-initial_2.17.bb" target=3D"_blank">eglibc-initi=
al_2.17.bb</a>&quot;]<u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;virtual/x86_64-pokysdk-mingw32-gcc-initial-crosssdk&quo=
t;<u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;nativesdk-linux-libc-headers&quot;<u></u><u></u></span>=
</p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;chrpath-replacement-native&quot;<u></u><u></u></span></=
p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;autoconf-native&quot;<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;automake-native&quot;<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;libtool-native&quot;<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;kconfig-frontends-native&quot;<u></u><u></u></span></p>

<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">&quot;nativesdk-eglibc-initia=
l&quot; -&gt; &quot;gnu-config-native&quot;<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">So as long as there is no por=
t for mingw32/Cygwin we are blocked. Any ideas?<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">Thanks,<u></u><u></u></span><=
/p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)">Krzysztof<u></u><u></u></span=
></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;=
,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><b><span style=3D"font-size:10pt;font-family:&quot;Tahoma&quo=
t;,&quot;sans-serif&quot;" lang=3D"EN-US">From:</span></b><span style=3D"fo=
nt-size:10pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;" lang=3D=
"EN-US"> Francois Retief [mailto:<a href=3D"mailto:fgretief@gmail.com" targ=
et=3D"_blank">fgretief@gmail.com</a>]
<br>
<b>Sent:</b> Friday, August 09, 2013 6:33 PM</span></p><div><div class=3D"h=
5"><br>
<b>To:</b> Sywula, Krzysztof M<br>
<b>Subject:</b> Re: Yocto toolchain for Windows<u></u><u></u></div></div><p=
></p><div><div class=3D"h5">
<p class=3D""><u></u>=A0<u></u></p>
<div>
<div>
<div>
<div>
<div>
<p class=3D"" style=3D"margin-bottom:12pt">Hi Krzysztof,<u></u><u></u></p>
</div>
<p class=3D"" style=3D"margin-bottom:12pt">Yup, that is the same point wher=
e I am stuck at the moment. I sent an email to oe-core mailing list about t=
his issue.<br>
<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2013-A=
ugust/082509.html" target=3D"_blank">http://lists.openembedded.org/pipermai=
l/openembedded-core/2013-August/082509.html</a><u></u><u></u></p>
</div>
<p class=3D"" style=3D"margin-bottom:12pt">Hoping for a response from the O=
E community soon.<u></u><u></u></p>
</div>
<p class=3D"">Cheers,<u></u><u></u></p>
</div>
<p class=3D"">=A0 Francois<u></u><u></u></p>
<div>
<div>
<div>
<p class=3D""><u></u>=A0<u></u></p>
</div>
</div>
</div>
</div>
</div></div></div></div>

</blockquote></div></div></div></div>

--001a11c33a66a1b1e004e3c02d8f--
