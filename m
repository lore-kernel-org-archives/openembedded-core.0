Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7696DC83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:37:00 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5379.1752611810855194191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O+m7q7b4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236377f00a1so56050055ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611810; x=1753216610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfDmxFi3kzgAIS8fRscEMLBzkl/dwPsC5mtrKJzH904=;
        b=O+m7q7b4ExF2i/ScyDu/MXBqny3vQ/V0mRLI7NEM2qDkpqprJ9L7SgOIAwZRAtSdPf
         nUmk1Z1ojz3Cf/Q4X/WlipE58rgKhPh7po1r9oOXQbRzq6ZfvZvqObWRLs8ueXd41g9A
         uOlEZVP8v4ZIPwrdROWqbWBP8ybkjL/LDWxGp2OVc+1FQlODq+noGzc2Zotn0WzWINhc
         kRIbSQmh9JalEXNhQrg71qOf+OW6n3Q+sCP/WnEzozuwKAJ7haAFWSI5hegmRuQNiZfE
         SWLsutOiWG/7mDV5CRp6gn0JaQ81gSFfyywdbdbYdDp5YpKb1FTlLZ3T3pUuv4/CYN+P
         53OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611810; x=1753216610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfDmxFi3kzgAIS8fRscEMLBzkl/dwPsC5mtrKJzH904=;
        b=PpShzlbxDKatzGIxBkZn3AKhzrs//LQrBSSfMawqGrtA6Wg/iN3OeVJ2IzQHnDAvHk
         CoyvIdPhkGUdP64iOx0Mn9aoeVNK2ztJqf19U0mqgYIZEr26zghEzB5jAoHz+BqcGQk1
         wRtJxnDVP2WI1sfTeVowpTZcyvzHMcDrP0KRK+CeS5d/sG8SUI+6dKk8aejcVsv6bO5w
         e/S7gJ9Om12kfQl27TOHFMSiQDWAMScA+4hQGFX7qYWCR/SPVF0m64OG0Ms3a02kKjAN
         n8vdwEBO3OjCGBP5OQOb4nD28RDtk8NQ+ASgTTGrE82Q3HPF+k3SEZbPvacY1svovuzu
         F+MQ==
X-Gm-Message-State: AOJu0YzOv+JAs05ZDZwd3FkKK5PvXNQ/az7OXl+m35M6V86bIGDxOiYa
	L0R6a1zpCzhRlCcWHL/c6QmvwoSTQ3gKNz2qP7QKLMX6j1cOSAOORjzaHmC5GwH0OTgX4SYXnvo
	vTPRu
X-Gm-Gg: ASbGncsOS+mJuHg7C9vzwMSI1VYDdPXYsyyPXU6XVw505SjnUpHDoXIaQ2vn7w548k+
	Er7wFLKwO2ra+HTTUPRvaE1894jkcrEa9L989+3kHA3EgP1QEem6OEiw98wjUYPzqAL2UzGAKJT
	T3ulbjjQElFe/xf3sDWw3mV5Jwe8W7hsuyjRzJQPGZ5bkGazshOd5fZ/N9qJziBywn5e/EpkwHk
	wHHL06KvcxlXpF65/iWXK1bvwcwQNfNKVV5Y2whp3vhkRnOhPY+gFW4bLM9h1x9i6CQZrw2LQ8b
	iXFmoTy4KH+5M7ZkFhS5ZTE0qidBxx7uJblp9dMceP2qcorZtXnOS5SvSS4/XlXEm42Iz7/ojSv
	a/CHpW4lSBGc0Dg==
X-Google-Smtp-Source: AGHT+IFD+i0nko6zU1fpLuovrYpnjQpu6yqkhnHkirFDjhL3yVEiw12VUpeqEg83g3957jWstXw0ig==
X-Received: by 2002:a17:902:cec8:b0:234:f19a:eead with SMTP id d9443c01a7336-23e24f59b42mr5103135ad.43.1752611810100;
        Tue, 15 Jul 2025 13:36:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] tcf-agent: correct the SRC_URI
Date: Tue, 15 Jul 2025 13:36:17 -0700
Message-ID: <d9f424921179a52ffe053411c44f20e44e7deba1.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220425

From: Guocai He <guocai.he.cn@windriver.com>

The SRC_URI is changed to git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 0d627f4e23..8165d35758 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "2735e3d6b7eccb05ab232825c618c837d27a5010"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master  \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-- 
2.43.0


