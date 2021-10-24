Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8698BC433F5
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 06:25:14 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.15865.1635056713926112751
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 23:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IJNH2jYh;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id b4so3593575uaq.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ISufcakQtV1y+7eGRj+51aeDlceI4XifHRVYkaH7VoA=;
        b=IJNH2jYhZNxR05c5AZqmhAAdFPFAVGbA5l9bpXHnEQfbJykSoRXprOVcSJqs9fBo/V
         NdxDflLe0ETJoimnVb2xPRDzuUSdK7Ug8gj57xAgKaxDvrqCIXVVLg82YkJmUJhOePUR
         HLaGNuCDgvBQKiSDbq5h2eCc3avgAjBbISdZpLaZ1HLXUuJJm8G0Pw/mEjvmJi1j3MtL
         Mit//osVRbWhyrQ0Lv1Cc2PHVR4teI95Fl6+0I6jH+TlQOSgbQt2hqu/osVDSN99YRQI
         Wp1VuXl+KYyT/mJsZhZ7tQyhqVOZpQYVHR+j9jCgVZr5S0hx8lJ50hLe8CoNKOq0AmXf
         rHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ISufcakQtV1y+7eGRj+51aeDlceI4XifHRVYkaH7VoA=;
        b=jB6HihMHCBAWOkFP9uHKCrmtqdFY+obNCMgUgmH/zjTcVNRHH6oX0yHXO8GfUWkjG7
         kEt9MNlfowzLETeC5VesEc4AJ0T8HJp/Vz14ZnLgOGEv4o3LyZeGOKN7VoqJx/Zcm9dg
         /nQYdTDjdfiy58mZi6XPm6kBTAgkYaP50L5SU8WU+YCemGqkmzCp3bKasAh9jgWj16cN
         BdAq5R/iHMxC4iXCK7kLOJuMFfB4thPhthuvQQqQNuJd6UlKYGCbwgXhQ+wChdr+N/qf
         BurPutjIFPcj6a08hUTndW26ODkRKG8Ek8QhRxrX5Gf8LCHpsdDvNifGJOaBMhav9dAJ
         JFkw==
X-Gm-Message-State: AOAM53102UnYAve08mhZfkGcrZxOEzoAH3EczhXPf34Z9zl23fN6jpRm
	SR8OJwj8pQDaDXno7AjZLZDzotDRj/IXYp8jqdo=
X-Google-Smtp-Source: 
 ABdhPJyoQZcnk0209bQGsLtX418+1Y9+zk5cuGgJt+vmyMKcQGFjyfG2XHFkvMLY4NJrky4IplM0XHoF23pnFpqoS44=
X-Received: by 2002:a05:6102:942:: with SMTP id
 a2mr4624981vsi.18.1635056712980;
 Sat, 23 Oct 2021 23:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211023181641.424368-1-raj.khem@gmail.com>
 <16B0BC8D2D865084.16488@lists.openembedded.org>
 <16B0BCF990E2640F.16488@lists.openembedded.org>
 <CANNYZj-eX+=QT30g7e50igBLsVjZB2tvs-0QAKsnfJSuNk-9TQ@mail.gmail.com>
 <CAMKF1sq0Dwfs3e78bj7pfUWFbZ8AdOEFXa6pDi74ricLBHWseA@mail.gmail.com>
 <CANNYZj9KuNZX16BwQ2mnjJd24N-Wu1=Lvq7+sQRjN8NaPfnEHg@mail.gmail.com>
 <CAMKF1spbzRoRRJX5rdkMxs8zR0xKw1a9A+2YXKwTeLCuM51=7A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spbzRoRRJX5rdkMxs8zR0xKw1a9A+2YXKwTeLCuM51=7A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Oct 2021 08:25:01 +0200
Message-ID: 
 <CANNYZj-exUC_MEXCaMVktyFFCdwPyu1M3QbypnmwN-HDJP4jTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Disable 64bit atomics in crossbeam for
 rv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000909e4c05cf134ed9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 06:25:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157320

--000000000000909e4c05cf134ed9
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Oct 2021 at 23:12, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Oct 23, 2021 at 1:12 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> I'm not sure I understand.
>>
>
> try MACHINE=qemuriscv32 bitbake librsvg
> and try out your suggestion and if it works then lets rework this patch.
>

There is already a patch that fixes the same atomicu64 error for
powerpc/mips by making sure targets match, so I'm sure it will work.
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-the-architecture-not-the-.patch?h=master-next

Alex

--000000000000909e4c05cf134ed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 23 Oct 2021 at 23:12, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">On Sat, Oct 23, 2021 at 1=
:12 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br><div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>I&#39;m not sure I understand. </div></div></blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div style=3D"font-family:monospace,m=
onospace">try MACHINE=3Dqemuriscv32 bitbake librsvg</div><div style=3D"font=
-family:monospace,monospace">and try out your=C2=A0suggestion=C2=A0and if i=
t works then lets rework this patch.</div></div></div></div></div></blockqu=
ote><div><br></div><div>There is already a patch that fixes the same atomic=
u64 error for powerpc/mips by making sure targets match, so I&#39;m sure it=
 will work.</div><div><a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/=
tree/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-the=
-architecture-not-the-.patch?h=3Dmaster-next">http://git.yoctoproject.org/c=
git.cgi/poky/tree/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-c=
heck-only-the-architecture-not-the-.patch?h=3Dmaster-next</a></div><div><br=
></div><div>Alex</div><br></div></div>

--000000000000909e4c05cf134ed9--

