Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75629C369C2
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 00:48:43 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.6665.1745196514001301363
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 17:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BEvRMDLM;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30549dacd53so2686492a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 17:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745196513; x=1745801313; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k8fzMs8Yb/Yte1JVVFTQVk0Muuu3Mg9Xd/2qJvdVdak=;
        b=BEvRMDLM8xSplf6ofxu4pCcJpp9t46FOdO0jPu9N/zNE1B9qYyPPOVHEaghQx7Y7tj
         kwXSdJ/+bRvGJN4BVaNSZYDGxsu3B3PQo/L53CXBNTWFjdI1G1n7OwmQhpXhKaD9bQtF
         AsZjOJZ6c6aeA1za1Rc9BFPCfOOIECWiIjM/+dYQ2huWLMmTMUG0kbfVBEWE7dduXYx/
         mr+vu8t5E3fAQd0u4poOj3fLNg4ps8TT69uTtQfuQeuQiaqOUAcoz8q3D2t/y9CYBaso
         DMyhe51j937qRF/cuwkk0A9wlqEq5l7A/kUt/2eJyNTMe4BQ4EwAYRJnCgSPnIyf6Crw
         Zqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745196513; x=1745801313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8fzMs8Yb/Yte1JVVFTQVk0Muuu3Mg9Xd/2qJvdVdak=;
        b=adYOBiMhCfZ53nRXrbhLOpaaIuos0DZezfiuRlYlrzLDXOJVj9oFQOtHuz6AIHIC7q
         lJzaE4UqVI209LtenXEtx0iDbsmNY7YFlq2eW63ZOFQfO3xmUV1sOA7NdSVmG3OeQoo2
         IwPtBpv0QzLuCtwDYi9vZSm4Jnf9nYeAmZixMCYt4sVH35a6775FpcBhSvqu+DCNwgH+
         /hcdPT8JQzgSlcZuvq463aphcwJ+jqjQ4p2YEpcQYG0f0XX9mu1Is8Wx/fAJGizIF8Mc
         SpskATJthWjEUYYMnh6+G2Y1eX+SzROpKF/Nw928jxVzg7SrTFIOJ1ol+aKivlj60LaJ
         1oHw==
X-Gm-Message-State: AOJu0Yxtjrw1+/FjBAtYQ5uvLzjT2xHPrjiM7v+0NzBrU8od0hJOSjBY
	bw7kF86Rk4tyI0Oy07vuh01ictU0c0AaM29rjov9+hhSZnnSrLfktdMPvG2WEx9TXnvLWnUw/bx
	4bPRnKH8ZHVT5+I8eGZrN7JfqJLA=
X-Gm-Gg: ASbGncuFD+GYNaVKRxccsrutVsxAF+i4fdQfOhpFgvSQ0UVJkDhJPS83sYszK5XApZR
	gEer+OZtqJaG9ORkFX49rBHS79yUAgK87cF8uWW70zW4x9B/DHvWlU8GxfeJLFQdRvtwCrSGUhS
	sptdUZVXPsq4NzGU/G+t3d7g==
X-Google-Smtp-Source: AGHT+IFaeB1iESw0WCs6JBBt0QL0SHdpWjfLDKrPp28atMqRdoTiNyGMDDirhjc2cTbMhh/6Zb2/Ry2ZUndCrxScnWM=
X-Received: by 2002:a17:90b:5608:b0:2fa:1c09:3cee with SMTP id
 98e67ed59e1d1-30879bc43b7mr15284826a91.9.1745196508541; Sun, 20 Apr 2025
 17:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
 <0da9657f7a33ece23b31415e225e099964fef5b2.camel@linuxfoundation.org>
 <CADkTA4PXD8V0TzJ0aDwxWnfzbjYqcSmgBRFyuqEcHXcizD4jUA@mail.gmail.com> <1a38737d7724ece0dd22637a85fc1151d8919cea.camel@linuxfoundation.org>
In-Reply-To: <1a38737d7724ece0dd22637a85fc1151d8919cea.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 20 Apr 2025 20:48:17 -0400
X-Gm-Features: ATxdqUFfEPgbonftXi1c1z_gLpUWlOpEA2DIR5krV-7KpgWjNDwyRbvFRJmIofQ
Message-ID: <CADkTA4O7Ejia1StPDH7HfOn+nV=wcz4q+ECF+d21s2-rV+BnfA@mail.gmail.com>
Subject: Re: [OE-core] 0/2] linux-yocto: -stable and config changes (for
 current release)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f4783606333f39c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 00:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215163

