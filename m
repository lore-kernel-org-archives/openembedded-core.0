Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431A5CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 07:42:03 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2022.1791877321314279865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 00:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gv55Ir1u;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917aca1aee5so36037556d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 00:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791877320; cv=none;
        d=google.com; s=arc-20260327;
        b=GEgUfVc0i8t0OSttOc1pPehzziCWaECN4Q2blXHeI0CS7QzhhYpaZnwu30WmjELpKv
         0OroSpy8fTruiFlP2huMW5D3PbULLPhXjL6wAytVAJzMh6xRHAdJHXuYpRBYCE8PfmXM
         o+jPgcU8+Ax2M4heQznu79JrZ16nqSwnYqjQBEzDZtG2R+ifVcJ84S7hfL/rakV9HEld
         acIIcVm+C/X4H59KYqoP4R/otA550oKkWxxhm5Cp4WasSKSyh59CBBH8josGxcXzsReF
         DM197zbZ9w+OqJr5sqYCrjucC1ySLhVvjFkkBEshWHU8W683OF+XLbqqDRrZuQk/qp1k
         YAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tmZnBuFvK9ylUZkZaz8c03Q5FBBFMiDxGkZhFTaP2zA=;
        fh=PmRlrUr4fPzdrmqYL26YQhih7ON+5j/GRPlovzxMdkU=;
        b=gfz3rA8hqtwdpMRzO4TBrxRjdQsfsUdGV8VWQKvgxpHf98R7xi2cCpOj3+FYoSr0BK
         jSZXe2UWrSJRoLUpgcB0eD5EYL2ObcQkxYN1r/rFUFdGcRJZ6wGn9LWvC6Pu7lYzcfzr
         hAuozAyuxyvHAnxSj8qFb/9oHJZOWdfjagWJNIOuERrO/WuU5HGzwq2bF8uef54SBiet
         dSG26NgNtzluOrIiCNMzClnQYExH93+R4sAHPpZWSFfYFDgTTaBU4ZEs5ZFTMBiihOsg
         0OpaYenpWHI9bgpIVYoL8xIt/LdINYNZPKq7bY8zoQRCdZrE17Aj3kiCc+JYVx536pLT
         YdYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877320; x=1792482120; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmZnBuFvK9ylUZkZaz8c03Q5FBBFMiDxGkZhFTaP2zA=;
        b=gv55Ir1uKk8PZIeRcaWVCI6GCYD+S4miJwEVlD6iqWeJNSLjPzWjmH6y7adSYweXHv
         RGOTwLGZmpnCOl4hYL6eio4wTI6mOHKe2GlpR8Kmc2xMN5tkfyOZG6BTTVEiB+BwP8mv
         9T8eMTDLlIGYRngmD9Hhaewh4aX8XP7Xt0XeUdhsW81Wvr6Jw1xAu0O1KeJI9lJbKee5
         Wm2R4/MVp+QEcWknA/glH6PZR70hdwBnyz/BvR8EBuNV+p8TWkkXu0A6l5+vpyHr5Xh2
         z2LCKfdUjh9nD6QhRyM+Ct++sLIpgHs+kzca6SzcHjT1p7TGbQmpURBHRA+0U5A9VjqB
         n3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877320; x=1792482120;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tmZnBuFvK9ylUZkZaz8c03Q5FBBFMiDxGkZhFTaP2zA=;
        b=zIrxmMYmyCvHygBzHbI7HV+BckuxfNDO7DDSaW1op/MQ4n6/J3OG09oZguovbYhnRR
         Bby8YCoesIGOIhakf325rc7l5NcVYrz6T5EzgTgYSp7kCvYyrUerR/C1pN0Dyt4K+8sn
         +MIVZYX/5d/k9JpVOLdafyh7bCASEpGHzeHUnHlMgJyTPHAfHWAY67OjYJh5slz7Fseg
         bdKmCe46DnQmLb249PSh5I+LSpEi+FhcN2xP0/6ZFrVO5S4haB3TOU9LefCHV6/2wh48
         5Rs/7ThUNAVsB6rOqIsdKrCspC71zb+gR22M+/oEmcjCmqmtOtlic/VhTPi/M3k2X0yu
         7PEw==
X-Gm-Message-State: AFq9FYIZF85vq8++lPNuA6s4E8GeCoFGc3Zu18upkj45uGJleYuCdH8X
	/Kd3Of7hTbZFkkQ1DTTJVnIMO14yTFfLWYWweWZ2BXl09pcm+YUn5Vb3AvpQcKMQCdRN5d4kxgn
	R3//H4/dJ/qTT8z/dYKSotn3JRu4egcE=
