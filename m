Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DF2EB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 11:31:33 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.6005.1689247885250814565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 04:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hJHSF+Qk;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-794b8fe8cc4so1275355241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689247884; x=1691839884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ux/gRIYgVRrlv9COS50x2oQMHgQtOJo7bUmp9BLe+K0=;
        b=hJHSF+Qklr5zM42L9xD4YJG2+0KP6CYmxnJ6fEEx4aBw1PPBHaUFJfMXXoR4/05EkS
         wNlvabZj1Slzct72JvYFyQj3jl8ail0ayJQl/KB5a2F/ptqTlgm2fGnbS2ByI3t1PC5E
         1dg6fSmLCHiG3qlK1IVYD2bf92+Myv8SuDvTTM5M6M960coHdxTBVQ5ftbbZauCbTs0T
         gGFLJUiGXQ1EANZ+IFhzH4Pcigro8gMaP+SqLWkOzsQSkQAXvan2U7KzPqeIZT7ckKDz
         82LH8vF+tbYjirdsh3oiVN4hsF3f9/98mWA+foqsyKJJ1TViojgi6VvRN226SRvx9LCD
         CQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689247884; x=1691839884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux/gRIYgVRrlv9COS50x2oQMHgQtOJo7bUmp9BLe+K0=;
        b=OVzO7E2OqdsCN/fexbwcSKUhmo2H1ZuCEXvllMXYpqIAjRhuHlUSFJ2wmiUsEn2f9P
         CgUkGuVN9NlNnunlg9d59D0hce/y5mLI0u7qwK9ljLiUJz+9uoEzRXRmWyuhJ+8e2Vc5
         WXgFw7Me1ZvCYEEWh+g6TGQKZ/yMI/INJ0gn1pa9fo1v+iDh8CBSp0lMerwpLCQMDSbA
         ksY/8a7THpgxtY3ScG+WRLagHunuM6FR1vy8KRtLvuoZdJ6PV/2J3ABFUirmT4EO75M3
         bQxZ+SbnuNjV0TnskHQgsYbWIO9n9zTMpQZGETCZsUkMTwx2Wuk9tj/cngNn537LzgOC
         I0eQ==
X-Gm-Message-State: ABy/qLZ7fmK9ug59uv72gGjtPHJ5iugQZFkimPW3a7d0tIB1C7MxSBlg
	oG+Y6JAY9tG/LXdwu6Tv4mwdDBMkmL4Efa2JS3Y=
X-Google-Smtp-Source: APBJJlH4TCA9TvjqcLfAAUTpRz5JuGgwlkPikQdGWCWPCkqfcbHDYT0jV/xGAWfoU0CZlWbUyVZA6HsRcawLT1rMA/0=
X-Received: by 2002:a05:6102:292c:b0:443:8053:f969 with SMTP id
 cz44-20020a056102292c00b004438053f969mr1496271vsb.17.1689247884038; Thu, 13
 Jul 2023 04:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230713110244.3169513-1-jose.quaresma@foundries.io>
 <20230713110244.3169513-2-jose.quaresma@foundries.io> <3f44bb222d7ad35fb14e8bee4832311915b1ff10.camel@linuxfoundation.org>
In-Reply-To: <3f44bb222d7ad35fb14e8bee4832311915b1ff10.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 13 Jul 2023 12:31:13 +0100
Message-ID: <CANPvuRkGTf6GipNuRqHbnuNhQQe34pTb19_P1UG1wGLPffCZ5w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] sstatesig: do_image_complete needs to run
 with pseudo disbale
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000010d90406005cacfe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 11:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184243

--00000000000010d90406005cacfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
13/07/2023 =C3=A0(s) 12:11:

