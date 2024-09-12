Return-Path: <daniil.batalov.123@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3121CEEB570
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 09:14:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.43935.1726132489920162567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 02:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I02pWlcn;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: daniil.batalov.123@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso1024603e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726132488; x=1726737288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vcHbt46D6S+CpDKfdbWKfE0zt7cgklybJZzPNgI0Iic=;
        b=I02pWlcnuGzO15GU28VRWPWnS6Kv8+EtuIdsXMzLyfM9cvmzdPTb6fIPokHsR2ceGm
         fSYEygx5Uz6haRnlxJL/7EoQoCFKsboGDiq84d1O029TgH0u/MJIb1jw3ZY8dvY5F6Qf
         ykrzp5c4v4R/gnyQ8h9Sbe0O3OGAx2iXkqy0CWv60wFSWgJq9ndj5QoA55N3qArdybrc
         RHqr/eSHeObMTwfrjSLo1+3OTnVTDLsFv3pxuEKyZvfOPo6PhVAz53O51IDhYloM1xcL
         kSEg69PUeyim2pzPEdF36gjQXfWCXhUY0bnj7IOdK5NyxGOuVifN8yWLy0rGqy1RRpjA
         kqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726132488; x=1726737288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcHbt46D6S+CpDKfdbWKfE0zt7cgklybJZzPNgI0Iic=;
        b=bgwm5tuj9SQUqOisGtnk/dUWBPTwtSSVlbGwrBebtP7Dk4T6bmfnFfVS52RSSRIoGm
         VVwf3286TUsIKA8Wjjqihgku0xcIWLG5ttM/WMTAiASKuykEwKpGPzhepggn3o2Zo4pP
         PMa6bhC25NHgjg5XXO7zI0RXB/G6yXzhw/X0wHWlyA2392mPqEXn9KLEviizMtDY/D3S
         rlaiP8BlpwHCMNwvYfeZT6d8r5X1V79wzshfZ2NKDPMBMzUjFvzuEKB8kRB6MEh3PRhp
         iiHuCXQrwVbu5oLx0dwxwXhcO26cjyQ4xnAum38jxdSCDuK7fuQe/r6Uv8FMJqBpTkjb
         FV9Q==
X-Gm-Message-State: AOJu0Yx1Si9R0SR+CsWxOorIltY2rCZ5bsJjyI0wmNjqwVS5Hm4QGE5E
	t/87wOG9zFz5POPGUhiJ1d5JUnasNFdk0lUTCVWh28lztyHHFs/7dv2B2c+tb04E2w==
X-Google-Smtp-Source: AGHT+IHJ36cSoxcFWqSm8KV/nKt+WLh6fe5x0AP6Nj9VxBcO0N0uNz24o51wQ43XG6HUdrLj+iBQEg==
X-Received: by 2002:a05:6512:3d92:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-53678fec405mr1573963e87.50.1726132487385;
        Thu, 12 Sep 2024 02:14:47 -0700 (PDT)
Received: from daniil-HP-295-G8-Microtower-PC.deltard.local ([84.22.156.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb785sm1858142e87.145.2024.09.12.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:14:46 -0700 (PDT)
From: Daniil Batalov <daniil.batalov.123@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?=D0=94=D0=B0=D0=BD=D0=B8=D0=B8=D0=BB=20=D0=91=D0=B0=D1=82?= =?UTF-8?q?=D0=B0=D0=BB=D0=BE=D0=B2?= <dbatalov@deltard.ru>
Subject: [PATCH] spdx30_tasks.py: fix typo in call of is_file method
Date: Thu, 12 Sep 2024 16:14:41 +0700
Message-Id: <20240912091441.1773904-1-daniil.batalov.123@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204428

From: Даниил Баталов <dbatalov@deltard.ru>

Method is_file() was wrongly called as isfile()
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 4da52da654..6a2858c665 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -239,7 +239,7 @@ def get_package_sources_from_debug(
                         continue
                 else:
                     # We can only hash files below, skip directories, links, etc.
-                    if not debugsrc_path.isfile():
+                    if not debugsrc_path.is_file():
                         source_hash_cache[debugsrc_path] = None
                         continue
 
-- 
2.40.1


