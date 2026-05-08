Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF039CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:35:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1047.1778258113719742978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 09:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=eaJV5OcU;
 spf=pass (domain: underview.tech, ip: 209.85.221.47, mailfrom: vince@underview.tech)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d64313c39so1674430f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 09:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778258112; cv=none;
        d=google.com; s=arc-20240605;
        b=USzal+XrJszcgQg8sE4R0WpJ5ArAasEEqOMRJ5E2tfBm1GkdRLRRT9VhB8uXP4++AC
         le6f1Kq0yQOCgPj6T5N1BTfG1kRyJy3d+aok2NJuHwhL6lkhuWBckl04DTf+ctONjq2B
         6svbcBINSh3ikmIRKHF9oBAYW7eMSEVC/ururhkXLL9DMsI7wgTcEgHrhElI2mA3dZbe
         3qIP0OWDLJa5sR27zSK1qe0yo0U6JQqxQdu3Y4rqixSN64iNQVTt4HY4TdrT2H0brefx
         li35vdiFpi7gMnuOMpB37DTPuAL4pXy/JMMvyY/l8BSfd2CWqX6Z7IQNYeWP4j4g3/Z0
         Y2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cenIubbFx/epOp4eWrHcrXuSEfglsSEn6ZYB7jhFdyU=;
        fh=X7/Fh8phLf3hksxzKcWGz+T+P2Hpiwoxad0NaVL5f2M=;
        b=kZhn5LPASPQ5x8gIsKnxn5cXSj+72+3AWxZJawt0uSfKVJKkynZe45VL/SvsJ4197i
         433RtwOCJYQGgwaKCf1HhKRqIdRAFLqJ5aahkNt1PkOfxHylYZ6rKxjTIFYPjWVZBSlK
         Grzk8mfHmDEoen0uVeyu9LuL1fg94cwOEfoqqlwdT3wjHaYjZW/r52z5bhyiJqPlK+hX
         MpoVOQ2xWry002SvhhBrX64E384oPkBGam/2tc396jDvjsnooD10wWsdrwEiJoYF3b9b
         5p5VyQFSJ9DIq6cuxWGsDhOZD4hbBuHWOpznZ2ojvq+HNYo8adFvFZmsojlDLOEQU9tE
         Dd9g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1778258112; x=1778862912; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cenIubbFx/epOp4eWrHcrXuSEfglsSEn6ZYB7jhFdyU=;
        b=eaJV5OcUndFXZRuJQuJ2VQHMatvEik/O6Df8YKe2e3UGT3YUYkJG1mjz54+2Vg2kO3
         vHBrliSqk80G9dE3np4DmB3q+UPpMYDeLDhUpIUfTAMl6hKNFUzm+VzSIgDI8wV3AWrI
         B8iJXu+QxyCLeMEXNwhJ3YYwesjbgYFTsCcfDa97FDM5D7+H4dtP4Zsw7c2PES8f6LH5
         96pbW8XRjHpweeeh86DAhgC80BLXlTuZxBo4DZ5HryN3QEiSHvC8jGWGSyXW0QhZ6Slu
         xXvN3JD1WIX6ElQVhqEPxyLw5dASjBGDY9Ov5q1ylqVqbeOeyX3utb/HSLIuma8WIPXK
         nbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778258112; x=1778862912;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cenIubbFx/epOp4eWrHcrXuSEfglsSEn6ZYB7jhFdyU=;
        b=ihPJFBdzdXGkGvmhrF8NS+FAO/UX6Rsa7nGIyxBP1PrGQ23TtP2f2eZEyfmL8UKWKy
         1XpZ/GrfYsxDEylHciYmFiG7JRu8QxNy23aeWEjg28rIC4twB+UYj0HesbRWH0ZHDsMM
         +s7k42NHwNHqbohhKpUR19zGFP0vfJIgCMoFFg39fLmACogNJkk2wBZA5NbdFZ3n4QCA
         VGhd2iSM9GiUx2FSx9wOnXq8WwgddVUcevzcmrGoNajZ97DGM+wFvI+nG9xt1J2fq284
         I89ecmHwM28OPa9y1f4tDahFZBSfT8q+NGGm7QyMZvtF3EL0qtWDiJsuTN6qTqiIDuSg
         wtJw==
X-Gm-Message-State: AOJu0YwRT3PZa34j1hU3oyv7yxmfkufbtAISuQDsA+d/XVSWY27UP8uy
	Rlm8VzWIQzl/uREgAX6PclBsTp0w1dqgL7gYg9ALQ3HNQeT7k7AaAfzt+bm4SvqFjxS/Awo9dP0
	obW8lWsSwC0MQBJBBiAmz+yQf9rJbYnJr+CJH+LP5vwhsg+z1/6LL
X-Gm-Gg: Acq92OE4f5d1r1qWjABiSmOLoWyHwtYuzwQhFseL3YQsNxhESuC4f3+zh/tkuT1HYvV
	CaMExClN2ypjaU7fxveNKf8rhzvK0EkwbO/zBDI8hZ2i6t0FZSQ5+z5AiPNTnRDtLRacvApg+pj
	gRu7u2V0R4EN/gIGSn3EaPnYs4zJP5JwG7XxS0nkxAMcmHW5k/ZqeOvX0nX0vdzjKUVXioBsoZt
	Dzg6EPaCcMFwUbaob6chdwRjboYYyZb4BsdqwV4L+tqbA2n6IrGQqSpVBx889EKepeNQt6fMhqf
	tInRYgO2IHIua9mjgdBonaMT
