Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB8FE8784E
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 17:08:56 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21587.1770138534573812626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 09:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSydERLJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a2ad13c24so52645106d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 09:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770138533; cv=none;
        d=google.com; s=arc-20240605;
        b=RnrZGeNlKC81mGI6F/FlPqwGgAGq7TcHCG1kw9GDrJgDgA+9W0Ac3j+Osa4cpF5VGB
         bXJSQAT+Zok3wn0g4chTnvIx9+pwmjmdCXO6mUOnCnkRLRtje2Inqo1PiGURL9PeEv5S
         BCv1J7hkPkFDaqKd+x9Oa6uPd+sGuVHGrBN6GoxrEcTeTJl+yscIXMxbPEIgfYpfmaCn
         8z1+3ookdY9p5qbx7axXnbZ0H8+ynotXKElm4S/vbIins+X+BVWPgZ7ze4Q8ifpz6rVL
         Et+f+ZRR7FpgMzeFddZuN57aG8Z5ih+hrezYJJlFM3lsdO52siFYuSx0kEjVhwoCbCiB
         kckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T7f+mIZUZuMnhCXNT23/aeCXRGlRYtWdDre+e/4Wd8g=;
        fh=u4DvjJdZSUYYFqIiSBSQInCBrIyMnjC0ZhQ/a+gMKW8=;
        b=TH6G78tKjqBlLgzf+XM57xYa1YqscQ47qHa14CFB+ATZj6EO4POqVy6mU4/y/i63Ko
         xaCcrlZcp+1UiP0YlJfu9DsHCQ0aw/z6exB3DmwhzjgtuV/u5+nlL3nqM07rvew14QO8
         WjCqMvdvUgUqcWhae49noase+SLQa763euDRwO/8ZRVT0aTqdRjlTalu36hO/kXek5bl
         7j5nY9ff2x+77AqDNSEHi93hO6M9sbSwwwQE7joeq4LkLKwl2v8ofzmtm/+IRR1L76Du
         TGL8UUabDWE31CY23p0IyxVdBs2gEufcAVUcv1wXHBThe97j2ueHm8RvCQ7D95ODI33D
         nu/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770138533; x=1770743333; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T7f+mIZUZuMnhCXNT23/aeCXRGlRYtWdDre+e/4Wd8g=;
        b=FSydERLJmGhvKarv6446FbCs8mzDe8NyvVpw28x1VehHsv2l0Fm0JlU4W2SE8OTm0S
         rDpxPrxmfF3JJsjVtXHlpnD+0wDqDg5O39hZkSowkd7UakL93kb3JBKbxCkTT7KKqUB/
         C3FtUpXQ8K1kQwNGzA2m4/xmElQAZV3WUtUEq3LqSpVqAwdz+n8sbIwfJmzqDurdfaXY
         R9yFZPXQaQTt0rudfYPTNd7/s0x6uefsB9aKz2lj9kq9VmdswC9cF+9Ty4zcjntCp5WI
         OkAGpvnUGl4ZElU8AUobNKSEkSMmXo9emT1G3bOKUYAIyW0XBp+DhLelRYRvliqg+Afv
         nTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138533; x=1770743333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7f+mIZUZuMnhCXNT23/aeCXRGlRYtWdDre+e/4Wd8g=;
        b=jlPC54SZoBK4nYXmyLrthecGvZ3xLm0ewnwdK8Inm69TH9+PiRXt/xOlmoMAenklQU
         kE90H6pagdt5MY+/G28GfOhXH0PtluR9YhB7vp9wfHtcAXJqhPohflRWnzqwBWRJ4QXj
         aP0esoW/Gh0AcgyhORBkoaZI63LeuUY8dKuoKDvjv4FKXzbtsxJhGemx7ve5lquQ25ap
         QNAQP4fhl3NhrfriROUYJgbeBtBOqWkZpLppFCIJXY6dQeolnoCa09+JVaFDjzzJ7J0E
         hdGDmadi4nGnU/ffStUwhue3G/4Qtqpof5aUejZVjX/iDrmCKEU///5WCEVdaj21WnnD
         OZNg==
X-Gm-Message-State: AOJu0Yywthsvu1ufzp6fUODX4FBgbu/dbMRLJyFwuu9a8F4c5htM/6EX
	SoUql5d8UHrPTe5IU1DKvLCGq5UlyLn1ISryc5nXNr080QtRpBwO6JR8SJXmUg6Pl6qPvh4Dt5P
	9CW+Yu7qkdpRVW/TMB2UtEI/HvbrvIa8=
X-Gm-Gg: AZuq6aJx+GKzQdt0LNukEiOWoOWaCcmahTYkMB0hCoUNJVBsEYIw8JZWB4Ud4etVyJf
	71bpMe/AwCgLXEl+QTTUOxcpMUU5e4t0b8clJcqgBcmi3snIen/YtHUKnuAc6ZPgM7eaENNEAqX
	vFzhUwhDTyCOMCiKNFiKyCOVmDNq3sejvTyIvwIO1EfddGGBwaVFHdkqy/Y7YGnJAj6yrIf++fK
	aC8P5uGqxIbM5LN6YJR9+8G5PMal23hHyVMl3C6a/rDCMnEcGELqYqRy195Rb77hu91Nt0TEaxm
	SpdYAqPMNhERlE5uls9An7IzrEaWCw==
X-Received: by 2002:a05:6214:d48:b0:894:7b59:40c8 with SMTP id
 6a1803df08f44-8952211c7e4mr1877606d6.29.1770138533506; Tue, 03 Feb 2026
 09:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20260203143434.3117764-1-samuli.piippo@qt.io> <CANNYZj_WD666FjyPdrrrWCGqsSb+cgLen+y2K8rD-Vhx-UcpYg@mail.gmail.com>
 <CABXoSoVRGebfQDmN8Sc2X7v93gbxkZ7dY5u8tXLdPGfFs-MBYA@mail.gmail.com>
In-Reply-To: <CABXoSoVRGebfQDmN8Sc2X7v93gbxkZ7dY5u8tXLdPGfFs-MBYA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Feb 2026 18:08:41 +0100
X-Gm-Features: AZwV_QiwIroH4UOWzeWkOLDy31gKUp7ifW7V7icHKs2-N3k7p-v2V08W9_x9DHA
Message-ID: <CANNYZj971x3HpzeNAyT7JNmynkZOg0cTTF7jOb38g4LD2hA7wA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe/utils: filter license packages
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 17:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230466

On Tue, 3 Feb 2026 at 17:57, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> The function is used at least in PACKAGESPLITFUNCS to filter out all the system packages
> and then settings rdepends/recommends/etc for the remaining dynamic packages.
> Without this commit, the *-lic license package gets pulled in unintentionally.

But what was the issue caused by -lic packages being pulled in? This
does not cause problems in testing, so it would be good to know how
you arrived at having to change this.

All of this should go into the v2 commit message.

Alex

