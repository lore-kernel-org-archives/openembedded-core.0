Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B1CC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.25732.1680184030340008739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UQQRvxq9;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id br6so24553469lfb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680184028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RZQXu+xMxSLmEuDt91/1gIUvWUgFXWRDBuWv907YiA=;
        b=UQQRvxq9s2PBaTiNIVNxq00W1J5T8kqPKfDU72foYyH8WKzsB2Xtm5cmmObs7QVf3e
         wqIknMTT6WQ6Ut81XYTbfyVkPMz/7AWny916zXtcT0M8vXO6DsdD4hjXPTWdjIng31o5
         d8RXXwC0wkZKp3GQSHPi1YbwLqtoBV6qYriBMpYMaiXpcW0BUZjUcDpUVMzBqnbxKevX
         x4Anp2c/HDR9RD6E5QHQ5ian4ZrmmCpcaaM8PftDyCdNB7/sYuyTe7fAw0LWBOLSoDsc
         WGat3/UX9aR9zix6QN8/ODB+f3Mzp00Nk9uHxRjFauE+MtOsn+3kFQLQdR22T5hwpql6
         0xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RZQXu+xMxSLmEuDt91/1gIUvWUgFXWRDBuWv907YiA=;
        b=N9qLBmCsOqVkNMjONDHi7oyqQAVO3DAhX7PesuK/M4cNR9sD5mif3DjLo5Z8mSHCZF
         uiTqJ6k1r6tM6+S7dWScBjoq9C0atcKkS2DCJ7s5Zmkv4JMI7Tyhw9fJ7lWyVU4QTkc2
         ZcAxIV9bBf+Bz7PvaBeIaA7cRWLfHxBHBU3QHz62tAW7GkIZtOlV9iEY0HEk3RiLAF66
         J0pKboHX8oi+SlHVjvK89CsVYbbHL3fsHjbNLTk7bMtscEvxzEaPqSZNwU2jEmw2EGaG
         qqXi+AXg/Vx6mU/DsAyJqZ8Mz4Jk8RzvWJqYIi83VO5TTAuB8OQnpnU8CfphUN9kgSmM
         vmrQ==
X-Gm-Message-State: AAQBX9c4fACuIIdjxj6DdGsJqVfKYrktkbabhp675n0fL3n3rlv2jUYc
	LNIFHLo63ojPEh48VuafIgRC+ZfegtSyXMOAUEM=
X-Google-Smtp-Source: AKy350br74aKRy5Pk9FiyPS+/4eZ4eHZSZdBuySqHHeUWHIgkz9NKo85W3FjqLfKtwp9P/tkR5MoJaeO5Mxj2vNXNkg=
X-Received: by 2002:ac2:522e:0:b0:4ea:e2f8:5ed6 with SMTP id
 i14-20020ac2522e000000b004eae2f85ed6mr6629561lfl.11.1680184028326; Thu, 30
 Mar 2023 06:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134214.2772913-1-zboszor@gmail.com>
In-Reply-To: <20230330134214.2772913-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 15:46:57 +0200
Message-ID: <CANNYZj-n-mCj+3_3YR9KKGP7g7teGknWKhGOFSQEnn+3EkdDKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179323

Can you please point to what piece of libgudev actually requires systemd?

Alex

