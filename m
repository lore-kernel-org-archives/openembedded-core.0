Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1184C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 07:54:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.4345.1716364452247011079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 00:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nppqaskf;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5241b49c0daso4106176e87.0;
        Wed, 22 May 2024 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716364450; x=1716969250; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SRfS8mAm4lKv+1cOKiM0RgEV8H9INL5WyZXuc3TKwOI=;
        b=Nppqaskfs6XDN+s/Q0kIfGubnk4t5BfwMbbPBO46VVCw7fIkTF2gvENJAqHWHxq8bA
         tdB97R6HCxR3cjVxVFk4pRZxpuwj7LDkpXjfnwgZQnLebdAAmu377bJjC4FCr4/dNuwF
         iivgUR0ep176I9s6OoLTtvE9HkiMrZYQULyNSP3HoMzZrKvlmQCDJeuOybGmALtibX29
         k4498rtSGYe5BtcPL+ANhyTo3BCgEF0NHh1tlKOiPlKqlM36B5rxduHV9J1fijtgAyVv
         QJAdVhQEFShvqpXU5pJFgH0O2EpikhknTFstvSRPSPXJlCcR2pZo/yVNABW4gwctLTXW
         eJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716364450; x=1716969250;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRfS8mAm4lKv+1cOKiM0RgEV8H9INL5WyZXuc3TKwOI=;
        b=Y/T2QDOQwnG+SzlWAK/8rYBxpx7Cjuhead+D71t1UcIcI0BOpy5oLdgjDF91O1ucXa
         TRpebWtxwy6i9bGWzRMBHGdxWqZFxQac2/XYP0LSh4u/9oLJY9jXSKCTHRbDRWVyxDMz
         4x/n2U9c6YzoK+/KkmMiDJim0bIa5v0IKyYhcbW1MIReJrtXwuT2jbLSZ7tIwr+xHO0s
         QJN+peihlPykTMZr9vPZd3EEL8IltshS1y2vUR/W4YMF2rwlCvdfuAl2RqJOaDUC5p+p
         Se1EPkiVLtIkNobJjzRN/lmVVZXvtKYcj/IIijLY/jyGSkcVypLGkE+Dd3hWLMwhmzIT
         tQPg==
X-Forwarded-Encrypted: i=1; AJvYcCXXeB7UaNG5tJaNE//WiKOYfK5obIYwb4wdGqf3o6HriVxWwxI6drdxXEuKcDgvAJXjypiOCozcDsFQ0G7xx92rQEvf+qJwrZXvsjXyP6tmJt1ned2UTlix
X-Gm-Message-State: AOJu0YxcKvPfoqv8kPOXyxizNnAOuCjtYzdNnUKB7x06vq4cfPt2Bf+t
	TtnIzRvP3i+0Ld7ASPGkoPTLnNSBi/12t1ZiyJftI4YyBoizKtnOMGyRsqPEI4pv4Hp0GitokUC
	AE70PrqmPMw991sYSDycV51wxbSbXsQ==
X-Google-Smtp-Source: AGHT+IHs3MWsWiWhke85P/i+cB7nZeDi1heVAibQwvvRIUrTa622r1FBQqR6hSYwLPHv5J/jwVtlMh8L2vn2xhytuJo=
X-Received: by 2002:a19:434a:0:b0:51d:aae8:646 with SMTP id
 2adb3069b0e04-526be8d55f7mr700754e87.11.1716364449605; Wed, 22 May 2024
 00:54:09 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2024 09:53:58 +0200
Message-ID: <CANNYZj84YtfRPXWm7c=DV6mOeQwVJaKLyeOHd7ni6PtZYx88BQ@mail.gmail.com>
Subject: proposal: controlled deprecation process for oe-core
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 07:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199690

Hello all,

right now it's extremely difficult to remove anything from oe-core.
The reasons are that either we don't know how removal will affect
possible users, or we do know that and we don't want to upset them by
sudden breakage and 'flag days'. Especially if those users are
supporting the project through membership fees.

On the other hand the maintainers burden is only growing as more and
more things are being added into core. This has consequences, the most
damaging being the resulting burnout, or coming dangerously close to
it. It's not just RP pushing himself into unhealthy territory: all of
us are, and me as well. Spending most (or all) of the time on routine,
unappreciated things that hold no interest or fun is not healthy;
there must be time and space for exciting, novel, fun activities. Yes,
even when one gets paid for it.

To steer things into a healthier, more sustainable direction, I'm
proposing a two stage deprecation process for things that should be
either maintained elsewhere, or dropped altogether:

1. Phase one: if a deprecated feature or recipe is enabled, users get
a warning at the start of the build and an invitation to describe
their usage of the feature in public (e.g. oe-core list or a bugzilla
ticket). Otherwise nothing changes: the autobuilder testing of the
deprecated item remains as it was (with a tweak to enable it
explicitly rather than through poky/core defaults if needed), and the
build is not going to fail.

This would allow the project to more accurately assess the usage of
the feature, and whether the users are willing to allocate resources
towards keeping it alive. Right now we often simply have no idea about
those things, just a vague feeling that it's not particularly useful
or used. We have to force users to come out and tell us what they use
and how. At that point, we could also hand them the list of open bugs,
intermittent autobuilder fails, etc. caused by the thing they rely on,
and see how that is taken.

2. Phase two: taking this feedback into account (also there might be
none!), the feature is dropped from the autobuilder test matrix, and
optionally relocated to its own layer. No maintainer is assigned to
that layer until someone steps up.

How long between phases one and two? At most, four yocto releases, so
that there's at most one LTS release occurring in that period,
complete with deprecation warnings that all LTS users will see.
Ideally, it should be just one yocto release.

What would I like to deprecate? I wrote that down, then realized it's
a highly flammable, explosive list, and each of those items should be
discussed separately, and only after we agree to the overall approach
without bikeshedding about individual items.

Thanks,
Alex