X-Gm-Gg: AYBFou2yODdyjcqChVckj7VoCsGJkv/p9WEWvnfCgADjtm+iF4MhMoPeQ35gp1msH+w
	Su5Y5I0KJybd9HGUZOSm2uleKgK6ROUtADIXIU5128TmkdatjZpHuqm4djAsqzUYhfUW1bR1E6Y
	Aj2mxKIFTR+n7ErXX3tltoZY+TdwY1h2xPCFwui6K8TjwQOs9rjnfK3SxPN4ZefBK+FoDzcyRkU
	mm8idbggWn5OI/qXCW+kVehrdgJGEuHWz5oDi8e1DrKVf9YyM5WPLBBVrfVMxOTvOoB7LO6qlwB
	W24QQHjvYO8wHBNHeB3IOL9LVAtH4C5K4zREWkiQPZk5gN5eKgS6VJ8BP329Fd+Wmy/9lCxhkjQ
	A4DM5EglG3c2yLw==
X-Received: by 2002:ad4:5d6c:0:b0:915:e65d:3a99 with SMTP id
 6a1803df08f44-91b5556ad36mr236030346d6.35.1791877320150; Tue, 13 Oct 2026
 00:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261010113029.2347847-1-ecordonnier@snap.com>
 <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com> <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
In-Reply-To: <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Oct 2026 09:41:48 +0200
X-Gm-Features: AclHuK9x_iu6L-DXpF5-mgLNna2TijnIJEbG8qWEZdCgMGNu9jjTYOnWaJj2IDw
Message-ID: <CANNYZj9y8xONSSQAAjov-5QSeTEkjD_iahpu-bUpn5kzGnbOQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, collin.funk1@gmail.com
Content-Type: multipart/alternative; boundary="00000000000026120f065db3f3c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 07:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247705

--00000000000026120f065db3f3c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alright. Here's a suggested plan for you:

- add ptest support to the recipe. It must have feature parity with the GNU
recipe.

- investigate and propose a plan for pseudo compatibility. It's not easy:
pseudo relies on substituting libc API, and rust binaries issue kernel
syscalls directly.

- address concerns of 'license-washing'. A few of us are deeply
uncomfortable with this recent wave of component rewrites (especially AI
assisted which causes dubious copyrights) where the primary goal is not
technical improvement but simply getting rid of the GPL. The purpose of
open source is not serving commercial interests, it's making computing
better for everyone.

- get the core community distributions (which is, Fedora and Debian) to
have a plan and timeline of adoping uutils as the default. This is the
ultimate test of maturity.

- propose a test plan for Yocto. Merely sticking it into poky-altcfg is
actually a regression in testing, because then sysvinit images will be
tested only with GNU, and systemd images will be tested only with uutils.

- last, but not least. Actually this is the most important one: fix your
relationship with GNU coreutils. It's painful to watch you two bicker, and
I do not want the Yocto project to be dragged into this.

Alex


On Mon, 12 Oct 2026 at 23:13, Etienne Cordonnier <ecordonnier@snap.com>
wrote:

