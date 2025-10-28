Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1DBCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:12:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7182.1761642756229563549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XduFjELX;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b6d5b756284so1215013466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761642754; x=1762247554; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axo+HVorn6ZY0TN4Byz5M9wO26c9JWHv/red2pAx0vk=;
        b=XduFjELXbxuACErWsCPr2eIDf2wuw4c54G/nmV2NEpsNn7JXBCIIXWQH7ycssKsiW+
         8dTAFL0YABnmEQJOtReC4g91e3FJDeRSLKtWRKJFimc4TSo6CHeaUKLHTUvm/dwBXmgA
         0BYrGirZAPseHWLfSMSx/mATBVCB7Otw0mAltplwoH/sDL8X2xSgeYWzOPN/XHZFNYED
         nT0vWXSRFIW4vLDS5MQ4dyB1cw0hMdQyQSUp1tEbVsBnEr5juzFWREkLITwKK3IrEuYN
         PDArHWy3zeHhveR+TSc5+JzEz1VD7XOyC27J5JcusdwOlTH1tERcglkwt3sjdHYwky9n
         6qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761642754; x=1762247554;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Axo+HVorn6ZY0TN4Byz5M9wO26c9JWHv/red2pAx0vk=;
        b=IDFOZWYI/V/rqcBwby+EsqsOvCu/L5uU1Z+80Osb9Ub8R2DuZ/q4KwNNBUNQuNP5SH
         0REf5fOSppkmq588dfELhM2DiCtdYqMevn0hyBxz8lm6choqrlOOydtMS7GRHJsCIE8H
         7WlTpkiMlzPDki+HI5KlKmBK8l+aeHx/ad3+GXCjtJ7iUABT2wmz3ABwj1owpqikwPsB
         UNuq4XyY3rk2E70l3UoQlLrGIjjIP0ymGE3dzfxf9205I1pxMBlDWeWAM5nCKO1gBacG
         K8mFAUSatAnbPIqm+HqjRTBn2WWz05b2ZLo08uM1sZfZlEMTznps26+KLste9rN9IzI1
         m+cA==
X-Gm-Message-State: AOJu0YypwQ6p4lsBZcSlpmVGmJ3veRSrdBtjtfLWl6PK49V6D+b0pRuo
	3FrMKB35+II/n8nRxyhLdEMqAXGoy0Kl+jt+7rq6RcUds3yljfkPNvZmJqL5mw==
X-Gm-Gg: ASbGncsNXxvcYwZYqyAf96H9IByucKWtqF34uFOoxwcW6VNxz1ASQIRNBwuRqlZdLwN
	S61b1uIArJQTTw5vU4UJVvH1noQgikGQmuBI8GByCgAUxGFlLyxR/VwPGfsWRsDLLNUDMqJ0bTv
	ewbSMWT0oFnXs5uIk4Mw6zWTuqnJH/gqmld8dKMhby1umFUsQJPB81cihCyOk+0z5d0NDJs1NSo
	SFQ8D1sRWC5E1BdknxseUrFEGwOavPxx5c2RsiSYA+pVkLu3LlBbeqCK6vJJ2nO8e7Ka4ndNL5m
	qEHaFrXTrSKfPtEZrWcf9eZuym4kVhTTGv56IDR3GiOnqAuigQNUyhy5iwWNIOO5VizQdnD4BeZ
	Abzz+Ar+mJAojEJ6Bugr06D4mNlQsb6KA5fTfaukspHAiXdsvKR6ATi13fvXP5ajCV0d3804zf0
	5MH5Ov4Z4/IRa8VR4PRs2GokUXsIAyJL+OqA==
X-Google-Smtp-Source: AGHT+IHACTCR94pBWU7k9nc8YeSRD1e9wvDlA0aRkFKQufQFrOIQhyqZ8T3dt7Lot2v2K1fRvRI8yw==
X-Received: by 2002:a17:907:7254:b0:b2a:5fe5:87c7 with SMTP id a640c23a62f3a-b6dba447458mr341142066b.12.1761642754040;
        Tue, 28 Oct 2025 02:12:34 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85369697sm1068743766b.26.2025.10.28.02.12.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:12:33 -0700 (PDT)
Message-ID: <ce858ff9-c6ef-4dd2-a788-51eb4b4315a6@gmail.com>
Date: Tue, 28 Oct 2025 10:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: llvm-native is pulled into package builds that do not rely on it
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 09:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225383

Hi,

I am trying to make my meta-clang-revival layer compatible
with Yocto 5.3 that merged meta-clang and llvm is split off
into its own recipe.

Target recipes that use LLVM 14 or 15 (most notably, variants of
intel-compute-runtime and their dependencies) fail with
conflicting files being copied into recipe-sysroot-native,
like static libs from clang14-native and llvm-native, etc.

As far as I can tell, the issue occurs during packaging, after
compilation already succeeded. The dependency chain is correct,
otherwise the issue would occur during do_prepare_recipe_sysroot.

It seems that the python function "extend_recipe_sysroot" is re-run
for packaging. That's when it fails because llvm-native is pulled in,
because llvm-native conflicts with e.g. clang14-native.

Is it because I use signed rpm packaging?

rpm-sequoia-native, while it depends on rust-native, and as a
consequence, depends on llvm-native to build, requires neither to run.

How can I avoid this problem without switching to non-signed rpms?

Thanks in advance,
Zoltán Böszörményi


