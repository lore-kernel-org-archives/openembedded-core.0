Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A9AC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 13:04:13 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.8580.1746623050692282632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 06:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTviihQj;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so4396327a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746623050; x=1747227850; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FrX7XkSpHn28cQ30LPYLbP3Or+FdNTEf6jBaX7ycqPs=;
        b=HTviihQj7AJpmXLVTFOBUGlkFA+xeNt0CLuaWA/9POFnQ0FKoXepJ4RXbII28KM/10
         CNyfWGa3JpWADziLPpGqv2mWUbLlHnO1dwABANc9Gc61OMjfsFiJe2UT9pcX5+5Bizpb
         icV5zqX8HQhAxZPoJVQlWiUq73KprOnMhPmBUH9aw9HwscrraDtwmeJjixDdIOvq3cOk
         ZMBckkAnWGyCX5zJOJZMGl9S0fj7LV2XmjZmeX57XBuRQwDDJAMHxu0fMFC4Q7iiFlPr
         /7ye000d8fOepjxqcGIAUgtC7c76cIBhW3/EdIHYBorl5ouJPb8QKNqAr8zdEE6QV18G
         D0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623050; x=1747227850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrX7XkSpHn28cQ30LPYLbP3Or+FdNTEf6jBaX7ycqPs=;
        b=btV7IW8ND3erYpuv9WAloncYcwUwF03Yf+VeMHB5SIcelyWbb5hsHOZ4oW/EdQgG0B
         xlCwIpfrZigR4DL7KBISYnJI7FAA5FPPRZeQtTaAF+e0DaUpOOPZ7xM0Q8FMI3dT67WF
         FrXaSb5ELocTSxEJSrece85EqUFyYtPEj5km9tyID4aAwWCaTU8oJ9zVGutT2fDA9luS
         J0cB1I2i5mCcOLjhgJZnR6elIOIwW98seXjF1cpb7bXO6vFFPjo1RdFrU/pI13gHn685
         pl/zFXqKdUU+ChI7B/7jBZMILf/OcXfi5aCjxx6plVueccfJnWMftc+oo4zMTynqUBgl
         Q2hg==
X-Forwarded-Encrypted: i=1; AJvYcCW8H8JoPQexrRttNtJadI+cpOH/GOVtlDs2w48hX/nFKqqQphv7uA0IqfPBcTGSfOJwe0S0htJUHMzJL2AEZt9DjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHWxPYEJLmYQjcrDovoKRA5enWhdAD93dgodIGUNW40SaHNyb7
	LNbVMB5xdu8nJoJsCEz0kWS4Di+r3MjkDNQZIR88nDivHk043nPTLTQalZXQLy3Pd+7fUfwyHFA
	lgxiLbwwZNs5AEsl6xffyAECsN4hGnSwc
X-Gm-Gg: ASbGncugHUQI96uV0X/PwhygeE78rkwHj5a6fVGEg2ugzCmyqVHD8JfAwxwKaFXertR
	ZzSC8dgI6wR4UQC4UdiBmkEk9V8YG6UNlYBTK6hH8gRusvv6hID5VS0rlG7kq5kiNP+D9PUaloC
	i3Cp2Sw6FsTlkpE7XeyFmRbJE=
X-Google-Smtp-Source: AGHT+IGCrwvWRLCSVKP0R5X2vkKKe+m2W3P8IBAZ9Q1CJaZkNc0ws10lGBBlPIX9ic3eMa7etXvd+K6HvHsiyp26NJs=
X-Received: by 2002:a17:90b:3b8f:b0:2f9:bcd8:da33 with SMTP id
 98e67ed59e1d1-30aac1bf94amr4584598a91.21.1746623049657; Wed, 07 May 2025
 06:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
 <D9PRCP2WLN68.1VIO3IX3SQ7IH@bootlin.com> <183D2FC291E34522.16348@lists.openembedded.org>
 <161efc5b043277d6ca648087f9e6fcab9f72981d.camel@linuxfoundation.org> <aBtGeJH-y1Je42G0@nuoska>
In-Reply-To: <aBtGeJH-y1Je42G0@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 May 2025 09:03:58 -0400
X-Gm-Features: ATxdqUG5thjIn3lPL4CnmAs5BXEXgk48pGo4sA5BoW0r0vGfWlP8WTZrnDp9uac
Message-ID: <CADkTA4Mox1sZaaHYsW7PzqVWrUC3Bkje1h4XfOV8LwNdSfwmPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] kernel-yocto: consolidated pull request
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: richard.purdie@linuxfoundation.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e717a06348b5ebf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 13:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216109

--0000000000006e717a06348b5ebf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 7:39=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:

