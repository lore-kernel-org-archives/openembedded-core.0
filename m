Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACD1C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:32 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1257.1783747465375862544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=X7ZdFFzE;
 spf=pass (domain: underview.tech, ip: 74.125.224.41, mailfrom: vince@underview.tech)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-667971437d6so2248559d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747464; x=1784352264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQYLBhdMh2xN7OMkZsfqRVk9oEt7Qgp6gFBU+Ykw30A=;
        b=X7ZdFFzEIXiFFADqBiyLhaad39Vx4okzsDkOSYyq9oOgIJqFpddxEy7FEGCO0lxZ9n
         3fr8ZR24YnEL+mrTwngkpE5V7HjMibIBWYU008MwQDCIvO0vsu7kyIV+jYLwMPdLQZqm
         MoZD0owaNOVIWouVIdra1TRLDoG/BV97e8AE7R0roQ2jVwU0ZZ9sT7l0e8aP5dKR7lm8
         pyYfV1glp7rjsGnDwwRVEqZ2s7oyJwF98zTEJvczfHwiXxsEv7nMdA+Ywdy3EtLphhTA
         rNUy1ODPxmnnQPKpZsIqJjYBkO+7kglWQnx+xD1CZoUdnreWAl4O1hySNcSx1TN/3O/L
         8DrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747464; x=1784352264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQYLBhdMh2xN7OMkZsfqRVk9oEt7Qgp6gFBU+Ykw30A=;
        b=sgiS2Bv74cwdJO4G8bImbm6LbKxwakaYk2zYOhlb11lhkLErIpTKSbWELesdYrl4f4
         Vxa0CHCwz4bshfQVkH5iTmEMZUt7b+rVWxdeWsAvj6iFvZq8OgZwTd4blGK1cBb0DjpU
         T4tzmiDozBu0NdpGPsgL9tro3/dttazyklabjXgRi0+/qPtAtgaCcIbndUNe6K9o9Kmg
         LV4/IVXycbZb6oft21I2h5B6e1SD0IfNo48B3m7sdn7h/pAFHXpnRHTJXTIX8Rifr1TS
         jGz2rkh5qSUy/xwZeMYhokdJvcF3yYBhiJnKjoQ+I2xrRwerGmZeTrrv4Qhu6zXjWVkJ
         G0ZQ==
X-Gm-Message-State: AOJu0Yz0ysWZLkgwiusgwbqJWCj8eE1vv8Zurj17mR5UuUi52n5W3RTK
	SVDNde4XkmU5YOMFLBAFxHXAe2p5KGhiSdbPgSHFnSo483boCv/9Spaf+at7eXNoxN0YUFVkwpf
	QxuWihik=
X-Gm-Gg: AfdE7cldV+0pVjQxcLV7HTaj2yop7e0EPxRyAvRWvOwJlDJ4RJ/7kdsP8feiTjOG/3R
	ByYd4kln5UUC0UTEIj65hPbrwjwlIj+Yy9391GYfn0YvXKxbTT8YEhO4r4lY34WpmoI95p+iTlA
	B4q+KmOrTU4lbOqSKdC1RFJzbGLlbevuxXrwgSbTRvHdO2xDqq7yJlf/CJdnSwIu4UvSdZMKUeM
	WqcPOlpY1Rv6NAqIWfIpclOLMQMwem/VxR+CGSrZJwi3MxTRCg088ul2a+0ayPdypcvOK9bY74N
	cNM1hQ/3zkN8UVEi4IbyoZLf8iWR6xZk6JypvtrKtEbgemLfrXcH62WghpkSy4pz8qRGv1fzyXn
	E2GvkHpAiE2/cQH9GLRPiavRZPMsyG+5IzfkYgenYlFP4vwAm8TE50SHmBNOlLnrCr+kq0Lm8fl
	vVGupdTDlMvzeRnA==
X-Received: by 2002:a05:690e:d0c:b0:667:8b91:244b with SMTP id 956f58d0204a3-667d7f162damr1445743d50.98.1783747464295;
        Fri, 10 Jul 2026 22:24:24 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:23 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 01/19] kernal-vars: introduce new class
Date: Sat, 11 Jul 2026 01:23:45 -0400
Message-ID: <20260711052403.1292286-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240682

This class is introduced to fix an issue
when KERNEL_PACKAGE_NAME is changed.

A number of recipes rely on hard coded
kernel prefix set by KERNEL_PACKAGE_NAME
when including modules. This leads to build
time failures.

Such as

ERROR: Nothing RPROVIDES 'kernel-module-*'

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernel-vars.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-vars.bbclass

diff --git a/meta/classes-recipe/kernel-vars.bbclass b/meta/classes-recipe/kernel-vars.bbclass
new file mode 100644
index 0000000000..1acfeb97ea
--- /dev/null
+++ b/meta/classes-recipe/kernel-vars.bbclass
@@ -0,0 +1,7 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+KERNEL_PACKAGE_NAME ??= "kernel"
-- 
2.43.0


