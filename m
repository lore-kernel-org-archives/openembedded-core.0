Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD9A78A8E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:58:04 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id y4-v6so3842915pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ACHSUUKndRMxJ1zVw833fiDgiL9QMCZSL1dkTxC7Gcc=;
	b=o0314HvHjziJsL/agagjQ9AV8+TPo8usM2U1R30rXvwyZgTGNRJuYr2XVk5rs14E9J
	33f2LfpdaO/VapN6sFQfazNqyFTFNxJ6XuJQXyFPOfuZIhNu2T/Fuy+wp40dOlEAFVAo
	syMXT3YO8emvMTQR9OTGddB0W5qjWSFiDkMfTsgO9P5dPvg101bK3gUrctUOt2wmRcXs
	ZSprtAvt+WgLhmgJgxcxL7I7gvzPrV/0ALE/cM1NHYeUFdRzfsPwEhQOQkNiIvNY60eO
	Z2JzKOlIEBRhQ7YlQML3DdKNiJYxJxXiG/CTjibvIF1Bmu214SasBjO8UaaKQs1hZ1qd
	2Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ACHSUUKndRMxJ1zVw833fiDgiL9QMCZSL1dkTxC7Gcc=;
	b=cz7pRKNQQkJF2KFCMez1WSDHzu2bH7xhii6GLZR+2/T5lkDUhohh8KU7OnYcloh/ai
	gPATFKnsQs7CXgg89iHMTxAhGide27i9F78/CIMOPGL8EWG1aZEEXgmVlpVlT94PenkF
	H0d3ZBS+uFlBaxejN69bdgQo5/xNWXZd7hz+0gBM3cChwTD2nJtyxVcoXGJpmQz0quYB
	8rzvpEuKvVj/xpJ4Z2ykzsDLUCdaLY0N6Bd81E0c8VOUQoVZf/4OF0iFMsq4gbjF0D1Y
	bTO1xplPhKXSlnPBWG5tRFW2YrBqcErCfxikFLVrttTf46b9OYPrh3NpjtphOqB0xmfs
	Y0KA==
X-Gm-Message-State: AOUpUlG4LK8u65RqQwJtqRnKuSnpH9LEfVqIvRzLlLI3OMeGmw50DmMn
	Nt5S2Y4bJ/9khl6Ojvyn4kdIUzd7
X-Google-Smtp-Source: AAOMgpc6kToOGRVTQXlTGRF5otWGHTEBkWau9gB4/yw4BjKiV3Zb+3juj9subCSfCadTwZ05dhD07A==
X-Received: by 2002:a63:e742:: with SMTP id
	j2-v6mr10153513pgk.114.1532008685669; 
	Thu, 19 Jul 2018 06:58:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	z2-v6sm7824640pgv.12.2018.07.19.06.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jul 2018 06:58:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 06:57:52 -0700
Message-Id: <20180719135752.43056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] musl: Fix dirent struct alignment issue seen on armv5te
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2018 13:58:05 -0000

Full logs
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..18fbc7e4fa254696eb024f56ee74704805925fad

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b56870cb3f..9a3bbef68e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
+SRCREV = "18fbc7e4fa254696eb024f56ee74704805925fad"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


