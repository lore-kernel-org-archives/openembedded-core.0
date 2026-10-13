Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DDCCA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:24:39 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3794.1791887073559638651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CjsPUrl8;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-534e6545939so22349431cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 03:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887072; cv=none;
        d=google.com; s=arc-20260327;
        b=qPWO7lmzACDtInZ366tpRMdL97xOAeK1ZdFEJeAPLyhfxTfRD4sypw995ETNLltalM
         tfUGe87bVm8Vxwvx4lxsmlGU7B/LO+5xIfT+JWlkA/6Y6Lb4xov4UydrwqRxXfh99GCo
         s7wqOBFp+FWAWq5FqYwcP68i9KBxCSJTlTwrLJzim1xPjXx055ZQMNnU2MZoZlrlf2Bw
         lGk+/6CjtkODlHN/dBVU493gvVtxmjFGtj2ru/eJDJds6RIYDwogQKr0SBIsyvmkag9L
         QYGAPURG/nqHFe8mFRwElgLyFffRtvIVzh47hEDQqD6ByCjArk6LkFADTPn8SG1vRmRe
         Ep3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/zYRhdbEiXNWcOCkVE28FAYLe+IJ4FZ/kM/CoB3Cuzk=;
        fh=PmRlrUr4fPzdrmqYL26YQhih7ON+5j/GRPlovzxMdkU=;
        b=mwyXp3DOrXPhKLHy4oyyUoscJu1ZnDcjdVlxidaWtZ+PvuShlu6FJGwVdpeMH89CX2
         P/hb/op1WLnxeWuYbZr0pXrWhyV8au3ypDOlpgUF8aM5sHfyGKcJWszfftyGooGaD3f+
         oeYOIKpJcXegd2YSWHo/M0RVMYEZmF2TaPKzZjX1uR+ECJ+LesA4K/zwr87H0K2S243A
         4LwRDhp76Z9CzR6HRpXYWOGMxYMDa0mFUK4USYIU8a/kjRy9DSgx9y2MdrhGvLDUa7et
         9BR292JE9xCmHHuG/JD9uNcZUsZ9tmUPDvOGbvpd161JMd5+/wslp2AmqcGsFst4r0NQ
         lN3g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887072; x=1792491872; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zYRhdbEiXNWcOCkVE28FAYLe+IJ4FZ/kM/CoB3Cuzk=;
        b=CjsPUrl8u/wOakdXvpWMho1aKBvG9OgpjysQe74b3HN4gSeQhZsXB+018xF10RcFTz
         5A+dhQxw9ofIY9wmMFNcxwkjySJB2CEytVFju6LbKFGA/paS4Tlp1xic5WtMNUC/g4S1
         o3npPAB6yM1XfjZgp0SiwzIPTBgG5Ne7yk4TZgJxBtuzAWqHzv9Iqd5Y9TSvvXcqMFw9
         +ofgBlQh3hcShDVfuhyASS8F3zFKY2f0sk4/S3M0PaOtQsf8NRc/UW/zeo8gM1jAUlVh
         k3ivcRr4EhHsFLcHHpdflwz7LVsUsN3S7wMsO+jjuUsRAFHWDScnrTjpP6ua4BqTAZQm
         ZYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887072; x=1792491872;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zYRhdbEiXNWcOCkVE28FAYLe+IJ4FZ/kM/CoB3Cuzk=;
        b=Uphtuz0gTtxflNwjkPo+RNsJnQZq6HxS3dYIFugT+WT+CJ9904LDSv/wZQUI4buVsb
         3Iujdv/fL4fzkf/yxMgYYcje9ts4ME/fjWwdFcoeyTUrOXvBKVOD+UU8TXcy0I7Q4VG+
         KMfPWoICgoA3T/5j0/lAPUlB95HAAaDgwsl/uqPcGKuW2SzLdgZzr7e/U9pAvULJg/3u
         YX0mJ3VQoSApgfEdh8AQjQxnIhOIPOI+4W3AyqnAfiXTSdGTcj2tjGs9ChiopuT7CSM6
         kyPvRlkF0mwM9GFtzG22tpteH4f30V7Wksvjk+JuXeHCocTFaEadCqa2N5qiBh1z/9l7
         PTTA==
X-Gm-Message-State: AFq9FYLKOqvLiCOxWHj+f65AFo70NaGTLFBUa/KEmNSznJyosA+ySRg1
	STnKpSnL49c4KmMLP/EmH6yoVEA5QgZNyms8K+5lHgGYL15vOzpZCas0/+Jh6K6DQfuSywfFxhK
	rPtzpbM5EategSYcpe49cAen7Vzts4BY=
