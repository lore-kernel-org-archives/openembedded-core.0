Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RoUJs-0003fN-Sz
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 07:20:57 +0100
Received: by lags15 with SMTP id s15so700845lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 22:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=HqEY0tjqYq7fOnZu97A22NSgi5K64qX0cH/n6vI04uA=;
	b=kuVUpcqWUY7zTkT/IzNlSlLR4jmjgs0tLYn13Ao7lQ5VdiWa+MMvD5gsRvCYCgH/5Q
	gFa9UQpRb/UXb4AzXdj4VKEhfJuFVx8hUtsn72T7y+Yc9Cag03pa4WzX1MZK0JT6aJ66
	gZfMTTNxElFqFz0aMwYiNJzYku/YHgH0YRYKA=
MIME-Version: 1.0
Received: by 10.112.84.163 with SMTP id a3mr169568lbz.53.1327126394618; Fri,
	20 Jan 2012 22:13:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.30.135 with HTTP; Fri, 20 Jan 2012 22:13:14 -0800 (PST)
In-Reply-To: <4706547a51fe461a875c5f4e6c3006c583f16e83.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
	<4706547a51fe461a875c5f4e6c3006c583f16e83.1327123057.git.sgw@linux.intel.com>
Date: Sat, 21 Jan 2012 04:13:14 -0200
X-Google-Sender-Auth: Hk0VLcFqXAXGC7i0Gm44A-CcOQk
Message-ID: <CAP9ODKrBmJkZs62UxskxwyS3i7LEa_aAv+xEnHvfMUiEW+CO9w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/20] opkg: move common code & metadata into opkg.inc to reduce code duplication
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
X-List-Received-Date: Sat, 21 Jan 2012 06:20:57 -0000
Content-Type: multipart/alternative; boundary=f46d04016d5952c26a04b703b1b9

--f46d04016d5952c26a04b703b1b9
Content-Type: text/plain; charset=ISO-8859-1

Seems to have a confusion between: PR_INC and INC_PR.

