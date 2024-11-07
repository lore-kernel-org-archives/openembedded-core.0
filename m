Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DCED43372
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 15:43:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.74965.1730994198570568957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 07:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbA08bxi;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72041ff06a0so911834b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 07:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730994198; x=1731598998; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k+sqJUCm2ipIvBGhIS733G7xBNG6Kh4B6HY+0E3fy4E=;
        b=PbA08bxilTSculadIv8aQm5+4pvfyX1z0iybeJ6RtDeGBGWLz45YsaYOs5ROLDi7vo
         HuLgKXX3OoQ6msZOUMvX9KhG6sFtncgs/tJmFoPrIbHjcbyqUEKQyZTM15LzY/qQPC8x
         lE6afFpl70YviHK1zjsn+vsX/crEvNlfup6m+1zXMMVu+3f4vK17RQ2mLU0ZqzEi1/jP
         W3E8nLeEDpd2ZDcJ1+WrZR4L83FaDmd4RTrAm21O9F10+e3V3e5m2d1lzspY+dpjsusz
         ldxW30ZtHlKL8N8kkrUiu5GVZI8OKmZEYUKfbWVigVCazSsOrqO8/pV0WvcRB3yj13zD
         4kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994198; x=1731598998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+sqJUCm2ipIvBGhIS733G7xBNG6Kh4B6HY+0E3fy4E=;
        b=rxQXZfSokIrV01dnvJXD8Ch21VEB4zi2DvzIcNhM9AbqQNNHOc4bSeGAVIVu2hq7iI
         Sngdahd/T9y+Nj711NdT6StSa9+y/oScCH90LN5W3HQS5UTAeNGt1dJAhYHy0QLS9166
         feGxNjCba50SvcXJeO+/VTfZ3kXN+lskfAtQghl4X55iBrFR5hOv2gMBhkzwYWiSTjZK
         /w+lP6o8m5nvrNS2O1Y2lOc6gfGuOJheUUFlYjBd2bRYwMkZgAvgj8IAaT3Avw1uA/KM
         Hg0eExOwLuuAg5j+S1/HkXpF4jfvamEnkh7xGUEAGDa2qXnS+JING1K1zy3Y78CFRgWZ
         Gh4w==
X-Forwarded-Encrypted: i=1; AJvYcCXCSjrhm33MYG1DGqadepO4STmHMT68P27u8590svbPCXKcsmdKBDWgvWbeASGLasKSJr9/lP8fpzMRjDwLA/ZMOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxhk0gSqWz7Bb9ZbW980MG/gFabWkeX4OodIHp33JBgZPQTV4lX
	MlrZVxHIzaYdEz2zjJ8iXUCnwLAtpnBHeMopoX+GIqEirY724miYY/zMbmYGWhWkm2soDBzG9ZD
	nNy7P5xnLy/Wn6AD+bOOfjBs7I9g=
X-Google-Smtp-Source: AGHT+IHBdgMT5C8TBwrNPvy7hZYznmGvvWNk9PsR9mZBFbUAXODyE3HZJNfhJShJwPl1CQsiDUD2sINFUzFpQlQ6ReQ=
X-Received: by 2002:a05:6a00:84b:b0:71e:f14:869c with SMTP id
 d2e1a72fcca58-720c98834a4mr32965903b3a.6.1730994197775; Thu, 07 Nov 2024
 07:43:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
 <ac12252f5a7d14eda8a14728cf178b93068c99cb.1730946087.git.bruce.ashfield@gmail.com>
 <e17a3c4d-9729-429b-85a1-3086a4e8beae@bootlin.com>
In-Reply-To: <e17a3c4d-9729-429b-85a1-3086a4e8beae@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Nov 2024 10:43:06 -0500
Message-ID: <CADkTA4O+f3dm=4_8CoNSOmCBFMcj7qjaiOtaQhZVQK+DVdyT9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/12] lttng-modules: fix build for 6.12+
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004452060626547e52"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 15:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206839

--0000000000004452060626547e52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 10:31=E2=80=AFAM Joao Marcos Costa <
joaomarcos.costa@bootlin.com> wrote:

> Hello, Bruce
>
> I hope this email finds you well
> On 11/7/24 03:29, Bruce Ashfield wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com> <bruce.ashfield@gmail.com=
>
>
> We backport two fixes from the -stable 2.13 lttng branch
> to fix the build against kernels 6.12+
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com> <bruce.ashfield@=
gmail.com>
> ---
>  ...-uprobe_register-return-struct-uprob.patch | 160 ++++++++++++++++++
>  ...fine-the-show_inode_state-macro-defi.patch |  68 ++++++++
>  .../lttng/lttng-modules_2.13.15.bb            |   2 +
>  3 files changed, 230 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-upro=
bes-make-uprobe_register-return-struct-uprob.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writ=
eback-Refine-the-show_inode_state-macro-defi.patch
>
> (...)
>
> There is a ptest failure in the autobuilder:
>
>
> https://valkyrie.yoctoproject.org/#/builders/73/builds/351/steps/13/logs/=
stdio
>
> This is not the first time this error appears, though.
>
> Still, could you please take a look?
>
I unfortunately can't right now. So just let this patch drop.

Bruce



> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004452060626547e52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 7, 2024 at 10:31=E2=80=AFAM Joao Marcos=
 Costa &lt;<a href=3D"mailto:joaomarcos.costa@bootlin.com">joaomarcos.costa=
@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <p><font face=3D"monospace">Hello, Bruce</font></p>
    <p><font face=3D"monospace">I hope this email finds you well<br>
      </font></p>
    <div>On 11/7/24 03:29, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Bruce Ashfield <a href=3D"mailto:bruce.ashfield@gmail.com"=
 target=3D"_blank">&lt;bruce.ashfield@gmail.com&gt;</a>

We backport two fixes from the -stable 2.13 lttng branch
to fix the build against kernels 6.12+

Signed-off-by: Bruce Ashfield <a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">&lt;bruce.ashfield@gmail.com&gt;</a>
---
 ...-uprobe_register-return-struct-uprob.patch | 160 ++++++++++++++++++
 ...fine-the-show_inode_state-macro-defi.patch |  68 ++++++++
 .../lttng/<a href=3D"http://lttng-modules_2.13.15.bb" target=3D"_blank">lt=
tng-modules_2.13.15.bb</a>            |   2 +
 3 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobe=
s-make-uprobe_register-return-struct-uprob.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeb=
ack-Refine-the-show_inode_state-macro-defi.patch
</pre>
    </blockquote>
    <p><font face=3D"monospace">(...)</font></p>
    <p><font face=3D"monospace">There is a ptest failure in the
        autobuilder:</font></p>
    <p><font face=3D"monospace"><a href=3D"https://valkyrie.yoctoproject.or=
g/#/builders/73/builds/351/steps/13/logs/stdio" target=3D"_blank">https://v=
alkyrie.yoctoproject.org/#/builders/73/builds/351/steps/13/logs/stdio</a></=
font></p>
    <p><font face=3D"monospace">This is not the first time this error
        appears, though.<br>
      </font></p>
    <p><font face=3D"monospace">Still, could you please take a look?</font>=
</p></div></blockquote><div><div class=3D"gmail_default" style=3D"font-size=
:small"></div><div class=3D"gmail_default" style=3D"font-size:small">I unfo=
rtunately can&#39;t right now. So just let this patch drop.=C2=A0</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <pre cols=3D"72">--=20
Best regards,
Jo=C3=A3o Marcos Costa</pre>
  </div>

</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000004452060626547e52--