--000000000000f4783606333f39c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 6:05=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2025-04-20 at 17:51 -0400, Bruce Ashfield wrote:
> > On Sun, Apr 20, 2025 at 4:58=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2025-04-18 at 15:54 -0400, bruce.ashfield@gmail.com wrote:
> > > > This is the iommu configuration change you were waiting for, but
> > > > I
> > > > had already updated to 6.12.23, so that -stable change is coming
> > > > along with the meta/cfg update to pickup the configuration.
> > > >
> > > > If there are any issues with the -stable update, I can attempt to
> > > > jiggle the patches such that the cfg: iommu patch brings along
> > > > the
> > > > 6.12.23 kver bump, but not the actual -stable update itself. The
> > > > -
> > > > stable would then follow later without an associated meta data
> > > > update.
> > > >
> > > > But since that is a manual operation, I wanted to send the
> > > > patches
> > > > as-is and let's see how they do on the AB.
> > >
> > > Thanks, I'm not too worried about the kernel version bump but there
> > > was
> > > an issue in testing with poky-tiny which looks related to the
> > > config
> > > change:
> > >
> > >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1422
> > > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2099421/raw
> > >
> > Indeed. Where this has moved is missing some of the dependencies so
> > the allnoconfig of -tiny is missing the value and hence the warning.
> >
> > Is that config qemux86 -tiny ?
>
> It is, yes.
>
> > I'll start a build and see what I can do.
>
> Thanks, I'm hoping you can spot the issue easily enough! It would no
> doubt take me a long while...

I'm seeing it locally now, with any luck I'll have a patch done before you
are up again on Monday.

Bruce


>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f4783606333f39c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 20, 2025 at 6:05=
=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Sun, 2025-04-20 at 17:51 -04=
00, Bruce Ashfield wrote:<br>
&gt; On Sun, Apr 20, 2025 at 4:58=E2=80=AFAM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Fri, 2025-04-18 at 15:54 -0400, <a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a> wrote:<br>
&gt; &gt; &gt; This is the iommu configuration change you were waiting for,=
 but<br>
&gt; &gt; &gt; I<br>
&gt; &gt; &gt; had already updated to 6.12.23, so that -stable change is co=
ming<br>
&gt; &gt; &gt; along with the meta/cfg update to pickup the configuration.<=
br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; If there are any issues with the -stable update, I can attem=
pt to<br>
&gt; &gt; &gt; jiggle the patches such that the cfg: iommu patch brings alo=
ng<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; 6.12.23 kver bump, but not the actual -stable update itself.=
 The<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; stable would then follow later without an associated meta da=
ta<br>
&gt; &gt; &gt; update.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; But since that is a manual operation, I wanted to send the<b=
r>
&gt; &gt; &gt; patches<br>
&gt; &gt; &gt; as-is and let&#39;s see how they do on the AB.<br>
&gt; &gt; <br>
&gt; &gt; Thanks, I&#39;m not too worried about the kernel version bump but=
 there<br>
&gt; &gt; was<br>
&gt; &gt; an issue in testing with poky-tiny which looks related to the<br>
&gt; &gt; config<br>
&gt; &gt; change:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/50/builds/1422" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/valkyrie/#/builders/50/builds/1422</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/l=
ogs/2099421/raw" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octoproject.org/valkyrie/api/v2/logs/2099421/raw</a><br>
&gt; &gt; <br>
&gt; Indeed. Where this has moved is missing some of the dependencies so<br=
>
&gt; the allnoconfig of -tiny is missing the value and hence the warning.<b=
r>
&gt; <br>
&gt; Is that config qemux86 -tiny ?<br>
<br>
It is, yes.<br>
<br>
&gt; I&#39;ll start a build and see what I can do.<br>
<br>
Thanks, I&#39;m hoping you can spot the issue easily enough! It would no<br=
>
doubt take me a long while...<span class=3D"gmail_default" style=3D"font-si=
ze:small"></span></blockquote><div><span class=3D"gmail_default" style=3D"f=
ont-size:small"></span></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">I&#39;m seeing it locally now, with any luck I&#39;ll have a patch=
 done before you are up again on Monday.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000f4783606333f39c6--

