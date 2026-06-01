Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81E0CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:04:22 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4133.1780333455886690201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 10:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ALwTH5+B;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59cfbfe64baso737167e0c.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 10:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333455; cv=none;
        d=google.com; s=arc-20240605;
        b=hztc9Uu6hiGVh2+3sN4WlgZA/QYAHVo14rTiz+QkTMuyjcZQ83C53BQ/58Q9VAV/Ur
         3F7ocr76yYeBB7BhWsXvV0+vR1hfM+YgzpMTN98cFNwZzXOsVDpbm9mTz4XhuIQZJqez
         Vnq1hWdj0nscDvhPnbHyUnqm5bqoAM1WMzGE0eRFw+QDO7fJ4iQWkQyI+0CdBK3Ix+Rg
         u2qjKCDoCxybKzqZzbqHlN2Gb9Gijuvk9Hi79APfeBESDCiWkMDrXdqIexgz30BCZl/e
         nh+UW5UtCHTYEdvU1jTAXe1bwvVl7isi2MVukvXSQQGNHez5FD7v9G8QM1SQY1rPx4gE
         W7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w6iHLUtETa+tVpSa/ho2SQcahgFTxZ7X7YaIkKX+0F4=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=PcAV/nk2Sn8sFPHsluRRtDxRbJ+dxW0PGyTHQnkE5Lyuxixfz/oJE5AlhUrlF+F0K2
         B7UDZx/yTcKXt9DeXHxjvepdCLO6Uks4HydoRWhDjA36jXiU9/TUUKerIkohgnjJaQaD
         ImzyMCDbqeeWJUDM/3T7854AxGLom8l/Q2RR8+Q5WjHRha1WkVcRDDaMR0blExBMftYw
         cTRwNxWrZoU6U3GD9rGjHyjvj7mqIrrgKJVDJCVyMrCu7azBZO2PXtDo9vGn5N6FnjWQ
         neZrHEa0+LjO/OJTTn8lkRX/baMDHG2IlfQ996QoXJ/PNNBtnzikDtiT7INBD/Iviwwj
         Z61Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333455; x=1780938255; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6iHLUtETa+tVpSa/ho2SQcahgFTxZ7X7YaIkKX+0F4=;
        b=ALwTH5+BJ0o6IAFt6r6RwjQ/Oi2YT4+HS+EuCwzDx8fulkKUKEFj00qXCFFECsSGGO
         w3nUCEYVvby+3YtDkiiGCq5ulN9gjWheiUzdBet+dlDhgsycw4hlIIL5OT0+cyi7IDP7
         YFT8jD1tTD46xBRPC++YF3bSYYCAx2S9oaw6Smxhn16HdNhN5kTyIIxHqdV1QaHtNLy4
         QZxRrBL0wFYrXUyTR3dZ8PPfcV9Bjo+b/o3v+SV+oYvvWnV6HPTAU1Dk3MojJSxPdpW8
         4XM9rmnghxEePrqXDwYcVGjHaINPbMUxg8ePoprLLlSOtIrFfDWj8N6QzmzUaWRV5bVb
         j6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333455; x=1780938255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6iHLUtETa+tVpSa/ho2SQcahgFTxZ7X7YaIkKX+0F4=;
        b=MtWbDoumplrPg2HP8ol+ppu/NtSaOGQzntdRXy2u8tHr0iSCF8jjVv014iHc9Nr4Zl
         F77jRiUI1mP5t+9XsIH+eOB4UoEWtAjSrW2GaSL1SAkjUz81wYwUDClZigc81kY7s4pm
         zE2TTe6vj6XwGG9+/De2xc8oX1yY+C/OqCYelfJgIDBDDjQveYUjev3C9p/ivSXNV2QH
         +vhuBH6plo2RkNiweOJsX59/IC1xEciHE4jK3ggtTdVYqksdXZxYivQk75kTFct7j2sG
         zecJx3EBE/hT+ktAcoxKRiXAJom8iJaaAVZlHs5HipPH+9eZErR3nCA8PIJ0o0wg5LWC
         VpRA==
X-Gm-Message-State: AOJu0Yxfn1M3a2iiR8hDaP2ptioOgqOA3LNf8pCEI0lDzrceMdcFLh8d
	MdQo3UI+HPPFT/mTHZm7Kv6rqGVg/pSM2lklC3EqxLKquE7uLNZwfT7xM1eMXe4u75KPvnAz2Hk
	9HjPL3lrAnBIPbpumKK6EG8VEIUqDj3mM5n0Ksx+SUw==
X-Gm-Gg: Acq92OFajrky6949wWw54t1t4Pu/XjkmcDDCUOTu2pzPSE7u6/5jyVQDRVWN5vHixlF
	ljIi9rtBEERtUDEUH7kTSf0vT0bG08V+2KWMM3I+QfTWlGDUgQxBXIPCKYz/pc+h07cNEAzE2Ip
	jRxuxZ9JAZS5O13zmsOBHVh3MyszI3yDvmT5DCI5YEQ5dSVgNRawg2gIxrfZZzbhHVzPeuIlZgM
	B0AUkuWRGPHz9XzwUjoWHLjdCF1SgFE26PwQfDggLkWmTVZtb2SpmtaKOZ7sh/qYTBgCPHFYHvC
	pOWxVReBgWW+hrM+ved5Gkz2eM3BCG/TtsvEL+mCkqeWRMWJMiLaKeqMSIycDR3MH1UI0RLm5Kn
	MQV860fs=
