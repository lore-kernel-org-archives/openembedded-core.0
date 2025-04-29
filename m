Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE49C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 16:37:34 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.3008.1745944645757338224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 09:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=aL/BpaZ5;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c53b9d66fdso982819185a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745944644; x=1746549444; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQ28mwZJqIsXMcAvLuKiUJFnRqeipYLG72+oN4Fb34c=;
        b=aL/BpaZ54MwRqvaLGsTW8CLrYUMQ6wykyj7GKuTv3t9fAiilnLWZsmY1652DTiBW+l
         fpAmaHUwowlxA3Et5+g+5NkB5i6jxY1YXQVCalkmY5jS/6FGHc8SqyKI1bwi8YmGDdGA
         eAMHV3cIOqHCqzVqcU7zAS0lXLSdY0F0dqqyELj9b062zFNKh1EV6/7L2tg/vlDTsprh
         bgRAotmtTR/QceaYwDDBGZznxyxBnwED+z4WYGX8TPuWepDDIbIXATgjmKXVw2MsznCX
         QF9zuLGQq4TQS22qObkgkyEwUtADv+ZpW47lY+Ry7OnrrR95HzfqjUCnjK9ODsXcaPuQ
         o6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944644; x=1746549444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ28mwZJqIsXMcAvLuKiUJFnRqeipYLG72+oN4Fb34c=;
        b=JEWsxKL2mO0OCJapBTRyRGbNDLiCtLRurZpmQafquZNrdRgf7Pp59ZTkG+AHUrSTUe
         x07YdkKhs0+SFUJeBmUR2eDz6LZHnBH4418k7P1Q2kbKy/6lKXp9y+MiyKy/ZwCosRVK
         krWcSZbBuowl/U7vbV4KfyQR4wzHUAamuaFJXefou+9WvqD9VlN24UfyWgXm4dMRSEZg
         9Xvd/+9znZlY+zb12vBBXOTI4ftt4BbuTqjYBc+guTsGS3rVpuaH+S56A9ncmL5SutlT
         X1b1/zrXAu64OWuUbEbnLDtKILyljOd9VtSDbcmGIQgH/iuSVBxSELJy1QrAPg5a8OpL
         TSvw==
X-Gm-Message-State: AOJu0YxsufG+/wjN8NQxImF1WhBS1SeoMCWVQuDwj00VKKgFo1w3DGF5
	9eUaJwaFESQ+CcUvfOzorMY1bsKi3t64KlsbSzKFOQXl5rRJdysPNhtbWc9cy5M=
X-Gm-Gg: ASbGnct+e4xwLTb3ncgeGSMzoSSKkTp+1Z8ZJmV7wR+Xx3KSkRCiynYe2AUhXWxJ+KY
	fixChtjJZnBMJtLN4x3byOUabhF+DH3ENPHFSMWPUVRcaLRhdj6KMpnHxT7auM+6Q/ZfiV++6Gi
	G4PTUCiWdP0FyTbhbJ2PQPC61MTIxQz6lnMHyzmZpVZvQV01nYODGR/DNzwvCsskblCrY6qx2Bc
	NJJe5hWXS4NQs5V8YvxgrY2uphhisQkzoNapNIQ/jY8h+WVI2EFrj6yZH85gGX1O1QNZ8BAeNqi
	PzQd5BKiqoCRzwF/QYJWO0SC4Lcqy/bzUkHCJaZ8AQlx3XxGxA1QgYO/97mE9mfA/GqyHTntiMS
	GDRawTD8l
X-Google-Smtp-Source: AGHT+IFrSbf19pVQnBl5QJfV0q84JAy5srqnApJXuZvsIQAZFKZfxvEuBqrsn+s1JBUAOQsZBuFqcw==
X-Received: by 2002:a05:620a:40c4:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7c9668c27eamr2755842585a.36.1745944644408;
        Tue, 29 Apr 2025 09:37:24 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cadafdsm752197585a.26.2025.04.29.09.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:37:23 -0700 (PDT)
Message-ID: <86ff4eef-dfd8-433a-b8c1-e27960112a53@baylibre.com>
Date: Tue, 29 Apr 2025 12:37:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2 v4] python3-numpy: fix ptests
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250428174416.379821-1-tgamblin@baylibre.com>
 <20250428174416.379821-3-tgamblin@baylibre.com>
 <DFBD12CD-630F-4D62-9655-1F262813F9E6@arm.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <DFBD12CD-630F-4D62-9655-1F262813F9E6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 16:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215682


On 2025-04-29 08:56, Ross Burton wrote:
> On 28 Apr 2025, at 18:44, Trevor Gamblin via lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org> wrote:
>> - Add gcc and meson as ptest RDEPENDS in the recipe;
> Personally I’d prefer to skip a few tests than pull in GCC and Meson…
>
>> +@@ -205,6 +205,7 @@ def roundtrip(self, *args, **kwargs):
>> +                 self.arr_reloaded.fid.close()
>> +                 os.remove(self.arr_reloaded.fid.name)
>> +
>> ++    @pytest.mark.skip(reason="Requires a large amount of space")
>> +     @pytest.mark.skipif(IS_PYPY, reason="Hangs on PyPy")
>> +     @pytest.mark.skipif(not IS_64BIT, reason="Needs 64bit platform")
>> +     @pytest.mark.slow
> How many tests are marked as slow, and how slow is this test suite in total? Just skipping the slow tests is an option instead of carrying a patch forever.

It looks like adding `-m "not slow"` to the pytest invocation results in 
2815 tests being omitted.

slow tests in:

Testsuite summary
# TOTAL: 51510
# PASS: 47301
# SKIP: 4171
# XFAIL: 33
# FAIL: 0
# XPASS: 5
# ERROR: 0

without:

Testsuite summary
# TOTAL: 48695
# PASS: 44851
# SKIP: 3807
# XFAIL: 32
# FAIL: 0
# XPASS: 5
# ERROR: 0

If I drop both gcc and meson from RDEPENDS while trying to skip slow 
tests, the ptest script fails after reporting 30 errors.

If I drop just gcc, it runs but still generates 9 errors.

I can remove those nine from the output by skipping the test_mem_policy 
test.

Dropping meson looks like a different story - that "30 errors" thing 
that I mentioned above comes from 30 different test
modules (each containing various numbers of test cases) failing to find 
meson when they begin setup. I'm not sure if we
want to try disabling all of those...

>
>> +TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
>> +export PYTEST_DEBUG_TEMPROOT="$TEMPROOT"
>> +mkdir -p "$TEMPROOT"
>> +pytest --automake /usr/lib/python3.*/site-packages/numpy
>> +rm -rf "$TEMPROOT"
> Why two variables?
Good point - another case of me leaving stuff in from early versions of 
the script...
>
> Ross

