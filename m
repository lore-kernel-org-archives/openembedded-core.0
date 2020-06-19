Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web12.245.1592602347513200872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 14:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VoUWuzIs;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id q2so6406715vsr.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 14:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1xiyYchxqMKKjmZnHcS7E3vcrLn16CgYbAxqTJ5x7Qw=;
        b=VoUWuzIsfvg0RNaD2xp3tYtxnAlbwFyKb1c43tF+nPuXP4n0L37E140CWRtC5nHHIh
         V8PVYqp6pcY+vW2zbzqKtmlV6p+XL/gLlxaCaCp0ZgdZAAfPsQPl1yg91XBmDDgaMhIu
         +h2d2r7w4EL2oFnLLiTQLToAwjb0ncKX13THtmz+ZbW19RfNlCDkx3eFzobiJcyM0Tmw
         04/UT8OVCp2sZJyeweG/hV1eeru7jwg34J/9ZRXecJzgIPZgA4zDeklVfoInPg5Ifsbx
         Z//8fTpLqybNNYykIGpr6NKlS3xWj2tGV/PN6dgsGPgPYQffJLOUqXVTG/iPw/qAjAVN
         VfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1xiyYchxqMKKjmZnHcS7E3vcrLn16CgYbAxqTJ5x7Qw=;
        b=NYWTyMkXIrq8Q4CNi78Q8HeiAJeoeKhw0VOyEH8007h0gGHpSGyl3+fHbogvYJWlcz
         Zg0QuAClrYgKB6jmZmkJDa42ejosj8j0HmQET73Nlfgz9z9FveBWl8nTT0MlqXsoIX3A
         Oh3CIvYWViNUHl4qnOlx7hxaaPLcYmRvIMcw9YZ889bE5KmhnF4aIE2/HEk7Gu5qEGqO
         KMg3g596u/SLC0e4FYJHfFvVZ4VXp6PgQheoGlQWuTMnWV7hFZmLmflc1FWofcCCuCFz
         ybu/aJkw18QPZCv7Rp3rTRa48Z55YGin69dVe1akyf9Ta3nVQPeeiS52ffIyF7gT+bMT
         WJNQ==
X-Gm-Message-State: AOAM530L4o/EnuWILDsxshQGx2GNbJX6RZmQivU3flINoUnfSCqJqnwS
	IKZhavdSp5Cgclts25VxN9BQI+VG6n69gKO9g+iDBABi
X-Google-Smtp-Source: ABdhPJwQIcyRgOt3fE+ZFrqj1oz3t2AwRs6DjYD4+KyjJUn5EjStsL5CnQ6MQhLEozGLypxpk8Y5IUUTXR6TOQykpiE=
X-Received: by 2002:a67:db0b:: with SMTP id z11mr8829916vsj.25.1592602346509;
 Fri, 19 Jun 2020 14:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200619192550.12379-1-ovidiu.panait@windriver.com> <20200619192550.12379-2-ovidiu.panait@windriver.com>
In-Reply-To: <20200619192550.12379-2-ovidiu.panait@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 19 Jun 2020 23:32:15 +0200
Message-ID: <CANNYZj_d+HcPS5Stp0-Mg8j7HKUrUiU28KamH8ouxX7wfW782A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] dbus,dbus-test: Move common parts to dbus.inc
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000021dd6305a876a117"

--00000000000021dd6305a876a117
Content-Type: text/plain; charset="UTF-8"

Is it possible to merge the two recipes completely, simply putting the
testing bits into a package called dbus-test?

Alex

On Fri, 19 Jun 2020 at 21:28, Ovidiu Panait <ovidiu.panait@windriver.com>
wrote:

