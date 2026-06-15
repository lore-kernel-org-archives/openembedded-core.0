Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1752CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 14:23:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123121.1781501229805256421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nbXl8ylK;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: adityags2004@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so3213748e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 22:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781501228; cv=none;
        d=google.com; s=arc-20240605;
        b=bwyCdfnnXexUcL/CsVaIHZfzv64C35aEpQ5nD5cZuD19o64vPFOQDKvpJHv1dmTWtz
         HYq57+86ZsAVMbmXepYdvhbmqhABcjj/bqQWBfKYHmW5YDH7z5LAky7hiBxqPl6k7rdg
         Ih9oQ4tQkZAGQKB7nTiDtUzxU15B+UMTBnOgVWPseWUOxAiTNlBcPNxJghlTqu+3X8cI
         6EeRyi7kD4gr3289noh50w7p+J6nHEtqZIV5C2KYNKufqY43qV/I6BHcxz35PLGqCarE
         bekpZr4vZ+L+i2pQJR1yFBKo15bmBlURAfG027ewUh0OEReB96bMt7xYZD6eZ8iJKdKO
         N5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7yFTVlUM5fqtTv7yGDiMfyowCyIF3jsGwvnNpHTaj4A=;
        fh=9lY65nN0TEMrEQMKxg+aHg+T06NFIZOGgB1tC9Cp6GE=;
        b=H842yRCr9WkMQ+zlGx5kKNfRWJyq7ZhfUJlSvHbA2MLvHhU8CyEaWMvhrQhEM5+NQv
         bhSigyMKUeAYvSYMLutHw/aJ5leyvtAXvLzPTvxVe1rL9NMUOEeFtbZ3wepJVjk6vQ9O
         TZaHqmFQrYwwJa79GdpzX1Z72EboQMcxFxToPZ41GzjiS5HHHy2ICVu8LDkP+/J2QjLF
         /pPSwXhJuqRLVb3E2oPSRKfAparIodz/1S7+3MhHPg+aVUQyGvWBeyv4IWSA0uLRWjzb
         0mjv0d4fdYulnsloVfTtqqKulDg/d1SUJEed/NCgc2ZJxZye/2JVmsuWfWZdI8JogNFZ
         WaJA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781501228; x=1782106028; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7yFTVlUM5fqtTv7yGDiMfyowCyIF3jsGwvnNpHTaj4A=;
        b=nbXl8ylKW1Oydix5Tly9chP0g5D9+JkjBkyEYbCBzGqxxD6Bavd8RQMbh5pDaeytzI
         7WQPgB3LCzBxpgNdelrDoHuhQQd/pNDh8Lz6VJxhDPgu9kcAX62MzDso77DCpssBJADK
         386sXY2dxydjYujrJeqg3rcnei0LslMXHZBNdJs4bTs4/SKFftk4QrvQA24bYZBFDOMx
         YAcHKVf3OWmPxNUwQR2xFhLrePEUPnazE4wj5qiUYzbukE6ODI0XRLRWYUYWh9UeuPmr
         Jt9V18+OJ7EHSmKLa/t54yVkwOQvyR9Qp3iNDgTQNKoaTl4Lv5VnHZZWZZGEPMN7MEwv
         V2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501228; x=1782106028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yFTVlUM5fqtTv7yGDiMfyowCyIF3jsGwvnNpHTaj4A=;
        b=dR1itFM79k+iowRv7l0MXw1mBbdA8Zr7w2Xs+ax3o6N5FOOnXm1g3d11ci38Twx6LK
         piUbloY3/gs2gVDnwV8y1/U8LPjsuW2bxYNjazKhKyVOFbLTpNBLP46785dMCv38OCec
         0TgT9JcJqvRD7z7JXWgfZy/7T8Yxy3txgx7woKoiffdB1skFXplDIsYB9VLCjoEjoJZ7
         k4XxS+jEMMU1UcETErxir09UVVy0rnp7r6Z+NXxhh33kyz0lUv9VM/4xocH97LXVU2GO
         sTiLNu2r5coNDJ2pj78uD0soWqqE1LQorx7rjrVw9xSBvmH3hKPyemlbXaZpkemEe23W
         6Qng==
X-Gm-Message-State: AOJu0Yzw41gsegxvfYDW1/NSErgP/EEzQzpjbRIzjGBVfmafS0eHqXRo
	OAwSN+GNIES6JYz0Vnk8HCPtnOnxok13dfmUu6lCuLHqVLnHIjTXLFuoIjje+NJJggQIhNm94yV
	nhguP2b4vpm9FXV5gwBHQ2FcvYrPAwiQwJw==
X-Gm-Gg: Acq92OEsOsXXAxwRcmWdEW1GkqKjNApHa9M/Q7AueABtGzoh22KAjIzzJw4gffute8u
	NlMMsXIDKUl97Etd1CyDTN2E2N3M/HvSFTzEgF/hVHcrc9EPJa65W8QqPs1tlG6Ey3SEARegv27
	jaacu99Jue+UCJT+1hNIXjWhAHi0H8o2JvQkU7lRQ6Vhioc0N/jTxshDXJMWMM5f+7cZfJ69Kvg
	C6AC2IMDPMLurfdiOiANYhalNjSpEVRAg25hnH1TnMVvZRSPM4dwbQiKcXtf/4p/U5rOddBN2wi
	VHy+9dtiRszDc7qfthwBNmdpA/nirkUJPf0ENePeVruNWQhGSkeNp9nkfbpNVs6VE2kTog==
