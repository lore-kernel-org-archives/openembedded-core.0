Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99519C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 17:04:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.139768.1692119044288974013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 10:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YC19yavr;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99cdb0fd093so765485666b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692119043; x=1692723843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZNHad0gV4TqAlQyJFmetf4rGxYm9DC5iGjwr+Xs0lY=;
        b=YC19yavr+pdVPX24c2eYIeX1qn1G+wyX7hn429vcj8POgUevCE58Z/jaUI67rgxJQV
         Foio5h/zJwcTpFLJiYxAEpyJeAwokIJ04hgcoDLLNEoqXGeMsdGvx/wGRsfmz5Uk0daP
         D1qRjhAMrzMuPMOiHhgg2LbE+ow2eHWLyD/aErU9/xupOoSK1/AeCrnKeXeegduKheYi
         k0ayGXkxRrgV0P3vinKlXAXwWgC4AbqlGB8t45Z6XQbDHishEmGIaiukN2JI1P4un36L
         3hussu1zHJAsRslDEiVR/77hgbkXLWuuPNgwke/Lr9sFqtyEaQ3EPbR+tmvXjMuoifhB
         Gpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692119043; x=1692723843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZNHad0gV4TqAlQyJFmetf4rGxYm9DC5iGjwr+Xs0lY=;
        b=NiGs092TyOQ7PWPUuzmaNVpxEY4JldUi20f0QPbRHCDIGhnCyNmgTuuhIzHqLn09xf
         yq6zNv+8S+Aortm1yh5QrlZKypLPxtSu6SGJ55+RkGdO+iwsGmoJC0AOsbn4dJTxxzB5
         8vSPdyNXjyhcgF4/XyvRJtEyVHk4VjYBOR0AC/c0Uf+PK0SBeo5/PS8SP/0N/ka4RAAw
         Lb0Anf7BB4hDawSuSrBdmcYBHKjNk2VuN4SpeHxybm6FfW0etF+mZuKoZcd30oiIzmIs
         UEoujkuI8AanoOyoj2r8nYBnIpmOvsQNNJeSmTHwpiIZlQe3cI5+ySHH7tRE37o66DMz
         3pbQ==
X-Gm-Message-State: AOJu0YwQrXIl8QEYGwkGxvbxSTqP9BnvYaCZxmLU92L5MFm215o0BGut
	RrM0iNtz0eA7u3zEHbMHJJSKzbYTXSPOWD+RpCc+HQ==
X-Google-Smtp-Source: AGHT+IF7BEH/8TDIzopIC1YeqcmllyPyI1WoprcuOIKbQ9OpIUQXC8caj7JmlvCC7h8hFyN3mZrJiaH5SkdPPYLbTg4=
X-Received: by 2002:a17:906:76c2:b0:991:d9cb:247d with SMTP id
 q2-20020a17090676c200b00991d9cb247dmr11072986ejn.57.1692119042637; Tue, 15
 Aug 2023 10:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <9883b62ca96b90f5757489abb561f288c7dc9f43.camel@intel.com> <19617.1692093752690972064@lists.openembedded.org>
In-Reply-To: <19617.1692093752690972064@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 15 Aug 2023 07:03:51 -1000
Message-ID: <CAOSpxdYypniH+ZsxoiD4twfQxAYo1CVsLSyu2Vxg9_-C-2Y0+w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] Fix kirkstone dmidedecode smbios3_decode
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, "Lau, Karn Jye" <karn.jye.lau@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 17:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186098

On Tue, Aug 15, 2023 at 12:02=E2=80=AFAM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Here is a fix for this issue: https://lists.openembedded.org/g/openembedd=
ed-core/message/186054. Unfortunately, I was not able to link to this discu=
ssion.

I have this version of the fix in my current test queue.

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186056): https://lists.openembedded.org/g/openembedde=
d-core/message/186056
> Mute This Topic: https://lists.openembedded.org/mt/100696063/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

