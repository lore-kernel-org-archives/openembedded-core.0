Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F090C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:44 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.11127.1751377114034275183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SfivIVwC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so3461425a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377113; x=1751981913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mupj3C9bC19b0P2nW2FLaFSUtBy0dQSnQyakieAEsWY=;
        b=SfivIVwCeYXlj3fpTuFr1w3cNIgcDb5UH6zrqAfeXIVMOeEJPda7WVNpkHsJMyP4Th
         kghIqtxWH99CT8zbYbLgA34ew6pOcBd3Xvu1KDJ2bl5Dh39Wfak4huZiT8jlCxCDQwAf
         aAbq/wSRqvg7MsTRv4t6mFh9ti/jziyO94G93l3T17wXLTcAJ8cptiuCCvXlyMOQUN0B
         NGZHV8fqWPqvuucxB1nlnQfZwu5dQCMmUxJ+zw7/uNcjYvbEc5U/HBp39Q3KUyDZDwAY
         iar0G6xgGdmx3b7fdG0UfhMZNI0XDsz31zz03y1Q5+k8456szv/AFP/+o2DwXZvOFNOk
         rulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377113; x=1751981913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mupj3C9bC19b0P2nW2FLaFSUtBy0dQSnQyakieAEsWY=;
        b=VQX80ef+c4Xfg/3Ifcvnq0F910oUoJjbAhE1gYSh2kcXmJ3pZCFizIL9M0RwbRj7+q
         JDNvCwtdPOkc+s4UgoHbTAOMKyuKGJTqoSxO1+KDINad50A2Wces9HN5b64px8yWm6+x
         4et7qxdHssgurJEs47Qw9aRy+t/lGjlevzZ4Ggyyfir8PMZktAXKjxSCR8yycWs3yjb1
         N5GNVw2FMdFYtqhx3cLkp2SX+bggtEQNIWxBr7URD+YZCs5mc6R7+lVLh6m3wX7gZk4u
         Q38A/TOz1ABUsufu4UqbiYSowx8s67VthDMZw9k7CDDUkbY0lhu4ZdssmTVwXa8WRzyQ
         P0GQ==
X-Gm-Message-State: AOJu0YxHMKJI8jPVTD9f9Bgnx6g1ZP0agVDr/ZO6sB14hqDDsxMc6XNe
	zJbh2P0K/Hnq0QBNg5wlBlA5deUprGPoygMuXsL+VHyvtXQ/6+Dr7CC+OBXPuV/QZr+dUncagVR
	nUbpP
X-Gm-Gg: ASbGncug9GlMIv/tkVIq8Y/DPMdR0yevyWyVfKPR8lgXhdCfRoXWWJL6CbuM8hm9yeD
	NOjO/tjyobTXg/9Z5h9yUFskilX3b9qN5sFZlRibVS0EOlSbYf66ywSDSIsa06WzvzA1LucqVJV
	PZc24p/bPTu39c+lPSKOQf7kuONvaLJR8nsxlgc15WEME3ZZ6nTuVwJs6II051HgKVKq8RmnaAx
	7bOqK7ibKy5FELJcibxhx/+E4Fj7QpYB5Uaw+I6Hw/WTMOHTm120TGIjFHcK/JZPgHOqxAD/2NA
	/hm1nZL71tisA/ULhtDJ4MIGCn3ryXiqUZER80rlBRVfQxfFGHkpCA==
X-Google-Smtp-Source: AGHT+IHtyKpe/4sAw7ZFXzuNmpq53flQdtDAs9+pDXYNop24F2fdXnNJCN/FsPaxcMsLkWUglH9iVw==
X-Received: by 2002:a17:90b:2ccf:b0:312:ea46:3e66 with SMTP id 98e67ed59e1d1-318c9243c60mr22967167a91.21.1751377113116;
        Tue, 01 Jul 2025 06:38:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/11] tcf-agent: correct the SRC_URI
Date: Tue,  1 Jul 2025 06:38:09 -0700
Message-ID: <f359677709aba80735a38578475a34e1b83d321c.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219582

From: Guocai He <guocai.he.cn@windriver.com>

The SRC_URI is changed to git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index e1ac0a29a7..cd5a00fcbc 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Target Communication Framework for the Eclipse IDE"
-HOMEPAGE = "http://wiki.eclipse.org/TCF"
+HOMEPAGE = "https://gitlab.eclipse.org/eclipse/tcf/"
 DESCRIPTION = "TCF is a vendor-neutral, lightweight, extensible network protocol mainly for communicating with embedded systems (targets)."
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
@@ -10,7 +10,7 @@ SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
 PV = "1.8.0+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-- 
2.43.0


