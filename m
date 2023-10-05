Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B18AE9272F
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 19:26:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.24889.1696533956624722189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 12:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jo4dytMz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-533edb5ac54so2478271a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696533955; x=1697138755; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKJ2QaMBK3GXUxKnVldSxIegf/KNK6j/CR0Jvl7btVE=;
        b=jo4dytMzpWBysbKb5GWymTJGb4iy/Gn0Msy0RlAi/URLoRsc55STDzGJWkIXNPb7JN
         J0BOS93jduq/oKOjmRhfaG9bKGBIpi8D1GrDvmdmvR73vFzabZcJXawckE4lHwajpU+3
         TU1XKNTAoX4KZDvf5AY77k0gcZXw205KC1uh3ahzNS/Rx60q2TZZN/pMTmdavXmrQpqN
         taCOVACNqbJH1cIKyXP+FmZgj09xCgE4miW3KcY/d1/gzKdzh/KIvW5J6CXGy9P9cycq
         ZydnBoJEmOjHvrA0cyWpth+rwWESfe347RiKA9l0q+9kQ+zBeOmKQny4dyo5TIzkKLKk
         v4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533955; x=1697138755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKJ2QaMBK3GXUxKnVldSxIegf/KNK6j/CR0Jvl7btVE=;
        b=jNUhvoe/u0r3pCHen5EYpPml4ceX9SdtOXfg17ndB3qgEVqlraQw74/ebHhrr1xSeu
         WBEDbrpGeHV3twwehlrhW+sWn6cnsZ/bDXeXSk5H3SoasTG4IGQ+AdWWD7bkeMGEOru3
         0R8F8xHetxAHUxUC1DiFL0rAh7MzFwfcLVv/QHjSOyBqDBG2El7FGRBfVoIFVRSqlJt0
         qK6HcBvxSGiryD5xBlpYf9KkHfvf9fRF5Siq1z+Bw8Gjf9MRwOLMnZBhacriNmgFiyNK
         OHodHzw/SOMZSb7LcbaABxgX+TT+OB7mBczm1ujjzPqgHi3Sd4o3NfpL5BLjhZOe5jg0
         NEKg==
X-Gm-Message-State: AOJu0YyixOiMUU/7XoSLXXFyhBj+E/QylXGo0B4w9xZFbJIOQD1ROkLW
	jJRKeZXE2upkSltIeq0wyHN6BBUfocmK60G+bE3MbQ==
X-Google-Smtp-Source: AGHT+IHSFWT8AalEE2AuysVo8xtFxkFrb7bAVOktV4Nh1ZzX5pskRPNH6JzyZeLSGaWai1wzJo2/VvV1p4QQTEkJh/A=
X-Received: by 2002:a17:906:318f:b0:9a1:b05a:c07c with SMTP id
 15-20020a170906318f00b009a1b05ac07cmr5248912ejy.55.1696533954886; Thu, 05 Oct
 2023 12:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231005085407.2200644-1-mac@mcrowe.com> <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
 <ZR8ECxFrS1JgOzfr@mcrowe.com>
In-Reply-To: <ZR8ECxFrS1JgOzfr@mcrowe.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 5 Oct 2023 09:25:44 -1000
Message-ID: <CAOSpxdZauK+KPAzWMn5hFHepNuYRPN=4NzcrwiSm3OLUnWy5jg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney Tunables"
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 19:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188732

On Thu, Oct 5, 2023 at 8:44=E2=80=AFAM Mike Crowe <mac@mcrowe.com> wrote:
>
> On Thursday 05 October 2023 at 04:17:08 -1000, Steve Sakoman wrote:
> > Hmmm ... does this build for you?
>
> Yes, on top of 0111b5b152c1bcff0ab26cf8632ca9002237f070 (current HEAD of
> openembedded-core dunfell branch.)
>
> > I'm getting:
> >
> > ERROR: glibc-2.31+gitAUTOINC+2d4f26e5cf-r0 do_patch: Applying patch
> > 'CVE-2023-4911.patch' on target directory
> > '/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/gli=
bc/2.31+gitAUTOINC+2d4f26e5cf-r0/git'
> > Command Error: 'quilt --quiltrc
> > /home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/glib=
c/2.31+gitAUTOINC+2d4f26e5cf-r0/recipe-sysroot-native/etc/quiltrc
> > push' exited with 0  Output:
> > Applying patch CVE-2023-4911.patch
> > patching file elf/dl-tunables.c
> > Hunk #1 FAILED at 187.
> > Hunk #2 FAILED at 251.
> > 2 out of 2 hunks FAILED -- rejects in file elf/dl-tunables.c
> > Patch CVE-2023-4911.patch does not apply (enforce with -f)
>
> Well that's strange. I can see from your work directory name that you're
> using the same glibc commit as me:
> 2d4f26e5cfda682f9ce61444b81533b83f6381af, and I can apply the
> CVE-2023-4911.patch to that commit without conflicts.
>
> Do you have any other changes beyond
> 0111b5b152c1bcff0ab26cf8632ca9002237f070 in your tree that might be
> applying other patches?

Strange!  Nothing that should affect glibc.  I'm applying to the head
of stable/dunfell-nut:

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dunf=
ell-nut

Steve

