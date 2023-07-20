Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41E6C0015E
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 16:25:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.1546.1689870339721592472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 09:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ILGbtiWw;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso8667245e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689870338; x=1690475138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmuAsJHSo6wtqOQMSF7rlPQBj6hmfn8+QbNE+jinfek=;
        b=ILGbtiWw3zWyfOAwoQ+68oRQhABDAnVONc3BXbyurHrO3nPxMdUqIvfS7QsduRjinV
         hMNvgWgsXXuXkayU2R45QvbhVPM7qdOhXjYqecBPCo/3gCyWAB6at8Y0ebXeKEBLSY6K
         3HAkAbVidBXHK1NWZlmLmfv7mMEI7xsMSvf2YIz2uffwDJRh5QVxf9IsNaa3StyjPKx3
         NtdVxQRhPWcsgI8Wnk1zbOUXJgvl/IjYwxnZ6pz17R909GhiR0dsx6plD+s84faEUPG1
         rwPbue1+kFYVd5gdBHMllsBq02uSXGb2lMVNWzQ0YEk/hfEbGztFmXIxSW753MX/QS/m
         8BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689870338; x=1690475138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmuAsJHSo6wtqOQMSF7rlPQBj6hmfn8+QbNE+jinfek=;
        b=QwcNYFVmY68/84WTCFZgkR0L7jTVX1PSjJlJ0e6wevB7EGsvE2nj5aW8drsOvq5NRX
         MehOLfq8qAB6YTw0ERG1GbhVLaBWkE+APm/GmJdYH+q4OcSrLEObpW6M8lrKQyNtYv2Y
         p/ZUDuKNUi1umTpi9KEJyUWJXcgi78Jgo9nhi1PwGckUDs1a/N7BEIXo/0Vw2+KXU06+
         GUOF8LiBcvZ7xA8PWtM5j7dUV42heMA+okwXQSqaDEna9VGoV2uE0jBT03NDVCY/t875
         5NqC9RWd9jC0LS/2EsWR+S2o6ixkzhTmrSZ5xuNsqAlObyuPpd/IRwwnzh6eqnlwyZxg
         5LjQ==
X-Gm-Message-State: ABy/qLZOA3FPTG6xAeDmdTH6bP9pri3zbFAsPc6TQMLexazMMVSNlAM6
	nskipGRf0kkiFbLXhnq0fnSjfiDd+e+OmA==
X-Google-Smtp-Source: APBJJlGvmkyxM9QFCeGMkXwbVEzAse8SWgalbp84iPV/zmHlHNWdxlKDJbXClHYK62VFnVWoVq3Irw==
X-Received: by 2002:a7b:c417:0:b0:3fb:c9f4:1506 with SMTP id k23-20020a7bc417000000b003fbc9f41506mr4901883wmi.1.1689870337405;
        Thu, 20 Jul 2023 09:25:37 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id z8-20020adff748000000b00314374145e0sm1749076wrp.67.2023.07.20.09.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 09:25:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH 0/4] Bump Protobuf/gRPC
Date: Thu, 20 Jul 2023 18:22:58 +0200
Message-ID: <20230720162535.116519-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184644

Hi,

I'm trying to bump gRPC to a more recent version,
but it requires a bump of protobuf.

I'm strugling with the following issue when compiling:

ERROR: abseil-cpp-20230125.3-r0 do_package: Variable Requires: absl_config = 20230125, absl_core_headers = 20230125, absl_log_internal_append_truncated = 20230125, absl_log_internal_config = 20230125, absl_log_internal_globals = 20230125, absl_log_severity = 20230125, absl_strings = 20230125, absl_str_format = 20230125, absl_time = 20230125, absl_span  contains an operation using the old override syntax. Please convert this layer/metadata before attempting to use with a newer bitbake.
ERROR: Logfile of failure stored in: /build/tmp/work/armv8a-poky-linux/abseil-cpp/20230125.3-r0/temp/log.do_package.2192204
ERROR: Task (/build/../meta-outsight/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_package) failed with exit code '1'

Do you have an idea of what is happening?

Thanks for your help

Clément Péron (4):
  jsoncpp: extend with nativesdk
  devtools: protobuf: add utf8-range recipe
  protobuf: bump to 3.23.4
  devtools: grpc: bump to 1.56.2

 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
 ...d-separate-export-for-plugin-targets.patch | 93 -------------------
 .../grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb}   |  6 +-
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb |  2 +-
 .../0001-Fix-linking-error-with-ld-gold.patch | 69 --------------
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  4 +-
 ...protobuf_3.21.12.bb => protobuf_3.23.4.bb} |  8 +-
 .../protobuf/utf8-range_git.bb                | 22 +++++
 8 files changed, 32 insertions(+), 234 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb} (92%)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_3.23.4.bb} (95%)
 create mode 100644 meta-oe/recipes-devtools/protobuf/utf8-range_git.bb

-- 
2.41.0


