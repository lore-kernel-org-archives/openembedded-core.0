Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973CED33995
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 15:01:11 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.54037.1730127665687597947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 08:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AkxL7qKT;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e6010a3bbfso2563745b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730127665; x=1730732465; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRDM+VXsDUf1rIAdFn8AoN7rfVcVNF/t75SDYvAJE9Q=;
        b=AkxL7qKTh4NliqVfuyXNGzggnV1uZuxoBhrWIsO0KhC0dfR8YEEuyZwSXCAHcG3e5M
         fjuZz05AivqvANCDSnDfXE2dsSYRVtSbhVz+vF/fFFPHcv2rRXTmwqpeN0DOewwAPJND
         5MhSg77G//6MurTQeSfH8CLn+sVIzmc9QCt8YVbcba18VnAAt0BCdTv4j2DfWdLbuCsq
         FXd7Unp+ekTt51kRgmhyYCp9XV7v18sHgX2FosHGcwAo+0VRQ+6ZuBt1Vg+pTPpRCifK
         ByH9+O+EMBDR5Rh7UxFGMTDQoDOLVwvUtq/vxGH0NYV8g9Mt/58QmjjW3sO8qSZt89w6
         99ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730127665; x=1730732465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRDM+VXsDUf1rIAdFn8AoN7rfVcVNF/t75SDYvAJE9Q=;
        b=V9DI5lvYe7FdbBumnjb+wu2hT+d6G0Ec2qTT+b1pN0xEwL61Lk+GUREPeImg7SiKhL
         u0T8r+p/ns6tv7eFqNwHBHwWGej8JRmiehee7aQx8IfMJGem0pJz25mQcpnYNsRbt4Yh
         uOQQKlKNLQpBWZmf3WB/UhJVXN9aaOVUwZu+MJD8b0cMije/fWoBJ/IgZKtVIk7a7Yri
         /LuUXA9NS3MHbY6uf97j4QijqjjiPWP6KxXy43uikKkylOGo9/EwfM6WbuEEcWtytD8s
         ktmUhq876D+BYIPIapULfSkolUAsL/os78Cz0jZH8DGw4XOdZPtivm5vf1Z60IOfZ+Fk
         cWAA==
X-Gm-Message-State: AOJu0Yy0rdidUTeA7DaFpmYAralbjYAB3TLC9RU/SZA+J1EUpE0Sl8LM
	zqy5Kqr47bn+CGAqDEgxpcgLqYJo4oFYEs9z6rAKUXKoh5utbQaNkmuXgR+fpWEHkakQ4qdzAjj
	MdNhnXPby1hyw7NlFf5khYUA9j3Fjp4u2TgE=
X-Google-Smtp-Source: AGHT+IFQGHlUK6zF4bzwm9q7LvMld9wGPkUx0o6u0KIYEmazeiEYCs3GpI7pA8vMBDcRI35uT+AyuS9a0cAydTjpCI8=
X-Received: by 2002:a05:6808:3998:b0:3e5:e243:1861 with SMTP id
 5614622812f47-3e63845037dmr8012855b6e.27.1730127664727; Mon, 28 Oct 2024
 08:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241022062721.4131585-1-raj.khem@gmail.com> <20241022062721.4131585-3-raj.khem@gmail.com>
 <05DF9D37-9545-46B5-BA96-81F6480A4F08@arm.com>
In-Reply-To: <05DF9D37-9545-46B5-BA96-81F6480A4F08@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2024 08:00:39 -0700
Message-ID: <CAMKF1spnEVQ+QnF_W85yXnjvC5Ysne3AwcN=6Oq9x7Q9vVSjFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] python3-libarchive-c: Avoid using
 find_library python API
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 15:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206449

On Mon, Oct 28, 2024 at 7:02=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 22 Oct 2024, at 07:27, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > find_library API depends on platform to provide ldconfig, ld, gcc, objd=
ump
> > etc, so either we add these dependencies or avoid them by computing the
> > libarchive library name during build, which we can be done.
>
> OH GOD THAT IS HORRIBLE.
>
> "On Linux, find_library() tries to run external programs (/sbin/ldconfig,=
 gcc, objdump and ld) to find the library file. It returns the filename of =
the library file.=E2=80=9D
>
> > +DEPENDS +=3D "patchelf-native libarchive"
> > +# Avoid using find_library API which needs ldconfig and ld/objdump
> > +# https://docs.python.org/3/library/ctypes.html#ctypes-reference
> > +#
> > +do_configure:append() {
> > +    sed -i -e "s|find_library('archive')|'${libdir}/$(patchelf --print=
-soname ${STAGING_LIBDIR}/libarchive.so)'|" ${S}/libarchive/ffi.py
> > +}
>
> Can we patch the source instead:
>
> -libarchive_path =3D os.environ.get('LIBARCHIVE') or find_library('archiv=
e')
> +libarchive_path =3D @LIBARCHIVE_SONAME@

This would mean we do not respect LIBARCHIVE envvar which is a
documented way of calling
a non-default libarchive.so perhaps we can do

libarchive_path =3D os.environ.get('LIBARCHIVE') or @LIBARCHIVE_SONAME@

unless we lift the whole expression out into sed op

>
> And then just sed that expression with the right value?  I don=E2=80=99t =
like magic seds because they can transparently not apply and regress in the=
 future.
>
> Also, thoughts on a solution that doesn=E2=80=99t involve ldconfig so it =
works on musl would be appreciated.  Can you tell the musl loader to dump i=
ts search paths somehow?  We should really file a bug with python=E2=80=A6
>
> Ross
>

