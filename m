Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70174EED60E
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 14:40:03 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.49508.1726152000009527729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 07:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=ckj+jfOw;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.178, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1d06c728b8so977884276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1726151999; x=1726756799; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kMQvY8e4f7smm4paUCzyIomTT4wfBB4xXTOBkQM6F9w=;
        b=ckj+jfOwQr+LrjB3Cz8yzzwGUZQp4m5UPtUTlqKAqJEjh8X51fNCmbQpPGvcVUxlnE
         SQXBEwCkj1bQhDotPvVbuRXoki7bo3dCmcPx6eFJ33sNaQU2eD4UWMogijVcBJ4AZLBZ
         sCMbjZsVZCn/uUk4UqK2Ety5MIv0/MW0JpJkNZYgBVmLF5BQhtKmJvgCUXKWEGsjQWxe
         tqNfo00v0jSYJ4GHcmnuKwNLciJJ47e4PfK/8OPsrB4pJTYsCthkwA6OLdhQzPZmqzkg
         3gsI/nBwQJ4+jBY3PZrcyf5fu06bzEZ6ErDMAvfzuGRAaTrGBOGIBAaq2C0BBh/XmPQn
         IJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151999; x=1726756799;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMQvY8e4f7smm4paUCzyIomTT4wfBB4xXTOBkQM6F9w=;
        b=qQIERLiLJcNMu4p+NZWURTfWeJdqYPmUdvPdIjh6O3LkAaU/MlQ99zZLup4R1/YGh+
         D/Z+TqL9rJqhA/EEzQ3zqbmtsEnKt7k2EVOGD8wv4Y4ELhOR5kbrzTqSWuzY+JhDCbma
         3dI98At56Q0BU2beCle6iXjHJtNZXpsfz+YJLCoxhnMJow4DogEY3Oe4ZFNI31DTH+4a
         0S3SPMUEsF6F0cHUo67BocpD7u528TN4mJ8KrFkiGdthqJ3hd2eEM5gXoUc/NHrnXU6x
         2lFa5C9boLsx2DIUWeL/kXpC4NWf5BDrTImHngEJ7g5ShFaF/gJyiGS76o4UlMTMe/BL
         xxUQ==
X-Gm-Message-State: AOJu0YxLGBBABK9DOsgpccgalm5/5RDvBxjGzbvz3gxE0RcNvrEOvq/t
	874nXuqVeOdsimCewlB1P3zX7xUePGH79Do9gM/S5MWEupwO85x8X6rzITaPKWdP2wenDfwZWJU
	IYCg=
X-Google-Smtp-Source: AGHT+IER49/jl2vHQzJmVlTyaQJ6nK90J5c0UgA5zvijSFa12Zj9jmIAMsCB7gYFSvQ3PtUd9swAvA==
X-Received: by 2002:a05:6902:2d03:b0:e1d:79b2:ba2b with SMTP id 3f1490d57ef6-e1d9dbc1f41mr2852903276.21.1726151998528;
        Thu, 12 Sep 2024 07:39:58 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d7bb94cd9sm1065666276.52.2024.09.12.07.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 07:39:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6da395fb97aso8844257b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 07:39:58 -0700 (PDT)
X-Received: by 2002:a05:6902:188d:b0:e1d:9bcc:d49 with SMTP id
 3f1490d57ef6-e1d9dc69ff0mr3056480276.51.1726151997527; Thu, 12 Sep 2024
 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240830004331.2856512-1-otavio@ossystems.com.br>
In-Reply-To: <20240830004331.2856512-1-otavio@ossystems.com.br>
Date: Thu, 12 Sep 2024 11:39:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKogH-naXchvHnZHRZuLPyAo=R8=yHjhb8k=Fp0OMJUM2w@mail.gmail.com>
Message-ID: <CAP9ODKogH-naXchvHnZHRZuLPyAo=R8=yHjhb8k=Fp0OMJUM2w@mail.gmail.com>
Subject: Re: [PATCH] u-boot: Ensure we use BFD as linker even if using GCC for it
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000a42a280621ed1495"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 14:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204445

--000000000000a42a280621ed1495
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steve,

How are you doing?

Em qui., 29 de ago. de 2024 =C3=A0s 21:43, Otavio Salvador <
otavio@ossystems.com.br> escreveu:

> If we are using 'ld-is-gold' as DISTRO_FEATURE, the U-Boot Makefile has
> mechanisms to ensure that we use BFD as linker. However, this does not
> work for the GCC when it is used as linking tool.
>
> To support that, we added explicit BFD use whenever we have the
> DISTRO_FEATURE feature enabled.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>

Please queue this patch as backward if possible. We are currently using a
local fix for this, but we would like to drop this when the fix lands in
the branch.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

--000000000000a42a280621ed1495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Steve,</div><div dir=3D"ltr"><br></div><d=
iv dir=3D"ltr">How are you doing?<br><div><br></div></div><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Em qui., 29 de ago. de 2024=
 =C3=A0s 21:43, Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.=
br">otavio@ossystems.com.br</a>&gt; escreveu:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">If we are using &#39;ld-is-gold&#39; as DISTR=
O_FEATURE, the U-Boot Makefile has<br>
mechanisms to ensure that we use BFD as linker. However, this does not<br>
work for the GCC when it is used as linking tool.<br>
<br>
To support that, we added explicit BFD use whenever we have the<br>
DISTRO_FEATURE feature enabled.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br></blockquote><div><=
br></div><div>Please queue this patch as backward if possible. We are curre=
ntly using a local fix for this, but we would like to drop this when the fi=
x lands in the branch.</div></div><div><br></div><span class=3D"gmail_signa=
ture_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div =
dir=3D"ltr">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a hre=
f=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.co=
m.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br=
" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 =
9981-7854</div></div></div>

--000000000000a42a280621ed1495--

