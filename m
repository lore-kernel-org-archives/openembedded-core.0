Return-Path: <mbullock@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E4DC3065C
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 17:00:50 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.29786.1719939646964968255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 10:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=YYyfe+ph;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.208.43, mailfrom: mbullock@thegoodpenguin.co.uk)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso2253848a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1719939645; x=1720544445; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SQJSuEmVXK9ObjFk9kcZXWcEdtfpnjCASaEaY3UveoA=;
        b=YYyfe+phSNDDVDoNsIFWP1rEGeJpbMO/Id+3WWPe5irNmrjqBHeTltO1xTTG99u4BV
         r7hfR5XA3S6CY3T4OQjBI9kiou+QEXjx/7/JLw6HWkluO/kxl8oShOY4rneI/Ts6HHF+
         vMCLHGwLt4LvfHSx3XnvlySEDjp9TNdhu/4IcSnZcGNPLamfotS7D9zqExsff2m+Ykja
         MkPNWdzr9ZwLTYzpO0JlMdwm6tuFVHYuynzJy8VVBog05ngicpcDccNzJdxYLfjfMw6H
         d3r+o3uloKBQcuTQ4VRamMxK3rf4p87SUvTsWvYC4QRc5MCgbv0WC2aW8J8i7FYiH2wg
         B1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719939645; x=1720544445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQJSuEmVXK9ObjFk9kcZXWcEdtfpnjCASaEaY3UveoA=;
        b=KMfduC4kB4NZVtVlInTEzxLf2rpAgYKu4HvkRfk9lDHtGkYu0rn/tKAodxZeBN2uTT
         DrLazpn1OhRMmvBK7xgUrr4D4KIcuwGoOpV4+p+YN0X3NuTN0BcmtQvSCXmrJFb9MRe0
         kFwXfkRhMQeJUoFgPceTgsKG3Of55SIKcPGjj8U7Q88MKSKoVNSFGAQb7oB+QkGG3M7d
         +U/ZQg7JfNZKky8L3FNwXN8q4tHMtqSELKFjhFaCzbjeKWduoTi5iIN7v9P0P18Kt4f0
         p/+lkijtOAt77a9eES7KYGLOoZHrQNvuW/0StWHkbf0ZEifKloSybfEOi7nCLWbPgL38
         kqdg==
X-Gm-Message-State: AOJu0YyDYm5rQEZE7FzVRghJIZjV6Rvct2dz47eIp02YZfRDEV5aubsS
	7qOt4VG8dvR0FCmufImw8siXdog31hfWaq/STAxUckuJXXSL1H3m2T783LrZ847JrV/c0M1WwZB
	cjKYC2Mm/8LfniK/I8gnNu0jXkWsGlXPXbEMKbA==
X-Google-Smtp-Source: AGHT+IE8oQp8IupreulGs7LX6nLp+b4TlAIRaWcK4b5+ZZwAcUY7K/bnH8Pmxua4tEp3zi3eplfxu0R0N14sWPgAWEA=
X-Received: by 2002:a17:906:6a24:b0:a6f:49bc:e857 with SMTP id
 a640c23a62f3a-a751441f018mr752786566b.6.1719939645266; Tue, 02 Jul 2024
 10:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240702163336.75537-2-jose.quaresma@foundries.io>
In-Reply-To: <20240702163336.75537-2-jose.quaresma@foundries.io>
From: Matthew Bullock <mbullock@thegoodpenguin.co.uk>
Date: Tue, 2 Jul 2024 18:00:34 +0100
Message-ID: <CAL5uAqzSdk6cpDOfM7KpUr94h5QLNbD0-a1CdjJBDX_aNVXYkA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] openssh: fix CVE-2024-6387
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 17:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201438

On Tue, 2 Jul 2024 at 17:34, Jose Quaresma via lists.openembedded.org
<quaresma.jose=gmail.com@lists.openembedded.org> wrote:
>
> sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
> Race condition resulting in potential remote code execution.
> A race condition in sshd(8) could allow remote code execution as root on non-OpenBSD systems.
> This attack could be prevented by disabling the login grace timeout (LoginGraceTime=0 in sshd_config)
> though this makes denial-of service against sshd(8) considerably easier.
> For more information, please refer to the release notes [1] and the
> report from the Qualys Security Advisory Team [2] who discovered the bug.

Wouldn't it be better to use the much cleaner fix from openssh-portable:
https://github.com/openssh/openssh-portable/commit/b00331402fe5c60d577f3ffcc35e49286cdc6b47

I realise that most of the distros seem to have copied the same early
patch but I assume that was to get the fix done prior to public
exposure. As there's a proper fix isn't that better?

Matthew