On Sat, Jan 21, 2012 at 03:18, Saul Wold <sgw@linux.intel.com> wrote:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/opkg/opkg.inc      |   43
> +++++++++++++++++++++++++++-
>  meta/recipes-devtools/opkg/opkg_0.1.8.bb |   44
> +----------------------------
>  meta/recipes-devtools/opkg/opkg_svn.bb   |   42
> +---------------------------
>  3 files changed, 44 insertions(+), 85 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg.inc
> b/meta/recipes-devtools/opkg/opkg.inc
> index 3e350e8..b03eaf7 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -11,6 +11,7 @@ DEPENDS_virtclass-native = "curl-native"
>  DEPENDS_virtclass-nativesdk = "curl-nativesdk"
>
>  PE = "1"
> +PR_INC = "r6"
>
>  FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/opkg"
>
> @@ -31,8 +32,46 @@ EXTRA_OECONF += "--with-opkglibdir=${localstatedir}/lib"
>  EXTRA_OECONF_virtclass-native =
> "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl
> --disable-openssl"
>  EXTRA_OECONF_virtclass-nativesdk =
> "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl
> --disable-openssl"
>
> -#PROVIDES_append_virtclass-native = "virtual/update-alternatives-native"
> -#RPROVIDES_${PN} += "update-alternatives-native"
> +PROVIDES += "virtual/update-alternatives"
> +RPROVIDES_update-alternatives-cworth += "update-alternatives"
> +RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
> +RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
> +RDEPENDS_${PN}_virtclass-native = ""
> +RDEPENDS_${PN}_virtclass-nativesdk = ""
> +PACKAGE_ARCH_update-alternatives-cworth = "all"
> +RREPLACES_${PN} = "opkg-nogpg"
> +
> +PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}
> update-alternatives-cworth${PKGSUFFIX}"
> +
> +FILES_update-alternatives-cworth${PKGSUFFIX} =
> "${bindir}/update-alternatives"
> +FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la
> ${libdir}/*.so"
> +FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
> +
> +# We need to create the lock directory
> +do_install_append() {
> +       install -d ${D}${localstatedir}/lib/opkg
> +}
> +
> +pkg_postinst_${PN} () {
> +#!/bin/sh
> +if [ "x$D" != "x" ]; then
> +       install -d $D${sysconfdir}/rcS.d
> +       # this happens at S98 where our good 'ole packages script used to
> run
> +       echo "#!/bin/sh
> +opkg-cl configure
> +rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> +" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> +       chmod 0755
> $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> +fi
> +
> +update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
> +}
> +
> +pkg_postrm_${PN} () {
> +#!/bin/sh
> +update-alternatives --remove opkg ${bindir}/opkg-cl
> +}
> +
>
>  BBCLASSEXTEND = "native nativesdk"
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bbb/meta/recipes-devtools/opkg/
> opkg_0.1.8.bb
> index 18cf042..c206b37 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
> @@ -1,48 +1,8 @@
>  require opkg.inc
>
> -PROVIDES += "virtual/update-alternatives"
> -RPROVIDES_update-alternatives-cworth += "update-alternatives"
> -RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
> -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
> -RDEPENDS_${PN}_virtclass-native = ""
> -RDEPENDS_${PN}_virtclass-nativesdk = ""
> -PACKAGE_ARCH_update-alternatives-cworth = "all"
> -
>  SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
>            file://add_vercmp.patch \
>            file://headerfix.patch \
> -"
> -
> -PR = "r4"
> -
> -PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}
> update-alternatives-cworth${PKGSUFFIX}"
> -
> -FILES_update-alternatives-cworth${PKGSUFFIX} =
> "${bindir}/update-alternatives"
> -FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la
> ${libdir}/*.so"
> -FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
> -
> -# We need to create the lock directory
> -do_install_append() {
> -       install -d ${D}${localstatedir}/lib/opkg
> -}
> -
> -pkg_postinst_${PN} () {
> -#!/bin/sh
> -if [ "x$D" != "x" ]; then
> -       install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
> -       # this happens at S98 where our good 'ole packages script used to
> run
> -       echo "#!/bin/sh
> -opkg-cl configure
> -rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -       chmod 0755
> $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -fi
> -
> -update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
> -}
> -
> -pkg_postrm_${PN} () {
> -#!/bin/sh
> -update-alternatives --remove opkg ${bindir}/opkg-cl
> -}
> +          "
>
> +PR = "${INC_PR}.0"
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bbb/meta/recipes-devtools/opkg/
> opkg_svn.bb
> index f5f540d..c07d393 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -1,14 +1,5 @@
>  require opkg.inc
>
> -PROVIDES += "virtual/update-alternatives"
> -RPROVIDES_update-alternatives-cworth += "update-alternatives"
> -RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
> -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
> -RDEPENDS_${PN}_virtclass-native = ""
> -RDEPENDS_${PN}_virtclass-nativesdk = ""
> -PACKAGE_ARCH_update-alternatives-cworth = "all"
> -RREPLACES_${PN} = "opkg-nogpg"
> -
>  SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
>            file://add_vercmp.patch \
>            file://add_uname_support.patch \
> @@ -21,36 +12,5 @@ S = "${WORKDIR}/trunk"
>
>  SRCREV = "633"
>  PV = "0.1.8+svnr${SRCPV}"
> -PR = "r5"
> -
> -PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}
> update-alternatives-cworth${PKGSUFFIX}"
> -
> -FILES_update-alternatives-cworth${PKGSUFFIX} =
> "${bindir}/update-alternatives"
> -FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la
> ${libdir}/*.so"
> -FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
> -
> -# We need to create the lock directory
> -do_install_append() {
> -       install -d ${D}${localstatedir}/lib/opkg
> -}
> -
> -pkg_postinst_${PN} () {
> -#!/bin/sh
> -if [ "x$D" != "x" ]; then
> -       install -d $D${sysconfdir}/rcS.d
> -       # this happens at S98 where our good 'ole packages script used to
> run
> -       echo "#!/bin/sh
> -opkg-cl configure
> -rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -       chmod 0755
> $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
> -fi
> -
> -update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
> -}
> -
> -pkg_postrm_${PN} () {
> -#!/bin/sh
> -update-alternatives --remove opkg ${bindir}/opkg-cl
> -}
>
> +PR = "${INC_PR}.0"
> --
> 1.7.6.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d04016d5952c26a04b703b1b9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Seems to have a confusion between: PR_INC and INC_PR.<br><br><div class=3D"=
gmail_quote">On Sat, Jan 21, 2012 at 03:18, Saul Wold <span dir=3D"ltr">&lt=
;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt;</span> =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Saul Wold &lt;<a href=3D"mail=
to:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-devtools/opkg/opkg.inc =A0 =A0 =A0| =A0 43 ++++++++++++++++=
+++++++++++-<br>
=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.1.8.bb" target=3D"_b=
lank">opkg_0.1.8.bb</a> | =A0 44 +----------------------------<br>
=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_svn.bb" target=3D"_bla=
nk">opkg_svn.bb</a> =A0 | =A0 42 +---------------------------<br>
=A03 files changed, 44 insertions(+), 85 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/op=
kg/opkg.inc<br>
index 3e350e8..b03eaf7 100644<br>
--- a/meta/recipes-devtools/opkg/opkg.inc<br>
+++ b/meta/recipes-devtools/opkg/opkg.inc<br>
@@ -11,6 +11,7 @@ DEPENDS_virtclass-native =3D &quot;curl-native&quot;<br>
=A0DEPENDS_virtclass-nativesdk =3D &quot;curl-nativesdk&quot;<br>
<br>
=A0PE =3D &quot;1&quot;<br>
+PR_INC =3D &quot;r6&quot;<br>
<br>
=A0FILESDIR =3D &quot;${@os.path.dirname(d.getVar(&#39;FILE&#39;,1))}/opkg&=
quot;<br>
<br>
@@ -31,8 +32,46 @@ EXTRA_OECONF +=3D &quot;--with-opkglibdir=3D${localstate=
dir}/lib&quot;<br>
=A0EXTRA_OECONF_virtclass-native =3D &quot;--with-opkglibdir=3D${target_loc=
alstatedir}/lib --disable-gpg --disable-curl --disable-openssl&quot;<br>
=A0EXTRA_OECONF_virtclass-nativesdk =3D &quot;--with-opkglibdir=3D${target_=
localstatedir}/lib --disable-gpg --disable-curl --disable-openssl&quot;<br>
<br>
-#PROVIDES_append_virtclass-native =3D &quot;virtual/update-alternatives-na=
tive&quot;<br>
-#RPROVIDES_${PN} +=3D &quot;update-alternatives-native&quot;<br>
+PROVIDES +=3D &quot;virtual/update-alternatives&quot;<br>
+RPROVIDES_update-alternatives-cworth +=3D &quot;update-alternatives&quot;<=
br>
+RCONFLICTS_update-alternatives-cworth =3D &quot;update-alternatives-dpkg&q=
uot;<br>
+RDEPENDS_${PN} =3D &quot;${VIRTUAL-RUNTIME_update-alternatives} opkg-confi=
g-base&quot;<br>
+RDEPENDS_${PN}_virtclass-native =3D &quot;&quot;<br>
+RDEPENDS_${PN}_virtclass-nativesdk =3D &quot;&quot;<br>
+PACKAGE_ARCH_update-alternatives-cworth =3D &quot;all&quot;<br>
+RREPLACES_${PN} =3D &quot;opkg-nogpg&quot;<br>
+<br>
+PACKAGES =3D+ &quot;libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alt=
ernatives-cworth${PKGSUFFIX}&quot;<br>
+<br>
+FILES_update-alternatives-cworth${PKGSUFFIX} =3D &quot;${bindir}/update-al=
ternatives&quot;<br>
+FILES_libopkg${PKGSUFFIX}-dev =3D &quot;${libdir}/*.a ${libdir}/*.la ${lib=
dir}/*.so&quot;<br>
+FILES_libopkg${PKGSUFFIX} =3D &quot;${libdir}/*.so.* ${localstatedir}/lib/=
opkg/&quot;<br>
+<br>
+# We need to create the lock directory<br>
+do_install_append() {<br>
+ =A0 =A0 =A0 install -d ${D}${localstatedir}/lib/opkg<br>
+}<br>
+<br>
+pkg_postinst_${PN} () {<br>
+#!/bin/sh<br>
+if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then<br>
+ =A0 =A0 =A0 install -d $D${sysconfdir}/rcS.d<br>
+ =A0 =A0 =A0 # this happens at S98 where our good &#39;ole packages script=
 used to run<br>
+ =A0 =A0 =A0 echo &quot;#!/bin/sh<br>
+opkg-cl configure<br>
+rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure<br>
+&quot; &gt; $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure<br=
>
+ =A0 =A0 =A0 chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}=
configure<br>
+fi<br>
+<br>
+update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100<br=
>
+}<br>
+<br>
+pkg_postrm_${PN} () {<br>
+#!/bin/sh<br>
+update-alternatives --remove opkg ${bindir}/opkg-cl<br>
+}<br>
+<br>
<br>
=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.1.8.bb" ta=
rget=3D"_blank">opkg_0.1.8.bb</a> b/meta/recipes-devtools/opkg/<a href=3D"h=
ttp://opkg_0.1.8.bb" target=3D"_blank">opkg_0.1.8.bb</a><br>
index 18cf042..c206b37 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.1.8.bb" target=3D=
"_blank">opkg_0.1.8.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.1.8.bb" target=3D=
"_blank">opkg_0.1.8.bb</a><br>
@@ -1,48 +1,8 @@<br>
=A0require opkg.inc<br>
<br>
-PROVIDES +=3D &quot;virtual/update-alternatives&quot;<br>
-RPROVIDES_update-alternatives-cworth +=3D &quot;update-alternatives&quot;<=
br>
-RCONFLICTS_update-alternatives-cworth =3D &quot;update-alternatives-dpkg&q=
uot;<br>
-RDEPENDS_${PN} =3D &quot;${VIRTUAL-RUNTIME_update-alternatives} opkg-confi=
g-base&quot;<br>
-RDEPENDS_${PN}_virtclass-native =3D &quot;&quot;<br>
-RDEPENDS_${PN}_virtclass-nativesdk =3D &quot;&quot;<br>
-PACKAGE_ARCH_update-alternatives-cworth =3D &quot;all&quot;<br>
-<br>
=A0SRC_URI =3D &quot;<a href=3D"http://opkg.googlecode.com/files/opkg-${PV}=
.tar.gz" target=3D"_blank">http://opkg.googlecode.com/files/opkg-${PV}.tar.=
gz</a> \<br>
 =A0 =A0 =A0 =A0 =A0 =A0file://add_vercmp.patch \<br>
 =A0 =A0 =A0 =A0 =A0 =A0file://headerfix.patch \<br>
-&quot;<br>
-<br>
-PR =3D &quot;r4&quot;<br>
-<br>
-PACKAGES =3D+ &quot;libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alt=
ernatives-cworth${PKGSUFFIX}&quot;<br>
-<br>
-FILES_update-alternatives-cworth${PKGSUFFIX} =3D &quot;${bindir}/update-al=
ternatives&quot;<br>
-FILES_libopkg${PKGSUFFIX}-dev =3D &quot;${libdir}/*.a ${libdir}/*.la ${lib=
dir}/*.so&quot;<br>
-FILES_libopkg${PKGSUFFIX} =3D &quot;${libdir}/*.so.* ${localstatedir}/lib/=
opkg/&quot;<br>
-<br>
-# We need to create the lock directory<br>
-do_install_append() {<br>
- =A0 =A0 =A0 install -d ${D}${localstatedir}/lib/opkg<br>
-}<br>
-<br>
-pkg_postinst_${PN} () {<br>
-#!/bin/sh<br>
-if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then<br>
- =A0 =A0 =A0 install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d<br>
- =A0 =A0 =A0 # this happens at S98 where our good &#39;ole packages script=
 used to run<br>
- =A0 =A0 =A0 echo &quot;#!/bin/sh<br>
-opkg-cl configure<br>
-rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure<br>
-&quot; &gt; $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure<br=
>
- =A0 =A0 =A0 chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}=
configure<br>
-fi<br>
-<br>
-update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100<br=
>
-}<br>
-<br>
-pkg_postrm_${PN} () {<br>
-#!/bin/sh<br>
-update-alternatives --remove opkg ${bindir}/opkg-cl<br>
-}<br>
+ =A0 =A0 =A0 =A0 =A0&quot;<br>
<br>
+PR =3D &quot;${INC_PR}.0&quot;<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_svn.bb" targ=
et=3D"_blank">opkg_svn.bb</a> b/meta/recipes-devtools/opkg/<a href=3D"http:=
//opkg_svn.bb" target=3D"_blank">opkg_svn.bb</a><br>
index f5f540d..c07d393 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_svn.bb" target=3D"_=
blank">opkg_svn.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_svn.bb" target=3D"_=
blank">opkg_svn.bb</a><br>
@@ -1,14 +1,5 @@<br>
=A0require opkg.inc<br>
<br>
-PROVIDES +=3D &quot;virtual/update-alternatives&quot;<br>
-RPROVIDES_update-alternatives-cworth +=3D &quot;update-alternatives&quot;<=
br>
-RCONFLICTS_update-alternatives-cworth =3D &quot;update-alternatives-dpkg&q=
uot;<br>
-RDEPENDS_${PN} =3D &quot;${VIRTUAL-RUNTIME_update-alternatives} opkg-confi=
g-base&quot;<br>
-RDEPENDS_${PN}_virtclass-native =3D &quot;&quot;<br>
-RDEPENDS_${PN}_virtclass-nativesdk =3D &quot;&quot;<br>
-PACKAGE_ARCH_update-alternatives-cworth =3D &quot;all&quot;<br>
-RREPLACES_${PN} =3D &quot;opkg-nogpg&quot;<br>
-<br>
=A0SRC_URI =3D &quot;svn://<a href=3D"http://opkg.googlecode.com/svn;module=
=3Dtrunk;proto=3Dhttp" target=3D"_blank">opkg.googlecode.com/svn;module=3Dt=
runk;proto=3Dhttp</a> \<br>
 =A0 =A0 =A0 =A0 =A0 =A0file://add_vercmp.patch \<br>
 =A0 =A0 =A0 =A0 =A0 =A0file://add_uname_support.patch \<br>
@@ -21,36 +12,5 @@ S =3D &quot;${WORKDIR}/trunk&quot;<br>
<br>
=A0SRCREV =3D &quot;633&quot;<br>
=A0PV =3D &quot;0.1.8+svnr${SRCPV}&quot;<br>
-PR =3D &quot;r5&quot;<br>
-<br>
-PACKAGES =3D+ &quot;libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alt=
ernatives-cworth${PKGSUFFIX}&quot;<br>
-<br>
-FILES_update-alternatives-cworth${PKGSUFFIX} =3D &quot;${bindir}/update-al=
ternatives&quot;<br>
-FILES_libopkg${PKGSUFFIX}-dev =3D &quot;${libdir}/*.a ${libdir}/*.la ${lib=
dir}/*.so&quot;<br>
-FILES_libopkg${PKGSUFFIX} =3D &quot;${libdir}/*.so.* ${localstatedir}/lib/=
opkg/&quot;<br>
-<br>
-# We need to create the lock directory<br>
-do_install_append() {<br>
- =A0 =A0 =A0 install -d ${D}${localstatedir}/lib/opkg<br>
-}<br>
-<br>
-pkg_postinst_${PN} () {<br>
-#!/bin/sh<br>
-if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then<br>
- =A0 =A0 =A0 install -d $D${sysconfdir}/rcS.d<br>
- =A0 =A0 =A0 # this happens at S98 where our good &#39;ole packages script=
 used to run<br>
- =A0 =A0 =A0 echo &quot;#!/bin/sh<br>
-opkg-cl configure<br>
-rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure<br>
-&quot; &gt; $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure<br=
>
- =A0 =A0 =A0 chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}=
configure<br>
-fi<br>
-<br>
-update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100<br=
>
-}<br>
-<br>
-pkg_postrm_${PN} () {<br>
-#!/bin/sh<br>
-update-alternatives --remove opkg ${bindir}/opkg-cl<br>
-}<br>
<br>
+PR =3D &quot;${INC_PR}.0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.6.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d04016d5952c26a04b703b1b9--
