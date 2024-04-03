Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B1BCD128D
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 07:02:55 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.5479.1712127766106281723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=dzJorpm8;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ymXtzqFUQFX/PE3CcmHlVgABYXwcT9XRCQLs4sCKsoU=; b=dzJorpm8Bx1biTd1oknYumjNUW
	rO77HLKW4CQ280qrjIbIa6/T3yBrEA7HgZbE6VIqAmVwCgnmsUSCEX4ZE8bHCvI5GOhQQ6hM0CA3T
	QWPgAnnUMnizfE7Ql5SgCwEyJFID+j5LMRBjVSQaDnAN964AH+olYSs9Iodz8bkv2g/MGncPq+twq
	41vLakMvKhFGmKD0TH/4D9mDRZqwE3J/rtqVuFEt4J/wVtZoVJ05trIgYivomfQClKf/2zbxIaGgV
	OmiU0dP4NoyKTDKfd3qIx4ncAcXy1DULqyehy2EqRsJjoYeEy9ED43O20vlX+w7ji5Zo0AyXzpIog
	BuzZALKQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rrudu-0007UW-Rj; Wed, 03 Apr 2024 09:02:42 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rrudv-000NUU-0r;
	Wed, 03 Apr 2024 09:02:42 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 4/5] qemu: enable parallel builds when using the jobserver class
Date: Wed,  3 Apr 2024 09:02:03 +0200
Message-ID: <20240403070204.367470-5-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403070204.367470-1-martin@geanix.com>
References: <20240403070204.367470-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27233/Tue Apr  2 10:26:21 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 07:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197906

If the jobserver class is enabled, the PARALLEL_MAKE variable is unset in
favor of configuring a shared jobserver in the MAKEFLAGS variable. However,
the qemu makefile translates the missing `-j<N>` argument to `-j1` when
calling into meson / ninja. Add a patch to make the qemu makefile
consider the --jobserver-auth option too.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...e-jobserver-auth-argument-when-calli.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-Makefile-preserve-jobserver-auth-argument-when-calli.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4501f84c2b..1f86bf5a44 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0003-linux-user-Add-strace-for-shmat.patch \
            file://0004-linux-user-Rewrite-target_shmat.patch \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
+           file://0013-Makefile-preserve-jobserver-auth-argument-when-calli.patch \
            file://CVE-2023-6683.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
diff --git a/meta/recipes-devtools/qemu/qemu/0013-Makefile-preserve-jobserver-auth-argument-when-calli.patch b/meta/recipes-devtools/qemu/qemu/0013-Makefile-preserve-jobserver-auth-argument-when-calli.patch
new file mode 100644
index 0000000000..33db8b7ddc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0013-Makefile-preserve-jobserver-auth-argument-when-calli.patch
@@ -0,0 +1,37 @@
+From 730530c5f01e00cdc3754ebb8f3d7ff995f3376e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Thu, 21 Sep 2023 10:57:45 +0200
+Subject: [PATCH] Makefile: preserve --jobserver-auth argument when calling
+ ninja
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Qemu wraps its call to ninja in a Makefile. Since ninja, as opposed to
+make, utilizes all CPU cores by default, the qemu Makefile translates
+the absense of a `-jN` argument into `-j1`. This breaks jobserver
+functionality, so update the -jN mangling to take the --jobserver-auth
+argument into considerationa too.
+
+Signed-off-by: Martin Hundebøll <martin@geanix.com>
+Upstream-Status: Submitted [https://gitlab.com/qemu-project/qemu/-/issues/1898]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8f36990335..183756018f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -142,7 +142,7 @@ MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+ MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+ MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
+ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
+-        $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
++        $(or $(filter -l% -j%, $(MAKEFLAGS)), $(if $(filter --jobserver-auth=%, $(MAKEFLAGS)),, -j1)) \
+         -d keepdepfile
+ ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
+ ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))
+-- 
+2.44.0
+
-- 
2.44.0


