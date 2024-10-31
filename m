Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CAAD767C8
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:51:27 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.12952.1730382676490258973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=o9ZFch93;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b1b224f6c6so64830085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 06:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730382675; x=1730987475; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y0pfvG8MCFQXC+zQoOXwYAXLq4KWsVIfYXSGtgSC0bY=;
        b=o9ZFch93cBquDK/in9NIk2R//B1v3dBMPaiCqYEvYAsy2vCKUC7Nm6dB44R1dsOhyI
         0Nlhr9WulMjvC21G+uw80q824j7uZxX9friDDpYt1YzJIehJSiecvtAkgkZiTi34bDYq
         QObfuXKz9Vg5oG/vxB8Mr0z+bjuXXNima2iz1j9pjfnr2TuR3BJteTpvObIW1HRhQyR9
         eAXUzD5tyj5OZtNsmshGXcuLYkOhzXvzRDBUs1wqOaI522KTaGfrp9gK91EPQkGVNiYA
         oozwRanblDln9vIS1hJB6LQ68ccbSV2w07SXbNhFYlPHe5jr7fStXFjiiBiAcSYOG0v0
         urEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382675; x=1730987475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0pfvG8MCFQXC+zQoOXwYAXLq4KWsVIfYXSGtgSC0bY=;
        b=oZFBd/uAhgxYg26c7rBktdcaw8vasB/B/LqoxNDbDfjzKH5mJNNWyUh7pchRRMBulw
         srutAQDn35NA7YTb6xS3fKcixC0ZUhlJ2Hhj5EqbC00AfgwHoq8i6SMQnIWUDI+WOCVa
         FJZA3DMY12sg6N/dvD7+baQ0Ee0NNCEZIf2vEz3A1bakX8eJtyfL5lKaVof65rfan6Wr
         dNXkviuLOfBpgCrvFzsd1AFjJwXnRpi3Ry0I2G9bOTNVE/mN1CqFNPCgGh3IrNLOAJXa
         YwOYD8bX1dCXPc6Oeho6fLAFyAw1FeSRsoY/wpXe//ridAidjrdaHHdxm8SPOvWlpcVa
         w6/w==
X-Forwarded-Encrypted: i=1; AJvYcCWegkU91BLkxMHMGB9y8dm5noW59QzsKxPoO3QPCJkr4MTdtPWoXd+LYgxV5/NgTlhfaj/d65zNjLSlNBNh0nlk3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvcT75E816FHhDYdceByZdN8qgsqPLxFk54vp9fO0TJc05qJAF
	Yk+fNBPioraTZ2snSOcWq2BcrRtH5GmxA6oxyazV5BN1ggFwC1z7kDBSCCpZ+fGm++w+UN23DMZ
	j
X-Google-Smtp-Source: AGHT+IEoy/epZKtiMJPwkxTYH7G4zNlExda78gI0+MwVupBsn7Y1K8nD8A7YlNmCU2FXf5CWZ8flLA==
X-Received: by 2002:a05:6214:448e:b0:6cb:99db:bdd5 with SMTP id 6a1803df08f44-6d185853395mr317838516d6.39.1730382675433;
        Thu, 31 Oct 2024 06:51:15 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35418b26csm7893426d6.145.2024.10.31.06.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 06:51:15 -0700 (PDT)
Message-ID: <a5cf95b6-60d2-48cc-869b-bb7f8b5475fa@baylibre.com>
Date: Thu, 31 Oct 2024 09:51:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: add "Inactive-Upstream"
To: katariina.lounento@vaisala.com, openembedded-core@lists.openembedded.org
References: <20241008063325.62462-1-katariina.lounento@vaisala.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241008063325.62462-1-katariina.lounento@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206585


On 2024-10-08 02:33, Katariina Lounento via lists.openembedded.org wrote:
> From: Katariina Lounento <katariina.lounento@vaisala.com>
>
> The list of valid statuses (`upstream_status_literal_valid_status`) was
> missing "Inactive-Upstream", which caused patchtest to fail the test
> test_patch.TestPatch.test_upstream_status_presence_format for patches
> containing lines like:
>
>      +Upstream-Status: Inactive-Upstream [lastrelease: 2013 lastcommit: 2013]
>
> with the error:
>
>      FAIL: test Upstream-Status presence: Upstream-Status is in incorrect format (test_patch.TestPatch.test_upstream_status_presence_format)
>
> "Inactive-Upstream" is documented in the Yocto Project and OpenEmbedded
> Contributor Guide [1]:
>
>      Inactive-Upstream [lastcommit: when (and/or) lastrelease: when]
>
>          The upstream is no longer available. This typically means a
>          defunct project where no activity has happened for a long time —
>          measured in years. To make that judgement, it is recommended to
>          look at not only when the last release happened, but also when
>          the last commit happened, and whether newly made bug reports and
>          merge requests since that time receive no reaction. It is also
>          recommended to add to the patch description any relevant links
>          where the inactivity can be clearly seen.
>
> `upstream_status_nonliteral_valid_status` only seems to be used in
> logging and the value was copied verbatim from the aforementioned
> documentation.
>
> After this change all upstream status options documented in [1] are
> covered.
>
> [1] https://docs.yoctoproject.org/5.0.3/contributor-guide/recipe-style-guide.html#patch-upstream-status
>
> Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
LGTM if everyone else is OK with it. As an FYI, we might see some errors 
with this applied on the AB for testing, as there are some ongoing 
issues with patches for patchtest being in master-next but not master.
> ---
>   meta/lib/patchtest/patchtest_patterns.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
> index 8c2e192fc9..10d23ab77f 100644
> --- a/meta/lib/patchtest/patchtest_patterns.py
> +++ b/meta/lib/patchtest/patchtest_patterns.py
> @@ -83,8 +83,8 @@ patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_prefix + signed_
>   
>   # upstream-status
>   
> -upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted"]
> -upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
> +upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted", "Inactive-Upstream"]
> +upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]", "Inactive-Upstream [lastcommit: when (and/or) lastrelease: when]"]
>   
>   upstream_status_valid_status = pyparsing.Or(
>       [pyparsing.Literal(status) for status in upstream_status_literal_valid_status]
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205282): https://lists.openembedded.org/g/openembedded-core/message/205282
> Mute This Topic: https://lists.openembedded.org/mt/108884475/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

