Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681FCC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:47 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.9295.1745416365307762779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLxQ8d8O;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5b8d13f73so683884585a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745416364; x=1746021164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2vLBd0QqNxsfPQQ5GwGmNK2vfTbOucclrfJV3KFBZU=;
        b=NLxQ8d8OaZrTk+SKja9VII1z9pt5HKngEms++nPaM4oMHd5kYbuQ2bMGg9wniH8GhG
         uK3W22C4YvuJo46kHTidHD1TFQi9XMKFwcnt/IP1+TyMDPMkM8zbvZbkiJuT6zgLJnMc
         pZDeFt+MkSufvJKDBAxvIxAkpuXflPi/rtFsUxOV3Iy2b7MGDhMepnq0YRZLHwjpoadl
         T/7QCuVLxk818w2eQTJ0X2HG2KHZVCjmH7zPExarcFHKIw9RB6hwGQ/vknZbzRklF6Su
         Y36PkSQ2zdh6ZfcL35ipDCm0KipTpR0m5nCveomCgpJB9AVhUvKOrmNLG0cjCEaCdv7t
         t4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416364; x=1746021164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2vLBd0QqNxsfPQQ5GwGmNK2vfTbOucclrfJV3KFBZU=;
        b=hpsd3iuZzURMy8e9KQbN/ZaiQTlvS8eR5kC7xQIa5iVFTbRBTe0IDvgHw9pxnUd4k1
         Xu3B5GA9cOVAhA9lNDkYRDHmczaz1rra0UqEewFXdjVieVeGlrmRjzVQGmssxGfM0pml
         FkY5kLmsd9Dig2ofgHWuPOOImsfdzAwRdNGxWj6cWGonvMsK1IsWxKxPmGyzpCxcquWj
         zyrWjuxsYP/V6AabofbirQqXZnKjMLOhEhVqsTR+K4jrZW2Yj+X6IyPx644oPq6xzhy4
         xESP5KbraxmWr4A1UoPRZyRZjuVR1NZq/1u7s0x5yAWsvobmz92+AkZ9z3s2DjoZthMe
         QN1A==
X-Gm-Message-State: AOJu0Ywqq20XUx585NwtAlzHtKSFXeAA9eWqGDD5+CzOw3euYEb0/vv9
	N/RvQptzKuCfL8nga7n7HDpB1+YvYmxBZFPdsT9/LVq1VfdKu5twjSZNSg==
X-Gm-Gg: ASbGncsJzVCSG4fXj9+RGKYJAhrxaxyU6TnNkxJScNLqUNbF196NYpdxwo804M9tmnO
	g4oHBAj9d2AmDXouhW1tkI4GkYpS43P5S+QF3SaOVC6YJWaIht3IAa6v5Ia1L2VfiEKZdwbonB/
	W5mO0OI/p1bC3cqR5zEGyjdYaxdkq332myfYh+B3PUua7oz4IweTP7S0o1R5sTZ6VnwQLspWfAp
	aKEmvnY2bRNiyFznlsLKfBCvT2uXGUA5gyljDcvkBKJhk/rYmtDPnNZKKo4TrbIGCm8jGdlv1by
	ne8VqTICxq0f2lsjNMaS0qeYqzNoQTF1fGbXWLZGcpRYbt5kBLJ0sOHQH2XI3YqnRLcx+fRk/KQ
	1v1bL8ylM
X-Google-Smtp-Source: AGHT+IEViKw6Ij+IBr3KtkwFRP14PkcZQQhJPNuDkAMWIhmraqm5AKhRJxwwnX2RzCkWfQ04q7WwJg==
X-Received: by 2002:a05:620a:2911:b0:7c5:5fa0:45f6 with SMTP id af79cd13be357-7c92805f2a9mr3450460785a.50.1745416363558;
        Wed, 23 Apr 2025 06:52:43 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b6dc25sm684631785a.110.2025.04.23.06.52.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:52:42 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd-systemctl-native: disable meson's auto-features
Date: Wed, 23 Apr 2025 09:52:26 -0400
Message-ID: <20250423135226.5535-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215309

Disable meson's ability to analyze the entire host's system to determine which
features to enable. Which features are enabled should be limited to the
features that are explicitly enabled, not simply discovered.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
index 041a040a2654..591a1747d63a 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
@@ -8,7 +8,7 @@ inherit pkgconfig meson native
 
 MESON_TARGET = "systemctl:executable"
 MESON_INSTALL_TAGS = "systemctl"
-EXTRA_OEMESON += "-Dlink-systemctl-shared=false"
+EXTRA_OEMESON += "-Dlink-systemctl-shared=false --auto-features=disabled"
 
 # Systemctl is supposed to operate on target, but the target sysroot is not
 # determined at run-time, but rather set during configure
-- 
2.44.0.501.g19981daefd7c


