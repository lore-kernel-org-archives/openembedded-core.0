Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B4BC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 19:55:35 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.3221.1700855727194240121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 11:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LS6wNeZu;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7b3708b3eacso56667639f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 11:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700855726; x=1701460526; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pay5Oa+Q61tEKwgXLeO8MAIFQVpqjLlV8QIliKAY9rU=;
        b=LS6wNeZuZo1AbtcVQ92vOfFcb6Li3ZBcl4WTf+mL1G8/rdpjOflwtTDC7Q+Pbkg2mI
         LD5zTiC8YcgtvZ26lPDtKprGpcapWlDk341dEZO1XcvDDr4jPKNUE1F6tp3upfsD37iT
         l3qYJzjt7YXRb6dpr5xt/kPEhR7PbE/hCcK4NhGGv+RPTSrYK8L23z62kY6+xETdpuq4
         0Da0tJIIIWszlxn5hLvvBvedR35Bp5U8WwPhHKLEdlKuUj6BlxHCapBc7R3ypLJEERSl
         KtQX9hNxUD1ATXxp1h0U7nmOaaOhupsf2tHN2lBLoJl3tthntQ4UMQZdDdtJVjwRS+9d
         EKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700855726; x=1701460526;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pay5Oa+Q61tEKwgXLeO8MAIFQVpqjLlV8QIliKAY9rU=;
        b=OviHRhh/znp4dhi+b5q1SSe5xN+2ksNMZqGYlz+OsJ3CBgL4d2CFptZH1i24XCAJBo
         FAXJNgnXU5z9MfVh830ZeBiLjF5g0AeCKPtOIBdSkeYoAoHkF5133mjtUtRinhSVFK2L
         TxV7fB77f3oyvAeKLO2nYra9DGBcwRc7+EkBBoToKx5yHc87RldnpnspKuhEKGQVgFLF
         iK4FXbiMvCWZG2d6ZOHkWoNraM/GqEiwVvVC8novccyoyxsOiHW1Q51P3EgkQ0x5fxav
         DYLAafS5Lr8jYlAqHu9NFJPEZTkgKyWzlWJHVoqhvW9wi7yLLl374KBLp/j3Te6nfL11
         04yw==
X-Gm-Message-State: AOJu0Yw4k4hRWV6OOz1n4GKzeQ4xmT/EpXowfCtwozdYG9TwnWBrddqe
	92GvmbQlF6tcMuGntxqw+cU8EePQnNMND0vdZ8xE01Ky+8I=
X-Google-Smtp-Source: AGHT+IGSOZLkUhgCQdksWSrPwfbaA6bEYGUQPl5WjfqN1kCXQ2koC49FY7hg0eJctDgoGJZepfMP3Nc3PaKY6Sp02N4=
X-Received: by 2002:a6b:7e4d:0:b0:79d:8708:4d24 with SMTP id
 k13-20020a6b7e4d000000b0079d87084d24mr4511620ioq.15.1700855726242; Fri, 24
 Nov 2023 11:55:26 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 24 Nov 2023 19:55:13 +0000
Message-ID: <CAO5Uq5T_FnmZXVHsSj+JDJ=MOK1hvGqNEAjMy4NE-5XMYmNXtw@mail.gmail.com>
Subject: Rust and oe-selftest
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 19:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191216

I wanted to write down where I've got to in digging into the rust
oe-selftest failure... much of this is probably repeating things which
have already been said/are in the ticket
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275), but it
feels like it needs more discussion than ticketing...

As far as I can tell what we've tripped over (based on my reading of
the code), is that upstream rust only runs their test suite on
nightlies, not on releases and the test suite is now using features
that are only available in nightlies and are explicitly disabled in
releases (either through build time configuration, or run time
checks).

1.71.0 is where it all breaks, the changes which are introduced in
that extend the testing to cover the bootstrap process, which then
makes unpicking those changes all but impossible. I suspect we could
patch the build so that the run time checks which we trip over could
be bypassed, but it feels like that would move us to a long running
world of pain which is going to need people who really know what
they're doing with a rust codebase (which is definitely not me!)

We're now 4 releases behind on rust, with a couple of point releases
mixed into that. There's really only two ways forward I can see: find
someone to unpick this with upstream and make testing in release a
thing that they test, or drop the rust test suite from oe-selftest.

-- 
Alex Kiernan

