Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E41CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:31:00 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.12696.1758875451644675458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b2cp8laS;
 spf=pass (domain: smile.fr, ip: 209.85.167.54, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so2116077e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758875449; x=1759480249; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jwKD//4YrzWXvmujp5QhMgcKzDyW0n/6Q2kikjiZdYw=;
        b=b2cp8laSdtsHbEQWU0cTNoKrcPwCeXvCikdzQg0AjoCD7yZsh/BDvQ1Lfw1wjGIHIa
         eHelzPHbMdJKZkfZ/G59tRZeShFhhQKUK8VEua7q1rXjbH0kXaaFSCdMhMWm7Ui+/BQO
         bf9rcO+t1wWPls4nuqw83MyD65BxjfnE3mtXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758875449; x=1759480249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwKD//4YrzWXvmujp5QhMgcKzDyW0n/6Q2kikjiZdYw=;
        b=cfFiVXmKRZ0awyAhlCC8VfqP6KgxzrJAiRgv/tbvkt4d7xMkLU/7T+LzR1l9P46FiA
         KUG9nQTOw+O192sZ6UPlI4wk+jZThLLDLMJSjceH7MDUlFcAWXoViOlkGWFzwys5n6V2
         qkiE0D2npkTevyLCH+rrAsIjmgBPQ86wjTbjVt+LzOUZ7jb7BZVz0YJTZZjKjU1FVPJT
         PLNFU5uPGrRP86ehOssajdsCrYGTIBHR9kJgO9MSIDhHAPXfbe6hqOm5rYYSxVwR7/c3
         Ud8znx63CxSaoetTJwiKFRIdt0sEx7EQ5KNC/W5DhCfQdGnEy+OE4DF1v9IfOJD05+3Y
         cZYA==
X-Forwarded-Encrypted: i=1; AJvYcCUozObGhXKhky0ED1LtjP38XtoevgdDILAL8owu+tRClSR7KV2mBltP+dHtpCMLOe5eRQJyJKIytBQ9U3PtaCRY/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyyFIVecpRkA5Apvp/LsqjLJZyal4qm6wAcf5uWu4rZgzqLMl2P
	XmUh/ITRI7i6XRhSbe83eTj95lkXDgXlVX1t+z9UfDKw6Yqp6QveWCkb3Mz3+0CcM21DxemPCSC
	PsIbu1fQ5bTaMbsDMc/FaCI+SuWw0mqpoFxaaiCpNBA==
X-Gm-Gg: ASbGncsJ/nZ7+aihW0YJJnWFNKDoVVMRNsg2DLYbpiYUh1Xdlkigtq+D+UtRdIDPoMu
	ZoaFmvvAe0LZgkk7LUxtxXYyYf7n5iLU9popKzYv92wF1P6frCJvaVxSjYDmlV20/mGQ5yKtnd6
	UiHQCknEeK799HqCb8b4/FlEnBo/x9WHRp0djtVC2DmclmUmXwAuQilUzhfSvzT5yBLxM92YSHY
	DiRhmw=
X-Google-Smtp-Source: AGHT+IHiWs2Dl8XMUcMstMs0y0anuK7wKj2/kmSkBwV1tN/bI6hHzTvJjkBkqqe9E/m/Rml8UPIWMFCY3vYYs0UJYXM=
X-Received: by 2002:a05:6512:1048:b0:55f:62c1:c0b6 with SMTP id
 2adb3069b0e04-582d406d3cfmr1988236e87.55.1758875448921; Fri, 26 Sep 2025
 01:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
 <20250925072203.3490596-2-pierre-loup.gosse@smile.fr> <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
 <CANNYZj9PfFUcESHwT_6-CzDw8QB30hva_o5V2gVX5uB+LjaOng@mail.gmail.com>
 <CAHT-cZtsPnCk3_6-48D3uRJbVxmexjeSayhphzCWm_OTraQR4A@mail.gmail.com>
 <6371e7d1-1d57-4b6a-bb6d-eb3ce0f0ba9d@berginkonsult.se> <CAHT-cZtr-en6sc7JaPfN9s7BFbwiV+iGrv9rQDKjr8rcXSpWFA@mail.gmail.com>
 <DD1ZE7G2YIZ9.L1KYBCLSDBU@bootlin.com>
In-Reply-To: <DD1ZE7G2YIZ9.L1KYBCLSDBU@bootlin.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Fri, 26 Sep 2025 10:30:37 +0200
X-Gm-Features: AS18NWDavgvZJ5FHT0_nWUUuUJE-PVSHYteM5tC9gHvhgU5maHenNSpWuF_i8kI
Message-ID: <CAHT-cZt1irm11OpSp_rM-RoWxDA7+VgpsWwH=CL-=XFiXiwv1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] wic: extra partition plugin
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Peter Bergin <peter@berginkonsult.se>, 
	yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000566258063fb01a15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 08:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224064

