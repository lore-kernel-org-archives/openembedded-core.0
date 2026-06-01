Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED78CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:57:50 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29400.1780322262645101548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 06:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aQoeSr1f;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cceaacd07bso29742536d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 06:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780322262; cv=none;
        d=google.com; s=arc-20240605;
        b=Gep1aiLf4u2Mz4A5ooSO2ZUQtGAbfmuXUN/thu1gtRauz6oqxw2XR/Bl3TzZGrgmqJ
         aiq7Kb/CAtJqEBRqkog1BZrs18acr42TRxr+QIZzONLOHkTxwEfvjZf7qJxZAD+KKsre
         IENQunxki4NK0+Bqu5vXqgZFTAbNl5nqEaoE84895kPYoK/K2GxdOi1EwXYzU+EZCaxU
         e6wF+nb69GIISvVOp0iHLMjfW149jNJXE7ojTlwl1CdKq0hflh3IzQS1udcVYw8YBVZ3
         YLhItOwbvjTpEfT0GyGigVxbSF27oJKqzwUGMba98ECOWeWCYTVPn5JS1mKQ95UIUGlr
         cRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=77kzouxh8WRzauIyOC33RnhLrqHAywMoBjTYsA95BUE=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=CncCOjCc5jWmfeFdXpTN98yvjwM3JO5n049SaadV7h3GfS7NF3BCIBVuBo99EVmmOW
         SVbzAi/IpFuqt5IYyEZ/APVsxHcR2NyGyv96RP4RUMmiJgGmJ9Di8FI087nsf7N4gdGG
         2faAHa3Rlzq6Y/ElM9A2JccyZISFEITp5w+51KEaYj+cSFOY6CMzh1hNrJBnwFrDn8LN
         YIvFnusz8V5XqiWWxIp6A54rF8D8loscM5uxmf6w1cA7gF3nF6oy6Etd0maVEqPjOIGO
         gLIwJ047bat88M2eGlzQnWiaIcdqOOoifJC2vWa1kofO5DqNNgUrclWVDbZqO46kJQN0
         6dYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780322262; x=1780927062; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77kzouxh8WRzauIyOC33RnhLrqHAywMoBjTYsA95BUE=;
        b=aQoeSr1fXZzTmhx7zmHQOH7EnR/nXiCwFPESfUXSLdMFrtzRgIafKXEWaATU3OkH+I
         Ch1iKQVF2cXjtVo/JDGFiXCcmkAcQiLY1gdfa2C1kLVIvGwot68EfhMgBOebk6BUZK/y
         E9ouBl/ganvQRBae3pGPG95syKCk/4B8ZpRHQtWWqPGJp6iT8beTwQiviuk7iosX1mks
         +/vZWJGRMl1VO9hlaAS6N7Ce9JpNOe6n1lRB1HSX8l6vY85KhrQ5LB7ZWn6fWVvuK/uz
         br7acDhtDpSNi23qALvcQIyJFuETnUdeCTUsDKpY/3LgE6eeKbTw15fcSFuZiCcCJUnO
         Q2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322262; x=1780927062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77kzouxh8WRzauIyOC33RnhLrqHAywMoBjTYsA95BUE=;
        b=W0HnGzZy/jJNXcCUYvXXl9l767xV7ttkCY9ETm6bQotfdExByVlaRz3ai595hJ8Y4/
         OQhoTu5UoNWSliD8tGDzaOTKZFEleNydNtIHKQ93whmApWNySjxn/+88xSopNjYR9J9/
         +9t02+pTZdBabDiBnep73Ltgp9qpmDwdrBEEgFAO6npu3vVoE5JWnkErf3MGWdrs3iv1
         rpRXW8ivOHue1ndsA1/5Q2vPonYsH9pW6Gr243kVBFtbA3kOJQlv+f4zUujAIkHWot4A
         l5Q8bq8dnSLNmbBol4IucJ+kWI3d4ryPIJikqIkpAbgWZXTWZkyi5zu4eu04EycNbEHv
         eW2A==
X-Gm-Message-State: AOJu0YxXY2Jlrofme15EWGgaLQQrIEoxvnmsMYKQ0qRWXkQtsdewqTen
	N4HqF122A0aQ+lCopRMUMcY1LmUx8b6Ymq4R+I74rLIfxsHEroigC921ZsrtyOFS/KdcnZlgpG/
	edQ2gxMjqOnFqxUKysrsysMkHDOTzyYQ=
X-Gm-Gg: Acq92OGIzHmWb9feS3+ecqvEmRv9EoahoTECiRbNhAf0pXCs9ndIp5L7t6+82FQ8orG
	KBe+NYW2eQ+oD6uhGLTQO8pn/ecaXoltZTzsapXe4c5aomeKFvVhZTaG4xBxm+BKlwCtAZrI33V
	9/EZQ0djKpDBql41NuqGJZtI5NwtBr46/LZA0Jumnki8t768fVCJXv4Xv11g/yXmev5PVZh1XpN
	WloHBFRwmicFuFMK3BRLaqf3QaEIWG6qnDNI8UhfJ6tp++SVBnFfuT9ct4ZknZHJGUnajP5bXcn
	WJh9hgrTOf6V0IgFf6tmO83RoUYVKATauyXxvqE3j6dkeE5dBckmoeGOXdLIXQp73DPaEcvWViV
	TVT39ivsaPsSdzqIUVg==
