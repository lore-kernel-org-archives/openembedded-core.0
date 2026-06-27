Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE1AC43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 02:20:13 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48818.1782526806085419055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 19:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZEmMG0Vd;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1397e093f90so1064061c88.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 19:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782526805; x=1783131605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i04b+GKtxkWyoNkjmh2Jfrps6cL1+TZ3knWc8+rpfVw=;
        b=ZEmMG0Vd31f2NRXV/BqvnniqR4jv6zhRPm7lsiX+cznF857qX/yoLI2NobIFqF7v9M
         5L9yjxGTo1cfM7tcSpEw9F1yreHjfhr1E8r0hVpFy4p4nlorrK7nkKC0ZUMS1VitsZAh
         zPJab383rKKJryiHDPsBex+RUGW3gu5E8+QFwezq8+pOx4TnpNF8KLSXlPJA/RokauVc
         OPQ5iZReMewG9P/EdkGHSmlCNnBl/aJlbBqD3LYU6KASUh4sHXv4OdkYfkYZk4cjJPVj
         gcgfaG3Cs2CZUkwLvLNVbBVoXrxEz32ZqVft+GNuz6BzijxwBHu92IdyHlsF2vsvra7F
         +5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782526805; x=1783131605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i04b+GKtxkWyoNkjmh2Jfrps6cL1+TZ3knWc8+rpfVw=;
        b=WKXaHDVf6H4rZAufHUUERu61xMOaeuLPIVjjCJlhmqP6PkaK9Z028sDiVORYSsz7Gv
         Gyfnd16FmzhFzjDVL4I+OLtg4HUGYdLby867b1S7rhp6X2Si31FwxfoTo8IVtwtJZt0X
         /uzmZY98THpGkz3oMx+gTXIufBDR6vNSMGR7CYw2v6dJ4OmFaMojt4rAdtW9ldIdA5bJ
         r5jlmZjm925YYmb4EQpxwDPsSySiP9O0f2xsOav6wANeDtIYby3r0Qgz18Z1rG0gDqBF
         jY6U23KIyeGVe2hSSMOBLDZc2laIZojZmrpgRVsiHJO+f4jPNV57Ha9OtCSwkqIndlYQ
         DwMA==
X-Gm-Message-State: AOJu0YyMrMkoL3PJbKv9O/mpvVX8gXnO7tVHNKn9vlf3yaPQCLWaZt2o
	m9VR1O2ewn3GdHtZzuOW8dzvfl0AVOAlmTcLFHw7cn7CklPL13jLhw1YzlyZwkIiJHE=
X-Gm-Gg: AfdE7cmyfeAHty/Cni2adE7H7xWcLxDxAJYf63D5XW096on44gKZ5RYb2jbtSX+1nRD
	xUPHAisGhYtRdpZm11zd8mnKe+aoh4vukLfYBCVBaJ7aL2/RBbLSnS+tbdYJR4n3FzrFghAoQFf
	JbwxLqpqWB5/okB+wc9vxLm9AL4jFk/KlelZpm50OiCWZ5yeItUViXkzDvwG3cHDuwX8HstlYnq
	z9UqPyX0f3u54yYxtLdpzbZgVDVUZR6zZuFS7FOg0P9Tn93lPhoycL2GGDp45oX+c9+/21AMn0w
	g+lquNYqowKbvSgIPf4rp212P6T80FNEDuO29BZWqYWOvYOyKDESDX+OpPzZWccHjixjFlj74ss
	90LWTAJvlilAByKTFhJfYeBCnGItxSr3pKOoPAvImjU20rFAYJQbMJiDWdJztRD79VKPq5F2B/h
	LoX7tM4mI9T0q0nVdGLmTVB8VEF8uD+2yY+Kl6+gR5RxOMU5MGR8K6uqxN9TYbcslaqkK3+98Ha
	f3GMCk/1JedVILXC7GDQj7GpG1F5FZHnr3Vb5n1W8r06q4XDKEXXvWCDiVBEmtV3mmoEJfZs200
	aAXyxB0KMgNwJJDM0VK0pdx3TJZ8uvmBCjX9zzIM
X-Received: by 2002:a05:7022:103:b0:139:94dd:18cf with SMTP id a92af1059eb24-139dbab3434mr7268158c88.18.1782526805298;
        Fri, 26 Jun 2026 19:20:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm23101155c88.3.2026.06.26.19.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 19:20:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] baremetal-helloworld: Fix override order
Date: Fri, 26 Jun 2026 19:20:02 -0700
Message-ID: <20260627022002.2363050-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 02:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239671

In current state it does not work as intended.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 4307716069..5af09d4a8f 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -22,7 +22,7 @@ IMAGE_NAME_SUFFIX ?= ""
 inherit baremetal-image
 
 # startup code for x86 uses NASM syntax
-DEPENDS:qemux86:append = " nasm-native"
+DEPENDS:append:qemux86 = " nasm-native"
 
 # These parameters are app specific for this example
 # This will be translated automatically to the architecture and

