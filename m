Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 95C9079BF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 20:28:32 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id w14-v6so6426059plp.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2CL64MnU4h5cNZ48DXW2oBIP0jxGlo2D32Zm+NXRueg=;
	b=Z16Jt9QKDmavmS9GYDVmRc0VyM1G8Wz8YR+6Us4JQc1z1NbBXb7jOqiJCtc1H+3Xf7
	fmXmg7a0WfCCI4+TWJzfs55eIOrtIl9TrN+EQUNgZgqxehB+cZCV0ztr9R3EbM+lqcww
	ZiQIecHD0VqIXKDhh7lTvXq0cKtKp4wih5eD0rGhgjKG0aTRQfw+wugJn5xiDum4uxp6
	47xE953Mf3AzifjUgqiL0b3vlkr6lEbIe/SHXj5pIVjhME+++ZqnbdWbk7z8OCqzD8wx
	ClWvEk+FW8V6CEWLlMCUP3o659cj1FUalpkoVRge0e2yI+htRrw0vApvXh2lpm/ZkGYA
	hDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2CL64MnU4h5cNZ48DXW2oBIP0jxGlo2D32Zm+NXRueg=;
	b=UkukaqHHtkDWAyoI4KPtzJGq7trFQ/s+2Wi5sqMlZjP/mOdFvfFwnHSIGYTPS+Zj5x
	Zr028b57UeuLmI1u/EoFUwupgZcZLn6T3aSeT33KoDfshAWuFYEtMT4ibvGbx4Qp8o8B
	Uus1iFKk0brVHPT38StHVKjPbCpJcOupwaZQ1mKFblMpfF0dJEUAoql56fiyDIdksly8
	D9USVHUyCVL7t59uo9WEl/Ga2i7rwTnjr86/z1sG6+px5+g2aX5Qy87DXoc/ycl1heVh
	KXx2iEDcjvLG8s/8163u99fcUorkrtfA+Uh+LdzgCWmUWcCD+13KLzXdckk+JTVfJ8gw
	mxSg==
X-Gm-Message-State: ABuFfojJ4mpI/RZv88ogUuksVVlnD64lrRP63227nF+a9TJH6V/o6zdP
	n8PZ5N16vQLp+Qg83R7ySnDD8E1M
X-Google-Smtp-Source: ACcGV61Za80b0HNk/FzoOuf8SuA905CvGQ58C7J/FLFm3ZSpzMXDwO8PSDKGBnu/PsY4N2wPRy88pQ==
X-Received: by 2002:a17:902:7d98:: with SMTP id
	a24-v6mr7231597plm.271.1539376113091; 
	Fri, 12 Oct 2018 13:28:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	g5-v6sm5013078pfb.130.2018.10.12.13.28.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 13:28:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 13:28:23 -0700
Message-Id: <20181012202823.4003-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] glibc: Do not use thumb1 ISA on armv6
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
X-List-Received-Date: Fri, 12 Oct 2018 20:28:32 -0000
Content-Transfer-Encoding: 8bit

This does not work and is unsupported so lets compile glibc in ARM mode
always on armv6 SOCs

Fixes [YOCTO #12929]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index ddf0c6b80e..99c92ce46e 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -56,6 +56,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
 
 # glibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
-- 
2.19.1


