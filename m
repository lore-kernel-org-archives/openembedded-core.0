Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50267CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 06:34:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22462.1780295415124080663
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 23:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gRcrsA0W;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: adityags2004@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4600ddc4017so745952f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 23:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780295413; cv=none;
        d=google.com; s=arc-20240605;
        b=by/G6C2J/K0/eM5Q7Plp6XK/PSn+ClyfERE1ysgHI7HU6mcFsvv9jfTvGs/AYNp2qF
         IJADQrSez+Fb2gO6vJtSnVKZNjgByCQqDYOFS2L/oJqQqfXS+vwPnN9TpDFYWYaHOQj5
         pK0IW64/CNPmsg1YOGctDxh/8ARvFd3ZkPq2M1HitSCBVmFPjDngyVgyNed51pxW51ex
         uy1SUW0WLkLMgiFKRdwLX4N8n8MitqwIFGPQnQSWAmFMeQbAKylq6RPAN4yZhMvii3zf
         wZJrXptKDzvjC8ni5YMS9O08T+MW9aeB2k4MxDCI7n9v0s1e/G8LjY+Yjun1nHafpmvQ
         uMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Eq0cCQeNO6TBjpuJyT/qoa4w1oJDMQrBqZgWqpq/sk=;
        fh=TXJJXGu0ozQXjS5/rbMdEtZMi+1mVIAALl6TjbOMeqg=;
        b=bNoefedsAE6FcE4AharUsgHDsRn25pH+QFzUTNjxxP1BTy4wMI3uIa3UeoP78rovPf
         ryLvqT0LAaJuBlB08xASKXAu7DrSjTfoxgJbLqsWnSXYjHjefq2untgBBbbjYLjKGchH
         JW5wnpNwWWYoUAeRm5PSqhnP7xf+Y+8BpiPSR9dGv9zmwwxKlA3T8KT/icHS2AM4OsdR
         rwR3pN6B67Axi0RNKObOGE9MLYVjp4Zv1gU8Nzu/o29iQrTRRaAh3YoCT77MNiBdOvD9
         72ljX3RpAbtBbLsqNjEWPk3wvRLcUXgCQcBAV69cwvA9Gh5azDnwFRkjmb2Y9JG+9OrI
         TIfg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780295413; x=1780900213; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Eq0cCQeNO6TBjpuJyT/qoa4w1oJDMQrBqZgWqpq/sk=;
        b=gRcrsA0W0idoVaP36OR9Y7yhtnsJUMip8eRLQr6o7gx2f08BmSy2muBmODW6kG6YWS
         vMbv4f+0o59BEs3GWonCzHficCuFeTzNXQHolfUmKDRHw29ikaHMnP2OaXX+Lg2CCMC/
         aQZsbgqq0/FIEUqZt6qTL2MyiPmRu8fH5JR+qHZ+SEmXg4qCFkXgjNUwMh3R3auPoxxj
         YtK5RVvQvAgpnMQB4RZM7U6lXlQUKIC9vqJp63HM2weq2ehSPIl4xExLbDiIwgp4AHgO
         wYGs7n7nqnVqlvFixLOFwRAVPCSk0UU18+9/B/5vfKmgAK3V2LAiZQvdu/RzsDyUxxyx
         NtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295413; x=1780900213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Eq0cCQeNO6TBjpuJyT/qoa4w1oJDMQrBqZgWqpq/sk=;
        b=Kii5h+S3j4QxCrCYFWyAraTa78CR/pG0WdBFB1FWG+rzXLCNSl0AO7iVUD2omO0w+s
         2wckTxFAcBVpJbKu0iOXAzRY1ovzdy03+SjnKFzJpKIiuRgwmUJD3Pk9nQf3atEqUcx1
         deKRMfdCHNf5UJhwoTw3EhxylQ0B7En2sgMdZhwx4QCnLBkF0cV4Ce72JqAq7xYHnCEL
         aNxlEpav8+Yh47mJmE8NzxfnLzNwA13O+eDvVSkvKxiK2AahJT1HdE9Rg/KcLdz2ONSq
         1B6/0kMpmT0R50/o/oH9baOqYry9as7dYdxVDT+CQOZPvyq6VDVjA2p7X6Nn2bKXV2lv
         p3qg==
