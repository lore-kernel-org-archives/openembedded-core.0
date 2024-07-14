Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077A0C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.15464.1720960764490471199
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MvWZnhgv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fb4a807708so30528585ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960764; x=1721565564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19zJHF1qNMJyo7h4lg9OEdHE6u3Zii0ioATomudrHHQ=;
        b=MvWZnhgvQID5+2bbgsiYMk0uSp4ZXvz8kVoJSI2p+5dBjkz3/S7YNiWkmwxcGriVGp
         tjFWNLZiikoU++jPU9OVCaXuCWfkYD7CzBEkUbF4j/7EtDj17IHGWyF/plRu+BvQK7D9
         wDqyafUqB6MIJ4WkEuPws88lJHP57ntod2m+NGytA4Hkv9/e5k2GLpm0Ddl7TnnQ8BMx
         7l8+OxXnVDypR8APq3nlGH6zudFKxnp/v0Ju+KpG/9zURU6aaNKPEpwZ45dj3BXtkTlC
         fMd9+YTblbNudB1WCAIKqRBWP6SJ3Bf12C0O+UK3ZjLhXPPgZzTDMhzXLFEfdSxUvhoR
         3Lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960764; x=1721565564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19zJHF1qNMJyo7h4lg9OEdHE6u3Zii0ioATomudrHHQ=;
        b=Bj20zcwShlbyVq2k3zoC4euY/01eQosQXAnhODRvvh0UNxWKevNpyfg4YvGjCQimo6
         LZhgtqeDBUqFZnCZoo3sHMkqJu5fZk+AD6XbpJQe4MoHJMUGtd4me7gIizR3aN3n9BRr
         wsNzmxRkCkquwgULQmH2lvPkEd4S1AetkoNwhIGIyUX6HRRbm6PX9MpND4xZsTlmWdLM
         aeH2pclA7b5jazRzPlExjtLItXNj3Lr00n9cNth3orFcsN08bdsBPGQSdjTXawpWHQUu
         gaNSDkFkaG42TToIN6k3mydUtmv7AoBQ6PA6p79SNNJknIwBf3LxnL3unYMaskahk1/s
         ROsQ==
X-Gm-Message-State: AOJu0YyjwUA+bssWvU9Ip08GQZitaPryQEuM6ctl1uPeKZgXcXRXzHD4
	0ZYknQna64NI1V6Kftlv/raWLiC9f6g4+++QPQqe6ireHqnWFL8vrqpgEkMMNFXUK2ZFS5ijXw5
	eAjc=
X-Google-Smtp-Source: AGHT+IH0IuXfX1DM24bR+brGpScmoHF6rIizF21LbJNfYY+sgOEYCwDFz+Zv20mjqzKiP4ZPXnRKmA==
X-Received: by 2002:a17:902:ea04:b0:1fb:438a:5e5c with SMTP id d9443c01a7336-1fbb6edb408mr169990955ad.43.1720960763806;
        Sun, 14 Jul 2024 05:39:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/27] gstreamer1.0: skip another known flaky test
Date: Sun, 14 Jul 2024 05:38:38 -0700
Message-Id: <5b00a8efdf0794af46e8240582799ea008172215.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201868

From: Ross Burton <ross.burton@arm.com>

The baseparse:parser_pull_short_read test is known to be unreliable,
according to the list of known bad tests in gst-devtools.

Also clean up an incorrect comment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be58657b3ee32af5a00f6bfecb9264751915dabd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 7d0312005f..ab2df80dcc 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -1,11 +1,13 @@
 #! /bin/sh
 
-# Multiply all timeouts by ten so they're more likely to work
-# on a loaded system.
+# Multiply all timeouts by five so they're more likely to work
+# on a loaded system. The default timeout is 20s so this makes it
+# one minute.
 export CK_TIMEOUT_MULTIPLIER=5
 
 # Skip some tests that we know are problematic
 export GST_CHECKS_IGNORE=""
+
 # gstnetclientclock.c:test_functioning is very sensitive to load
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_functioning"
 
@@ -13,4 +15,7 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_functioning"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_infinite_seek_50_src_live"
 
+# Known unreliable tests as per subprojects/gst-devtools/validate/launcher/testsuites/check.py:
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE:parser_pull_short_read"
+
 gnome-desktop-testing-runner gstreamer
-- 
2.34.1


