Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC79C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 17:57:17 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.1809.1721757432648311173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 10:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YtJeNp8G;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso28940151fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721757431; x=1722362231; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2DF1xysBgbwDKRp2w3Pvg+8v22CjUev6Wx7m5okkDw=;
        b=YtJeNp8GmXqxpx+FGwcAyIcAchJ0sCq3HBjn+0vjMItBtQUw1GnzmczxboMMFgGvol
         KqovCMnF2E1EN97BJL/RniRdhGuY3GLMAkIUuZpSTQLeBSMSbvGtcDIpF7wVQrSimTf4
         Ggfw8tIB3tvW0Z+UWtp0FpjBxkJ3o3h6GReGc0sUZrJs6luqNjeefpBCg+efbAkUfIsR
         j5RgFNE/UOxG/bvd+EEncGsZKEq1pDEyhHFYO51hOEQGVG+YZDe23myHUjncm3QPcLum
         ZYKfg34G0ee4+vtEMqgLj8o2sLVdnw8Qx2sThsookVLbEOGorK+avOq93FTfAQ4eqIlt
         HasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721757431; x=1722362231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2DF1xysBgbwDKRp2w3Pvg+8v22CjUev6Wx7m5okkDw=;
        b=DEEaKcuxNqsVt9uijvYvl5hVE3fAGZqBRab6BQThXgDJk5l/n8j3M6Nxgx3qnqmxZp
         /eU+x7grCBforaXZ+0TJfqcIulUqPcLFCDGf3ZGmpFHuVXd4TWnH6zzBb1vTwaOWVLmq
         CVxr82IFBl1PKZGBskIPRMqZx78WAJssI6BgnNNZxtcB65OZzPjIIwhI7iH+owXUX0a+
         qYRQJkf49E+nluRv3Wvoj0heZc5wszuvNc3yuOQCM2BDxETX3zIECabDUiGWc8jw9Dhd
         SaydBCCJr61SrmC+Y7AVojoJDIdSfYRub6WM7jL8O+9a+kEhYrI4eqTQUYC4DdpmNw3q
         goKA==
X-Forwarded-Encrypted: i=1; AJvYcCVqlhM/2RNM+6e7b6RyHBU7XK7/DyZTuTvLUaZskR2Zg+WSp0c+LlrXrahVcTxVp4hWSdmzhZu6P9H06E6WhY239oL02Hz+BP797W/XZ08pYgA8pEU3OzG2
X-Gm-Message-State: AOJu0Ywp3WtMTqT8ooUefWLyFzyGwEMqrCXEvDMM0gSfr39hSuEHeQ/u
	S303ysqCDG21XGqcAZiPQibadGPbKMEN1KZM6uL3xApNHSfijrpzki74wJyHUF24wLNEJ4Wxspc
	BuG0gjqn/+sySj7YtvIAbiUiS8lQ=
X-Google-Smtp-Source: AGHT+IFh3GYhA6h4ze0/wao63hzxYs+VfRINTvRsxg7NfU9459uRvUMadiHZtBZLObHScsOhlB5iU+ry1bHi3qDLXkk=
X-Received: by 2002:a2e:b704:0:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2ef16849d7emr77002161fa.38.1721757430296; Tue, 23 Jul 2024
 10:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240719164639.GN17572@denix.org> <15389.1721741918254132393@lists.openembedded.org>
 <878fe028-ade0-4646-8294-429eebdaeb14@windriver.com>
In-Reply-To: <878fe028-ade0-4646-8294-429eebdaeb14@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jul 2024 19:56:58 +0200
Message-ID: <CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: randy.macleod@windriver.com
Cc: kweihmann@outlook.com, openembedded-core@lists.openembedded.org, 
	Jiaying.Song.CN@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 17:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202415

I guess the recommendation to remove the symlink if needed was a bit
poorly thought out.

On the other hand, I fail to see any benefit whatsoever in a separate
python-is-python3. If you do not have python 2.x installed on target,
there is no difference in whether there is a python symlink on the
target or not. And if you do, you still have the same clash between
2.x scripts that refer to python, and 3.x scripts that refer to
python, and no easy way to resolve that clash.

What I am proposing instead is this:

- python to python3 symlink is still provided by the base package.
It's not accurate to say that 'patching' things from recipes to use
python3 is what people 'prefer', it's that up until now they were
forced to do it, Randy.

- if anyone is still using python 2.x in target images in 2024 with
yocto master (nevermind that the public python2 layer is dead and
unmaintained), and is relying on python 2.x being symlinked to python,
they should be adjusting their scripts to point to python2 instead.
They no longer own the unversioned python symlink and we should not be
catering to them.

Please reframe your arguments.

Alex

On Tue, 23 Jul 2024 at 18:44, Randy MacLeod via lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2024-07-23 9:38 a.m., Konrad Weihmann via lists.openembedded.org wrote=
:
>
> I also vote against it.
>
> I'm on the fence but I'll be swayed by the "against" voters.
>
> There are pros and cons to a system-wide solution but it seems that
> people prefer to have these problems fixed in each affected recipe.
> Best solution is to update the script to call and work with python3.
> If the upstream refuses to do that, the layer would have to carry a patch=
.
>
> This is how most such '/usr/bin/python' problems have been solved.
> It's a shame that upstream python didn't mandate a specific solution.
>
> Btw, some people could use:
>
> https://github.com/Igalia/meta-webkit/blob/main/recipes-devtools/python/p=
ython-is-python3_1.0.bb
> https://github.com/Igalia/meta-webkit/commit/b2156c282a6e727100dee25155fb=
c38d1532b573
> https://github.com/Igalia/meta-webkit/commit/46fbfbc58f82abc3dc8794c63017=
2d4554be0830
>
> =E2=9D=AF git log --stat 46fbfbc5
> commit 46fbfbc58f82abc3dc8794c630172d4554be0830
> Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
> Date:   Mon Dec 19 20:29:05 2022
>
>     Add a new image and distro definition for using on the WebKit CI for =
WPE perf bots
>
>  ...
>
>     * It adds also a 'python-is-python3' recipe that creates a symlink
>     to provide the unversioned python interpreter as python3.
>
>
> but both oe-core and meta-oe maintainers said on today's YP tech call tha=
t
> they would *not* carry that recipe.
>
> ../Randy
>
>
>
>
> While I see the convenience in dropping a lot of patches the better appro=
ach would be to add something like python-is-python3, for the ones that req=
uire it.
> (meta-webkit does provide it already https://github.com/Igalia/meta-webki=
t/blob/main/recipes-devtools/python/python-is-python3_1.0.bb).
>
> Adding a link by the base package and recommending to the user to remove =
it again, would create two very unwelcome situations.
>
> a) it will clash at image assembly with an error message that will no eas=
ily point to the python base package
> b) create a need to run with a permanent remove operation on top of poky =
(creating the need for new sstate cache artifacts)
>
> What I could see is to move the symlink into an optional package, which c=
ould be used by the few recipes that still use the "wrong" interpreter line=
 via RDEPENDS, that would be the much cleaner solution here
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
> View/Reply Online (#202412): https://lists.openembedded.org/g/openembedde=
d-core/message/202412
> Mute This Topic: https://lists.openembedded.org/mt/107264938/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

