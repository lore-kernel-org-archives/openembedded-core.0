Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFCCC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 09:20:16 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.9136.1715851207119306751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 02:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ffoKL4y3;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52192578b95so633242e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 02:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715851205; x=1716456005; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5Ytn4GmLtqWWHlDVYUOyWKLdpLyoudPVpQ1e+0+CL0=;
        b=ffoKL4y3M34ecX2yriBW1lZJHmZrSklChb/pSlWQNs1YfACfrpPjUbOU0Db8GTXMWo
         f0KatvWMVoVw+c/PnjpdZjtMUOAgEYRjs/Lr+bSI7slgjFqJSLwQSFXZJJWf5zk50in3
         LcfeTV+5FyZCQoI8Sh7AhgPSx7FRbRqfC5HTI4oIlOQZKOmjrJ8M4DHmj4d26pEZYlOr
         nFQaDDZwflt7m0TiRnrXfeIjuEil1b36NQofbLoO2y9P/cZseQ/1FjU+9hK5uZ518FYp
         PZ9uHBWLJaHbewVgMGO7iA/stbVewX1x0M2J8Nkmyssoa9/Mc0bFETarolx74I4twnTt
         bPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715851205; x=1716456005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5Ytn4GmLtqWWHlDVYUOyWKLdpLyoudPVpQ1e+0+CL0=;
        b=MiW5IHNIQWj6qinOf+tuDEe2Ju62jxyNtsvHvdCQJOJiPZlkQuVv6OYQogY2zzeciR
         34LH/jdAYFVr0q3CIDf0XJ8dladfgUn7D33ccJtJZqjAXByu9v2XBFooG9jUX9RAZxgw
         ziCCNGTYUbNq+Z379qmRTQnxWTO91DFlRqoHPPH2MrBPqD4JkGi20fAsfweBQt6QBDLd
         okOfJ3L/AE19Ifuvn1q2rRh9yybyodDbhp9ih+hy77jSzflLgCKiPP/aJX6BDxickA8j
         vVR2JZvygKfed97uNIYKrJB7zrQsvC05C18fzWEDKzVWewWeEcyQ6HgFLe3gh3b/m2FN
         s2wA==
X-Forwarded-Encrypted: i=1; AJvYcCVzEqTtKeuP4mDZiVsyk2hquAEJgaI4lAMNvoj/X2u/dGZpqbJ2jdlo9mjSozZxdjO91pbxAzaktinmWjdwHrXOMOPKZoPR4LS6a8HMwegFBKrLksFm/7+Z
X-Gm-Message-State: AOJu0YxEfkyxig+BC73bXEqeb8n67ddRKBQUyz9Fp1LmW9vht1N4E/Dx
	f3CbOzCBJxyTgO41lOjDIZPN1uLFMGYDPG44Jo3RzHpop7zcgG0HLpBG6sRoBrveB+n/u88OLKB
	q5k01Vg+8K6GW5OqDM4kchq21lvA=
X-Google-Smtp-Source: AGHT+IHgSW+vzR0+DdDyGP7EhBEm5r1rxe8oS4gYGTB+OGsbHGSC5kt/JIQM2DJRc/wPUVez/AIbLlyTaOfUAV0eLI8=
X-Received: by 2002:a05:6512:ac9:b0:51d:a78e:9036 with SMTP id
 2adb3069b0e04-522100691e3mr13591376e87.69.1715851204899; Thu, 16 May 2024
 02:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org> <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com>
In-Reply-To: <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 May 2024 11:19:53 +0200
Message-ID: <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: randy.macleod@windriver.com
Cc: alex.kiernan@gmail.com, Yash.Shinde@windriver.com, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 09:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199447

As explained elsewhere, rust selftest is going to be disabled to
resolve sporadic autobuilder failures. This also gives everyone a
chance to update rust to latest upstream release without having to
fight with the selftest.

Before selftest is re-enabled, I would ask for the following improvements:

- when it fails, the output is huge, and easily exceeds the terminal
buffer. It's difficult to look through it for possible failures, and
impossible to tell if some failures have scrolled off the buffer. Is
it written to a file somewhere? How do the fails look like? The test
should make both of these points clear. Can we reduce verbosity by
default? No one needs to see a complete list of everything that passed
when just a few items fail.

- the test takes 20 minutes to execute. When debugging it you can't
possibly ask for that much time for developers for every test
execution. There should be a way to re-run just the item that failed
from command line in a preserved build-st directory, and that should
be documented and printed on failure.

Thanks,
Alex

On Tue, 14 May 2024 at 17:52, Randy MacLeod via lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2024-04-05 7:28 a.m., Alex Kiernan via lists.openembedded.org wrote:
>
> On Thu, Apr 4, 2024 at 10:07=E2=80=AFAM Yash Shinde via lists.openembedde=
d.org
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On Wed, Apr 3, 2024 at 05:51 PM, Alex Kiernan wrote:
>
> Hi Sundeep (or anyone else with insight on this!)
>
> How do you go about debugging rust oe-selftest failures? I've bumped
> everything up to 1.77 (https://github.com/akiernan/poky) but
> oe-selftest fails for reasons that aren't immediately obvious to me...
>
> https://gist.github.com/akiernan/6cc6131c1ec3af866098a9318679cf1b
>
> Any clues?
>
> --
> Alex Kiernan
>
>
>
>
> Hi Alex,
>
> I faced the same errors when I was working on to upgrade rust from 1.75 t=
o 1.76. I discussed it with rust upstream here, https://github.com/rust-lan=
g/rust/issues/122075 and the following change solves those failures,
>
> https://github.com/rust-lang/rust/issues/122075#issuecomment-1985153524
>
> PR- https://github.com/rust-lang/rust/pull/122205/commits/5aece7fad06baaa=
745784d118db862b3e3ccf7f8
>
>
>
>
>
> After this change was backported to poky, the rust build was successful b=
ut it was seen that not all the tests are executed.
>
> While discussing upstream, it was known that removing the --doc option fr=
om python3 src/bootstrap/bootstrap.py test --exclude<some excluded test cas=
es list> --doc --no-fail-fast --bless --target x86_64-poky-linux-gnu  cmd i=
n oeqa/selftest/cases/rust.py file execute the other tests also.
>
>
>
>
>
> But, while doing so another set of failures are observed as mentioned in =
https://github.com/rust-lang/rust/issues/122285
>
> Complete log using --doc option-  https://gist.github.com/Yashinde145/7db=
6bd4a064021bf756b0c0dd6c8777c
>
> Complete log without using --doc option-  https://gist.github.com/Yashind=
e145/036a934f0523307859f7c855b83ecfd6 (this file is truncated in gist due t=
o large size, please see Complete raw file)
>
> I am not very familiar to these failures but  trying to understand them.
>
> Feels like you're way ahead of me. I'll have a bit more of a poke at
> it when I've some time, but it feels like we may be mostly waiting on
> upstream (and a big +1 for getting them engaged!)
>
> FYI,
>
> Sundeep and Yashe have Rust 1.77 (8?) compiling reproducibly.
> They found some problems with the rust test suite and
> are working on fixing or avoiding those errors before submitting a patch.
>
>
> ../Randy
>
>
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199262): https://lists.openembedded.org/g/openembedde=
d-core/message/199262
> Mute This Topic: https://lists.openembedded.org/mt/105307188/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

