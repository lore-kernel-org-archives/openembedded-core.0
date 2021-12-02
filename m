Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED608C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 17:28:45 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.75.1638466125214953030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eu4DLT9m;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id s137so417159pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rpg5gp0U8iJ6/D8m+XaPjtn2wI8+cA8xFv1V78lFKoc=;
        b=eu4DLT9mFdPNo/n1zcgVuePpSX6Jnw3UmzEDFsccxEfhKUgS2RwOrkGf9cRqT/UPb3
         zLSrifL+fHzAn0LRfgP+cNYMQNtLgVIfqkmpzaSPqn13oYwDdep+Z2C025k3T1Mlk9XE
         EhIw0vs7WX/ljTGmgVlMdauj7Cg61Rs3gFU6rUW12CGCUnKxAVCI8DWVDZfBEbhJ/Eup
         c4GiHsMb8/PhjgWbdAwTK+I1arZ/MGJakReGkaRceMp0UJouPZy9jHjokEosq0STHBq4
         iIRRsCJx5+U5qggDESuePQNu3m3zt6iBpy4gVAVxU0XV9TC46IJZeyaj2Xzs9bxmgCKl
         /XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rpg5gp0U8iJ6/D8m+XaPjtn2wI8+cA8xFv1V78lFKoc=;
        b=LxtThDCcDPYNlTHQ3ToPVq4IywjUa2QkYCPD3HA4fOZfspp6Y7kXBgjXA3lVCsq8dl
         A6CULNMPuz0dLkcS0UbUVO8/IHSIncyySUiPWDfkyz7x83TLJSfgxXfIZxE0LMS2+JB2
         hKyXGujAzMwpJgsZSmHJmBw/GcKxVukeEY+jbUkUaZ2qO4z9ZzVeCck+9+I4ofK8D4pD
         Fu3RYQllTCF8xqy3lV884XtuT7nbtsS8hmjTkXtq7cgZCCNSUt+OiX2QbeRoGOZX1X4X
         87eEbAAPnKlnyyfvI8AlDzWcNbzNpZmeEN/FxncSfdcdbWuf9jxNV8bWj+f2Cb9m7aVV
         Rzcw==
X-Gm-Message-State: AOAM530g46FtkfXbm4vn5BO1jbJxNM6MX3PIgJKQBE5NoqeACsKQ0Nxs
	+IJvgwFSbPF/e905U+Y94b7/hqhjfnyiaA==
X-Google-Smtp-Source: 
 ABdhPJzn2kmnXCOp12Cz987aFNbCe9Yrl7qRNckpx9JAcv2fWsYa2gULJt++Rx41rg8I3Kay7kA55A==
X-Received: by 2002:a63:d117:: with SMTP id k23mr397877pgg.287.1638466124550;
        Thu, 02 Dec 2021 09:28:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 l1sm3010650pjh.28.2021.12.02.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 09:28:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libunwind: Enable for rv64
Date: Thu,  2 Dec 2021 09:28:41 -0800
Message-Id: <20211202172841.29931-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 17:28:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159097

1.6.0+ has rv64 supports now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.6.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.6.0.bb b/meta/recipes-support/libunwind/libunwind_1.6.0.bb
index 81b364fc5ef..91189fdb71c 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.0.bb
@@ -16,7 +16,6 @@ EXTRA_OECONF:append:libc-musl = " --disable-documentation --disable-tests --enab
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
-COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.34.1


