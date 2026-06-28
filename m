Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF4DC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 11:34:17 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71167.1782646448838752669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 04:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TKp7sp+T;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51af8fda431so11459661cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 04:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782646448; cv=none;
        d=google.com; s=arc-20260327;
        b=ZEBKju7cN9pJhoo2kU42mcpd9owqXRhDTp5kB41Welco4IuDW0LlzNevRg6amK9vSo
         BFn6UAWIMknK3m+qelAOqXvsavRsPmw5QfuHkN8EQpHvx4CHH4KXaI63uyHKS+mWFsEB
         oHcyAWF922NRvrjEc48sM8w37AnxD/67gUAPdud0Oq1JleuU2tkpvKjdXyMJAAB0YYkG
         9++PtNhTht6xI/ZQjOdueSlic40JaEOfDCdXAxwkOuJ+5h5OiwTjaeikqXag7noCS0Cr
         HhuzOm5P8zrqTfZ2+2zGgtInAR1LA+RCgKxTKoQVf4kIwtJaizC12U/58K0bXpC2x1HU
         bY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZIfo4g3VD6BABiauW24d9RqdHikciospRC8IjWvj/B0=;
        fh=FzKgdLV+w+uJAO8KsF/nrhSBzzBqFSq/gRIfLC2lntw=;
        b=JSXZhUnpd4LvprGf8yljDcsGoSKghf2AqdZGB2ln767Jynk6iXIJbyOg1iLHvsnnqd
         e87srH1XhDb4OpNDDc43ISDnOHmyXPKPKcYCQ5hnf/NAy8P1PJVdnAUad9PhA0mDwOKv
         FZHdaxbchLXmJrmlD6LwpEZrzqdWRMeQO1fXobd9aIsUsyDvWgQHA0OwtjKRPsOUPWZy
         N8wldWSjesEYA3qU5++3nzel9B4MuheD7iki2OlhnVKeMf10vgx9tI6xnxA7jmf0FQ/F
         JF2colbbRRtvoUUSNDVVCT7fZE7Zds5kBekEahjy4KyFkUt0nbmrhnuRE+IsvFEhblIq
         A9Dw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646448; x=1783251248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIfo4g3VD6BABiauW24d9RqdHikciospRC8IjWvj/B0=;
        b=TKp7sp+TPICr7dtbw7Q9VJBRGTBJw/ueoGo9me6Qf7H8vELNgi8ns+tHcxIJzy/vL/
         n1feTVf6jUcANtU3NjaiPYj2Fqx0I2ZHXduImgZgEMxq7A9OX4ljMWyDTZHMqYoW/UoR
         smD/JdB58CWb5jkxnYsAdsVUHtAeYxQGrlIzelRVQaHbZjK1mDRwUOgBvhus1F5SmEJZ
         8VAPlr5ro8gzz2A6ZvhFzyrmtWAAWoaMrKqNL4v33bww8j8YGfA1xYlFRmHTPPjW4wUx
         +66qlO5OUbBsB6WfBNXiZjb/fFy/RL6urq+5noYN2Z3v9GwWr+EvMGoph/dlEumN2ML7
         ytEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646448; x=1783251248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIfo4g3VD6BABiauW24d9RqdHikciospRC8IjWvj/B0=;
        b=tTnCPo9frB2+gc3KKPhhx88OV3DzMlCtRNJfe8kGR6L3cI/fhEndzWHVYEj5hrAJT8
         uIT/ikek4RvOTW3dOnZH9xBhS2SZtfdfU9CsWuebrxjCe/NBA+5ESqXlG3MOmeLjfJOV
         ezFOKLCOq9divoLbZRVrrafCgeORA3iqhKB4Cr3tJe3y+YTkPZVJ7pVXfgYckrXYZ6nM
         TdwfBgfQQSbbjbUt838HBJOPmcbyTdM1R4OugCtNieI0vf3fmfMf+k2p1vbCVxib0CcB
         mymyxYh9F1ffbcxZJqqMH6GhHXIXzVA0lc6Cl/SWPnMaWdLqGtJkGdp0sMR5iO4LXJLB
         mp3A==
