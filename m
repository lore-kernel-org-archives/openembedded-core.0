Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36A0D3C925
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 15:45:28 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153.1765381520772296447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 07:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=GgPXDKIm;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.45, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64124874e6dso1095158a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765381519; x=1765986319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ytW+SgC50NxmzKHm6ZzGl1HdARtj68onYfHne7wEw54=;
        b=GgPXDKImPekPee9XgZ7C5h1eGFPKKNdVHieqt0OHBPSEBjjU4bd1vlNgS/Bnufs1lw
         /DZNnj7gh+vXyuFEmVNqcHRJzTjmpqiGVgI4pSkjhDCGxmPcsrotOytSjww7dK+h7o+d
         Sn/fQeZgQRfIVm+OsPVF8nC1+eeLJs1Plvi+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765381519; x=1765986319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytW+SgC50NxmzKHm6ZzGl1HdARtj68onYfHne7wEw54=;
        b=Szq09yYaxSFv6k9hb3p9Ja6fd7OiPee5Ccu+zOVJ7aNmtfRoMk72B+vSh06x8ffsiU
         TWnRJPyi4jp6a9/VGD+ISBhqyrWH9o7pG9/O1VatbRBpR8kNZgG1bXasZ2TdK6CDHIZ7
         2XmadN+0kKzsKkH0BXGjv9tGz59wbQJbXMmyAmUbT1Z6wRRLPn8ZOrhA9o7LPRkCiUmB
         hMPc33KhYWzDWpoSMrNwIDIjoSBrDPmjDWON5Vz+dUXbIOmHwaz1Ncl+nbpIfxSvnVQ3
         FVOoq+cW50b6ezuRUU8FqWdHQCyPaqns+bfxnkIiCpfPfma88vpVhcwPh3EnKjOQXrL/
         sABQ==
X-Gm-Message-State: AOJu0YyZwRO9PeEh+56+O4n4f1oYAe2p5ahNcFDU5Q3toLNEmzV+ZXuF
	AHFH0C51zAr6Y5fp7XoCHwzLaz5UTSe4nB3byGgP3oPrjAr3Vz4pujRy3NgGhkZ3tlIuLYTTVGY
	uTpG0nwKDy80A4up/fn9EuX2JmFif6Df9ouD9T8sysQ==
X-Gm-Gg: AY/fxX6I8BeB1v2DR0hBt5eI8HZxUbAsKn5NA2UTFQMmXjvPk18eVfxzHyqkJCvhZnE
	mt1Vg+IfJblWNlAaVAFndpjeGTpEymg2SM49UzFfhvSt6DGM0I1DbA6uKIftnJPCeQiZmAPe2rR
	ZdV+2VN1Sh4+/cf6HHR9zmh42/2sUxfr8mHfOlB4k8f0hhSHnjQDl4cur1Jt9cpFY2a2FIkcLaS
	tBcdu56An8db+5Xd4P9US4mYId45KwObHdXrk0EQ1gvWE/xQhZ0POmMy6EDa0HN1WUxLq/pJgKj
	R/4wkVHLfg+Q9GK76mnVz2JCzCa7
X-Google-Smtp-Source: AGHT+IEVbACf45ulyIGFGxOUotMN69zkkw1eokwbHuJM7jNxirGKVaQ+XaNLwOUgsU5rIfa7PdgKC6KuIBDwxK37fbY=
X-Received: by 2002:a05:6402:354f:b0:645:5b1f:275b with SMTP id
 4fb4d7f45d1cf-6496d3c386emr1547214a12.4.1765381518797; Wed, 10 Dec 2025
 07:45:18 -0800 (PST)
MIME-Version: 1.0
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
 <20251210110340.3631065-5-adam.duskett@amarulasolutions.com> <b1e90355-721c-4942-aaca-209e43e29096@gmail.com>
