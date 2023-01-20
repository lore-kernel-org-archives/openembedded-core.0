Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116BEC25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:20 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.82155.1674238285685718262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=I1kSxrLn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id s67so4746072pgs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6zBjQA0FLzsly2EuQhxbEpofKQWSEiqWc9onf5+Nck=;
        b=I1kSxrLntu2cpO9fFazvfYFoZXV9vnxSLe+xd3bG7B1hfpexRgJV4bpAqGWCUJ4NMP
         MYYOuPGl9M15KqdEoREpMk8QytbnAfeTjo8sjcqmIkXdR6wxgmcDel07Sh0s3Fth1+Cs
         NCQS904wtd/Eyr5OYAFI6HZBy50Rqf/ZiRfGv5kJWcKkVezjKxjdD83w+JxyFKU4B+bO
         oP7Gv3ITh3ey8fiFHRYhYwNBkzsMaMmw3kKfTp9P6p4i4kfQeZz99QRWKVJvH4Csj5V5
         Yti+POuMc9+zq7zZqT2oz4D97cceUEo/2A3XKNsA/e+ryewPrUDmaXvx4lTF8TTV4t+1
         eliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6zBjQA0FLzsly2EuQhxbEpofKQWSEiqWc9onf5+Nck=;
        b=q99RfeEeKOSVEeNEh9e6zVoZBxYty4g05HGRWTAm2UXv/ss+Opof8NjxInBG7cpzPN
         4e34gSH9bb9UyP7Ro/zI+YMI3M1g6npNORFZDO0ZX1Zz73I+15/eLPbcH8Fj2wkWf7yO
         Us2i92xJdT/QcWxip4+OiIy0PF337uTQ553RWZ3+DQIywoqTRp8mGzDjzAcSnnRa8wii
         KddtxRfm0Ebj3kUaCVjJLwkuVqfWPC+7vFhFzwoXQ+3x1rb0j0NEuUkcfeMmiDv3WR86
         b8IjYZYp9zioXm7ZfYPftB4srCEIdCYx/fM+exLlLQVikGApoqVp8M+zznQnWUcJ+dvG
         kBHw==
X-Gm-Message-State: AFqh2koANEvv1ezQVqIT8BQqJwNJW1lyUet+WDmAuTYt3wdu7OoH5yqL
	D0SICfGZZYtK4umD65ESZsiWUjjdIhJLd9LeUH8=
X-Google-Smtp-Source: AMrXdXvMHrwEyNnN1BX/uNHSL1g7B6tyUfzGYy+Zqvh1fT0z502qM4a3rhJK9BTzC06jqWtT3AhY5A==
X-Received: by 2002:a62:640f:0:b0:581:f301:23fc with SMTP id y15-20020a62640f000000b00581f30123fcmr32405122pfb.12.1674238338817;
        Fri, 20 Jan 2023 10:12:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 41/41] selftest/virgl: use pkg-config from the host
Date: Fri, 20 Jan 2023 08:10:58 -1000
Message-Id: <cfd9f549a0d5dd44f4c71bd077b5fd17d3683550.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176248

From: Alexander Kanavin <alex.kanavin@gmail.com>

The check needs to report dri location on the host machine,
so pkg-config binary needs to be capable of finding the needed
dri.pc file on the host, and therefore needs to know where
host .pc files are located.

This may not be the case when using pkg-config from buildtools,
so this forces usage of host pkg-config.

runqemu already does the same PATH tweak, so this simply brings
the two in sync.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0521f8a3ba7e15482756529ee7b0a95b3d53e7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index fe83b248f3..44f787ef12 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -265,7 +265,7 @@ class TestImage(OESelftestTestCase):
         except FileNotFoundError:
             self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
         try:
-            dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
+            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
             self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-- 
2.25.1


