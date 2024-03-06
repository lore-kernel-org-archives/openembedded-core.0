Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A768C54E5C
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:23:52 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.16125.1709742230836038912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TmWLyZnO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412f5e905e2so6607515e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709742229; x=1710347029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rX9ycORElm9xzTaPJnG0gNuOWgqpbWd5ZcvDjR2ka/0=;
        b=TmWLyZnO5DZZ/oFcQzo0eNJ1Ns5Ttv+BwXIOPojQxXasM8bvXvr65kCj8yElPMN4I+
         ON5YuuZsMnM2PnNps1DReBmOhRxgJbfOf24QPABaWPv9nRm7orXTV9IQd6bWNuxmGn0f
         vWGl9EoWs8uT+SnK9AmqOMf6kuHFKtdYW3N8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742229; x=1710347029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rX9ycORElm9xzTaPJnG0gNuOWgqpbWd5ZcvDjR2ka/0=;
        b=cdGqhAcLBCTIl266XrHxO37ddKZhrLj54LhtF+d7Z+CYESV9+gt17Vrb46bRBJw9FJ
         3AgZ/nKsj4t+cmpicbK6kY/nMjJmyu3MZq3hOpJNvcE4a/nnf///Cv4fNOULxrLWESwu
         c+Ukv8atJCjHbET48/sVnCuYJNL1voB0YdYJUKzNk3yA+LvYtmwYt/Vg8vUEwcZhkWpH
         NK/gpjy23orSLQrp8RgNbPFoKa45hBl2PcWnQId+yWG6dNGkykBMvaR/i+RLqmadCqGr
         uVN7jtF9A9COdyXZMzijA4oI0N/sEkMUe4Wi5dAcbc32VopBfEk05zbX2IEehIRKR+2R
         BEdw==
X-Gm-Message-State: AOJu0YxRSUxaNWLCx3oU5xiiLIP/DMsd5TEmSnt7SondYVR5ae5PQBsG
	0eG55km1ZXjWvw4UsFYyLEg8C2EEp0D1/X4u726QmKsg+PmAOyt3uhWHKOT8dL4+3uKfHLnZWdV
	R
X-Google-Smtp-Source: AGHT+IGj4XjKLNSBjW/9mQmNgX4EIVYMdnNTQv30gmoOiX6O0d581PHrQCT9e0yQHhftKECmj5qmJQ==
X-Received: by 2002:a05:600c:3b04:b0:412:913:5484 with SMTP id m4-20020a05600c3b0400b0041209135484mr11900062wms.11.1709742229204;
        Wed, 06 Mar 2024 08:23:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b00412f81ba413sm1929791wms.11.2024.03.06.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:23:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 7/9] oeqa/runtime/login: Exclude qemuriscv64
Date: Wed,  6 Mar 2024 16:23:39 +0000
Message-Id: <20240306162341.2267587-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196741

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

Excluding riscv64 due to mouse rather than a touchscreen which adds a
moving cursor, so the diff ends up > 0. Need to fix the image to use the
touchscreen rather than mouse input.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oeqa/runtime/cases/login.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
index ac8a0454f38..edbc48ac205 100644
--- a/meta/lib/oeqa/runtime/cases/login.py
+++ b/meta/lib/oeqa/runtime/cases/login.py
@@ -28,7 +28,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class LoginTest(OERuntimeTestCase):
     @OEHasPackage(['matchbox-desktop'])
     def test_screenshot(self):
-        if self.td.get('MACHINE') in ("qemuppc64", "qemuarmv5", "qemuriscv32", "qemuloongarch64"):
+        if self.td.get('MACHINE') in ("qemuppc64", "qemuarmv5", "qemuriscv32", "qemuriscv64", "qemuloongarch64"):
             self.skipTest("{0} is not currently supported.".format(self.td.get('MACHINE')))
 
         pn = self.td.get('PN')
-- 
2.40.1


