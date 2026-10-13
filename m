Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6B0CA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:54:40 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4129.1791888870128827672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KcxbAv21;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917997ab0d9so36793536d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791888869; cv=none;
        d=google.com; s=arc-20260327;
        b=hwn0IIyWl3SR8Nx7N9lu95pFyWho4yQIgNazOjk4QDOEoV18LzSAtotl+ufd24xwUJ
         UaBh/4XPBDWxahx8iyFN9Fud2UBPsnBqnnMBlQ86cgh6IhUuKdaoZJ3k1YAB8d5sJ46D
         /YYY5T8Obx20wfl5Lb7XMv8jhfxqdXE2mfr1qojN1RX0UqUmgjU0YFspdMimcax+CloE
         wDdQXmnXhyfaEn5uTp57LL0JTpgS/TBRjb+WwZROTXwJCEz/H1SDIkp1aKyd41G7SzCn
         ZBdvDWTq/5ZXVwhxd93QAwBnm/QM07CxQvwy75xC+n0+ayiC7xjQiC3L8r2DJgRlJPMg
         RaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uHE08S/aGbpxSi3mMtoFHIJ5l4wTKqWA2qTeYJYzIBQ=;
        fh=PmRlrUr4fPzdrmqYL26YQhih7ON+5j/GRPlovzxMdkU=;
        b=EqwX53vQlZ2ykXdP2B9o0Ep9m3lh2VAzcE3vcQoEnhJ0Cz2X71IdMyiPOJ1ZIuYOTC
         hHtP005DatSyU7Bd4cQpek3HgnmbTqx88UVKUjVBI4FUJDMaTnLMefuR4/Of3ral8HZU
         qZv80rq8p944X5zRBB2zqhgYn32Pv0y2ioIVq9JsM8resI8CfPu5Kk/qFuJmbfKtuncD
         EUW6hfg0rTajJ7aQBr7bd3qJqqftCWF0Kb0+zWW+MVNPjh0M9E4I7/vuFUB0DwEJ7zjp
         0dwdPLRF/bRXCLSJAG7Y/vuqw7LyaX2daONb7wTv1TkmDEjew05j2Wv3SAbUbwIkKxn/
         UuRA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888869; x=1792493669; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHE08S/aGbpxSi3mMtoFHIJ5l4wTKqWA2qTeYJYzIBQ=;
        b=KcxbAv21NiOt1aJ44kwsVQn9UD7Gf6C2wMab287PMQucoprjjpWg8+bK25EqMG7CyN
         5m6l4GqcGS5W9VDN6iZXKCz39mz0mxZvtzdQMH2SFXGtO6dcipTb28mx14oVJnM/M598
         X02HM9nBxHTGLvuFiyIZXCp31VvF/XBeLIOmPvTjIw4vMg4wqaSVW5fG5PTTyJ43VDyS
         LaDzH/PR70b2w9M0KuKgLuobx4ZznnwDuaTFaUmBCPib1QJQyK/c/QlnER5wLLYv1mhT
         m5gruviwcKByxErbdhiQ1wSSGYOutp2fe2rwIzxxYlK08KKj8AMnKi6WAgo78a6/FbY5
         HtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888869; x=1792493669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uHE08S/aGbpxSi3mMtoFHIJ5l4wTKqWA2qTeYJYzIBQ=;
        b=yPACl5ujuxrcUl+0njD4vg1eLhapieq8gJYjt2UMIr9Rn09ffus+P9g5JII1DL73ki
         a++dYsOwsaYgHyKOfqmU6eQteLKXNtWgpW1WHrSfTbeb9dv3oaglVnL9PqXt8Ootuum5
         SWj3eNjVPkXFqg3gfPb6v8wzKlebI3YiTEDlRn7GZfpZBkBqVBBxRcPvnKeLH716RavI
         PTGpDtxb3k4h9JUJUWDR11yEXBDh69sq+JmoYZrQF8xI3iqpzHDo42WF+o9+LsTwC9lL
         wcts8dDdAp/SCuMjQbVqXhShzEQ7L8x8GShjmrlOQtnw3zN16EBm3jLxhbHXwJUveYGh
         Tb3Q==
X-Gm-Message-State: AFq9FYIZ5Pi1kxNocYMUqUwQmYIta6DmEjjLDtdiFOzOFZ65an5h1tDA
	ZzkTPoY4b24xAG++KYlAcZ3Pe290D3cMXxNxpQH+RiLkI0TCzcqoxyB/BEidZZf+3nyp9fD9TGs
	bfi9IfEasHNuqPBOr6sRc0SmMinYSiHY=
