Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF8DC44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:37 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.946.1783881814954988766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=ZpND6Xnh;
 spf=pass (domain: underview.tech, ip: 74.125.224.53, mailfrom: vince@underview.tech)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-667971437d6so3990256d50.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881814; x=1784486614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xVxz9GtVTGTsjVvp9X2ONZJt1qKJzxvkBLiP1Pzf0E=;
        b=ZpND6XnhL4BGfGEwnrWC6eiGeC661TZejn7J3OdMonfneAKYxXU5D5p75ZQlpRkxJC
         BV2ychZMQhUhXrOW2RbLie4G9Fi1XAuqO1Ub02KG+CccCY7vMLXGAC3nDHsDg+xtoZt+
         RKx4ev1bp4Am+DRq8bXQAk0yGd6vJYOO+f3tdV39M7fSobWnkIBOGKqjy1WrDsa0J6tN
         NFA4yKM4YA04TJX7Azq6tq25xBZilB7Z5/6L4UWXQStJCVIJCcbd7l/f/waZoUVmtBjt
         V/XlhFzURXOSGg/c7bDOjCZfjlX9azWFmD9qBIRp0+UghpoIvdSP/TO0T3Fp8AtIZ8c8
         Q3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881814; x=1784486614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xVxz9GtVTGTsjVvp9X2ONZJt1qKJzxvkBLiP1Pzf0E=;
        b=s9IKNdPLtNMYrqhwxXTdF6cZbcccn05YvR68V4ssp0vppSlGLrEitnViHueiJhEWxN
         C15ALA+lXR5pp2Q8BYtDuI09YSIOgagkgh+EaSlzo8aRuaQiH4V5sqt/pTiea01jkzGq
         QZU92FsO9f0RAM3HfGIfDRnBqP7jIUkZguR9jhYMsqRVlAzOzCJB6jZ7Cp2PS3pLq6qy
         mD6B3Q3qmhnAgVGkRn9xmkcPGnXvW0uIxJ+Ww1NQyv4p+ck81e8mHn8wJaVysKaJpOOR
         1j9OD+wZXM3fLUpWp+wEtVq2j+/o75QCgv/k4ZPjXA0v2iDXhtDeGlnvRYb5LI3/kyTL
         acow==
X-Gm-Message-State: AOJu0YyZgQ07Gx6Dd2bnV4BEMmuzaUGK8EQXDf6d+fFEZmdJTxxPB9yi
	nxZrAHT5oRjP9pRzDyfnHHuzKnvbQb8XTu7HGYTViIDdMjUfu2GvJiOac18NS6GvXdRxHTG0dWe
	eY+/Hb1Q=
X-Gm-Gg: AfdE7clJ4mgP2FJi6uNuzEpnGF694LS645SrIrzaB1F2M3LkTz5LBWXXJxcQjIXVaVM
	Io6rEhCkT9OgivJrjY+t7os+e5e0cyCltTElK53iJWd4j5oDGUQ+Oyy0vn/YoucRv6ho4o/rnqa
	GwbGHmjAxd+DLAxsshoWlIjlcWRTXKSb4rG1f6rq70IyNQRHF9vYJwzSREBoSpdoioQrQMkSb3F
	UAxGZ6NVbVb353OA7YpdaY1gfctx0yF17nBDER0HNcziyPm/oWU7fPn3PYmpGciDl+FchIMJdws
	ZAD32/y1B2SHwUCys6okRVwPrdtSvCTsC2vzNGZ4nD9txhCW4ONfbvPZJrUQiAGhzvaiqmcWPa2
	1ozCwd6ZtA1NsRa2oRaYk8hgXDuOzWeH9H+orD1BfhZDUyI5lGEJIGnbCLH78PZN9s1hc3NUWK0
	IVH3uu0tDpUCu7Bw==
X-Received: by 2002:a53:dd12:0:b0:667:b314:aeba with SMTP id 956f58d0204a3-667d7b0185amr3558357d50.5.1783881813984;
        Sun, 12 Jul 2026 11:43:33 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:33 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 19/27] efivar: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:59 -0400
Message-ID: <20260712184307.3259642-19-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240809

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/efivar/efivar_39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index e5839f7a99..b15279239d 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -28,6 +28,6 @@ do_install() {
 
 BBCLASSEXTEND = "native"
 
-RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
+RRECOMMENDS:${PN}:class-target = "${KERNEL_PACKAGE_NAME}-module-efivarfs"
 
 CLEANBROKEN = "1"
-- 
2.43.0


