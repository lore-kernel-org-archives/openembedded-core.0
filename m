Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D30ED33A2E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.28089.1730832355155723079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzU6xw62;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7f3da2c2cb5so1988438a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832354; x=1731437154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxXO856R/73eFtivQgy5R1trms5EC6nTeohYXWKV8Sw=;
        b=XzU6xw62mS334d3CY4We849QJj4nxq/Tv5Fbd3skswQD3K6GPlxOSCjxO8+Qpf+wzv
         OTyqz/GSzumn7MrSB4B53JCrPdJF8/GSsj/bHbjr/gRf3770rwk3lZ0E7wn05nzdkX7u
         NsYjslMgrVFR/wGS9SNLtAYhgXt6ltfXWRTcdcVN5nyM3AfVSZEHs09RIBNW9sCJJMC+
         FjQeSqDooJdcNJbmkr317caVifNpj8kcuqE6PcV0KUmwFspAmvREfT6YDnnXph6HOz1J
         6OGxOnb2qdSyxfqRihzVkRV5ewel0LxhYkQDUvoYr+MdZFbookALXnwmv3URXhEkx3AS
         k/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832354; x=1731437154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxXO856R/73eFtivQgy5R1trms5EC6nTeohYXWKV8Sw=;
        b=RqMErGdWSlkzF31222PnebJwOVl+hiqMaBT+ad487hDlJbsZNmfkOZXqUCUuX3T2Nu
         EbLTUs5hlOT5RhVsG6Kd0btxUvt8rcO48yIh9Id2S1mufC5kc4TKabGPvYL3XkEjGgaX
         vnudSdlkjVouUXBjHg9KzQpRNqwtKYtb/xTxXxjrlT+8oCFqoN5VzFgitCzr3W5Y+OEi
         n0MqVO/ViSrzFFTpJPavuYCCBX6D7M19mJpVR3JwiORdTR5jKHowGlndASyZAO01PoT8
         FEf3Mls6aVy2oNKHg0x0bj3ssr0uwieqCgFyH9XzHljxaHfQkW1B9/8eaSI6aDnyCG7J
         fBDw==
X-Gm-Message-State: AOJu0YwbQ8LWmJ57IkWMGE5lK5hNM4visH50lJMe5ODAY/y0x/Z0H893
	RSgcgKORQCvyqibT5AtlZeBHICbFTU8avE7QnMgASsfo1CgiZvtqpkSIpg==
X-Google-Smtp-Source: AGHT+IFUUgEaGjeB1PxoIgoc6n16fAzc6HA9mcSm501HWtAm9CkHZL4mD8oeLyDVKvo+DrSN0qM1kw==
X-Received: by 2002:a05:6a21:6d9d:b0:1db:f603:4f2a with SMTP id adf61e73a8af0-1dbf6034f46mr3071916637.14.1730832354288;
        Tue, 05 Nov 2024 10:45:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 12/19] distro/defaultsetup: Inherit clang, nonclangable, and nonscanable
Date: Tue,  5 Nov 2024 10:45:31 -0800
Message-ID: <20241105184540.3450302-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206740

This ensures that when TOOLCHAIN = "clang" then the right
tweaks are added for recipes to either work with clang or
fallback to use gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/defaultsetup.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index e6369dcec4b..7a40efe86ce 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -5,6 +5,9 @@ include conf/distro/include/maintainers.inc
 include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
+require conf/distro/include/clang.inc
+require conf/distro/include/nonclangable.inc
+require conf/distro/include/nonscanable.inc
 
 require conf/distro/include/uninative-flags.inc
 

