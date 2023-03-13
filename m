Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E3BC74A4B
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 14:20:55 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.20665.1678717247803100222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 07:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kg9uigu8;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id h8so5619791ede.8
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678717246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOTmJoxrSu/mg/sZURcOKIPPEn/OMMpj71AlRUDir8g=;
        b=kg9uigu8XcXrdC496WoSbIz5OCkv9VmdY+grSZtA2IlP+NGbXcNfNLRtPdCf9GHMM9
         o8Fa0h4+vfmgG43oD3eftibQg7uMF7ffJDeyNmAn2Bl3L5CDiG1FHXpPP+Q5ecd0oXuj
         QgjXYE4Lerz7/n5wUe1xd+DTGcuC53c/Ukt9LaHopWiTNJsdhl4MYYBQSL+ptswOeJ/a
         AZ1OlL9CpAIZJmSkGaFK84rL6vVzl317//fCdj2+Y4x80ENNGmeNcjplpWQWGLoYgd8k
         XfjRS3Bz3BUbuv7w6Z+4zTVZTc1EJn2XxPY58RYEyNLuiKkaay5rcqnGaaqeBpSRDTJG
         dkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678717246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOTmJoxrSu/mg/sZURcOKIPPEn/OMMpj71AlRUDir8g=;
        b=4iFhpbZ5iUz399/WQZtTOT9buf0fBRRixuOGL1GAhFT5A557Sy1Tf/KgV0qPA2tetn
         X3XctDju7O51wx6P51NxRaetXE567+gQ+FXDxsFOOvoxxxuU5yjowl7rA0tk9MdCWg6X
         i/dc1U4jNCtaml0gIrmIyaW9cQ4X3/xjglgvnbJQPzQkxr9kKDJjV2lHZzegM3oUdZIe
         At/QcPpT87Gl1W0YeovAjWViVhMGHegdlQSPqJNr+Ak6qeMptbLWKxzsl8giKF5L3YMk
         DDhGXM7if1H7Brd0Toz/LioEi/XyW5WtzH2LQnIaGWdvmB7L0StWBcinER97HqJYLB1r
         Qz8A==
X-Gm-Message-State: AO0yUKVvKPj5/dWlKGemdlLNtQAPdIKyiOZbJXuoCRMYj2I7MbiUHerF
	m6+QbeU5kHxQV8WoXUc5BaMQXPOQYjM=
X-Google-Smtp-Source: AK7set/4i/AScWqEIrPc5h+/nB+3uUGwKI4/Jo5RR7clW9MiobH4sYGZmAxxSyyj8LCCrLThbzAEbA==
X-Received: by 2002:a17:906:a14:b0:8b1:7de3:cfb3 with SMTP id w20-20020a1709060a1400b008b17de3cfb3mr32526891ejf.1.1678717246273;
        Mon, 13 Mar 2023 07:20:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ae12-20020a17090725cc00b00922547486f9sm2832834ejc.146.2023.03.13.07.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 07:20:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: chee.yang.lee@intel.com,
	leonardo.sandoval.gonzalez@linux.intel.com,
	peter.kjellerstedt@axis.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] selftest: eSDK rename to esdk
Date: Mon, 13 Mar 2023 15:20:32 +0100
Message-Id: <20230313142032.2823381-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313142032.2823381-1-Martin.Jansa@gmail.com>
References: <20230313142032.2823381-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 14:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178451

* I was hit by oe-selftest -r eSDK.oeSDKExtSelfTest.test_install_libraries_headers
  running all tests except only this selected one:

  poky $ oe-selftest -v -r eSDK.oeSDKExtSelfTest.test_install_libraries_headers -K -B /OE/build/poky/build-eSDK
  2023-03-13 14:00:52,955 - oe-selftest - DEBUG - Selected tests with -r: ['eSDK.oeSDKExtSelfTest.test_install_libraries_headers']
  2023-03-13 14:00:55,531 - oe-selftest - INFO - Changing cwd to /OE/build/poky/build
  ..
  2023-03-13 14:00:58,128 - oe-selftest - INFO - test_archiver_allows_to_filter_on_recipe_name (archiver.Archiver.test_archiver_allows_to_filter_on_recipe_name)

  this is caused by _built_modules_dict(modules) function
  which filters out eSDK.oeSDKExtSelfTest.test_install_libraries_headers
  based on the regexp and then it runs all loaded tests, because
  modules are empty

  the initial regexp and comment from 2017:
     https://git.openembedded.org/openembedded-core/commit/?id=80db3d999ae26d298d9d5418a32b11a4f27af9d5

     # Assumption: package and module names do not contain upper case
     # characters, whereas class names do
     m = re.match(r'^([^A-Z]+)(?:\.([A-Z][^.]*)(?:\.([^.]+))?)?$', module)

  might still be valid, but it was loosened in 2018 to accept upper case in module:

     https://git.openembedded.org/openembedded-core/commit/?id=1ecf48fd286a77078451b67879a44f9c9dc7a894
     Some test cases (eSDK.oeSDK*, runtime_test/*) does not match with current regex, fix it accept all.

  Then skipping the not matching modules was added later in 2018:

     https://git.openembedded.org/openembedded-core/commit/?id=f2042bf3638ed4edfb167e7f7d4be6da60997ead

  and regexp was updated again in 2020 not to accept upper case in modules:

     https://git.openembedded.org/openembedded-core/commit/?id=ad81ea90a815389e45ff302a85151724c71f71c3
     oeqa/core/loader: refine regex to find module
     test case in format <module name>.<class name>.<test case name>
     this is clear when test cases is only 3 item deep.

     but confused when it is 4 item deep, eg,
     oelib.types.TestList.test_list_nosep

  I'm afraid that changing this regexp again to accept eSDK will break
  someone's favorite test case, renaming eSDK looks much safer option

  There is only 1 such case in poky:
  $ oe-selftest --list-modules | grep INFO.- | sed 's/^.*INFO - //g' | grep -v '^[a-z_\.]*$'
  Listing all available test modules:
  eSDK

  Most modules are just a-z (52x), then oelib.<foo> (6x) and 7 modules with underscore '_'.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/{eSDK.py => esdk.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/selftest/cases/{eSDK.py => esdk.py} (100%)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/esdk.py
similarity index 100%
rename from meta/lib/oeqa/selftest/cases/eSDK.py
rename to meta/lib/oeqa/selftest/cases/esdk.py
-- 
2.39.2