X-Forwarded-Encrypted: i=1; AFNElJ/jmLuyWxLY8+7xHsC0CYXfuf5zQtwKNHBW8RHLh2mV81s3dRslxWDRlRBSF7ZtkxKAcIML50C08VbNfZAIocYxOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6VXzAlzr11pOuO8Of61qmElhPhQv1vLn8g4ZL42ulCrDrjxyJ
	3kjrGmVWakV0MOBP3ESP7agMQ5XIlvNJjZ6Qadbm56xU28U8G+MsS/4z5g7Xb6WR4k52vnqkIO9
	q2pe/0i6fBVaMQu+T527cG1FgPPTsPK8kQQ==
X-Gm-Gg: Acq92OG9/sCUQn0S7UjETu0aSzcZHY1CS0SVTMoh+P/0XQgx9tIzJJCFNHwuCg3Y5T1
	AiJYBNlXzki4Hddu08TyeJZcDOpY7psbRFxSNXG4vA4rIwnJCmTGPjd8ubv5/cb8yIyLKYaU61u
	by807eXi7JW1Ye2c30zw5QbwiUypMqgUA70xbIk81AKsvXQ6Md/Mw8sWB8rUGyWMKbnu7lnkYuT
	xG1/UzyZmFgRCTdQThWZHA2T3Se4sa1JFzNCpatFLV28urNbIOxNnxupWKVAK3QcIG3v+XFa5bG
	raImqSiiqMWna7FYRFzi5HLFMHQnJPu7bA4HO0eFZvru3+d/5gU=
X-Received: by 2002:a05:651c:4388:20b0:393:4e44:63ba with SMTP id
 38308e7fff4ca-39664f82aabmr18688121fa.29.1780295061524; Sun, 31 May 2026
 23:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260528184427.517-1-adityags2004@gmail.com> <0101019e707f4f5a-9a72d5d4-6549-4b7a-bfd8-88596d80a968-000000@us-west-2.amazonses.com>
 <CANNYZj9hMofg4Z1z9=kZotBXy3f4nZ_qZ-Ov7O3OYeDpCSdymQ@mail.gmail.com>
In-Reply-To: <CANNYZj9hMofg4Z1z9=kZotBXy3f4nZ_qZ-Ov7O3OYeDpCSdymQ@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Mon, 1 Jun 2026 11:54:08 +0530
X-Gm-Features: AVHnY4LGZZap_pypyEXKRHa8Qst7UNYRx71gvwOnGE6l3vJ_P_Mzx51RBqNmTNQ
Message-ID: <CAHaUZZAtmR+yn7rt9QUXsowNWudj2KwiGo482Auh2qbaVCWdaw@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH] gawk: backport randtest stability fix
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bcd2d506532b3ecd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237811

--000000000000bcd2d506532b3ecd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the feedback and suggestions.

I've now addressed the patchtest issue by adding the missing Signed-off-by
to the backported patch file, and updated the patch accordingly.

Resending as v3.

Thanks,
Aditya

On Fri, May 29, 2026, 1:38=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Thu, 28 May 2026 at 23:30, Patchtest via lists.openembedded.org
> <patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org> wrote:
> > FAIL: test Signed-off-by presence: A patch file has been added without =
a
> Signed-off-by tag: 'randtest-fix.patch'
> (test_patch.TestPatch.test_signed_off_by_presence)
>
> Right, this needs to be addressed too. Now you can use a -vN when
> re-sending :)
>
> Added Signed-off-by must always contain your identity, and not anyone els=
e.
>
> Alex
>

--000000000000bcd2d506532b3ecd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the feedback and suggestions.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I&#39;ve now addressed the patchtest issue by adding the miss=
ing Signed-off-by to the backported patch file, and updated the patch accor=
dingly.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Resending as v3.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto">Aditya</div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 29, 2026, 1:38=E2=
=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Thu, 28 May 2026 at 23:30, Patchtest via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&lt;patchtest=3D<a href=3D"mailto:automation.yoctoproject.org@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">automation.yoctoproject.org=
@lists.openembedded.org</a>&gt; wrote:<br>
&gt; FAIL: test Signed-off-by presence: A patch file has been added without=
 a Signed-off-by tag: &#39;randtest-fix.patch&#39; (test_patch.TestPatch.te=
st_signed_off_by_presence)<br>
<br>
Right, this needs to be addressed too. Now you can use a -vN when re-sendin=
g :)<br>
<br>
Added Signed-off-by must always contain your identity, and not anyone else.=
<br>
<br>
Alex<br>
</blockquote></div>

--000000000000bcd2d506532b3ecd--

