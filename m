Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 960C67144D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 14:58:37 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id z11so3283442lbi.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 07:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=Qs0QrLB1c9CABhADcwdwh7NBKkr/W0/eyjvin76p5u0=;
	b=e5gW6NW0ciscFfIaUXyYUMtiiKZBkN2o/FzxsWxJEn3Ds4eoX8x1/KpAJT8zCxlSIv
	+q0/CpfH8u0exZiF6MXvtfC7YnFFVaKNPres1LHTezSkLr5T/3K6WipCXjYyttK5IuXH
	qe9SHSC+hRuWeyrw+Hb00inYC/+Uy4N6Aqxzb95RfElx/yYMQd1Qo+wr/D+kESMXFxrK
	xHsDxcoj3bgubcg3amGiC6FhUIZ/mc9Rxsn3Jh8/l/kAVgEb2tOEBmDcqyvhL22qzTEc
	5e98Gli9i1bvolTl1+OaDfG/6gwQMDDtNgMqjT6TP+imn7nNSQ2bA14P3/LnRY655dj8
	Bhlg==
X-Gm-Message-State: ALoCoQkSTtLS30WCyX//PZTZyHez/d/DYpO94DxlviMeCTOHRCiAjrrJ9kPFZk1utXYJWXJeiPkR
X-Received: by 10.112.56.206 with SMTP id c14mr7001669lbq.27.1411138718334;
	Fri, 19 Sep 2014 07:58:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.206.129 with HTTP; Fri, 19 Sep 2014 07:58:18 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
Date: Fri, 19 Sep 2014 16:58:18 +0200
Message-ID: <CAMg8ce-NsDCXm1kNXuOMBsLZq22+xvonCmBPBGuo_isbNRscOw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: NativeSDK recipe trying to link against SDK installation path
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
X-List-Received-Date: Fri, 19 Sep 2014 14:58:39 -0000
Content-Type: multipart/alternative; boundary=001a1133a90a0912d205036c56f4

--001a1133a90a0912d205036c56f4
Content-Type: text/plain; charset=UTF-8

I'm having issues with a package that I want to build for an SDK. The
package I want to build is dbus-c++ for nativesdk. I have used a recipe
converted from use for building the package for target (which works btw),
see below. The problem is that during the build of the package, the linker
looks for libraries in /opt/.../lib/ etc, which is the default location for
installing the SDK. Of course that fails, since the SDK has not yet been
installed when I'm building it!

I'm guessing this is an issue with the recipe, but looking at the automake
files in the library directory (using -c devshell) has not proven
successful as of yet. The package is configured with autotools.

====== begin nativesdk-dbus-c++.bb =======
inherit nativesdk

DESCRIPTION = "C++ bindings for dbus"
LICENSE = "LGPLv2.1+"
SECTION = "libs"
DEPENDS = "dbus expat glib-2.0"

SRCREV = "1f6f3e6e966e0b453edc4a82338dc27966c37505"

PE = "1"
PV = "0.6.0-pre1+gitr${SRCPV}"

SRC_URI = " \
    git://gitorious.org/dbus-cplusplus/mainline.git;protocol=git \
    file://dbus-c++.patch \
    "

S = "${WORKDIR}/git"

inherit autotools pkgconfig
EXTRA_OECONF += "--disable-ecore --disable-tests
--with-build-libdbus-cxx=${STAGING_LIBDIR}"

# Fix some build issues
do_configure_append () {
    sed -i 's#dbusxx_xml2cpp_LDADD = $(xml_LIBS)#dbusxx_xml2cpp_LDADD =
$(xml_LIBS) -L${STAGING_LIBDIR}#g' ${S}/tools/Makefile.am
    sed -i 's#libdbus_cxx_la = $(BUILD_LIBDBUS_CXX_DIR)/src/#libdbus_cxx_la
= $(BUILD_LIBDBUS_CXX_DIR)/#g' ${S}/tools/Makefile.am
    sed -i 's#-I$(top_builddir)/include#-I$(top_builddir)/include
-I${STAGING_INCDIR} -L${STAGING_LIBDIR}#g' ${S}/tools/Makefile.am
}

FILES_${PN} = "${libdir}/*.so.*"
LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
====== end nativesdk-dbus-c++.bb =======

I have tried both with and without the configure_append, it does not seem
to make any difference. The output from bitbake is this (dots in paths are
mine for readability):

<snip>
| g++  -DHAVE_CONFIG_H -I. -I..
-I/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/include/dbus-1.0
-I/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib/dbus-1.0/include
-I../include -I../include
-I/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/include
-L/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib -Wall
-isystem/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/include
-isystem/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/include -O2
-pipe -fvisibility=hidden -c -o introspect.o introspect.cpp
| make[2]: *** No rule to make target
'/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib/libdbus-c++-1.la',
needed by 'dbusxx-introspect'.  Stop.
</snip>