X-Received: by 2002:a05:6122:a26:b0:575:29ef:7df8 with SMTP id
 71dfb90a1353d-59bf84c927amr5590008e0c.2.1780333454566; Mon, 01 Jun 2026
 10:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260601112329.142238-1-sivakumar.bs@gmail.com>
 <d8fc1abd30e80b4d689270bbb21538f6c299e4f7.camel@linuxfoundation.org> <CACFV95+ADrPV=0_YKXJYhKQ0AmSDbwVBfeLcZeVR-Gietx0bQA@mail.gmail.com>
In-Reply-To: <CACFV95+ADrPV=0_YKXJYhKQ0AmSDbwVBfeLcZeVR-Gietx0bQA@mail.gmail.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Mon, 1 Jun 2026 22:33:47 +0530
X-Gm-Features: AVHnY4I0MOVq_V9FA2LVkHKdtfA1EyVbcxcpyaqYlSyFuKseaJ48143vypRDWdY
Message-ID: <CACFV95K6v2MEcEFASMzmL5cyi2j4U7z_PHdtSOjo5GUubOB-qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuboot.bbclass: regenerate .qemuboot.conf
 after do_image
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000242bb10653342fbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 17:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237971

--000000000000242bb10653342fbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v2 sent. Used KERNEL_DEPLOY_DEPEND which is already used by
do_build[depends] in image.bbclass for the same reason.

Tested on qemux86-64, linux-yocto 6.18.33 do_write_qemuboot_conf
reruns correctly after kernel rebuild.

https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_qemuboot_=
bbclass/119596210

On Mon, Jun 1, 2026 at 7:27=E2=80=AFPM Siva Kumar Balasubramanian <
sivakumar.bs@gmail.com> wrote:

> Thank you for the review.
>
> You are right, the fix needs proper [depends] declarations rather than
> just reordering. I will look at what the conf file actually references
> and add the appropriate task dependencies so do_write_qemuboot_conf is
> correctly invalidated whenever those artifacts change.
>
> Will send a v2 shortly.
>
> On Mon, Jun 1, 2026 at 6:28=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2026-06-01 at 16:53 +0530, Siva Balasubramanian via
>> lists.openembedded.org wrote:
>> > do_write_qemuboot_conf was chained after do_rootfs, so it only ran
>> > when the rootfs was rebuilt. If only the kernel was rebuilt (or any
>> > change that regenerates the image without invalidating the rootfs
>> > sstate), the .qemuboot.conf was left stale while new image artifacts
>> > were deployed with a new timestamp suffix. This caused runqemu to
>> > reference mismatched or missing artifacts.
>> >
>> > Move the task to run after do_image instead, so the conf file is
>> > always consistent with whatever was last deployed.
>> >
>> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
>> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
>> > ---
>> >  meta/classes-recipe/qemuboot.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes-recipe/qemuboot.bbclass
>> b/meta/classes-recipe/qemuboot.bbclass
>> > index 56106b1958..47ce16935f 100644
>> > --- a/meta/classes-recipe/qemuboot.bbclass
>> > +++ b/meta/classes-recipe/qemuboot.bbclass
>> > @@ -127,7 +127,7 @@ QB_DRIVE_TYPE ?=3D "/dev/sd"
>> >  inherit image-artifact-names
>> >
>> >  # Create qemuboot.conf
>> > -addtask do_write_qemuboot_conf after do_rootfs before do_image
>> > +addtask do_write_qemuboot_conf after do_image before do_build
>> >
>> >  def qemuboot_vars(d):
>> >      build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>>
>> Shouldn't we be fixing the task's dependencies so that it runs at the
>> right time anything it references changes?
>>
>> I'm not really seeing how this will improve things if to use your
>> example, the kernel is rebuilt since you haven't added a dependency on
>> that...
>>
>> Cheers,
>>
>> Richard
>>
>
>
> --
>
> Sivakumar B
>


--=20

Sivakumar B

--000000000000242bb10653342fbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 sent. Used KERNEL_DEPLOY_DEPEND which is already used b=
y<br>do_build[depends] in image.bbclass for the same reason<span class=3D"g=
mail_default" style=3D"font-family:arial,helvetica,sans-serif">.</span><br>=
<br>Tested on qemux86-64, linux-yocto 6.18.33 do_write_qemuboot_conf<br><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
<span style=3D"font-family:Arial,Helvetica,sans-serif">reruns correctly aft=
er kernel rebuild.</span></div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" st=
yle=3D"font-family:arial,helvetica,sans-serif"><a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/topic/patch_v2_qemuboot_bbclass/119596210=
">https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_qemuboo=
t_bbclass/119596210</a></div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1, 2026 at 7=
:27=E2=80=AFPM Siva Kumar Balasubramanian &lt;<a href=3D"mailto:sivakumar.b=
s@gmail.com">sivakumar.bs@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Tha=
nk you for the review.<br><br>You are right, the fix needs proper [depends]=
 declarations rather than<br>just reordering. I will look at what the conf =
file actually references<br>and add the appropriate task dependencies so do=
_write_qemuboot_conf is<br>correctly invalidated whenever those artifacts c=
hange.<br><br>Will send a v2 shortly.</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1, 2026 at 6:28=E2=
=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2026-06-=
01 at 16:53 +0530, Siva Balasubramanian via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
wrote:<br>
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>

--000000000000242bb10653342fbb--

