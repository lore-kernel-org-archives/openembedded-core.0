Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A728ACD5BA0
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 09:16:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.5105.1725527792086086210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 02:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBBZ7Yj3;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53345dcd377so600143e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725527790; x=1726132590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iNhltM8hzs53RNOEAVdPHPOIWOk7a9CpL4vgf7VilMM=;
        b=LBBZ7Yj3zBag8pySRylWTMxWPbAbogUgs41LdSoui6Xj8Fo06yKcJK6XqS1QtBZ52Y
         OSPSdSss51Dpn+u6jQRQemGrGo0RXUy/gAO/Sc7seummHdhhd8VC3jsU26+oboedvZrO
         kjjODzcnsONJG3VJACw/URZftwj9icoCSgGg/EQAt1OD7+sCGRCmLcoUs/QoeIPmCHTQ
         Tdz0zwD9KIwdRfVZOVCJAiIzgH81yKkh5F6a2eegO3dUwDyYB7E6fH/4N1I39UUsTwL3
         gAPNYwrWekHmqGrwuVSObOEoGknbe5NOAORqAlLLaUZlwQJzHyH/fc8ubr8z+VSuDA9B
         P+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527790; x=1726132590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNhltM8hzs53RNOEAVdPHPOIWOk7a9CpL4vgf7VilMM=;
        b=dfA8RtORYLDsf+1xC9mC64pyugEUJqMFRn3A2fQDaN14IGSsNcdZmzMJu4KA2HaoIL
         eZA+CEEwj0fqWeN/v6cYUp6QVablzF4gd2oI5RuwPn3qZkjfM/jiHFy1FpAFhKVc+Ddu
         5bKIDj3JnVti/BuTXXpi6V/scKLbJm38fUAv7UUmZmS1JIqb9uqUdAXRLaM5jUjpQLP8
         XBzs2xIuahEQoQqEvY4IyWqrgeRCPjcGZZtCSI9M1ftC+dJAbKKOvZvydKtWrROhCtTe
         XWJloPkSioYw7qhpz8OtMAi0f8EwF0uEq2p3+eZ33mW1t80duaIO/ZHfLX35JCk/gN4r
         hwrw==
X-Gm-Message-State: AOJu0YyFhYgkDpERelLtJBnz0HRlzPQftpe011WDaItZFFqArFS5QmUy
	senkCPKdugJn8dOY49nhwLcGXZ1NUFvCvmzxBCbUAiNHdHVFMF46IgDIIQ==
X-Google-Smtp-Source: AGHT+IGipRxcwR//lwQFZMeblRqgaTaeMx9kdEsh2PVzwYAxQYnLMwIUZPrRC95FslOBK28lLAVSOg==
X-Received: by 2002:a05:6512:1043:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-53546b93f60mr13176527e87.40.1725527789293;
        Thu, 05 Sep 2024 02:16:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc6a51c6sm957468a12.83.2024.09.05.02.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:16:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC PATCH v2] bitbake.conf: DEBUG_PREFIX_MAP: add -fmacro-prefix-map for STAGING_DIR_NATIVE
Date: Thu,  5 Sep 2024 11:16:17 +0200
Message-ID: <20240905091617.3580787-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 09:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204228

* the default STAGING_DIR_NATIVE starts with STAGING_DIR_HOST and the
  only difference is '-native' suffix at the end

* this can lead into replacing STAGING_DIR_NATIVE path with just "-native"
  in FILE macros

* I've noticed this by accident in python3-matplotlib where buildpaths
  QA warning was triggered only for lib32-python3-matplotlib and it was
  because pybind11 path to STAGING_DIR_NATIVE was mapped to only
  '-native/<path>' in python3-matplotlib build (which doesn't trigger
  buildpaths QA and lib32-python3-matplotlib the macro path wasn't
  replaced at all, because of 'lib32-' prefix in:
  -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot= \
  -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot= \
  -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native= \

* more details in meta-python fix for lib32-python3-matplotlib:
  https://lists.openembedded.org/g/openembedded-devel/message/112074

* the order of *-prefix-map options still seems to be that the last
  one matching wins and this works with gcc and clang, see:
  https://reviews.llvm.org/D148975?id=516863
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109591

* some components might sometimes be built with -coverage and could use
  -fcoverage-prefix-map:
  https://reviews.llvm.org/D148757
  or -fprofile-prefix-map:
  https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html#index-fprofile-prefix-map
  but will leave that to recipes which actually use -coverage for now

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: the order doesn't need to be changed
    tested with gcc and clang by building both
    lib32-python3-matplotlib and python3-matplotlib
    and checking for buildpaths in
    tmp-glibc*/work/*/*python3-matplotlib/*/package/usr/lib*/python3.12/site-packages/matplotlib/_tri.cpython-312-*-linux-gnu.so 
    and there were no TMPDIR or '^-native' paths inside (nor buildpaths QA issues triggered with this change)

 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d8252c5b82..04b288abc1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -656,6 +656,7 @@ DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+ -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
-- 
2.46.0


