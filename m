Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4249CD5BD1
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 05:44:20 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4617.1779946404889332642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 22:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PGnqtKQP;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: adityags2004@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393d07e8938so10702421fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 22:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779946403; cv=none;
        d=google.com; s=arc-20240605;
        b=esPKX3BRInGTA9PM+UGu8ISeCVlk7YlNhbavAo0gpX30UAVyDqyCpy2aUHPskUxo7k
         rYrmIqtWmy2Msyc7Pt78Vibgf5H1MeNi0DDs1fnsWFHQbBCqJbaweLTOfikqSnyvNzhj
         hDsduLpFMzjn8dyG7TVLEYCFHebJ0PTpg8ueeUjg8EoXIGnliWip0Y3RduEMC9+3H6uB
         qJTv1MFxwmAVD88q4/H0uQeQAs117aMN80opj6/TqzdvLJgiDNxYJRu0uN6siDJ8bYtI
         9lP5MfZGxJfyB6QXTZwTV+2dzjRs6xPih82GKC9GaRACiTT6XpUTMUh4EDhrEn5U+04b
         Tblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2ss/EZnu9k2VrlQDeNFFybXA/iUeFfjK1as/9k6qdNU=;
        fh=B6vtDpNTi4XOGWGC9Kq5d9W1AUmYn1kAF47SU3Mvhxo=;
        b=QOGTw48pA4NlolDkxfuzkqJLh/Q3kBGB8IAq4t1waGlWl2cr0SkLTCFmWOL+uotTKD
         P7N3SFbVm8K638IWiPjD2nCGF+ekoVJ4PMoGi0zRABgYYCn2nIsGwmgCDy9L/ZTyGUfY
         HCrcpcde+7Yd1nurIEywsb5NBc9qYS2J9KC+zqKhR2CE9B3wxhbp+j279XlP+lyE9fON
         5OpE7JVOdHVaGQdkOVSml8KEtLcKEo35lE0BOI75iZHf1b/DAd5ZCezwBPL1g2HwkLIX
         IzFM8SQ6VaOjGYEW2QNp9He9JSuu9n9836AwIK5PRJzkXaiZRmZkUc+23xCXiZ02Trdw
         r0Dg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946403; x=1780551203; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ss/EZnu9k2VrlQDeNFFybXA/iUeFfjK1as/9k6qdNU=;
        b=PGnqtKQPZlq6fYVsh4TI0mxn0HK3Kez5BtToTHdWQO/QhzWfb/2UM2ZtDAebEkYfFs
         SGysr+4kynO50rmyZHM9YisvVFsV02BABXvwqqToy1w4zDqm3NAC9zRezhNouSieBdQK
         JW1ayd7aEQQYpzlEPDr+FDfTUhTCEnSK/rcA0Sdh4X0eQwn1PR2lpLKOiL+M3u42gvEv
         +PODLXruWRD0SXQU/Vu+srG8JPWJS8AXnAcZoQLYD/QL5UhxU7Amq4wrdZW6AJhVNT6f
         OB57MTxEJO8YF739m8uVEd2Rc4amsfQN0KT/L317p4wbnRD4e03U3o4Gr94c1GItVBuy
         9dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946403; x=1780551203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ss/EZnu9k2VrlQDeNFFybXA/iUeFfjK1as/9k6qdNU=;
        b=ma7dTnA1HULBCIfOYehLphHEIfbozbO0NK7yx9r4YBMNHLCz+fHpDKtcULQ01JGkSl
         X6YFZKc7dIld2rjhOmiuK7MA9M1O1tctwRzUn40z6WBmqCNCcUpvWCk5dadzy8q0e0ZC
         q3XLn7BSfdu13lkO4QRQucotcv3BYBD6y9oUd8Xa9kI8kD5TBt0BV/aBTm/kXVj9pV4I
         A/Z1P/Da8YuvxXTWLkgdbrjEMcO8ZG8iqf3HNAAu6SArZfStwO/pzroLUcSsZVcQWpoM
         zi6oBgVQG/gDHv7+8Upl0v5BbSBFAcLmerUe9yJsLaO0bN17M+4hsimndVP6yV7aDrDV
         6z/g==
X-Gm-Message-State: AOJu0Yx4LN5AxeWjlbmlmInZx9n5ILHtOqqdf62X1V5NzX3v25GU8FZ0
	uKr7fY2uWygMHnfweVFr9HyDXj2XbWQ/ac3Yl91xw8fT9h4goPGpeu0h12GX+jPVfTUusG3pkaW
	UIV6UL6JRssDBv0Hp2NoA38vGC0NfG3A=