> Hi Alex,
> - what is achieved by moving it to core is improving no-gplv3.inc for
> users who are not using gplv3 and still want full coreutils syntax suppor=
t.
> It will also make it possible to add it to poky-altcfg.conf, and generall=
y
> make it easier to consume without needing meta-openembedded.
>
> - what specifically makes this component mature enough is:
>   - I've added the recipe to meta-openembedded in July 2022 and it has
> been continuously tested and improved since (e.g. I fixed the musl suppor=
t
> upstream, the cross-compilation of stdbuf upstream, some buildpath issue)
>   - its adoption in Ubuntu 26.04 as default coreutils implementation and
> the resulting large-scale usage and bug-fixing
>   - its availability in Windows as "Coreutils for Windows" starting in
> June 2026 as a package maintained by Microsoft, and the resulting
> large-scale usage and bug-fixing
>   - its massive adoption in various distros and package-managers (see
> https://uutils.org/users/ )
>   - its >95% pass-rate of the GNU testing suite in release 0.0.12 (some
> tests are still skipped)
>   - anecdotally, my own usage in production on embedded devices for
> several years without issues (on arm and qemu-arm64)
>
> - "should we make uutils-coreutils the default choice, or maybe the only
> choice?"
>   -> maybe in several years when uutils-coreutils has matured even more
> and has 100% test coverage of the GNU test suite? At the moment I think t=
he
> safest choice on critical devices is still GNU coreutils, so I wouldn't
> remove or make rust coreutils the default or only choice. Also rust
> binaries are bigger than C binaries so there is some tradeoff involved. G=
NU
> coreutils 9.12 main package is 10.3MB big in my test build, compared to
> 13.6MB for the uutils-coreutils 0.0.12 main package (uutils-coreutils use=
s
> a multi-binary executable to save space, GNU coreutils doesn't).
>
> - "Does it work as a provider of coreutils-native and is it compatible
> with pseudo?"
>   - the recipe uutils-coreutils-native compiles, but it's not compatible
> with pseudo because of differences in syscalls, and it's not suitable as =
a
> replacement for coreutils-native at the moment. I'll try to make it work
> with pseudo in the future, but I think almost all users consume it as a
> target recipe and that's where it provides most value.
>
> - "Does it pass the full autobuilder matrix when selected as coreutils
> provider? Should we add that test to the autobuilder?"
>   -> it should, but I've not tested the full matrix of the autobuilder. I
> would like to add the recipe to poky-altcfg.conf, and as far as I
> understand this would add it to the autobuilder as side-effect.
> I am also working on adding ptest support for the recipe and can send thi=
s
> if necessary for the acceptance to oe-core.
>
> =C3=89tienne
>
> On Mon, Oct 12, 2026 at 3:04=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com>
> wrote:
>
>> On Sat, 10 Oct 2026 at 13:30, Etienne Cordonnier via
>> lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DPf9ypvX_MT4dU4cYC3brv9jpglRcRrrz1=
luHXObxYfW6J0oO8XAW6KnUoiQHzUES&s=3DQSmPEv1BkubeZVNksJqkHkppRkyy-Bac7QdkZuo=
YqaA&e=3D>
>> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>>
>>>
>>> uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature
>>> enough for production use, so move the recipe from meta-oe to oe-core.
>>> It provides and rprovides coreutils, and is excluded from world unless
>>> selected as the coreutils provider.
>>>
>>
>> This needs a bit more justification. What is achieved by moving it to
>> core? What specifically makes this component mature enough? What tests w=
ere
>> performed with it? Does it pass the full autobuilder matrix when selecte=
d
>> as coreutiuls provider? Should we add that test to the autobuilder? Shou=
ld
>> we make uutils-coreutils the default choice, or maybe the only choice? D=
oes
>> it work as a provider of coreutils-native, and is it compatible with pse=
udo?
>>
>> Adding things to core has a pretty high bar, and the above commit messag=
e
>> does not meet it.
>>
>> Alex
>>
>

--00000000000026120f065db3f3c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Alright. Here&#39;s a suggested plan for you:</div><d=
iv></div><div><br></div><div>- add ptest support to the recipe. It must hav=
e feature parity with the GNU recipe.</div><div><br></div><div>- investigat=
e and propose a plan for pseudo compatibility. It&#39;s not easy: pseudo re=
lies on substituting libc API, and rust binaries issue kernel syscalls dire=
ctly.</div><div><br></div><div>- address concerns of &#39;license-washing&#=
39;. A few of us are deeply uncomfortable with this recent wave of componen=
t rewrites (especially AI assisted which causes dubious copyrights) where t=
he primary goal is not technical improvement but simply getting rid of the =
GPL. The purpose of open source is not serving commercial interests, it&#39=
;s making computing better for everyone.</div><div><br></div><div>- get the=
 core community distributions (which is, Fedora and Debian) to have a plan =
and timeline of adoping uutils as the default. This is the ultimate test of=
 maturity.</div><div><br></div><div>- propose a test plan for Yocto. Merely=
 sticking it into poky-altcfg is actually a regression in testing, because =
then sysvinit images will be tested only with GNU, and systemd images will =
be tested only with uutils.</div><div><br></div><div>- last, but not least.=
 Actually this is the most important one: fix your relationship with GNU co=
reutils. It&#39;s painful to watch you two bicker, and I do not want the Yo=
cto project to be dragged into this.</div><div><br></div><div></div><div>Al=
ex</div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12 Oct 2026 at 23:13, =
Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com">ecordonnier@=
snap.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Hi Alex,<br>- what is achieved by moving it to cor=
e is=C2=A0improving no-gplv3.inc for users who are not using gplv3 and stil=
l want full coreutils syntax support. It will also make it possible to add =
it to poky-altcfg.conf, and generally make it easier to consume without nee=
ding meta-openembedded.<br><br>- what specifically makes this component mat=
ure enough is:<br>=C2=A0 - I&#39;ve added the recipe to meta-openembedded i=
n July 2022 and it has been continuously tested and improved since (e.g. I =
fixed the musl support upstream, the cross-compilation of stdbuf upstream, =
some buildpath issue)<br>=C2=A0 - its adoption in Ubuntu 26.04 as default c=
oreutils implementation and the resulting large-scale usage and bug-fixing<=
br>=C2=A0 - its availability in Windows as &quot;Coreutils for Windows&quot=
; starting in June 2026 as a package maintained by Microsoft, and the resul=
ting large-scale usage and bug-fixing<br>=C2=A0 - its massive adoption in v=
arious distros and package-managers (see=C2=A0<a href=3D"https://uutils.org=
/users/" target=3D"_blank">https://uutils.org/users/</a> )=C2=A0<br>=C2=A0 =
- its &gt;95% pass-rate of the GNU testing suite in release 0.0.12 (some te=
sts are still skipped)<br>=C2=A0 - anecdotally, my own usage in production =
on embedded devices for several years without issues (on arm and qemu-arm64=
)<br><br>- &quot;should we make uutils-coreutils the default choice, or may=
be the only choice?&quot;<br>=C2=A0 -&gt; maybe in several years when uutil=
s-coreutils has matured even more and has 100% test coverage of the GNU tes=
t suite? At the moment I think the safest choice on critical devices is sti=
ll GNU coreutils, so I wouldn&#39;t remove or make rust coreutils the defau=
lt or only choice. Also rust binaries are bigger than C binaries so there i=
s some tradeoff involved. GNU coreutils 9.12 main package is 10.3MB big in =
my test build, compared to 13.6MB for the uutils-coreutils 0.0.12 main pack=
age (uutils-coreutils uses a multi-binary executable to save space, GNU cor=
eutils doesn&#39;t).<br><br>- &quot;Does it work as a provider of coreutils=
-native and is it compatible with pseudo?&quot;<br>=C2=A0 - the recipe uuti=
ls-coreutils-native compiles, but it&#39;s not compatible with pseudo becau=
se of differences in syscalls, and it&#39;s not suitable as a replacement f=
or coreutils-native at the moment. I&#39;ll try to make it work with pseudo=
 in the future, but I think almost all users consume it as a target recipe =
and that&#39;s where it provides most value.<br><br>- &quot;Does it pass th=
e full autobuilder matrix when selected as coreutils provider? Should we ad=
d that test to the autobuilder?&quot;<br>=C2=A0 -&gt; it should, but I&#39;=
ve not tested the full matrix of the autobuilder. I would like to add the r=
ecipe to poky-altcfg.conf, and as far as I understand this would add it to =
the autobuilder as side-effect.<br>I am also working on adding ptest suppor=
t for the recipe and can send this if necessary for the acceptance to oe-co=
re.<br><br>=C3=89tienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Oct 12, 2026 at 3:04=E2=80=AFPM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, 10 Oct 2026 at 13:30, Etienne Cordonnier vi=
a <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.op=
enembedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2ep=
ckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DPf9ypvX_=
MT4dU4cYC3brv9jpglRcRrrz1luHXObxYfW6J0oO8XAW6KnUoiQHzUES&amp;s=3DQSmPEv1Bku=
beZVNksJqkHkppRkyy-Bac7QdkZuoYqaA&amp;e=3D" target=3D"_blank">lists.openemb=
edded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedd=
ed.org" target=3D"_blank">snap.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature<br>
enough for production use, so move the recipe from meta-oe to oe-core.<br>
It provides and rprovides coreutils, and is excluded from world unless<br>
selected as the coreutils provider.<br></blockquote><div><br></div><div>Thi=
s needs a bit more justification. What is achieved by moving it to core? Wh=
at specifically makes this component mature enough? What tests were perform=
ed with it? Does it pass the full autobuilder matrix when selected as coreu=
tiuls provider? Should we add that test to the autobuilder? Should we make =
uutils-coreutils the default choice, or maybe the only choice? Does it work=
 as a provider of coreutils-native, and is it compatible with pseudo?</div>=
<div><br></div><div>Adding things to core has a pretty high bar, and the ab=
ove commit message does not meet it.</div><div><br></div><div>Alex</div></d=
iv></div>
</blockquote></div>
</blockquote></div>

--00000000000026120f065db3f3c3--

