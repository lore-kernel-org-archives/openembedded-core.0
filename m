Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749DFC4707B
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 04:31:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.22854.1704169876274399125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 20:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDf6xT+5;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-781251ed685so742658685a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 20:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704169875; x=1704774675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipK3xlrrf3ozJ4LGIMnnyTXyDZbpKQPNgduqVsoIVQ4=;
        b=lDf6xT+5onsvgo5esBeBiMbGc6J2eiroUM8BcxLXo2poHn78PnTjMM/m/P4iZ/7Md8
         /yKfA5xT2uGsUh+pEObWx3GO/5HUepJpZtG0Ux6WOa/K29b0qBcVQyn/TSNFVHM78Clu
         sgyl4gHlx7X0qNSYOnC9Uvun3Kt1sDG6dcOQkVJyOAfyu/9WMq70I+V+jEaO3+3yPwGE
         BiB5IktZKQJt49JqJVr0tbIcjr5XboYd7pViSfom2zka2mE3itfGmHQdTN3R8s6rLwjI
         kIb/j3U3mCyw9v3id8gfe4FKh+NFRU0A0dCkSQniKMByxIaKLMFDsdljuCElXE9ZyuMz
         m5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704169875; x=1704774675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipK3xlrrf3ozJ4LGIMnnyTXyDZbpKQPNgduqVsoIVQ4=;
        b=eSNB5sdRFivw4ppj8IiXCG1JnhCasly8NjXwXMoL8sWQzDTbfnXZ4eFpBiyEiAoKDv
         k2XWRYVqQOi0FNjOwAonEc5ZWmxhnB+HgBZuUo5xyRoyOKTXMsa04Hce64Zw6SpJj6Pa
         erzJmShIZF9p3PdniAhM0ZxtdUiot6Jmd1jzsvWiMT+ijU0g1eL9XyBg+oVgmu6hptY9
         2AuS/rOg3huVNgb95Gb9HVQVZIsL7KK1uZUbdHW/T+ItrR0tDh583LsiRo5WAzMxRlzw
         WmEwN3plaHmVIWejZEEZmRYduUaPSqZDFLP0g+guwvUeWFHdFad429QfMsE9QOOl8/Aq
         C51A==
X-Gm-Message-State: AOJu0YwPsd9uwbpbPsCCoQHFuiLes/TEahOEO+XK4twUscEST/y6eyOK
	Ylo1TqyoyB0v70rsETjDkCg=
X-Google-Smtp-Source: AGHT+IHqQgg5cECmFvdGmZ1GgVHnjosh3VQ6L2OJqHYbVDuOYiM5hLpzaOn8Be5/NPdel6bzy+tB/w==
X-Received: by 2002:a05:620a:2986:b0:781:2a83:6173 with SMTP id r6-20020a05620a298600b007812a836173mr24433389qkp.27.1704169875297;
        Mon, 01 Jan 2024 20:31:15 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a004100b00781df3924f3sm39045qkt.129.2024.01.01.20.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:31:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto-rt/6.6: fix CVE exclusion include
Date: Mon,  1 Jan 2024 23:31:06 -0500
Message-Id: <1bb39ec130ac9674354dd75e9d3ea43a7b28f2b8.1704169585.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 04:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193200

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 9a9d1ab33a..a8a8f15d59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "v6.6/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
-include recipes-kernel/linux/cve-exclusion_6.5.inc
+include recipes-kernel/linux/cve-exclusion_6.6.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
-- 
2.39.2


