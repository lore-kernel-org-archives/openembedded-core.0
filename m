Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E423FD61007
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:22:26 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12825.1769685741360047883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e5BdbuK+;
 spf=pass (domain: konsulko.com, ip: 209.85.215.176, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c2af7d09533so505549a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769685741; cv=none;
        d=google.com; s=arc-20240605;
        b=XaHgZ9wrl5tMUvhZz6yYn4Ekw/Ahy/HQfOqZfdkWHcHrZdwvVwAjAHx+3qYXnzTWdq
         HSB1ggP8VSZeQYAhG/lTnqj//G9Am3BKryx6ZJ0tzH7l0E2st8O6LlJReuufSnfMcyuO
         uC2KNLw7uaYlsiDQVBoKkOc4rfaqoa16eGL0sOkLE/4mr7MwA+ph3FRFI82LhoAtCHgk
         DKjt4o4ehCm4a3hirXZ+FGmovmx/BKWkSuWEcx0fgLy2E2zAPxlByzNuTpPaIN5yKugg
         InzqClykA16zdYtkuJR/rikwEWKMnHiMJQse2jjbjzxiGiRgYY426BJg++rTJrLXEtFd
         ok+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jrSsJ15Wp2hYAO7zhEfGZdROzZnEZ7lRpzhKhGScN3k=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=Ep/aPEpyx+zXZY2GCOSonW3zqQ+7IJztKAS5gDU8Ed9ent85tj0KSyUj0RiuKrOvXB
         evSVbx6XDQQj60OW+4SzFOtcJ7ZVJOmTQXR56yrApBBVYHghhzUnPezWiVwa4kk0QCgJ
         5HUcvySFIXt00ZA0fRovc288wsMO4nMyBaG5773P42GylaHnwfd+jtsNMcTS0e/kdH0u
         vStoLjcM07ONpKhZPYdAf8m2AMulNDrTzyAQlvEUVHILCZHfd3pwwnWXwW5fy32OUtYa
         Jz75eJ/KxABEyOVxRy1yIj5DtncKokdA5nXWpnRqn/5ArQZmgsb+gCmHPnYEH2NfDgID
         1hiA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769685741; x=1770290541; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jrSsJ15Wp2hYAO7zhEfGZdROzZnEZ7lRpzhKhGScN3k=;
        b=e5BdbuK+7O71ePVHSieetnO7o+DvzCFZC3pxoxDW0QidiU3izgdMUv+9dXy+SFrsK6
         CLtQf9t4P2Frna2paPQCoaSVEkG8jRqxsLZVyZuflvZyRAvEE8tX0UIyrP2DmTWiDaSO
         uZYk8ZqBudEDebUZdnKKklmcfZ5UK/fHj9+ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685741; x=1770290541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrSsJ15Wp2hYAO7zhEfGZdROzZnEZ7lRpzhKhGScN3k=;
        b=qXydpUuQ2YiLudIz3nF5d0hW4PwQ8BOrfN6xCvn0vSMvUxwlehci0vzTVjuVVL+L2g
         qO85Ekz97S+MY0MAE7SKUroPrit4T7cc4b4fEGTs7fkpZadPcXw2fgDwqSx6NMAzZPt1
         DVoiJsT45Dqkznh8kz3vOlNn6U9boAccHN6ZZTnEsfxVE0gLssfkgV0Ru1XXdR/MBSnH
         iwl3pgKMVDb6E8bbUajqjpk355HD5SE+k1AovERuK/GvVBaqByDzf9Gbv+QCtFcKvP2b
         /2aE6N6g6Sjcy0R5bNpxyI4pS3Xzek0RXVE5gaA5cxbyu3jnBgIQU/Sct3RSglhKB6o5
         S1JA==
X-Gm-Message-State: AOJu0YykSZ4rRHm6iEAjEKq8ZqFgT8FsBwfMF5KQfrFGwkZ6u6mO8oxi
	AvFLTedwEW5Xm8NT157LNjYZnKv20no1j82UmqhD1JeKD+HVJVHRfesrcvcwXu9aw4QuGTC3QZd
	i/GuwqR4rCJ7gRzORdjVo/KWYzeDhdmf199UtLsXxWRCIQgjw8Um6n++Afw==
X-Gm-Gg: AZuq6aImJvwz3rtjXAqQEwmee7skuJW2wlvOE8HyB+9wrDcSvTGAQv9SFhVMycVBSO3
	Zm6LvEkDLP3rYeFmubk3pUKvdokGHZEH6qGUs9qqNo3lokmVRtCcQXcJoNPF20rPXyI7tIjZrkg
	jKU+xht9dtfSgRnX5t2Jo5KZHZkByf6+sXBRWJ9w6AbAxxKX0k3uWAKiTKHzcFmKrqa56XOW6vx
	AxIBlylfcnNrornrjHlb/KtoULY5izb0dbusE99aP61I3sm7dLYMVLy+T/Ugv4CQbptWQ==
X-Received: by 2002:a17:90b:3c89:b0:352:ba0f:fb28 with SMTP id
 98e67ed59e1d1-353fecdcfa0mr8059126a91.1.1769685740653; Thu, 29 Jan 2026
 03:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20260127091829.3500551-1-leon.anavi@konsulko.com> <DG0DVCEFA5HX.L3N59E48OKKP@bootlin.com>
In-Reply-To: <DG0DVCEFA5HX.L3N59E48OKKP@bootlin.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Thu, 29 Jan 2026 13:22:09 +0200
X-Gm-Features: AZwV_QhU4jbxU8exWPezD06p_YAOH7sBDx1NzTxMYezfjKXDuL76POK17vy4Jik
Message-ID: <CALtQ3O3yqQrStH+99WU04rah6d-pOBGP2nONOW=mPK5d+DkKSw@mail.gmail.com>
Subject: Re: [OE-core] [[PATCHv2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ef9f96064985119b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230133

--000000000000ef9f96064985119b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

On Wed, Jan 28, 2026 at 7:03=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Jan 27, 2026 at 10:18 AM CET, Leon Anavi via lists.openembedded.or=
g
> wrote:
> > Upgrade to release 0.19.1:
> >
> > - Fix SeekableZstdFile write table entries on 32-bits architectures
> >   when there is a huge number of entries
> >
> > From release 0.19.0:
> >
> > - The project has been completely refactored to use the Zstandard
> >   implementation from the standard library (PEP-784)
> > - The refactor has some minor impact on public APIs, such as
> >   changing the exception raised on invalid input
> > - Add backports.zstd dependency for Python before 3.14
> > - Changes in build dependency: remove setuptools and C build
> >   toolchain, add hatchling and hatch-vcs
> > - Remove git submodule usage
> > - Drop support for Python 3.9 and below
> > - Use ruff as formatter and linter
> > - Embed type hints in Python code, and check with mypy
> >
> > All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
>
> Hi Leon,
>
> Thanks for the new version.
>
> It looks like this is breaking some ptest:
>
> Failed ptests:
> {'python3-pyzstd': 'START: ptest-runner\n'
>                    '2026-01-28T16:27\n'
>                    '\n'
> ...
>                    "E   ImportError: cannot import name 'zstd' from "
>                    "'compression' (unknown location)\n"
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2996
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1005
>
> Test results can be found here:
>
>
> https://valkyrie.yocto.io/pub/non-release/20260128-86/testresults/qemux86=
-64-ptest/core-image-ptest-python3-pyzstd/
> Test results for riscv64 and arm64 are not published at this time, as
> some tests are still running. They will all end-up in
> https://valkyrie.yocto.io/pub/non-release/20260128-86/testresults/
>
> Can you have a look at these failures?
>

Hm, I am not exactly sure what's going on. On my Raspberry Pi 5 test
setup ptest-runner python3-pyzstd doesn't report any issues:

Testsuite summary
# TOTAL: 209
# PASS: 209
# SKIP: 0
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 4
END: /usr/lib/python3-pyzstd/ptest
2026-01-29T11:17
STOP: ptest-runner
TOTAL: 1 FAIL: 0

I will take another look after FOSDEM. I will likely need to reproduce your
exact test environment. In the meantime, do you have any hints about what
might be causing the test failures on your side?

Best regards, Leon


> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000ef9f96064985119b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mathieu,</div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 28, 2026=
 at 7:03=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dub=
ois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue Jan 27, 202=
6 at 10:18 AM CET, Leon Anavi via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Upgrade to release 0.19.1:<br>
&gt;<br>
&gt; - Fix SeekableZstdFile write table entries on 32-bits architectures<br=
>
&gt;=C2=A0 =C2=A0when there is a huge number of entries<br>
&gt;<br>
&gt; From release 0.19.0:<br>
&gt;<br>
&gt; - The project has been completely refactored to use the Zstandard<br>
&gt;=C2=A0 =C2=A0implementation from the standard library (PEP-784)<br>
&gt; - The refactor has some minor impact on public APIs, such as<br>
&gt;=C2=A0 =C2=A0changing the exception raised on invalid input<br>
&gt; - Add backports.zstd dependency for Python before 3.14<br>
&gt; - Changes in build dependency: remove setuptools and C build<br>
&gt;=C2=A0 =C2=A0toolchain, add hatchling and hatch-vcs<br>
&gt; - Remove git submodule usage<br>
&gt; - Drop support for Python 3.9 and below<br>
&gt; - Use ruff as formatter and linter<br>
&gt; - Embed type hints in Python code, and check with mypy<br>
&gt;<br>
&gt; All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.<br>
&gt;<br>
&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Leon,<br>
<br>
Thanks for the new version.<br>
<br>
It looks like this is breaking some ptest:<br>
<br>
Failed ptests:<br>
{&#39;python3-pyzstd&#39;: &#39;START: ptest-runner\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;2=
026-01-28T16:27\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\=
n&#39;<br>
...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
E=C2=A0 =C2=A0ImportError: cannot import name &#39;zstd&#39; from &quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&#39;compression&#39; (unknown location)\n&quot;<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/2996" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/73/builds/2996</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/1005" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/56/builds/1005</a><br>
<br>
Test results can be found here:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20260128-86/testresult=
s/qemux86-64-ptest/core-image-ptest-python3-pyzstd/" rel=3D"noreferrer" tar=
get=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20260128-86/testre=
sults/qemux86-64-ptest/core-image-ptest-python3-pyzstd/</a><br>
Test results for riscv64 and arm64 are not published at this time, as<br>
some tests are still running. They will all end-up in <a href=3D"https://va=
lkyrie.yocto.io/pub/non-release/20260128-86/testresults/" rel=3D"noreferrer=
" target=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20260128-86/t=
estresults/</a><br>
<br>
Can you have a look at these failures?<br></blockquote><div><br></div><div>=
Hm, I am not exactly sure what&#39;s going on. On my Raspberry Pi 5 test se=
tup=C2=A0ptest-runner python3-pyzstd doesn&#39;t report any issues:<br><br>=
Testsuite summary<br># TOTAL: 209<br># PASS: 209<br># SKIP: 0<br># XFAIL: 0=
<br># FAIL: 0<br># XPASS: 0<br># ERROR: 0<br>DURATION: 4<br>END: /usr/lib/p=
ython3-pyzstd/ptest<br>2026-01-29T11:17<br>STOP: ptest-runner<br>TOTAL: 1 F=
AIL: 0<br></div><div><br>I will take another look after FOSDEM. I will like=
ly need to reproduce your exact test environment. In the meantime, do you h=
ave any hints about what might be causing the test failures on your side?<b=
r><br>Best regards, Leon<br><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000ef9f96064985119b--

