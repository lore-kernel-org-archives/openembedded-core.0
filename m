Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB93C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 13:59:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1332.1787925580301193376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 06:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VI2VaFk9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so9428475e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787925578; x=1788530378; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R0Rz3hHa5yZVpwL2rw1TOYVO0d5cSU25oEg1N1OfZ/Y=;
        b=VI2VaFk9Du3cdcjPmWTHKVDx17GfmsfRo+Q6IQlX3qZgF790x4cKE7zTlb05hbshYF
         jbJxO8UPTA/Hjmb0o1aEUlGBwuVG1TpX7NcKXFhp49/zO1cawiUWeF5tvZbq8KuYacr3
         zWH0b/a+FatxjJDpvhmOnR3RTdx8KBIChoGEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925578; x=1788530378;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0Rz3hHa5yZVpwL2rw1TOYVO0d5cSU25oEg1N1OfZ/Y=;
        b=r/4WV9yj5nL66u9mnAseE0sWkCGDjF6YdzSvsaBYdAY2/3aKGcGvqd23Cxk8cIL7S6
         i+ljDRMFL5++CYH80yUy9kx23NjFLxfADGTpelcCAlG6Gg7yVf4wfCS+uyqHQi98dZCf
         9dX+J/oEAXYpMYrujgcxYMFdrl9ZRfqhxxTqneL8KIlvN7U12/pNwmfziOIuNATmo79U
         8cM/kwcy+4WvpW5Ist6IHQynvsvZDx9VwL5YZ2Tg0589Lsl9FPPqyy4iv/nArPbBqzic
         /mbS5nJhtSO8yg3D5KewtLtHucV49jk2mlNdkSCE4uWllJGEyVZa7a3qy0vGGoILZ/TA
         Db5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrIQYmUlc+7UcvSRo6zkgWstxS94L6xrHOVqUhYha9LFzN0dsdLiPhJCCpSRq2coYpgaDZi0sAGgJUVb3UB2P4FfA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nHMNHo/pU48eqA202uKmLsE/XZaRDGmjKb5iuAloSZP1odzHpf
	BQAeMmmZT+vFhj7SMSjVRkkBz3RLOS5H1pWyaXDnUyvrn5LxTIAzvZvz9j4UOgZPrXI=
X-Gm-Gg: AR+sD13bwKbIk8HMgEHu9JLRzygDV41jmjKUszAQ+R8nf3wZNjdXHPhKPWMviKq+zoP
	zN6HNjPejJoroVTr0hMCZETsPTuz9iXnBJPZmS0koPNbhVVGx2zTzZZpRO7ouhgZR0ds/NUx3aA
	W7q3yTd841KNnUfJul/SZYkLjm4/ZKWVsCYyquwLocuNhinzs1KCGN+aIzFIwm7gt0BGHhdW5+9
	7zTNiJKoYBN0EpwK5+hfPMaRF7pXiQL5R+ah8zy7imBqE6vymmVBcC9cRrWY3cODPGovLOGQKzK
	huI+Px2cJCFxAc/E/zZIIL4waHnykW1PPY+vWDDBrCRP0yU5DQi5xrcECfdnfz1uvCyirKPJvXC
	sGGmmJutHqVmhm+xYcJuaJ6ISdWIvrOwoW6kDIaH1tcevSpFQRn2zR9bltGW5QUrGejQwOzvJei
	dYlN97uY/JQA+vrfxZhbKNfNMJ+Yqq+7n3jDvKJvSq0I446XS082DL3yYpmbV51dnkFQRyI0kn6
	FXO3XentV9uxyOn4CZrXYIgmBRbsdI9OXkdybathLDcnUZTE5mNlw==
X-Received: by 2002:a05:600c:3493:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49b91c4792bmr110920165e9.10.1787925578306;
        Fri, 28 Aug 2026 06:59:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1? ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc103dsm51018175e9.1.2026.08.28.06.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:59:37 -0700 (PDT)