> Hi,
>
> On Wed, May 07, 2025 at 12:18:03PM +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2025-05-07 at 08:58 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2025-05-07 at 09:42 +0200, Mathieu Dubois-Briand wrote:
> > > > On Tue May 6, 2025 at 6:32 PM CEST, Bruce Ashfield via
> > > > lists.openembedded.org wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > Hi Richard,
> > > > >
> > > > > Now that I'm back at my desk, here are the queued -stable,
> > > > > configuration
> > > > > and feature changes that I have queued.
> > > > >
> > > > > I'll be sending -stable updates to the LTS branches as well.
> > > > >
> > > > > Note: once patch #1 is in the tree and doesn't need any more
> > > > > tweaks, I'll
> > > > > send a documenation update. This is the patch that we need to
> > > > > enable the
> > > > > modular initrd work in kernel-yocto references.
> > > >
> > > > I took this series in my branch and everything seems to be fine so
> > > > far,
> > > > except for a warning:
> > > >
> > > > WARNING: linux-yocto-tiny-6.12.27+git-r0 do_kernel_configcheck:
> > > > [kernel config]: specified values did not make it into the kernel's
> > > > final configuration:
> > > >
> > > >     [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and .config
> > > > val (n) do not match
> > > >     [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
> > > >
> > > >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1565
> > >
> > > There are a few, it likely depends which build built a component
> > > first.
> > > I think there are three groups of failures, I've listed them all for
> > > completeness:
> > >
> > > Another qemuarm poky-tiny:
> > >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/50/builds/1564
> > > qemuarm:
> > >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/16/builds/1563
> > > qemuarm-alt:
> > >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/74/builds/1532
> > > qemuarm nodistro:
> > >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/1531
> > >
> > >
> > > lttng-tools ptest failure:
> > >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1445
> >
> > The ptest failure didn't appear on a second run so it is an
> > intermittent AB issue rather than anything specific to this patch
> > series.
>
> So it looks like missing CRYPTO_LIB_CHACHA_INTERNAL=3Dm with
> CRYPTO_CHACHA20_NEON=3Dm is the only problem on qemuarm
> and genericarm64
>
> I can send a patch if Bruce doesn't already have this.
> I wonder where this came from since I did not see this before.
> Maybe in the point release updates?
>

I see your patch. Thanks!

I'll do a bit of root cause analysis when applying it shortly. I obviously
didn't
see it either in my local builds.

Bruce



>
> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006e717a06348b5ebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 7, 2025 at 7:39=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Wed, May 07, 2025 at 12:18:03PM +0100, Richard Purdie via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> wrote:<br>
&gt; On Wed, 2025-05-07 at 08:58 +0100, Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; On Wed, 2025-05-07 at 09:42 +0200, Mathieu Dubois-Briand wrote:<b=
r>
&gt; &gt; &gt; On Tue May 6, 2025 at 6:32 PM CEST, Bruce Ashfield via<br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Hi Richard,<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Now that I&#39;m back at my desk, here are the queued -=
stable,<br>
&gt; &gt; &gt; &gt; configuration<br>
&gt; &gt; &gt; &gt; and feature changes that I have queued.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I&#39;ll be sending -stable updates to the LTS branches=
 as well.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Note: once patch #1 is in the tree and doesn&#39;t need=
 any more<br>
&gt; &gt; &gt; &gt; tweaks, I&#39;ll<br>
&gt; &gt; &gt; &gt; send a documenation update. This is the patch that we n=
eed to<br>
&gt; &gt; &gt; &gt; enable the<br>
&gt; &gt; &gt; &gt; modular initrd work in kernel-yocto references.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I took this series in my branch and everything seems to be f=
ine so<br>
&gt; &gt; &gt; far,<br>
&gt; &gt; &gt; except for a warning:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; WARNING: linux-yocto-tiny-6.12.27+git-r0 do_kernel_configche=
ck:<br>
&gt; &gt; &gt; [kernel config]: specified values did not make it into the k=
ernel&#39;s<br>
&gt; &gt; &gt; final configuration:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 [NOTE]: &#39;CONFIG_CRYPTO_CHACHA20_NEON&=
#39; last val (y) and .config<br>
&gt; &gt; &gt; val (n) do not match<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/b=
uilders/50/builds/1565" rel=3D"noreferrer" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/valkyrie/#/builders/50/builds/1565</a><br>
&gt; &gt; <br>
&gt; &gt; There are a few, it likely depends which build built a component<=
br>
&gt; &gt; first.<br>
&gt; &gt; I think there are three groups of failures, I&#39;ve listed them =
all for<br>
&gt; &gt; completeness:<br>
&gt; &gt; <br>
&gt; &gt; Another qemuarm poky-tiny:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/build=
ers/50/builds/1564" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/?#/builders/50/builds/1564</a><br>
&gt; &gt; qemuarm:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/build=
ers/16/builds/1563" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/?#/builders/16/builds/1563</a><br>
&gt; &gt; qemuarm-alt:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/build=
ers/74/builds/1532" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/?#/builders/74/builds/1532</a><br>
&gt; &gt; qemuarm nodistro:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/build=
ers/40/builds/1531" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/?#/builders/40/builds/1531</a><br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; lttng-tools ptest failure:<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/build=
ers/61/builds/1445" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/?#/builders/61/builds/1445</a><br>
&gt; <br>
&gt; The ptest failure didn&#39;t appear on a second run so it is an<br>
&gt; intermittent AB issue rather than anything specific to this patch<br>
&gt; series.<br>
<br>
So it looks like missing CRYPTO_LIB_CHACHA_INTERNAL=3Dm with<br>
CRYPTO_CHACHA20_NEON=3Dm is the only problem on qemuarm<br>
and genericarm64<br>
<br>
I can send a patch if Bruce doesn&#39;t already have this.<br>
I wonder where this came from since I did not see this before.<br>
Maybe in the point release updates?<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">I see your patch. Thank=
s!</div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I&#39;ll do a bit of root cause analysis when applying it shortly. I obv=
iously didn&#39;t</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">see it either in my local builds.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000006e717a06348b5ebf--

