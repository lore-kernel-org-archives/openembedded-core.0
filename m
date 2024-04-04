Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEE2CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 11:38:23 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.35656.1712230700437229754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 04:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=bjEILrWu;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=k0kmRSL62itzzxUFgoXEUPpnNGTokxrh09mt4qerGHk=; b=bjEILrWu3QBB5NfIsIbJQ079vW
	DEBrCx2OIlceimOep4iXU2DYIuKxDEk6EfD6/oNRaxqCL70c1b9Dnp9ZQYHhieQ8RZqVDaSYNT8xZ
	3gxCj1hQ6uc15cUQ7845/sVkoWlBBt+uoyo9zd52BCEQDjQYMfIyniNbVZXnhTxVd40rFbEcsjcwS
	mHn/LczBJOsd5UTTkn9JRBzWdLiSsau6QZEZ69i8Flk8/MjYO3BnLkhVhaSe3EvapNSWTAqQLPSr9
	PnNl7N4mKIjAf8PLvLDnU4vtax+ZIPjtmQYu2V3Fvy19vOL7H4sNxMJaG95eyd4f1AEYODOqOxgiR
	xUGYv2+g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rsL53-000FZF-12; Thu, 04 Apr 2024 13:16:29 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rsL52-000Wu6-1S;
	Thu, 04 Apr 2024 13:16:28 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2 4/5] qemu: enable parallel builds when using the jobserver class
Date: Thu,  4 Apr 2024 13:16:12 +0200
Message-ID: <20240404111613.2574424-5-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404111613.2574424-1-martin@geanix.com>
References: <20240404111613.2574424-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27235/Thu Apr  4 10:24:59 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 11:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197960

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
index 0000000000..0dbc32eed0
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
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2024-04/msg00172.html]
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


