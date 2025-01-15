Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FE9C02188
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.22454.1736951886947332651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KFw6ixht;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2165448243fso150980105ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951886; x=1737556686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YihpeWLnc62T53Mi1Z6VBmncBElODO9Wnjb0HoxUS6w=;
        b=KFw6ixhti0YphFwZdHcG4AIMmxdO+NhV6qDvU5ab0RLhl6M6sLb7zmxgjz54YMxp10
         c2gFBAlhDUaw2s+yAiBOM+gsCywLZ194LnyA0xXz1VdZ+WmJAe5DjxYdph797jx+tkw9
         t0mbGy9W+RrJoZ6HP5mhXlaJoEwQe61QnLuiioRvmcVP5a3s+aOMqp106ASNvWME69as
         a7wMBSQu5fafASdIYGzqMcsnsRn0DwyHJVj7F8aapm4kOLexvNZjuI7vyxGPTNhsbQeK
         cVSXYdlKB8PyL0oZ57RMaJ25hfTz4YEfdJchSAkmLFqiw4O7rLLl54IZY1Q4yOrvTeau
         D7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951886; x=1737556686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YihpeWLnc62T53Mi1Z6VBmncBElODO9Wnjb0HoxUS6w=;
        b=fTBWULaXEURkJfbllJQAJVm5jE1ArGu+tfdEOi3X2AtqTKVEeUFxUkEMBrL97aR+o+
         +Y0sO4qs6D37go2YU28IvVKeR7jun9Jf8FrCvVEqVJ6McM4f1faL2/hxmf3NiBJJ0a9N
         mS0Ryf5n5v0APao9f0T7mcViztwxMtzZrw0lm5nKqMPRNIbdzpda4oLLmjG+lzMVBHgg
         T3wxhA+4GrEiEFZFPfIpltP9dKIYX2b9hQDTaPXo7XtgrWQ5NK6kIufYUREo4OiQ3a3M
         s2vcXkqXz+Zyl2Li902Wp0e0amBBDKL+LoDdHCWzJMU4Tc3aZac6LyUKc3s+TTJwlUVs
         e+ow==
X-Gm-Message-State: AOJu0YyjTG5vGChEw8birufvQMp8BcK+s3v7sZui/RiyzOup+Bony+Vj
	yp5BmKGX3CHEVkbo9biJv+y3meHI0psjBJP7QkrW9AXmfvWNokSyXGXtNFyZQRO1TK3iHZ4StYj
	Jino=
X-Gm-Gg: ASbGncudfts+A5i5NBbNTPFntCq9nrK7hfE7VJ5ZBeDy3NfGS0YQ85WX+/P3WvTjR8M
	rcTc6UzcTFYA2Kp1wDTOBIqj/qJX40meqUKqSia5/kCmDcT77jS9IYpMB05kGO6Tw+DIZHbfoif
	Ib9FeIYXadcesApJzcnadEzCj8/79TZd3xHxCeoGOjLfRrRIv/p4VatGV/yQ6gJQZ5IQ49NaoVN
	FyvHfCwQxVfn/KQp3B56staWCyrT8tleu2+cbAkAIATYg==
X-Google-Smtp-Source: AGHT+IEUkkLeozwpZrZO1BVwqMsFZCRtL3TIacx4ufyNG5Hp7EtemnQGfiPHsYMBg25z0UE0ZKPadQ==
X-Received: by 2002:a17:902:f644:b0:216:48f4:4f3d with SMTP id d9443c01a7336-21a83f56bdfmr419189615ad.13.1736951886224;
        Wed, 15 Jan 2025 06:38:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/11] gstreamer1.0: ignore CVEs fixed in plugins recipes
Date: Wed, 15 Jan 2025 06:37:43 -0800
Message-ID: <09f0b16877ab207cba91f13d036bc6f4cd6bdf70.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209910

From: Peter Marko <peter.marko@siemens.com>

These were fixed in previous commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index b95c67f586..697c6e8b49 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -72,5 +72,14 @@ CVE_PRODUCT = "gstreamer"
 
 # these CVEs are patched in gstreamer1.0-plugins-bad
 CVE_CHECK_IGNORE += "CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444"
+# these CVEs are patched in gstreamer1.0-plugins-base
+CVE_CHECK_IGNORE += "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
+# these CVEs are patched in gstreamer1.0-plugins-good
+CVE_CHECK_IGNORE += " \
+    CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
+    CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
+    CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+"
 
 PTEST_BUILD_HOST_FILES = ""
-- 
2.43.0


