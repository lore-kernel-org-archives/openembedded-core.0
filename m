Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1C2CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 12:46:32 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.11513.1756903582948803572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 05:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JzNtjUd3;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-722d5d8fa11so6587956d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756903582; x=1757508382; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6QL9ngL6bEWRVQ1f9W8yA3qYApflm2Ug+VvGSFiiCT4=;
        b=JzNtjUd3AxrbJKOeXTp+3hyXM/fGLCM1HssjR5phKqWAMbSi5dd5yzlZm5ZYG+p10b
         +YYP597PCSwRmr1OUj1eqfmqQAgHwrEMKvoYex3VPMzy6Sf2zVuSX2r1pQ1jL0+AvOcW
         LNdStLcgxGJBl3jTzRKJZF8lMRSwlJmxObW3O0jD37/8dqfEvkH61PS0n+ZRP/+cy78l
         WKoTN3is14s8DSb39qkGiPl6VTSUHseype6jputivgwdSUNwMmVBFyMlS5YbjwNCvun6
         89VMkz7CFAm0jQJz/F/mMmD5D1GLA42D9ZsAm+F7DhfWyek/1uOIe2o8oXKVHu+bIp+E
         minA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756903582; x=1757508382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QL9ngL6bEWRVQ1f9W8yA3qYApflm2Ug+VvGSFiiCT4=;
        b=HXseldL38Tp9cCxNW+U1RfM6y72yiK2iOrCTLgQnoVAspMz1xNINeHhY/ATgkZJpcF
         riVSqpzFev1Hog0025I19FQpp9dlGVyEMIPm7cAYPk7IzoMQ5Z/U4TRQD7gr/K4jWOa6
         TYadIb57aP5Fa4LBcunTbGeR5rnQjEjJXOd66yOXvV0P9BTnhNcpSOwIiSHVcz8xXy2Q
         JAIjYSHonsmGl4uLsuyYpUO/q4IC88aRn2Py0k7MZ+8otSSFsusguJn5CI8zEq13QXFf
         VsOKEXVEY3Ly7oQ0bV9iBLcPspEn115bTXXrPo1V4lbV+QiUXecEKX9IlF5xuGqd2KAN
         DmeA==
X-Gm-Message-State: AOJu0YwuZiDFvGiXgRIPNUomjO6VQpprWsNdeYjTNcN1ybHErC8S9WEA
	n2lcXJHjfN9UeEcyTGzMVvho4aDYflIVscpoea4wt8IRopWDxy9CDigaliLV2bv+2Z+z/4qVhyc
	B7vzM5CxDR6cbIBrcY045ffAueglOjjE=
X-Gm-Gg: ASbGnctIjhslJzrxujE/GKk99Opf0DgzaVYwnBZoTZ/UFEn1gzjCNl7CTplhWwGM9BE
	ubruY3S3WGFZR+FKIFefXAh9X0TdQfeHgRDESaHBaJVZrkaDHpcLFaU+ct0CXhuXj0ps495i7dN
	3cX59Ssgj5fsagd1HWFH4LAW/y/MwyNPPuF9zgh/kDqQBjeB1+8jBov/v4ljZULrE/9dY8a+dec
	Lqs5Oal5UFZFxGb+OqBlTg6X9VHGp3gw8JsmJoRjSUaXIY33YD7YPC+TikK1NMkByh7Ivu9MmNx
	NvtCu4Tl3rI0Z2a9RqiATZkFJ8hiAL5y/A0O962v
X-Google-Smtp-Source: AGHT+IHj2nfehJcLlhMzz0M9Wc/naZJWrmAfKG0yoNnK5aRwuhT/g4lz0aWkR5as9mefSoq+Syb8nmMtzlXmhR4WKxc=
X-Received: by 2002:a05:6214:489:b0:70d:f76c:b218 with SMTP id
 6a1803df08f44-70fac898eaemr163643586d6.31.1756903581875; Wed, 03 Sep 2025
 05:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250827222051.367093-1-a-christidis@ti.com> <CANNYZj9E1JB2tdWMUL_fz_rjyACSyw9pDAsJDQH4eJtEUC3c5Q@mail.gmail.com>
 <9316e8d2-0ee9-49b6-b645-1c7db8a21df9@ti.com>
In-Reply-To: <9316e8d2-0ee9-49b6-b645-1c7db8a21df9@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Sep 2025 14:46:10 +0200
X-Gm-Features: Ac12FXxfOFICVZpojJvrPMWoB3ZLrq-TTj2vuygrddzHDWkjh3v50mr0GsxYCNc
Message-ID: <CANNYZj9-kQEjc_3BiZK2PaFkimKNVmw4Nijdt9oeV7szE-iQcg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [OE-core] [master][PATCH] libsdl2: Add tests
 package and ptest support
To: Antonios Christidis <a-christidis@ti.com>
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 12:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222858

On Tue, 2 Sept 2025 at 17:20, Antonios Christidis <a-christidis@ti.com> wrote:

> Moreover, having the tests in a separate package allows users to easily
> include them in their filesystem without having to rebuild the entire
> package with |DISTRO_FEATURES| including |ptest|. This is particularly
> important since rebuilding with |ptest| enabled in my experience can
> cause a significant increase in build time, as it often triggers the
> rebuild of basic package dependencies.

You can enable ptests per-recipe by setting PTEST_ENABLED = "1" for
that particular recipe only (via bbappend or distro config).

> I do agree with the placement of tests being non-standard, do you have
> any suggestions on elsewhere to place them ? Aside from
> |/usr/lib/libsdl2/ptest/tests| .

Once again, if you want to install the tests, and upstream does not
currently install them, then you need to write a patch for sdl
upstream that does it and get it accepted. Otherwise, what this change
is doing (installing the tests ad hoc) is entirely non-standard and
deviates from what upstream expects, and as such the tests would
belong only in ptest package, but not in the test package.
Openembedded, as a rule, does not cherry-pick items from the build
tree in do_install because they might be useful to someone, with ptest
the only exception.

> > This should stay as PACKAGECONFIG, and be enabled subject to ptest in
> > DISTRO_FEATURES.
>
> Looking over other packages that have ptest support, they often
> automatically build tests without the need for setting PACKAGECONFIGS.

This lengthens the build times and increases disk usage, and is
wasteful if the tests aren't actually installed and packaged. Other
recipes aren't always perfect, or they build components that do not
have a way to disable tests.

Alex

