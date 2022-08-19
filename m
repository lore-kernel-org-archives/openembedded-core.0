Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC3AC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.465.1660894084213324710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cDWx+V+l;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so3446312wmk.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lP+ehaHXD6tWehc7f+PUHszoBigR8Ph+E2itSa9y7xs=;
        b=cDWx+V+lt1eLr55Y4IVjFAL8e1yv5a+SKUX/PAOY8ashM3OHdMZAYNrUjYtLjI7h6t
         aNRmcomPZo4IP8wQmVKxzVi7DRspjVCuMCTTLawykuYj2SiclZeGhqS6FXXldIoD9nkK
         i1gJ6SOxGCmJDg9m+45s2vW9Knc3b9vxyYkCB+ruREN11Ns07Qtqo8GAQx+cXQOE/N+j
         s8wwzUM2EROdyeaNGSZBSReHKdm6/hwloaApoU1tqI0GGfernwxbyaXza31XiGzzeV3D
         nD8mumlhD76l8kZz7AEYySOPAPY7EY0AobmSbfE/gnnq7G1bnaaN33Q5nMER7Rj0d4YO
         nAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lP+ehaHXD6tWehc7f+PUHszoBigR8Ph+E2itSa9y7xs=;
        b=hqRThDuwvGKZ1H1JW1Da2QfuSmv1w1aaOMZ/Dwa+oDCm2wfr0YV+iQ8vDmXJyttEk/
         XrqE/ZUf2zBsi/YzfTBs2P1yWvykDKZGFVufwNsY8Y2y26o0WZRwWFmUHacPKPe0PdK+
         e4RMjgURI7IQntdFaMj5U1mr04tpIdeEbu62Anv0sd1xlTLhNOqU2S4QVpf247QfQhO+
         uxjvWuPBLvY/FKpofoRzQ8cuqeoL7xkDTbgTNjRNPux5yIEXQD1zPDYsqcIfnGmo2TQW
         paWrD6aIxeZoTn0FGtk+ARrXoTPWes2bGSKevKKXOADx0zoU/XBx5PmiDCCWcOqI3Bi8
         JtcQ==
X-Gm-Message-State: ACgBeo2pVwfz0rb8FnjiHcDotvkQtIEaKuxDfPL4TODgadDKjiGz8d2E
	sVG8KhFCGAnv9tR+SgjqT9RO1qm5M/c=
X-Google-Smtp-Source: 
 AA6agR5PysRubdnYQAwBRDINIEV0qSmN6HIbIsGrP2ryt9zfvz4c2jXhrI3yCPUYb6caK3s5lk11qg==
X-Received: by 2002:a05:600c:1912:b0:3a5:f4fc:cd40 with SMTP id
 j18-20020a05600c191200b003a5f4fccd40mr7118586wmq.205.1660894097412;
        Fri, 19 Aug 2022 00:28:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/42] strace: upgrade 5.18 -> 5.19
Date: Fri, 19 Aug 2022 09:27:19 +0200
Message-Id: <20220819072727.2236928-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169605

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/strace/{strace_5.18.bb => strace_5.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.18.bb => strace_5.19.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipes-devtools/strace/strace_5.19.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_5.18.bb
rename to meta/recipes-devtools/strace/strace_5.19.bb
index 75ff58bd50..5e69cfd5f9 100644
--- a/meta/recipes-devtools/strace/strace_5.18.bb
+++ b/meta/recipes-devtools/strace/strace_5.19.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
            "
-SRC_URI[sha256sum] = "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db3d1187"
+SRC_URI[sha256sum] = "aa3dc1c8e60e4f6ff3d396514aa247f3c7bf719d8a8dc4dd4fa793be786beca3"
 
 inherit autotools ptest
 
-- 
2.30.2


