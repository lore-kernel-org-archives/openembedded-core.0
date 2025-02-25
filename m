Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DC0C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:08:51 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6597.1740485330642755224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 04:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHTEWOx7;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so3996722f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 04:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740485329; x=1741090129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvO9GBsC0s1KvQBbgcL2kfaT8gYZfD4v0wRUOHbr0/0=;
        b=FHTEWOx7QigJ+S5RFY0HLc3D3nh4JITZHEJi4e0697JOmjEXXVeBXWsX9eiBoDFTLG
         SBLAEKIf47MDCBzengYKDFwJTN1z+jHTAaAqx7vNXW3zuftwlHVCBYWvCnb8Mvr5LeVE
         1Cb7KUYPlGPHRLumdpYROOwPw6Xhco7sbjs8oH41DK4U0ubL7jEnn/avAtqUTZyZKFFx
         vUDKieLcYOH/jCPVdRB9M8l7PMSKSPdHDZaxmaTPMrlaDSrEBlOUUdugrm/h8bFPA9JJ
         LRwZOh3yVywnqmgk8iCELAiF25Pu6QG7XC41Ojtb5RSOoYXvVEk3JIkbiVABtmpgST49
         cz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485329; x=1741090129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvO9GBsC0s1KvQBbgcL2kfaT8gYZfD4v0wRUOHbr0/0=;
        b=Vqv6mLqFB/sVVShXMwGl3IE2PZh4eTBSdyf1K+MIk8fdEiinIe5ihPt2eTgSUeq4jX
         tasx/Mtzik1dtsWFhWy0CtO4NPaBHOzkVUvyRTyM9MVDH+qHcxcJUyULdrPPyw4JqNPM
         abYFK6ITsQnzYJiCdxczX5317SCF71u3aCkMg/Q1MvFFtIOD29y+OXZMOG7U7MRn/q0+
         hIcqKZa0QrWpZSdkvwCR7eN0mqdxkrxdOWIwnPFm4yWOHmhi6JQ377Kvy0drwsjI/El4
         +5FRlmMyvUTBm3w4Q6oRbB4iCtQdNYQ9RVcJ14kcgC14pEKASIhJWSyOpwOV+Pq0uiP2
         OlTA==
X-Gm-Message-State: AOJu0YyS3vUjvuqh06/PncZ5o5s60rWfiHfsuVvPTVZhi5Fz6+aNsWeE
	W3ON7MR5sswvyqkzdCD381pRVyK+eYGgD2zc7vFnX1aT/dJqGmWat0+2rw==
X-Gm-Gg: ASbGncsDgNCyWX1qcMW2UmsdNYDbhwrzeBVssX4H4PLnzQKz3znHSOw/+2Oy9BOKJfY
	tzj9l4flTmqILwVySdjwFH+9lInLb5BcldBzIF1LjrGK6yvOZY7XSUNkMXvnCGofcZXtMioWrSU
	97uROBK2p5gEMEBodDUB7wopZSaDFmEf1PYqNkSw5HsHFMXP3Rqb2TD5yhFC2rMGPS8VUYP/vgy
	2G7bG+xHiglrkGew2wtfT404bv3z6IEk3NdgFJkjfmbhVCCdwd0gMzP3yy7lF8/4xTon1shhae5
	uzw4q8NXuJO8A48TnMiO3LCYO4ZT+wdsFoNG6/jAgx3YcDgZ3cUWAEeaQe5MmU4=
X-Google-Smtp-Source: AGHT+IHPz6rJy85ulZgWflxm+Gyq4Spw8KMkJROqftYLaDdrcjz7mM/wRqRb8SWFUN51Gu1Ky2c03Q==
X-Received: by 2002:a05:6000:1541:b0:38d:e48b:1783 with SMTP id ffacd0b85a97d-38f70825febmr13633546f8f.42.1740485328887;
        Tue, 25 Feb 2025 04:08:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc31fsm2018305f8f.87.2025.02.25.04.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 04:08:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] conf/fragments: add a fragment for CDN sstate mirror
Date: Tue, 25 Feb 2025 13:08:35 +0100
Message-Id: <20250225120836.171976-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225120836.171976-1-alex.kanavin@gmail.com>
References: <20250225120836.171976-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211875

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
index 00000000000..8c00d739b36
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
+SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
-- 
2.39.5


