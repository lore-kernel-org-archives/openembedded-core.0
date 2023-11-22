Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EC3C61DA7
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.18449.1700657125371754390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8oc2KtT;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507bd64814fso9448422e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657123; x=1701261923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqQsnTleE3IA7J232ox7CQOscDR/Nrrocz9U2MCp4U0=;
        b=L8oc2KtTjeFNr0F2eYPymReMAdBDJOQ63Ti8VNfslcXQJl2I499wptoWKmOfAjtG4h
         TaUAePN1cQl0XHLwCAASQypbHwBGK6Shtsyd6a+8My1N4M7Nf6MePUIQLHcMzUz95Xf5
         TuN/uxRquKOuPiq6NkV292izb7zZbunC0rXA3LPEtfuUKZkbgp//Of+Si1pam62yP8Tq
         t4x9uLCGXVaPtNwlFjMNGkFzRULfAec+gKmKbdE5X+X/fXbIaye7TkIzKmH4QPuXyA03
         4DoHLRIRiVAKpEpiYUrwHQgeEah4HjQrz/5bZ8aeDEBHLsghfF+QSCej2yT3IWpITAys
         WWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657123; x=1701261923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqQsnTleE3IA7J232ox7CQOscDR/Nrrocz9U2MCp4U0=;
        b=fkT6bGzqbDjwOZ+YfY5rOWwyRNWYmQJ7ugxPjGapUvPQAoPxHxU9wOHXacniSqdtUd
         iccjzl76h4hlvPwAbTUTgWy+9u4VzDRuUhq/8OHPIp58kEaDNJ5HwNCgewJ6c9ey8rD7
         2lVhtBLZ8KHLGp0/Lwli4pWFkWg/0pWObqhztyFmH7fxIhJzSY+F50uMYqTlNyfGTVgt
         uxHEPaMIK8MK06L/smaXoOy2R4e2ybyKlt6XBwMZ2GO79iI0Dp0opfYXqZQ7h7VBTDbD
         IKR5RrYE+n6c5fHnUwqUZoofwWRrmh5Yer6FFbENydUtZ4BKtRfH5YpSfBuOUdyGsnjz
         cwnQ==
X-Gm-Message-State: AOJu0YzXmP+Y/lcqmSmg1Fhr2PomWaCeXPmlvDUM09MncY/vWYVRUc4+
	52syl8H5pawbxxacbAl8dRY1gyJhgCU=
X-Google-Smtp-Source: AGHT+IGS44uH4crB8CYpR4xdSKtiMH9vC/OOO0wSdXtYXdQD3V0pz59pV0jmejwPc8wvKMp7X0SbEA==
X-Received: by 2002:a05:6512:3614:b0:503:19d8:8dc3 with SMTP id f20-20020a056512361400b0050319d88dc3mr1091572lfs.31.1700657123458;
        Wed, 22 Nov 2023 04:45:23 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p20-20020a170906a01400b009adc77fe164sm6563144ejy.66.2023.11.22.04.45.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/21] populate_sdk_ext.bbclass: add *:do_shared_workdir to BB_SETSCENE_ENFORCE_IGNORE_TASKS
Date: Wed, 22 Nov 2023 13:44:50 +0100
Message-ID: <606a01cbb1f1d6608093260692d9d299218074b7.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191097

* otherwise populate_sdk_ext task will fail as shown e.g. with:
  bitbake core-image-minimal -c populate_sdk_ext
  esdk.oeSDKExtSelfTest.test_image_generation_binary_feeds
  esdk.oeSDKExtSelfTest.test_install_libraries_headers:

ERROR: Task linux-yocto.do_deploy_links attempted to execute unexpectedly
Task tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_qa, unihash 9d177d4c6ca34e68e19b1bc23deec58c3eabe5f9d5808f90402161163a73f22f, taskhash 9d177d4c6ca34e68e19b1bc23deec58c3eabe5f9d5808f90402161163a73f22f
Task tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_complete, unihash 0aff4dcbdb3c5ca68e0ebb39457fbe86beb3482986ddfe0b0b6fc0386807edbf, taskhash 0aff4dcbdb3c5ca68e0ebb39457fbe86beb3482986ddfe0b0b6fc0386807edbf
This is usually due to missing setscene tasks. Those missing in this build were: {'tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_complete',
 'tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_qa'}
ERROR: Task (tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_deploy_links) failed with exit code 'setscene ignore_tasks'
NOTE: Tasks Summary: Attempted 4975 tasks of which 4971 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-kernel/linux/linux-yocto_6.5.bb:do_deploy_links
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Logfile of failure stored in: tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/temp/log.do_populate_sdk_ext.2280835
NOTE: recipe core-image-minimal-1.0-r0: task do_populate_sdk_ext: Failed
ERROR: Task (/OE/build/poky/meta/recipes-core/images/core-image-minimal.bb:do_populate_sdk_ext) failed with exit code '1'
NOTE: Tasks Summary: Attempted 6211 tasks of which 6147 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /OE/build/poky/meta/recipes-core/images/core-image-minimal.bb:do_populate_sdk_ext
Summary: There was 1 ERROR message, returning a non-zero exit code.

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index f209becae1..5705140359 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -366,7 +366,7 @@ def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_che
             f.write('BB_HASHCONFIG_IGNORE_VARS:append = " SIGGEN_UNLOCKED_RECIPES"\n\n')
 
             # Set up which tasks are ignored for run on install
-            f.write('BB_SETSCENE_ENFORCE_IGNORE_TASKS = "%:* *:do_shared_workdir *:do_rm_work wic-tools:* *:do_addto_recipe_sysroot"\n\n')
+            f.write('BB_SETSCENE_ENFORCE_IGNORE_TASKS = "%:* *:do_shared_workdir *:do_rm_work *:do_deploy_links wic-tools:* *:do_addto_recipe_sysroot"\n\n')
 
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n\n')
-- 
2.43.0


