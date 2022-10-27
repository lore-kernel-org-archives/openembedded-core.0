Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487DAC433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:26 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2217.1666838237594981618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Z/J1BRKI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id b29so74813pfp.13
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JB9GvbNeZCpcBXpg7OBacE0vrOm/8GCNaHH4a4AbgYI=;
        b=Z/J1BRKIXE720+lvSUEquLeDieVCiB7OhOlOWchnlA+WcEtuZypwW/McNef0HGMGjl
         aRXGq9d2F4fcPikcRx0PiFaifldNsGtRTZ2Aq+H9ryx92UYo0Ubkg0fbQEC06bl9pOKX
         wJPBTZRS7BBqVfuTBVme9fimS+V9xlBQzIY/M8jgJeesFE98a2p7bp+ETGYse/hVT1wc
         AuExOPokVH4iuHoe0OQhQfOhBSbEmMm92ZORd5wibmZm/xBOtb0UeDOkY0uFCLPoMxPg
         t8yZbcAdGHnuxXJWNPr4Iz9Gxkqj/BTd2cBirBBtK3AOTJYGs9+36DSYm4/3DJTqcqm1
         CE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JB9GvbNeZCpcBXpg7OBacE0vrOm/8GCNaHH4a4AbgYI=;
        b=eWOLVXPFeE+RjbYWkVBCvGh4aIFz9dszzCyQtHSjmMB4FL8jJbkl1GxtMbjTsv1u/u
         fS35b9cwibmeidXxvh0J+X2N2GGrSHwARHLMbJFdrStw1fmcff0dNnXW4spMTKyGguXM
         6iXWbXCE1mlIkw1LRQVUCLnQLtgU4GLSNMi39B8gy0YNjSpCmgnng1QzPJ5xskmr70ZG
         oDznkCYqZO2ahmw8MqfeE3bYZZm9BFlityOm7LqTqqw3HBgr9WP1qJ/TmarrKEqUE3Kf
         09mqsHD5En0crKmFypVsueueDp5FRZ+PLLtwFMucEz5kCP/VBamLN0riVYtfmOe6+Moj
         JyAA==
X-Gm-Message-State: ACrzQf3OXxLJLt+ID1VW2NB7OEj0hF7jCz3g8vj3h9YjWeM0QeMjJCYv
	VkU91Yt7zM1cn920gjodvX4Due0v1FUHizrf
X-Google-Smtp-Source: AMsMyM6skbNjK5Eq5FDxdCf0zWvmYbFIP5BRlK/4pb0e74VrSFfjPF6Uh8ZaTVQwGfYvJAS1oYaRfQ==
X-Received: by 2002:a63:242:0:b0:46f:357f:ac75 with SMTP id 63-20020a630242000000b0046f357fac75mr8627762pgc.575.1666838236622;
        Wed, 26 Oct 2022 19:37:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.37.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:37:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] Revert "lttng-tools: Upgrade 2.13.4 -> 2.13.8"
Date: Wed, 26 Oct 2022 16:36:41 -1000
Message-Id: <82237927dbbf9ae19dd63622dd02beec3622575e.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
References: <cover.1666825041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172187

Unfortunately this version upgrade results in failing ptests:

AssertionError: Failed ptests:
{'lttng-tools': ['kernel/test_callstack_11_-_Validate_userspace_callstack',
                 'kernel/test_userspace_probe_94_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_95_-_Start_tracing_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_96_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_function',
                 'kernel/test_userspace_probe_97_-_Validate_trace_for_event_userspace_probe_test_event',
                 'kernel/test_userspace_probe_100_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_101_-_Start_tracing_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_102_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_method',
                 'kernel/test_userspace_probe_103_-_Validate_trace_for_event_userspace_probe_test_event']}

This reverts commit 17d18936d201a61b16bbc24c9f10af6ef54620fc.

(cherry picked from commit 01cea6f046a6ec018c94ca88b6f8851c2baf43eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-tools_2.13.8.bb => lttng-tools_2.13.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.8.bb => lttng-tools_2.13.4.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
index 0b6dfa48a4..0ea4da05ce 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
+SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1


