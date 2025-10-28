Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8330CCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 18:05:50 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.16219.1761674746271217161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 11:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Hrrm50Oj;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-791fd6bffbaso79247326d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761674745; x=1762279545; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wQPpcxv39DXr6mD9mvZBPLYDzGh+XoAN0PybXmvrJT4=;
        b=Hrrm50OjxZC6TPFxTfdHqe4E71L1mTjCwRWaqTpr4i+fvhZJ5Eb358SwM8ztC5VI+h
         3cmUTJxFE9o0u1tOrcEfY9Fo55BGKzK+cQD5+HSDWGwiunisUuxQlhCqSSggyf7ouGib
         eHaWv+yQQb10pp/RgFpjLsR2Wi7yqrA3VkUd1AOsBHkRkFMekDjuhXTmw2ZOzQokM7/H
         dgFwpwrboROgyrI0gzs+/AJI9+p8y9WZ9MRtfFBv9yrNe/+FRwfNpvW6X8INtP//8XJA
         LIhY3+zie3yLEhY/W4fxxNxKXNr2KJmkT5ByM1BRggqREBFCqZu19e+m6f/icoGqMF4K
         O9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674745; x=1762279545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQPpcxv39DXr6mD9mvZBPLYDzGh+XoAN0PybXmvrJT4=;
        b=AU+H6xFqwA/5LJKIGQ5NyjtoegaW92kyjYWvppTdSka3ODHbZSQT2nrOuePAGeeEuU
         aUFpqonpM53XDFkJjYyKbgWzXXKq11xMaeposgbJdYtx/RCKzKRggWidDjUwWVWHB7w9
         sjiE2vfKVsBV4+M5UZlSZbKbwhN9YB5tGYr25t59OJ0QZF1wha6DJFJahHxkR3D+x1oq
         pchjBAjWv8D4zDKlfI03O3+6m1y3/CjHwfjgAq1WCfDzYNBXNeRXoXzn5PXLXJeKwrYT
         rrC/iwufwfWZln1dSarGrAyKpHx6AlbTMMOH6M5XMlP8ch7uGBT8BQQy++5B4ppitek3
         ZjyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCC9oWdgqAM5NcRjXxLpk5kFbW3F4EGWRs0NAkxNZnIp9yKeZSCeRk8PQY0ZBjWsVvolRjOIzf/xuPGGjgNZzSSw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/bkUfF/oX0XQpuQw4+Jdm3YOy21gfkoXuXd/N7p8JPHDUYyq2
	rdXpDBa6BYSj78dpoXpWScSggS+0F9guVewIU5nK93e9u9YXzmKyO7uf5AfcWWBcvE0=
X-Gm-Gg: ASbGncukwbzHoRovsiqJ1SavWjyGCNCWdBfFsTKYEEh/8ZmwbHDjuixrRp1paq1eT26
	n/QKGGIurt8CuIEmwogg68Qa/evkSmlqH26qf8UbCNPfaCtCDse139V0TDpqrym9TxScMJPsdhS
	w62AbhrL/vl/YGitA03QlFqNhuVZkHDww8ixJSwOnhj+zqhb8oDIjIaW3T6IrLMnLCXcpl4pnan
	L1NQmq7V7SXe1uZXqEhjzKA+3pGGV6aigClrtyn8srYhaAOfOd44iqW2aPdrGb0y31cAB3bzVS3
	g8hYxvCR5yKqILzpWBNLJ/xrJLM0ts2bP+rPgyssFanihHHc3lV4ejtdKmtzvhR4TN5ROFhAR4E
	7S1M23tdYEAHS2HjNkmRdizOSpeMRcEe9CQfV1cy4sjY928ncOsBTIBW+tSi5Rje4SWJ/5xeD0d
	nlywiF806zaemp6kn1oRtQFT06Uleu2uofp2ZyPGMsg0+Tsh7exaVu6g==
X-Google-Smtp-Source: AGHT+IFDIrWbS8oLPeZCE7p+ENc1WZpM3eLGlVitKKb6TCE6u50ue0eV8hM8dFUippytjt8iNWIZ8A==
X-Received: by 2002:a05:620a:c47:b0:899:d7bd:bec1 with SMTP id af79cd13be357-8a8e30e45ddmr40385485a.17.1761674745003;
        Tue, 28 Oct 2025 11:05:45 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:84f2:c6ad:afd9:6725? ([2001:1970:3847:e000:84f2:c6ad:afd9:6725])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f24cd5617sm872188285a.19.2025.10.28.11.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 11:05:44 -0700 (PDT)
Message-ID: <b3a0a3d9-7b0e-4078-886e-da2707d73a00@baylibre.com>
Date: Tue, 28 Oct 2025 14:05:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] tar: use diffutils for ptest instead of
 busybox
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
References: <20251027202240.4100310-1-skandigraun@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20251027202240.4100310-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 18:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225414


On 2025-10-27 16:22, Gyorgy Sarvari via lists.openembedded.org wrote:
> A testcase (sparse03) sometimes times out on the AB, in qemu (without kvm):
> the test generates an 8GB sparse file, tars it, untars it, and then
> it compares the two versions with cmp.
>
> This process, going through 16GB of data (using one thread, with cmp) takes some
> time anyway, but when there is extra load on the host machine, and qemu
> can't use its core exclusively, then it can take more than 5 minutes easily
> (which is the default ptest timeout).
>
> However the full version of cmp from diffutils seems to be more efficient than
> the busybox version:
>
> When using busybox on my idle machine (w/ qemuriscv64) the test case execution
> takes 150s, and it almost always times out when there is extra load.
>
> Using diffutils, my idle machine executes the same testcase in 55s, and it
> never times out even if there is high load on the host system (execution
> always stayed under 3 minutes).
>
> Due to this switch to diffutils when running ptest.
>
> Fixes [YOCTO 15884]
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Thanks for submitting this. I can confirm the increased duration you 
report, but
I haven't yet been able to reproduce the error locally in the past, 
despite following
a similar looping process and doing some loading. I tried again to 
reproduce it this
morning and still couldn't over 37 runs (even with some loading on the 
system).

I did however just test your change on the image and saw a very 
consistent ~40s
duration for the sparse03 test.

I think we should take this ASAP and see if the tar issue goes away.

- Trevor
> ---
>
> v2: add a comment in the recipe
>
>   meta/recipes-extended/tar/tar_1.35.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
> index ea0993a909..d463eff97d 100644
> --- a/meta/recipes-extended/tar/tar_1.35.bb
> +++ b/meta/recipes-extended/tar/tar_1.35.bb
> @@ -94,3 +94,7 @@ BBCLASSEXTEND = "native nativesdk"
>   # Avoid false positives from CVEs in node-tar package
>   # For example CVE-2021-{32803,32804,37701,37712,37713}
>   CVE_PRODUCT = "gnu:tar"
> +
> +# A test uses cmp to compare two 8GB files. Busybox's cmp does the job usually, but it is much slower than
> +# diffutils' cmp, and the test times out when there is a high load on the host machine.
> +RDEPENDS:${PN}-ptest += "diffutils"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225356): https://lists.openembedded.org/g/openembedded-core/message/225356
> Mute This Topic: https://lists.openembedded.org/mt/115982188/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