In-Reply-To: <b1e90355-721c-4942-aaca-209e43e29096@gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 10 Dec 2025 16:45:07 +0100
X-Gm-Features: AQt7F2oHzFpwMmOyBu_0cGSl2EldVcSp7Y_Np9IQdWTqN8NxUnCKSKqwE-bdbNk
Message-ID: <CAHDQB6OP47nzeV+bD8MSUNOL8ZRT9uDT+H+zvnSWPRS_7Jzi-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] dnf5: bump to 5.3.0.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000523c2d06459aeadf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 15:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227485

--000000000000523c2d06459aeadf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy! Thanks for the review!



On Wed, Dec 10, 2025 at 3:27=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> On 12/10/25 12:03, Adam Duskett via lists.openembedded.org wrote:
> <SNIP>
> > diff --git a/meta/recipes-devtools/dnf/dnf_5.3.0.0.bb
> b/meta/recipes-devtools/dnf/dnf_5.3.0.0.bb
> > new file mode 100644
> > index 0000000000..961e889fdb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/dnf/dnf_5.3.0.0.bb
> > @@ -0,0 +1,196 @@
> > +SUMMARY =3D "DNF package manager rewritten in C++, using libsolv as a
> dependency resolver"
> > +DESCRIPTION =3D "\
> > +    DNF5 is a command-line package manager that automates the process
> of \
> > +    installing, upgrading, configuring, and removing computer programs
> in a \
> > +    consistent manner. It supports RPM packages, modulemd modules, and
> comps \
> > +    groups and environments. \
> > +"
> > +HOMEPAGE =3D "https://github.com/rpm-software-management/dnf5"
> > +BUGTRACKER =3D "https://github.com/rpm-software-management/dnf5/issues=
"
> > +CVE_PRODUCT =3D "RPM:Dnf5"
>
> While the cpe-vendor is matched case-insensitive way, product matching
> is case-sensitive, it should be lowercase. Also, there seem to be at
> least 2 valid CVE_PRODUCTS:
> $ sqlite3 nvdfkie_1-1.db "select vendor, product from products where
> product like 'dnf5';"
> rpm|dnf5
> rpm-software-management|dnf5
>
Great catch! I'll add them properly and keep the sqlite query in the back
of my head from now on!


>
> > +SECTION =3D "base"
> > +
> > +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-only"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://COPYING.md;md5=3D9733192df318d0f806fd668b92ba0ba6 \
> > +    file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > +    file://lgpl-2.1.txt;md5=3D4b54a1fd55a448865a0b32d41598759d \
> > +"
> > +
> > +DEPENDS =3D "\
> > +    fmt \
> > +    glib-2.0 \
> > +    json-c \
> > +    libcomps \
> > +    libmodulemd \
> > +    librepo \
> > +    libsolv \
> > +    libtoml11 \
> > +    libxml2 \
> > +    sqlite3 \
> > +    util-linux \
> > +"
> > +
> > +SRC_URI =3D "\
> > +    git://
> github.com/rpm-software-management/dnf5.git;branch=3Dmain;protocol=3Dhttp=
s \
>
> You could add ;tag=3D${PV} at the end.
>
No worries! I'll also change the order
to  ;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}

>
> > +    file://0002-cmake-set-CMP0190-to-OLD.patch \
> > +    file://0003-Do-not-hardcode-system_cachedir.patch \
> > +    file://0004-add-support-for-gcc-12-and-below.patch \
> > +    file://0005-fix-string-concatenation-errors-for-musl.patch \
> > +    file://0006-add-missing-headers-for-musl.patch \
> > +    file://0007-Define-FNM_EXTMATCH-for-musl.patch \
> > +    file://0008-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch=
 \