X-Received: by 2002:a05:651c:2116:b0:396:892a:7392 with SMTP id
 38308e7fff4ca-3992b2e7221mr35422011fa.29.1781500850854; Sun, 14 Jun 2026
 22:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260611090957.2606-1-adityags2004@gmail.com> <CANNYZj_GQpodkUJxX6BvTUz6=ZrRGQJ2b+5fSvm9KJVtBaOzpg@mail.gmail.com>
In-Reply-To: <CANNYZj_GQpodkUJxX6BvTUz6=ZrRGQJ2b+5fSvm9KJVtBaOzpg@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Mon, 15 Jun 2026 10:50:38 +0530
X-Gm-Features: AVVi8CeKcWjvwNkhZNObZi4BIFdZ5tgtyU9GpZE644y5NQIIphD9ZY7PcUq-TSc
Message-ID: <CAHaUZZBxYbO=+CXDo=DDd5AZ1W_WvPxnd_zmCn7QMeUwGEjdiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] patchtest: warn if Upstream-Status is after patch scissors
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, tgamblin@baylibre.com
Content-Type: multipart/alternative; boundary="00000000000061ddfa065443fd06"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 14:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238854

--00000000000061ddfa065443fd06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the clarification.

I understand now that the behavior should remain a hard failure in oe-core,
and that the earlier interpretation was incorrect.

I'll drop the patch that downgrades the check to a warning.

Thanks for pointing out the existing commit in oe-core as well that helps
clear up the confusion.

Regards,
Aditya

On Sat, Jun 13, 2026, 6:41=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Thu, 11 Jun 2026 at 18:05, Aditya GS via lists.openembedded.org
> <adityags2004=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > [YOCTO #15940]
> >
> > Detect cases where Upstream-Status is placed after the patch
> > scissors ("---") and emit a warning instead of failing.
> >
> > Such placement may be intentional in some workflows to avoid
> > including the tag in upstream commits.
>
> I'm afraid there has been a confusion here, and the patch is not correct.
>
>  The bug was already addressed in oe-core earlier:
>
> commit 2156ef9e6defa3ec9087789fcea25fb4fee7b83c
> Author: Luka Krstic <lukakrstic031@gmail.com>
> Date:   Thu Dec 18 10:11:38 2025 +0100
>
>     patchtest: reject Upstream-Status after scissors
>
> but the bugzilla ticket was never closed.
>
> Then https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15940#c1 was
> interpreted as a request to downgrade it to a warning, but we should
> not be doing that: it means patchtest will not longer actually notify
> of the issue on the oe-core mailing list.
>
> I understand some other layers intentionally put it after the
> scissors; if they're using patchtest, they can disable this particular
> test or configure it to produce some kind of soft fail, but in oe-core
> it should remain a hard fail.
>
> Alex
>

--00000000000061ddfa065443fd06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the clarification.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I understand now that the behavior should remain a hard failure in oe-co=
re, and that the earlier interpretation was incorrect.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I&#39;ll drop the patch that downgrades the =
check to a warning.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Than=
ks for pointing out the existing commit in oe-core as well that helps clear=
 up the confusion.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regar=
ds,</div><div dir=3D"auto">Aditya</div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 13=
, 2026, 6:41=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On Thu, 11 Jun 2026 at 18:05, Aditya GS via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">=
lists.openembedded.org</a><br>
&lt;adityags2004=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt; [YOCTO #15940]<br>
&gt;<br>
&gt; Detect cases where Upstream-Status is placed after the patch<br>
&gt; scissors (&quot;---&quot;) and emit a warning instead of failing.<br>
&gt;<br>
&gt; Such placement may be intentional in some workflows to avoid<br>
&gt; including the tag in upstream commits.<br>
<br>
I&#39;m afraid there has been a confusion here, and the patch is not correc=
t.<br>
<br>
=C2=A0The bug was already addressed in oe-core earlier:<br>
<br>
commit 2156ef9e6defa3ec9087789fcea25fb4fee7b83c<br>
Author: Luka Krstic &lt;<a href=3D"mailto:lukakrstic031@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">lukakrstic031@gmail.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Thu Dec 18 10:11:38 2025 +0100<br>
<br>
=C2=A0 =C2=A0 patchtest: reject Upstream-Status after scissors<br>
<br>
but the bugzilla ticket was never closed.<br>
<br>
Then <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15940#c=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D15940#c1</a> was<br>
interpreted as a request to downgrade it to a warning, but we should<br>
not be doing that: it means patchtest will not longer actually notify<br>
of the issue on the oe-core mailing list.<br>
<br>
I understand some other layers intentionally put it after the<br>
scissors; if they&#39;re using patchtest, they can disable this particular<=
br>
test or configure it to produce some kind of soft fail, but in oe-core<br>
it should remain a hard fail.<br>
<br>
Alex<br>
</blockquote></div>

--00000000000061ddfa065443fd06--

