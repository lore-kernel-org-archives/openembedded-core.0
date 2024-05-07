Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5C6C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:29:42 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.4736.1715059782232421072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQxlvfp2;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e242b1df60so32532171fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715059780; x=1715664580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxLNx9nKqbxVb7054SBcVsXMp7xA/KlMPrJywkcIuAw=;
        b=iQxlvfp287ekxxwp05++9krYpTOWqZmgUwjIqPHVsgJT41VxBdaczFDXpCjPrOaEow
         qvBwlkwMHtQQypUtqMiv2G6Eyq8Ced4gXw1bLAEnN48o0Y4AwbEjzNfoI1MR7iub0i/2
         N3KvFv++jDadu2Tw6f+fHZaVPaZnGMp15+2ilK2sO7hAawFt/OepcD78LJVr48v11BYK
         kGX+MMlHFAJkHW77++g+vJ+FPz2roB9VOTzBX/6G/PWO/yxsV6c+SZoeX9jRgwkLjWNt
         9OAyYREFMl458HJ5A5/7zJsXesuZbpFimKQDJpQCWMJIFNqqRG+QvEagSmRtVIhe3xWC
         v5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715059780; x=1715664580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxLNx9nKqbxVb7054SBcVsXMp7xA/KlMPrJywkcIuAw=;
        b=R4DkfLbWrgeTGk/GGcMLGwQ76DFi0meJTDWUrjVaakdgpdu2sHdyM6P9QlRWV9Aodh
         oZ2dsoL9GPxxZ2kpbMaueCrcnx5aHCxeGWA/66keUxrRQUm08fOwR8g3qLgUoE31DA8u
         2tglR6HDBR4A122yaeHDQRBguXZE5K16uT8PVzzduXYXeHiW8Zgs2qJ8B+igHCmCXI4T
         fjAtMCiBfhsEYaIAMn/pYd3MSZNrcWfG9e+kmaOnHyQ8fmjofRVW8tSxfE6Q1hXdAWb+
         NYePy3nspAbHzychA4o7x8+X0ETOJ1Iy6SXJAgCCc/TV+oKkuLvJmJr/0SJiWNIUtJj3
         OAKA==
X-Gm-Message-State: AOJu0Yy5QsWiHPAuQK6vEG+cNC5w8EH8341rrcovDOqQLPJ3LLWOl4nV
	GLq8+ofPIdmy+2BRkw80cUbLHxAjbT9vmAU1t6Abkd7AKDdhcpDoaMry23dUc9j4ndw+qM1MhOD
	p587rJ9se9KxBOGMS1eTi6JhU7iA=
X-Google-Smtp-Source: AGHT+IEd6T3m4KH9Chau3At7moygDih+0kNBDme/c5Pbxjv9fdEsXOOBZYfHh2eGY4PIy6DYzGVd5LO35SrbNW8hysY=
X-Received: by 2002:a2e:3a1a:0:b0:2e1:a8ca:6166 with SMTP id
 h26-20020a2e3a1a000000b002e1a8ca6166mr10515605lja.43.1715059780201; Mon, 06
 May 2024 22:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org> <20240501215643.3386307-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240501215643.3386307-3-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 May 2024 07:29:28 +0200
Message-ID: <CA+chaQcWnV5rXAiGSEymmzxsdWyn4agHw_0pjMMcfJjRO1yQGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] recipes: Update S = WORKDIR recipes to use
 ${S} correctly
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199069

On Wed, May 1, 2024 at 11:56=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Where recipes use S =3D ${WORKDIR}, ensure they are referencing ${S} corr=
ectly
> to access files as soon we want to stop doing this in WORKDIR at which po=
int
> they would break unless corrected.

-LIC_FILES_CHKSUM =3D
"file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"
+LIC_FILES_CHKSUM =3D
"file://${S}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"

Isn't LIC_FILES_CHKSUM usually relative path from ${S} so all of these
changes could just drop the ${S} now?

