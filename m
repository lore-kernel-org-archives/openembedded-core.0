Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F997C61CE5
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 11:36:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8971.1748950589690730304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 04:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TVOC07eH;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4fdc27c4aso1746049f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748950588; x=1749555388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsEackaOHg3TS1D8iTwOHTNi0cq3brSePmqidvRoAkQ=;
        b=TVOC07eHsW3mVRuaKbDfFQvfgI32hUZGI43ik0Dx0s70DbhJiJDNC4Q8BW+pG1P6n4
         hHj4eQ5dDvQ6AKWZBTXyZBzDwJIT0QJLZdj0pn5lHATcwyQ/EgBCvj6ieH5/hwzSroyq
         QsxAqDgO4gMq8BJu7DZcLzxwaCMIrfLsHyHVCEPvqdXGeNjHaObOV/5zL7o/WbHEiFp7
         xsBeE4ewVBEK3h75BIwWUnLmVecTSWLqykSs5YSUBaglG50j36ZwmNjkyqslsrX0qycz
         mcOyAHOGE2aF5IGLrFhWADSS3JHigKvalIRdwmubzHMmFVmWP/DgcNOzGJQJkRQbNrkc
         hpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950588; x=1749555388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsEackaOHg3TS1D8iTwOHTNi0cq3brSePmqidvRoAkQ=;
        b=ZOegwKUqUIqfym3vIsiM9MYANOtGPZUYJ9BvXrTv5MnQCVg3l2wpgsiW9fXwM4NqO6
         iqtfagGynOrLfEJla0elzJptdIMfIc7Yie3SUEvI/ff2dATQwCTfaRPK3vt3VoyAKEdQ
         v3hXbBrWQJJgHkfgCW/gh+KddXpHvpZUi3D4WUlMtNtR33xtpyZjRwbMoaILK8oyqtiG
         VEo4QZtOzxoWA1A5CQhaWT+60RmZNZxjiddJuzZkYuLIuOTmmPUx08QLowAmnVHPoGBe
         Khwiu2lDrHVFPiXrTeM0mDjQ77L3gOe9vLLc+9/r9/+lTnkCdd6/LUWE3Y1nrBbkEF8E
         /e8Q==
X-Gm-Message-State: AOJu0YwM21ToE7g6lAVZShlStZCi+UTj1N97EqEFikc0jCJaXEQxcWL9
	DCz16F3UcCIhlJ3IayeOSC6Jf1NDccT9GLRZAoZ0IQ8dILcBPXMmussdVfzXfQ==
X-Gm-Gg: ASbGncu6bJpX3WA28wqS9ezC4NJpzRpUm9tH980dsKDFJ0VoVM3/PEmy6lt+SElU9Jv
	GimKCZVcc/ZpcNCN0tgn+Rw71wOAn9UgiVTWCZUMVzo3Gy9+9NHri+MRtArUDkATQeGqcugrFHp
	9zJGsit8e0V/9TJPPOtcOW3tPjy9t1WxlCA4LlkE6FyccJ9lGJJoo5F0Sebp+97HEkpVLrXI1LW
	/gQr4h/l/XV60qEYl+dxIjxvyxWO8YYffOq+kLgEmV5rE0K84DsxowYmEZzufCRq1H0gbA2Da3c
	66VhsIdqc3Ijh2nJYLsw3VuCSMsEH8qbjWqQLb/AwBz97u6JAlT7x4nQXIDdnRkcDEw75E2nOM3
	V9gZ6lINGqoBc
X-Google-Smtp-Source: AGHT+IETc8qHJZygam834cPPtXvP0IyZm+0+qEbjP4FgzQ0a+HYSNZIZp4azqvvek7/c88kxzt9KDw==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:dfc2:b9e1 with SMTP id ffacd0b85a97d-3a4f89a7e71mr13519689f8f.2.1748950588038;
        Tue, 03 Jun 2025 04:36:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f22sm17728247f8f.43.2025.06.03.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:36:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] conf/fragments: add a fragment for CDN sstate mirror
Date: Tue,  3 Jun 2025 13:36:19 +0200
Message-Id: <20250603113620.3104900-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603113620.3104900-1-alex.kanavin@gmail.com>
References: <20250603113620.3104900-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 11:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217807

From: Alexander Kanavin <alex@linutronix.de>

This will be used in bitbake-setup official configurations and
it will be awesome.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/fragments/yocto/sstate-mirror-cdn.conf | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/conf/fragments/yocto/sstate-mirror-cdn.conf

diff --git a/meta/conf/fragments/yocto/sstate-mirror-cdn.conf b/meta/conf/fragments/yocto/sstate-mirror-cdn.conf
new file mode 100644
index 00000000000..e204975ce3b
--- /dev/null
+++ b/meta/conf/fragments/yocto/sstate-mirror-cdn.conf
@@ -0,0 +1,12 @@
+BB_CONF_FRAGMENT_SUMMARY = "Use prebuilt sstate artifacts for standard Yocto build configurations."
+BB_CONF_FRAGMENT_DESCRIPTION = "The Yocto Project has prebuilt artefacts available for standard build configurations. \
+This fragment enables their use. This will mean the build will query the \
+the network to check for artefacts at the start of builds, which does slow it down \
+initially but it will then speed up the builds by not having to build things if they are \
+present in the cache. It assumes you can download something faster than you can build it \
+which will depend on your network. \
+Note: For this to work you also need hash-equivalence passthrough to the matching server \
+"
+
+BB_HASHSERVE_UPSTREAM = 'wss://hashserv.yoctoproject.org/ws'
+SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
-- 
2.39.5