X-Received: by 2002:a05:6214:29e9:b0:8ce:aace:eaf8 with SMTP id
 6a1803df08f44-8ceaaceefe2mr75035456d6.43.1780322261530; Mon, 01 Jun 2026
 06:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260601112329.142238-1-sivakumar.bs@gmail.com> <d8fc1abd30e80b4d689270bbb21538f6c299e4f7.camel@linuxfoundation.org>
In-Reply-To: <d8fc1abd30e80b4d689270bbb21538f6c299e4f7.camel@linuxfoundation.org>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Mon, 1 Jun 2026 19:27:15 +0530
X-Gm-Features: AVHnY4JEMY8mcH9mSKYPo6YkITW-iHdOh9RHA0YHZC3fCk2sNZ08CbZXceYScZU
Message-ID: <CACFV95+ADrPV=0_YKXJYhKQ0AmSDbwVBfeLcZeVR-Gietx0bQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuboot.bbclass: regenerate .qemuboot.conf
 after do_image
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc002b0653319314"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 13:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237834

--000000000000fc002b0653319314
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.

You are right, the fix needs proper [depends] declarations rather than
just reordering. I will look at what the conf file actually references
and add the appropriate task dependencies so do_write_qemuboot_conf is
correctly invalidated whenever those artifacts change.

Will send a v2 shortly.

On Mon, Jun 1, 2026 at 6:28=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2026-06-01 at 16:53 +0530, Siva Balasubramanian via
> lists.openembedded.org wrote:
> > do_write_qemuboot_conf was chained after do_rootfs, so it only ran
> > when the rootfs was rebuilt. If only the kernel was rebuilt (or any
> > change that regenerates the image without invalidating the rootfs
> > sstate), the .qemuboot.conf was left stale while new image artifacts
> > were deployed with a new timestamp suffix. This caused runqemu to
> > reference mismatched or missing artifacts.
> >
> > Move the task to run after do_image instead, so the conf file is
> > always consistent with whatever was last deployed.
> >
> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> > ---
> >  meta/classes-recipe/qemuboot.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/qemuboot.bbclass
> b/meta/classes-recipe/qemuboot.bbclass
> > index 56106b1958..47ce16935f 100644
> > --- a/meta/classes-recipe/qemuboot.bbclass
> > +++ b/meta/classes-recipe/qemuboot.bbclass
> > @@ -127,7 +127,7 @@ QB_DRIVE_TYPE ?=3D "/dev/sd"
> >  inherit image-artifact-names
> >
> >  # Create qemuboot.conf
> > -addtask do_write_qemuboot_conf after do_rootfs before do_image
> > +addtask do_write_qemuboot_conf after do_image before do_build
> >
> >  def qemuboot_vars(d):
> >      build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>
> Shouldn't we be fixing the task's dependencies so that it runs at the
> right time anything it references changes?
>
> I'm not really seeing how this will improve things if to use your
> example, the kernel is rebuilt since you haven't added a dependency on
> that...
>
> Cheers,
>
> Richard
>


--=20

Sivakumar B

--000000000000fc002b0653319314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">Thank you for the review.<br><br>You a=
re right, the fix needs proper [depends] declarations rather than<br>just r=
eordering. I will look at what the conf file actually references<br>and add=
 the appropriate task dependencies so do_write_qemuboot_conf is<br>correctl=
y invalidated whenever those artifacts change.<br><br>Will send a v2 shortl=
y.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1, 2026 at 6:28=E2=80=AFPM Richar=
d Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Mon, 2026-06-01 at 16:53 +0530, Siva Balasubra=
manian via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; do_write_qemuboot_conf was chained after do_rootfs, so it only ran<br>
&gt; when the rootfs was rebuilt. If only the kernel was rebuilt (or any<br=
>
&gt; change that regenerates the image without invalidating the rootfs<br>
&gt; sstate), the .qemuboot.conf was left stale while new image artifacts<b=
r>
&gt; were deployed with a new timestamp suffix. This caused runqemu to<br>
&gt; reference mismatched or missing artifacts.<br>
&gt; <br>
&gt; Move the task to run after do_image instead, so the conf file is<br>
&gt; always consistent with whatever was last deployed.<br>
&gt; <br>
&gt; Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14520" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D14520</a><br>
&gt; Signed-off-by: Siva Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs=
@gmail.com" target=3D"_blank">sivakumar.bs@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-recipe/qemuboot.bbclass | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recip=
e/qemuboot.bbclass<br>
&gt; index 56106b1958..47ce16935f 100644<br>
&gt; --- a/meta/classes-recipe/qemuboot.bbclass<br>
&gt; +++ b/meta/classes-recipe/qemuboot.bbclass<br>
&gt; @@ -127,7 +127,7 @@ QB_DRIVE_TYPE ?=3D &quot;/dev/sd&quot;<br>
&gt; =C2=A0inherit image-artifact-names<br>
&gt; =C2=A0<br>
&gt; =C2=A0# Create qemuboot.conf<br>
&gt; -addtask do_write_qemuboot_conf after do_rootfs before do_image<br>
&gt; +addtask do_write_qemuboot_conf after do_image before do_build<br>
&gt; =C2=A0<br>
&gt; =C2=A0def qemuboot_vars(d):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 build_vars =3D [&#39;MACHINE&#39;, &#39;TUNE_=
ARCH&#39;, &#39;DEPLOY_DIR_IMAGE&#39;,<br>
<br>
Shouldn&#39;t we be fixing the task&#39;s dependencies so that it runs at t=
he<br>
right time anything it references changes?=C2=A0<br>
<br>
I&#39;m not really seeing how this will improve things if to use your<br>
example, the kernel is rebuilt since you haven&#39;t added a dependency on<=
br>
that...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div></div>

--000000000000fc002b0653319314--

