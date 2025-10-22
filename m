Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DD2CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 12:14:35 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.7365.1761135273247375036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 05:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hz5+T99R;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-791fd6bffbaso102643296d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761135272; x=1761740072; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJgBNHGW2TbiOessG9p8vM/CNV1GVj+qMWQ63jIipHE=;
        b=hz5+T99RPeeuWoRiXEt+XRC29MIxosNNjjlZzo6HEsAxutJqo4z4cJbLcS1iCbniLG
         uSKzZufCGgb3fn3mA1uLzAKzLXedfZcBBVhmAukMpExLj1qboeYf5aEeEYJ8JY8l4LFG
         tVOfuojmWmjnw4FDlrWHz5Xf6xGILZfV4ushu6QgVfu/1aAbZDejKrXqwND09kWfi6VM
         63UksgecHk6xP6CuU4aJuoZkJNigu9R4v1RSgR1tzttN18se3I7JjgLLCmviE/7xe8c2
         iZKCttatlfH3Qh7/CiZwsssV17vfPC4VVs9Nc980UMpmN49zZj1eKO8KMEs28c2/vh8e
         ouYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761135272; x=1761740072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJgBNHGW2TbiOessG9p8vM/CNV1GVj+qMWQ63jIipHE=;
        b=jvPzQhv8m08/gtsDJzK37/cFSKHfummuULVTXEYpJ00q6CfdeFfH2PFRgU8ir3NeuV
         hPsISlIE9VAc/BkDov7gz1AY/RWJG+GjUNaZODpBfa23qq9S8h6C+KrPwlYIEXE3WRFY
         t7THJJM+X/zejXdR4CHbPUSN/jjoimjdcGIg7H2wCe3SaWqBqdfImsvydFu6JsYr5y2T
         tRjSO/p/v6qjkQpT/zrLhM1J8oyIwBcWtZw2TQ/aLA5wWRrKSNAWVen9+vLvU/PnISU4
         QnGDifrWvyT1S3ncO5gQCUIxXNW3ZHUMaCxbSgz+zvlsEmC1V7SA+2sgXM5aNAFGDeJs
         +Iew==
X-Gm-Message-State: AOJu0YwcyNdN23XbUxJP08bwwPXBmFeWoBxUWF61khdN8jC229VjfMrX
	QY4g1Eo10/kpZFVLRKgj9svOBSprPVhG5p9+cXpvJcgY0rqUEPp51qkF+L+hsq/gswRbQNsIw8c
	L3eGYqPFgPkZcJnnZ+ttM/uBR64duZeE=
X-Gm-Gg: ASbGncsbwwFFH7xgial8ToBg23ZUKu0NGaElAJ2O45WL2VnYYKxYGXhOSW8pmMBgudd
	duq5hI0/rvwNR+TczmiSafhrLdFIt/RY8wJX3gv4Drm8dAGPAlm0oVPpNEbA5sVjjZ68yZUFIfv
	7/9M4XjrpC1iN8S8Ju8Ff30t28ysm/ZgycpHfo+ZYPl9ngVDVg6o3moHTUukqesOWWQLvZdRMBW
	UXGQq7iZnQO0YVuzw3fBspnBPEj1z9SBghv+SrWdRHQgNPRvFRNC9v/OuxexoeNvcOO9BkHtZjK
	2PfUevuBJhJLDxKOJFlUnBc7u9uuu3IuKV6uyWvxkoU09k33HbABZ8dCBFZ+yvfKXttgQrHtiOw
	1UHmMhzBHz1FjKvbpA/VZpTU8hzFagczjZC1s14w=
X-Google-Smtp-Source: AGHT+IH/t19/NBFXMJ21Vz78ZVgcfElzWhGF8QDjI8fp+QWhi6NYODw9rvbA0W90gV4vDreMUYAHPRV2GHZv0TLCqUU=
X-Received: by 2002:a05:6214:4012:b0:87d:8fa7:d29e with SMTP id
 6a1803df08f44-87d8fa7d3a7mr196532596d6.35.1761135272202; Wed, 22 Oct 2025
 05:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251022113212.3220395-1-alex.kanavin@gmail.com> <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de>
In-Reply-To: <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Oct 2025 14:14:20 +0200
X-Gm-Features: AS18NWC-T95TiB4_JmXDBADOHQhoKpN-tE4El9nfdsIkc_B-IZzTRKOrIUU7das
Message-ID: <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 12:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225188

On Wed, 22 Oct 2025 at 13:56, Quentin Schulz <quentin.schulz@cherry.de> wro=
te:
> Does the sanity check still make sense if it simply cannot be triggered
> anymore?
>
> In other words, should we remove BB_MIN_VERSION variable and its check
> in meta/classes-global/sanity.bbclass? My worry is that we forget to
> keep them in sync. If we need to keep it, do you think it'd make sense
> to move BB_MIN_VERSION to this file here too? And if possible use it as
> argument to bitbake_min_version so we only have one place to modify for
> bumping the variable.

I think the existing sanity check could be dropped, yes. I tried
defining BB_MIN_VERSION here, and using it as an argument to
bitbake_min_version, but at this point the datastore doesn't seem to
be ready, and variable expansion doesn't work. Or maybe I did
something incorrectly. Can you try it on your side?

> Another question is whether we should backport this to earlier releases.

Probably not. It's a new feature, and the issue is most pressing when
people move on from integrated poky into separate bitbake/core
checkouts.

> Another question is whether we can use a newer bitbake with older
> releases, which this wouldn't help with. E.g. what happens if I use
> bitbake 2.15.2 with scarthgap layers for example. Should we force the
> version to be MAJOR.MINOR and ignore any patch if not specified? e.g.
>
> bitbake_expect_version 2.15
>
> would match anything from 2.15 to 2.15.999
>
> bitbake_expect_version 2.15.2
>
> would match anything from 2.15.2 to 2.15.999.
>
> =C3=A0-la Rust version resolver, c.f.
> https://doc.rust-lang.org/cargo/reference/resolver.html#version-requireme=
nts
>
> Should we rather have an explicit max version (but ok if not defined for
> e.g. the master branch)?

I don't know. Enforcing a minimum version is straightforward, but what
the maximum version should be is more complicated to define and
maintain. It's probably a separate issue; this change simply moves an
existing check earlier in bitbake invocations.

Alex

