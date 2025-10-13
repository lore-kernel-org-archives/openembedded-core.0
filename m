Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1246CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 09:09:07 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.38937.1760346541519659931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 02:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PuAICKAu;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso666628266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760346540; x=1760951340; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PteOEQpY/qSRlTW1RHKotBQZ3WqVfSdBKmeQ6ap2VxU=;
        b=PuAICKAujrwQngt1uc7UcSFmVr0DvyEceE/Jus2vxb4IJ9O/c8FED9LJY8SUCQWdRO
         yqrPpYKn2mpFFzOuE5n1AnNuIUDIdobfE/b3/rTWtat0dBu6wMjsDY9KnHQ7vomQ5pn7
         qAkpCSXiUyp7dT/pJlEGg5vJbI67KPeDTrGSE9BieZn6gVcNkW+LU08NMKJpdHNSJ7J5
         qLNmlHauPrUiB1d5yhqA82PcwvnqLTehJePQaBKWD/kWTdHc8GuDpO6wO7iJ5WlK1zgT
         s8KAE/kzUbrQcq3C1q7D96glmlmw/QAv7Ar7DkE9ma/DvKoDf6vI9+9NP+seQRe3A5qf
         6htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760346540; x=1760951340;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PteOEQpY/qSRlTW1RHKotBQZ3WqVfSdBKmeQ6ap2VxU=;
        b=lzBrLjlnio285K5tygHImV6mUZdueuxLv0XsQAspex8VR3tg7oDmbIrEPOy2rCUrmw
         Vx+UXXEPJ2RUglJR//4IgkvizVX1WZUKy0rInhD7Qn9dg3DV/+doZ9UGRNIBlDNTXxFJ
         P7TBavEF2gvAh47OM2Ad+2tUTvyaxNnA0N2BzBeZ161jrkKN3woP9VRTSBiRpYmLs+dm
         FrOytQkZqz75bBCWwrz/61JJi4Y52uB38oTp2iulNH/Tq9v/GRDJR99vP8pQ9ONd0vVL
         ofKczFKeH4J0RbiIV1WEvKY3/G8F4jIc1GjwS297AKBc0629sAr1GcT/REK+uIUPq43U
         L2rA==
X-Gm-Message-State: AOJu0YwgV9Ir2bFKjwXGv1FVrsBi0y83A57CqEaOaF02WplGjVMrO58W
	dyVR+o7wWIaqGTxyNVykqEZ8bIXPLMAC6XRpX+BXSy1HSbcl+UdGo9OFxlZWtFuG
X-Gm-Gg: ASbGncvGrNV9FNgy1CTiDqlp71CdZJpj+/5NZkjQKiJU6fa7yhdI8/nyKZnucbaQigg
	vqHfX/Z8U/9I667LvhashXKUTeEIlIeRRsoxnd5TLauCEXXd/fz+ddnApSjh6H6x1H1TDiU0tSU
	isKDSZfAOFaEq4n3lGC7GYaXWqYys9taBi8uXqEkHZOSoHPuugjdYBi1B7I7Ek02tR0bvCTWsLO
	lxcWQ7viv7iUr2HHzExyaC2YNuZPs0l2awxxu78j2IxxuSv0CD2Xhk2HlOW3gmmKNkj1/cgAZ2w
	1+QIDGhsBAg7/B+CME/oEu71qQ5lwTuZN2q8vdPc/N5IWjmm6o0IbIsT42jUU2gf+dVLXQ6+8bW
	g4ZyBg9hC4NErTHLYZScLjsodle+HubLHB1x1m5PpHRqfj9cc5KwWN2iEEAWAv0hfcDWY3JdDT6
	o6jMNFoUVjIw==
X-Google-Smtp-Source: AGHT+IFgMEcPAMoSGCH32kok0pV9YpBjLtJpzULXWZkcsIY6NO9ChiLIREVR0xrc8rZJ3ndU+zwicw==
X-Received: by 2002:a17:907:7f8a:b0:b45:e8e2:ade3 with SMTP id a640c23a62f3a-b50ace225f8mr1867350866b.64.1760346539472;
        Mon, 13 Oct 2025 02:08:59 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cada66sm865189666b.18.2025.10.13.02.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:08:58 -0700 (PDT)
Message-ID: <7ce15619-5c6f-4f22-a0b8-aa7e84dc6bea@gmail.com>
Date: Mon, 13 Oct 2025 11:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: clang build regression
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 09:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224766

Hi,

somewhere in commits 9dfd4f44d4..3fc1fa77da caused
a build regression for clang-native:

ERROR: Task 
virtual:native:/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_collect_spdx_deps 
has circular dependency on 
virtual:native:/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_spdx
ERROR: Command execution failed: 1

and for clang:

ERROR: Task 
/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_package 
has circular dependency on 
/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_packagedata
ERROR: Command execution failed: 1

Using the preceding commit allows building these, i.e.:

cd layers/openembedded-core
git checkout -b work2 9dfd4f44d4f40e7926dc88cb564baa2345c2a24f

git bisect lead to:

commit 448f4a84cb22c380d97e069d0b98ddbe1cb8de18
llvm: add recipe for just the LLVM libraries
still allows starting to build clang-native, which eventually
fails to link executables, due to libLLVM.so.21.1 being missing.

commit d76dc362c8e18779cc4ddc6a778fb423c0e66a65
clang: use llvm recipe
already fails to start clang-native with the above
circular dependency

That leaves
commit acc8c5c89c0f1bff3413d2301a65afd89bd0d9ff
clang: globally disable build-time RPATHs for reproducibility
as the last usable commit.

I use meta-intel and MACHINE=intel-corei7-64.

Best regards,
Zoltán Böszörményi


