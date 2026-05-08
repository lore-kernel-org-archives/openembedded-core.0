Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221F9CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 15:03:16 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.421.1778252585578765862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 08:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BBQUSCS0;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a887ebb416so2050617e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 08:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778252584; cv=none;
        d=google.com; s=arc-20240605;
        b=JPT1tfON9TTMrwlJJvhg4ip0qxD8wXSwiRVf8hdPSFSMN7eDJCzj38h0WXy4oXtINx
         RDzhxZpqeHR+Zvcw0W1EpOUqEUKQsxXFcJIDaQ55xgPjKfXMVadu+7xSB8hTlHOJDS2S
         52jmvRDqt2M5vbuWlk/4lYL2vsnJ/t+TWXiDuTecz+AC419MjIHFaC6tGJsCu7FtjuXP
         tuOf0pbg7bzLSdK714ZzXg0VadvAvvclOeNoVLUMMIFXMahIWBGhpHtwJ+JnckiutZDE
         8PEmkDbEX+TXCS7kjhKR9Xv6/EuDmiPinBFHb3rouypGTBgKM59e2fv/jgAj4HoZDjrE
         xJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jkFKmyD740JjXFGYA21uevbAzSXclb2hgWHwjc4wS9o=;
        fh=Zve52/atCzKjDBqMU9JGyYKBzgaRoQKPMo/c/LuNNvE=;
        b=hTp3OgZiSEFHuXT467aSgAGw0r6nMBWAM3Ocw7zXvca1mlNN39sc9AMVd83G9cSMqr
         WplJ5rR+khunct8q1q/fBSGbQZFiV8s5jUWOEyIuBzZVrohktXuEWR92VKKDCeeWjUWc
         IY0fIXmZPSq1HUZChpb46KJ8JrW3VfYsTZWUTZwQD4uU4jND6dlhYRiJF1F2HuT3UWqi
         vpXhw6C+uP2UnIyIZcC5KFpk/56b9OKV8ggRvH5Ge7IN4EDs6AuaExSeYc9WjtZ+FGKw
         mm2G89RKCPI7Ku9E1xkjBtqjVSvIG3T+SEcP5G7pQLMVwDjCFinYsaxfGQ8qWhPwPIpG
         hvIg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252584; x=1778857384; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jkFKmyD740JjXFGYA21uevbAzSXclb2hgWHwjc4wS9o=;
        b=BBQUSCS0biGMefEkYkLX7hmnqgwmDCHvpB+a/3Ge5vm+k8tfNoyDb2RhxmfwURtmyj
         /PSLvDBg5pdXnXqJWosfLy06Nel0cwEsgZKc4EkELykj5SZ/wY9v3yqR+z+hEIiwpyQc
         lRypP9ERd24YhdJOf/ytqVdH3Nx0y4NrVSLoZ6RobUlecFVklDSme5F7Ze8GX7nIn/Lj
         IjaEsZk2gvOERZAhK2Gx0jYmFzgd4dy8vXODnR9Z4RYzz/bLYNBf5VXj/R8pSfyO14jl
         dZ4kWqzim9AwXHLgYSnCbC8HXEsS21M/pn1xrwKrbN8N54LPJkNiUh6mV2FYDfcckHoH
         nU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252584; x=1778857384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkFKmyD740JjXFGYA21uevbAzSXclb2hgWHwjc4wS9o=;
        b=f35I8QN0c242A1+UMV2S+GL8QbcM1MA//IJO41bGtbBjqq4i7SPZzAG0Q2a6ELzAWG
         wbemfG9Cp9ldH9SwJJz0JTVrH/dPQ4lRWUPfLWN3EkSsYTyaKGrXoprXr5YdCCYOOTW5
         84GZfYK0Kzjci1txxbghHxSzOpyC6lBmlSTGwBzeZUrEw8tyv/rW+DRGD7B+FXdz/yuG
         W9OykdDeV8wN7ZwVlL3j8y7iwQqbZ37TbIZTACBg5fgL6f1qSvZ/gzhwVC/6rUVIC3tD
         AK1dOQn909HVh9onFHr7pe/Oj/fFy7DN5mBalnisdk87RtwdN4q05z1FECcZ1Znp5PiJ
         x4Kg==
X-Gm-Message-State: AOJu0Yw/BA+3Kr+zEHHV76C1mr75NzuhwnlNnBjtHh7Y/xWWRVuNMX79
	HZoLPqyQjSmSY/UeFr3JbnATYH0Ue35zXMl2OwzSeUcIR+LpSBoLPRu63i46+mhGpok90LheERq
	LiK3w/STszol4R9Hk19SecfjBcfpHVwg=
X-Gm-Gg: Acq92OHP/2IzNNsrwqtdxCbMs819YvguWw2jJdmxJ0vvIkxL1yhmWkYxs+rRJuMrVn7
	8IoaSIghhRuEpvvUcmHes78Kq7Ix4EUxbyFk4lfAqVFPI+JS0AinpfB7Uk0NX9DiQrHtkdXNPLc
	wTekJ1bM0okqNkqy0XiQd3j5se3N5yBA2AzNLhgLtPIj6aTyufaz7dM7ycmQUTMX5NvOhA3b4XJ
	QuOtHb89SgDctc+QDtoxjf4WC6WNtQuL/VX1vQxgarbE4u8EnjEy3IGUbyGIK+Z/GBt25woq5ol
	GH9GmdmdvrBkXGJFGA==
X-Received: by 2002:a05:6512:1384:b0:5a4:db:abce with SMTP id
 2adb3069b0e04-5a887ae3fbdmr6252306e87.18.1778252582900; Fri, 08 May 2026
 08:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