--000000000000566258063fb01a15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Why not install all the files in IMAGE_ROOTFS in a single image, then do
> the
> filtering in the WKS?


This isn=E2=80=99t a suitable solution if you don=E2=80=99t want the files =
included in the
rootfs image initially. Perhaps my earlier description wasn=E2=80=99t clear=
, let me
clarify with a practical example.
I use SWUpdate to update the rootfs and business software separately. The
business software shouldn't be part of the rootfs, as it would otherwise be
bundled into the rootfs SWU package. However, I still need to install it in
the output WIC image, specifically in an 'app' partition, and update it
later via the app SWU package.

Based on the bootimg_partition plugin, I wrote this plugin to handle these
extra files, that aren't part of the rootfs but are fetched and deployed in
the DEPLOY_DIR_IMAGE.

Pierre-Loup,



On Thu, Sep 25, 2025 at 5:20=E2=80=AFPM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> On Thu Sep 25, 2025 at 2:43 PM CEST, Pierre-loup GOSSE via
> lists.openembedded.org wrote:
> >>
> >> in the past I have used to rootfs plugin with '--exclude-path' [1] and
> >> '--change-directory' [2] assuming that I have isolated all files going
> in
> >> to the extra partition in to one directory of rootfs.
> >
> > This is a solution when files are installed in the rootfs but need to b=
e
> > split across multiple partitions.
> >
> > However, some files aren't or shouldn=E2=80=99t be in the rootfs. For i=
nstance,
> > I=E2=80=99ve worked on boards requiring a dedicated VFAT partition just=
 for the
> > U-Boot script. Other use cases include keeping business software separa=
te
> > from the rootfs, especially when they are installed and updated
> > independently (with a SWU package).
> > Pierre-Loup,
>
> Why not install all the files in IMAGE_ROOTFS in a single image, then do
> the
> filtering in the WKS?
>
> What I do is:
>
>   part rootfs --source rootfs --fstype=3Dext4 --exclude-path=3Ddata/ ...
>   part data --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/data ...
>
> In this case the rootfs partition will not include the files in /data, an=
d
> the
> data partition will include them.
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000566258063fb01a15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Why not =
install all the files in IMAGE_ROOTFS in a single image, then do the<br>
filtering in the WKS?</blockquote><div><br></div><div><p class=3D"gmail-whi=
tespace-break-spaces">This isn=E2=80=99t a suitable solution if you don=E2=
=80=99t want the files included in the rootfs image initially. Perhaps my e=
arlier description wasn=E2=80=99t clear, let me clarify with a practical ex=
ample.</p>I use SWUpdate to update the rootfs and business software separat=
ely. The business software shouldn&#39;t be part of the rootfs, as it would=
 otherwise be bundled into the rootfs SWU package. However, I still need to=
 install it in the output WIC image, specifically in an &#39;app&#39; parti=
tion, and update it later via the app SWU package.</div><div><br></div><div=
>Based on the bootimg_partition plugin, I wrote this plugin to handle these=
 extra files, that aren&#39;t part of the rootfs but are fetched and deploy=
ed in the DEPLOY_DIR_IMAGE.</div><div><br></div><div>Pierre-Loup,</div><div=
><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Sep 25, 2025 at 5:20=E2=80=AFPM Antonin G=
odard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"_blank">a=
ntonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Thu Sep 25, 2025 at 2:43 PM CEST, Pierre-loup G=
OSSE via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;<br>
&gt;&gt; in the past I have used to rootfs plugin with &#39;--exclude-path&=
#39; [1] and<br>
&gt;&gt; &#39;--change-directory&#39; [2] assuming that I have isolated all=
 files going in<br>
&gt;&gt; to the extra partition in to one directory of rootfs.<br>
&gt;<br>
&gt; This is a solution when files are installed in the rootfs but need to =
be<br>
&gt; split across multiple partitions.<br>
&gt;<br>
&gt; However, some files aren&#39;t or shouldn=E2=80=99t be in the rootfs. =
For instance,<br>
&gt; I=E2=80=99ve worked on boards requiring a dedicated VFAT partition jus=
t for the<br>
&gt; U-Boot script. Other use cases include keeping business software separ=
ate<br>
&gt; from the rootfs, especially when they are installed and updated<br>
&gt; independently (with a SWU package).<br>
&gt; Pierre-Loup,<br>
<br>
Why not install all the files in IMAGE_ROOTFS in a single image, then do th=
e<br>
filtering in the WKS?<br>
<br>
What I do is:<br>
<br>
=C2=A0 part rootfs --source rootfs --fstype=3Dext4 --exclude-path=3Ddata/ .=
..<br>
=C2=A0 part data --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/data ...<br=
>
<br>
In this case the rootfs partition will not include the files in /data, and =
the<br>
data partition will include them.<br>
<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000566258063fb01a15--

