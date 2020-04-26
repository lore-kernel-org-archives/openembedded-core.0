Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web12.5655.1587933650820338775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 13:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qJWWp2zA;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id a10so15322647uad.7
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YUh6OEpS9o+rCsLgirsVsv0K9R5x4xtibWGxf+Yqrg4=;
        b=qJWWp2zA0R+FKyE0m8pOIr5r+e/3FggeV5E2qQd+jK9X1+TALnqmqA3rRndAcWnMgc
         chtfB0OhMFgKUJJJh9RPCVDhK+MX2wDuirlz3tGnoUG1TKb5whwI3kZl1WH+w8ulC/Qx
         zN3qKRy28C2JRNRFQ1Cm3ScDLt4hZqCOktA97RZLtLUrwcmrmiyOu/n+bm3oDxabYDx0
         6lNaqymxH7AobU7oVdZbdMJQ8iMLdJx2PblUypgANjPt2h29LqGv2eD0mNf4Qt+/0Xxf
         NjEQc73Zim7UxgbbsC/A5VzOs2J7HuqFtWxQjMceCu2WJmCTeiv1C0kKbRSbUjNr5Ao2
         3Skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YUh6OEpS9o+rCsLgirsVsv0K9R5x4xtibWGxf+Yqrg4=;
        b=TkBOl3FH+RrSR2jenI4BWRmDrtB1joTXfrlXcY5B1/vzPpSoj3eKt+5IuE83pyUXca
         5v69yCgVCh+s7/tfmPswXd7slP1IswvYYUGgBZOnL9E7Brn8ZjN1RFB8mdSlXvrcpdOD
         03wO/Uala9xI5BRlxQ9XFpr3iHP80JPGDCQN5LAc+9+yajS4MSaYUgt7DodpRsiCStHf
         TJCEEJ1UT599NEt0m76CVo2tWD8Hb0slDEp1Cbo8emx7wX8878IV9DzfB72e1115fCwT
         3aQCYKHKTmUZHHClfec7YwPACyonOtXKowcGG1Evt7kEaqmLFdpoW4PB9/RFNmCENkxs
         yqPw==
X-Gm-Message-State: AGi0PuY41IGi4scnhytONjJxq/ogVJ/CPToQ5wPJbrdflCcucCdvg808
	dJkLlJuAMVwEZnZhr3IdgHNz/VXsSAzk3u0Xdo4=
X-Google-Smtp-Source: APiQypIbYPtUKpHlIzIFKUXUa++AbLiRRpLv2mKR9r2/nf82JLxVb/D0zmifO2bkrOsFSH8vYobUYLYZjB1ZoK7n7fc=
X-Received: by 2002:a9f:31c5:: with SMTP id w5mr13821647uad.89.1587933649958;
 Sun, 26 Apr 2020 13:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org> <160972188EAFC253.2907@lists.openembedded.org>
In-Reply-To: <160972188EAFC253.2907@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 26 Apr 2020 22:40:38 +0200
Message-ID: <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000021fb6d05a4379d67"

--00000000000021fb6d05a4379d67
Content-Type: text/plain; charset="UTF-8"

I started looking into it, but quickly found that all or almost all the
failures are all due to the rpm upgrade, and the failures all happen on
three old distros: centos 7, debian 8, ubuntu 16.04.

What is particularly odd is that the centos/debian failures are
non-deterministic: in some cases rpm-native fails to build due to missing
omp.h, in other cases it builds, but the resulting binaries segfault. This
non-determinism seems to happen even on the same worker, e.g.:
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1812
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/2073
(one is failing in do_compile, another compiles fine, but then produces
segfaults)

Ubuntu always segfaults, but maybe it's just coincidental.

I am not sure how to take this further, but maybe the best course of action
is to defer the rpm/dnf update once more, until those old distros are
finally retired.

Alex

On Sun, 26 Apr 2020 at 20:29, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Sun, 26 Apr 2020 at 19:35, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>>
>> There were some failures from this series:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/890
>>
>> It may be easiest for you to have a look through that build result as I
>> think all the failures are from your patches as that is the main thing
>> in -next! :)
>>
>
> Thanks Richard, I'll work through these one by one. Hopefully the amount
> of actual issues is a lot less than the amount of red in that build.
>
> Alex
> 
>

--00000000000021fb6d05a4379d67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I started looking into it, but quickly found that all=
 or almost all the failures are all due to the rpm upgrade, and the failure=
s all happen on three old distros: centos 7, debian 8, ubuntu 16.04.</div><=
div><br></div><div>What is particularly odd is that the centos/debian failu=
res are non-deterministic: in some cases rpm-native fails to build due to m=
issing omp.h, in other cases it builds, but the resulting binaries segfault=
. This non-determinism seems to happen even on the same worker, e.g.:</div>=
<div><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/=
builds/1812">https://autobuilder.yoctoproject.org/typhoon/#/builders/75/bui=
lds/1812</a></div><div><a href=3D"https://autobuilder.yoctoproject.org/typh=
oon/#/builders/15/builds/2073">https://autobuilder.yoctoproject.org/typhoon=
/#/builders/15/builds/2073</a></div><div>(one is failing in do_compile, ano=
ther compiles fine, but then produces segfaults)</div><div><br></div><div>U=
buntu always segfaults, but maybe it&#39;s just coincidental.<br></div><div=
><br></div><div>I am not sure how to take this further, but maybe the best =
course of action is to defer the rpm/dnf update once more, until those old =
distros are finally retired. <br></div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sun, 26 Apr 2020 at 20:29, Alexander Kanavin via <a href=3D"http://lists.o=
penembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;alex.kana=
vin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Sun,=
 26 Apr 2020 at 19:35, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
There were some failures from this series:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/buil=
ds/890" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/890</a><br>
<br>
It may be easiest for you to have a look through that build result as I<br=
>
think all the failures are from your patches as that is the main thing<br>
in -next! :)<br></blockquote><div><br></div><div>Thanks Richard, I&#39;ll =
work through these one by one. Hopefully the amount of actual issues is a l=
ot less than the amount of red in that build.</div><div><br></div><div>Alex=
<br></div></div></div>
<br>
</blockquote></div>

--00000000000021fb6d05a4379d67--
