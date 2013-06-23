Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3E76AD40
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 06:27:03 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id j13so7679784wgh.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2013 23:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=07syQYKM/MHAZT3YugVQxb4hmP3AkJ5JkwmjoDnWr6I=;
	b=NfAPTVw9gjcDfUbbiGttCT43zBOP2fwUUw+/HbnZnkthAo3i/2n5cUpU+j/x0P6Q9g
	wfQpVU551U2AuBtUS0P7utzKWsvv+WKjYu/tZ1a3v25TGR4XtHOAmJeWuWYx9crbNHC9
	aJ/brGhiDPzjeriiydXcomZ490BDyDeo56VKoF6dfSeiHnOi+dNSHSyGdD+5uotAguGB
	q926+DP5DlyUsLEIMcTlDdCECF+KJI1D0gWY6l1WrsqyY5QaE/uBq4YIFhsO+LWVSbap
	HXEJ/Fbw4m8iwolfVdCr9Ki+QwGvg2m+zL01q7O2Vjs05Vcbo0ezXsL7/W6mKvasfP2m
	qfTA==
MIME-Version: 1.0
X-Received: by 10.180.211.202 with SMTP id ne10mr2942234wic.39.1371968823419; 
	Sat, 22 Jun 2013 23:27:03 -0700 (PDT)
Received: by 10.194.16.136 with HTTP; Sat, 22 Jun 2013 23:27:03 -0700 (PDT)
In-Reply-To: <1371951415-52721-1-git-send-email-kirgene@gmail.com>
References: <1371951415-52721-1-git-send-email-kirgene@gmail.com>
Date: Sun, 23 Jun 2013 08:27:03 +0200
Message-ID: <CA+chaQcfgpbEjMZ8pKoP6BWkXrdQYw6+MEDc2yu8sYS1QRsQOA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] systemd: added python-systemd package generation.
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
X-List-Received-Date: Sun, 23 Jun 2013 06:27:03 -0000
Content-Type: multipart/alternative; boundary=001a11c259ee5cea8704dfcc6297

--001a11c259ee5cea8704dfcc6297
Content-Type: text/plain; charset=UTF-8

-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux
pythonnative python-dir"

This doesn't look right, did you want to inherit them?


On Sun, Jun 23, 2013 at 3:36 AM, Yevhen Kyriukha <kirgene@gmail.com> wrote:

> ---
>  meta/recipes-core/systemd/systemd_204.bb |   20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_204.bbb/meta/recipes-core/systemd/
> systemd_204.bb
> index b8b1290..ea0cdd2 100644
> --- a/meta/recipes-core/systemd/systemd_204.bb
> +++ b/meta/recipes-core/systemd/systemd_204.bb
> @@ -10,9 +10,15 @@ PROVIDES = "udev"
>
>  PE = "1"
>
> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
> +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux
> pythonnative python-dir"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> +# need to export these variables for python-config to work
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
>  SECTION = "base/shell"
>
>  inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
> update-alternatives qemu
> @@ -51,6 +57,8 @@ DEPENDS += "libgcrypt"
>  # Compress the journal
>  PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>  PACKAGECONFIG[tcp-wrappers] =
> "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
> +# Use python-systemd
> +PACKAGECONFIG[python] = "--with-python,--without-python,python"
>
>  CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
>
> @@ -71,7 +79,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                   --disable-tcpwrap \
>                   --enable-split-usr \
>                   --disable-microhttpd \
> -                 --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
>                   --with-firmware-path=/lib/firmware \
>                   ac_cv_path_KILL=${base_bindir}/kill \
> @@ -93,6 +100,8 @@ do_install() {
>         # Provided by a separate recipe
>         rm ${D}${systemd_unitdir}/system/serial-getty* -f
>
> +       rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la
> +
>         # Provide support for initramfs
>         ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
>         ln -s ${rootlibexecdir}/systemd/systemd-udevd
> ${D}/${base_sbindir}/udevd
> @@ -121,7 +130,7 @@ python populate_packages_prepend (){
>  }
>  PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>
> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze
> ${PN}-kernel-install"
> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze
> ${PN}-kernel-install python-${PN}"
>
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
> @@ -131,6 +140,9 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>  FILES_${PN}-initramfs = "/init"
>  RDEPENDS_${PN}-initramfs = "${PN}"
>
> +FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py*
> ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
> +RDEPENDS_python-${PN} = "python-core python-datetime python-logging
> python-syslog"
> +
>  FILES_${PN}-gui = "${bindir}/systemadm"
>
>  FILES_${PN}-vconsole-setup =
> "${rootlibexecdir}/systemd/systemd-vconsole-setup \
> @@ -187,7 +199,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                  /lib/udev/rules.d/99-systemd.rules \
>                 "
>
> -FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug
> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
> +FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug
> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/
> ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
>  FILES_${PN}-dev += "${base_libdir}/security/*.la
> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>
>  RDEPENDS_${PN} += "dbus util-linux-mount"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c259ee5cea8704dfcc6297
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>-DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native i=
ntltool-native=20
gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native=20
util-linux&quot;<br>
+DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native=20
gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native=20
util-linux pythonnative python-dir&quot;<br><br></div>This doesn&#39;t look=
 right, did you want to inherit them?<br><div><div class=3D"gmail_extra"><b=
r><br><div class=3D"gmail_quote">On Sun, Jun 23, 2013 at 3:36 AM, Yevhen Ky=
riukha <span dir=3D"ltr">&lt;<a href=3D"mailto:kirgene@gmail.com" target=3D=
"_blank">kirgene@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">systemd_204.bb</a> | =C2=A0 20 ++++++++++++++++----<br>
=C2=A01 file changed, 16 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" ta=
rget=3D"_blank">systemd_204.bb</a> b/meta/recipes-core/systemd/<a href=3D"h=
ttp://systemd_204.bb" target=3D"_blank">systemd_204.bb</a><br>
index b8b1290..ea0cdd2 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">systemd_204.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">systemd_204.bb</a><br>
@@ -10,9 +10,15 @@ PROVIDES =3D &quot;udev&quot;<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux&qu=
ot;<br>
+DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux py=
thonnative python-dir&quot;<br>
=C2=A0DEPENDS +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;p=
am&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
<br>
+# need to export these variables for python-config to work<br>
+export BUILD_SYS<br>
+export HOST_SYS<br>
+export STAGING_INCDIR<br>
+export STAGING_LIBDIR<br>
+<br>
=C2=A0SECTION =3D &quot;base/shell&quot;<br>
<br>
=C2=A0inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d up=
date-alternatives qemu<br>
@@ -51,6 +57,8 @@ DEPENDS +=3D &quot;libgcrypt&quot;<br>
=C2=A0# Compress the journal<br>
=C2=A0PACKAGECONFIG[xz] =3D &quot;--enable-xz,--disable-xz,xz&quot;<br>
=C2=A0PACKAGECONFIG[tcp-wrappers] =3D &quot;--enable-tcpwrap,--disable-tcpw=
rap,tcp-wrappers&quot;<br>
+# Use python-systemd<br>
+PACKAGECONFIG[python] =3D &quot;--with-python,--without-python,python&quot=
;<br>
<br>
=C2=A0CACHED_CONFIGUREVARS =3D &quot;ac_cv_path_KILL=3D${base_bindir}/kill&=
quot;<br>
<br>
@@ -71,7 +79,6 @@ EXTRA_OECONF =3D &quot; --with-rootprefix=3D${rootprefix}=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-tc=
pwrap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-spl=
it-usr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-mi=
crohttpd \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-python =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-sysvr=
cnd-path=3D${sysconfdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-firmw=
are-path=3D/lib/firmware \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_path_K=
ILL=3D${base_bindir}/kill \<br>
@@ -93,6 +100,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Provided by a separate recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}${systemd_unitdir}/system/serial-getty* =
-f<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la<br=
>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Provide support for initramfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ${rootlibexecdir}/systemd/systemd ${D}/in=
it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ${rootlibexecdir}/systemd/systemd-udevd $=
{D}/${base_sbindir}/udevd<br>
@@ -121,7 +130,7 @@ python populate_packages_prepend (){<br>
=C2=A0}<br>
=C2=A0PACKAGES_DYNAMIC +=3D &quot;^lib(udev|gudev|systemd).*&quot;<br>
<br>
-PACKAGES =3D+ &quot;${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-a=
nalyze ${PN}-kernel-install&quot;<br>
+PACKAGES =3D+ &quot;${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-a=
nalyze ${PN}-kernel-install python-${PN}&quot;<br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0GROUPADD_PARAM_${PN} =3D &quot;-r lock; -r systemd-journal&quot;<br>
@@ -131,6 +140,9 @@ FILES_${PN}-analyze =3D &quot;${bindir}/systemd-analyze=
&quot;<br>
=C2=A0FILES_${PN}-initramfs =3D &quot;/init&quot;<br>
=C2=A0RDEPENDS_${PN}-initramfs =3D &quot;${PN}&quot;<br>
<br>
+FILES_python-${PN} =3D &quot;${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PY=
THON_SITEPACKAGES_DIR}/systemd/*.so&quot;<br>
+RDEPENDS_python-${PN} =3D &quot;python-core python-datetime python-logging=
 python-syslog&quot;<br>
+<br>
=C2=A0FILES_${PN}-gui =3D &quot;${bindir}/systemadm&quot;<br>
<br>
=C2=A0FILES_${PN}-vconsole-setup =3D &quot;${rootlibexecdir}/systemd/system=
d-vconsole-setup \<br>
@@ -187,7 +199,7 @@ FILES_${PN} =3D &quot; ${base_bindir}/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/lib/udev/rul=
es.d/99-systemd.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${rootlibdir}/.debug ${systemd_unitdir}/.debug =
${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${rootlibdir}/.debug ${systemd_unitdir}/.debug =
${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${PYTHON_SITEPA=
CKAGES_DIR}/systemd/.debug&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${base_libdir}/security/*.la ${datadir}/db=
us-1/interfaces/ ${sysconfdir}/rpm/macros.systemd&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;dbus util-linux-mount&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div></div></div>

--001a11c259ee5cea8704dfcc6297--