Message-ID: <3dda3b72d10c8f3021a4c97d68beb2b2b4b7da0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes-global/license: create -lic package
 from PKGD, not D
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: roman.nazarenko@leica-geosystems.com, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2026 14:59:36 +0100
In-Reply-To: <20260827155227.813074-1-roman.nazarenko@leica-geosystems.com>
References: <20260827155227.813074-1-roman.nazarenko@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 13:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244545

On Thu, 2026-08-27 at 17:52 +0200, roman.nazarenko via lists.openembedded.o=
rg wrote:
> From: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
>=20
> do_package and do_populate_sysroot are siblings - both are only ordered
> "after do_install" - so they run concurrently. With
> LICENSE_CREATE_PACKAGE=3D1, perform_packagecopy:prepend wrote the
> LIC_FILES_CHKSUM texts straight into ${D}${datadir}/licenses/${PN}/,
> mutating the very tree do_populate_sysroot stages with find|cpio:
>=20
> =C2=A0 | DEBUG: Executing shell function sysroot_stage_all
> =C2=A0 | cpio: ./licenses/libmodule/LICENSE: Cannot stat: No such file or=
 directory
> =C2=A0 | WARNING: exit code 2 from a shell command.
>=20
> copy_license_files() removes and re-links an already existing
> destination, so a file can be listed by find and gone by the time cpio
> stats it.
>=20
> Write into ${PKGD} from a perform_packagecopy:append instead. By then
> ${D} is complete and untouched, and ${PKGD} is a private copy that
> do_populate_sysroot never reads. Package contents, on-target paths and
> ownership are unchanged - do_package is a fakeroot task, so the
> os.chown() in copy_license_files() still applies. As a side effect the
> license texts stop being staged into every target recipe's sysroot,
> which they had no business being in.
>=20
> This changes perform_packagecopy, so do_package basehashes change for
> every recipe; expect a one-time repackage.
>=20
> Signed-off-by: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
> ---
> =C2=A0meta/classes-global/license.bbclass | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/li=
cense.bbclass
> index 86c9ee5878..1d266dd25d 100644
> --- a/meta/classes-global/license.bbclass
> +++ b/meta/classes-global/license.bbclass
> @@ -38,14 +38,15 @@ python do_populate_lic() {
> =C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.exit_if_errors(d)
> =C2=A0}
> =C2=A0
> -# it would be better to copy them in do_install:append, but find_license=
_files is python
> -python perform_packagecopy:prepend () {
> +# Write into PKGD, not D: do_populate_sysroot stages D concurrently and =
races
> +# with the remove-then-relink in copy_license_files().
> +python perform_packagecopy:append () {
> =C2=A0=C2=A0=C2=A0=C2=A0 enabled =3D oe.data.typed_value('LICENSE_CREATE_=
PACKAGE', d)
> =C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar('CLASSOVERRIDE') =3D=3D 'class-targe=
t' and enabled:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lic_files_paths =3D find=
_license_files(d)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # LICENSE_FILES_DIRECTORY sta=
rts with '/' so os.path.join cannot be used to join D and LICENSE_FILES_DIR=
ECTORY
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destdir =3D d.getVar('D') + o=
s.path.join(d.getVar('LICENSE_FILES_DIRECTORY'), d.getVar('PN'))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # LICENSE_FILES_DIRECTORY sta=
rts with '/' so os.path.join cannot be used to join PKGD and LICENSE_FILES_=
DIRECTORY
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destdir =3D d.getVar('PKGD') =
+ os.path.join(d.getVar('LICENSE_FILES_DIRECTORY'), d.getVar('PN'))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 copy_license_files(lic_f=
iles_paths, destdir)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_package_and_files(d)
> =C2=A0}

The comment you removed does still apply. Could you instead try making
this a do_install postfunc? I suspect those didn't exist when this was
written.

Cheers,

Richard



