Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957D3C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 14:31:30 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.16458.1738247483331006182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 06:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vvgwPbvT;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e54bd61e793so1387036276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 06:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738247482; x=1738852282; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yw7H7R92RRojidTCso8Ey7Q44TuO5BIAYggxQLtY1tw=;
        b=vvgwPbvTne4ORwTQXtDDKRIPXNS2oP6XybRAZt6702OVWPwQ5Z74HkTEVo+JIM9XFp
         w/rMk/YqWvQQbPtD376OzuDIOvOXYE5RARKD3JXXv/OAZhIWCTUCYmCa6k/LYOZdKS4C
         OyKY6CoH4phWQ9t0xtJNspEiKtk3fe17XSxNlMa1OuJqqPCoLELoUVoZ+qgbmQ2nSiG7
         uwDG+c6EX6CBPrtVK3d/ylo7L5k7E8Sn14AUqC85nz/gjzKRp+7vzHhUVNiFaO5wrldV
         ets7XNH80Vj6a/aclXAx0apqMUDXrYQUnZ9vnjLqwLpmNgRWrN+iZuPTGK8Z7ODzYnqR
         pRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247482; x=1738852282;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yw7H7R92RRojidTCso8Ey7Q44TuO5BIAYggxQLtY1tw=;
        b=qJr4mvke9R+mTUwruDdT94rIX07V+Ty5vEg5ZO9FsdS/dfnWwk8Lj9/P+meKjgI1Cv
         KZTtebaZpHDnRzZ4BvX+m+8y4Lf8jUVP1YPdDW2vEm5BXxoIOSqMm5Xy9Nx91SdcPx3q
         nre/GZQhtTfxt/k65JEtztVPOqNhee8Lb7XF3zT0ePtvfb0XYHWulLFXYN6cXUhdc2Cq
         MEOkRrgxnCSom1fHwuALPDIb53cBYoP9oI8IGy+oxOriNiSs1FwVLYK0QgNjQVCzOGB2
         EQjaYosY6yCVjimApWo5NXhqocpTcBf7z55y+B3OqIQlKI2troiQazSisgMlOE1rddSS
         X1hg==
X-Gm-Message-State: AOJu0YwMGMWfRr+t4FC82+aZnyUUhyJHgBV+7dZUrnTJgsYBBNiBrn0w
	n/+7UuJJc6qmu8DRa4wfO3T9yLcmqpayHVb1R9FH034pI3TxhDH1iUyXAJOzphVCjGNxQLtwUJ9
	RjJ+Z1kc8R1ofYryg3s8jOqkh+qSUb58Bm9CNOsMpoOYHr2JyRYqhyQ==
X-Gm-Gg: ASbGncugPMoPTZLwoL6r1O46yOY56LpL0x1kaSl2cjQ0r653NqVmgvWk5DZKKaKX2mh
	bnrY8JluR+/yRwfoRRPxO1MT8qND63nMuJeCq7NLQU4DM4nsfTviAd9rkDJbrMo+GYCWlDH+r
X-Google-Smtp-Source: AGHT+IHjxyNpMxMxFkTPyxcKDiFEDXPlTmdGPuv3pOCNanq8xVEb34cyP1r2Jm1SFDk4FGZq07VBxdvLxqogcPeyHzI=
X-Received: by 2002:a05:690c:368d:b0:6ef:7036:3b57 with SMTP id
 00721157ae682-6f7a8409d4dmr54633807b3.28.1738247482278; Thu, 30 Jan 2025
 06:31:22 -0800 (PST)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 30 Jan 2025 06:31:11 -0800
X-Gm-Features: AWEUYZk4RaKFr91fd_em0srS-CDXDHQEdFfubcKXegBZIHm4cGQwgxvfVrK8bqk
Message-ID: <CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
Subject: Request for discussion: Kernel version for LTS releases
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 14:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210447

As you may be aware, the support period for Linux kernel LTS releases
has changed to two years. This presents a challenge for our Yocto LTS
releases, which have 4 year support periods.

In light of this, Richard sent an email to the Yocto architecture list
in January of 2024 outlining the project's plans for kernel support in
future LTS releases (copied below)

TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will
backport the then current LTS kernel version and make it the default
kernel version. The linux-libc-headers version would remain at the
released version.

At a recent Yocto Project Technical Team Meeting there was some
discussion around the growing kernel CVE counts in the stable
branches:

kirkstone: 552
scarthgap: 225

For comparison the master branch CVE count for the kernel is 18

The suggestion was made that we do this kernel version update sooner
rather than later, and also include the Kirkstone LTS branch in order
to deal with its large number of CVEs.  The original plan was to only
do this version bump for Scarthgap, so this would be a change to the
plan of record.

Please consider the above and respond to this email with any thoughts
or concerns you may have about implementing this version bump in both
LTS branches in the coming weeks.

Thanks!

Steve


Full text of Richard's email:

The project is aware that the kernel versions that ship in our next LTS
in April will likely not have support for the full lifetime of our LTS
(four years). We've been asked a few questions about this so we wanted
to write down what our plan is.

Our intent is to support the versions we ship with for as long as is
practical. If they become end of life around the mid point of the LTS
as expected, our plan is to backport a current LTS kernel at that time
into the release and make it the default, leaving the older recipes
there for anyone who still needs to use them. It would be based on the
kernel in one of our future releases, as appropriate.

The linux-libc-headers version would remain at the released version.
This is used to control the features in the toolchain/userspace and
there is no need to upgrade this to work with a newer kernel version.
Upgrading it would potentially change the toolchain and userspace
functionality and this is not desirable in the LTS. To be clear, this
does mean bleeding edge features in the newer kernel may not be
available but that is desirable in the context of the purpose of the
LTS.

The only reason the headers version would change would be to address a
security issue in the toolchain or kernel/userspace interface.

Since we don't know what the upstream kernel will do, or when exactly,
it is hard to make a definitive plan beyond this.

We appreciate this isn't our usual policy of "no upgrades", however if
everyone knows this is the plan from the start, we believe that is
different and everyone can plan accordingly, hence wanting to make this
clear now.

Since the project is planning to execute the full QA process against
this new version, it is putting a plan in place to switch from the
start and it plans not to test against any other version beyond that
point, it makes most sense to directly integrate the changes rather
than the mix in layer approach which is there for unplanned changes.

To be clear, we may also update this plan if/as things develop in the
other dependent ecosystems such as kernel as we can't know what will
happen in these on the timescales involved.

Cheers,

Richard
(on behalf of the Yocto Project TSC, LTS and kernel maintainers)

