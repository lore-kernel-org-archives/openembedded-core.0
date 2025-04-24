Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF412C369D5
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 19:37:15 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.2928.1745523430123941330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 12:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJYvbID3;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f2b05f87fdso13709076d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745523429; x=1746128229; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IGmds7ZHjo7ejA5/r3fRUner6f9NFCaup0n0Y9EiA4Y=;
        b=VJYvbID33AfjKX4A+INwgDmC9OHAQnB+B+dHYWt615XtmeyQW2dGxiyU+kl1cLqgUZ
         mmZ8CvnfwqLteVd39oU563P2Y3GZR2hhkt4FaUAkQw93ewf4cWEJVPYDq8axGMjbFZz+
         Pc7dfL85AnzIPJMf3eC2hmDymGIR0/LsPV+4s+jQ/+VvRZAd1wa9gtwtphGi9IBKmB2n
         /oRwjr92Wic5tvnVPut4dZfdkffgWQTcgDnbFQHNqirB+AIuqNPp6urZYdLXXur0HKQu
         CM07y6jrb/8Yr3X4hL8dBLEPQ/BMRMQanjyVTPIdBH6SSH36SqIpIvQU773G1yi2zsO6
         /crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745523429; x=1746128229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGmds7ZHjo7ejA5/r3fRUner6f9NFCaup0n0Y9EiA4Y=;
        b=X3rJoG4Mij4pVXE/FcL17FakrCCELrmYsaypd8ZVsR6TxGdbDRHAIWaZ1k+7NUhXLA
         LVo/x91EP/9rO5lTj8xco5aYmvcFMih4a1Lvv9O5Ut3LORrwgfT47fRj1gz8INbXZLYa
         dHA+QDYU6RoymRrGFiz2vrgA9BRAhjCzqnH/CyTmtPFAf0Sw03yiySxToVdb76H+vuEh
         plBLaKcGOgrmGZ1YVcecxD+llyAzwDmXI+1xknxOL1AZcT0yPPgiNbdKs7GFcRYg6nM5
         S4rGwLGLfSDTfsZNQWeuATQKi8jNRnEf/d2DGwMEKeNlk34+GXaeutnHdxGBX1B7ftCv
         zHKQ==
X-Gm-Message-State: AOJu0YxTTZpaL2k1ntsEK1TDEdLpykDn9W/I7gHvRMdlJwQimLAoOM9r
	Mf7/LE3qzYLHzck0I25n+XUGY7OBCD/JSuStySLwFwjW26+P4L545xKo9Xjm6NdF+j6oDwRcqDS
	kzhwxqlmD1gunrSQKH02FNqi9ftQ=
X-Gm-Gg: ASbGnctuLkPR6o3IK1kjujesI4DKcvAfOdGmfqsLAHbh4XbP0RTGcWZWPzXyrZOrpJG
	M+By97/w+elTg56MgsPZJ0Pw/x0wWEBGeCPop4NQt0UTtYpUsjAckt8Z2GDWATAvDS+EWmiVdnb
	06nCwzl++qUqXj87xgJn4d5w1ZFe79x17YHlbI+k5nNEaKZuOLzhVMIAEzRofI0b4IFp0=
X-Google-Smtp-Source: AGHT+IHU3Dnrs81yC/8Jr/gn3SvcM5AE9jHKOLf5SXvlQd0cBVEonWG7HqynMlttQ/ToU9vChL5QLuicBQiwHiwkyns=
X-Received: by 2002:a05:6214:f67:b0:6e4:6ee1:a282 with SMTP id
 6a1803df08f44-6f4bfbd75b3mr76160526d6.18.1745523429213; Thu, 24 Apr 2025
 12:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
 <18394019E7982924.8448@lists.openembedded.org> <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com> <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
In-Reply-To: <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Apr 2025 21:36:58 +0200
X-Gm-Features: ATxdqUHXuQ4SPQrP3Wqp8lxYuhOYlFZasSrabg7t0xzqJLWOFpFv4s0qw2CFjW0
Message-ID: <CANNYZj_j9TnJGEsfQ9fuivKQ0KcZgSyCc-OXbyXvzOuy2=S68g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 19:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215401

On Thu, 24 Apr 2025 at 15:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Stepping back further, we had this mess in devtool in the first place
> as it could never work out which files in WORKDIR were "sources" which
> it needed to handle carefully.
>
> We now define UNPACKDIR as the place we unpack files to. devtool in
> theory can therefore just redefine UNPACKDIR and WORKDIR and things
> should 'just work'. The relation of the subpaths between the two should
> remain the same.

I still struggle to understand this argument. As far as I see, to
determine where is the 'source tree', devtool cannot avoid looking at
both WORKDIR and S (and now, UNPACKDIR too) and then calculate
something reasonable out of both (and with UNPACKDIR in the mix, all
three).

Let me describe this step by step what happens without the patch.

1. devtool manages a 'workspace': a special layer under
build/workspace/. Part of the workspace is sources/: a place where
source trees are placed. When a recipe is taken into workspace, its
source tree is placed under build/workspace/sources/${PN}/.

2. How does devtool determine where to take the source tree from? It
sets WORKDIR to a temporary location under the real oe-core workdir,
and then performs an unpack operation. Then it, somehow, needs to find
the source tree under that temporary WORKDIR. It cannot simply use S:
this can be set to a nested sub-directory deep inside the actual
source tree. It cannot use WORKDIR either: this is not the source tree
in almost all cases (and is now forbidden anyway).

3. Let's say WORKDIR is set to /some/path/to/workdir, and S is then
/some/path/to/workdir/git/some/subpath/. (via S =
"${WORKDIR}/git/some/subpath")

devtool does this:

a) use os.path.relpath on WORKDIR and S to obtain git/some/subpath part
b) then it splits that part into individual directories and take the
first one: 'git'
c) then it's appended to WORKDIR: /some/path/to/workdir/git
d) then devtool uses shutil.move to move/rename that into workspace,
so /some/path/to/workdir/git becomes build/workspace/sources/${PN}

All fine, so far. What happens if the recipe sets S =
"${UNPACKDIR}/git/some/subpath? The same calculation as in point three
will yield UNPACKDIR (incorrect), instead of UNPACKDIR/git (correct).
And this is what the patch is aiming to address: it changes the code
to first check if S is under UNPACKDIR, and if so, performs the
calculation in point three relative to UNPACKDIR. Otherwise, it's
performed relative to WORKDIR, as before.

The argument I can't understand is that devtool can somehow avoid
looking at S altogether, and achieve the right thing by just
redefining UNPACKDIR and WORKDIR and removing the logic described
above, but how? How would we end up with the correct source tree in
the workspace then?

Alex

