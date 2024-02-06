Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA772C4829D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:22:54 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.18473.1707214969624853639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IOOQ2HbM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51160efad36so159190e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 02:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707214967; x=1707819767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7vVwAPH96XoJrvNL5ihIs99L3+2gOMgcohiZQeox8o=;
        b=IOOQ2HbMNNSVFEkeW11P26we3bKU24fcdBQXlZtaEyGDRVBc9dF7iKwjYPnQXGS1Ou
         NGAmEXqCXtwjeMYoyvN5+dTGG8CzFAOmirjsEM9bxjqiQYbQfVjwNQpgGEspTvQ7bzoZ
         THNWxW5rVaBjZdxvT6OSj4rlDTzMFGgXdUGx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214967; x=1707819767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7vVwAPH96XoJrvNL5ihIs99L3+2gOMgcohiZQeox8o=;
        b=OE8IjbG2Dhhw+pifQuBEVQ9oLWflgiaL4DgeZMPps8VFBm46118DHNuE9JUAag2AVg
         zFJbxbrKDInh/HzO5NDVQEHhGCVuyJIn8EZLre0OYsCef1GjX0QcrM09YkDCn2UL+gLF
         RWqXJOmBx1InfNzzP5f23QGtayIl0D76tTXBFSwnZeU7uiDZZ6ElN2IC16JvAeh5CzKG
         A+21+ryg+jvycJb6tC7gDra+bb+AQfYsK2pPV4f0klcr3OYTRToBaiNqUcMjhnjEaxPX
         omLtAK7cV4uBVmfinGa4QBm+y6UY3DuUDImJje27f15X1MluLlV+g3XP69skiPZlvber
         SYrA==
X-Gm-Message-State: AOJu0YwQKJOBwPGpsWW7DnPILtvo8B/BIEWaCjQp/hmG0NRZXQ2pX5lP
	vkjgFzJLR0MCUampV/F/iuSlGY1AyVE/grGeF07Y4C9+Np0b5vlcGjgJxCk/KKGXpdshXviVaQR
	m
X-Google-Smtp-Source: AGHT+IE3ZeeLePFZcrXdqvKLOIZztmM0g2DYwJGE39apoJ/+SGRLRUHdgCYLeT29NKm67eNiypyCBw==
X-Received: by 2002:a05:6512:348f:b0:511:54c1:f616 with SMTP id v15-20020a056512348f00b0051154c1f616mr1339013lfr.10.1707214967230;
        Tue, 06 Feb 2024 02:22:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:45c0:34a2:1eea:2530])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c310f00b0040fd0f7d267sm1508471wmo.44.2024.02.06.02.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 02:22:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 1/2] ltp: Enable extra test groups
Date: Tue,  6 Feb 2024 10:22:45 +0000
Message-Id: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 10:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194981

Petr Vorel (upstream ltp maintainer) recommended some extra tests we should run.
Enable these for extra test coverage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 9d93d314537..f588a93200e 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
 
 class LtpTest(LtpTestBase):
 
-    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
+    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
 
     ltp_fs = ["fs", "fs_bind"]
     # skip kernel cpuhotplug
-- 
2.40.1


