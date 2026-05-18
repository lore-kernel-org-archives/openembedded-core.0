Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D46CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:22:57 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5381.1779099771138629470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZVKVUK/+;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-90d2acb9936so223926585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779099770; cv=none;
        d=google.com; s=arc-20240605;
        b=FYfb92GHjR8GvN2WyPdDt2oiAkRA0gkKarqQGZLkPkeqCbZj/JdiSvIE2H5RqmY4qy
         74O1nKocWVCtwgyUtA8wnwYT/5ymvm2vvHQ5aRhj2bndUsO+EwMri1wUfOz/169daun7
         L/qytmMRcSndXG3JnQkBdAbss44ERplcametJfqcFVsHeriupnv7IOKXR1MS1wfN3mwF
         P5VkvqKIDZDIWJmc0QcFn0pNUyl2i1ig8bYo/n0yHtMuQdym4iPT7LRpcZXXh2XKUiZY
         GGT8BHzvqX1L0jvJP3R+EEnJEERAF5rV7zgOlOY2s3pV10fKKBQVuRmY16YRnZcDOHMh
         dtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7eX4pD5D+Tdwjmvn18j6VLnUk3uD56hfMyFqwMpULQ=;
        fh=cTGglx9R68T1vXQoC8ZOlG2XL/Dvb4T2Xn1+piJgKQo=;
        b=RLvOXlfM6UJp6nM3fbeVRxgM72uRTckAdMQEILVa/gHI0rkNhdD8rTPtpgUYkhcwN+
         E7GmfLMr/Q8Uup4HHEfNYcSWrXP7463igaPwQI4roO/Z7tommC/hvBJAe0h03o8BKSmt
         nbEDX1ScB7lLJRlEP8K07AQpLOYR5d8ii/Pt7Q3RFpSNPw0+5UHhB7qy3LKySktdBcao
         iCudDiz455FiyplsNLoT+4irFVpI/LBC+9oYmhMvU+eKhFvtLNkZ9gmZQBb1axg4/lHp
         MYqeaUIZc5w8QGhQ7XwopET02+LSYowaVdRcP47PLHsENnpqZw5uRsQKS9MfdmoxJHaa
         w6oA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099770; x=1779704570; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7eX4pD5D+Tdwjmvn18j6VLnUk3uD56hfMyFqwMpULQ=;
        b=ZVKVUK/+Z2qAIu9dw3yV+eG0n/ilEX7JCuOiRkXy6UGI5Be55Mp/KInHl40/iVntXE
         nQc8XVwsu1DkyNzKrFMJ/pnrlmVRC3RjyzhNn61Nmn0k/ruXk8MsME2rRMKCyVSvcTMg
         449aO1IQM7+Z73MgeGStGsWfWrdPyuKdzuz0nsTtyprtPXDNbYQkojhVH5tQ7ovwgIRY
         q+axTqwtqMSnnhFpsyJJBdjZ3MeUVMyznCWZDWYkUvhhMBFph0HMekRZwPpJc5oDAZ1Y
         dXIOaHEvBIaet8SOfGgIykh1xz/t389NQPy0/mf71Otppzm9sOCWtED5UMQjIqRl5bQg
         2k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099770; x=1779704570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7eX4pD5D+Tdwjmvn18j6VLnUk3uD56hfMyFqwMpULQ=;
        b=FqaEE7cjT/6Z4yt7VfvkAsfPrxXv+xLHpx0GqFjAPDdPwH4n8NO+XpRcv4TyifsOsb
         dS87Diy44ejbWlVfuOuta54z0b4qiXeIoH4y8Bx1UNbHPvcVmKeOpxvKiRq57ttMHIqJ
         zLBabAz9gKf5dmQpOVzDrwnUSVaLKJLoipBGNwjjqgi7/j+9Rca3qu+KZHfFTOxuXZeL
         /67iUBm+MIVM4JGNFCie5uLHD/Odp9TAKNZnoW3o++JNH6CPvywGdXYXCt5hBT492d1Y
         xFSJ/rj+EXH6t7vmdn0ICpzLa5TIftNmTacu1+1uxMdO/6FOYzZdEhqb04eQBJ/7y71q
         TqWg==
X-Forwarded-Encrypted: i=1; AFNElJ83S841Zsk3ixKt+ba4nLNQHS1ERklICi9IvXqOE8VCkt4f76Dl55oDrKue0IukIvCoLFFRBz7drdrZXxBwWNHA0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdNxaNOh0JZakFmfhekL2iONLFugtpBVUCh62MugXw8sa/kAT1
	mOYdYCaFem5TyHOKYJWutPv5tOqh0e5IdQG4DSsN8+6AESOfrZozhhXjooti5YyYa3CXHgmYLju
	ez2+hmzU96GBucDRAUAgo74mP4aLvxRU=
X-Gm-Gg: Acq92OEG6x+MEfdgp4Fp3K/3CSqbqTyLmhp4SsSsrsuAc0WAIqtkLpfcCOs9XlUwWIS
	75Z0KTR72SoBhSLAiNnl9ER34JaQ3hVGGhsSnKOc/Y76UEhtK97OP5FrP+LfJQtIQmsDelDAHJS
	q6Mus02K3DiSzaiTjSNeU5Cpzv90QSW5fooZLX8FA/eHUSd6q0O3ArGCxqcmPTuVPjBMp2JkSWi
	AER+qN5Q6bYToCngKLhJ7hk6Z5JK2q8LY38W5I8M5eBvXqt0csuAuzYngo1RugCoO67uRIHkP2h
	kHGkTGbTLP7bnB0RobzndeeAft9qM4oTa7q9cFvIPgwj0M48jdIYCZ7ISWtsfns=
X-Received: by 2002:a05:620a:aa06:b0:911:ddfd:634a with SMTP id
 af79cd13be357-911ddfd6552mr1938061085a.4.1779099770004; Mon, 18 May 2026
 03:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260515024119.4192524-1-changqing.li@windriver.com> <1b05833208339033ec4ae244d71d1391b4fe42cd.camel@pbarker.dev>
In-Reply-To: <1b05833208339033ec4ae244d71d1391b4fe42cd.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 May 2026 12:22:40 +0200
X-Gm-Features: AVHnY4JIF3zFDDXaxr4Tu0DLBIgT-8KEm9zx_OWFHvA_WRjDQli5k__YnIJOtVk
Message-ID: <CANNYZj-pCF3r5PMPO+f-O2KNc=iwc74Nxg3jHmNY5L1RLOEkPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cgo-helloworld: init add
To: paul@pbarker.dev
Cc: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237211

On Mon, 18 May 2026 at 09:18, Paul Barker via lists.openembedded.org
<paul=pbarker.dev@lists.openembedded.org> wrote:

> Please could you add a selftest case which checks that this recipe can
> be built? I think this should be added in the existing file
> meta/lib/oeqa/selftest/cases/gotoolchain.py.

I don't think this is necessary. The recipe is for the purpose of
testing cgo reproducibility, and this is covered by the world build in
the reproducible selftest.

It does however complement go-helloworld, and so places which use that
should be amended to include cgo-helloworld:
meta/lib/oeqa/runtime/cases/go.py
meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb

Alex

