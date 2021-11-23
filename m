Return-Path: <jim.wilson.gcc@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A12C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 22:33:34 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.1236.1637706813043995121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 14:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YfSMoBud;
 spf=pass (domain: gmail.com, ip: 209.85.210.49,
 mailfrom: jim.wilson.gcc@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so1121263otj.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 14:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YeIbpM4NeVITaS1AILriWeD31EtHpaaKQzjBQLuSzng=;
        b=YfSMoBudgBVIuJaO8XSAJkkoFf0pq7/S6OacsYorLG7b9ojsqcjFTzuHdJTT5qJjJn
         Dx9L8Q91JTgm5K5+7QrJJuPeTYbybR6WYPwoD+GeyoWhJKNeCH7D6z7lGPiHfn7wdNBE
         rJoEH4XVLxVen47UGqVIYGCH4RNvcVCaPR8hoImNz36Sc7+T1Iv34S5lUF2C0LHGzWQC
         OrZAXjZoRcZTXBlVohQDtsyheWRF1M1z+iZ8fzexo4VjjZwUDjFhHH4jhu8h/x5OyC9s
         AJeIKTIdE6/QQj9ifYWrrXNG2GVkDMMQUw/mQzx8yol/f8Mj9Xr0xz0NDSUN7Qrrh68J
         aY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YeIbpM4NeVITaS1AILriWeD31EtHpaaKQzjBQLuSzng=;
        b=vnYY4I0++Pj+WPDG844YJAua4Xssh/I7EnLN3j7wH4kMK7f9XqCF3XgdWq1rY+zBxi
         Hz/K7fqKrDetRsa5bIDtak0HK8gE/6GZp/5I1kixUZuUor9GPPcrhnVKyLHTBYFSqrao
         yyxFIgJSJJnL+puRAvMM2wgqhDwJE2PN3sj4zjmAu3VpiSLEEb1sqQ849JUnlgGDSaMt
         RJj/g8uBsLRMlJK3N/AOCW9Ebtplj5SUbBbJpa+sJPy6ExmYO+/EUpL9w9SdeWe910Bj
         G2Gd5+HCxQSwgYixQHB6IfzNerv7eeAfydoFgbN0MKiR9/Ft8Rq0nftS0NfXZvLO8RcH
         rmtw==
X-Gm-Message-State: AOAM530H3yhxaQoXdx/DKi8UI32Pn9aItY42c0oQM1z9n60wrYpsw0JR
	hPnrQyUlHT9Jk2IrqqJfAXNtuUWQq8lexSpUGIQ=
X-Google-Smtp-Source: 
 ABdhPJw8k1e7uWCf/7q2oH5fj1L4Kco0eyK1UINYVuTl6dCWDnuBiyLYYT0eFHgY/pHMD7t2+fLRVm78WhvEuVzcfI8=
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr8080043otn.128.1637706812259;
 Tue, 23 Nov 2021 14:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20211116014413.419573-1-jim.wilson.gcc@gmail.com>
 <43d925b8-dc03-21a5-10e1-361b2894373f@gmail.com>
 <CALNwTfy6n-hf+0MOPXhdaUdJxT+ARDYdCyqtNbqYbmxk4B70Yw@mail.gmail.com>
 <CAMKF1soGjXYJJsxbSAmXYb-QDvPv0wqTt+92mr5+1MY-4N5hUQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soGjXYJJsxbSAmXYb-QDvPv0wqTt+92mr5+1MY-4N5hUQ@mail.gmail.com>
From: Jim Wilson <jim.wilson.gcc@gmail.com>
Date: Tue, 23 Nov 2021 14:33:20 -0800
Message-ID: 
 <CALNwTfzAuyGM4X-0+3S4mKrJ0Yiy3RdbFKDdJNva=_EBwviogQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb-common: Add --with-liblzma-prefix in xz
 PACKAGECONFIG.
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca825605d17c542b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 22:33:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158642

--000000000000ca825605d17c542b
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 9:59 AM Khem Raj <raj.khem@gmail.com> wrote:

> yes, this patch is fine in itself.
>

Thanks.  I see that the patch got applied last week.

Jim

--000000000000ca825605d17c542b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 16, 2021 at 9:59 AM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
yes, this patch is fine in itself.<br></blockquote><div><br></div><div>Than=
ks.=C2=A0 I see that the patch got applied last week.</div><div><br></div><=
div>Jim</div><div>=C2=A0</div></div></div>

--000000000000ca825605d17c542b--