In-Reply-To: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 May 2026 08:02:50 -0700
X-Gm-Features: AVHnY4IMun9PbR57ZMC2e4UBzGkdGkLsBQnB9mc6hki_iri3zCgwCgpwVQLgPZo
Message-ID: <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com>
Subject: Re: [Openembedded-architecture] What to do with vim in openembedded-core?
To: paul@pbarker.dev
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000086559406514fb11b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 15:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236726

--00000000000086559406514fb11b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I understand the pain points you mention, as I have tried to help maintain
vim in oe-core.

However, I have a LIFETIME of muscle memory using vim and for me personally
forcing me to use nano is a non starter.
So then I would be constantly needing to pull it in from wherever else it
gets moved.

I don't have any good suggestions for how to deal with the problem, however=
.

On Fri, May 8, 2026 at 6:29=E2=80=AFAM Paul Barker via lists.openembedded.o=
rg <paul=3D
pbarker.dev@lists.openembedded.org> wrote:

> Hi all,
>
> We have a vim recipe in openembedded-core to provide:
> - An editor without the limitations of busybox vi.
> - The `xxd` command, used as a runtime dependency of dosfstools-ptest.
>
> However, vim is difficult to maintain in our stable releases. There is a
> regular stream of CVEs that need fixing due to the large UI and input
> surface of vim, and backporting fixes has proven difficult. This isn't
> just a Yocto Project issue, the Debian tracker [1] currently shows 14
> unresolved CVEs in Trixie and 15 unresolved CVEs in Bookworm. And, it's
> very difficult to share work between distros, as vim tags every commit
> as a new release, every distro ends up on a different release and needs
> to re-validate any backported patches.
>
> So, I propose we drop vim from openembedded-core on the master branch,
> post-wrynose.
>
> We can use tinyxxd [2] to provide xxd, this is based on the vim codebase
> and frequently merges changes from upstream.
>
> We can use GNU Nano as our default editor where something more capable
> than busybox vi is needed, this has a sensible release model. The much
> simpler input model and lack of scripting facility means that CVEs in
> nano are much fewer and further between.
>
> If we do this, what should we do with vim? We could move it back to
> meta-oe, but that would simply be moving the maintenance burden. We
> could stop backporting CVE fixes to vim and recommend that an LTS mixin
> layer is used to provide newer versions of vim for stable branches. I'm
> open to ideas.
>
> [1]: https://tracker.debian.org/pkg/vim
> [2]: https://github.com/xyproto/tinyxxd
>
> Best regards,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2336):
> https://lists.openembedded.org/g/openembedded-architecture/message/2336
> Mute This Topic: https://lists.openembedded.org/mt/119214237/924729
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-architecture/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000086559406514fb11b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I understand the pain points you mention, as I have t=
ried to help maintain vim in oe-core.</div><div><br></div><div>However, I h=
ave a LIFETIME of muscle memory using vim and for me personally forcing me =
to use nano is a non starter.</div><div>So then I would be constantly needi=
ng to pull it in from wherever else it gets moved.</div><div><br></div><div=
>I don&#39;t have any good suggestions for how to deal with the problem, ho=
wever.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, May 8, 2026 at 6:29=E2=80=AFAM Paul B=
arker via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;paul=3D<a href=3D"mailto:pbarker.dev@lists.openembedded.org">pbarke=
r.dev@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi all,<br>
<br>
We have a vim recipe in openembedded-core to provide:<br>
- An editor without the limitations of busybox vi.<br>
- The `xxd` command, used as a runtime dependency of dosfstools-ptest.<br>
<br>
However, vim is difficult to maintain in our stable releases. There is a<br=
>
regular stream of CVEs that need fixing due to the large UI and input<br>
surface of vim, and backporting fixes has proven difficult. This isn&#39;t<=
br>
just a Yocto Project issue, the Debian tracker [1] currently shows 14<br>
unresolved CVEs in Trixie and 15 unresolved CVEs in Bookworm. And, it&#39;s=
<br>
very difficult to share work between distros, as vim tags every commit<br>
as a new release, every distro ends up on a different release and needs<br>
to re-validate any backported patches.<br>
<br>
So, I propose we drop vim from openembedded-core on the master branch,<br>
post-wrynose.<br>
<br>
We can use tinyxxd [2] to provide xxd, this is based on the vim codebase<br=
>
and frequently merges changes from upstream.<br>
<br>
We can use GNU Nano as our default editor where something more capable<br>
than busybox vi is needed, this has a sensible release model. The much<br>
simpler input model and lack of scripting facility means that CVEs in<br>
nano are much fewer and further between.<br>
<br>
If we do this, what should we do with vim? We could move it back to<br>
meta-oe, but that would simply be moving the maintenance burden. We<br>
could stop backporting CVE fixes to vim and recommend that an LTS mixin<br>
layer is used to provide newer versions of vim for stable branches. I&#39;m=
<br>
open to ideas.<br>
<br>
[1]: <a href=3D"https://tracker.debian.org/pkg/vim" rel=3D"noreferrer" targ=
et=3D"_blank">https://tracker.debian.org/pkg/vim</a><br>
[2]: <a href=3D"https://github.com/xyproto/tinyxxd" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xyproto/tinyxxd</a><br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2336): <a href=3D"https://lists.openembedded.org/g/open=
embedded-architecture/message/2336" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-architecture/message/2336</a><b=
r>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119214237/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/119214237/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-architecture%2Bowner@lists.open=
embedded.org" target=3D"_blank">openembedded-architecture+owner@lists.opene=
mbedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-archi=
tecture/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/g/openembedded-architecture/unsub</a> [<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000086559406514fb11b--

