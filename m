Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE7FC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:02:39 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.47605.1745845358607946001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L4rkS7tk;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: skandigraun@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30c2d427194so39412571fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745845357; x=1746450157; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5E11zM3312NrexYz2mMI6M0Y6uy66UEtEmlouNcwFk=;
        b=L4rkS7tkrDag1+RSNm1xb0zUwoB9br5X4sRRKsZHsaP6lEpUKt6bNHp70lgrksLu8a
         nKwcHv0J0BKGNWXb+T4pyWnXZy9v9Gd2IgguIwTxPePX1Mxqu2/1mfRDt+vdEKfP2TqZ
         4PgHbDkNdqleP1O4URdwIV3IlOKdChO+Uf3E4YFXY5spNdwxq85IJ6kMo2n/fCl0kAUc
         w3oYN/6LA759j2Qvo70FOf3uBfd+1ZOKC1FGUXo0qAK7FPYXheBwhxVgftGpYfdAbNht
         dnOYu+tN54tNYuu75sarKwCU3HjZPu4E2mOAB19sdLT6tP9e2dOcDCxYQcbTxhdc4KYW
         isDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745845357; x=1746450157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5E11zM3312NrexYz2mMI6M0Y6uy66UEtEmlouNcwFk=;
        b=fFefCIZ34bRF7XQ9Kv+EfP7qkQeD3jgoIbLL8llBwTLFgjkkBThb9DBLjsq7vXlgtc
         Z9CdeUnAmySfjEMR7kmV0uLwl34eL/Dzocr7VaLfdHszDRmfVDb7Rnc1qI9eNxjmfNUO
         6TsEuswAAYJqr/ZQqWyULgiizRNRl2l6pt2mEey2TVONEW/t1K+/t5SGBmF515q0Seb8
         iCJZ8o/qJRbMHlPkcfN7LA6cB9rZWNALqN4YhIGUDIbFcv69AZoPTxHcHzZxj6wy15UE
         bNZ8bmIMs9/sAwEZSGqwfPvMz2qOBEi7kIdjO5XImEyrfyYOhWsHpS0tBHnMoXPO9g5e
         mytw==
X-Forwarded-Encrypted: i=1; AJvYcCVhoTOnTW9rNbmHzPiiAKeDBM5jqGGvYTwqwWENkjdqgMHlVhgfoYDIekbTTg+GIyh/tSKek4MqJKGxuteUA/hRog==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8j2W5jQLPnS/2x5C8zcd1/Ha9ALs58E+WEgGsz/lGMkxF/oRS
	6JInFqtlQK7ugfVB7RT1SUmql1lZOROp1DossmvQzmBXv1A2+Wmg
X-Gm-Gg: ASbGncuYNcJqMijqJ7X2INVPwqVgq+Gve1DF4Rv2VmCnYb4IQGLT90zZY8XIe/eL+0g
	qTeJ9qGtRFsXaXuoRPNUZXpfpyLjV3UxASY2bEOqT2KvStstAOlNzwqHU/SlUuXARXd4qbosXTH
	3XVxOy0VqlhrHrbAVQUm4RtGdvdTnW13WCBsvaFz4Ne5YqdKBAegfuguPZIN5DF9s32PgRJ/WR9
	UcARxxn/Z9Ws9JJhbnqLEtDoSoS6pV9ApUDpQVVC4YW6wHwvN/bYkgFVHlcQb2byBBt1i28Xh6S
	9eS2HwjH6MiwD6SMpg9Eclnv3oin96p977mJCFTHtFRWssCBosxnVlXNmMw=
X-Google-Smtp-Source: AGHT+IGLtPdu1hkR67kJRWU+rs5ZAHmYRQjhl8Cz1bWTLQdEVJDofLJ1slDUY5xD8aCkog2a1juLkQ==
X-Received: by 2002:a05:651c:1507:b0:30c:177c:9e64 with SMTP id 38308e7fff4ca-319080e44cfmr40293321fa.35.1745845354786;
        Mon, 28 Apr 2025 06:02:34 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7260sm618538166b.49.2025.04.28.06.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:02:34 -0700 (PDT)
Message-ID: <cb2fa576-630f-4d04-962c-81078c044c75@gmail.com>
Date: Mon, 28 Apr 2025 15:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH] ffmpeg: upgrade 6.1.1 -> 6.1.2
To: divyanshurathore2022@gmail.com, openembedded-core@lists.openembedded.org,
 Divyanshu.Rathore@kpit.com
Cc: Akash.Hadke@kpit.com
References: <20250428122624.108701-1-Divyanshu.Rathore@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250428122624.108701-1-Divyanshu.Rathore@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215599

On 4/28/25 14:26, Divyanshu Rathore via lists.openembedded.org wrote:
> From: Divyanshu Rathore <divyanshurathore2022@gmail.com>
>
> ffmpeg_6.1.2 is stable. It brings many fixes.
> check the changelog mention below for information about fixes.
> changelog: https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n6.1.2
>
> This upgrade also fixes CVE's hence remove those patches.
> Refresh vulkan_av1_stable_API.patch as per new codebase.
>
> Signed-off-by: Divyanshu Rathore <divyanshurathore2022@gmail.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2023-49501.patch        | 30 -------
>  .../ffmpeg/ffmpeg/CVE-2023-49528.patch        | 58 --------------
>  .../ffmpeg/ffmpeg/CVE-2023-50007.patch        | 78 -------------------
>  .../ffmpeg/ffmpeg/CVE-2024-28661.patch        | 37 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-32230.patch        | 36 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-35365.patch        | 62 ---------------
>  .../ffmpeg/ffmpeg/CVE-2024-35366.patch        | 35 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-35367.patch        | 47 -----------
>  .../ffmpeg/ffmpeg/CVE-2024-35368.patch        | 41 ----------
>  .../ffmpeg/ffmpeg/CVE-2024-35369.patch        | 37 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-36613.patch        | 37 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-36616.patch        | 35 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-36617.patch        | 36 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-36618.patch        | 36 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-36619.patch        | 36 ---------
>  .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 ---------
>  .../ffmpeg/ffmpeg/CVE-2025-0518.patch         | 34 --------
>  .../ffmpeg/ffmpeg/CVE-2025-22919.patch        | 39 ----------
>  .../ffmpeg/ffmpeg/CVE-2025-22921.patch        | 34 --------
>  .../ffmpeg/ffmpeg/CVE-2025-25473.patch        | 36 ---------
>  .../ffmpeg/ffmpeg/vulkan_av1_stable_API.patch | 40 +++++-----
>  .../{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb}      | 22 +-----
>  22 files changed, 21 insertions(+), 863 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch

I randomly picked CVE-2025-0518 to check (one of the removed patches),
because it looked small as easy to check - but failed to find its fix in
this release.
Looking a bit more at it, version 6.1.2 is 9 months old, but the
corresponding CVE fix is only 5.

Am I missing something here, or was this patch accidentally removed? If
it was accidentally removed, could you please check the other removed
patches too?
Otherwise if I just can't see the forest for the tree, could you (or
anyone else) please help me pointing it out?

>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.1.bb => ffmpeg_6.1.2.bb} (92%)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
> deleted file mode 100644
> index 80d542952a..0000000000
>

