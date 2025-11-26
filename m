Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330DAD11180
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 15:39:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15851.1764171591539455736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 07:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Tb49sMAD;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477563e28a3so7355465e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 07:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764171590; x=1764776390; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhk6sciQASFUmVApbmZdGFLvYp/QBMJ2vGHO2BUjWKE=;
        b=Tb49sMADaKoXKWOBxee51nxeuZ+RPM0LtmTGXkDER7r26EfWRK6unP99CakmpT6Ek5
         HSsHTfmIeh4SYqrgJbRTqRQ+1OyOsdbQ1STO+2zbgP2Tc9naxg7VvbEmOBGW/w8oSTt0
         ozKygegxHrVHYjBSucZy4wVsWEzoedIT9UA4s7PlgOBk+Od0UC4K+zbuQpVeKAJXtbkJ
         wnlnBIDTz+8ybvKGAihtKxz9ouFA4HGL6p6qWQ8m46zCwKClRvTG0EH8cIiwEaY326i0
         C8ScWY3llw5RJoBBeFfdJcqN+WWVLgbLk45qVaJlz/tlSrfUK5lSV1MyzJxv1FDRPmEu
         IRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171590; x=1764776390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhk6sciQASFUmVApbmZdGFLvYp/QBMJ2vGHO2BUjWKE=;
        b=B7tRW+TpE2zP0ds+7Ol2K7GMi0c0RDukEErFzXN6YvsTQOfkQJup+vhXjaJ3YSd/LB
         0LLesnxLBQoQbSUrHtfZv8bKjv86zW8TFmn7Um4AFICmj7/uDbqgLobnd9Nb1UQXx/4P
         u/91RRSw50sPxB0fCHPZ1NhtXpoQjQf1vKAVnaCBbQvfzDscsxGSOqHB3srWwK6C6IV3
         CA8i41mZrf/voJd6HhQXakKHSilhiAN0TDgZ6tXHMwkEt7DP7kebU/Lh5cU0d+iTYk1T
         sgSgEivt6jzi3XQZ1FIjsCZqCyUBvvWTVdrTHqcgnl3qbfdms6NG444opUGZP6epjlPO
         Je1w==
X-Gm-Message-State: AOJu0YyzcOvipDiu132oFwtDgCYeL6ZcI/hJt0RLjrgT1Xv3CM3Uw3Gm
	CTXSTnAsCdaQvM2Ad4DiH1sJQKGRLXSlBYeK4RUhdJs/9c6jiJqXUAcDl6mCA+a12dA=
X-Gm-Gg: ASbGncuZa9hW9i2UhWyTfRjYj26bPNDTRizIDXssq0xi72F/63o1EPuP+c5e49vebrb
	QWY5cIwPXqRa3XIKFoRb2eM8Rn6nIL1DLjpPrIX3DWfwpgypMHc3NOWnn3oTmM17PpLMhlSsvyi
	K0b9RP/gKX28up6G4ZO4EitaKNKCwUFpHjhKIVZkpZqV0yx6Ucz8lp3h/PFX75AffGMvirHGk7X
	wMNIOsFRKA4f2406ocMuND34DrhNqg23dCWW4+LQALP3gJ3epaWLODUqu81yvU36ZCj870XmdI5
	wGDOsv49dASfc7Q5kJmAxZR/8kP8mdpgeHRXRrpOZ6aLh+MfEuODt2t+YPWp2KjndHeqEc148SJ
	5DMByw7V21I0Up8QRUsK5aqs193HkOAP5CmUVpU5yTBcP9r/4dspZhSqazQOcO2aw0nxYTEj0zP
	7nXqXYvULTuYIB6uMsdpmRigin+m4b1QzVgKOEdexYRRew381oVa354HUU20Ld8vBY
