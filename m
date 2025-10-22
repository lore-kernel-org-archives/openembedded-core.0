Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5170FCCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 12:31:55 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.7823.1761136310602328871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 05:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYCbDQkg;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso590910f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761136308; x=1761741108; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyDpWWBgDTCtCl+3EIfRbNALUKD/v61ZJw5936vHVKM=;
        b=PYCbDQkgCiR3DLwTYAa1bx0AGDviYSyWCHL+QjNLcN55PqlE2Xx3i1QRQOKT6DSaZe
         khMvc2GuQgxVVwbCGF4JAjvLBi8r3uwua0eVsBPQdDjYpraiU16u1y21kBv4B9/g0sMj
         arIW7biBI9XeHsogNWgU3P8y7VKPFcUP+fJvqgPamcGn9lqTBIckVFjNin+/h6DZIvaj
         Ic6JAEJnc3Ef2zoeoKiZ2zHybjaD7rbQ2d2BO43D4UzTPdkvTQsad05XMPdgyVYB31Xj
         iiQONsd2/IO+OLSq0AUVEl0hnvru+oCHTv/vSOnRQ6BPTe5hr1+L2gYgwjdhYmeUwhSU
         xhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761136309; x=1761741109;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyDpWWBgDTCtCl+3EIfRbNALUKD/v61ZJw5936vHVKM=;
        b=aLBt8pgDKVm0G7axMrneeCzhRQo6s7yba5j3i/r4cS+gQVK4EhVMWI/PZCdzs/16my
         zSYFsYmPNm3qEl76GJePE+CSszzalvqilYHd1lVPC3d3bKEIgax4L8K/+vFZXtZoqIQ8
         ylniGyoQ8iwZtbn8y4kvXF8gGqUsYESU/RPtdJwv7XylUDEv/cSgOwC/L/caPYOp4eTC
         fmeKHNKe2Xdf4B8xf9K6R2N4uWrqp0tzdJFqiSTLmPkZ97vNexhQ2EnN97UGIDsj4g3E
         l9GTza5RshtIDjB3Lv4Q8UUyuIEb0geOYBtprS3ojee64RMiBXmWJ6tve+cIeHpS3d6V
         60/Q==
X-Gm-Message-State: AOJu0Yxj/1+MRl1o0mZfVnXigR6qXN/ZwkT5zqPHHg5XQ7lamC0Bap5q
	yM4DzvRy75S5+BHaF24sQzTiYHCVpBf7jml2H1kSDHwDvbvigJY4BFyjiGEXaQ==
X-Gm-Gg: ASbGnctLcjdwh860TkiH/V44WiH5MzJw8U0YAFwc9ogvR2vGVel1rsk/9RdMmyV+2D9
	kwFxDbXqq0MlBRofRxfNNkQvAT41HYjQbkBUlzhWtOMtw0srR9LQVaTe3QFuxwoxAJLU7dDe7O2
	gOI5QtVLuwR5xFLSv1eGnJGAGDw1em7/seA07I58liGY1zZstXdverscAHDcqtjNMCJmT6SoL1t
	ROqM2JijOs1L7jBIgQGa1+SzOof5JnJvM0hh7UulbNCt9/QIUdvuGnzCHhIKnexqbtGUmt0Bjir
	71vlaeAOpx3buPhQ+kNkINtGLz89haYCGyT4DvTURrVE4di6eIorjGcnhoqb92zxCJGQtowISje
	GN/HQaNvPRvIVZAFvwYVEnG6jPjLo6mKWUnvQfZjjcL/7Ld4W3IoPfkdvHbS9zXgwlIIIN4WW
X-Google-Smtp-Source: AGHT+IG2VUzDOMfUSrS+eLJxKUCmTnPjupJ2E1s4LT3+ruAFcRvF4GCLkjKpBa5ArRb4o92DQxyh9w==
X-Received: by 2002:a05:6000:603:b0:425:70cb:9ba8 with SMTP id ffacd0b85a97d-4285324d1d5mr2247762f8f.1.1761136308302;
        Wed, 22 Oct 2025 05:31:48 -0700 (PDT)
Received: from localhost ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-428567cd83csm2236970f8f.14.2025.10.22.05.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 05:31:47 -0700 (PDT)
Message-ID: <5c301f98-9ceb-403c-b23e-f0c8006c5740@gmail.com>
Date: Wed, 22 Oct 2025 13:31:47 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to
 Scarthgap
To: openembedded-core@lists.openembedded.org
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
Cc: kamel.bouhara@bootlin.com
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 12:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225189

Hi Kamel,

We spoke on IRC when I was testing v1 of this bundle, and I suggested backporting this change [1]. I have now tested the v2 bundle with the projects I am working on and encountered the same errors related to the populate_sysroot task. When I applied [1] on top of the v2 bundle, everything worked as expected.  
Could you please consider backporting patch [1] and including it in this bundle?

Regards,  
Fabio

[1] https://git.openembedded.org/openembedded-core/commit/?id=8b506f327838b885bfeb2cf144f43c8be68b8591

On 10/20/25 08:09, Kamel Bouhara via lists.openembedded.org wrote:
> Hello,
> 
> This v2 series backports SPDX 3.0 support from the upstream Walnascar
> branch to Scarthgap (Yocto Project 5.0 LTS), including the corresponding
> test suite and fixes for integration issues found during testing.
> 
> The motivation remains the same as in v1, to bring complete SPDX 3.0
> support to the latest LTS release, ensuring that long-term supported
> builds benefit SBOM generation capabilities. Scarthgap is under
> maintenance until 2028, and SPDX 3.0 is now an essential part of
> compliance workflows.
> 
> Kamel
> 
> Hongxu Jia (1):
>   oeqa/selftest: Add SPDX 3.0 include source case for work-share
> 
> Joshua Watt (7):
>   classes-global/license: Move functions to library code
>   lib/license: Move package license skip to library
>   lib: oe: license: Add missing import
>   classes-recipe/image: Add image file manifest
>   selftest: spdx: Add SPDX 3.0 test cases
>   lib: oeqa: spdx: Add tests for extra options
>   spdx 3.0: Rework how SPDX aliases are linked
> 
> Kamel Bouhara (Schneider Electric) (3):
>   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
>   spdx30_tasks: fix FetchData attribute in add_download_files
>   spdx30_tasks: adapt CVE handling to new cve-check API
> 
>  meta/classes-global/base.bbclass              |   41 +-
>  meta/classes-global/license.bbclass           |  165 -
>  .../create-spdx-image-3.0.bbclass             |   85 +
>  .../create-spdx-sdk-3.0.bbclass               |   74 +
>  meta/classes-recipe/image.bbclass             |   58 +
>  meta/classes-recipe/license_image.bbclass     |   14 +-
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes/create-spdx-3.0.bbclass          |  200 +
>  meta/classes/spdx-common.bbclass              |   99 +
>  meta/lib/oe/__init__.py                       |    2 +-
>  meta/lib/oe/license.py                        |  203 +
>  meta/lib/oe/sbom30.py                         | 1096 ++++
>  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
>  meta/lib/oe/spdx_common.py                    |  244 +
>  meta/lib/oeqa/selftest/cases/spdx.py          |  248 +-
>  16 files changed, 9262 insertions(+), 216 deletions(-)
>  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/spdx-common.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  create mode 100644 meta/lib/oe/spdx30_tasks.py
>  create mode 100644 meta/lib/oe/spdx_common.py
> 
> --
> 2.43.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225098): https://lists.openembedded.org/g/openembedded-core/message/225098
> Mute This Topic: https://lists.openembedded.org/mt/115849813/6083838
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [fbberton@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


