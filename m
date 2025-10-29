Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C77CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:23:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.2886.1761729831073333963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 02:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqTmCUF6;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-427015003eeso6125187f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761729829; x=1762334629; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6pPZvOURjWkdNTATvcGvywS3mZcABm+1wBQvjmUuDo=;
        b=LqTmCUF6IlS/EX/5UpdzQ3yJulltHdNn2rBCdNj5Yg8u4LMZ0SfxhUDqU/MtG9/N7b
         tevmucsUwEpMh28G+i1jk2cE7CtBac4MsjqwjhXS1zIWSundF41Hb8DYHc5Ul1aP9FHv
         RfgxyinvNqDrlqek9B0Bby4UyRY+52O048GmBBukbSoYysyxe5/Arp6Bs+mhzMG/LmHE
         +lFcBcsa35wA6XjH6Qzyy5W2lvHcK++pHdkiyR880PhMYbyiT1uEX+HD5FZA9+iQQCm8
         UPK9unv10GrkTA9DukHPtjZaeLwTUmFmSm4cS26386UEukWsd06Ia9tSkxU5Hh6CYQfI
         LqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761729829; x=1762334629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6pPZvOURjWkdNTATvcGvywS3mZcABm+1wBQvjmUuDo=;
        b=OpJNEBrJSjvz9MmBWKfvRe4iPfGvL6dLk8mLEKiOngUo670hMrjxnrMncPlXJG0otX
         5aUMrQQ1KOBWDp1VV1qX4pL7zgxCugO2RucQgSzNsLvzZ/vR1kEN0mYxN3VANpHb9m6s
         F4d2kfSBwltarXjehVlOuZgbllOdAc2v33WeQV/CdogFdEXMspxU1i4Fp/fpyY2dRscX
         Iz0L+wSNyzLbpgDnFmUF+i0/MbJjNdKvX9MeXTE4KBCANRVYj9ovepDaAJnsOYxullbP
         uURsVcba2F6XkP8ovNNaxMrcrQ9yfFSK+aCqZ7lw4cy3s8DGQtYsyFezvmkY+i8XveJF
         LRMA==
X-Forwarded-Encrypted: i=1; AJvYcCUnP+OkZcDeAgq/Pa3D+IL81L6IawNxXU6I2c2hfa7QNoafDaOA3grcp5MJStcDjCvUvbsD3sAoWwtio6QgmfKVGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx11JrVIUPJ1hl63nTc1KeUDgR3mHeRB7hlMqonEo4IsJobb6bb
	pP1Pn1pkENV01zxvUi5UcZuLhQvAPFmFAE9mBY9OdYqnslTuLGaWnWQy
X-Gm-Gg: ASbGncsWwQaKTGHAjxpR2dCc8uWEQIG1INrgw1FOH0QW9b/tQWIicYGo37aXX1W877R
	Rb0Xye1SdWW9pUOehtDebvqcDCtc+hk8LELRyI4H/sfkYzyihgYawXBZrwTZm+1bkze9yyzr8e0
	LYXSTEoH1wiN7OOz+4vNFg21Ig+HJW80r6opnGg97yR0rPENu9u59dwm7EhkgvTUUfKQQK9P6tS
	cw8QIYuYhfeZrzexDuRM1jWuIwF0LdB5qSu0DeuUjUZlWHImOs+qUs2NY2Y1Uca1S03BigmWNWm
	QtfX+rO5q9ztdM8CLcFulZXmlZIQ2q20ycaSUQpmPUquDM/Z7W/KOuv8LqBBO+JVyIjmDpqLiWQ
	NXyuBTJGxsMwVZ5nHNy6HjB6qsyWtdTUwijUTE+1qaQZ/UMJ1UD+/pPt5AI6Ymg9qyHl/u9I5+9
	YJbN13Kziz
X-Google-Smtp-Source: AGHT+IFsA88Siy9nimhaP7veeIgwhJSqzCdb90CezG3X+9fk1TTRAsLQAUKjXy042s92zfOYSkqVyw==
X-Received: by 2002:a05:6000:2f85:b0:3ff:17ac:a34b with SMTP id ffacd0b85a97d-429aefc03f0mr1640113f8f.42.1761729829235;
        Wed, 29 Oct 2025 02:23:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771906714dsm38391475e9.13.2025.10.29.02.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:23:48 -0700 (PDT)
