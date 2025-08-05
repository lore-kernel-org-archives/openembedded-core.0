Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F58C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 09:03:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.17685.1754384579476696099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TutOzKVE;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af9180a11bcso1118474066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754384578; x=1754989378; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWrCTyHmnku17FHN7dkVSBYB7wjxhshd0albAAaOsLw=;
        b=TutOzKVEqX+vniLYi4WVNMTwCiEgo2rdxSDKE40KXBb9zeKRTPhVaqDnJO33N7TaU6
         wcU4vTgcB7xY6dpakHO4DAAwGMZ5M6YwVFKTNa/wkhMHikv8GRKXYAB5aUTjJrOOhJtd
         qXb9oYIZ8DPdeZ/McC0wj/lUSHswmXiuvmkTQ6DhFE9a7nMoNY1gwbFA2TVza+6xHc1Y
         07miNX08u1iX8aA/ZJ9AtLpbDrTroFE4BAqgTe3FWO5RbeJfUqWSyBEgErZwNdVS8qaS
         ANBm1/mzctK0dpOQm3ZXIX6pqqXicxI8cIAAqGYqIVMA+Bktk54CyyrvfZNRTJ1NE5pk
         xUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754384578; x=1754989378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWrCTyHmnku17FHN7dkVSBYB7wjxhshd0albAAaOsLw=;
        b=sXk1JcCFac0VkR6KBc7niL8aH5zYu4axPUYbDzy7k/aO6KHXNsXKWpLeJ/03RlSHZi
         Zz0lNCcXVDpHquoNv98YjfF78FYdg2fB8Hw6wEvQgpw9kXmTPLjmX2gUjzEjg9M/wl6p
         HhoJpuJH1pAu0D66A1ozo25t0xv1xR20pEfdXHLVnPz/Smsr3k02S2rXotLf6ZrG52jI
         K1p2s5s5eATohwDDxK9LIYah73RAK1Df9t2RTazkIAdxGIp9Vs+L2F6TADj9eP++QMwi
         uHdVPnkIxFcKxN0pVnad1R4psk7CGe6hwaMf/U4WMRqTBkeNYV/TIAOFQIsYtEPlAEyp
         WarQ==
X-Gm-Message-State: AOJu0Yz7EIHUAL7smvEj808WQIoaOnSAjHGo2miWZvSIRdS2SvAR5a4A
	iG5v8MWpoxyfGX+zHQYbPTYHLRDoln35SvwmSTGwjwNj5ZlfkJVY+PEu
X-Gm-Gg: ASbGncvbQKs4zP/vHa79jjUWnZt/sPs0LTUOR9Wn00KcvCl6PszguvvVnP+Mh/av4Ax
	uJnyr6MZgBXtz9sopqoi8Qg3RSsCTZShs7hxhA2HDUL35WgRLkpsxoIiZaD+F+Odu7rLTTS3eNp
	u2Xthx5RQog0dlXh0lo/HAkdrKaGnXGHP/l7xsQLPJJlTjWflKLySrC94xHRL/inv5qkJ369vLH
	KFij/rbv/moOMHH8NhKn0V9Y+hg4ZBBHgSncfqlLSiNzSPHlF9cfkp5RPoyUR5K0ibyT6fwmXJ+
	3edwYEU7SAscn+8+2zfyZRcAdtPkjRopAtFBk+YC+4XjtP9t1DDWWwALj/wdLT63ZSzLIxSxNBH
	50l442TcfkWCBY5qS0pWBXNVPRBRNBw==
X-Google-Smtp-Source: AGHT+IHrkHX/DHSunMO6CUmlUpqyRFhZ693pV9K7g3rW7gNNNKOfw4agNu66wfsaCn+2EWWal7T7fw==
X-Received: by 2002:a17:907:e895:b0:af9:6d09:74ab with SMTP id a640c23a62f3a-af97d588a71mr285791166b.25.1754384577492;
        Tue, 05 Aug 2025 02:02:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07670bsm882078066b.8.2025.08.05.02.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 02:02:56 -0700 (PDT)
Message-ID: <97a3cb4a-d573-42d9-b6f0-a0d57a00fc67@gmail.com>
Date: Tue, 5 Aug 2025 11:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] librsvg: add ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250805063925.771875-1-skandigraun@gmail.com>
 <20250805063925.771875-2-skandigraun@gmail.com>
 <CANNYZj9zXWjmUkrP_hVVQtAZbWp9mZVUsVQ7CWbH4UxjD50ZxQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj9zXWjmUkrP_hVVQtAZbWp9mZVUsVQ7CWbH4UxjD50ZxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 09:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221466

On 8/5/25 10:43, Alexander Kanavin wrote:
> On Tue, 5 Aug 2025 at 08:39, Gyorgy Sarvari via lists.openembedded.org
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> +do_install_ptest(){
>> +       install -d  ${D}${PTEST_PATH}/tests/bin \
>> +                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/api \
>> +                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions \
>> +                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading
>> +
>> +       install ${B}/librsvg-c/tests-c/api ${D}${PTEST_PATH}/tests/bin/
>> +       install ${S}/rsvg/tests/fixtures/api/* ${D}${PTEST_PATH}/rsvg/tests/fixtures/api/
>> +
>> +       install ${S}/rsvg/tests/fixtures/dimensions/bug608102.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
>> +       install ${S}/rsvg/tests/fixtures/dimensions/bug612951.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
>> +       install ${S}/rsvg/tests/fixtures/dimensions/bug614018.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
>> +       install ${S}/rsvg/tests/fixtures/dimensions/sub-rect-no-unit.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
>> +       install ${S}/rsvg/tests/fixtures/dimensions/bug521-with-viewbox.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
>> +       install ${S}/rsvg/tests/fixtures/dimensions/bug823-position-sub.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
>> +
>> +       install ${S}/rsvg/tests/fixtures/loading/bar.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
>> +       install ${S}/rsvg/tests/fixtures/loading/gnome-cool.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
>> +       install ${S}/rsvg/tests/fixtures/loading/gnome-cool.svgz ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
>> +}
> Cherry-picking particular files from tests/ is prone to regressions
> (for example if new tests are added, they won't be installed). Is it
> possible to just install all of ${S}/rsvg/tests/ ?

I think this shouldn't be a problem. Will include that in v2, at least.

> Better yet, add a patch to install tests to upstream. Gnome components
> are generally doing that already, and there are examples (e.g.
> installed_tests option in glib or gstreamer that is used by respective
> recipes).
I have take a look at this during the day. Looking at what the gstreamer
patches do, it looks doable - will take a stab at it, and see if I can
make it get anywhere.

> Alex


