Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1111C369D9
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 11:10:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.12422.1745493022495111874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 04:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bI0wu2Al;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so932455f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 04:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745493021; x=1746097821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwsw9bqndstjqHeXAG/VI+VkZ400FPIxbzGjgJvkn8c=;
        b=bI0wu2Al/s4g+B+TsefNJ6eb7FTxI1N3cBOX6BoflBzDX2nRx6gDbo2hO4f8vhJJjM
         pkyomHmJI+pSrZPGUQVaym8Erq7FbmfKfW0Iuw/LmPtlKmLdgSxkskT0x/y0QMYfg+Jp
         DBvCJ07qthO4eQ5obKhhYe7rNM/OIQQ6Ainzu4fz1qdo/YYxAXvr1TnlQvJknE1kGeZ8
         QoSe0tnRaREsfUo2vKNs6KqIf6j3ewmQ908EpNCnZskyyousrpXtQvd9F1/m5V7CALxU
         3FEEL/SyLVpZvgm4uK1Qjs9Vypzccj6nwS3dZkFQK4SbPJcFf7ISyKRRJBDa66vKEn2d
         1Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493021; x=1746097821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwsw9bqndstjqHeXAG/VI+VkZ400FPIxbzGjgJvkn8c=;
        b=PtRUUD8Ud1Ra308apSKSv/Ln+dI/HcCnakRCwqbkdDKdLjKqr5O2iDCIvcku7VFF27
         XWONr1myPqmdgAVw4pvjiS8vBweqaSEAfn0AYvTRAAI0F3Gorw+Zmmf0YvrRZBcigF6e
         1JCBowXBPFN7BNGOaaY3EB7c8xPYMyYU8dnD4Hozv78iHEDp2LrLfwjUi4CE1IZ23x8H
         wRwCuiQarjeUWt95bU8wOlo4OC/3LawpYxqmbYZ3Be50StYp6Qg6LOua/vbziXh+b3ck
         J0FncnqOXftHHzVfUbBw+mMlqW3HhxJvrRUGZQmvCDRAx+YTwHo5BiDVG6OHuuWLrzhc
         AYfA==
X-Gm-Message-State: AOJu0YybaioSN8LV240IdsNAwfs6yqOmaZuaH2q+lw5uwnaEpIy1Zrvy
	7W2xuWFF6rZjuU/Xurf9FfYwf0+Kp2XlkM7hUSKic+jSZc5cPjHgyg0nsw==
X-Gm-Gg: ASbGncuu3nURsFdEzNEeJWh4mjxbL9rXaxpQf/05IF6f7TtjwX7EdV/ARd2HeTUvCRe
	7tUsImO4hXK49CBLTwMssoPtBMLs8i8PLrTxl7HnOHq8w8kwN5niFGxpx9ak/CS6TrOLG2Mcdwf
	Z5Gh+UkJPYbTfkAEl6Mmqw029nbhYu0hspNT8bFqZ68mde4lamsvtX/cgPjIeEDrjEXh3LtWLt/
	J2aysSboG0LKSrBgoLJjNCvARNgUm6RiD3WTuZLElN8B6Lv2HZauo3l/yoxI9n2BtNjjNNRPuYH
	XUrDrANAHs9JYlUROkS59U5LBiQfqStckczHjTHd+e/y4CWsVY8QpBeMFSNnUQfdOPShIr+0fu/
	arg==
X-Google-Smtp-Source: AGHT+IED25+gK1zXQOENSTHwvvE2iMuPrcmvo6J/ejcC2aV+iYMnW/pnUy5ZL6pjw2FUefma8Kxfpw==
X-Received: by 2002:a05:6000:4201:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-3a06cfa3192mr1778854f8f.45.1745493020821;
        Thu, 24 Apr 2025 04:10:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d5323b4sm1753499f8f.66.2025.04.24.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:10:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] tcf-agent: update SRC_URI to https://gitlab.eclipse.org
Date: Thu, 24 Apr 2025 13:10:12 +0200
Message-Id: <20250424111014.905507-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424111014.905507-1-alex.kanavin@gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215361

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index e1ac0a29a7a..235936288ba 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
 PV = "1.8.0+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-- 
2.39.5