> > +"
> > +SRC_URI:append:class-native =3D "
> file://0001-Do-not-hardcode-the-systemd-unit-directory.patch"
> > +SRCREV =3D "c6a42c2e7e9ee0a04d46e6820a5962925a99b085"
> > +
> > +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
> > +
> > +inherit bash-completion cmake gettext pkgconfig siteinfo systemd
> > +inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3',
> 'python3targetconfig', '', d)}
> > +
> > +PACKAGECONFIG[dnfdaemon-client] =3D
> "-DWITH_DNF5DAEMON_CLIENT=3DON,-DWITH_DNF5DAEMON_CLIENT=3DOFF,sdbus-c++"
> > +PACKAGECONFIG[dnfdaemon-server] =3D
> "-DWITH_DNF5DAEMON_SERVER=3DON,-DWITH_DNF5DAEMON_SERVER=3DOFF,sdbus-c++"
> > +PACKAGECONFIG[plugins] =3D
> "-DWITH_DNF5_PLUGINS=3DON,-DWITH_DNF5_PLUGINS=3DOFF,curl sdbus-c++ zlib"
> > +PACKAGECONFIG[plugin-actions] =3D
> "-DWITH_PLUGIN_ACTIONS=3DON,-DWITH_PLUGIN_ACTIONS=3DOFF"
> > +PACKAGECONFIG[plugin-appstream] =3D
> "-DWITH_PLUGIN_APPSTREAM=3DON,-DWITH_PLUGIN_APPSTREAM=3DOFF,appstream"
> > +PACKAGECONFIG[plugin-expired-pgp-keys] =3D
> "-DWITH_PLUGIN_EXPIRED_PGP_KEYS=3DON,-DWITH_PLUGIN_EXPIRED_PGP_KEYS=3DOFF=
,gnupg"
> > +PACKAGECONFIG[plugin-manifest] =3D
> "-DWITH_PLUGIN_MANIFEST=3DON,-DWITH_PLUGIN_MANIFEST=3DOFF,sdbus-c++
> libpkgmanifest"
>
> In which layer is libpkgmanifest? I couldn't find it the layer index.
>
> > +PACKAGECONFIG[plugin-local] =3D
> "-DWITH_PLUGIN_LOCAL=3DON,-DWITH_PLUGIN_LOCAL=3DOFF"
> > +
> > +# sdbus-c++ and journalctl integration.
> > +PACKAGECONFIG[systemd] =3D
> "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF,sdbus-c++"
> > +
> > +# build options - bindings
> > +PACKAGECONFIG[python3] =3D "-DWITH_PYTHON3=3DON,-DWITH_PYTHON3=3DOFF, =
python3
> swig-native"
> > +
> > +# No sdbus-c++-native package.
> > +PACKAGECONFIG:remove:class-native =3D "\
> > +    dnfdaemon-client \
> > +    dnfdaemon-server \
> > +    plugins \
> > +    plugin-manifest \
> > +    systemd \
> > +"
> > +
> > +PACKAGE_BEFORE_PN +=3D "\
> > +    ${PN}-dnfdaemon-server \
> > +    ${PN}-plugins \
> > +    ${PN}-python3 \
> > +"
> > +
> > +# manpages generation requires http://www.sphinx-doc.org/
> > +EXTRA_OECMAKE:append =3D " \
> > +    -DENABLE_SOLV_FOCUSNEW=3DON \
> > +    -DWITH_DNF5_OBSOLETES_DNF=3DOFF \
> > +    -DWITH_DNF5=3DON \
> > +    -DWITH_GO=3DOFF \
> > +    -DWITH_HTML=3DOFF \
> > +    -DWITH_LIBDNF5_CLI=3DON \
> > +    -DWITH_MAN=3DOFF \
> > +    -DWITH_PERL5=3DOFF \
> > +    -DWITH_PLUGIN_RHSM=3DOFF \
> > +    -DWITH_RUBY=3DOFF \
> > +    -DWITH_TESTS=3DOFF \
> > +"
> > +
> > +# No sdbus-c++-native package exists so remove all options that depend
> on it.
> > +EXTRA_OECMAKE:append:class-native =3D " \
> > +    -DWITH_DNF5DAEMON_CLIENT=3DOFF \
> > +    -DWITH_DNF5DAEMON_SERVER=3DOFF \
> > +    -DWITH_DNF5_PLUGINS=3DOFF \
> > +    -DWITH_PLUGIN_MANIFEST=3DOFF \
> > +    -DWITH_SYSTEMD=3DOFF \
> > +"
> > +
> > +# Create a symlink called 'dnf' as 'make install' does not do it, but
> > +# .spec file in dnf source tree does (and then Fedora and dnf
> documentation
> > +# says that dnf binary is plain 'dnf').
> > +do_install:append() {
> > +    ln -rs ${D}/${bindir}/dnf5 ${D}/${bindir}/dnf
> > +    install -d ${D}${sysconfdir}/dnf
> > +
> > +    # DNF always installs service files to /usr/lib/systemd, even if
> usrmerge is not
> > +    # selected. Also, remove systemd files if systemd isn't selected.
> > +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false',
> 'true', d)}; then
> > +        rm -rf ${D}${libdir}/systemd
> > +    fi
> > +
> > +    # Breaks dnf because the builddep plugin is provided in the
> > +    # dnf-plugins-core package which is not available in oe-core.
> > +    rm -f ${D}${datadir}/dnf5/aliases.d/compatibility-plugins.conf
> > +}
> > +
> > +do_install:append:${PN}-plugins() {
> > +    ln -rs ${D}/${bindir}/dnf5-automatic ${D}/${bindir}/dnf-automatic
> > +}
>
> 1. Is that ${PN}-plugins override needed? Couldn't it just be part of
> the do_install, if the file exists?
> 2. The cmake file does install[1] a wrapper script[2] with the same name
> and location. Does it not have the same function? (I'm asking, it might
> be different)
>
Good call. It's not needed  and was left over cruft from debugging. I'll
remove it entirely!

