Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D1CCE7A94
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 13:29:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.60766.1695648562748638933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 06:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V6AAsbB8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so28465455e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695648561; x=1696253361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a9QbexLj8bIK5wq5FiVytRy+eIavjMcHmFD8NfzQ7u8=;
        b=V6AAsbB8WnAX414NVLd1CW6Nho/7cyxoOQ+aPLZ29A8Me43fbqSRfDf37vOkxxYk2r
         uSRoqrvklqVdMgv5oFKpe5c/P/pmfAG07XxFz2ZufOowEhn/g08bLbfv8ij6kIekvBZg
         29nStAbMjpmjmdUuaaJGjG8/4dfOr+X3+U8F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648561; x=1696253361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9QbexLj8bIK5wq5FiVytRy+eIavjMcHmFD8NfzQ7u8=;
        b=PqyzYJXuj8pOU66OciIN4uXQgcqzM9uWwXa++xcUi3qZlv0dJJX/BQJbR1EO70f7Eo
         3aJcSPrJvM9x9ZNNR/CMsS38VqLsixr5DOeyrX86TJiBYnMPh01zFBpJ/5CMc0jVE2z3
         AXF6xVrfYFmDYZL3N9dRyZ/Y/34e1AoXLvj/dfQ1XJRNvbeQXGu7cP0Hi/MIo1YJfbAg
         q+COqCvF6kU3scNtdOTfyv9djww+JMHIjsbWN0EMV3AE4sIUBW3h7kUEOcOq1zO5Ia1w
         hLQVCP/RT4U3UlbqNZksh9/5pOKFNsZpfgmoTzH7tq+feF9qBwz0jfKrMjx1X2eY//JD
         Uw3Q==
X-Gm-Message-State: AOJu0YyV2YYQGMuewWvLzfQ78g3NwVkB/AQC25FFjrIm3+AMWOls83Vk
	iacHcLYAG2/+a+mwfu6khuWy34iiOD1jq+Kx5Qc=
X-Google-Smtp-Source: AGHT+IEXXPS9VWxcU5pQQuE0Mq31gj8VAvA9h5NU3MoAJvCOb5DMoD6j80OL02j9pELeDzYSsIqa+A==
X-Received: by 2002:a05:600c:b55:b0:400:57d1:4913 with SMTP id k21-20020a05600c0b5500b0040057d14913mr6556019wmr.9.1695648560800;
        Mon, 25 Sep 2023 06:29:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dc0c:9197:530a:4339])
        by smtp.gmail.com with ESMTPSA id o7-20020a1c7507000000b004051f8d6207sm12343376wmc.6.2023.09.25.06.29.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:29:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] create-spdx: Ensure it is clear where the message comes from
Date: Mon, 25 Sep 2023 14:29:19 +0100
Message-Id: <20230925132919.1910323-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 13:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188189

This message can appear in do_rootfs and the users tend to think this is
some kind of packaging issue. Add SPDX to the message so users like me
think in the right direction.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 885f07a1f87..3ee1b7ee0d8 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -1031,7 +1031,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     for name in sorted(packages.keys()):
         if name not in providers:
-            bb.fatal("Unable to find provider for '%s'" % name)
+            bb.fatal("Unable to find SPDX provider for '%s'" % name)
 
         pkg_name, pkg_hashfn = providers[name]
 
-- 
2.39.2


