Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CC1CD13D3
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 12:53:17 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.4841.1725108792633941474
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 05:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=VFHp1nFX;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4568acc1ca8so10822051cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725108791; x=1725713591; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqF+kRBOJA6yXW7ppCTdvODgYVvQmCnw5mWNerpMt2w=;
        b=VFHp1nFXEN/Asb+ry0mgrTQk3RFEnkqXR0fHMUdfJ+hlFqmYIgF8KVAgYjxTP3IwGD
         L2rRuSSJ2r4AbuYwnNR7w2lBdS8axtgkxpTnI3HbRUr2yqK9CQdgeCnavTtJZWoGmwGo
         2a6vKRTt5r0iV2Fivmbhw91uji/81RM7oqpA5VMzLfL166vWpTyGBljU58xEZxoAyDze
         favrxksZe9DY3vSAjooDvIDqXBbEk0cPgh4BoYjfSF03vmi7VGY4l5NfoXSpQLkQpjnq
         GtCkEcLH5bVNjHohcuGCpva+SE+6/ODjrria205oObnP3CswyTST7EpTTU/yspG/XBrf
         A2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725108791; x=1725713591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqF+kRBOJA6yXW7ppCTdvODgYVvQmCnw5mWNerpMt2w=;
        b=vAlSZi15jOIczdERVavyZDu6gyQUYKhRRClftDY6PA5EGZoDd4irQ47V4D0POuId0T
         FpaTNkwDOo6wiyjFS2eGOLtsKw6QcsFz7KXw3x7MehVe+P4WjMKJWdQkEpao7+n+ZAMF
         EePYcqxeBk3dIzjT8q4lImtbAa8o4QI/jXOJprmwTQpqegPnARvYctokG0pFtFRv0j6P
         ddLt32WD4XG8RxHUfRRZDtSfymkYQBXrrCE8mJnnM4ishdPTyHL9/pNWfGSabI24p0a6
         3jK+LUk8P4t+JqSWk6ZLZuXVjTyUudwjIn6J3VlfqXNzs/pJr7awflYU7YNuFw0RNW4L
         ZQRg==
X-Gm-Message-State: AOJu0YxtqSFqoU4JbB22SkWCw+g6lTVtKzdc8A5gFZ5GdZUrTZdib+HW
	Zx3hwrDnyMcrfETq0o0HwnCNFJx0hB4iRGVsHdun+j3y4dpW5Pzie7aC96MRbfc+N54Zo2yOPWg
	8r2s=
X-Google-Smtp-Source: AGHT+IG5Df4RVjOwBx20rjlbq+5B6bUIY0hpYKxek5x7lttNZmCGhDZbWKURaSlUW/HSyCDyJNWxpw==
X-Received: by 2002:a05:622a:114d:b0:446:6282:b903 with SMTP id d75a77b69052e-456fd79918dmr35404471cf.25.1725108791195;
        Sat, 31 Aug 2024 05:53:11 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682d666a8sm23514121cf.73.2024.08.31.05.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 05:53:10 -0700 (PDT)
Message-ID: <b0f24aa3-c48b-4632-898e-b6290c0112ae@baylibre.com>
Date: Sat, 31 Aug 2024 08:53:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2] patchtest: test_mbox: remove duplicate regex
 definition
To: openembedded-core@lists.openembedded.org
References: <17F0AC85B0243D2F.4674@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <17F0AC85B0243D2F.4674@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 12:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203975


On 2024-08-30 9:39 p.m., Trevor Gamblin via lists.openembedded.org wrote:
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Not sure why it didn't occur to me last night, but this could just be 
squashed into the second patch. Can someone do that, or should I resend?
> ---
>   meta/lib/patchtest/tests/test_mbox.py | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
> index 0b623b7d17b..ae16c4bf934 100644
> --- a/meta/lib/patchtest/tests/test_mbox.py
> +++ b/meta/lib/patchtest/tests/test_mbox.py
> @@ -31,7 +31,6 @@ class TestMbox(base.Base):
>   
>       rexp_detect = pyparsing.Regex('\[\s?YOCTO.*\]')
>       rexp_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
> -    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
>       signoff_prog = parse_signed_off_by.signed_off_by
>       revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
>       maxlength = 90
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203971): https://lists.openembedded.org/g/openembedded-core/message/203971
> Mute This Topic: https://lists.openembedded.org/mt/108190190/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

