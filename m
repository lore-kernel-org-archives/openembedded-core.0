Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.9384.1611762225588824750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=ohRVQijZ;
 spf=softfail (domain: sidebranch.com, ip: 209.85.222.170, mailfrom: leon@sidebranch.com)
Received: by mail-qk1-f170.google.com with SMTP id u20so2089976qku.7
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 07:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CSugcHHQ6UnADzRG/Gf8EsLFJ8Plgr1BQeJbklD9UZE=;
        b=ohRVQijZJokAIGOG3zgu2VtG1+Sok3hIrvOJdOOwMl7aoBOToYAiCT599EFix0XEPd
         tas+sV/ynWTnlwlbpb69q/h1bX1At4AAZHrmJz/mRupRUjBf8OYkJ/MQ+GroAl2fK0Y0
         muqtD/apfMpGU28d/5k6VJuwNnKAxjSljKR2AQp0rS42ZmGR7NZBirxLC0+iTZ+kxLCE
         WJDNz4DPqU+3c7OA5xfCX1PrNHU+txZgz3HnMFNtV9pm78dWVxuJeCfe4mHjPgP6K9oG
         e3rPHpZ4SZSKdwt+1k/FA9XrVIt/YJW5EchPbkf1LRx1ic7yTwmQ8ESrFCUrUoUgPjKH
         jzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CSugcHHQ6UnADzRG/Gf8EsLFJ8Plgr1BQeJbklD9UZE=;
        b=pz8bMInl8jrKxXR/Q80xEr91RGoCv3btoqDVqWMfMlf0XWu/YTUZxghirgk1DI6oD7
         uJ2uH8Sab+ndJwVkQHBypgpNLrcXPl2eVfDoDjvy0K4QJbQ2BP27ROvERw8JURndxNd/
         BP/+KaJxXstd80EVcjxMmoSJhYVO8y5ST9HWeUQqyGNyqL6ZjfDqEOSgBiuh5IIIs181
         kQevb12v40fvge+4PSJ7jkQWzpKv5TeAgqcBz04b2KdKuRiko0By0MiyyaFyJ/yjgFWS
         cPEOGuHyEkzor3zhZxn9fmD6ETBpjgNtm6KV7Y6Oc4HLLCS+/itMC+DGXtkacUbmi3zI
         zwiw==
X-Gm-Message-State: AOAM533hOBhfNQWezK26saWaCyvHR+yUYdHOrS/RB4uNHUv5E0gD8dOR
	5zVXTT3dsXuSm8+lJtC7gb9FamPN9KJp+RVT5nIOQOAAhl6T1Q==
X-Google-Smtp-Source: ABdhPJyB944/sVwfNClmNj1f7iRx0EagecWUkwTaU7cRR6J81Q0lZHDfo4LWcPrO1xdou8XH5dE5MteNrCJIyjdgs9o=
X-Received: by 2002:ae9:f511:: with SMTP id o17mr10726770qkg.215.1611762224364;
 Wed, 27 Jan 2021 07:43:44 -0800 (PST)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <9fa11fda-4154-f371-2b13-06dc33e9ce97@topic.nl>
In-Reply-To: <9fa11fda-4154-f371-2b13-06dc33e9ce97@topic.nl>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Wed, 27 Jan 2021 16:43:33 +0100
Message-ID: <CAMjhiJhR=i2ap+wMmLoqiYGNZSE7+VFLnFc1_oH-7p=yuRFtxQ@mail.gmail.com>
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d8bc1705b9e3a244"

--000000000000d8bc1705b9e3a244
Content-Type: text/plain; charset="UTF-8"

Hello Mike,

At first sight, this does sound like memory corruption in one specific
memory area (DIMM?) to me.
Check dmesg for tripping temperatures etc.
I would reduce both the amount of bitbake tasks and Makefile parallelism to
1 on a fresh run to reduce memory pressure.