X-Google-Smtp-Source: AGHT+IFnHv6tgQQqRmwCbmkyPlWbyeA+ykm+/+Ugys9WnoMb4kIc4EJG4gA/hzZiTFmtvOv9j5L0Sw==
X-Received: by 2002:a05:600c:3549:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-477c053069fmr197965155e9.14.1764171589688;
        Wed, 26 Nov 2025 07:39:49 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:84f2:c6ad:afd9:6725? ([2001:1970:3847:e000:84f2:c6ad:afd9:6725])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc186sm46383525e9.13.2025.11.26.07.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:39:49 -0800 (PST)
Message-ID: <d58c8ad9-d8ec-49da-8b16-7e23a257439e@baylibre.com>
Date: Wed, 26 Nov 2025 10:39:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][RFC][PATCH 0/1] python3: upgrade 3.13.9 -> 3.14.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251029202250.270947-1-tgamblin@baylibre.com>
 <CANNYZj9MYVok8co-aRX8qpN2h2YE7woCPZvMfrxwioPz1rD9Jg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9MYVok8co-aRX8qpN2h2YE7woCPZvMfrxwioPz1rD9Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 15:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226803


On 2025-10-30 08:57, Alexander Kanavin wrote:
> On Wed, 29 Oct 2025 at 21:22, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> This is a fairly significant upgrade, so I'd like to request some feedback from
>> others in the community, especially on the new test skips and _sysconfig_vars
>> reproducibility solutions to see if anyone has better ideas. I've included some
>> justification in each patch based on what I found during my investigation.
> Thanks for working on this! It's good to have several people (and not
> just me) who can handle major python updates.
>
>> I'm also having a couple of issues with testing that maybe someone can identify
>> the problem with. In particular, the python3 ptests, reproducibility, and
>> buildall-qemu results seem OK when I test, but when I try to build ptest images
>> for recipes that depend on the python3-stringold package, such as
>> core-image-ptest-python3-license-expression, I see errors like:
>>
>> |ERROR: python3-unittest-automake-output-0.3-r0 do_package: QA Issue: python3-unittest-automake-output: Files/directories were installed but not shipped in any package:
> ...
>> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__init__.py
> I don't think it's to do with stringold. Rather,
> python3targetconfig.bbclass no longer does what it's supposed to
> (which is trick native python into reporting target configuration).
> You can reproduce for example by building target rpm, and then, from
> its $WORKDIR:
>
> with python 3.13
> alex@Zen2:/srv/storage/alex/yocto/build-64/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1$
> PYTHONPATH=./recipe-sysroot/usr/lib/python-sysconfigdata
> _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> ./recipe-sysroot-native/usr/bin/python3-native/python3 -c "import
> sysconfig;print(sysconfig.get_path('platlib'))"
> /usr/lib/python3.13/site-packages
>
> with python 3.14
> alex@Zen2:/srv/storage/alex/yocto/build-64/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1$
> PYTHONPATH=./recipe-sysroot/usr/lib/python-sysconfigdata
> _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> ./recipe-sysroot-native/usr/bin/python3-native/python3 -c "import
> sysconfig;print(sysconfig.get_path('platlib'))"
> /srv/storage/alex/yocto/build-64/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages
>
> What is supposed to happen is native python should read
> ./recipe-sysroot/usr/lib/python-sysconfigdata/_sysconfigdata.py with
> these tweaks and use that to report the directory values. So either
> the file no longer has correct values, or sysconfig has been somehow
> refactored to calculate the paths in some other way.
>
> I have to stop for now, but yes, cross building python is horrible.
It looks like we should be using the build-details.json file that is 
generated with 3.14.0 and on, as per: https://peps.python.org/pep-0739/

I'm going to try and figure out how to stitch that into the recipe soon.
>
>>   ...1-test_cmd-skip-bang-completion-test.patch |   31 +
>>   ...-test_unix_console.test_cursor_back_.patch |   46 +
> These two new patches should also include an upstream ticket links
> that report the issues probably.
>
> Alex

