Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09B3CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:13:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5128.1791839597757476819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=G9wicT5I;
 spf=pass (domain: snapchat.com, ip: 209.85.221.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1348265f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 14:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791839596; cv=none;
        d=google.com; s=arc-20260327;
        b=aLeRSWzB1Q+kWtfQiC/D7hPApyB0OAzla6/1Xfg1WpafuY7QkwQa1XxTMGlXugg9Qq
         Ua3i4IUs6P1vY9F9y4qGBcNlBKupcVIrHo/RcQtHz7uYMxh1OHs7//U5MfsAAZBPatCZ
         zQkSBmcMUivZpraPWRdP1BkctPP42EYjlXs/5hnUuwR2TZDNeUks9X39OooCacOQFg/R
         CqXt0lbYbo9bWCZNlzqeTiG+RBXNBj43Gb1UzxC5C19Fz+fseGXB+EMz0saqbowJkDO/
         RLRPRW58roWDCsnPbAE1QiUvnHA9IWTTVMOkCoq0eASMA5pLfZZGSePyHaqZ5z+A1fan
         J3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bxP9E2OgrFXi3HFBuHEGnRyOHnJz0sB30LMlQjQKwdQ=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=VeUaSPVRo2j4wROw2N/lz7pX6/Q9JKpns1ek4qfHE0Qfn36CDomE3Kh89NvNwX1zdK
         qcSmBIgjyYvJ7+Rh4nkGs9o2C2ucT9ns3IzRMn8MeRLU1eBMOiC306aOFsTeaMMhbaGP
         SDdAnOn1NxcsaiPYpYCA2bkwewQb4A7BFqjDBk9P/9EXfedWFsccdFdQ7dmyRI/6u/CK
         oMz6FmxYrdFpvHs48FoGeLT/zhpJs3yyi9yoL2597kMKDcx3/pfrsY+KtGsM8+mqsZ7S
         yNGa62mJB/6m0EuzmvUzpW+VFoxttJ4A3+DscJpmN6KKhRBhRLV+NpiLWlBISjtnt4r9
         bNUA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1791839596; x=1792444396; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxP9E2OgrFXi3HFBuHEGnRyOHnJz0sB30LMlQjQKwdQ=;
        b=G9wicT5IAjtKQrus680iD9mIMr2c8uO39in5L5R99FVXFtS2FslB4Ib+ZZYuKXOUN3
         1F4GrrQOYKXmrTVZnF/IbdOykR+EsFnTLyOrkUefHFyfkDtXA9XCTHi3NJ0LVdBkZYmx
         8nPCB5QEiTdTNXAfbG2KuxusQgKiIKgHfd5hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839596; x=1792444396;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxP9E2OgrFXi3HFBuHEGnRyOHnJz0sB30LMlQjQKwdQ=;
        b=z5InL95XAJ2UAyi3KgITgUPHdeLMDHbsUJQut1Ehs9lAwFQEtgFfd5u6GLknNCMBic
         HM/BQdVR585zlMAJaM6N5YoA8QWGNPWeTLV52f4dzhGYtg67dPcDS++QeVwfv0Y+BDza
         4P5MjyT0adQL7N4Sh8KuKOtg9hamjk2wQD9KUIsieJR8bD1Ib32nO00WGTiNDStDzjJY
         Njr0/gTjAsIUSC4T+M1goUwBS9So+1Gq8ZRhXrE6qsTx3MXdDhN0WDc9xJN7gEmU2VUG
         3JBw4Wuy8oWG+vGGqBQ4q4KcQiS8Q6/vn64BvRGv1jcB3ucT3mMcS+PMOW7zqxnfgsCf
         Sicw==
X-Gm-Message-State: AFq9FYKyFveTS0wcNlPqeJ0zaG/QDbs26MG08iUzbJ0W0VO52ERPQmI9
	/ddvfyin9Kf/gg9w57CwgsRQWIbS/8aqk5T6fMCZTquQG4GMSH27nMykyFFxJ9dEJ+TEvFmwoZQ
	IeFx9HkS5fQINKSMCnTYXun/Yl1hDemtiKb1lVmHd5Q==
X-Gm-Gg: AYBFou3F6WX6OkPOv1tA9pPWJ5UL36SCvHBoqXbwBR4iZ29ebXwuEQXe2g5GHg+gWCw
	SM8Z/J0LOkPnbrxgMsz30Ztj9Twb8UEwJnuWruJ9ugYmIdNKscvveF9Sstl8qfMaRRg+3sn7Y4G
	bcP7bhirEaMJSswnH2fXJubICyS4eiFjuN6DLhtUxtb0x+fJKkDsOMLJsWVkT9JvidvLteSAH/5
	geLM1DJpAuiIkO7KRu8wtLy0xvChrLifI8PA0+mMRk4rJbs3uv/fbOenW+u/0mnCmaXnmmSlqNJ
	ZsAjBaOHu+uFmg05nga1Ah06S8o8y+pzjDUKyM/Fxkdvn74RO56Y8AtPFi55mbmUHYMMa7OcbDF
	9KOQ+YTyQukE=
X-Received: by 2002:a05:6000:40dd:b0:487:72f:fb41 with SMTP id
 ffacd0b85a97d-48dbace8754mr20653301f8f.39.1791839595757; Mon, 12 Oct 2026
 14:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261010113029.2347847-1-ecordonnier@snap.com> <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
In-Reply-To: <CANNYZj9kcJ+_Q8gEtmLYqKjwLsHogY1o4b8MeZQf6jTgDp3gtg@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 12 Oct 2026 23:13:03 +0200
X-Gm-Features: AclHuK_94R9JZl-3irMJqJCedvpjg0lxKh2EIkD0GOXGyQTxOew7aMNaTfiS8QY
Message-ID: <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000099a6c9065dab2a5f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 21:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247687

--00000000000099a6c9065dab2a5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,
- what is achieved by moving it to core is improving no-gplv3.inc for users
who are not using gplv3 and still want full coreutils syntax support. It
will also make it possible to add it to poky-altcfg.conf, and generally
make it easier to consume without needing meta-openembedded.

- what specifically makes this component mature enough is:
  - I've added the recipe to meta-openembedded in July 2022 and it has been
continuously tested and improved since (e.g. I fixed the musl support
upstream, the cross-compilation of stdbuf upstream, some buildpath issue)
  - its adoption in Ubuntu 26.04 as default coreutils implementation and
the resulting large-scale usage and bug-fixing
  - its availability in Windows as "Coreutils for Windows" starting in June
2026 as a package maintained by Microsoft, and the resulting large-scale
usage and bug-fixing
  - its massive adoption in various distros and package-managers (see
https://uutils.org/users/ )
  - its >95% pass-rate of the GNU testing suite in release 0.0.12 (some
tests are still skipped)
  - anecdotally, my own usage in production on embedded devices for several
years without issues (on arm and qemu-arm64)

- "should we make uutils-coreutils the default choice, or maybe the only
choice?"
  -> maybe in several years when uutils-coreutils has matured even more and
has 100% test coverage of the GNU test suite? At the moment I think the
safest choice on critical devices is still GNU coreutils, so I wouldn't
remove or make rust coreutils the default or only choice. Also rust
binaries are bigger than C binaries so there is some tradeoff involved. GNU
coreutils 9.12 main package is 10.3MB big in my test build, compared to
13.6MB for the uutils-coreutils 0.0.12 main package (uutils-coreutils uses
a multi-binary executable to save space, GNU coreutils doesn't).

- "Does it work as a provider of coreutils-native and is it compatible with
pseudo?"
  - the recipe uutils-coreutils-native compiles, but it's not compatible
with pseudo because of differences in syscalls, and it's not suitable as a
replacement for coreutils-native at the moment. I'll try to make it work
with pseudo in the future, but I think almost all users consume it as a
target recipe and that's where it provides most value.

- "Does it pass the full autobuilder matrix when selected as coreutils
provider? Should we add that test to the autobuilder?"
  -> it should, but I've not tested the full matrix of the autobuilder. I
would like to add the recipe to poky-altcfg.conf, and as far as I
understand this would add it to the autobuilder as side-effect.
I am also working on adding ptest support for the recipe and can send this
if necessary for the acceptance to oe-core.

=C3=89tienne

On Mon, Oct 12, 2026 at 3:04=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Sat, 10 Oct 2026 at 13:30, Etienne Cordonnier via
> lists.openembedded.org
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DPf9ypvX_MT4dU4cYC3brv9jpglRcRrrz1l=
uHXObxYfW6J0oO8XAW6KnUoiQHzUES&s=3DQSmPEv1BkubeZVNksJqkHkppRkyy-Bac7QdkZuoY=
qaA&e=3D>
> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>
>>
>> uutils-coreutils, the Rust reimplementation of GNU coreutils, is mature
>> enough for production use, so move the recipe from meta-oe to oe-core.
>> It provides and rprovides coreutils, and is excluded from world unless
>> selected as the coreutils provider.
>>
>
> This needs a bit more justification. What is achieved by moving it to
> core? What specifically makes this component mature enough? What tests we=
re
> performed with it? Does it pass the full autobuilder matrix when selected
> as coreutiuls provider? Should we add that test to the autobuilder? Shoul=
d
> we make uutils-coreutils the default choice, or maybe the only choice? Do=
es
> it work as a provider of coreutils-native, and is it compatible with pseu=
do?
>
> Adding things to core has a pretty high bar, and the above commit message
> does not meet it.
>
> Alex
>

--00000000000099a6c9065dab2a5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<br>- what is achieved by moving it to core is=C2=
=A0improving no-gplv3.inc for users who are not using gplv3 and still want =
full coreutils syntax support. It will also make it possible to add it to p=
oky-altcfg.conf, and generally make it easier to consume without needing me=
ta-openembedded.<br><br>- what specifically makes this component mature eno=
ugh is:<br>=C2=A0 - I&#39;ve added the recipe to meta-openembedded in July =
2022 and it has been continuously tested and improved since (e.g. I fixed t=
he musl support upstream, the cross-compilation of stdbuf upstream, some bu=
ildpath issue)<br>=C2=A0 - its adoption in Ubuntu 26.04 as default coreutil=
s implementation and the resulting large-scale usage and bug-fixing<br>=C2=
=A0 - its availability in Windows as &quot;Coreutils for Windows&quot; star=
ting in June 2026 as a package maintained by Microsoft, and the resulting l=
arge-scale usage and bug-fixing<br>=C2=A0 - its massive adoption in various=
 distros and package-managers (see=C2=A0<a href=3D"https://uutils.org/users=
/">https://uutils.org/users/</a> )=C2=A0<br>=C2=A0 - its &gt;95% pass-rate =
of the GNU testing suite in release 0.0.12 (some tests are still skipped)<b=
r>=C2=A0 - anecdotally, my own usage in production on embedded devices for =
several years without issues (on arm and qemu-arm64)<br><br>- &quot;should =
we make uutils-coreutils the default choice, or maybe the only choice?&quot=
;<br>=C2=A0 -&gt; maybe in several years when uutils-coreutils has matured =
even more and has 100% test coverage of the GNU test suite? At the moment I=
 think the safest choice on critical devices is still GNU coreutils, so I w=
ouldn&#39;t remove or make rust coreutils the default or only choice. Also =
rust binaries are bigger than C binaries so there is some tradeoff involved=
. GNU coreutils 9.12 main package is 10.3MB big in my test build, compared =
to 13.6MB for the uutils-coreutils 0.0.12 main package (uutils-coreutils us=
es a multi-binary executable to save space, GNU coreutils doesn&#39;t).<br>=
<br>- &quot;Does it work as a provider of coreutils-native and is it compat=
ible with pseudo?&quot;<br>=C2=A0 - the recipe uutils-coreutils-native comp=
iles, but it&#39;s not compatible with pseudo because of differences in sys=
calls, and it&#39;s not suitable as a replacement for coreutils-native at t=
he moment. I&#39;ll try to make it work with pseudo in the future, but I th=
ink almost all users consume it as a target recipe and that&#39;s where it =
provides most value.<br><br>- &quot;Does it pass the full autobuilder matri=
x when selected as coreutils provider? Should we add that test to the autob=
uilder?&quot;<br>=C2=A0 -&gt; it should, but I&#39;ve not tested the full m=
atrix of the autobuilder. I would like to add the recipe to poky-altcfg.con=
f, and as far as I understand this would add it to the autobuilder as side-=
effect.<br>I am also working on adding ptest support for the recipe and can=
 send this if necessary for the acceptance to oe-core.<br><br>=C3=89tienne<=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Oct 12, 2026 at 3:04=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sat, 10 Oct 2026 at 13:30, Etienne Cordonnier via <a href=3D"https://url=
defense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DD=
wMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DPf9ypvX_MT4dU4cYC3brv9jpglRcRrrz=
1luHXObxYfW6J0oO8XAW6KnUoiQHzUES&amp;s=3DQSmPEv1BkubeZVNksJqkHkppRkyy-Bac7Q=
dkZuoYqaA&amp;e=3D" target=3D"_blank">lists.openembedded.org</a> &lt;ecordo=
nnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org" target=3D"_blank=
">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
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

--00000000000099a6c9065dab2a5f--