X-Received: by 2002:a05:6000:18a5:b0:43d:1dfe:350a with SMTP id
 ffacd0b85a97d-4515ce1c991mr22140440f8f.22.1778258111228; Fri, 08 May 2026
 09:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev> <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com>
In-Reply-To: <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com>
From: Vincent Davis <vince@underview.tech>
Date: Fri, 8 May 2026 12:34:58 -0400
X-Gm-Features: AVHnY4LSQEIzpsAwLbBRkSsqnLb1QVVuwvyN7WhJdKtY_O1Ue8gehrd-RtiGquk
Message-ID: <CAPQx_gNgsrsQJuxvnRi2LrM2K2hitm5Epnv55X1=PVLerZJozg@mail.gmail.com>
Subject: Re: [OE-core] [Openembedded-architecture] What to do with vim in openembedded-core?
To: openembedded-core@lists.openembedded.org, 
	openembedded-architecture@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009faae065150fb68"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 16:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236730

--00000000000009faae065150fb68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Know I'm just a drive by contributor, but I agree with Tim. Think having a
separate layer for just one recipe is over kill.

Would it be fine to stop applying CVE patches to vim and keep the recipe in
oe-core? I and i'm assuming most people solely use it for development
purposes anyways. Then remove vim from production builds.

Given the package do CVE patches really matter?

Vincent


On Fri, May 8, 2026, 11:03=E2=80=AFAM Tim Orling via lists.openembedded.org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> I understand the pain points you mention, as I have tried to help maintai=
n
> vim in oe-core.
>
> However, I have a LIFETIME of muscle memory using vim and for me
> personally forcing me to use nano is a non starter.
> So then I would be constantly needing to pull it in from wherever else it
> gets moved.
>
> I don't have any good suggestions for how to deal with the problem,
> however.
>
> On Fri, May 8, 2026 at 6:29=E2=80=AFAM Paul Barker via lists.openembedded=
.org
> <paul=3Dpbarker.dev@lists.openembedded.org> wrote:
>
>> Hi all,
>>
>> We have a vim recipe in openembedded-core to provide:
>> - An editor without the limitations of busybox vi.
>> - The `xxd` command, used as a runtime dependency of dosfstools-ptest.
>>
>> However, vim is difficult to maintain in our stable releases. There is a
>> regular stream of CVEs that need fixing due to the large UI and input
>> surface of vim, and backporting fixes has proven difficult. This isn't
>> just a Yocto Project issue, the Debian tracker [1] currently shows 14
>> unresolved CVEs in Trixie and 15 unresolved CVEs in Bookworm. And, it's
>> very difficult to share work between distros, as vim tags every commit
>> as a new release, every distro ends up on a different release and needs
>> to re-validate any backported patches.
>>
>> So, I propose we drop vim from openembedded-core on the master branch,
>> post-wrynose.
>>
>> We can use tinyxxd [2] to provide xxd, this is based on the vim codebase
>> and frequently merges changes from upstream.
>>
>> We can use GNU Nano as our default editor where something more capable
>> than busybox vi is needed, this has a sensible release model. The much
>> simpler input model and lack of scripting facility means that CVEs in
>> nano are much fewer and further between.
>>
>> If we do this, what should we do with vim? We could move it back to
>> meta-oe, but that would simply be moving the maintenance burden. We
>> could stop backporting CVE fixes to vim and recommend that an LTS mixin
>> layer is used to provide newer versions of vim for stable branches. I'm
>> open to ideas.
>>
>> [1]: https://tracker.debian.org/pkg/vim
>> [2]: https://github.com/xyproto/tinyxxd
>>
>> Best regards,
>>
>> --
>> Paul Barker
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236726):
> https://lists.openembedded.org/g/openembedded-core/message/236726
> Mute This Topic: https://lists.openembedded.org/mt/119215860/7072109
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [vince@underview.tech]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000009faae065150fb68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hello,</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Know I&#39;m just a drive by contributor, but I agree wi=
th Tim. Think having a separate layer for just one recipe is over kill.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Would it be fine to stop ap=
plying CVE patches to vim and keep the recipe in oe-core? I and i&#39;m ass=
uming most people solely use it for development purposes anyways. Then remo=
ve vim from production builds.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Given the package do CVE patches really matter?</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Vincent</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"></div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 8, 2026, 11:03=E2=80=
=AFAM Tim Orling via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div>I understand the pain points you =
mention, as I have tried to help maintain vim in oe-core.</div><div><br></d=
iv><div>However, I have a LIFETIME of muscle memory using vim and for me pe=
rsonally forcing me to use nano is a non starter.</div><div>So then I would=
 be constantly needing to pull it in from wherever else it gets moved.</div=
><div><br></div><div>I don&#39;t have any good suggestions for how to deal =
with the problem, however.</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, May 8, 2026 at 6:29=E2=80=AFAM Paul Barke=
r via <a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"no=
referrer">lists.openembedded.org</a> &lt;paul=3D<a href=3D"mailto:pbarker.d=
ev@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">pbarker.dev=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi all,<br>
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
[1]: <a href=3D"https://tracker.debian.org/pkg/vim" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://tracker.debian.org/pkg/vim</a><br>
[2]: <a href=3D"https://github.com/xyproto/tinyxxd" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://github.com/xyproto/tinyxxd</a><br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236726): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236726" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/236726</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119215860/707=
2109" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119215860/7072109</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [vince@underview.tech]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000009faae065150fb68--

