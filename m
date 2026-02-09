Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C7BE9461C
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 22:44:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7462.1770677090599484572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 14:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfoCupeI;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so2005255e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770677089; x=1771281889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjph4Yw7gqXPNreStWqAydqwbAeeBDJvTvQiG5i7wOs=;
        b=CfoCupeIfutfhJulhk6ig5o4I6IKejbjV2/u04I++qg3azuQGf73zyIGRhZV+56kWN
         a2WaC6iNJ0C5dD2MQfDUMKBO1+kRMIh4+ErCSMofFCavT32fqAxJvEGJCGwSfZ/l1lfq
         No4Ypdv1i1E1HxzlNxgeVy/SAYcRLzDuiwcKpTlCuKs3JzyoFJVrEdfYtOkG4RcPENVg
         Ewx6/oGcqQJJS1SE9gbqlVK9Zjh4RP2rH+JTNz/KIbSDPDfdqNXrNGBDX/4qUQuIoRtt
         UVY0jCkfe/hAIDSijhqum4fKHbghPZXGSHp8GvQAPqD9uMwyuma77PPrFqdiLO2y59sG
         BGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770677089; x=1771281889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tjph4Yw7gqXPNreStWqAydqwbAeeBDJvTvQiG5i7wOs=;
        b=Fm6JbZdmpjbkhwVkb/h0CGdT9zxGWYNJwK/U63/TRkoM5rR7CmTE7yaboGhCYKR8tL
         9gyVq79WcWDrSRFF3onxFVJBT8BVSGriddNgYiEWhK8TQ4v5zxOi1f6StEhFay8MbOQR
         YMT6zjf+fwjWEhBjlPXerDoUKhy7eQ4Yk8D7YHxoXBynnq2sXfscIFq61PEAqC4JwsQd
         Pnsoh3qdnz0Sp6GT6BeMInkP4lGfEVGSZZug3B1vtSpdub/bk+MbgW3f3dVPpBXTxJqH
         TBESSqNP5pKhN+D6eb0Xej5IveiPNXFnxI0IM6dyQXiUQigtB8lnL26nYsPMnCAYxW/r
         vhaw==
X-Forwarded-Encrypted: i=1; AJvYcCWSr+yBIay4TlmBsUv5dSOxadBX2wFyuF/oEJ+c7UJA1wHApHNZUS0a3YQh7lGkRPH1Od1vOlp2cHo7JUFegvZfzA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOPMNZ+alBBGJHEuLZVZyKZsN9/mAzXcczjExx0AtDAx2yzl7U
	QedWaYe1k+ht3TYLN3Ub0omHU5YbiZDJ3vnqEdJOIXtCBc9YBsJ2wIvb
X-Gm-Gg: AZuq6aLKrOeJHyWzBdJMDdt9TIxAs1j/f+UoIDNrLHNpDikp+MGSwOoVKN7IJG3jxze
	KGLyEsV+xg2UwkOYGLF9pDKUy924/f58la8qT+hR/ZDd+CVmDTTyMV91VqS4uIGLIu0fjY1LrV/
	Cpa23pdaWDkBRz0TDfGCpOEiyryvKbr6dPcwoGh39OGHOceuZcZmBk7fLdW6AlwUaQJxrktTmBT
	ZaSo5lpJmmGuzJTTT6b4RPktkz7O7bCpiVZnVL/Yjx5dYxYytyi3D3vpKCxz4tjl/b1RUANGpTU
	9IVW3SjvPFkjNE6HF5CEtLDSYNlk1XOxoALKaM7Q1ZT9dS94hKyalkIFnits2L46AqdNIVYnSMH
	KxJm0v03nsv/fvcVfQRK2gyH96JS6VpbAqKiLpN6Ela92mANL/vMZpD+pOAeOkiLEFvoDNj3cbj
	yQ82Q49wtJwmJo/XXFlB1tRdSntMCz+FepTEWr0i4Vb6llBxsUuMQQvTN49zzfCMaCYQ==
X-Received: by 2002:a05:600c:6289:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-483203393b7mr199094825e9.33.1770677088903;
        Mon, 09 Feb 2026 14:44:48 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a1c2sm29306985e9.9.2026.02.09.14.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 14:44:48 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: alex.kanavin@gmail.com
Cc: logan.gallois@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v3] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Mon,  9 Feb 2026 23:44:44 +0100
Message-ID: <20260209224444.17275-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANNYZj8qtkSk6oxuFYE_08pevA0MpTSqxxoMzGS6MNj=O7f3=g@mail.gmail.com>
References: <CANNYZj8qtkSk6oxuFYE_08pevA0MpTSqxxoMzGS6MNj=O7f3=g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 22:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230818

---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..ab543506451 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


