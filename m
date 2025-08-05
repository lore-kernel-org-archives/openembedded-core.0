Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E02C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 06:55:24 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.16226.1754376921789847315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 23:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/Tdu636;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af967835d0aso300991566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 23:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754376920; x=1754981720; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqdwIDqezgv6MucdFrqz+tpplDAKcIDPShLup7gIiQE=;
        b=M/Tdu636ARM7rjTF6tgGHUlrSCcC95sbjjvfDbUH0aHX2zxYp9/hk7CpCAMCmv7fh8
         6iPyw3De/MIXWXqCaS0x8XrjbDrcYpfXU7hNNDSfgebZL4HSEANlA5hvggFtQckvS0Z9
         mGw61uCFl1GskFjO6YAIs0qOFwSOpLJgCwJrjiEK7rDtykpREB//g+eFxML2r2jT6r9T
         /79BEHPy4KmnuQ6AmM0ENtRhElhtUiXV6LSm9eTBjEvsNJWjDykfoWxRTQw6LIpHCKgL
         wfIk1UzLZXPMnlDV8DvEj2jDl6X6FcPk2O7F0Vw7Go/EbxTTEzrrHXvcggcPAlAnzD5R
         WrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376920; x=1754981720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqdwIDqezgv6MucdFrqz+tpplDAKcIDPShLup7gIiQE=;
        b=FnZL7yp5Vh2XjjF35UpkKKI0t7BmYE43TjRoB/BT6LeJxi5sBYw5j71H/3HTwr0aMb
         rHghx51bP6HV1YIpIBJYqpH4eVsKmb3cRRu4CP2UvaYMf0bJFfDjR7D2MwHQ2rwtfZiz
         LrXgo26rARcJeFJX5i4f9gF98sP50SzggTTslqVoPWQTrfmRQk+l0J7+PiHsFfiNtjnr
         A2KekWNEkVXLHhk7UGo3zY3KtGGSwQxIhAS/WF3XgajmoGcOAegZMC+x2UqyETvY74Au
         4hob35kAfLN3p1uuv+hVWxgJIvTWarA5BbkvjbfrD0/EuLKK0UCrZ/hz2VYlenV2kF2r
         Id+A==
X-Gm-Message-State: AOJu0YzWNNNhMDVoHkafbh4taNTPg3jn98QNHWp3SBocsuUv/MeiIrOu
	PTnw0fdfT8ltTdmBC5grzxbBuftll+xgFR9klBau4ywJjjhF/dKi2zbtAmeT4A==
X-Gm-Gg: ASbGncsLAfEFxOQW447WPrq1NQTC8QhDuAprnfwZ2FZWtZZbTUz3W9qv5MwK7l2qdY9
	4mWfPo2jp4HacJblJsbmbr2OfaIIjJZHzdZkuWeWPk85+Zn1m1YV/n6lcHfKMX/4QwwN8GfS81/
	g9yPH5bYtDv/9M2YUG7G8DHVsdaJKdS8zP2KLiSPiV5zYyuBf/qqoPUkZr8Z6vSZcE5DkHo/zju
	kM623S8/B73W17Oni6BOms0DKQGfgONQQsoA5iv74ytjnaIrkcger7vjPtxI6Q8uZzV440OVdco
	CngseKi0nrcvELYwpW1xfVWFHi+/f5beVSI6pLmQTplxR/I6PavgGER6622xIdjEWNgWh78a2U1
	6uR1q7ntxe3amuNQursakSG2ATFGAJQ==
X-Google-Smtp-Source: AGHT+IHNbLg8YmyHGNC5mtEEmpFyL7Z4YA/FZTUhHRmdH7LZIxxh4C/KXUZETe3XGliypQj37UDbkQ==
X-Received: by 2002:a17:907:7247:b0:ae0:df46:abd1 with SMTP id a640c23a62f3a-af9401c783emr1302966966b.45.1754376920036;
        Mon, 04 Aug 2025 23:55:20 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c022sm833533266b.101.2025.08.04.23.55.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 23:55:19 -0700 (PDT)
Message-ID: <c4ea2f00-dd8b-47f8-8c3d-cea3ecd65daf@gmail.com>
Date: Tue, 5 Aug 2025 08:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH 1/2] librsvg: upgrade 2.59.2 ->
 2.60.0
Cc: openembedded-core@lists.openembedded.org
References: <20250805063925.771875-1-skandigraun@gmail.com>
 <0101019878fb2bd0-debd8cf0-fe59-4214-ab18-a9e34fcca3b4-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <0101019878fb2bd0-debd8cf0-fe59-4214-ab18-a9e34fcca3b4-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 06:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221456

On 8/5/25 08:46, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/1-2-librsvg-upgrade-2.59.2---2.60.0.patch
>
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)
> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
I think both are false negatives. The license checksum didn't change,
only small formatting happened in the recipe.
A small CVE cleanup was also misidentified as a CVE patch, but only an
outdated CVE exception was removed.