And if I just try it again I'm also getting this:

<snip>
| x86_64-bistrosdk-linux-libtool: link: g++
-isystem/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/include -O2
-pipe -fvisibility=hidden -Wl,-rpath-link
-Wl,/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib -Wl,-rpath
-Wl,/opt/.../usr/lib -Wl,-O1 -Wl,-rpath-link
-Wl,/home/zarniwoop/.../build-qemu/tmp/sysroots/.../lib -Wl,-rpath
-Wl,/opt/.../lib -Wl,-O1 -o dbusxx-xml2cpp xml.o xml2cpp.o
generate_adaptor.o generate_proxy.o generator_utils.o
-L/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib
-L/home/zarniwoop/.../build-qemu/tmp/sysroots/.../lib
/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib/libexpat.so
-L=/opt/.../usr/lib -L=/opt/.../lib
| /usr/bin/ld: cannot find /opt/.../lib/libc.so.6
| /usr/bin/ld: cannot find /opt/.../usr/lib/libc_nonshared.a
| /usr/bin/ld: cannot find /opt/.../lib/ld-linux-x86-64.so.2
| collect2: error: ld returned 1 exit status
| Makefile:437: recipe for target 'dbusxx-xml2cpp' failed
</snip>

It SHOULD link only against libraries built for the SDK, right? But for
some reason it looks for some of them in /opt/ instead of
/home/zarniwoop/.../build-qemu/tmp/sysroots/.../opt/

-- 
Tobias Olausson
M.Sc
Software Engineer

PELAGICORE | Experience Change
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46(0)709-949162
E-Mail: tobias.olausson@pelagicore.com
IRC: wto @ FreeNode

--001a1133a90a0912d205036c56f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m having issues with a package that I want to b=
uild for an SDK. The package I want to build is dbus-c++ for nativesdk. I h=
ave used a recipe converted from use for building the package for target (w=
hich works btw), see below. The problem is that during the build of the pac=
kage, the linker looks for libraries in /opt/.../lib/ etc, which is the def=
ault location for installing the SDK. Of course that fails, since the SDK h=
as not yet been installed when I&#39;m building it!<br><br>I&#39;m guessing=
 this is an issue with the recipe, but looking at the automake files in the=
 library directory (using -c devshell) has not proven successful as of yet.=
 The package is configured with autotools.<br><br>=3D=3D=3D=3D=3D=3D begin =
