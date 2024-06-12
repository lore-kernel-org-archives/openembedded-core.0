Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0023C27C77
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 15:10:07 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.892.1718204998780677202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 08:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=g25ZWxlC;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7961fb2d1cfso242344285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718204998; x=1718809798; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrhZiFbGoFPyAN1YhawfKgjzul5Hp6NOv39prGcfz7M=;
        b=g25ZWxlCqY85ZsmwIdwc8nUgdZp7j3JqBvXnKGBwZG8un5iJH9oyDmeOy2thGGk8Gk
         qWuB62yGvWJJzhYFiWvx9Ym+Y/wvpgBqTd3eYIusjYSLkUmzghSTpEOK6ySHwxG02uyi
         OucB+3t1VP6odX9Z6rdvQne7HAJNGWchgV+9gjVy4Jp0R0uTqIFtg7xiECpBoO1yssYn
         o0qTZsesJj4hYpZBbOuflL8C157Bt4H3OWtKRQ/za69bd5zyt6dxlbGiSUoL/CpgWljB
         xqg3bTen4AkRBbNAzsWvrP5Skg0KGE1smyCMe5DwDedxi84k7IcGprofY62+1nLHlEKf
         ficw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204998; x=1718809798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrhZiFbGoFPyAN1YhawfKgjzul5Hp6NOv39prGcfz7M=;
        b=iHG+ifv88Ey/8aYIcmrPaBOx5HeZLaohhnoSUHpve6XGyd3TzpnEw+i32/CYhhFczT
         jX8MN8mILvPKECxg2gmDvYmx7gJ7J573iYZvd198mqCCIhUu3byURnZOsQ6AfwubefIL
         BXTIyhcO15Fwxbwiv/J/Ap8GBxUgC8I2D9DAepwQLf/75fyZ7oCFb9CVlTyM6kqLnS95
         js9zk4MBX0jibLIu9gwA0pQPd0Mw0wWd2bhPTXZ4/caA1EIb+wuZkF/3eCjSREpeoED8
         Drxaw/XaIEmdvB2Uc1jFsLsjBvlEg+IxreBXCiqvkkg6v7KdCqgGcA8og261Bo8Pp8Ue
         szTQ==
X-Gm-Message-State: AOJu0YwSEwr8MQFUc+gWOWSLCOrOU6D3i5ScrDiFZ0rB64SmHQRObuia
	GVJ6ETZyaZmBB+PiJNeorrSTce87EX0LWHHmUtIR0PMoUkFE7740Hk1156SlRDtB/IumPX8VFHP
	jK54=
X-Google-Smtp-Source: AGHT+IGH4gDasWxcZsSaJPm5wtZdwJOypJp5kruKe06FWx0nj8Kn31SwnLUv8/iaRsmOK/KzF7qYDg==
X-Received: by 2002:a05:620a:28c2:b0:795:5546:5d7d with SMTP id af79cd13be357-797f613012bmr219877485a.17.1718204997600;
        Wed, 12 Jun 2024 08:09:57 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7954cb6c81esm464332485a.0.2024.06.12.08.09.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:09:57 -0700 (PDT)
Message-ID: <9962354a-e69a-4167-805b-b831bad5cbf0@baylibre.com>
Date: Wed, 12 Jun 2024 11:09:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: skip
 test_concurrent_futures/test_deadlock
To: openembedded-core@lists.openembedded.org
References: <20240612150528.173057-1-tgamblin@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240612150528.173057-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 15:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200576


On 2024-06-12 11:05 a.m., Trevor Gamblin wrote:
> These tests are causing hangs on the Autobuilder, so disable them for
> now.

Note that this was submitted for the 3.12.4 patch sent recently, so 
it'll need to go on master-next with that.

>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   ...-test_deadlock-skip-problematic-test.patch | 30 +++++++++++++++++++
>   .../recipes-devtools/python/python3_3.12.4.bb |  1 +
>   2 files changed, 31 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
> new file mode 100644
> index 0000000000..f0a7cfd39b
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
> @@ -0,0 +1,30 @@
> +From d7e3f26e7094fbe20e2271d75f18ac3b23a67f58 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 12 Jun 2024 10:29:03 -0400
> +Subject: [PATCH] test_deadlock: skip problematic test
> +
> +This test hangs frequently when run on the Autobuilder. Disable it in
> +testing until the cause can be determined.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + Lib/test/test_concurrent_futures/test_deadlock.py | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/test/test_concurrent_futures/test_deadlock.py
> +index 1db4cd0099..fd07895a17 100644
> +--- a/Lib/test/test_concurrent_futures/test_deadlock.py
> ++++ b/Lib/test/test_concurrent_futures/test_deadlock.py
> +@@ -90,6 +90,7 @@ def __reduce__(self):
> +         return _raise_error_ignore_stderr, (UnpicklingError, )
> +
> +
> ++@unittest.skip("skipping problematic test")
> + class ExecutorDeadlockTest:
> +     TIMEOUT = support.LONG_TIMEOUT
> +
> +--
> +2.45.2
> +
> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
> index 49c134fc7c..64cd5d0bc0 100644
> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
> @@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>              file://0001-test_storlines-skip-due-to-load-variability.patch \
>              file://0001-test_shutdown-skip-problematic-test.patch \
>              file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
> +	   file://0001-test_deadlock-skip-problematic-test.patch \
>              "
>   
>   SRC_URI:append:class-native = " \

