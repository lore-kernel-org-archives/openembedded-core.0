Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA301C10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 13:57:14 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.21264.1715003831473579680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 06:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NPYPXTcn;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-23f02e15fd6so913092fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715003831; x=1715608631; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ObOG9bwuit/NKvdtHFTZjRldHC7Bd7LLG7xYjgnYPvo=;
        b=NPYPXTcnNH/oKC5CV+YVsT6Tky8KVZAxuB+2AYWJO3ESpe3YAvNVXIMqNTKQiZtEOO
         d3+VUCHCCfGNcGX81FvqWHcG6ifqA+rBnUS1FC+GfvI/PyF6hvKKxm93T2tAdrmQvugW
         2KVDWdaYJLXQ30T+p9z10cP4qlX1FINLrWU8lYhOKpv0j/eBe36/FCdFBKr1TYhH0oib
         zDN9AwA1REn1xUjf3lmLZn3zxU9kJoLxJT+0+Ueb6DwhP+BmyV/jdEor2cCmdvXGZJ7f
         nTIZRnmGBMk1BdGEYdAXhChiyPWoguMAEPXDwq9oqXO/2yLS5NYps43Jsc/3Y75c1GDK
         BPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715003831; x=1715608631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObOG9bwuit/NKvdtHFTZjRldHC7Bd7LLG7xYjgnYPvo=;
        b=TXuLkHLeQnAZC3mCjl3+cZBaWOB7+ZMStDEQCiDpp2mipFZZIzTl0T/bEmzIvUj+Eu
         MMeY+dYQDrxIQwuNM95GDRfRugr45k6oYyExx2yxVtOgIyC7u6Qmfr8N6ZO3C4hqR0Af
         tWzvFiuzsWs1fqxsyWFyuILXJ6AXH3l+Q5uCzIh6uudekEoRFK5f8K/CLJe/Ejo8aHU6
         1yfwBLXuak3pn91o3QddySc2163n1c3bTnz6/Zp2mtiwkcwRDo1glSZszqFrk9P8IO+i
         AGZYgJAGbVc6ykOQnysKS7ANmjB9dmEE2PPyef0vKoXvhF2O80TRX4osatcxWTNBwYlf
         q/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVv+t/UvzdTySKeKh0sG1Dj44ClPqBFgFUUpiWMirm6Kis/IWCLfzyem/TZMNRmOor46GFZzTr7eapMaehCsikcQxDZtr+dMO7h/onmB0QmW0UW5E3J9ze+
X-Gm-Message-State: AOJu0YzeAnoQSbHDqvOpuqQw7nBKvKPNZ0IiQhNHPiFgYKsRVeHmbGJu
	R0ZatMuxXjALgJ4BCeuk4QLaA3KIl4i5HIAvIqNd4YeLS4z18UPvdZ8th03stRpuQAmgPHKumKI
	XeaaZfdGjT/wqOBQsHhReR1xkAc4=
X-Google-Smtp-Source: AGHT+IGh59R86WM0eS0V/iYka8w1cEr2meebTzYH2NTPTKJZp05YglelEDce4gMAjbfjybfnjYFS3saJ8IdrnMRjv+A=
X-Received: by 2002:a05:6870:d205:b0:23f:ba88:d5ac with SMTP id
 g5-20020a056870d20500b0023fba88d5acmr1906095oac.53.1715003830419; Mon, 06 May
 2024 06:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <58234ff1-421e-4907-b303-5f733397a363@bootlin.com>
In-Reply-To: <58234ff1-421e-4907-b303-5f733397a363@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 May 2024 06:56:59 -0700
Message-ID: <CAMKF1spFTiAO+PngFDCQvGBw2cBd3xNJi_1HkrEQ2Dp89CG8QA@mail.gmail.com>
Subject: Re: [OE-core] python3: ptest failure
To: joaomarcos.costa@bootlin.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000019cbf30617c972d5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 13:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199044

--00000000000019cbf30617c972d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 6:51=E2=80=AFAM Joao Marcos Costa via lists.openembe=
dded.org
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:

> Hello,
>
> I noticed the ptest failure below, in a recent build:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6570/st=
eps/12/logs/stdio
>
> WARNING: core-image-ptest-python3-1.0-r0 do_testimage: There were failing
> ptests.
> Traceback (most recent call last):
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtim=
e/cases/ptest.py",
> line 27, in test_ptestrunner_expectfail
>     self.do_ptestrunner()
>   File
> "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtim=
e/cases/ptest.py",
> line 120, in do_ptestrunner
>     self.fail(failmsg)
> AssertionError:
> Failed ptests:
> {'python3': ['python3']}
>

I think there are detailed logs where it will show
Individual tests which failed

> As for the builder/worker: qemux86-64-ptest debian11-ty-3
>
>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199043):
> https://lists.openembedded.org/g/openembedded-core/message/199043
> Mute This Topic: https://lists.openembedded.org/mt/105939494/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000019cbf30617c972d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 6, 2024 at 6:51=E2=80=AFAM Joao Marcos Costa vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
joaomarcos.costa=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bo=
otlin.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><u></u>

 =20

   =20
 =20
  <div>
    <p><font face=3D"monospace">Hello,</font></p>
    <p><font face=3D"monospace">I noticed the ptest failure below, in a
        recent build:
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/6570/steps/12/logs/stdio" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/81/builds/6570/steps/12/logs/stdio</a></font></p=
>
    <p><font face=3D"monospace">WARNING: core-image-ptest-python3-1.0-r0
        do_testimage: There were failing ptests.<br>
        Traceback (most recent call last):<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/cor=
e/decorator/__init__.py&quot;,
        line 35, in wrapped_f<br>
        =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/cor=
e/decorator/__init__.py&quot;,
        line 35, in wrapped_f<br>
        =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/cor=
e/decorator/__init__.py&quot;,
        line 35, in wrapped_f<br>
        =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/run=
time/cases/ptest.py&quot;,
        line 27, in test_ptestrunner_expectfail<br>
        =C2=A0=C2=A0=C2=A0 self.do_ptestrunner()<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/run=
time/cases/ptest.py&quot;,
        line 120, in do_ptestrunner<br>
        =C2=A0=C2=A0=C2=A0 self.fail(failmsg)<br>
        AssertionError: <br>
        Failed ptests:<br>
        {&#39;python3&#39;: [&#39;python3&#39;]}</font></p></div></blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">I think there are detailed=
 logs where it will show</div><div dir=3D"auto">Individual tests which fail=
ed=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div><p dir=3D"auto"><font fac=
e=3D"monospace"></font></p>
    <p><font face=3D"monospace">As for the builder/worker:
        qemux86-64-ptest debian11-ty-3<br>
      </font></p>
    <p><font face=3D"monospace"><br>
      </font></p>
    <pre cols=3D"72">--=20
Best regards,
Jo=C3=A3o Marcos Costa</pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199043): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199043" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199043</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105939494/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105939494/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000019cbf30617c972d5--

