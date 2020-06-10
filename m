Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.11415.1591797817954302511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mjXEre34;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id b10so893469uaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/Iz/9XebD5xCUYEVGY1ggsZhBQw3Gd/6kkZW4MpPY4=;
        b=mjXEre34qCkkyal3LszxiPxquShPJ4fyhkCwZASfIA9Ipa4KUno0P079tN3/PqEs2c
         heVWkEjuGIKPMtJawTeuwZNJ2uTwjVKO8DV2KWHW/OgFGzhqfMh9p/TsOyJ8taypvcEr
         V/zp8hPVGG9bxXd5mU8zQdI5E+n1Jk6iR/agJ4N0US4HK6xIvjwHn/pcI6LHAthzxtk+
         PMX9EUrwVawTaX0LcIBzBA515e5kUTNEmKzZXRVf0FIxlrSJ7/NF29VPspVe7VbQBKsW
         TIm9a2kzyZcdp7MUHC3jLZDtvCTRA61s8I1o+yI+Ah3RH5fOLWuUgPc1jqoNx7D4vSCt
         i/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/Iz/9XebD5xCUYEVGY1ggsZhBQw3Gd/6kkZW4MpPY4=;
        b=nCx1ynnzbnR+ztsi4yPrGOzF5x0F5QMuUPdmPC6DMucyAN1p7d9DKwLll13OV8rVka
         gWfHPpQ42r2PFh4mPWSV2IugSltvrBijSlVvZNy2c7dl6JEsj96iAXrfCS3myf5wlnuj
         hSJYXI+L2p5hUGpJN5T9d5sG1O5OiayykQS7VRXORHnoYSLgV8rlMm5vyAKtPfXcTBV4
         mv1YZZI19h68RNEhw8xC2oPTBZrGPxbFf8hf/GDMgkc8RzpzuMgx9FUVaPJbRzWyHrCN
         ef5GKFOLadnLm+Xt+a4RXUGwJtctkcmXHtKthuDFtg6Gr9g8iEPitEk3uNmj8tFj/C2w
         HBBg==
X-Gm-Message-State: AOAM533mdZKYJKLHRQy9vhgn4sO+H2r8ME3EhvSaRemUalIbXMV1NqBX
	zQiKcTMoDNmd+pnMUTo98AprkWGQDQ9yKxz+ZBRe279A
X-Google-Smtp-Source: ABdhPJykIhTbDELEdujKUOWh+ArVdVhem5mel+WpUexAx4w19RuW2ZfBenDrHgFOs+xfhi/TuKMVkDWmBeB6NGQMipQ=
X-Received: by 2002:ab0:3f0:: with SMTP id 103mr2454094uau.71.1591797816945;
 Wed, 10 Jun 2020 07:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <1855985738.3034.1591791465954.JavaMail.zimbra@nod.at>
In-Reply-To: <1855985738.3034.1591791465954.JavaMail.zimbra@nod.at>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 10 Jun 2020 16:03:24 +0200
Message-ID: <CANNYZj8kicvZLnGZBK_ZJ99kTmvaaW63mxQt0NTzS3QkTJ7JiQ@mail.gmail.com>
Subject: Re: [OE-core] nativesdk-meson issues
To: Richard Weinberger <richard@nod.at>
Cc: OE-core <openembedded-core@lists.openembedded.org>, mkelly@xevo.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Haubner <alexander.haubner@sigmatek.at>
Content-Type: multipart/alternative; boundary="0000000000006ef1d005a7bb4f5a"

--0000000000006ef1d005a7bb4f5a
Content-Type: text/plain; charset="UTF-8"

Seems reasonable, but you need to make and test the patches against master
first.

Alex

On Wed, 10 Jun 2020 at 14:17, Richard Weinberger <richard@nod.at> wrote:

> Hi!
>
> While investigating build issues I traced the root cause back to
> nativesdk-meson.
> We are on Yocto zeus with meson-0.54.2 backported from openembedded-core
> master,
> but this should not matter.
>
> 1. meson wrapping
>
> nativesdk-meson creates a shell wrapper which adds --cross-file=... to the
> meson command.
> Maybe this used to work on older meson releases, on recent meson it causes
> problems since
> --cross-file= is only accepted by the "setup" command, which is default in
> meson.
> As soon you want to use a different command such as "test", meson rejects
> --cross-file.
> We noticed because our test infrastructure makes use of meson test.
>
> 2. meson.cross generation
>
> The way you generate the cross file makes meson think it does native
> instead
> of a cross build.
> Our target arch is aarch64, although meson writes during setup:
> Build machine cpu family: x86_64
> Build machine cpu: x86_64
> Host machine cpu family: x86_64
> Host machine cpu: x86_64
> Target machine cpu family: x86_64
> Target machine cpu: x86_64
>
> ...and does not switch to cross mode.
>
>
> I suggest dropping the wrapper and ship a good enough meson.cross file
> with the SDK
> but please do not force everyone to use it.
> For example in our case we need to set exe_wrapper, root, sys_root, and
> pkg_config_libdir
> in our cross file.
> If you think this is a reasonable apporach, I'll happily send patches. :-)
>
> Thanks,
> //richard
>
> 
>

--0000000000006ef1d005a7bb4f5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Seems reasonable, but you need to make and test the p=
atches against master first.</div><div><br></div><div>Alex<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 10 Jun 2020 at 14:17, Richard Weinberger &lt;<a href=3D"mailto:richard@nod=
.at">richard@nod.at</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi!<br>
<br>
While investigating build issues I traced the root cause back to nativesdk=
-meson.<br>
We are on Yocto zeus with meson-0.54.2 backported from openembedded-core m=
aster,<br>
but this should not matter.<br>
<br>
1. meson wrapping<br>
<br>
nativesdk-meson creates a shell wrapper which adds --cross-file=3D... to t=
he meson command.<br>
Maybe this used to work on older meson releases, on recent meson it causes=
 problems since<br>
--cross-file=3D is only accepted by the &quot;setup&quot; command, which i=
s default in meson.<br>
As soon you want to use a different command such as &quot;test&quot;, meso=
n rejects --cross-file.<br>
We noticed because our test infrastructure makes use of meson test.<br>
<br>
2. meson.cross generation<br>
<br>
The way you generate the cross file makes meson think it does native inste=
ad<br>
of a cross build.<br>
Our target arch is aarch64, although meson writes during setup:<br>
Build machine cpu family: x86_64<br>
Build machine cpu: x86_64<br>
Host machine cpu family: x86_64<br>
Host machine cpu: x86_64<br>
Target machine cpu family: x86_64<br>
Target machine cpu: x86_64<br>
<br>
...and does not switch to cross mode.<br>
<br>
<br>
I suggest dropping the wrapper and ship a good enough meson.cross file wit=
h the SDK<br>
but please do not force everyone to use it.<br>
For example in our case we need to set exe_wrapper, root, sys_root, and pk=
g_config_libdir<br>
in our cross file.<br>
If you think this is a reasonable apporach, I&#39;ll happily send patches.=
 :-)<br>
<br>
Thanks,<br>
//richard<br>
<br>
<br>
</blockquote></div>

--0000000000006ef1d005a7bb4f5a--
