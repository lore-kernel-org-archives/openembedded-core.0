Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9A5C4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:14:20 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.942.1637774058776040121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZaIJu8A;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id az37so6509940uab.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TqG+QkTIIDMyDDBhcK3iBzfB0VDco2saKvXJhvx4VMQ=;
        b=EZaIJu8Ax4u+3p49V44fwNIsLEURSwTX0LaBjDEBu1NlK8Z492qG7wAbZTrDq6Zfff
         WsEwpHs8kxSQiqfhwi2aRYE5WXZKGoH5tTccAvbXSTBOMfBPQ2XNpwJAB+eKdlKqPhVs
         yTfCc1D/paI9Y9t2zIexKcnzZwukuUvR6SVg1j5935f49sRrmDiI5nbwt/5shampHjzU
         7+uPMwa6jPrqahc5sYi98KjdZCkMTy5SFLsNt+eqjIscdpwJpBaEFgeJMllWKHmVghlG
         PhdaGbHvgUolekaiM7lNKIU59IPA9SCoOyro/0t5u46ddBgneOA2rSg3eC9GzCYAn2IE
         Tcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TqG+QkTIIDMyDDBhcK3iBzfB0VDco2saKvXJhvx4VMQ=;
        b=spUFQBBKPTQ6X7LchA0rONeLjlzLEbhBE22SWxyeqNYYf7E30mhkM8azzxnV4UmRmt
         imfVGhO+DLn8ojAc8pWNlNELodvty0zZ177XQ1IF7DpoHVWw8KWSMOZzGy+UGcvaYDcw
         /YXQj6FgUC78Ql34pVMMXxGRGO+iVJn3Ik+HCo83VdQScCNJY4QzSVd6aSBJKSfnhGQi
         EGNfc5Iu00NN/F++aY7SLLGtUwQt+02v4I0KizSjvl19Vo5v2NJhsZldpASKaAGCfxq1
         9uFqx6FyNehNomVFhmxMbI75nbFlsKi0X0QroZb1ZL+rGfANBHjImolJJucrNJGDqeCL
         FG1A==
X-Gm-Message-State: AOAM532nLg5BRLxHG3SAv9qV5zsmY8FHebqVY9VxJlDbBbFRGnjgmDKf
	1WT/tDjdqQL8GAUFJLV/YO0/2z0YDZ/rAy9HuHM=
X-Google-Smtp-Source: 
 ABdhPJxtLpqKYCp9aySDqVoudvGLYhEBo4roRSg+3M9Sm8DN0a2eAuT8M8XbbewDguOZ78CEhGFd8ljIfe2J1cui8dY=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr13201659uah.22.1637774057947;
 Wed, 24 Nov 2021 09:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9JQqkh3zf9a4zCbsbAWktP4K6YpFmb8fHhrn+47Eqtsw@mail.gmail.com>
 <c71903c8-0a6f-cb07-58fc-cc262bcc527f@weidmueller.com>
In-Reply-To: <c71903c8-0a6f-cb07-58fc-cc262bcc527f@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 18:14:06 +0100
Message-ID: 
 <CANNYZj8njWL15rHq2rmOMtZPMJV24f097SBmTkF6O8Nf=3oYZg@mail.gmail.com>
Subject: Re: [RFC PATCH 05/15] bitbake: fetch2: Support archives with missing
 search directory mode
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000f242d905d18bfc49"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:14:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158728

--000000000000f242d905d18bfc49
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Nov 2021 at 18:11, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

>
> > and shouldn't the tarball be fixed instead?
>
> How should we fix a tarball from npmjs.com?
>

By submitting a bug report or (better) a patch to the maintainers of the
tarball?

Alex

--000000000000f242d905d18bfc49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 24 Nov 2021 at 18:11, Stefan Herbrechtsmeier &lt;<a href=3D"=
mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-o=
ss@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
&gt; and shouldn&#39;t the tarball be fixed instead?<br>
<br>
How should we fix a tarball from <a href=3D"http://npmjs.com" rel=3D"norefe=
rrer" target=3D"_blank">npmjs.com</a>?<br></blockquote><div><br></div><div>=
By submitting a bug report or (better) a patch to the maintainers of the ta=
rball?</div><div><br></div><div>Alex</div></div></div>

--000000000000f242d905d18bfc49--

