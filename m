Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6980CD591A5
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 16:33:29 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.46358.1731947601467173049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 08:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YW3sTy0w;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-460c2418e37so27708331cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731947600; x=1732552400; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIvG56nrMsTv588BvA8UZjFZdxkc553Zo94k0tgu+m0=;
        b=YW3sTy0wo7dE0ZeUkPPjLGTdRLDkG7bNNJaLz75E4KZBAd0dIOzSZ6huPeY0kbTLRe
         lmZWENh0K+YjC+5sNGKRCPz/IylL7PZ8n7jIXCIukzNc7PzWLMDPub2QY27d1kQrkAIQ
         u6l7nVM0tMiHDY68CNaNLnGQbPwd5s2+WjUEu1XtitCVTHxMW0+CVH3aFso3ViidaOmV
         teRvhHMVVL/A9scTsw865inY3SNQRUwkQpcYjpFTMmlJieQk9wj51ZZc52sIlHSv6Ryr
         8kJCom/HLp7Vx7oyGoTZ4MUBxItovOfmNnks5uq5wRXo2WRcGm1ldryu1aCn6DWo9Vjr
         vxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731947600; x=1732552400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIvG56nrMsTv588BvA8UZjFZdxkc553Zo94k0tgu+m0=;
        b=nIrtQPg6eSsryXbNgqti2t0i23yJGZI/1H2UdS5FO5lT2FfvNlUoaWgW9HUbK7iEq+
         mjUpkFJKJ2rKLnE9JeoKLQhDU9Wr1IGR5W6+CAbbnkXHWOY95wLmG6zeKbucYhRKDo12
         WPNG02jbnS9mKCRULQIywIm4yEdPVJB0aUvrzeI7+pQ2VNdvTINa/Cg2mzFVgZ6M0Jii
         H6V2FsZVsto+d9z83HXP0353n9qYIR4t/c38g7EL24nDuCMO4abVpWYF/q5joJv3T5v0
         xc0SxXozCCL5RowHYoJocKy5/ILe4xKA2tNn5BpevvXSJBw9kPwjNUSJPr2b/FoRJp/i
         1XOw==
X-Forwarded-Encrypted: i=1; AJvYcCX20pj8o2X5BM8OzjPA3RyaXGlrMWkeUsx5Y9i+rN2pRH74o4/Zm/UlRQT3JKZ8O1XytT4g/NgtA+DKWQDFglnX0A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWIoapfe3d+iZLp+kbfoG4RPoJeQZruCUTwvkou1Getx/CAWLx
	Tq0PMGjtC3jBj0w2UZ0Y9dQQlLgP7P6b7jThYXPtF+qH9VIUmIFchnbulbfg5O2pRCgcKQT5kWs
	O
X-Google-Smtp-Source: AGHT+IErt8lK5FJE7k0NE9OP8VRUVZPaP8nwwHRCBt3rnPIWRrbVXtsiJTPYk2OYJUKiT56wejDExQ==
X-Received: by 2002:a05:6214:2a8f:b0:6d4:1ff3:a96 with SMTP id 6a1803df08f44-6d41ff313e5mr73939086d6.15.1731947600551;
        Mon, 18 Nov 2024 08:33:20 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40ddbc487sm37792006d6.113.2024.11.18.08.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 08:33:20 -0800 (PST)
Message-ID: <c7be93c7-0b25-4a4c-9669-69c1ccbbc547@baylibre.com>
Date: Mon, 18 Nov 2024 11:33:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/3] patchtest: use HEAD commit as base for
 the selftest and not master
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241118162643.1423409-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 16:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207227


On 2024-11-18 11:26, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Patchtest applies patches on top of poky master branch by default;
> this means selftest does the same, and any commits from the branch-under-test
> are then discarded.
>
> This can cause issues for example, if bitbake-server process started by selftest
> from the master branch tries to parse bitbake.conf from the branch under test:
> https://valkyrie.yoctoproject.org/#/builders/71/builds/460
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
LGTM.
> ---
>   meta/lib/patchtest/selftest/selftest | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
> index 6fad50ce616..3cf1c361f7f 100755
> --- a/meta/lib/patchtest/selftest/selftest
> +++ b/meta/lib/patchtest/selftest/selftest
> @@ -38,7 +38,7 @@ def test(root, patch):
>       res = True
>       patchpath = os.path.abspath(os.path.join(root, patch))
>       
> -    cmd     = 'patchtest --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
> +    cmd     = 'patchtest --base-commit HEAD --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
>       results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
>   
>       return results
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207222): https://lists.openembedded.org/g/openembedded-core/message/207222
> Mute This Topic: https://lists.openembedded.org/mt/109647316/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