Message-ID: <2daec34c-5c29-4917-a817-27f21a1f65a2@gmail.com>
Date: Wed, 29 Oct 2025 10:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
To: pratik.farkase@est.tech,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
 <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
 <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225435

On 10/28/25 22:05, Pratik Farkase via lists.openembedded.org wrote:
> Hi Mathieu,
>
> I looked at both the Ptest logs you sent and seems like more tests are
> failing in the autobuilder than in my local QEMU test setup. The
> failures appear to be byte-level differences (e.g., “230 bytes vs 275
> bytes” for bug-147) rather than functional errors.
>
> https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-64-ptest/core-image-ptest-libxslt/
> <https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-64-ptest/core-image-ptest-libxslt/>
>
> For both qemuarm64 and qemux86-64 machines my local ptest-runner has
> the following output :
>
> For x86-64 : 
> root@qemux86-64:~# ptest-runner libxslt
> START: ptest-runner
> 2025-10-28T20:44
> BEGIN: /usr/lib/libxslt/ptest
> === Running libxslt ptests ===
> FAIL: ./bug-146.xsl (result mismatch)
> failed to stat ./bug-146.err
> FAIL: ./bug-146.xsl (error mismatch)
> ## Running REC2 tests
> ## Running REC tests
> ## Running REC tests (standalone)
> ## Running REC tests without dictionaries
> ## Running REC tests without dictionaries (standalone)
> ## Running general tests
> ## Running general tests without dictionaries
> ## Running encoding tests
> ## Running documents tests
> ## Running numbers tests
> ## Running keys tests
> ## Running namespaces tests
> ## Running extensions tests
> ## Running reports tests
> ## Running exslt common tests
> ## Running exslt date tests
> ## Running exslt dynamic tests
> ## Running exslt functions tests
> ## Running exslt math tests
> ## Running exslt saxon tests
> ## Running exslt sets tests
> ## Running exslt strings tests
> Total 746 tests, 1 errors
> === Finished libxslt ptests ===
> DURATION: 10
> END: /usr/lib/libxslt/ptest
> 2025-10-28T20:44
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> For arm64: 
> root@qemuarm64:~# ptest-runner libxslt
> START: ptest-runner
> 2025-10-28T20:54
> BEGIN: /usr/lib/libxslt/ptest
> === Running libxslt ptests ===
> Running .libs/runtest
> file ./bug-146.out is 217 bytes, result is 0 bytes
> Result for ./bug-146.xsl failed
> failed to stat ./bug-146.err
> Error for ./bug-146.xsl failed
> File ./bug-146.xsl generated an error
> ## Running REC2 tests
> ## Running REC tests
> ## Running REC tests (standalone)
> ## Running REC tests without dictionaries
> ## Running REC tests without dictionaries (standalone)
> ## Running general tests
> ## Running general tests without dictionaries
> ## Running encoding tests
> ## Running documents tests
> ## Running numbers tests
> ## Running keys tests
> ## Running namespaces tests
> ## Running extensions tests
> ## Running reports tests
> ## Running exslt common tests
> ## Running exslt date tests
> ## Running exslt dynamic tests
> ## Running exslt functions tests
> ## Running exslt math tests
> ## Running exslt saxon tests
> ## Running exslt sets tests
> ## Running exslt strings tests
> Total 746 tests, 1 errors
> FAIL: runtest returned 1
> FAIL: some libxslt tests failed
> Finished libxslt ptests
>
> ERROR: Exit status is 1
> DURATION: 9
> END: /usr/lib/libxslt/ptest
> 2025-10-28T20:54
> STOP: ptest-runner
> TOTAL: 1 FAIL: 1
> Any suggestions on how to proceed or debug further would be appreciated!

It can be reproduced with Mathieu's staging branch (apply your patch on
https://git.openembedded.org/openembedded-core-contrib repo's
mathieu/master-next branch). Not sure if it's due to the new kernel or
something else, haven't looked further.

As a somewhat offtopic, but still related thing:

I noticed the following construct in the run-ptest script:
RT_RET=${PIPESTATUS[0]:-0} || RT_RET=$?

In case the first statement fails, then RT_RET will be always 1. What's
the intention here? If the second part should be a fallback value from
the test execution, then you should store $? before this line, and
assign the stored value to RT_RET.

