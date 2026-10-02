Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74687CA5FD6
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 01:09:02 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2078.1790903341194180574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 18:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gYorn1LF;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so3219629a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 18:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903340; x=1791508140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OB0pEkDoHytIrzKh/bU3hDIb9fhoRlE2E9A7f2dUUtc=;
        b=gYorn1LFnbor1q2BgdY68Jji8Rgn6CuPxn6JKf8igmXly/IQ1W0uteKHhKqx2vuTye
         dqpg+KsLD8fP/q2K/bPHqH68/IWvDV4V11wptY+OpFIx2elDQwMT1IgfpjEeTt9LvXtv
         T+iGRLoOrI8NKcV5jTNN3mBBvcuehvyPSV9Otgh/cARcEB3uaa9w/1KF6Qka/Jmlbnzw
         imHWFIoH/hQIKgTXcjbiOlNJ+mVP5SDYS0+6vRgcx5IkRHQbY7EwDgsmxZDOfAvgBJ/n
         DacU2FoEoTtzd+iPqkVhdW+JXsvObT8FkYEoqoy/1sXuh3f4/KjhOweXc/OmirD67Vil
         eIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903340; x=1791508140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB0pEkDoHytIrzKh/bU3hDIb9fhoRlE2E9A7f2dUUtc=;
        b=pItLRNQCr5yw3gV6NNrRjxAZlpC1lyLSCFSDnZHNYZ0b4t0CEWnKhNyc76Jlw1DgWY
         bHrVZBoIYRUjU1QPVz3ll0OGDFoyNguOpcTHt3do/8RL4ifvmrRgMCzHFjkXxlHuBrjm
         elvGj6Bxxra2K6kB/UWBRm71lc4FOAfoLIwlTKGd9FzT7EslPZskq3cyVusvdIGh+jVH
         jcNVfl++WVTjPXIdOWWhDPJOCnPjYdEMDK22nRo5b9TZ/DZwd3FDiJCVaf0IRYkjP0zO
         bAXn84lzpE/ocF5tWXwtBH1F0qa5nYtsC4IiJZ8i3Ygman8eLfi7j8svUwt4z+5cTFRX
         pBMA==
X-Gm-Message-State: AFq9FYJXSItIe+m5WOq2BdiVy4aXQFmZPvAPCZe7Yt5l6CzIxQgyDngl
	JePyeEmslXJgbBELAVeoZ4orZlZWl6VAtjRKkqrEDZEfYb/9hDMa1+9yc+6j0A90oBvAgK38
X-Gm-Gg: AYBFou0eqaVudcNt7TabaIlco453qXChE4BJQxZUXfTfT1KVhBIMzvGbj5yJXx140r1
	6zkuEgYuUMzV8NTfXLAIHOW+yu9kG39zn/inYGk9aRci/HCoGeZlZAZ6/U8KPs4eFhr0Ruj0VUC
	FKgwOHkn2KNpAVEARsdHB+bQNjUmcU1g6K7ppYVqBN2iNHUSOi2zhbkNSSn6NfAjCjq6J/w3Gse
	Xco1NKF+fOcrPPiLu4slLz1eFETp/dsKy37pVe93m1/lLSI81/dx/LejPyOKvrSwCMj+CLTpCjX
	G6skZZHinKxHXikgSuuvxIx8YXJ20ZWDcmX6GlHegpsNiVE383qX0xXDPlo2Vb9LVtZxhZyd5mK
	oipRtdZu+nQd8tor0a8GRL56pl32NNn6wzjATQjGJ9KAi6hn/r1NyDeuM6yUqsiKfiig/AN/BMp
	/92wCCWaPZPWDCUrQzT+L3OhnAMLOvYqiZ+rjDER5K97dY2ilI13wWGBLKMOx1EkLR88j2TAOsk
	qkZlJ+z
X-Received: by 2002:a17:90b:5706:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a6cec2ff75mr791180a91.32.1790903340385;
        Thu, 01 Oct 2026 18:09:00 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcdac9f7sm431636a91.1.2026.10.01.18.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:09:00 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Julien Stephan <jstephan@baylibre.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [scarthgap][PATCH 1/2] devtool: standard: fix update-recipe/finish --initial-rev override
Date: Fri,  2 Oct 2026 01:08:58 +0000
Message-ID: <20261002010859.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 01:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247058

Passing --initial-rev to update-recipe or finish currently has no
effect: the recorded initial revision is skipped as intended, but the
override is never stored in its place. For recipes without submodules
this leaves no initial revision at all, and the command fails with an
error asking the user to pass --initial-rev.

Seed initial_revs with the override before parsing the bbappend so it
takes precedence again. Recorded values are still used for submodules
and when no override is given.

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62abb60b899e63ea6db5c745f4b1b6af0d4b40f1)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e1e519ce5b..d5313921f2 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1254,6 +1254,10 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refre
     commits = {}
     patches = []
     initial_revs = {}
+    if initial_rev:
+        # A user-specified override applies to the main repo ("."); the
+        # parse loop below leaves it in place of the recorded value
+        initial_revs["."] = initial_rev
     with open(recipe_path, 'r') as f:
         for line in f:
             pattern = r'^#\s.*\s(.*):\s([0-9a-fA-F]+)$'
-- 
2.43.0


