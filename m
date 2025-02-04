Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E159C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 19:02:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.124612.1738695734077575184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 11:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HnHcNi3f;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dd1962a75bso45999896d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738695733; x=1739300533; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/9lSusghevNNdefFX5vkVulI1nnuckJ1GX10pKtWSI=;
        b=HnHcNi3f9QIDSIgPoapyhuZCuzBTg9t+AF42jKorIoMKcnlVEPte9n5dQY3pzaTs4Q
         hyEAxQs1s/xj+3Ob1YcSHlv3D7y8N/EiXP1ISPzz0JIo582ctfgZaJurK7ZskCKDp3JC
         P1MuQmbVR1J/wdnz//XeI6vloBlglsqtoIWCQcO8uRCA4lgky4gy0+8wuwy8rAKt62Lz
         A8HgDpJ+slm25e6mQpJ6UIyZOEGEh1f3ycm3hULZUmy+wI6r6v2Yr2w3UKNA+volTe4P
         7f1CXPCMUDLQSlVIL/ojyYqyoDADkNl7GfoSbM93TnssOEk0bF66e5E+rMIgy0q046Gj
         IR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695733; x=1739300533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/9lSusghevNNdefFX5vkVulI1nnuckJ1GX10pKtWSI=;
        b=Yt84ys+a8+oVtVqD2KqckQh1mfr20Ppq1bqW1xgpABH2Cffj0IKUO7+Hq9O1s0ITsB
         Mtks22cmrRPsupSESUbyxitK2yHd0+bf0bGMl/ncTahbjbKWLXZWZIIPor3GOfKV78rr
         r1Ul2vEH5P89yJDmCeZuQg7DZEtqpPvlale2YaUvP0fEt3boz8sLDMHu/0wVQUXEiPM8
         HnKaq/RqfdUblvLqhXU3yl3pvpy8ESZZ46OQYxEHV4aQCFlfgDGJjLqQ8yiawDwkxFZo
         /+NWEDpW980hiwwVIUfsN67DjZbzDOIARpwtnrZc9Rs1pEOVYPojD74SboRmM+KHZ6t/
         zC8g==
X-Gm-Message-State: AOJu0YwIMktidHzNJQ8OqOOGiBOiEJ/zRs9z5SGCs1lXjn6DNfZgxwc9
	xV0YSmwZnVxs5AyXEnlVfQPkYk37Zx+2R6Ca6HuC9jZRnVjf+959r7Y8UA2M7cFl9Vvc3bNsIJh
	VJFsK867SqxU4k6Xzi1FqhIY4otQ=
X-Gm-Gg: ASbGnctj6mVZQKB53Bzev+Iv7icZ/oYiHfrZazUnoAl5ltuVpW1p0glBGAimVEW+rqv
	FOFqmX/Dq6FQvi1koKNX1t/siV4mIiG/PWKj8CaetWciyGm+AYc6xdWe/nETGAJFNV/o238GF3W
	ZlxWhgwLCR/jXh/wge5Zo8JMYqVPcUnvk=
X-Google-Smtp-Source: AGHT+IFHqxdAePKvzeIwm7exSMeB4dzoieonmxes8onWgMM2n4/IweJk2QqjS02gDQ4gdu1uCjwjWL7EWHUUmEjwc4U=
X-Received: by 2002:ad4:551c:0:b0:6e4:2343:816e with SMTP id
 6a1803df08f44-6e4234382e7mr38663906d6.39.1738695732984; Tue, 04 Feb 2025
 11:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20250204103744.27883-1-othacehe@gnu.org> <CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
 <87y0ylga3d.fsf@gnu.org> <CANNYZj9tjKN_Evr3KR7mNDMABXAgbLoCFL=EnoQviXa4+Mg7Kw@mail.gmail.com>
 <87tt99g52h.fsf@gnu.org>
In-Reply-To: <87tt99g52h.fsf@gnu.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 20:02:01 +0100
X-Gm-Features: AWEUYZmhNz2zTJx_ac3I0zKER2d5I38dNjJ8SMUA3rxaGDmqaGULHUQRAOVbfTE
Message-ID: <CANNYZj8vYdZz4-NpYg2hCJ3d9xNvN-Ugrr0cRpKT3-k6j9+Wbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section support
To: Mathieu Othacehe <othacehe@gnu.org>
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 19:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210819

On Tue, 4 Feb 2025 at 15:25, Mathieu Othacehe <othacehe@gnu.org> wrote:

> So minidebuginfo and PACKAGE_KEEP_SECTIONS are two very different
> things, serving different purposes. Even though the combination of both
> is required on some architectures to get full backtraces, I don't think
> that they should be tied together.

Fair enough. What you say should be documented though, perhaps you
could revise your docs patch to include these things.

If you figure out how to test, that would be good as well. Ideally
without adding another image build to the test, but
adjusting/extending something that already exists.

Alex

