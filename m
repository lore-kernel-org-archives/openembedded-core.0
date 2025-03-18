Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01113C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:46:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1680.1742316365808059049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abZGg3Gj;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so4861549f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742316364; x=1742921164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgeNZdD86TKMf45/PbPilzBXiciTxpJXoAXoTWy1JHU=;
        b=abZGg3GjsIwUPmBXtg1BF++ynRtjSXC5BiQLiZ/4t1iQCicrevEu5WrOaTY4O8jNUh
         c2g3NYDwgQsVHU3s/UlRpfSXp87YDFfIZiCskLkJPEdsXL5JFKLs1pqwNcGeDcsdN6F9
         MksCySyNIJwIws2e6Iz7WRCorPEw0+DSOTUtZOoNVjoKOlCIgFbfE6JdmyWLCk9fExDb
         117qZdfGGVrU2F7Y34M3xwrJN9lWfU8P3nEhgszBpZ3sRWWUPCDBVfUp9L7HDaA/z0Q7
         gFcXcyCoM29Wi4wIepnPSdXvRETtJMdxpzPQS2Ua8NWBQqggapGt8UBluix9KPJ+2v2K
         Wiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316364; x=1742921164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgeNZdD86TKMf45/PbPilzBXiciTxpJXoAXoTWy1JHU=;
        b=bWrE8JhbL7hFFwEyPeNazUAAYFyNIxSSdZx8u1Q2Kxdo0/eqJbVOkK/1Jbb2mq8/aW
         HGCTtD4yMI9fzif7IRlvkJtoFqjycYLCdYizSilte2RX6kfQONKEVE9zLeqAb4t/f0ph
         S+r6Pcrd+CwuSWiQPNj+8Y4PPwGYEyFjNXvuECI/UJ0eKbmtU5Qye+ATZfK722sOK3nM
         gBpSlvvm4/X+f8+vSZ+xOundecGSTxt14rHbLILozdkhp62FzLn0H+rqsmPrjU7cTeNy
         +W8gtssFJQcvf3xwKGhHcOOENGy1ZqMl+nmiy3nlvYf6yqhlTStCjAf+1HucsoIlTRUo
         6+7g==
X-Gm-Message-State: AOJu0Yyq4nVhQreJk1Z87WQ2/6LuGtAhcYViia47+9U7rpryT70T/1XM
	w68zvQEpz7ZFH1AH9qlW1XJV+RpBQimVDR1hsZWRrlfvc4V+FDvJBrA3UQ==
X-Gm-Gg: ASbGncsLhN4ZISi94jlqb+Gk3l6rrZyBnlDmbX2sz/D4clP+eE3qNaDbOp+CcU2IHm8
	g4J7LBq6lBS7UExem9jlwo6lm8cBLiAADsMZiSaoXm2ZSDNpgmRzf9FI8YXDP69Z3DfUKbFVfwD
	yueBRdV594Yu9E29ocrM/RZw7B8boOGf+K5JRG3rhJpBhvmFUy8VtaP2PqVpDi32bz5GRxt0D0v
	3lV9dz16NV1ICOsdBdq9X9B3xic7bFiRpv/9muDbvGIzmf0Ngjqim5oTNLEnGNt4110ePYNI1w0
	yUipJR9hvBGDbLk2PhH8cqHcbpgLOR9Uxwo0vGVMgh+6N7hzCC1wuJ6ijgEc/CfiYKiyX4rsPfh
	ygGGiIw==
X-Google-Smtp-Source: AGHT+IF6pZzgkMCF7995j2lM0qlF9AhkZN+5VlL+HhrSN9FWD8le4vgKuzeSbytJ2maQkQy/A+MceQ==
X-Received: by 2002:a05:6000:2a2:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-398fd9bb9cdmr9964356f8f.53.1742316363939;
        Tue, 18 Mar 2025 09:46:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35ecsm18804416f8f.16.2025.03.18.09.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:46:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] libsdl2: only include 2.x releases in version check
Date: Tue, 18 Mar 2025 17:45:55 +0100
Message-Id: <20250318164555.1527383-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318164555.1527383-1-alex.kanavin@gmail.com>
References: <20250318164555.1527383-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213226

From: Alexander Kanavin <alex@linutronix.de>

libsdl3 has its own recipe in meta-oe, which will
probably migrate to core in due time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
index d075b335f5d..8226774a9eb 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
@@ -29,6 +29,7 @@ S = "${WORKDIR}/SDL2-${PV}"
 SRC_URI[sha256sum] = "c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e89cc6a50a2821922"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
+UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
 
 BINCONFIG = "${bindir}/sdl2-config"
 
-- 
2.39.5