On Thu, 30 Mar 2023 at 15:42, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> systemd-native is a dependency for libgudev-native, which
> in turn is a dependency for libfprint-native, which is needed
> to build libfprint.
>
> The native systemctl binary is removed so it doesn't conflict
> with the script from systemd-systemctl-native.
>
> TODO? The new natively built systemctl binary may replace
> the script in systemd-systemctl-native, as it supports
> more options and works better than the script. For example,
> the current script does not create the symlinks in
> /etc/systemd/system for WantedBy=3D and RequiredBy=3D settings
> and does not support systemctl set-default some.target.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_253.1.bb | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-co=
re/systemd/systemd_253.1.bb
> index 9c2b96d3c1..c73b5e05b3 100644
> --- a/meta/recipes-core/systemd/systemd_253.1.bb
> +++ b/meta/recipes-core/systemd/systemd_253.1.bb
> @@ -6,6 +6,8 @@ PE =3D "1"
>
>  DEPENDS =3D "intltool-native gperf-native libcap util-linux python3-jinj=
a2-native"
>
> +BBCLASSEXTEND =3D "native"
> +
>  SECTION =3D "base/shell"
>
>  inherit useradd pkgconfig meson perlnative update-rc.d update-alternativ=
es qemu systemd gettext bash-completion manpages features_check
> @@ -60,7 +62,7 @@ PAM_PLUGINS =3D " \
>      pam-plugin-namespace \
>  "
>
> -PACKAGECONFIG ??=3D " \
> +PACKAGECONFIG:class-target ??=3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam se=
linux smack usrmerge polkit seccomp', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} =
\
> @@ -197,7 +199,7 @@ PACKAGECONFIG[selinux] =3D "-Dselinux=3Dtrue,-Dselinu=
x=3Dfalse,libselinux,initscripts-
>  PACKAGECONFIG[smack] =3D "-Dsmack=3Dtrue,-Dsmack=3Dfalse"
>  PACKAGECONFIG[sysext] =3D "-Dsysext=3Dtrue, -Dsysext=3Dfalse"
>  PACKAGECONFIG[sysusers] =3D "-Dsysusers=3Dtrue,-Dsysusers=3Dfalse"
> -PACKAGECONFIG[sysvinit] =3D "-Dsysvinit-path=3D${sysconfdir}/init.d -Dsy=
svrcnd-path=3D${sysconfdir},-Dsysvinit-path=3D -Dsysvrcnd-path=3D,,systemd-=
compat-units update-rc.d"
> +PACKAGECONFIG[sysvinit] =3D "-Dsysvinit-path=3D${sysconfdir}/init.d -Dsy=
svrcnd-path=3D${sysconfdir},-Dsysvinit-path=3D -Dsysvrcnd-path=3D,,${@'syst=
emd-compat-units update-rc.d' if d.getVar('PN') =3D=3D d.getVar('BPN') else=
 ''}"
>  # When enabled use reproducble build timestamp if set as time epoch,
>  # or build time if not. When disabled, time epoch is unset.
>  def build_epoch(d):
> @@ -211,7 +213,7 @@ PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Ds=
plit-bin=3Dtrue"
>  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
>  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
>  PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
> -PACKAGECONFIG[vconsole] =3D "-Dvconsole=3Dtrue,-Dvconsole=3Dfalse,,${PN}=
-vconsole-setup"
> +PACKAGECONFIG[vconsole] =3D "-Dvconsole=3Dtrue,-Dvconsole=3Dfalse,,${BPN=
}-vconsole-setup"
>  PACKAGECONFIG[wheel-group] =3D "-Dwheel-group=3Dtrue, -Dwheel-group=3Dfa=
lse"
>  PACKAGECONFIG[xdg-autostart] =3D "-Dxdg-autostart=3Dtrue,-Dxdg-autostart=
=3Dfalse"
>  # Verify keymaps on locale change
> @@ -364,6 +366,12 @@ do_install() {
>      fi
>  }
>
> +do_install:append:class-native () {
> +    rm -f ${D}${bindir}/systemctl
> +       ln -sf ..${base_bindir_native}/udevadm ${D}${base_sbindir}/udevad=
m
> +       ln -sf ..${systemd_unitdir#${rootprefix}}/systemd-udevd ${D}${bas=
e_sbindir}/udevd
> +}
> +
>  python populate_packages:prepend (){
>      systemdlibdir =3D d.getVar("rootlibdir")
>      do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Sy=
stemd %s library', extra_depends=3D'', allow_links=3DTrue)
> @@ -670,10 +678,10 @@ FILES:${PN} =3D " ${base_bindir}/* \
>  FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
>
>  RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck"
> -RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty=
-generator', '', 'systemd-serialgetty', d)}"
> -RDEPENDS:${PN} +=3D "volatile-binds"
> +RDEPENDS:${PN}:class-target +=3D "${@bb.utils.contains('PACKAGECONFIG', =
'serial-getty-generator', '', 'systemd-serialgetty', d)}"
> +RDEPENDS:${PN}:class-target +=3D "volatile-binds"
>
> -RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
> +RRECOMMENDS:${PN}:class-target +=3D "systemd-extra-utils \
>                        udev-hwdb \
>                        e2fsprogs-e2fsck \
>                        kernel-module-autofs4 kernel-module-unix kernel-mo=
dule-ipv6 kernel-module-sch-fq-codel \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179321): https://lists.openembedded.org/g/openembedde=
d-core/message/179321
> Mute This Topic: https://lists.openembedded.org/mt/97950749/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

