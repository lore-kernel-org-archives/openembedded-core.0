Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE866EB26F5
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:44:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25535.1770745482936514002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 09:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfWeaq/F;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso50855885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770745481; x=1771350281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzTv/QMkVxouIVH1pE88T6AnfJV8fZh9YzokBuKxJZ0=;
        b=TfWeaq/Fr3S2C3PbieNukMf7x6MAsJrceuhxUJ9dr69fp0In+zegdTS5i5hcgfnPjf
         pWIaCl2srEnwbmxL/BNh4l+cJqncjklG3E6qr+qdoFLWeuThJ4MreOs8Q3ykzADJughR
         Bt4qe9TiR2dYTh6P5XqS7Oiw1BS7oOqyjtpjsNEGEAJGHbFZh5dShw3ccfYBQ/zReQrH
         x6yY3ZxIQ4x+HatRvsskHszuizzIoGPyiJ6eGaVzRQPB8lsciSgtnuj46RD3Vuyj0bqX
         ccUtan+zGqC4ZcMi6FkEmL6pHm+611f9YjRkqsk6ltg1LwgpD76KHCtELPVq4ihyQB/x
         Vb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770745481; x=1771350281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EzTv/QMkVxouIVH1pE88T6AnfJV8fZh9YzokBuKxJZ0=;
        b=LuqRylnEn65vmKohvAS+BweuSrWLMzmpSxOIL/zage3gbTeXQLA4W4+PYCic1pqPse
         LBjJ6qY8ucxU0F82etZStAm4kxI7dYjKhx+Mke+bFmVYOLiu/0RoMxbRWgozIWH5BD3u
         ZxhTVPuNIFkyHwmBtJTa1/7XeUo2Jex89jIBxvO/lmxZY8RjzG7czgyGWbqvrUL25fgO
         5EaBloWlGJKf0gGiOycHBY/ink34N1tZClDgC55Gbbei/KcPnX+gyUpOiGua4GBPDn2D
         bO8k82uFMY3Ph2FoYnBa1KY6qDTpzxS9qytOh92Cxfoh729aOPMl+RSMvFrQCCD4WUDL
         EJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8kFPMesUArf5DR+zCn9xSyJTNUSClNFiwWpakV+lhBfUaoXB2J51rKu7/81OcrCAyk+MYgqJlAd6wVaAXYwSTJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxdA0mzD5ePAIGZVJ4uehhWucdPeZmY6luC2+JKy/z+mc83JRk
	z2HUtJPGcYNEEJlTACJc0laG0ftBdSxlHs/ZrlzvShwjqbhneOYxCbRm
X-Gm-Gg: AZuq6aJ7kzCXomGtfUrNbxecLAUBOvlAVWO5z1TWOrzxJ95SDth8XkDVXQ8oqMPCmtR
	V9ZMa8ZkLOjl5ibMZkFgyky5k/qpvBTRze+eAKWv10ECH5PIGLoKwO1T0Fx4TDSA/XauiN8YYKL
	Sci41T6i5jV4zsZWkgUSAoadDMDoKYnIjffiN5YolCWph03cddPdyhMfZa6C1J4NV2zTjiz3nTV
	ghzMV9pKaqSg1wEz5VIsHz7j+uRq2GDDaU9atZxK4lUdri6Pj+FSWCED89eJ00CYKmyay6s/X7A
	0de+lAzpqiEmrsJwp1lPznQJqQTb4rf5RAfaIbCAlc8PpA821XFtgQdnnekrjj+redAq5eZDFSn
	gm00hssy9i5Y17VCd62jRB6kl8/FZbSwxy0Jp0b8elKMV6BJfzLrbwLYXsTAwQ2XG0ShOuk6RtO
	mcMzSSJibxBXqsdLhhwrqkxUydH20cYUejodLWhsb1W9yNlVpZ4zrToP7inxqh4R7LFwjT1F1Fz
	outKQ==
X-Received: by 2002:a05:600c:444f:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-48320181c15mr219957625e9.0.1770745476368;
        Tue, 10 Feb 2026 09:44:36 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a64674esm395125e9.3.2026.02.10.09.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:44:36 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: logan.gallois@gmail.com
Cc: logan.gallois@hexagon.com,
	openembedded-core@lists.openembedded.org,
	patchtest@automation.yoctoproject.org
Subject: [OE-Core][whinlatter][PATCH v5] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Tue, 10 Feb 2026 18:44:34 +0100
Message-ID: <20260210174434.4992-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209233345.3742-1-logan.gallois@gmail.com>
References: <20260209233345.3742-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 17:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230923

Since a recent change to support dash, cmd_base is a set of several
commands, separated by newlines.
TEMPLATECONF was only effective for the first command in that set,
which is not where it's needed.
Putting it on its own line will ensure that it's present for
everything in cmd_base.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..7bcdeee4c32 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


