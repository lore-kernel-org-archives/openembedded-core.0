Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7BFCA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 02:03:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.55437.1756173818500623388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 19:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsydSTtm;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3258cdb71a4so1433564a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 19:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756173818; x=1756778618; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2sgaDr0vjA9f9z5+AYZouZtUHepzcHH7+LpIsC3Az6E=;
        b=NsydSTtm66T8+5MpY0wNETq63d8ZFl2ugo+vCIGaGdaWI0ErDhusCGa/jxy84cVWTq
         /rTB0zsiDUsI8Q0yEWmJdOn6oM9a6mU+rtGJRAxuvE/WFozUdF5qVTzZ5QKkxWKAjDUp
         hmT7/K5nHYCRGjDV0Zy8UXDH/ShBoykcxxTwKlQpNgx3FbqyNWoeWYmOkBNL7jAD03Kb
         tpiEA4BSuHiNomKmy+LcLRGvcgm7t6zpWj1uJl5/ZxogIy+DGVlmUEXV+YKKYOZJudCC
         zG1kL4vJL3eunMfbbVm5uEhvFvHaBD+OirTIzyISJkvN9xadyZx7fuAuqyKUrNunUG6F
         KrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756173818; x=1756778618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sgaDr0vjA9f9z5+AYZouZtUHepzcHH7+LpIsC3Az6E=;
        b=JqlTbNRxXwLTEGQ8l6SwL/8ulb+iGHJYgtdfSEEBkVGOLu52siVxB/MsDHLXatVITV
         mHBW8lw73fKIRm2tYoC+FhuFyPcjLgOZKnjJjtrO+ECTA6PfQ5vvlky4bBL0ZKpGynB9
         iuJOHgIvjFw0mmzwwbEe5U4J1UNv3PcJGVjWIhfhYExKXB/2ty+Oda4cySueA2R/IDwW
         zrGs8llhsACDCTp+4tlcTiF4yLkCFWwGzhCMtZLm3WXci4Zk24n7xQGFPt+OkieDRVT4
         FGVJ56XX2lSrjmGp03FkyY1O5k0y7isMhv0aHXYS3CbPGGJiUHppXjghya1ERDd1i3AY
         CVVg==
X-Forwarded-Encrypted: i=1; AJvYcCWlj017RjkvNaP2bpoOvM+5yLSDs9znmexjPeMojHHiC7t4LqUjtELj2aE4gaNWTt8gcOhhsBgDLXR8Bx/zXrPijA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzI6SPt9I72zpqSYtEVRlR+asB+eg+Uvps2IzJ6F4zDvWsj/5Mh
	gin+YWtf90OpyW0iRCHU0AxoCdfWnLBRB3soml6Io5e9OUElECZtjyksba80JELjOy9izZL7Q50
	++U4uwnyZToH2wrJFMwL2YcIwRJNtTbk=
X-Gm-Gg: ASbGncs1QLhC6zFXT+I1y51Ih49QQ6eqaTnmLqKP6SvFM2ajKh7a/1ox1ePUGelx8do
	DXSoXlkkukM3ETJjqIu7Mr1hpEhiTAQBiYgsWKDb0gYUUWonuZpTqL25BUowExXTmvWKehNHDMq
	RNAjtBpD/meyArSRpn6EPuuJhYNe2AfEnjbLPA3CEB49ZKTpZVZQYMqA8h/b0UXrcSct7W0hIfv
	Dj0CInzCpnkYMvB0N6dKNch37/3+EYcSHOxqvUhH9dotfh9rJc=
X-Google-Smtp-Source: AGHT+IE97+HGG1LaYcbggytMA/LobAM5OMO8h6vCuSWXOOCRHx9AWjqGa6RJfyv3PVYtFj8DOhSRaj2fHoCONFKh88U=
X-Received: by 2002:a17:90b:3d87:b0:321:59e7:c5ba with SMTP id
 98e67ed59e1d1-32515e4f1f9mr21325497a91.15.1756173817745; Mon, 25 Aug 2025
 19:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755784780.git.bruce.ashfield@gmail.com> <DC92RWVBN7V4.30RLT0SCEWDPC@bootlin.com>
In-Reply-To: <DC92RWVBN7V4.30RLT0SCEWDPC@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Aug 2025 23:03:26 -0300
X-Gm-Features: Ac12FXy-Rz6rzRFfhjnCIFi7SgUOG9ysSXF6Vt8Df3-x-CSLAggiK2U28zJdTJ4
Message-ID: <CADkTA4MVTtjd0bRyVHhS8AiWmN+zw7bj2QZcgoUEhcV9zhHVVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel-yocto: -stable and new reference kernel
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009213df063d3b143e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 02:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222427

