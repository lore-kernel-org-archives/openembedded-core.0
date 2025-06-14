Return-Path: <setairidis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8890FC7114A
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 20:33:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.17198.1749933227664051416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 13:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZvUmPNPO;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: setairidis@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acae7e7587dso484042966b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 13:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749933226; x=1750538026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PR6IynR8lAGxG2+bYIeWpyL2lfyc054Qmg0/QKvDK6w=;
        b=ZvUmPNPOTNp9rm/Lv4xblQDbzuwWJV1NSmNpnW6SVd2oSnfHrVae8Uywkfl/sA9iGW
         kf08gL7ypB4Yc36CuVn8tUOrUSugJCakIeq9maDFQzdcGbyd6kbniifhb4D3Skp6LJ6c
         eY4bIQORsP6BQvnDQtKI85vEz9GO35XigjdDLdo8RF8565epsGGfqBAn4cn/2eWizZzp
         uaoBW9iZVwCbxnd0xHG6qb9jq/iM1OS9zS4TVy0s4sZrt+GkC0/l//kJ1JKoE1Mn29nw
         tcjt89HF0L0hCiaezcKbVbskuvigsxx8BA6mKRQf/wH6BsBtzDCVTNZnxGYuFB2pmDeA
         4/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749933226; x=1750538026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR6IynR8lAGxG2+bYIeWpyL2lfyc054Qmg0/QKvDK6w=;
        b=dl2oGEDA3lq3JWLnN5et+gjGIlaw6BGLaYXXfFeeiihoZTtpZnM/9LgEYHnuHtvfMx
         /iwh2LDCXY1b1JgrHOaBsnN3PXuuATO/n5vWhgIdhTDKGVmRzRmakL7rUAhpuExu/eOm
         3KV7V1qvAHXAYkB/08Gykv8fz5tSX7ZlUyLwF0nKqSsO8+E7kNMwp0KcZbHIIxrqEMeM
         d7/89M+LIi33GpWv024ZzgdT8GW6Seqnx3SmUIFp8T6gySMYur4JoXXXIP+UW3fF76jg
         i+ARNSCcKnKTdsEzG+6FOuAZKbSqtVLG1zUeEFVoz9OK9l21myEHgqLpzOTf/OpGTqVg
         LBCg==
X-Gm-Message-State: AOJu0YweqSXevX4EHakvcZEo3FLJnmK1JOVsqD0C1CpEvjEUIZ5c1uyw
	tpfKQtA1hj1oJPUwb2OOrAtZYUX5vsBOQdCYHVYsbrEIM7Op8RS+9a4yV0f5HA6ENxM=
X-Gm-Gg: ASbGncspJBX+ZnsOIwvPjzxMdt3DQOZumB+hELZLlxMUElJglYIhc4/AWt194jmeXbC
	duYFMBGTc5WDBLp5dU6qqkVrQFdbRhBIvkIKRLS/ogXrDzaSAimY8vJvZ2r1+bvjgnEJxF3UhqK
	QfDdzdahX1/0nUsXBu05SYUenk8k/j8rp91UrjlLLi3iMbw33O62RVxxeG6ZU9NWHkqYKfi8uKy
	RgotHkIOyszxzKH1bS8nRzWueJOq+FDePpV/r1qBx2nz9UjOE8s9yMMAd76qdYD5kqaGbTnYQeX
	XGSu92jQXk1tniWczkm9kOub3REEMugK1wwZzHRFUCxJ1qsFA+bCRVYLeOrNjpX/7/Nedhwf+4b
	PbUlCOiUc4AMO0yX3P7ZqeK33cNl5ZGMYzwzuxq6jVACsrBFpDW+eEpORGvg=
X-Google-Smtp-Source: AGHT+IEOaHKmrVIUiRZBSYjm7UHGKsy35QBSO7RsZO8HWfn6+HdhOmbQ2q3C++RiUZ3iRcDsWyvxOA==
X-Received: by 2002:a17:906:c14c:b0:ade:484d:1518 with SMTP id a640c23a62f3a-adfad38b235mr380004566b.26.1749933225754;
        Sat, 14 Jun 2025 13:33:45 -0700 (PDT)
Received: from DESKTOP-LR19VKC.localdomain (ip-095-223-184-217.um35.pools.vodafone-ip.de. [95.223.184.217])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158cc8sm357048966b.1.2025.06.14.13.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 13:33:45 -0700 (PDT)
From: Savvas Etairidis <setairidis@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Savvas Etairidis <setairidis@gmail.com>
Subject: [PATCH] systemd: Rename systemd_v255.21 to systemd_255.21
Date: Sat, 14 Jun 2025 22:33:40 +0200
Message-Id: <20250614203340.11007-1-setairidis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 20:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218642

Pumped PE property to two, since this is not a version bump
but a rename. The recipe was accidentally renamed with a 'v'
prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.

Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
---
 .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_v255.21.bb
rename to meta/recipes-core/systemd/systemd_255.21.bb
index bb9dc3da33..aee677bc87 100644
--- a/meta/recipes-core/systemd/systemd_v255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -2,7 +2,7 @@ require systemd.inc
 
 PROVIDES = "udev"
 
-PE = "1"
+PE = "2"
 
 DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
-- 
2.34.1


