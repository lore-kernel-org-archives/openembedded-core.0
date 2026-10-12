Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22E2CA9ED0
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 02:41:36 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7129.1791846278447881771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 16:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c5Uh2xqb;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: collin.funk1@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b8306b9f8so19183546d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 16:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791846277; x=1792451077; darn=lists.openembedded.org;
        h=content-type:mime-version:user-agent:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Li+RJoHRepK+lWSdIZPDwk9+H9/cWTZFwz+zqDuOP8g=;
        b=c5Uh2xqbHxPps7qYG0hZScX1lrgtdovpFjzlQEXQEf9GSvEteIbBsrzQsIznLh3jmz
         0PgWY+8ZLP8yV1nmEukwreq7mD5uSjmFWfPotTIndU3Fpe2bzMRg4hNF/wJYErrjfaFX
         dAujiU0mlhfwpQnDHMQeHvAgPSDzjRbNFSkYU+jZohnnQ2S5vcxco9XNI1GogAwZSviE
         oq02EPtnvBwfDybsTYlmc3AIzioP+TwdxOwq1wrIFIgafr8aBBC/PZ99DDzyjiqpW733
         O34SWKaJ/wdLoQ6TpYuNKymj9zfTIj1x8D2KCVf5nL80HTumfmp5KRjLzliEhdbh+wDG
         FWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846277; x=1792451077;
        h=content-type:mime-version:user-agent:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Li+RJoHRepK+lWSdIZPDwk9+H9/cWTZFwz+zqDuOP8g=;
        b=OsLN92Dy+S0CFqDUz5Jo4ZYWlsdp10N3lTPi6yaGlGr4NwnDYIbCe0jRFvwoILpcKf
         WZuXy9YoxdyAVFcKj0mtY2nI5q5l/yorEMDqphCm2xQe4NhAK8jSR+43tcdn1CJbKutX
         z+tkDlNlAEPHurZ4K+4UWvkBvGZEiHm9E1XoRw1tiokFeXDlGcvNwP4NPww3tHLnSsWL
         MT/kTLnwpnES4gV64/6F+sTIAcD+9MboSEwTvfUQIiXev17pnkP9Qv9Qs7+ExC9GzWGm
         +070gfSSOeSRIK42Rx24x2GCo8ZKTT5jAIe0FQgFSE54NmGsTCzrjeIB/Es/vonF1OQX
         T6GA==
X-Forwarded-Encrypted: i=1; AKwUvByp4qIT8/ReWeAryaLeTmOy8bHtM3tFVV1sVeHUbPX6VFMzHhfiOPNaFrhuGmeyKrgR5mUjNmNBRAbWCUjzpsrVPQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKLS8GpAA+T+wEMmzXhXzlF3spgO3dA/EqfpqOwWiqQGYxNtXQJ
	5OaivQzG2fCtM2oP0BfzoZZyhBk4R5+RvVll9TeRggP8PDlJ3/2kvLT2A139cS76
X-Gm-Gg: AYBFou2jUz39Ov9DeIO6xN3I+f7nTg8WiI6LnFKNlpe+1TDynSb/EgngnC4Nc40K0v7
	/6FNfYZKwsZ/dylsc57TzPBDAUXOXGmjyVZzvcSHokuGXQYJx1UfsY4ZAN0YlKUMZTjqBeztcng
	zRHb57TY4N+sPeDX4mju/4/PLr9AtZeObOUoPPcXMYuuUgZIOs9rFPLgaxpFPVTDd/H7swnHCoP
	hV0gjGlwvb8F6IPT9nlCbdJ9/34cQT3EQcA+MRopP9+mnfvxX0j/oKidiCHth67mwI//VU1g1EY
	NugMor8jv7G7qmVbSp9KDqX8ZVlgVj+qGmXHlqx+JmYye9Rgy41yJ+AXAZ9xCMPz8ZwHcEtf2VO
	qoSOnWKV+a0ugZ1V9L2cWwej9FfNtLFCIXz2LPPqFhJ+veVyudlfXlKvEwofMmXJlzcQ5NFZgLB
	FtxOYhKljUVMEU4yaTd+fQXQgyHZ3tlfRFVlu2E/JRO8QKDWYWAU8OEwXPd2pkyPvFFPHTiA8WL
	QNXrz/gcegT8mYxmbuYisjSFl/ShcK17UwpeEA7fg==
X-Received: by 2002:a05:7301:fc08:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3537ddd6633mr14208078eec.2.1791845924249;
        Mon, 12 Oct 2026 15:58:44 -0700 (PDT)
Received: from XTHCYRY1WD-Collin-Funk ([2601:646:8081:3770:811d:6e28:e9ad:7e11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3581f594a41sm28121643eec.23.2026.10.12.15.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 15:58:43 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] uutils-coreutils: move from meta-openembedded
In-Reply-To: <CAHUKmYZOUvohA9psyEiJ251a9mCnTteUDkdAVU1LEAAFC_PdZw@mail.gmail.com>
Date: Mon, 12 Oct 2026 15:58:42 -0700
Message-ID: <m11p9u4jbx.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 02:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247693

Etienne Cordonnier <ecordonnier@snap.com> said:

> - what is achieved by moving it to core is improving no-gplv3.inc for users
> who are not using gplv3 and still want full coreutils syntax support. It
> will also make it possible to add it to poky-altcfg.conf, and generally
> make it easier to consume without needing meta-openembedded.

That, of course, assumes none of the code is tainted after the attempted
cleanup in 0.12.0, which only came after multiple warnings from me. It
is difficult, speaking personally, for me to believe that the uutils
project has any respect at all for licensing.

>   - its adoption in Ubuntu 26.04 as default coreutils implementation and
> the resulting large-scale usage and bug-fixing

That is the positive side of things. The negative side is that there
were many FTBFS and multiple breakages of Ubuntu ISOs. E.g., one missing
a setuid bit on sudo. I highly doubt Canonical engineers enjoy dealing
with this. It seems to be a decision made by the company leadership. I
can't say for certain, though, since Canonical didn't reach out to me or
anyone else working on GNU coreutils, who could have warned them about
the easily foreseeable issues they faced.

>   - its >95% pass-rate of the GNU testing suite in release 0.0.12 (some
> tests are still skipped)

Note that the GNU coreutils test suite is good, in my biased opinion,
but it is not really meant to create a new, perfectly compatible
implementation to replace us. I have always found the use of these
percentages dubious, but I understand the need for some comparison.

> Also rust binaries are bigger than C binaries so there is some
> tradeoff involved. GNU coreutils 9.12 main package is 10.3MB big in my
> test build, compared to 13.6MB for the uutils-coreutils 0.0.12 main
> package (uutils-coreutils uses a multi-binary executable to save
> space, GNU coreutils doesn't).

This is a very unfair comparison. GNU coreutils has been able to be
built as a single binary since 2014 [1]. If there were a need for it in
meta-openembedded, I am sure it could be packaged relatively easily. Red
Hat uses it for their container images, for example:

    $ podman run --rm -it redhat/ubi10
    $ du --human-readable /bin/coreutils
    1.4M    /bin/coreutils

Collin

[1] https://github.com/coreutils/coreutils/commit/71e2ea773414b2316bbe6b803b9a52c38d3752e8

