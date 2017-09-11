Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB6F78266
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 17:37:21 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o77so5829994qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 10:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=hZ4ToAH2QhsnzWWs1eCKy5jPxhbPQW2gAVBywsJKsJY=;
	b=dOkdZUmN/i9b27siNEm8bYDqnKat6v6qa/t55IF2WL/nlGIyvKPhsyLNeMzlzcC38Z
	J6robotuqSIOHUbnJbps8lz0j8GEgWLQDKnqmnU8g9TZ7kviBbQLR641JhX7JV9uCQGd
	Mt1K+IBA/tybFWpMZR33BURrRMHhYyInR/JjYEX4QpzhAVEI589X2N/KfBNk4OH+xcUT
	GpMbqfCSDCiR7SzUPLO3XtAPjqh/00o0+LrgzQFX1OqrfdibE+3oHbnLTdZPuPyI+AVn
	0ttSnB9BBkhcoMgzvvANUBqc7r561t3MKrog2QpITPSCbfxZfnFUNqJLPHoLMVw8vCGl
	Q/Fg==
X-Gm-Message-State: AHPjjUjxmzZ5UaZsmukTsS/sdhN/0+E1uygM30T0RsmZxTVAUFaHM4+I
	eZYGXaHGw6dpzZnQ
X-Google-Smtp-Source: AOwi7QBmif+jIlBiRWg112vzVx5aEgeFCq3KZ7B2GAOZlKHOUjhJaOfhvGe3x171D1H081vmXYMu8w==
X-Received: by 10.55.159.81 with SMTP id i78mr9680574qke.81.1505151442983;
	Mon, 11 Sep 2017 10:37:22 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	q52sm6585948qtc.12.2017.09.11.10.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 10:37:22 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 14:37:17 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 14:37:16 -0300
Message-Id: <20170911173716.5071-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: eric@nelint.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] initramfs-framework: Allow directories with spaces
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
X-List-Received-Date: Mon, 11 Sep 2017 17:37:22 -0000

When mdev module loads the Linux kernel modules, it can visit
directories with spaces. To allow that, we must quote the variable
otherwise it misunderstand it arguments as multiple entries.

Fixes:

,----
| Freeing unused kernel memory: 3072K (80d00000 - 81000000)
| cat: can't open '/sys/devices/platform/Vivante': No such file or directory
| cat: can't open 'GCCore/modalias': No such file or directory
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/initrdscripts/initramfs-framework/mdev | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/mdev b/meta/recipes-core/initrdscripts/initramfs-framework/mdev
index a5df1d717a..9814d9764a 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/mdev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/mdev
@@ -1,5 +1,5 @@
 #!/bin/sh
-# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Copyright (C) 2011, 2017 O.S. Systems Software LTDA.
 # Licensed on MIT
 
 mdev_enabled() {
@@ -25,6 +25,6 @@ mdev_run() {
 
 	# load modules for devices
 	find /sys -name modalias | while read m; do
-		load_kernel_module $(cat $m)
+		load_kernel_module $(cat "$m")
 	done
 }
-- 
2.14.1


