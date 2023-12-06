Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02315C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 10:37:57 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.28553.1701859069244596788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 02:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m6XqdpfF;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35d67870032so22601475ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 02:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701859068; x=1702463868; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeXwGtQ64lrd3vCU6Pqaxe0Wix2n5rSAgfJQwc62/SQ=;
        b=m6XqdpfF5tH9Dc6KIiS9OPgquSkOWsTulkpivQkwrbGooCOFsTY/Z14v0ZZ5pa+nFk
         X+6aBc3SJlE3yWPTh19JLR0B1UwCer8KKTL8+EnAvR9qsKG65ECAE5KTArR2dWEoSNi3
         L2/HMAGcNPDmDRQbzERk0BC//Gu1fZVUnUiv9oyVy9PRBrCPLrJwI1hZOV6oGBCHYbw+
         xNf/ymWawm3bdlN/nPBVUT3lSetEV0T6X4gw5eUu7rhfgrpnC8YIecBSu/kMHmSB1a81
         L90Qn1qZoNSe3hbq7aEHRqIw2MKlyFKDOAcyNOL9uOj0XlddqcTZVdD4AVVB1UKcx5h1
         Xxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701859068; x=1702463868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeXwGtQ64lrd3vCU6Pqaxe0Wix2n5rSAgfJQwc62/SQ=;
        b=Sn3j3PbTZs0t/SbrvDlb6cinOd34WLWAdWDqeL9F/MbZxf4Sr/TgC8MdYGU8Ac66kJ
         ViG5H85uz10G7sV5b0nfDlzzUX2GS7+jLxdFUzasd0/A5p0UEVO04ZlJewmLPEou3TGB
         qXgRUM/q9Yw5a91eU9E9t5yRMQ5A07MGNnZKZrLqxvJkYo8srfoUE0cSKj1ID/+ajhEA
         HkXA2jwd/trSmMb7nfYkaQVmhKjQM0uFOeWvxVLa9XBTZ6uawUMcuiK3XVygQqmlyEBI
         mUkEnlqTvtpCvixkgQr5NpWgN46l4jlOrqb0gJXWDzZfM/+6N8BsBjhcNhRr8RYhv2b7
         OgRA==
X-Gm-Message-State: AOJu0Yyr8tNJ6iIE1ZaA8UvsEf2bPq/LgsNMi/7RpAWe3viXrGvEipyC
	be14M5srdGm9tlWhKPnr9jik4Nj/Pq7qE/s1n0g=
X-Google-Smtp-Source: AGHT+IElhM3FwK+mHMC86HSF3bNiwe0uL8TSoFjunYm9Oi2Hf7eiBYBEz5cpr16ENfsN3c2ZrSBBC+QDufC9btVy5nE=
X-Received: by 2002:a92:d48a:0:b0:35d:64b5:a963 with SMTP id
 p10-20020a92d48a000000b0035d64b5a963mr922550ilg.25.1701859068312; Wed, 06 Dec
 2023 02:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20231205074322881971a5@mail.local> <20231206085604.3286804-1-mingli.yu@windriver.com>
In-Reply-To: <20231206085604.3286804-1-mingli.yu@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 6 Dec 2023 10:37:36 +0000
Message-ID: <CAO5Uq5QTtXLOay=Ap7QHMODpFRkd2PitpE4OHqV11+QnzHewZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] openssh: Add PACKAGECONFIG option to
 customize sshd mode
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 10:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191882

On Wed, Dec 6, 2023 at 8:56=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver.=
com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socket
> and systemd-sshd-service-mode PACKAGECONFIG option to choose installing
> sshd.service.
>
> The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
> and user can customize the above two PACKAGECONFIG option to choose the
> sshd mode.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
> Changed in v3:
> rebase based on https://lore.kernel.org/all/20231201140947.792594-1-xiang=
yu.chen@eng.windriver.com/
>
> Changed in v4:
> make it possible to install both sshd.socket and sshd.service

I'm wondering if we should make SYSTEMD_AUTO_ENABLE settable per
service, so you could then install both and manage which one is active
with a preset.

> .../openssh/openssh_9.5p1.bb                  | 25 ++++++++++++++-----
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.5p1.bb
> index 2c1c821ea9..58dd030c64 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> @@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd =3D "sshd"
>  INITSCRIPT_PARAMS:${PN}-sshd =3D "defaults 9"
>
>  SYSTEMD_PACKAGES =3D "${PN}-sshd"
> -SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket sshd.service"
> +SYSTEMD_SERVICE:${PN}-sshd =3D "${@bb.utils.contains('PACKAGECONFIG','sy=
stemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAG=
ECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
>
>  inherit autotools-brokensep ptest pkgconfig
>
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> +# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-mo=
de
> +# corresponding to sshd.service
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
} systemd-sshd-socket-mode"
>  PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] =3D "--with-mantype=3Dman,--with-mantype=3Dcat"
>  PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
> +PACKAGECONFIG[systemd-sshd-socket-mode] =3D ""
> +PACKAGECONFIG[systemd-sshd-service-mode] =3D ""
>
>  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>
> @@ -124,15 +128,24 @@ do_install:append () {
>         echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconf=
dir}/ssh/sshd_config_readonly
>
>         install -d ${D}${systemd_system_unitdir}
> -       install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_un=
itdir}
> -       install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_u=
nitdir}
> -       install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_=
unitdir}
> +       if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode=
','true','false',d)}; then
> +           install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_syste=
m_unitdir}
> +           install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_sys=
tem_unitdir}
> +           sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +                   -e 's,@SBINDIR@,${sbindir},g' \
> +                   -e 's,@BINDIR@,${bindir},g' \
> +                   -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +            ${D}${systemd_system_unitdir}/sshd.socket
> +       fi
> +       if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mod=
e','true','false',d)}; then
> +           install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_syst=
em_unitdir}
> +       fi
>         install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_s=
ystem_unitdir}
>         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>                 -e 's,@SBINDIR@,${sbindir},g' \
>                 -e 's,@BINDIR@,${bindir},g' \
>                 -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> -               ${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_s=
ystem_unitdir}/*.service
> +               ${D}${systemd_system_unitdir}/*.service
>
>         sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>                 ${D}${sysconfdir}/init.d/sshd
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191874): https://lists.openembedded.org/g/openembedde=
d-core/message/191874
> Mute This Topic: https://lists.openembedded.org/mt/103009646/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

