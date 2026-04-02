Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F713D39410
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 10:44:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12914.1775126678255984311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 03:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CxH/7qZw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48704db565eso7662775e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775126676; x=1775731476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVW6d5t2g2LKOfsqebKTPIiYXrKsnimk0QbPkJfosns=;
        b=CxH/7qZw8OO4LnQpftmtcsjVPKEe7iU/oqTNy6OrvAkFWMphlmuP3cd1isVCEJvS1k
         Or346jiTh7DPcIoF+r3Sd8MIBD7PanvMxmU3ulK+1IKJ8dS2RGNAo+lA31zYbCTBGlrQ
         bdqooquhlIP6o7uuYBv1zfNI1ruvWBX1JVyVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126676; x=1775731476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVW6d5t2g2LKOfsqebKTPIiYXrKsnimk0QbPkJfosns=;
        b=e9qW5xZbrU0U2LYxSU5x8cQE92/H+GiS6BNVUAjat7wpaUPYkBpvM9Nb4V9JoJ42o9
         8qw51LDQWqtwq8R+0l1HXc6QCwJG2Qfzz9ruWZeeANO+YQ7N9GF6klZaeyoDc6OWM5Yz
         hcE6nD7VvbKcbrr+qZ5KBpfxgb7rJYGgTvu6i9I5qLCmxDSPdtRO9GSuCLkrTWIUqv3l
         R3YsWjIDA1qiVMD0BfFLXRkCMTUC37+Y9pAi7pjFRl1K+XPqEOaivAxjOgJgKIbNuT3J
         snjApV/7LsiZ3blmiZb2y6POLPSWCSh5tuVhLmicvrNnPDocWSASPi/OydUYtC/riQJz
         3YTQ==
X-Gm-Message-State: AOJu0Ywq5ylZZcIp+kS1MjC1aOO/UFK9sAYef3LBd37QoBLi+Lkl/EL8
	8V6aSEE0IYBwjocCB4blsk2MXToZ3Uec2oNlX9ROUy6qiiyoDY+lC7fszkZ24P3ypUipicLj5U+
	GjzF9
X-Gm-Gg: ATEYQzySjSBjFniu8uHRGUEguF87oV1L9EgwITgVyUWnfLrmFdfdspGLo1ELM14Bp9z
	cfXUxTXF12mBUnpZwHEnoHzGr44b4NrU54Ei2UyfE+mwG0p7yGH6C3SdFPE54ZaETGceGpvj6Fj
	xcmHqUaOCOuH2Q7+GZZqqDWlFaSk5eQY0Xtu4fTl8MlRcJzd8K73pJIXAkClbghPxADpKLnoBjX
	/cWRJ18Y4Ro6dgJg4EbL+kkpOGxuLVMks0dvH+t/+Uh53r6bCwjgQtWYCJEje7vaSbraFuDeCme
	yalkBfUmdeawpQWyL2T8LOIcxK7p1qQSzxdjHtjH0/zCiVfL1VBmazHD6K4Xf9JXEwkeJ3QPYte
	EpKDXnK581bS1wbq41lYC5i7zRnUAIDI+P4c3lBn0cYtlZqmEgPeLHWKTzYzcLCoyugTEhihlCf
	+osy8TsJJYwIn2PKYeFnY+0sa+xkR6KhaKUv997sYaCZq+qdZhjthV
X-Received: by 2002:a05:600c:c165:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-4888b7694dcmr45251705e9.17.1775126675954;
        Thu, 02 Apr 2026 03:44:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a695:b092:8c54:d70f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm259750855e9.15.2026.04.02.03.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:44:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] local.conf.sample.extended: Drop obsolete DISTRO_FEATURES comments
Date: Thu,  2 Apr 2026 11:44:32 +0100
Message-ID: <20260402104434.3525234-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 10:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234513

These pieces of config are obsolete and not really what users need any more,
just remove them entirely as they are simply confusing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/templates/default/local.conf.sample.extended | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/templates/default/local.conf.sample.extended b/meta/conf/templates/default/local.conf.sample.extended
index a898b18d59f..999a09dac1c 100644
--- a/meta/conf/templates/default/local.conf.sample.extended
+++ b/meta/conf/templates/default/local.conf.sample.extended
@@ -31,12 +31,6 @@
 #do_fetch[number_threads] = "4"
 #
 
-
-#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
-
-# If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
-#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
-
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
 # will save some build time at the expense of breaking i18n on devices with