> dbus and dbus-test share the same source code and base configuration
> options,
> so factor out the common parts into dbus.inc.
>
> This way we can eliminate the need to keep the two recipes in sync. When
> they
> are not properly in sync (e.g. when dbus recipe has extra patches/config
> options that are not duplicated in dbus-test) ptest testsuite will actually
> test a slightly different codebase. This is due to the fact that dbus-test
> does
> not run the testsuite against the system libdbus library, but instead it
> generates a local libdbus.so that needs to configured/compiled as close as
> possible to the system one.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/recipes-core/dbus/dbus-test_1.12.18.bb | 38 +++++---------------
>  meta/recipes-core/dbus/dbus.inc             | 34 ++++++++++++++++++
>  meta/recipes-core/dbus/dbus_1.12.18.bb      | 39 +++------------------
>  3 files changed, 47 insertions(+), 64 deletions(-)
>  create mode 100644 meta/recipes-core/dbus/dbus.inc
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb
> b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
> index 68fcdc847f..755c841bad 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.18.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
> @@ -1,53 +1,31 @@
>  SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
>  HOMEPAGE = "http://dbus.freedesktop.org"
>  SECTION = "base"
> -LICENSE = "AFL-2.1 | GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> -
> file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
>
> -DEPENDS = "dbus glib-2.0"
> +require dbus.inc
>
> -RDEPENDS_${PN}-dev = ""
> +SRC_URI += "file://run-ptest \
> +            file://python-config.patch \
> +           "
>
> -SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> -           file://tmpdir.patch \
> -           file://run-ptest \
> -           file://python-config.patch \
> -           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
> -           "
> +DEPENDS = "dbus glib-2.0"
>
> -SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
> -SRC_URI[sha256sum] =
> "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
> +RDEPENDS_${PN}-dev = ""
>
>  S="${WORKDIR}/dbus-${PV}"
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
>
> -inherit autotools pkgconfig gettext ptest upstream-version-is-even
> +inherit ptest
>
> -EXTRA_OECONF = "--enable-tests \
> +EXTRA_OECONF += "--enable-tests \
>                  --enable-modular-tests \
>                  --enable-installed-tests \
>                  --enable-checks \
>                  --enable-asserts \
> -                --enable-largefile \
> -                --disable-xml-docs \
> -                --disable-doxygen-docs \
> -                --disable-libaudit \
>                  --with-dbus-test-dir=${PTEST_PATH} \
>                  --enable-embedded-tests \
>               "
>
> -EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> -
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11',
> d)}"
> -PACKAGECONFIG_class-native = ""
> -PACKAGECONFIG_class-nativesdk = ""
> -
> -PACKAGECONFIG[systemd] = "--enable-systemd
> --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd
> --without-systemdsystemunitdir,systemd"
> -PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
> --disable-x11-autolaunch, virtual/libx11 libsm"
> -PACKAGECONFIG[user-session] = "--enable-user-session
> --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> -PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
> -
>  do_install() {
>      :
>  }
> diff --git a/meta/recipes-core/dbus/dbus.inc
> b/meta/recipes-core/dbus/dbus.inc
> new file mode 100644
> index 0000000000..3bdb7ea4ff
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -0,0 +1,34 @@
> +inherit autotools pkgconfig gettext upstream-version-is-even
> +
> +LICENSE = "AFL-2.1 | GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> +
> file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
> +
> +SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> +           file://tmpdir.patch \
> +           file://dbus-1.init \
> +           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
> +"
> +
> +SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
> +SRC_URI[sha256sum] =
> "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
> +
> +EXTRA_OECONF = "--disable-xml-docs \
> +                --disable-doxygen-docs \
> +                --disable-libaudit \
> +                --enable-largefile \
> +                --with-system-socket=/run/dbus/system_bus_socket \
> +                "
> +EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> +EXTRA_OECONF_append_class-native = " --disable-selinux"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11',
> d)} \
> +                   user-session \
> +                  "
> +PACKAGECONFIG_class-native = ""
> +PACKAGECONFIG_class-nativesdk = ""
> +
> +PACKAGECONFIG[systemd] = "--enable-systemd
> --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd
> --without-systemdsystemunitdir,systemd"
> +PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
> --disable-x11-autolaunch, virtual/libx11 libsm"
> +PACKAGECONFIG[user-session] = "--enable-user-session
> --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> +PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
> diff --git a/meta/recipes-core/dbus/dbus_1.12.18.bb
> b/meta/recipes-core/dbus/dbus_1.12.18.bb
> index 2fcb3079ad..cf6f7dc0ef 100644
> --- a/meta/recipes-core/dbus/dbus_1.12.18.bb
> +++ b/meta/recipes-core/dbus/dbus_1.12.18.bb
> @@ -2,9 +2,9 @@ SUMMARY = "D-Bus message bus"
>  DESCRIPTION = "D-Bus is a message bus system, a simple way for
> applications to talk to one another. In addition to interprocess
> communication, D-Bus helps coordinate process lifecycle; it makes it simple
> and reliable to code a \"single instance\" application or daemon, and to
> launch applications and daemons on demand when their services are needed."
>  HOMEPAGE = "https://dbus.freedesktop.org"
>  SECTION = "base"
> -LICENSE = "AFL-2.1 | GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> -
> file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
> +
> +require dbus.inc
> +
>  DEPENDS = "expat virtual/libintl autoconf-archive"
>  RDEPENDS_dbus_class-native = ""
>  RDEPENDS_dbus_class-nativesdk = ""
> @@ -12,16 +12,7 @@ PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES',
> 'ptest', '${PN}-ptest', '',
>  ALLOW_EMPTY_dbus-ptest = "1"
>  RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
>
> -SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> -           file://tmpdir.patch \
> -           file://dbus-1.init \
> -           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
> -"
> -
> -SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
> -SRC_URI[sha256sum] =
> "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
> -
> -inherit useradd autotools pkgconfig gettext update-rc.d
> upstream-version-is-even
> +inherit useradd update-rc.d
>
>  INITSCRIPT_NAME = "dbus-1"
>  INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
> @@ -92,27 +83,7 @@ pkg_postinst_dbus() {
>  }
>
>
> -EXTRA_OECONF = "--disable-tests \
> -                --disable-xml-docs \
> -                --disable-doxygen-docs \
> -                --disable-libaudit \
> -                --enable-largefile \
> -                --with-system-socket=/run/dbus/system_bus_socket \
> -                "
> -
> -EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> -EXTRA_OECONF_append_class-native = " --disable-selinux"
> -
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11',
> d)} \
> -                   user-session \
> -                  "
> -
> -PACKAGECONFIG_class-native = ""
> -PACKAGECONFIG_class-nativesdk = ""
> -
> -PACKAGECONFIG[systemd] = "--enable-systemd
> --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd
> --without-systemdsystemunitdir,systemd"
> -PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
> --disable-x11-autolaunch, virtual/libx11 libsm"
> -PACKAGECONFIG[user-session] = "--enable-user-session
> --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> +EXTRA_OECONF += "--disable-tests"
>
>  do_install() {
>         autotools_do_install
> --
> 2.17.1
>
> 
>

--00000000000021dd6305a876a117
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is it possible to merge the two recipes completely, s=
imply putting the testing bits into a package called dbus-test?</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 19 Jun 2020 at 21:28, Ovidiu Panait =
&lt;<a href=3D"mailto:ovidiu.panait@windriver.com">ovidiu.panait@windriver.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">dbus and dbus-test share the same source code and base configuration opt=
ions,<br>
so factor out the common parts into dbus.inc.<br>
<br>
This way we can eliminate the need to keep the two recipes in sync. When t=
hey<br>
are not properly in sync (e.g. when dbus recipe has extra patches/config<b=
r>
options that are not duplicated in dbus-test) ptest testsuite will actuall=
y<br>
test a slightly different codebase. This is due to the fact that dbus-test=
 does<br>
not run the testsuite against the system libdbus library, but instead it<b=
r>
generates a local libdbus.so that needs to configured/compiled as close as=
<br>
possible to the system one.<br>
<br>
Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu.panait@windriver=
.com" target=3D"_blank">ovidiu.panait@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.18.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus-test_1.12.18.bb</a> | 38 +++++-----=
----------<br>
=C2=A0meta/recipes-core/dbus/dbus.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 34 ++++++++++++++++++<br>
=C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus_1.12.18.bb" rel=3D"nor=
eferrer" target=3D"_blank">dbus_1.12.18.bb</a>=C2=A0 =C2=A0 =C2=A0 | 39 +++=
------------------<br>
=C2=A03 files changed, 47 insertions(+), 64 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/dbus/dbus.inc<br>
<br>
diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.18.bb=
" rel=3D"noreferrer" target=3D"_blank">dbus-test_1.12.18.bb</a> b/meta/reci=
pes-core/dbus/<a href=3D"http://dbus-test_1.12.18.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">dbus-test_1.12.18.bb</a><br>
index 68fcdc847f..755c841bad 100644<br>
--- a/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.18.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus-test_1.12.18.bb</a><br>
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.18.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus-test_1.12.18.bb</a><br>
@@ -1,53 +1,31 @@<br>
=C2=A0SUMMARY =3D &quot;D-Bus test package (for D-bus functionality testin=
g only)&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://dbus.freedesktop.org" rel=3D"no=
referrer" target=3D"_blank">http://dbus.freedesktop.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;base&quot;<br>
-LICENSE =3D &quot;AFL-2.1 | GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D10dded3b58148f3f1fd804b26=
354af3e \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D7755c9d7abccd5dbd25a6a9745=
38bb3c&quot;<br>
<br>
-DEPENDS =3D &quot;dbus glib-2.0&quot;<br>
+require dbus.inc<br>
<br>
-RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
+SRC_URI +=3D &quot;file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-config.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop.org/releases/dbus/db=
us-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://dbus.freed=
esktop.org/releases/dbus/dbus-${PV}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tmpdir.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://python-config.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clear-guid_from_server-if=
-send_negotiate_unix_f.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+DEPENDS =3D &quot;dbus glib-2.0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;4ca570c281be35d0b30ab83436712242&quot;<br>
-SRC_URI[sha256sum] =3D &quot;64cf4d70840230e5e9bc784d153880775ab3db19d656=
ead8a0cb9c0ab5a95306&quot;<br>
+RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
<br>
=C2=A0S=3D&quot;${WORKDIR}/dbus-${PV}&quot;<br>
=C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/dbus:&quot;<br>
<br>
-inherit autotools pkgconfig gettext ptest upstream-version-is-even<br>
+inherit ptest<br>
<br>
-EXTRA_OECONF =3D &quot;--enable-tests \<br>
+EXTRA_OECONF +=3D &quot;--enable-tests \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-mod=
ular-tests \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-ins=
talled-tests \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-che=
cks \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-ass=
erts \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-largefil=
e \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-xml-doc=
s \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-doxygen=
-docs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-libaudi=
t \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-dbus-=
test-dir=3D${PTEST_PATH} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-emb=
edded-tests \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-EXTRA_OECONF_append_class-target =3D &quot; SYSTEMCTL=3D${base_bindir}/sy=
stemctl&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;systemd x11&#39;, d)}&quot;<br>
-PACKAGECONFIG_class-native =3D &quot;&quot;<br>
-PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
-<br>
-PACKAGECONFIG[systemd] =3D &quot;--enable-systemd --with-systemdsystemuni=
tdir=3D${systemd_system_unitdir},--disable-systemd --without-systemdsystemu=
nitdir,systemd&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;--with-x --enable-x11-autolaunch,--without-x=
 --disable-x11-autolaunch, virtual/libx11 libsm&quot;<br>
-PACKAGECONFIG[user-session] =3D &quot;--enable-user-session --with-system=
duserunitdir=3D${systemd_user_unitdir},--disable-user-session&quot;<br>
-PACKAGECONFIG[verbose-mode] =3D &quot;--enable-verbose-mode,,,&quot;<br>
-<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0:<br>
=C2=A0}<br>
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus=
.inc<br>
new file mode 100644<br>
index 0000000000..3bdb7ea4ff<br>
--- /dev/null<br>
+++ b/meta/recipes-core/dbus/dbus.inc<br>
@@ -0,0 +1,34 @@<br>
+inherit autotools pkgconfig gettext upstream-version-is-even<br>
+<br>
+LICENSE =3D &quot;AFL-2.1 | GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D10dded3b58148f3f1fd804b26=
354af3e \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D7755c9d7abccd5dbd25a6a9745=
38bb3c&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://dbus.freedesktop.org/releases/dbus/d=
bus-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://dbus.fre=
edesktop.org/releases/dbus/dbus-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tmpdir.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dbus-1.init \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clear-guid_from_server-if=
-send_negotiate_unix_f.patch \<br>
+&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;4ca570c281be35d0b30ab83436712242&quot;<br>
+SRC_URI[sha256sum] =3D &quot;64cf4d70840230e5e9bc784d153880775ab3db19d656=
ead8a0cb9c0ab5a95306&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot;--disable-xml-docs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-doxygen=
-docs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-libaudi=
t \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-largefil=
e \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-system-soc=
ket=3D/run/dbus/system_bus_socket \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+EXTRA_OECONF_append_class-target =3D &quot; SYSTEMCTL=3D${base_bindir}/sy=
stemctl&quot;<br>
+EXTRA_OECONF_append_class-native =3D &quot; --disable-selinux&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;systemd x11&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user=
-session \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[systemd] =3D &quot;--enable-systemd --with-systemdsystemuni=
tdir=3D${systemd_system_unitdir},--disable-systemd --without-systemdsystemu=
nitdir,systemd&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;--with-x --enable-x11-autolaunch,--without-x=
 --disable-x11-autolaunch, virtual/libx11 libsm&quot;<br>
