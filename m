Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072DCC43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 21:00:56 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.10610.1658610046813503236
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 14:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zlglzi3T;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id b25so5985087qka.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zD6mZ82oy9dYLlft/SH55pBm3Tw6l41gv6YVsRKdEU4=;
        b=Zlglzi3TnxyLNwH9hIqyadghMv3vXvNHacFTa25SmRfufpyFXi7VakWFRXhAihbcBK
         Vy3lyu4z/5t0hd/HPvk/zeTewcx52M/50LhQh7MqTlKn0ElvgJwDQXq6YdyhvNe/rk4r
         GaVdjqApWsoCLkrEF4/eLT8uF2X4K3uVikTMZP2+hIyAYXucpZamdjUQgv6DRgxUMlbG
         fPorRwVufyiIkXhVgkSfpmXcf01FeFnS2GbZQVaTcP9Jqbez1mJYT3ZujbHUgibDnm/L
         uIWF8b2kmv2Tomzzmf3Mt47Uqn7rLk41bZX1aPDzGLsbtkL9kAVHJIM9lVjkA1KKz8Le
         1VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zD6mZ82oy9dYLlft/SH55pBm3Tw6l41gv6YVsRKdEU4=;
        b=7jczmP927jNzMfp/WUnoTzaNxdjNa7qp85AtjhnQhf0ms7nXOrkIRD28BNC3CoDqbJ
         K5VVyedP6vNRjsMFYLPqlmto7CmInc3P0Sofe6pEmxvwbKsPV4BqXC4K5mmpoa6uyxR1
         QsIrPeXXWZtU9fFkw7Rr5S7DfiXFj16GNkbJLc0fORiggC/nmg+FxoYCsXUpETHZH77U
         fGvYlZEmWod6olxJUNTljoGkIcUE80WKLP9WOV3pgNIiHhXuSIRNxBX+fyrul2EO9aDh
         jqf03tKou1rhHLX7hR3iUcFAlC3WevV4ED7kmN8Su8d2vnrAgleEnBlbKhJ/RKOAqj8K
         cilw==
X-Gm-Message-State: AJIora/lLDoRnK9gmUXzC4Z3BbFHIiXLTkmYP0tgRIZqZPGeeXcLmuYN
	6kpXnVk8Oa78yA1JKdmnX8shAfHMXkiuquzaZbs=
X-Google-Smtp-Source: 
 AGRyM1v0TdVNZfmoctYUXdlNJ2+PianrS2ib0Dkw7E9O27VU0C8tLb8wfvPWpLT/zG4lb150WEmjqfqRVn/TGlwXlL8=
X-Received: by 2002:a05:620a:2449:b0:6b5:f01e:d6cb with SMTP id
 h9-20020a05620a244900b006b5f01ed6cbmr4580135qkn.463.1658610045786; Sat, 23
 Jul 2022 14:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220723132409.61635-1-pevik@seznam.cz>
 <CAMKF1soaJ_4v0WDQj+wGvnr8-QDOYHwsGXQUBdU7osHpEVwFUA@mail.gmail.com>
 <CAB1t1Cx1uf4XdDwtjBYps0gpXfB=sdC7CRuh8p_bGWpfy6UDHA@mail.gmail.com>
In-Reply-To: 
 <CAB1t1Cx1uf4XdDwtjBYps0gpXfB=sdC7CRuh8p_bGWpfy6UDHA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jul 2022 17:00:34 -0400
Message-ID: 
 <CAMKF1sqjb5sV_2wgU5bhcyoSjPojTx853V3RUXafKC1+EScv6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Add post release runtime fixes
To: Petr Vorel <petr.vorel@gmail.com>
Cc: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Petr Vorel <pevik@seznam.cz>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000999f9405e47f3ecf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 21:00:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168446

--000000000000999f9405e47f3ecf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 23, 2022 at 4:34 PM Petr Vorel <petr.vorel@gmail.com> wrote:

> Hi Khem, all,
>
>
>> >  6 files changed, 466 insertions(+)
>> >  create mode 100644
>> meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZ=
E-from-memcg_li.patch
>> >  create mode 100644
>> meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-complete=
d-in-thread_b.patch
>> >  create mode 100644
>> meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-fro=
m-tst_net.sh.patch
>> >  create mode 100644
>> meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
>> >  create mode 100644
>> meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout=
.patch
>> >  create mode 100644
>> meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runt=
ime-to-5m.patch
>>
>> These patches don't seem to be added to SRC_URI as I don't see the
>> recipe changes in this patch.
>>
> Thanks (forget to amend) =3D> I've sent v2.
>
>
>> we use a commit in SRCREV, I wonder if it makes sense to just bump that
>>
> Although I used to advocate against backporting many runtime fixes, now I
> slightly prefer to use releases than random git snapshot unless number of
> patches is reasonable. But sure, if others want we can use latest master
> (usually the best LTP).
>

Actually it depends if there are many commits I between these and tip of
branch is not CI=E2=80=99ed then I would think backports are better

>
> Kind regards,
> Petr
>

--000000000000999f9405e47f3ecf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jul 23, 2022 at 4:34 PM Petr Vorel &lt;<a href=3D"m=
ailto:petr.vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><d=
iv>Hi Khem, all,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt;=C2=A0 6 files changed, 466 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-memcg-func=
tional-Fix-usage-of-PAGESIZE-from-memcg_li.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-mountns0-1=
-3-wait-for-umount-completed-in-thread_b.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-net_stress=
-Fix-usage-of-variables-from-tst_net.sh.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-netstress-=
Restore-runtime-to-5m.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-nfs05_make=
_tree-Restore-5-min-timeout.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-m=
igrate_pages03-restore-runtime-to-5m.patch<br>
<br>
These patches don&#39;t seem to be added to SRC_URI as I don&#39;t see the<=
br>
recipe changes in this patch.<br></blockquote><div>Thanks (forget to amend)=
 =3D&gt; I&#39;ve sent v2.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
we use a commit in SRCREV, I wonder if it makes sense to just bump that<br>=
</blockquote><div>Although I used to advocate against backporting many runt=
ime fixes, now I slightly prefer to use releases than random git snapshot u=
nless number of patches is reasonable. But sure, if others want we can use =
latest master (usually the best LTP).</div></div></div></blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto">Actually it depends if there are man=
y commits I between these and tip of branch is not CI=E2=80=99ed then I wou=
ld think backports are better=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"auto"></div><div><br><=
/div><div>Kind regards,</div><div>Petr</div></div></div>
</blockquote></div></div>

--000000000000999f9405e47f3ecf--

