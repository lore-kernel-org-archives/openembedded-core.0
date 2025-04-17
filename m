Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60280C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:11:27 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6060.1744888282330211754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GbhN8G2H;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so620373f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744888281; x=1745493081; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQyhEnEAVFMmtAjpe5cyPfzAeovMkSeOvlepn6B8bvw=;
        b=GbhN8G2H4ybx6SItv364Q+oEQOHwLPeTPyZlwRkqUWL9WalVYAAob0I7ww227/Zs78
         RUamGNuTHix00zHUIb8FoWR0ycYDUokBw3/MuU5daGtEbbPzCc40wHy1SAdZLDyiV7nz
         bA78WE3mOUtf0HxUYePaCGmA5gaBxfvVmu/Xar4toOus6Fu9oL16znBiLG7qdmLUD2lP
         G7lTHjFxX5voKg8g8T8qJh10YufN3wDX07i1bpN8chtswqrM0Yh/orBeoVP7eNWTe8EO
         ROHvl0ThOrPXSQfUeLI8OtOP5lwzMSjXgr3J41niB/MScO6mrLOsArh/kqzzwCYFm4wk
         nkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888281; x=1745493081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQyhEnEAVFMmtAjpe5cyPfzAeovMkSeOvlepn6B8bvw=;
        b=gYWGTaLTDXiUCVMfnX72xs8BFWAMmcZro/YfG+G1AKQuIrwiTJ4VIRTY9BL43i6V+u
         WAG9ajXtKG2wy8nbo6ZdSMdbsFjxJEglQz+FsXeMXyq+FlobPeNzA0Nu/2mpAaBPR22+
         LLDqv42uh9KF4EQ7rE+FEObtODmx3VbnaAt1nd8QiROrybnZ8tJN2FjjBZi9KcB8Up0d
         +bT8Pn9xCLZi2cm2Umn+1GvLLoLN2D4S3nNGoGcJTlAFZcCKm0tDZDm9BYIs8O5+Fi6I
         RRY0CIzHMejtQlR+c/iun3HErHfXkGXNlabxzuS+lBXG0iMzGKup/XhdABQYI6lyXjXL
         mAWw==
X-Forwarded-Encrypted: i=1; AJvYcCVVmgWGwDXO+J/HlGnhVe/WpPQKZcLQ3s3a4Z+5TucFa/vz8oijwqTjhIz3hIIJglCuFQ3HQ5+z7OgRmO6FYO7xmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7dkgsX1Ls3aZtjs/RCMYFwasyZM7OR9zmnHvO8be/ySgqkWu9
	5EZ1Yk7YFXrivpNdpPpwRbzyj08aEDtTlHqpvuRDo5ky07pYtEEk
X-Gm-Gg: ASbGncsoRkZvd31Ofx9oni+FOMdNudqZ59UgtG6TT2Vdvx0G6jfIw4TUNWuQHlJhJUO
	b9a+Adq/7KTfMER1fmW40VufZUbYvETzd08J8aGAAWsZHMuQsvn5oB/SikfhryfaVRekal4a1sF
	pIgBUR+DkkbGGljRh+ejtLSxKuHfmMcjWDRwcDpKLlnrLkRVW3DnQKj+9l6Prk3FeR6JAHio+Wt
	go3bH/tMOt0kJ7vyuVPMxQF86Wcgia9Nb//hva1akZlaqwIds0Mt8S2jiJVdEJm4RQ18U8H1Df2
	UV+jVSFQj5iiu9Hxttq406kzYLgCROuM1p3sxSE5BLLy0QkT
X-Google-Smtp-Source: AGHT+IF2srN33Zo7g9c7La6O2zpXPCnZiBdGWgkxlFeQUyRahN9p7DET/03selm5UfjSR8Jm7Tirog==
X-Received: by 2002:a5d:5f87:0:b0:39a:c832:4f46 with SMTP id ffacd0b85a97d-39ee5b35c82mr4826543f8f.26.1744888280410;
        Thu, 17 Apr 2025 04:11:20 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c102sm20029488f8f.35.2025.04.17.04.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:11:20 -0700 (PDT)
Message-ID: <4e8cf2ab-554b-469e-8481-91328f66e1d9@gmail.com>
Date: Thu, 17 Apr 2025 13:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 1/2] curl: fix CVE-2024-11053
To: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org
References: <20250417103606.3841180-1-yogita.urade@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250417103606.3841180-1-yogita.urade@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215067

On 4/17/25 12:36, Urade, Yogita via lists.openembedded.org wrote:
> Reference:
> https://curl.se/docs/CVE-2024-11053.html
> https://git.launchpad.net/ubuntu/+source/curl/commit/?h=applied/ubuntu/noble-devel&id=9ea469c352a313104f750dea93e78df8d868c435
>
> Upstream patches:
> https://github.com/curl/curl/commit/9bee39bfed2c413b4cc4eb306a57ac92a1854907
> https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af3194

The first upstream patch isn't mentioned in the curl.se reference you
mentioned. But the same page references a second commit, that should be
included in the fix (to fix a regression from the first commit - this
second commit doesn't seem to be present). Is 9bee39bf related to this CVE?

JFTR curl.se references these commits:

https://github.com/curl/curl/commit/e9b9bbac22c26cf6731 (which is also
present in this commit)

https://github.com/curl/curl/commit/9fce2c55d4b0273ac99 (which is not)


