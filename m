Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5892FC54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:14:38 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.8716.1710249274278651075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Kj7f+rkF;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42a029c8e62so34306821cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710249273; x=1710854073; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3F21WR6USEzkl8LOKOl/zoRhT0VmuDMHSyp71+ThRKo=;
        b=Kj7f+rkFYCF+YEYBVA/bHEOXDFALZOlmdJWG5j7AjfLo32wb42CWTJ8qVlb7CIlWxB
         o0I2QzlIh2m0YmfzfwY/dDY1iKscmaC04kre9WWvvcsaGkV4OIsZGfX7xHGL7+6QOeRe
         JODgjqbgKtxdVcTPE7qm2eN8b+uDIKQiSDdAfyUf2ZmBYavbYvaSyMYZyMtf6ECFJYPg
         YhUBjJErnAEAE0scQIBAfHAsai9sHKSrfCAd16CAyKrVwWiadxws/yejAi3sMa3p/UXm
         nA1NexiONYDfqdSlsDnYYQSoqKvKoRT34ggDr/ld9pXjZ/NCN4hMBV5Hy6vgXUC51XNC
         VEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249273; x=1710854073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3F21WR6USEzkl8LOKOl/zoRhT0VmuDMHSyp71+ThRKo=;
        b=AejhGI5CZRk8sZJV5xdCvIe5/k6OVzaDOOeRAibcgytQRWrilOH/CMi+GAbiuXIFcm
         DE+ZjIaVGj4TgnquoXuQ0vnYOjShS01rXFviCEe9QfiZ7WvmtJF7fDMNS8mxG79sD5B+
         S5vWEPmh5lJupTbBquzoGDklu4r7hVX6cVWt+1DSg7ZbkoA553STaT0eehLx+uvS9ZCf
         q4/I7f/DNXY+SrgSRir/7k+egBSklZ8g0JF4r1ixT4VfLwhOmCaYh/o1yW4Ci+/R/bZO
         hoJu8JPXX6COICVt9dp4gi4167ToAnFVnHXZpHks89U7iBCEpPRVJzw48/nzFa3AhztQ
         fl/A==
X-Gm-Message-State: AOJu0YyW9RWVoIHJiDuUfBsOfrXPqmzRZNFO0HJLSgnzoxMynw0g8VjM
	a+6ewYncXGbMhJWxNE/Pl2WMHg8E2JDSJVXlAN7nsM9+oAETxU6+NyaPLCT5ENOajPppNzWx8VV
	m
X-Google-Smtp-Source: AGHT+IGq7/gPz1MiTXpCTAq+BcieKjjKwaw5+JW0YYmlVa4nmKKIU/oS05fxuvuu8vIvbLli1wah4Q==
X-Received: by 2002:a05:622a:120a:b0:42e:f034:86ed with SMTP id y10-20020a05622a120a00b0042ef03486edmr12194405qtx.3.1710249273328;
        Tue, 12 Mar 2024 06:14:33 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id jz11-20020a05622a81cb00b0042f2b9d1812sm3716138qtb.86.2024.03.12.06.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 06:14:33 -0700 (PDT)
Message-ID: <0f327746-7ac6-44b8-9839-f005d3f00396@baylibre.com>
Date: Tue, 12 Mar 2024 09:14:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH 2/7] openssh-config:
 initial checkin
To: enrico.scholz@sigma-chemnitz.de, patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <507a19c6164d34669ff09794134257835063af64.1710177387.git.enrico.scholz@sigma-chemnitz.de>
 <0101018e2e9afb18-ff562683-59f3-418d-b628-74dfc3f7f152-000000@us-west-2.amazonses.com>
 <lyedcgbpsy.fsf@ensc-pc.intern.sigma-chemnitz.de>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <lyedcgbpsy.fsf@ensc-pc.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196980


On 2024-03-11 14:12, Enrico Scholz via lists.openembedded.org wrote:
> patchtest@automation.yoctoproject.org writes:
>
>> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> This failure seems to be bogus; patch creates a new recipe with a new
> LIC_FILES_CHKSUM.  It does not change/update an existing tag.
Noted. We'll have to tweak the test...
>
>
> Enrico
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196963): https://lists.openembedded.org/g/openembedded-core/message/196963
> Mute This Topic: https://lists.openembedded.org/mt/104868543/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