nativesdk-dbus-c++.bb =3D=3D=3D=3D=3D=3D=3D<br>inherit nativesdk<br><br>DES=
CRIPTION =3D &quot;C++ bindings for dbus&quot;<br>LICENSE =3D &quot;LGPLv2.=
1+&quot;<br>SECTION =3D &quot;libs&quot;<br>DEPENDS =3D &quot;dbus expat gl=
ib-2.0&quot;<br><br>SRCREV =3D &quot;1f6f3e6e966e0b453edc4a82338dc27966c375=
05&quot;<br><br>PE =3D &quot;1&quot;<br>PV =3D &quot;0.6.0-pre1+gitr${SRCPV=
}&quot;<br><br>SRC_URI =3D &quot; \<br>=C2=A0=C2=A0=C2=A0 git://<a href=3D"=
http://gitorious.org/dbus-cplusplus/mainline.git;protocol=3Dgit">gitorious.=
org/dbus-cplusplus/mainline.git;protocol=3Dgit</a> \<br>=C2=A0=C2=A0=C2=A0 =
file://dbus-c++.patch \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>S =3D &quot;${W=
ORKDIR}/git&quot;<br><br>inherit autotools pkgconfig<br>EXTRA_OECONF +=3D &=
quot;--disable-ecore --disable-tests --with-build-libdbus-cxx=3D${STAGING_L=
IBDIR}&quot;<br><br># Fix some build issues<br>do_configure_append () {<br>=
=C2=A0=C2=A0=C2=A0 sed -i &#39;s#dbusxx_xml2cpp_LDADD =3D $(xml_LIBS)#dbusx=
x_xml2cpp_LDADD =3D $(xml_LIBS) -L${STAGING_LIBDIR}#g&#39; ${S}/tools/Makef=
ile.am<br>=C2=A0=C2=A0=C2=A0 sed -i &#39;s#libdbus_cxx_la =3D $(BUILD_LIBDB=
US_CXX_DIR)/src/#libdbus_cxx_la =3D $(BUILD_LIBDBUS_CXX_DIR)/#g&#39; ${S}/t=
ools/Makefile.am<br>=C2=A0=C2=A0=C2=A0 sed -i &#39;s#-I$(top_builddir)/incl=
ude#-I$(top_builddir)/include -I${STAGING_INCDIR} -L${STAGING_LIBDIR}#g&#39=
; ${S}/tools/Makefile.am<br>}<br><br>FILES_${PN} =3D &quot;${libdir}/*.so.*=
&quot;<br>LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901857fcd11=
8f065f900982c24&quot;<br>=3D=3D=3D=3D=3D=3D end nativesdk-dbus-c++.bb =3D=
=3D=3D=3D=3D=3D=3D<br><br>I have tried both with and without the configure_=
append, it does not seem to make any difference. The output from bitbake is=
 this (dots in paths are mine for readability):<br>=C2=A0<br>&lt;snip&gt;<b=
r>| g++=C2=A0 -DHAVE_CONFIG_H -I. -I..=C2=A0 -I/home/zarniwoop/.../build-qe=
mu/tmp/sysroots/.../usr/include/dbus-1.0 -I/home/zarniwoop/.../build-qemu/t=
mp/sysroots/.../usr/lib/dbus-1.0/include=C2=A0=C2=A0 -I../include -I../incl=
ude -I/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/include -L/home/z=
arniwoop/.../build-qemu/tmp/sysroots/.../usr/lib -Wall -isystem/home/zarniw=
oop/.../build-qemu/tmp/sysroots/.../usr/include=C2=A0 -isystem/home/zarniwo=
op/.../build-qemu/tmp/sysroots/.../usr/include -O2 -pipe -fvisibility=3Dhid=
den -c -o introspect.o introspect.cpp<br>| make[2]: *** No rule to make tar=
get &#39;/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib/libdbus-c+=
+-<a href=3D"http://1.la">1.la</a>&#39;, needed by &#39;dbusxx-introspect&#=
39;.=C2=A0 Stop.<br>&lt;/snip&gt;<br><br>And if I just try it again I&#39;m=
 also getting this:<br><br>&lt;snip&gt;<br>| x86_64-bistrosdk-linux-libtool=
: link: g++ -isystem/home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/inc=
lude -O2 -pipe -fvisibility=3Dhidden -Wl,-rpath-link -Wl,/home/zarniwoop/..=
./build-qemu/tmp/sysroots/.../usr/lib -Wl,-rpath -Wl,/opt/.../usr/lib -Wl,-=
O1 -Wl,-rpath-link -Wl,/home/zarniwoop/.../build-qemu/tmp/sysroots/.../lib =
-Wl,-rpath -Wl,/opt/.../lib -Wl,-O1 -o dbusxx-xml2cpp xml.o xml2cpp.o gener=
ate_adaptor.o generate_proxy.o generator_utils.o=C2=A0 -L/home/zarniwoop/..=
./build-qemu/tmp/sysroots/.../usr/lib -L/home/zarniwoop/.../build-qemu/tmp/=
sysroots/.../lib /home/zarniwoop/.../build-qemu/tmp/sysroots/.../usr/lib/li=
bexpat.so -L=3D/opt/.../usr/lib -L=3D/opt/.../lib<br>| /usr/bin/ld: cannot =
find /opt/.../lib/libc.so.6<br>| /usr/bin/ld: cannot find /opt/.../usr/lib/=
libc_nonshared.a<br>| /usr/bin/ld: cannot find /opt/.../lib/ld-linux-x86-64=
.so.2<br>| collect2: error: ld returned 1 exit status<br>| Makefile:437: re=
cipe for target &#39;dbusxx-xml2cpp&#39; failed<br>&lt;/snip&gt;<br><br>It =
SHOULD link only against libraries built for the SDK, right? But for some r=
eason it looks for some of them in /opt/ instead of /home/zarniwoop/.../bui=
ld-qemu/tmp/sysroots/.../opt/<br></div><div><br>-- <br><div dir=3D"ltr"><di=
v dir=3D"ltr"><div>Tobias Olausson<br></div><div>M.Sc</div><div>Software En=
gineer</div><div><div><br></div><div>PELAGICORE | Experience Change</div><d=
iv>Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden<br></div><div>Mobile:=
 +46(0)709-949162<br>
</div></div><div>E-Mail: <a href=3D"mailto:tobias.olausson@pelagicore.com" =
target=3D"_blank">tobias.olausson@pelagicore.com</a> <br></div><div>IRC: wt=
o @ FreeNode</div></div></div>
</div></div>

--001a1133a90a0912d205036c56f4--