X-Gm-Gg: AYBFou362ohqOjPbiKkh85o21cee23f5D1+57mdjDiaThn43+awa58t5geo+2l/WGAz
	p7QSVKRmCUAacAUaUHIT/xgH3XABsSr7J523McoEuzncJYahh2f8gSbXwzVYoO6o+HcqyFry5fl
	znC0AJk+2ZMheJ/T2an9N54TLQQmILeSf/Ca57H/kM8jA1DfuRMl6dkEorzfgsJKlDEacKGpPJS
	naO4GYjrxcePEiisz82Tg7p+xqSRvSo4UThEVEc3OCZSkvPmjLQ/ouY4Cyb73me/flEXPwXw/q4
	BwThkjg31HBj7I+VnWD3KRI4ezYO6GJppe3u8CsOkzdUW+NUf2dbhyOGHLa0Ve0zwHKbMlJj0hv
	s54o813odZaSizA==
X-Received: by 2002:a05:622a:999:b0:535:958:b9c1 with SMTP id
 d75a77b69052e-5359f46f32bmr196317831cf.11.1791887072426; Tue, 13 Oct 2026
 03:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261010113029.2347847-1-ecordonnier@snap.com>
 <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
 <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
 <CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com> <CAHUKmYbEwbbsx+DeAvw+wf9AggQws0G4nGbjWe=Wp4ESxe5kaA@mail.gmail.com>
In-Reply-To: <CAHUKmYbEwbbsx+DeAvw+wf9AggQws0G4nGbjWe=Wp4ESxe5kaA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Oct 2026 12:24:21 +0200
X-Gm-Features: AclHuK-XTYpaibE-Oceveh8LDBYQUc0wxlRINEJrD601uywCyPRn0jEQiFEiUOU
Message-ID: <CANNYZj9jFTEXEidQ=ZOOdwWV00b_gDpQW39HJdshvqX3RT085g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, collin.funk1@gmail.com
Content-Type: multipart/alternative; boundary="0000000000006e00cf065db6380a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 10:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247715

--0000000000006e00cf065db6380a
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 12:02, Etienne Cordonnier <ecordonnier@snap.com>
wrote:

> > - investigate and propose a plan for pseudo compatibility. It's not
> easy: pseudo relies on substituting libc API, and rust binaries issue
> kernel syscalls directly.
>
> It is doable, since uutils-coreutils already uses the libc crate for many
> things, and the rustix crate can be configured at build-time to use the
> libc crate instead of using kernel syscalls directly.
> On the other hand, PREFERRED_PROVIDER_coreutils is independent of
> PREFERRED_PROVIDER_coreutils-native, and very few recipes depend on
> coreutils-native, so I suggest decoupling a potential merge of
> uutils-coreutils with pseudo support. The target version delivers almost
> all the value, and pseudo compatibility can follow separately. Or am I
> missing something?
>

It's not just about coreutils-native, it's about what implementation of
coreutils is provided by host distributions. For now, the project has
forced GNU coreutils on Ubuntu, but going forward this may not be
sustainable:

https://git.openembedded.org/openembedded-core/commit/?id=16f2684ebeffa72b5d90525cf9102751b68c298e

and we'll either have to convince distros to build with libc crates, or do
such a build ourselves via -native recipe.

(note also all the fails that were observed when trying to use uutils from
the ubuntu host, which means at least a year ago it was nowhere near mature)

Alex

--0000000000006e00cf065db6380a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 13 Oct 2026 at 12:02, Etienne Cordonn=
ier &lt;<a href=3D"mailto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr">&gt; - investigate and propose a plan for pseudo compatibility. I=
t&#39;s not easy: pseudo relies on substituting libc API, and rust binaries=
 issue kernel syscalls directly.<br><br>It is doable, since uutils-coreutil=
s already uses the libc crate for many things, and the rustix crate can be =
configured at build-time to use the libc crate instead of using kernel sysc=
alls directly.<br>On the other hand, PREFERRED_PROVIDER_coreutils is indepe=
ndent of PREFERRED_PROVIDER_coreutils-native, and very few recipes depend o=
n coreutils-native, so I suggest decoupling a potential merge of uutils-cor=
eutils with pseudo support. The target version delivers almost all the valu=
e, and pseudo compatibility can follow separately. Or am I missing somethin=
g?<br></div></blockquote><div><br></div><div>It&#39;s not just about coreut=
ils-native, it&#39;s about what implementation of coreutils is provided by =
host distributions. For now, the project has forced GNU coreutils on Ubuntu=
, but going forward this may not be sustainable:</div><div><br></div><div><=
a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D16f26=
84ebeffa72b5d90525cf9102751b68c298e">https://git.openembedded.org/openembed=
ded-core/commit/?id=3D16f2684ebeffa72b5d90525cf9102751b68c298e</a></div><di=
v><br></div><div>and we&#39;ll either have to convince distros to build wit=
h libc crates, or do such a build ourselves via -native recipe.</div><div><=
br></div><div>(note also all the fails that were observed when trying to us=
e uutils from the ubuntu host, which means at least a year ago it was nowhe=
re near mature)</div><div>=C2=A0</div>Alex</div></div>

--0000000000006e00cf065db6380a--