X-Gm-Message-State: AOJu0Yz1dHk9Jhamw+Mk0AoGl6OdLSfbFIJbaDutSmB6hSgPrQ8C4DVe
	ujMfDajoXhYzrGKc2eA89TGP4JBPVADuZIYbsJ2sPpoliE21fWmGoxj/xB6YZj98kmbg94VyZYE
	9C4kikMAwWLh6VfiIndojG2l72G23WXc=
X-Gm-Gg: AfdE7cnRyGt09J4PElkLo9NO3RTEkXq2BK7/YBVooRxihaGwWhE6hE9KNF8ouA+D55R
	XaSavzFOer38bHeJX1tCMztlqtvulFBxF50F9wTq/Aal1+L+1YNIuZpoFgOfCVvf5KHDPCDHG6v
	estsfqDBc8DzwyYzs5KDz4pa8F80c1WS7e/X4YGCrSRAbx+00EFxCh0ABk8D6ivsdH4GxFDdJ9/
	afLeDSgIstudavpfcEVcIavDqLGW6BOrxc1bYzStCC1R+8WAz6EhT5yKjJ5wmmZ9qhmgpynpw==
X-Received: by 2002:a05:622a:312:b0:517:61d5:2f85 with SMTP id
 d75a77b69052e-51a7283d356mr199662511cf.33.1782646447643; Sun, 28 Jun 2026
 04:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=yhLuHYF6MAW03=CbgUMFdBXaNBpQ=OEVe8d-bCimYv9eA@mail.gmail.com>
In-Reply-To: <CABF_=yhLuHYF6MAW03=CbgUMFdBXaNBpQ=OEVe8d-bCimYv9eA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Jun 2026 14:33:56 +0300
X-Gm-Features: AVVi8CcBptK2fi6AvRrUiiNcomokg_6NJFbzRF1fyWp2RBZnlRvB5N-hjgQwTcQ
Message-ID: <CANNYZj_=-X6Q_7r4qcSOT2f9f+pT=+E2TbHrpyM1Ksfv08neqA@mail.gmail.com>
Subject: Re: [OE-core] -native: which tests should be done
To: jan.vermaete@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000459e4206554eb8da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 11:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239711

--000000000000459e4206554eb8da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe just tweaking BBCLASSEXTEND in a private .bbappend is fine? Any patch
to oe-core needs a general use case, before considering tests.

Alex

On Sun 28. Jun 2026 at 14.07, Jan Vermaete via lists.openembedded.org
<jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:

> Question:
> I need the python3-unidiff in the -native format.
> And the -native is missing at the moment.
>
> Which tests should I do before submitting the patch to add BBCLASSEXTEND?
> Is loading the python package in qemu enough?
> Or is there a kind of ptest for -native?
>
> br
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239710):
> https://lists.openembedded.org/g/openembedded-core/message/239710
> Mute This Topic: https://lists.openembedded.org/mt/120014516/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000459e4206554eb8da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Maybe just tweaking BBCLASSEXTEND in a private .bbappend =
is fine? Any patch to oe-core needs a general use case, before considering =
tests.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun 28. Jun 2026 at 14.07, Jan Vermaete via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;jan.vermaete=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Question:<br>
I need the python3-unidiff in the -native format.<br>
And the -native is missing at the moment.<br>
<br>
Which tests should I do before submitting the patch to add BBCLASSEXTEND?<b=
r>
Is loading the python package in qemu enough?<br>
Or is there a kind of ptest for -native?<br>
<br>
br<br>
-- <br>
Jan Vermaete<br>
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel<br=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239710): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239710" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239710</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120014516/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120014516/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000459e4206554eb8da--

