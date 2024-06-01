Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01098C25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 10:28:05 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.34837.1717237677492112573
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 03:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDfsQoWq;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ea9386cde0so21365971fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717237676; x=1717842476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ILbLKjGWnmJoOuWtyrY1hkYzXVrHKSApPGH2ZO6Jn7w=;
        b=JDfsQoWqOK20SemQ4h9MD88XCtfCjkHYlmCxYGJ9nX18SRlsYxkuKd8zeXxWXQlM0E
         gzwaaj0RQNnkP8tz87FeUbTZKLrn99mmZZ84A1t7QF827dGdIOc0PLIp6rkqgHpXr2UN
         LkQrewzjUfEKIdF3TFOFVH1jDEeM29rLMqw9+vOFyQt0PNFIqAzOBqLQ+yFlgxYlsIMX
         S4++gDYcMjNvR6DqvVmySAn6MCRouOkxY2sd2yVDVGr6qE9nKOPzph8ciC4QIokAn0bm
         k/A77oggLIALKSWUdwN6TuCNnAr6QGxjhcOGYgNl2Jp16mUX6OtAWD32GLLfWoZHrRSH
         c7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717237676; x=1717842476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILbLKjGWnmJoOuWtyrY1hkYzXVrHKSApPGH2ZO6Jn7w=;
        b=pwZo6HZS8Cgg7o3eBNlsnyRVJvShbgHBmXzkPLrwLhrtGmp4ELG8JyqSo1X2hOzjJO
         iw7+XQuZcqBF6u4TSshO0u+EXx2k/iybpRIdk5b6Dn27f5A9URIe740JM2WT/jeJIBjH
         3S39pZUExrgE5IENYMeDn0LSeORUeE5hRGqOmbY1lSubXBZrDG6tGw81Aq0ieuRx7pKz
         oVHgr8QeXH2wxeZZCWVU7NYOsNpxS+e2Ue+jksRT4H01uW8syaXhSD7mgicd1wY0t/Uv
         oEM7ps/Qcr+y2cXo5agFnNFgcbMS2a/PgU8sNZ2XqBjvfttcr78AcqmpMQ4LRo4ni3Y7
         mTyw==
X-Gm-Message-State: AOJu0YzoOwDZ9ZKwbT5wvLAYbUO5x8TsYTMKq5OOkn8Oxl6bfFQqBpvP
	AqceLEDa6OgPHhjy3FiOxOkVUV5YCwO+0E4WT/N243rJKTu0PlRRZi47Z9QMCPXa9m78XkNVzTG
	v0b15v/ltPz9cgAD6TvkV555H4/w=
X-Google-Smtp-Source: AGHT+IE59oRI2UlK1Q6tq1/bVIWiu2/14+gY2v8LKvT6LcZQ7AY/mycTfJ7HFUjnIZJPfoF+uRbQHaMd3U7UjhRodXA=
X-Received: by 2002:a2e:9f14:0:b0:2ea:83b5:40cf with SMTP id
 38308e7fff4ca-2ea950c8010mr24238271fa.3.1717237675238; Sat, 01 Jun 2024
 03:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <2e75c6169cac05273b3edde52ea820506ce9d3fe.camel@linuxfoundation.org>
In-Reply-To: <2e75c6169cac05273b3edde52ea820506ce9d3fe.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 1 Jun 2024 12:27:44 +0200
Message-ID: <CANNYZj_LwCwmX+aKDDEYijMLuEehiUDJbMKcFvwtpM_rQAcxhA@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash" <Yash.Shinde@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 10:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200095

On Fri, 31 May 2024 at 15:28, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> I've been asked what the reproducibility issue is and what data we
> have. I ran a couple of test builds on the current autobuilder and the
> test cluster. I added in the diff at the end of this email, just to
> limit the test to what we're interested in.
>
> The test on the new test cluster passed:
>
> https://valkyrie.yoctoproject.org/#/builders/37/builds/36
>
> However the build on the current autobuilder did not:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4876
>
> and the different binaries generated are here:
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240531-l872m0ip/packages/
>
> We need to get to the bottom of why these are different and the test is
> sometimes failing. Any help appreciated!
>
> It is unclear what we need to do to reproduce the issue on demand.

One possible lead is in the original attempt to fix this;
https://git.yoctoproject.org/poky/commit/?id=321aebfa281bd28e368c684ece57867f6bd0cbe7

It is not yet clear if disabling PGO makes things reproducible, as the
same commit also prevented the non reproducible binary (rustdoc) from
being installed (with the demangler line).

PGO as the culprit should be either confirmed, or ruled out first.

If PGO indeed helps then the next step is figure out how to disable
(or tweak) it in a way that doesn't cause issues with chromium:

https://git.yoctoproject.org/poky/commit/?id=694b85a217209787fe8c503a4b697dc6c2bfbe84

Alex

