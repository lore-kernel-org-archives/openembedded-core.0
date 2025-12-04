Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2249BD24469
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:10:58 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50382.1764871848261251515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=l/nqf96t;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee2014c228so8464081cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871846; x=1765476646; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PVp4jryaXPOSOR3QPkA6PecD65GkL0b/iQY9MAJNmY=;
        b=l/nqf96tsG8gUROIhR7YwtQP7qC8KeRXpqA9RyDOvDXOM+77JEVSvdjYK3mFcfFV4X
         DIcsVUlUsnhYiZr6vE9ZTyp1ZMbZzD7VG5tTs5elLuCmpaBTlTjmJgMGzNwB418jYAjr
         lE+iZp/aYj7RopppRe4hAiLdyjnrhryw7XgUi6caSIiKOzWNibQjmyFNtMYd8cl/qVxB
         PFLZmcSZhr6ns+NVj09jJycw5wke01pIuUZrKHWHDYUtJjEK6CkmNKce3nJbPm/DaLHY
         yQxNcGxZu3JOkiS1FadyOOcNUIZ6hrqbubsN21h3dnXa/9CwEgmQd+r7adNePuaQmkwx
         c7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871846; x=1765476646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PVp4jryaXPOSOR3QPkA6PecD65GkL0b/iQY9MAJNmY=;
        b=o6Z9gylFqXARtY/yvBULRvsIEsLdCs6hvWXysuuQiNWGKcnjbbyGlhdXq2guYm3SU9
         E0kE5G/kgXR2OeUQaJFYXLz8OFUVQ/0yqVjCYhrn6iHiw/p8zgfEJBMr3ekKlqGsIZaM
         tq2Dg6b61nawf3sO7sx9anHDOtgEWj3bsqh8av+J343PmSCr6y070ey1UqSfOeldpoW8
         v9hxnWbaR2h6XM864WdjTkWcLnrWQCqxXcSI6C/iV+IY4WvQl4S7e3WJafeWe6cAnhYC
         IiBSC65p+YwqavRF8QzQ3LRPWgUjWYp1WhK+a+q7uL0kCuFpVR7KkTbSXJqbjoh3JB97
         uo4Q==
X-Gm-Message-State: AOJu0YzRBCxgSy67gnm9UOHpCYt8+f0faBP5obU2mwh1mo/df4pCILsB
	Wo/YFgua8zbRNUbhXc4amJHfwJATRmo6JBI1gNQBdtxcUKTp2dntJm0ZaE50s48Vh7mraW2Fbe5
	DPnR4xq0=
X-Gm-Gg: ASbGncta8je/mrLDZCfJ9c+h/2FoxXpiDn2lyDzaSHr56EGLJJxh5AG8EWXqEuHLrI4
	6EqBLm6WPD7fB6Hmm0C8e5XXQ7msG81Q5c/YDN+F3ivMOom+wrlJ8913useu0PZUlwjb2uMiRRp
	fEEjgXqtt7KF/SfuqKlmtDMSvKczQaml2zB6MQgXxPsiLlmLJrJQ2gRgjZWk73IuBd1fKkLw7UY
	kTMoo+BTpIMw9LOyzA1tddn2aheiwDA/8u49Hp88ch+3lq0vKlhw9vMtmLePncCfHVnMtFaj4wr
	COLEs5INgqJLkG4GjV6ebwBfFYzV5hl0zyev7Zi1NmlBNBJu1cElvzDN2W7jFnMOaNttzpPus0+
	1Jeiy8aNXR/w01XUWcwQGfxvwGnuIRQr9bFAQp0kXYYzRz2KpHVIAKupIeUzdMvT8kA/90NBv9t
	b6xjuzeggSi2K5fTaUTqf2t3mdJNF1zByVm0FDZF8n/5+/tsHbTKMc+9mOeAwQgceL
X-Google-Smtp-Source: AGHT+IGHdEAaub7EEFOFDNa25m7i8z3jn5ZqADn3O5wYXmCJFeb+mxjGNg6kh16e7V7I9wHkef1YSg==
X-Received: by 2002:ac8:5755:0:b0:4ee:4a3a:bd19 with SMTP id d75a77b69052e-4f023acf024mr60004561cf.75.1764871846219;
        Thu, 04 Dec 2025 10:10:46 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:84f2:c6ad:afd9:6725? ([2001:1970:3847:e000:84f2:c6ad:afd9:6725])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0276b060asm13185881cf.10.2025.12.04.10.10.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 10:10:45 -0800 (PST)
Message-ID: <309d2964-7331-4070-b0f8-b03ae7573ebc@baylibre.com>
Date: Thu, 4 Dec 2025 13:10:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 0/6] python3: upgrade to 3.14.0
To: openembedded-core@lists.openembedded.org
References: <187E157B47D3970A.489296@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <187E157B47D3970A.489296@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227322

please disregard this first incomplete series - mail server timed out. 
I've resent the whole thing.

On 2025-12-04 13:08, Trevor Gamblin via lists.openembedded.org wrote:
> Here goes the first attempt at upgrading the python3 recipe to 3.14.0. This will
> likely break some stuff, so it'd be good to start testing it early before
> Wrynose begins the build phase. You can see the specific commits for more
> details, but I will note that in addition to the buildall-qemu, reproducibility,
> and ptest checks I've reported in the python3 upgrade patch itself, I've also
> done the following on my build machine (F43):
>
> - bitbake core-image-ptest-all (which is how I found the problems fixed by the
>    bcrypt, jsonpointer, and pytest changes);
> - bitbake -k world (which IIRC is where I found the rpm issue).
>
> Trevor Gamblin (6):
>    python3: upgrade 3.13.9 -> 3.14.0
>    python_pep517: add --prefix to nativepython3 call
>    python3-bcrypt: upgrade 4.3.0 -> 5.0.0
>    rpm: handle CMake Python paths in do_configure
>    python3-pytest: add python3-misc to RDEPENDS
>    python3-jsonpointer: add python3-misc to RDEPENDS
>
>   meta/classes-recipe/python3-dir.bbclass       |    2 +-
>   meta/classes-recipe/python_pep517.bbclass     |    2 +-
>   .../python/python3-bcrypt-crates.inc          |   90 +-
>   ...crypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} |    2 +-
>   .../python/python3-jsonpointer_3.0.0.bb       |    1 +
>   .../python/python3-pytest_8.4.2.bb            |    1 +
>   ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
>   ...-use-prefix-value-from-build-configu.patch |   35 +-
>   ...sts-due-to-load-variability-on-YP-AB.patch |   37 +-
>   ...ctive_children-skip-problematic-test.patch |   17 +-
>   ...1-test_cmd-skip-bang-completion-test.patch |   31 +
>   ...-test_unix_console.test_cursor_back_.patch |   46 +
>   ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
>   .../python/python3/python3-manifest.json      |    3 +-
>   .../{python3_3.13.9.bb => python3_3.14.0.bb}  |   20 +-
>   meta/recipes-devtools/rpm/rpm_4.20.1.bb       |    5 +
>   16 files changed, 248 insertions(+), 1528 deletions(-)
>   rename meta/recipes-devtools/python/{python3-bcrypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} (86%)
>   delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
>   rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.14.0.bb} (95%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227310): https://lists.openembedded.org/g/openembedded-core/message/227310
> Mute This Topic: https://lists.openembedded.org/mt/116616536/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