--0000000000009213df063d3b143e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 12:52=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Thu Aug 21, 2025 at 4:03 PM CEST, Bruce Ashfield via
> lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's the next set of updates to the linux-yocto kernel.
> >
> > The plan is to introduce 6.16 as the latest reference kernel, and keep
> > 6.12 around (since it is a LTS).
> >
> > This isn't ready to be the default for builds, but it has passed my
> > core-iamge-kernel-dev testing, so I wanted to make the recipes availabl=
e
> > as visibility to where we are headed for the release (plus, I'm out of
> > the office on holidays until the first week of September, so making it
> > the default would be a bad idea from me being able to support issues).
> >
>
> Hi Bruce,
>
> Thanks for the series.
>
> I understand this isn't fully ready, but I did launch a full build
> anyway: most builders succeed, we just have one warning on config
> fragments:
>
> WARNING: linux-yocto-6.16.2+git-r0 do_kernel_configcheck: [kernel config]=
:
> specified values did not make it into the kernel's final configuration:
> ...
> [INFO]: config 'CONFIG_CRYPTO_LIB_CHACHA' was set, but it wasn't
> assignable, check (parent) dependencies
> ...
> [INFO]: config 'CONFIG_CRYPTO_CHACHA20_NEON' was set, but it wasn't
> assignable, check (parent) dependencies
> ...
> [INFO]: the following symbols were not found in the active configuration:
>      - CONFIG_CRYPTO_SHA2_ARM_CE
>      - CONFIG_CRYPTO_CRC32_ARM_CE
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2248


I always find it odd that I can't click on any of the AB tabs (in the link
you sent) and see what the MACHINE value is for that build.

I looked at the writeconfig step of the build and it looks to be qemuarm.
Which is odd, since I'm not seeing the same warning for that here.

When I'm back from holidays next week, I'll have a closer look.

Bruce



>
>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009213df063d3b143e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 22, 2025 at 12:52=
=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bria=
nd@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu Aug 21, 2025 at 4:0=
3 PM CEST, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Richard,<br>
&gt;<br>
&gt; Here&#39;s the next set of updates to the linux-yocto kernel.<br>
&gt;<br>
&gt; The plan is to introduce 6.16 as the latest reference kernel, and keep=
<br>
&gt; 6.12 around (since it is a LTS).<br>
&gt;<br>
&gt; This isn&#39;t ready to be the default for builds, but it has passed m=
y<br>
&gt; core-iamge-kernel-dev testing, so I wanted to make the recipes availab=
le<br>
&gt; as visibility to where we are headed for the release (plus, I&#39;m ou=
t of<br>
&gt; the office on holidays until the first week of September, so making it=
<br>
&gt; the default would be a bad idea from me being able to support issues).=
<br>
&gt;<br>
<br>
Hi Bruce,<br>
<br>
Thanks for the series.<br>
<br>
I understand this isn&#39;t fully ready, but I did launch a full build<br>
anyway: most builders succeed, we just have one warning on config<br>
fragments:<br>
<br>
WARNING: linux-yocto-6.16.2+git-r0 do_kernel_configcheck: [kernel config]: =
specified values did not make it into the kernel&#39;s final configuration:=
<br>
...<br>
[INFO]: config &#39;CONFIG_CRYPTO_LIB_CHACHA&#39; was set, but it wasn&#39;=
t assignable, check (parent) dependencies<br>
...<br>
[INFO]: config &#39;CONFIG_CRYPTO_CHACHA20_NEON&#39; was set, but it wasn&#=
39;t assignable, check (parent) dependencies<br>
...<br>
[INFO]: the following symbols were not found in the active configuration:<b=
r>
=C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_SHA2_ARM_CE<br>
=C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_CRC32_ARM_CE<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/buil=
ds/2248" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/40/builds/2248</a></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">I always find it=
 odd that I can&#39;t click on any of the AB tabs (in the link you sent) an=
d see what the MACHINE value is for that build.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">I looked at the writeconfig step of the build and it=
 looks to be qemuarm. Which is odd, since I&#39;m not seeing the same warni=
ng for that here.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">When I&=
#39;m back from holidays next week, I&#39;ll have a closer look.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Best regards,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009213df063d3b143e--