>
> [1]:
>
> https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf5-plugins=
/automatic_plugin/CMakeLists.txt#L17
> [2]:
>
> https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf5-plugins=
/automatic_plugin/bin/dnf-automatic
>
> > +
> > +# Direct dnf-native to read rpm configuration from our sysroot, not th=
e
> one it was compiled in
> > +do_install:append:class-native() {
> > +    create_wrapper ${D}/${bindir}/dnf \
> > +
> SEQUOIA_CRYPTO_POLICY=3D${STAGING_DATADIR_NATIVE}/crypto-policies/back-en=
ds/rpm-sequoia.config
> \
> > +        RPM_CONFIGDIR=3D${STAGING_LIBDIR_NATIVE}/rpm \
> > +        RPM_NO_CHROOT_FOR_SCRIPTS=3D1
> > +}
> > +
> > +do_install:append:class-nativesdk() {
> > +    create_wrapper ${D}/${bindir}/dnf \
> > +        RPM_CONFIGDIR=3D${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
> > +        RPM_NO_CHROOT_FOR_SCRIPTS=3D1
> > +}
> > +
> > +SYSTEMD_SERVICE:${PN} =3D "\
> > +    dnf5-makecache.service \
> > +    dnf5-makecache.timer \
> > +"
> > +
> > +SYSTEMD_AUTO_ENABLE ?=3D "disable"
> > +
> > +# Packages for testing purposes
> > +PACKAGES +=3D "${PN}-test-main ${PN}-test-dep"
> > +
> > +FILES:${PN} +=3D "\
> > +    ${bindir}/dnf* \
> > +    ${datadir}/dbus-1/system-services/org.rpm.dnf.v0.service \
> > +    ${datadir}/dnf5 \
> > +    ${datadir}/polkit-1/actions/org.rpm.dnf* \
> > +    ${datadir}/polkit-1/rules.d/org.rpm.dnf* \
> > +    ${libdir}/dnf5 \
> > +    ${libdir}/libdnf5* \
> > +    ${sysconfdir}/dnf \
> > +"
> > +
> > +FILES:${PN}-bash-completion +=3D "\
> > +    ${datadir}/bash-completion/completions/dnf5 \
> > +"
> > +
> > +FILES:${PN}-dnfdaemon-server +=3D "\
> > +    ${systemd_system_unitdir}/dnf5daemon-server.service \
> > +    ${datadir}/dbus-1/interfaces/org.rpm.dnf* \
> > +    ${datadir}/dbus-1/system.d/org.rpm.dnf* \
> > +"
> > +
> > +FILES:${PN}-plugins +=3D "\
> > +    ${systemd_system_unitdir}/dnf-automatic.service \
> > +    ${systemd_system_unitdir}/dnf-automatic.timer \
> > +    ${systemd_system_unitdir}/dnf5-automatic.service \
> > +    ${systemd_system_unitdir}/dnf5-automatic.timer \
> > +"
> > +
> > +FILES:${PN}-python3 +=3D "\
> > +    ${libdir}/${PYTHON_DIR}/site-packages/libdnf* \
> > +"
> > +
> > +FILES:${PN}-systemd +=3D "\
> > +    ${systemd_system_unitdir}/dnf5-offline-transaction.service \
> > +    ${systemd_system_unitdir}/dnf5-offline-transaction-cleanup.service=
 \
> > +"
> > +
> > +RRECOMMENDS:${PN}:class-target +=3D "bash-completion gnupg"
> > +RRECOMMENDS:${PN}-test-main =3D "${PN}-test-dep"
> > +ALLOW_EMPTY:${PN}-test-main =3D "1"
> > +ALLOW_EMPTY:${PN}-test-dep =3D "1"
> > +
> > +SKIP_RECIPE[dnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES
> due disabled rpm support in libsolv', d)}"
>
> Since it is being updated, could you please also fix this typo: "due" ->
> "due to" ?
>
No problem!

>
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#227470):
> https://lists.openembedded.org/g/openembedded-core/message/227470
> > Mute This Topic: https://lists.openembedded.org/mt/116710030/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000523c2d06459aeadf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Gyorgy! Thanks for the review!=C2=
=A0</div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
span><div><br></div></span></div></div></div><br></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Dec 10, 2025 at 3:27=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:sk=
andigraun@gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 12/10/25 12:03, Adam Duskett v=
ia <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_=
blank">lists.openembedded.org</a> wrote:<br>
&lt;SNIP&gt;<br>
&gt; diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_5.3.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">dnf_5.3.0.0.bb</a> b/meta/recipes-d=
evtools/dnf/<a href=3D"http://dnf_5.3.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">dnf_5.3.0.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..961e889fdb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_5.3.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">dnf_5.3.0.0.bb</a><br>
&gt; @@ -0,0 +1,196 @@<br>
&gt; +SUMMARY =3D &quot;DNF package manager rewritten in C++, using libsolv=
 as a dependency resolver&quot;<br>
&gt; +DESCRIPTION =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 DNF5 is a command-line package manager that automates t=
he process of \<br>
&gt; +=C2=A0 =C2=A0 installing, upgrading, configuring, and removing comput=
er programs in a \<br>
&gt; +=C2=A0 =C2=A0 consistent manner. It supports RPM packages, modulemd m=
odules, and comps \<br>
&gt; +=C2=A0 =C2=A0 groups and environments. \<br>
&gt; +&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/rpm-software-managem=
ent/dnf5" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-softw=
are-management/dnf5</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/rpm-software-manag=
ement/dnf5/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rpm-software-management/dnf5/issues</a>&quot;<br>
&gt; +CVE_PRODUCT =3D &quot;RPM:Dnf5&quot;<br>
<br>
While the cpe-vendor is matched case-insensitive way, product matching<br>
is case-sensitive, it should be lowercase. Also, there seem to be at<br>
least 2 valid CVE_PRODUCTS:<br>
$ sqlite3 nvdfkie_1-1.db &quot;select vendor, product from products where<b=
r>
product like &#39;dnf5&#39;;&quot;<br>
rpm|dnf5<br>
rpm-software-management|dnf5<br></blockquote><div>Great catch! I&#39;ll add=
 them properly and keep the sqlite query in the back of my head from now on=
!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +SECTION =3D &quot;base&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPL-2.0-or-later &amp; LGPL-2.1-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 file://COPYING.md;md5=3D9733192df318d0f806fd668b92ba0ba=
6 \<br>
&gt; +=C2=A0 =C2=A0 file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a42=
63 \<br>
&gt; +=C2=A0 =C2=A0 file://lgpl-2.1.txt;md5=3D4b54a1fd55a448865a0b32d415987=
59d \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 fmt \<br>
&gt; +=C2=A0 =C2=A0 glib-2.0 \<br>
&gt; +=C2=A0 =C2=A0 json-c \<br>
&gt; +=C2=A0 =C2=A0 libcomps \<br>
&gt; +=C2=A0 =C2=A0 libmodulemd \<br>
&gt; +=C2=A0 =C2=A0 librepo \<br>
&gt; +=C2=A0 =C2=A0 libsolv \<br>
&gt; +=C2=A0 =C2=A0 libtoml11 \<br>
&gt; +=C2=A0 =C2=A0 libxml2 \<br>
&gt; +=C2=A0 =C2=A0 sqlite3 \<br>
&gt; +=C2=A0 =C2=A0 util-linux \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/rpm-software-managem=
ent/dnf5.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/rpm-software-management/dnf5.git;branch=3Dmain;protocol=
=3Dhttps</a> \<br>
<br>
You could add ;tag=3D${PV} at the end.<br></blockquote><div>No worries! I&#=
39;ll also change the order to=C2=A0=C2=A0;protocol=3Dhttps;branch=3Dmain;t=
ag=3D${PV}</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 file://0002-cmake-set-CMP0190-to-OLD.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0003-Do-not-hardcode-system_cachedir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0004-add-support-for-gcc-12-and-below.patch \<br=
>
&gt; +=C2=A0 =C2=A0 file://0005-fix-string-concatenation-errors-for-musl.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 file://0006-add-missing-headers-for-musl.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0007-Define-FNM_EXTMATCH-for-musl.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0008-libdnf-fix-arm-arch-mapping-issues-for-qemu=
armv5.patch \<br>
&gt; +&quot;<br>
&gt; +SRC_URI:append:class-native =3D &quot; file://0001-Do-not-hardcode-th=
e-systemd-unit-directory.patch&quot;<br>
&gt; +SRCREV =3D &quot;c6a42c2e7e9ee0a04d46e6820a5962925a99b085&quot;<br>
&gt; +<br>
&gt; +UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot=
;<br>
&gt; +<br>
&gt; +inherit bash-completion cmake gettext pkgconfig siteinfo systemd<br>
&gt; +inherit_defer ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;pyth=
on3&#39;, &#39;python3targetconfig&#39;, &#39;&#39;, d)}<br>
&gt; +<br>
&gt; +PACKAGECONFIG[dnfdaemon-client] =3D &quot;-DWITH_DNF5DAEMON_CLIENT=3D=
ON,-DWITH_DNF5DAEMON_CLIENT=3DOFF,sdbus-c++&quot;<br>
&gt; +PACKAGECONFIG[dnfdaemon-server] =3D &quot;-DWITH_DNF5DAEMON_SERVER=3D=
ON,-DWITH_DNF5DAEMON_SERVER=3DOFF,sdbus-c++&quot;<br>
&gt; +PACKAGECONFIG[plugins] =3D &quot;-DWITH_DNF5_PLUGINS=3DON,-DWITH_DNF5=
_PLUGINS=3DOFF,curl sdbus-c++ zlib&quot;<br>
&gt; +PACKAGECONFIG[plugin-actions] =3D &quot;-DWITH_PLUGIN_ACTIONS=3DON,-D=
WITH_PLUGIN_ACTIONS=3DOFF&quot;<br>
&gt; +PACKAGECONFIG[plugin-appstream] =3D &quot;-DWITH_PLUGIN_APPSTREAM=3DO=
N,-DWITH_PLUGIN_APPSTREAM=3DOFF,appstream&quot;<br>
&gt; +PACKAGECONFIG[plugin-expired-pgp-keys] =3D &quot;-DWITH_PLUGIN_EXPIRE=
D_PGP_KEYS=3DON,-DWITH_PLUGIN_EXPIRED_PGP_KEYS=3DOFF,gnupg&quot;<br>
&gt; +PACKAGECONFIG[plugin-manifest] =3D &quot;-DWITH_PLUGIN_MANIFEST=3DON,=
-DWITH_PLUGIN_MANIFEST=3DOFF,sdbus-c++ libpkgmanifest&quot;<br>
<br>
In which layer is libpkgmanifest? I couldn&#39;t find it the layer index.<b=
r>
<br>
&gt; +PACKAGECONFIG[plugin-local] =3D &quot;-DWITH_PLUGIN_LOCAL=3DON,-DWITH=
_PLUGIN_LOCAL=3DOFF&quot;<br>
&gt; +<br>
&gt; +# sdbus-c++ and journalctl integration.<br>
&gt; +PACKAGECONFIG[systemd] =3D &quot;-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=
=3DOFF,sdbus-c++&quot;<br>
&gt; +<br>
&gt; +# build options - bindings<br>
&gt; +PACKAGECONFIG[python3] =3D &quot;-DWITH_PYTHON3=3DON,-DWITH_PYTHON3=
=3DOFF, python3 swig-native&quot;<br>
&gt; +<br>
&gt; +# No sdbus-c++-native package.<br>
&gt; +PACKAGECONFIG:remove:class-native =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 dnfdaemon-client \<br>
&gt; +=C2=A0 =C2=A0 dnfdaemon-server \<br>
&gt; +=C2=A0 =C2=A0 plugins \<br>
&gt; +=C2=A0 =C2=A0 plugin-manifest \<br>
&gt; +=C2=A0 =C2=A0 systemd \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +PACKAGE_BEFORE_PN +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${PN}-dnfdaemon-server \<br>
&gt; +=C2=A0 =C2=A0 ${PN}-plugins \<br>
&gt; +=C2=A0 =C2=A0 ${PN}-python3 \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +# manpages generation requires <a href=3D"http://www.sphinx-doc.org/"=
 rel=3D"noreferrer" target=3D"_blank">http://www.sphinx-doc.org/</a><br>
&gt; +EXTRA_OECMAKE:append =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 -DENABLE_SOLV_FOCUSNEW=3DON \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_DNF5_OBSOLETES_DNF=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_DNF5=3DON \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_GO=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_HTML=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_LIBDNF5_CLI=3DON \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_MAN=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_PERL5=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_PLUGIN_RHSM=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_RUBY=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_TESTS=3DOFF \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +# No sdbus-c++-native package exists so remove all options that depen=
d on it.<br>
&gt; +EXTRA_OECMAKE:append:class-native =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_DNF5DAEMON_CLIENT=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_DNF5DAEMON_SERVER=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_DNF5_PLUGINS=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_PLUGIN_MANIFEST=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DWITH_SYSTEMD=3DOFF \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +# Create a symlink called &#39;dnf&#39; as &#39;make install&#39; doe=
s not do it, but<br>
&gt; +# .spec file in dnf source tree does (and then Fedora and dnf documen=
tation<br>
&gt; +# says that dnf binary is plain &#39;dnf&#39;).<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 ln -rs ${D}/${bindir}/dnf5 ${D}/${bindir}/dnf<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/dnf<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # DNF always installs service files to /usr/lib/systemd=
, even if usrmerge is not<br>
&gt; +=C2=A0 =C2=A0 # selected. Also, remove systemd files if systemd isn&#=
39;t selected.<br>
&gt; +=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39=
;systemd&#39;, &#39;false&#39;, &#39;true&#39;, d)}; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${libdir}/systemd<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Breaks dnf because the builddep plugin is provided in=
 the<br>
&gt; +=C2=A0 =C2=A0 # dnf-plugins-core package which is not available in oe=
-core.<br>
&gt; +=C2=A0 =C2=A0 rm -f ${D}${datadir}/dnf5/aliases.d/compatibility-plugi=
ns.conf<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install:append:${PN}-plugins() {<br>
&gt; +=C2=A0 =C2=A0 ln -rs ${D}/${bindir}/dnf5-automatic ${D}/${bindir}/dnf=
-automatic<br>
&gt; +}<br>
<br>
1. Is that ${PN}-plugins override needed? Couldn&#39;t it just be part of<b=
r>
the do_install, if the file exists?<br>
2. The cmake file does install[1] a wrapper script[2] with the same name<br=
>
and location. Does it not have the same function? (I&#39;m asking, it might=
<br>
be different)<br></blockquote><div>Good call. It&#39;s not needed=C2=A0 and=
 was left over cruft from debugging. I&#39;ll remove it entirely!</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[1]:<br>
<a href=3D"https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf=
5-plugins/automatic_plugin/CMakeLists.txt#L17" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf5-=
plugins/automatic_plugin/CMakeLists.txt#L17</a><br>
[2]:<br>
<a href=3D"https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf=
5-plugins/automatic_plugin/bin/dnf-automatic" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf5-p=
lugins/automatic_plugin/bin/dnf-automatic</a><br>
<br>
&gt; +<br>
&gt; +# Direct dnf-native to read rpm configuration from our sysroot, not t=
he one it was compiled in<br>
&gt; +do_install:append:class-native() {<br>
&gt; +=C2=A0 =C2=A0 create_wrapper ${D}/${bindir}/dnf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SEQUOIA_CRYPTO_POLICY=3D${STAGING_DATADIR=
_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RPM_CONFIGDIR=3D${STAGING_LIBDIR_NATIVE}/=
rpm \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RPM_NO_CHROOT_FOR_SCRIPTS=3D1<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install:append:class-nativesdk() {<br>
&gt; +=C2=A0 =C2=A0 create_wrapper ${D}/${bindir}/dnf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RPM_CONFIGDIR=3D${SDKPATHNATIVE}${libdir_=
nativesdk}/rpm \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RPM_NO_CHROOT_FOR_SCRIPTS=3D1<br>
&gt; +}<br>
&gt; +<br>
&gt; +SYSTEMD_SERVICE:${PN} =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 dnf5-makecache.service \<br>
&gt; +=C2=A0 =C2=A0 dnf5-makecache.timer \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
&gt; +<br>
&gt; +# Packages for testing purposes<br>
&gt; +PACKAGES +=3D &quot;${PN}-test-main ${PN}-test-dep&quot;<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/dnf* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/dbus-1/system-services/org.rpm.dnf.v0.servic=
e \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/dnf5 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/polkit-1/actions/org.rpm.dnf* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/polkit-1/rules.d/org.rpm.dnf* \<br>
&gt; +=C2=A0 =C2=A0 ${libdir}/dnf5 \<br>
&gt; +=C2=A0 =C2=A0 ${libdir}/libdnf5* \<br>
&gt; +=C2=A0 =C2=A0 ${sysconfdir}/dnf \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +FILES:${PN}-bash-completion +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/bash-completion/completions/dnf5 \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +FILES:${PN}-dnfdaemon-server +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir}/dnf5daemon-server.service \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/dbus-1/interfaces/org.rpm.dnf* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/dbus-1/system.d/org.rpm.dnf* \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +FILES:${PN}-plugins +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir}/dnf-automatic.service \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir}/dnf-automatic.timer \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir}/dnf5-automatic.service \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir}/dnf5-automatic.timer \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +FILES:${PN}-python3 +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/site-packages/libdnf* \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +FILES:${PN}-systemd +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir}/dnf5-offline-transaction.serv=
ice \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_system_unitdir}/dnf5-offline-transaction-clea=
nup.service \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RRECOMMENDS:${PN}:class-target +=3D &quot;bash-completion gnupg&quot;=
<br>
&gt; +RRECOMMENDS:${PN}-test-main =3D &quot;${PN}-test-dep&quot;<br>
&gt; +ALLOW_EMPTY:${PN}-test-main =3D &quot;1&quot;<br>
&gt; +ALLOW_EMPTY:${PN}-test-dep =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +SKIP_RECIPE[dnf] ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_CLASSES=
&#39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build without packa=
ge_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv&#39;, d)}&quo=
t;<br>
<br>
Since it is being updated, could you please also fix this typo: &quot;due&q=
uot; -&gt;<br>
&quot;due to&quot; ?<br></blockquote><div>No problem!=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#227470): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/227470" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/227470</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11671003=
0/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116710030/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:skandigraun@gmail.com=
" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000523c2d06459aeadf--

