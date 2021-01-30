Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web12.3147.1612010029129230880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 04:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l+76Xi1W;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id d81so12279683iof.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 04:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QlYyrl8umr7puFP69bcapImoGJ1A1HLRhYLDSXuMQes=;
        b=l+76Xi1WwJFr85HeGThuvnur/TwBqfOZG/7ciUY6YE5TCLiKlHpMQpZZ/cT3qAN/bI
         IRp83YiUxkKMoYKFqi74z8RKqbuSo2oCNT2qhp4DD5JEXBCY2mqr0wnxgEZ8bk547xOO
         Dtp0fNTviswAayG2x4os6UurcZIQWiOUKS59rHyrTUCeIu3hnuv1sZ8Y/rc9V9ySGFUp
         QDkzFuJD18hfvxtZyKtogq8Q1Xsi3lMW982vKlwj6S4s53Xxkhko9XpUgSfNKDOTkfIF
         dNEgWx6uWdkCOi3g60C6FAh8qs5Tcv8W+afdYsPwNeYkrzhx3GJ2iAzm1ZZLGnFld9V5
         uLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QlYyrl8umr7puFP69bcapImoGJ1A1HLRhYLDSXuMQes=;
        b=sDtyLA2RNBh2uFGLp5ycZL9A20ywjmfFfOXh7LCCRd/tXDkJvO0/0JGF73NaxyYIxh
         VkhUqVZx0eMCLrqvocrgp8EobPkp2DLhfjravq3odGRNoTPfED7VgSTC7+z9lXQbxjzx
         En7SChxaHdAK1G1dtj9t07z7HBwN1zX3rLiUBvCLb8UK3jA9clRlViUeZvQVIdQkXuKs
         vOfixtg3ygh7kHsRa/ec7tfs/YgN42KmznMj0W/ya7XCY160wQrYf2aGrY1ggr4jZNxy
         jIPf+0WG5m14XAT+oCEJlETOZY47Yyn3+A9IpCRxq1j4+BBsGtDll5qbbRSR9iw5hyrG
         hEHw==
X-Gm-Message-State: AOAM533D5THRYuUMVRuNrjMjuz7KH7Lz1uaDObnwyYs+0L+z6s4v0wP2
	5oZ0zo46Ea08FzD62QgsQSmappKGMLwLv0AButM=
X-Google-Smtp-Source: ABdhPJzzcEUEkm35FIDTjdeRKh7sSOOjb0vOjSStJapAVTvKlCcRlHN+iykTeFbMcOchm1iRfLOE6FxsRdSl9m/9m5U=
X-Received: by 2002:a6b:d20d:: with SMTP id q13mr6841533iob.71.1612010028609;
 Sat, 30 Jan 2021 04:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20210128172313.7681-1-tomasz.dziendzielski@gmail.com> <70cd3945856eb783c7239fd716eeea39b127e773.camel@linuxfoundation.org>
In-Reply-To: <70cd3945856eb783c7239fd716eeea39b127e773.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Sat, 30 Jan 2021 12:52:46 +0100
Message-ID: <CAJkqNs13mzhNW7vgbZbRSUTz5XziB5XkC3FspZR=9Kq=asewpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: multipart/alternative; boundary="00000000000021340905ba1d55de"

--00000000000021340905ba1d55de
Content-Type: text/plain; charset="UTF-8"

>bitbake patches need to go to the bitbake-devel list.
>
>I did put this into testing anyway and it triggered errors in several
selftests:
>
>bitbake-selftest:
>https
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/11/logs/stdio
<https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/11/logs/stdio>
>
>and oe-selftest:
>https
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/14/logs/stdio
<https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/14/logs/stdio>
>
>(these occurred in all the selftest builds but I've just linked to one).

It seems in these tests multiconfig targets can have more than 2 colons.
Probably changing "== 2" to ">= 2" should help.
I tried "bitbake-selftest" and with this change and it passed.
Unfortunately now I don't have access to machine that could handle all
oe-selftest. Could we agree that I will send second patch so it will be
tested on autobuider?

Best regards,
Tomasz Dziendzielski

--00000000000021340905ba1d55de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-family:sans-serif">&gt;bitbake patche=
s need to go to the bitbake-devel list.=C2=A0</span><br style=3D"font-famil=
y:sans-serif">&gt;<br style=3D"font-family:sans-serif"><span style=3D"font-=
family:sans-serif">&gt;I did put this into testing anyway and it triggered =
errors in several</span><br style=3D"font-family:sans-serif"><span style=3D=
"font-family:sans-serif">selftests:</span><br style=3D"font-family:sans-ser=
if">&gt;<br style=3D"font-family:sans-serif"><span style=3D"font-family:san=
s-serif">&gt;bitbake-selftest:</span><br style=3D"font-family:sans-serif">&=
gt;https<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/=
87/builds/1792/steps/11/logs/stdio" style=3D"font-family:sans-serif" rel=3D=
"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">://autobuil=
der.yoctoproject.org/typhoon/#/builders/87/builds/1792/steps/11/logs/stdio<=
/a><br style=3D"font-family:sans-serif">&gt;<br style=3D"font-family:sans-s=
erif"><span style=3D"font-family:sans-serif">&gt;and oe-selftest:</span><br=
 style=3D"font-family:sans-serif">&gt;https<a href=3D"https://autobuilder.y=
octoproject.org/typhoon/#/builders/87/builds/1792/steps/14/logs/stdio" styl=
e=3D"font-family:sans-serif" rel=3D"noreferrer noreferrer noreferrer norefe=
rrer" target=3D"_blank">://autobuilder.yoctoproject.org/typhoon/#/builders/=
87/builds/1792/steps/14/logs/stdio</a><br style=3D"font-family:sans-serif">=
&gt;<br style=3D"font-family:sans-serif"><span style=3D"font-family:sans-se=
rif">&gt;(these occurred in all the selftest builds but I&#39;ve just linke=
d to one).</span><div dir=3D"auto"><span style=3D"font-family:sans-serif"><=
br></span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">It=
 seems in these tests multiconfig targets can have more than 2 colons. Prob=
ably changing &quot;=3D=3D 2&quot; to &quot;&gt;=3D 2&quot; should help.</s=
pan></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">I tried =
&quot;bitbake-selftest&quot; and with this change and it passed. Unfortunat=
ely now I don&#39;t have access to machine that could handle all oe-selftes=
t. Could we agree that I will send second patch so it will be tested on aut=
obuider?</span></div><div dir=3D"auto"><span style=3D"font-family:sans-seri=
f"><br></span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif=
">Best regards,</span></div><div dir=3D"auto"><font face=3D"sans-serif">Tom=
asz Dziendzielski</font></div></div>

--00000000000021340905ba1d55de--
