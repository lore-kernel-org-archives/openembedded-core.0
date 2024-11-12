Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D03BD42B84
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 14:00:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.87460.1731420002126136582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 06:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgzOGc7n;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315baec69eso50387855e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 06:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731420000; x=1732024800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvbsw2vbflD2m98H65GWaRTR+tFNAn5glhAMBF//DxA=;
        b=DgzOGc7nfNvJtfkM31QwNNEe03Xu/eGz92xqzPIrIpGBMUBtI5yrDTQdhuMe9CH+5I
         W+9DR1typjIaqlXQqqlwQ6zXwy+1yHCioD44pM44vsCqW4zRs+OKbITscQe5MM6RqlEW
         nogXvCE0xpoVuVjGL7xOO/7aRs5Inj38MMilZj8g6P1cyPXPzDYs2WFiP9d3lezEjfk4
         OdVsa5eY5lxupNXmChwmNnG6nWF+dEwrtNnBw59663E3QEuDF9zhGzRZ2tXNVpaGcQCh
         AKlQVAM+6Dly226rPqaMhrq/zv2pH61feUH6afQ16gikg3BjoYItLjfgsLDpEsiodlWH
         8yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731420000; x=1732024800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvbsw2vbflD2m98H65GWaRTR+tFNAn5glhAMBF//DxA=;
        b=T+Ks8wJf2xgjq0JIJLor0fzWaKa4mIl23PbKvqfzeIyCM0E3o/y7U0Gu+QFCd7fXA1
         FlyuaHfgPHimi+lgcG5aYS0WeehobonnwGIoJsAduFFTYKrgEPbV0c889VwYzb7bJOAc
         EUGhbdYiTCxGStdEeB14wf3IxTFRbDp0h4TSfR3s0AhW8883wqkfBFbnXHV7Ke5rwiLd
         TIRnQ94JJVCcygzO4EOWxbftF7MPZwrYUMcP/6Icp7xKtc0Ub8zjjNYWTVrzXN1yfGBp
         /Wkis10ibO4UpxQ5YuP93jeOqDJ/8WMLN30w5LooHCNvTVx+meFJkbHJ4ZOX3wJz9yBv
         Ks8Q==
X-Gm-Message-State: AOJu0Yweu4He+yLvzk+eiQOiZiu4ETSxwgIZzQARoLNdUfkcqd5kZ8Zv
	eOY1SDZmQMY/nTTqvjfFgy0nmicRwF+SsqcbKH11F8Mz0oxjmNX9sr92/g==
X-Google-Smtp-Source: AGHT+IHm46bvqOg3EcYejMZWYAdTbWik1VavMAE027qAhIChSUKiJgna/PpRUkqMEcXrSwaW+Cu9FQ==
X-Received: by 2002:a05:600c:524d:b0:431:5465:807b with SMTP id 5b1f17b1804b1-432b751dcc3mr128803185e9.32.1731420000368;
        Tue, 12 Nov 2024 06:00:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99a0efsm15529877f8f.58.2024.11.12.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 06:00:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] tcl: correctly symlink tclsh to 9.0 version
Date: Tue, 12 Nov 2024 14:59:55 +0100
Message-Id: <20241112135955.1770465-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 14:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207055

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/tcltk/tcl_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
index b3968b5be14..a6e1dfbb5be 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
@@ -47,7 +47,7 @@ do_install() {
 	autotools_do_install
 	oe_runmake 'DESTDIR=${D}' install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
-	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
+	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
 	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
-- 
2.39.5


