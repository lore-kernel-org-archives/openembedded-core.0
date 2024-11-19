Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E916D6207F
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:46:01 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.27922.1732038351589531640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R/ktXp6p;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a77fcc787fso2240725ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732038350; x=1732643150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6thK5lmKPOGPKht4wHiTQvYKN30kUqU9luTihNPTt3A=;
        b=R/ktXp6pU0ZuGPppd9kq20VAdosXApywAwD0hUgrUXGZ7rDZIncYzzwTYIsr23fx65
         Enb1EgIymF2RaVh4QGZFcKtE/98hzfgc0NB/mISL8Ng3OtR+vlRAbVKJ7Fv8kH9zF+4x
         6fRe1ySZ9nCfcmErMBdLOJEM40No5YmNQa/j/Wkyjt8qich6FS+BwMC2p5jxP5eI/mAD
         M4+/31gb4TrCOsUvD18Dc2oQUIEIi9RMoBejlIhAR4C/f8iE27rDx1LyAfKBkMB0Cj+O
         jYc+OOnk1Wrs+UxXJJV6AdlHJnUsXtbmr658bMEShMcjvK95iMfEF8gM7kdpVbEPpLUr
         ES0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732038350; x=1732643150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6thK5lmKPOGPKht4wHiTQvYKN30kUqU9luTihNPTt3A=;
        b=Fb5gCDrKdahg+7/R8cLL1nMPIqD4qnEjI9+Nzr2VO9K7mZRJWYCPEUex13xxI3jeba
         rbUH6PT0GarmpJt7gLTETPeiqhzdWMt/pzoOlkIEuj00S3iUhXtNjoLCkj4TShIEpFK8
         0uQm8iCGqNbeAt1j5i1aHdcuJiNYZtHizITR6tqYh71JZ/ADZDlqfz2lhKfdDja7X0Au
         g/0aArjm0PfCE1rfmdowYtv/4XyHViQ1H8REndHXp69MSuyiW31XbIMYfIWbqeeVhQ0j
         8PKI39BjyQ7PDggbQ71H+gTSWkyUjGge9r9VBITIFYzop0GNeoUU39XWQKfB/7egDnxs
         ruAA==
X-Gm-Message-State: AOJu0YzqRuSj3fK5ZhrK+nYPGwug/04Bm7hzzBLceaxX5XQkSAecFm4Y
	ZncZ7CLxvP3ByJwoPZx9A9sriEtsgCL4JN7XyeFz5k84Lc262KVko/ZUCw==
X-Google-Smtp-Source: AGHT+IH9Y3SXlMcmZx9afEYgBT0wGD0oc4xqezkTzkZAvGEkFyChQv4sHRXFGyIApvcFJ8LXPAUdqg==
X-Received: by 2002:a05:6602:1487:b0:83b:7164:ebb4 with SMTP id ca18e2360f4ac-83e6c154846mr1660152639f.14.1732038350429;
        Tue, 19 Nov 2024 09:45:50 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e06d70b261sm2834261173.45.2024.11.19.09.45.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:45:50 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: wrap mtime based time with packageconfig
Date: Tue, 19 Nov 2024 11:45:49 -0600
Message-ID: <20241119174549.4145394-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207400

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Recently the systemd recipe grew support for setting the epoch time
at image build time. Unfortunately this is unconditional, and our
use case for the set-time-epoch PACKAGECONFIG is we have a system
requirement that our product boot with the time set to the UNIX
epoch.

Instead of trying to complicate things with either an image hook or
overriding the systemd recipe, just make setting the epoch at image
time optional, with the same PACKAGECONFIG that controls hardcoding
the systemd build time as the default epoch.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/systemd/systemd_256.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.7.bb
index 3831baa511b..37036e6fb3a 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -870,7 +870,9 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst:${PN}:append () {
-	touch $D${libdir}/clock-epoch
+	if ${@bb.utils.contains('PACKAGECONFIG', 'set-time-epoch', 'true', 'false', d)}; then
+		touch $D${libdir}/clock-epoch
+	fi
 }
 
 pkg_postinst:${PN}:libc-glibc () {
-- 
2.47.0