X-Gm-Gg: Acq92OFOmHwNf/Pw4bfI8SVdqIqekPgYLgVKLheUhF6M36mbX6OmEo4znAezb7z4yg+
	SQmL7UwtgJGDBbtqRnEOvHDzOjeinWMEU0j6gRYf5JvJ1IU2IJmoj7FfWM8OGoMQVzWv2Sy3YYx
	b4Ky304JD1ClBq2bclS1u2tZ/5fGX9YeWHbf5Jg7WNKwCyR3VmxsxsQgmjF9d8Ysll0zSKuPWqD
	4okL9XaMiyH8qivjRlNrC5LI7u7g8N+XMP+FF2sqaqOcEV78OcD2HUf1JWFZvHvqTFOPnAPD8fA
	wdJTU2RyY6mnbzKl215q+8eabzJMgM03GFhUHIZ76lXXbA2sGua9
X-Received: by 2002:a05:651c:1586:b0:392:454a:47a with SMTP id
 38308e7fff4ca-395d8dc6495mr80065431fa.28.1779946402586; Wed, 27 May 2026
 22:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
 <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
 <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com> <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com>
In-Reply-To: <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Thu, 28 May 2026 11:03:10 +0530
X-Gm-Features: AVHnY4KovzBCnb-T0wB-IJn_7w6v2S1m5c6xhNPCsi3lN_hcQTWHJ_l4Mvdxnrg
Message-ID: <CAHaUZZBBwdufvhvggvG=xtoHuOFBZx+ExFGC+s_tK3Q51Qdwgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of tolerating statistical outliers
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="0000000000000ba7bf0652da11f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 05:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237692

--0000000000000ba7bf0652da11f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the guidance.

A few days back I was facing SMTP configuration issues with git send-email,
which prevented me from sending patches in the proper format. Because of
that, I initially shared the patch manually.

The SMTP issue is now resolved, and I have since used git send-email for
submissions. I also resent the patch to gawk upstream using git send-email,
addressing the bug-gawk mailing list and CC'ing the maintainers.

Please let me know if anything further is needed from my side.

Thanks,
Aditya

On Wed, May 27, 2026, 5:36=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Wed, 27 May 2026 at 13:41, Aditya G.S <adityags2004@gmail.com> wrote:
> > At this point, I am waiting for his feedback on the proposed fix. Once =
I
> receive a response or the patch is accepted (or revised), I will follow u=
p
> accordingly and share the upstream link when available.
> >
> > Please let me know if you would prefer that I proceed with a temporary
> Yocto-side workaround (such as skipping the test) while the upstream
> resolution is pending.
>
> Thanks for summarizing, but I think there's a standard mailing list
> archive, where emails are placed as soon as they're sent:
>
> https://lists.gnu.org/archive/html/bug-gawk/2026-05/msg00054.html
>
> I see you're struggling with sending attachments there, I'm not sure
> why you can't simply use 'git send-email' to send the patch, as you
> just did on this list, but that is typically much preferred. Email
> attachments are difficult to review, especially when line by line
> comments are needed.
>
> Otherwise, upstream seems friendly and responsive, so we should
> probably wait a bit? Ideally, they'd add the fix to the upstream git
> repo, and then it can be backported in oe-core.
>
> Alex
>

--0000000000000ba7bf0652da11f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Alex,</div><div dir=3D"auto"><br></d=
iv>Thanks for the guidance.<div dir=3D"auto"><br></div><div dir=3D"auto">A =
few days back I was facing SMTP configuration issues with git send-email, w=
hich prevented me from sending patches in the proper format. Because of tha=
t, I initially shared the patch manually.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">The SMTP issue is now resolved, and I have since used git=
 send-email for submissions. I also resent the patch to gawk upstream using=
 git send-email, addressing the bug-gawk mailing list and CC&#39;ing the ma=
intainers.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Please let me=
 know if anything further is needed from my side.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Aditya=C2=A0=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, May 27, 2026, 5:36=E2=80=AFPM Alexand=
er Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 27 May =
2026 at 13:41, Aditya G.S &lt;<a href=3D"mailto:adityags2004@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&gt; wrote:<br>
&gt; At this point, I am waiting for his feedback on the proposed fix. Once=
 I receive a response or the patch is accepted (or revised), I will follow =
up accordingly and share the upstream link when available.<br>
&gt;<br>
&gt; Please let me know if you would prefer that I proceed with a temporary=
 Yocto-side workaround (such as skipping the test) while the upstream resol=
ution is pending.<br>
<br>
Thanks for summarizing, but I think there&#39;s a standard mailing list<br>
archive, where emails are placed as soon as they&#39;re sent:<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/bug-gawk/2026-05/msg00054.htm=
l" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/bug-gawk/2026-05/msg00054.html</a><br>
<br>
I see you&#39;re struggling with sending attachments there, I&#39;m not sur=
e<br>
why you can&#39;t simply use &#39;git send-email&#39; to send the patch, as=
 you<br>
just did on this list, but that is typically much preferred. Email<br>
attachments are difficult to review, especially when line by line<br>
comments are needed.<br>
<br>
Otherwise, upstream seems friendly and responsive, so we should<br>
probably wait a bit? Ideally, they&#39;d add the fix to the upstream git<br=
>
repo, and then it can be backported in oe-core.<br>
<br>
Alex<br>
</blockquote></div>

--0000000000000ba7bf0652da11f9--