X-Gm-Gg: AYBFou17BNfSAnIvE2zVH9pmr+KtKT8Zed4VoJlvhysuZyjiFvyv/xYlO1S4jalMwcG
	vCSlv2e2fnylY2VBN0WOf7kuDbmEG4lCoEFIbPF+uPJScYWfdibAcUEPC/QRsVEVCUsBWAeHfgQ
	3c4yKfIukQifriI0qN9Pi6VLOgFYUd8J8vvdJMjlJgYQmhrEkN9wSjPmuFz57enP/PLz+rl8A/b
	9lELr9VNhXnWTDjMw0yd8TPD8Oy+HNO5am0EeWRpbm/LaVD2FmF9T51JUHai5ogKfU0/eyTgCm0
	cJdVv3gfSATF5ltmaAlOWoq3G0EaEoSzYsZeWFuECw2ogYqVAa1QUlhlP3QN31huD6CmeiKdJ8m
	fMcVJM8yF/y5Vnw==
X-Received: by 2002:a05:6214:410a:b0:917:c904:4ae7 with SMTP id
 6a1803df08f44-91b5555df66mr232086996d6.42.1791888868809; Tue, 13 Oct 2026
 03:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261010113029.2347847-1-ecordonnier@snap.com>
 <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
 <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
 <CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com> <CAHUKmYbEwbbsx+DeAvw+wf9AggQws0G4nGbjWe=Wp4ESxe5kaA@mail.gmail.com>
In-Reply-To: <CAHUKmYbEwbbsx+DeAvw+wf9AggQws0G4nGbjWe=Wp4ESxe5kaA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Oct 2026 12:54:17 +0200
X-Gm-Features: AclHuK9OIKgUCkt9jU6YcvYHf_dXlfQ5UChRksKKrwyuQsT9XCnBJPlxAdTS63E
Message-ID: <CANNYZj-=7nx_DOHVxCvX6DSdgvK4K12-8RT+YR8H3KSrdb291Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, collin.funk1@gmail.com
Content-Type: multipart/alternative; boundary="00000000000080a50b065db6a37f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247721

--00000000000080a50b065db6a37f
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 12:02, Etienne Cordonnier <ecordonnier@snap.com>
wrote:

> > - last, but not least. Actually this is the most important one: fix your
> relationship with GNU coreutils. It's painful to watch you two bicker, and
> I do not want the Yocto project to be dragged into this.
>
> On the last point: I can see Collin feels strongly about this, and I take
> the licensing concern seriously. But I haven't been in conflict with him or
> with GNU coreutils. If there's a specific exchange you'd like me to look
> at, please point me to it.
>

The risk of AI-assisted contributions that basically rewrite GPLd gnu
coreutils C code into rust is very real, and it has happened in other
projects, causing their complete derailment. Are you able to spot and
reject such contributions?

There's also a distinct lack of collaboration. Both projects obviously must
implement the exact same UI, and the only way to do it is to have a shared,
independent, rigorous test suite. Collin has explicitly said he is not
endorsing the use of GNU tests for uutils.

I'd also note that quietly skipping my points without saying anything about
them only means they remain unresolved.

Alex

--00000000000080a50b065db6a37f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 13 Oct 2026 at 12:02, Etienne Cordonn=
ier &lt;<a href=3D"mailto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr">&gt; - last, but not least. Actually this is the most important o=
ne: fix your relationship with GNU coreutils. It&#39;s painful to watch you=
 two bicker, and I do not want the Yocto project to be dragged into this.<b=
r><br>On the last point: I can see Collin feels strongly about this, and I =
take the licensing concern seriously. But I haven&#39;t been in conflict wi=
th him or with GNU coreutils. If there&#39;s a specific exchange you&#39;d =
like me to look at, please point me to it.<br></div></blockquote><br></div>=
<div class=3D"gmail_quote gmail_quote_container">The risk of AI-assisted co=
ntributions that basically rewrite GPLd gnu coreutils C code into rust is v=
ery real, and it has happened in other projects, causing their complete der=
ailment. Are you able to spot and reject such contributions?</div><div clas=
s=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quote=
 gmail_quote_container">There&#39;s also a distinct lack of collaboration. =
Both projects obviously must implement the exact same UI, and the only way =
to do it is to have a shared, independent, rigorous test suite. Collin has =
explicitly said he is not endorsing the use of GNU tests for uutils.</div><=
div class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gma=
il_quote gmail_quote_container">I&#39;d also note that quietly skipping my =
points without saying anything about them only means they remain unresolved=
.</div><div class=3D"gmail_quote gmail_quote_container"><br></div><div clas=
s=3D"gmail_quote gmail_quote_container">Alex</div></div>

--00000000000080a50b065db6a37f--