+PACKAGECONFIG[user-session] =3D &quot;--enable-user-session --with-system=
duserunitdir=3D${systemd_user_unitdir},--disable-user-session&quot;<br>
+PACKAGECONFIG[verbose-mode] =3D &quot;--enable-verbose-mode,,,&quot;<br>
diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.12.18.bb" rel=
=
=3D"noreferrer" target=3D"_blank">dbus_1.12.18.bb</a> b/meta/recipes-core/=
dbus/<a href=3D"http://dbus_1.12.18.bb" rel=3D"noreferrer" target=3D"_blank=
">dbus_1.12.18.bb</a><br>
index 2fcb3079ad..cf6f7dc0ef 100644<br>
--- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.12.18.bb" rel=3D"nor=
eferrer" target=3D"_blank">dbus_1.12.18.bb</a><br>
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.12.18.bb" rel=3D"nor=
eferrer" target=3D"_blank">dbus_1.12.18.bb</a><br>
@@ -2,9 +2,9 @@ SUMMARY =3D &quot;D-Bus message bus&quot;<br>
=C2=A0DESCRIPTION =3D &quot;D-Bus is a message bus system, a simple way fo=
r applications to talk to one another. In addition to interprocess communic=
ation, D-Bus helps coordinate process lifecycle; it makes it simple and rel=
iable to code a \&quot;single instance\&quot; application or daemon, and to=
 launch applications and daemons on demand when their services are needed.&=
quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://dbus.freedesktop.org" rel=3D"n=
oreferrer" target=3D"_blank">https://dbus.freedesktop.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;base&quot;<br>
-LICENSE =3D &quot;AFL-2.1 | GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D10dded3b58148f3f1fd804b26=
354af3e \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D7755c9d7abccd5dbd25a6a9745=
38bb3c&quot;<br>
+<br>
+require dbus.inc<br>
+<br>
=C2=A0DEPENDS =3D &quot;expat virtual/libintl autoconf-archive&quot;<br>
=C2=A0RDEPENDS_dbus_class-native =3D &quot;&quot;<br>
=C2=A0RDEPENDS_dbus_class-nativesdk =3D &quot;&quot;<br>
@@ -12,16 +12,7 @@ PACKAGES +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;ptest&#39;, &#39;${PN}-ptest&#39;, &#39;&#39;,<br>
=C2=A0ALLOW_EMPTY_dbus-ptest =3D &quot;1&quot;<br>
=C2=A0RDEPENDS_dbus-ptest_class-target =3D &quot;dbus-test-ptest&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://dbus.freedesktop.org/releases/dbus/d=
bus-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://dbus.fre=
edesktop.org/releases/dbus/dbus-${PV}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tmpdir.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dbus-1.init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clear-guid_from_server-if=
-send_negotiate_unix_f.patch \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;4ca570c281be35d0b30ab83436712242&quot;<br>
-SRC_URI[sha256sum] =3D &quot;64cf4d70840230e5e9bc784d153880775ab3db19d656=
ead8a0cb9c0ab5a95306&quot;<br>
-<br>
-inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-=
is-even<br>
+inherit useradd update-rc.d<br>
<br>
=C2=A0INITSCRIPT_NAME =3D &quot;dbus-1&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;start 02 5 3 2 . stop 20 0 1 6 .&quot;<b=
r>
@@ -92,27 +83,7 @@ pkg_postinst_dbus() {<br>
=C2=A0}<br>
<br>
<br>
-EXTRA_OECONF =3D &quot;--disable-tests \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-xml-doc=
s \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-doxygen=
-docs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-libaudi=
t \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-largefil=
e \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-system-soc=
ket=3D/run/dbus/system_bus_socket \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-EXTRA_OECONF_append_class-target =3D &quot; SYSTEMCTL=3D${base_bindir}/sy=
stemctl&quot;<br>
-EXTRA_OECONF_append_class-native =3D &quot; --disable-selinux&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;systemd x11&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user=
-session \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-PACKAGECONFIG_class-native =3D &quot;&quot;<br>
-PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
-<br>
-PACKAGECONFIG[systemd] =3D &quot;--enable-systemd --with-systemdsystemuni=
tdir=3D${systemd_system_unitdir},--disable-systemd --without-systemdsystemu=
nitdir,systemd&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;--with-x --enable-x11-autolaunch,--without-x=
 --disable-x11-autolaunch, virtual/libx11 libsm&quot;<br>
-PACKAGECONFIG[user-session] =3D &quot;--enable-user-session --with-system=
duserunitdir=3D${systemd_user_unitdir},--disable-user-session&quot;<br>
+EXTRA_OECONF +=3D &quot;--disable-tests&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autotools_do_install<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--00000000000021dd6305a876a117--