Not seen anything similar yet (MACHINE=zcu102, build host i7-10700K w/
128MB memory.)
I would assume aarch64 is widely run by the community.
Let me know if I must replicate a specific set of commits.

Regards,

Leon.

On Wed, Jan 27, 2021 at 4:10 PM Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> When doing large builds, the GCC compiler tends to crash on random spots
> in the code. There are a few common denominators though.
>
> It only happens when compiling for aarch64 (cortex-A53), not for 32-bit
> arm (cortex-A9)
>
> It's random and usually happens on "big" sets like kernel, openssl,
> boost, u-boot etc.
>
> It always reports "during GIMPLE pass: ealias" in the error, for example:
>
> | during GIMPLE pass: ealias
> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function 'do_x509_check':
> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler
> error: Illegal instruction
> | 1239 | }
>
> Compiling the same thing again usually goes fine.
>
> I've never experienced this with the zeus and older branches of OE.
>
>
> I've already tried upgrading to the latest gatesgarth status, and
> cleaning out everything and start from scratch. I've also run "mprime"
> test on my machine (over one hour) just to be confident that the system
> itself is really okay.
>
>
> Ideas to diagnose, fix or reliably reprodruce are more than welcome.
>
> --
> Mike Looijmans
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
> 
>
>

--000000000000d8bc1705b9e3a244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br clear=3D"all"></div><div>Hello Mike,</div><div><b=
r></div><div>At first sight, this does sound like memory corruption in one =
specific memory area (DIMM?) to me.</div><div>Check dmesg for tripping temp=
eratures etc.<br></div><div></div><div>I would reduce both the amount of bi=
tbake tasks and Makefile parallelism to 1 on a fresh run to reduce memory p=
ressure.</div><div><br></div><div>Not seen anything similar yet (MACHINE=3D=
zcu102, build host i7-10700K w/ 128MB memory.)</div><div>I would assume aar=
ch64 is widely run by the community. <br></div><div>Let me know if I must r=
eplicate a specific set of commits.<br></div><div><br></div><div>Regards,</=
div><div><br></div><div>Leon.<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 4:10 PM Mike=
 Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.looijmans@to=
pic.nl</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">When doing large builds, the GCC compiler tends to crash on random sp=
ots <br>
in the code. There are a few common denominators though.<br>
<br>
It only happens when compiling for aarch64 (cortex-A53), not for 32-bit <b=
r>
arm (cortex-A9)<br>
<br>
It&#39;s random and usually happens on &quot;big&quot; sets like kernel, o=
penssl, <br>
boost, u-boot etc.<br>
<br>
It always reports &quot;during GIMPLE pass: ealias&quot; in the error, for=
 example:<br>
<br>
| during GIMPLE pass: ealias<br>
| ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function &#39;do_x509_check=
&#39;:<br>
| ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler <br>
error: Illegal instruction<br>
| 1239 | }<br>
<br>
Compiling the same thing again usually goes fine.<br>
<br>
I&#39;ve never experienced this with the zeus and older branches of OE.<br=
>
<br>
<br>
I&#39;ve already tried upgrading to the latest gatesgarth status, and <br>
cleaning out everything and start from scratch. I&#39;ve also run &quot;mp=
rime&quot; <br>
test on my machine (over one hour) just to be confident that the system <b=
r>
itself is really okay.<br>
<br>
<br>
Ideas to diagnose, fix or reliably reprodruce are more than welcome.<br>
<br>
-- <br>
Mike Looijmans<br>
<br>
<br>
Met vriendelijke groet / kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
<br>
TOPIC Embedded Products B.V.<br>
Materiaalweg 4, 5681 RJ Best<br>
The Netherlands<br>
<br>
T: +31 (0) 499 33 69 69<br>
E: <a href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"_blank">m=
ike.looijmans@topicproducts.com</a><br>
W: <a href=3D"http://www.topicproducts.com" rel=3D"noreferrer" target=3D"_=
blank">www.topicproducts.com</a><br>
<br>
Please consider the environment before printing this e-mail<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d8bc1705b9e3a244--
