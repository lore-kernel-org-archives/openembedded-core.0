Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE89FA3744
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8233.1667216869095914934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FHrDGwd0;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bk15so15544171wrb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QRe1wUFv4zzEEnLER8S/6Y+KLE/lcyH0p0jsmpTfk0=;
        b=FHrDGwd08oR+RgkQlCHnNGwVH/QpCms7KW0QnsZ8PofPgXKz0A8nHHBb+QqpHVpwA1
         eCL8GavvLK3miE8UWZn4py0uYN2ZDVRNOgKVp+6BCH2UU0Yh8mlQbuTcbaG4javX9683
         lWw22ouFiqYReLR2QbL8X5+/Pfv7GWBq6iQciLahaM2WZ9vxiJDGaFkvCQN5SkoxUsL3
         8VvoDZQf5lbPxt633TmyZXQGmEpmjcMjroY+JSrzmVEYWmjrexQLySBevnJWYVIVw3FH
         Hi5ktD3bxXdglEabaxd4+Uq69OJOPnsR4k6QPQUH6B7GaB7A699zaSfQ4amtZ/fnmnwe
         OgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QRe1wUFv4zzEEnLER8S/6Y+KLE/lcyH0p0jsmpTfk0=;
        b=1w2TaGh0IXfa59d0zjrplG5WAj5CKF/lvrIiktVlXi4NJOdP5cDFEnRGCNJmClme+w
         jYDgZa5pVWBuL5jJ8DxzM6N3bVTenb75wkAIrs5w/0O1GsgZEibsCAqs3ASjLcvcEn0z
         u+b0dKf4C8K3xcEJzSqRuH4mKe+j6U6owo+dn5+bconJL7mbtiQMydnI8JyIp/l56+1h
         poOww3KgdbotZWz6Q48CkrfTI38jCgtn9eTaqWs8gnzM5WVzuK8O214znZEkBuU7Hg/O
         DULfIfNg54Jc1ebTKLY84T2Xpqpv4Qlobga1e6/6vAKiu5/iH4LJTVZfD81aUh43I4nH
         gwYg==
X-Gm-Message-State: ACrzQf0IbO1GM6+OTkyOlVBiNAQ1Hso/9ZNH7sWeYVVdeHWn2hHETvrn
	S+sm/MKSQ3GwjTuVIJzkh32yKnnxiQE=
X-Google-Smtp-Source: AMsMyM6yAhue7ekTKyqGAyaVLWo8M3oLEtuTbBpmV8nCeNTgpwLlcV/zb8IUIwIBKirTz5yWANL59g==
X-Received: by 2002:a5d:698e:0:b0:236:4b95:17ff with SMTP id g14-20020a5d698e000000b002364b9517ffmr8093488wru.196.1667216867568;
        Mon, 31 Oct 2022 04:47:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/13] libffi: submit patch upstream
Date: Mon, 31 Oct 2022 12:47:19 +0100
Message-Id: <20221031114719.2725967-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172315

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
index 5e529d1ce7..4233799501 100644
--- a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
+++ b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
@@ -11,7 +11,7 @@ https://github.com/libffi/libffi/issues/607. Now that
 clang supports the LDC and SDC instructions, this mitigation
 has been reverted.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/747]
 Signed-off-by: Brett Warren <brett.warren@arm.com>
 ---
  src/arm/sysv.S | 33 ---------------------------------
-- 
2.30.2