> On Thu, 2023-07-13 at 11:02 +0000, Jose Quaresma wrote:
> > sstate_report_unihash function from sstate.bbclass needs to
> > run with pseudo disbaled when running do_image_complete task.
> > This is because it have the deploy content with uid and gid
> > of the user that run bitbake on the build machine.
> >
> > By default the creation of sstate is skiped in the task do_image_comple=
te
> > in the image.bbclass using SSTATE_SKIP_CREATION:task-image-complete=3D1
> > so the issue is not triggered.
> >
> > There are some situation when is useful to store the image artifacts on
> the
> > sstate cache for future reuse and speedup the build without need to
> pruduce
> > the same image again. These cases are especially useful in the case of
> the
> > initramfs images used by the kernel.
> >
> > The issue can be reproduced in oe-core with:
> >  echo "SSTATE_SKIP_CREATION:task-image-complete =3D '0'" >>
> meta/recipes-core/images/core-image-minimal-initramfs.bb
> >  bitbake core-image-minimal-initramfs -C do_image_complete
>
> I can see why you've done this but I have a lot of worries about adding
> code for use cases we don't support.
>
> If we do this in too many places the code just becomes unmaintainable
> as we have no idea how it is being used. I'll merge patches which break
> things, then we'll get patches to fix that and break something else
> someone relies upon and things will turn into a mess.
>
> I really don't know what to do with such patches :(
>

I can try another approaches to not change the default behavior:

Inside the python sstate_report_unihash of the sstate bbclass
I can get the SSTATE_SKIP_CREATION and if it is not set (disabled) and the
task is
do_image_complete we explicitly set the PSEUDO_DISABLED to run
the report_unihash.

Is something like that more acceptable? or is better to keep things like
that in distro layers.

Thanks for your time.

Jose


> Cheers,
>
> Richard
>
>
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000010d90406005cacfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 13/07/2023 =C3=A0(s) 12:11:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Thu, 2023-07-13 at 11:02 +0000, =
Jose Quaresma wrote:<br>
&gt; sstate_report_unihash function from sstate.bbclass needs to<br>
&gt; run with pseudo disbaled when running do_image_complete task.<br>
&gt; This is because it have the deploy content with uid and gid<br>
&gt; of the user that run bitbake on the build machine.<br>
&gt; <br>
&gt; By default the creation of sstate is skiped in the task do_image_compl=
ete<br>
&gt; in the image.bbclass using SSTATE_SKIP_CREATION:task-image-complete=3D=
1<br>
&gt; so the issue is not triggered.<br>
&gt; <br>
&gt; There are some situation when is useful to store the image artifacts o=
n the<br>
&gt; sstate cache for future reuse and speedup the build without need to pr=
uduce<br>
&gt; the same image again. These cases are especially useful in the case of=
 the<br>
&gt; initramfs images used by the kernel.<br>
&gt; <br>
&gt; The issue can be reproduced in oe-core with:<br>
&gt;=C2=A0 echo &quot;SSTATE_SKIP_CREATION:task-image-complete =3D &#39;0&#=
39;&quot; &gt;&gt; meta/recipes-core/images/<a href=3D"http://core-image-mi=
nimal-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">core-image-minimal=
-initramfs.bb</a><br>
&gt;=C2=A0 bitbake core-image-minimal-initramfs -C do_image_complete<br>
<br>
I can see why you&#39;ve done this but I have a lot of worries about adding=
<br>
code for use cases we don&#39;t support.=C2=A0<br>
<br>
If we do this in too many places the code just becomes unmaintainable<br>
as we have no idea how it is being used. I&#39;ll merge patches which break=
<br>
things, then we&#39;ll get patches to fix that and break something else<br>
someone relies upon and things will turn into a mess.<br>
<br>
I really don&#39;t know what to do with such patches :(<br></blockquote><di=
v><br>I can try another approaches to not=C2=A0change=C2=A0the default beha=
vior:<br><br></div><div>Inside the python sstate_report_unihash of the ssta=
te bbclass</div><div>I can get the SSTATE_SKIP_CREATION and if it is not se=
t (disabled) and the task is</div><div>do_image_complete we explicitly set =
the=C2=A0PSEUDO_DISABLED to run</div><div>the=C2=A0report_unihash.<br><br><=
/div><div>Is something like that more acceptable? or is better to keep thin=
gs=C2=A0like that in distro layers.<br><br>Thanks=C2=A0for your time.</div>=
<div><br>Jose<br><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000010d90406005cacfe--

