Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5833AC369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 08:01:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.6646.1744444856392978165
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Apr 2025 01:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KxR2Uhxw;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af548cb1f83so2695785a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744444855; x=1745049655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3eNlzXpacm0CC/VyrJ7N3cXLrhCR15HssfZLEDmzwM=;
        b=KxR2UhxwTg7jr7Rnhe3qbC3F9SvhDXP1XpK943k/0+Lqw1bFU7P123JKGTjqIxJmXE
         9dFqyV42f1g4WpNnuqFusb4q/bfQfRi35Nejc9IkLO23I8ssiyEust1yogKA1AKtsvMf
         dN0SwBXL8ogIIkl57hFVkWmMazNakMlkvMhag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744444855; x=1745049655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3eNlzXpacm0CC/VyrJ7N3cXLrhCR15HssfZLEDmzwM=;
        b=nqRC7jLiSvh7fCleppYhoEdnXKOOdY8vlcOrxYghIEHImCoo5UqBxhwZ9v6Ej24Mi6
         /uhQpdWWo1syQ1zVzvw1aVZMOAICBM90pUjnRaN6J4hZ3p8K2kH0nYYJ92nowRT+ozmo
         Xgro5wawEntPQhaVZPtK2HWlr6ZWk9JEe8vU2cxtkWq8TWwZLOCv6ikE9Y6ZPT9hQHTE
         6WW1rRfmu6HuiUi727tZRNldT7A2CUg+hPLp3r2juD+nR3gmi9P/LIRLm8x2AXjpSLAP
         j7kaxSxtYThffc9VBYF22gIbLDxogcn17bO/cpLDIShOJp7k8Jpqmfj/0ClCJylAlX/V
         Et6A==
X-Gm-Message-State: AOJu0YyrmhJ4oXj7MY3a07GqXW/KbZwC2Qk0dbS5LsO/8o/4Rg1I46iT
	Mb62Dz3+/6ACcNefAuVk0x01xzoiQ5O4iObuf4qbIImxPyn3BI6HIr7g8Ue+G0A1RrieN2dJkAN
	PydU=
X-Gm-Gg: ASbGncvzabbC/XFM+CiTcrjDjPJEeUQtY2N9I0LRVSKzW163l5pjse9zjAJrY+vV89t
	IHWm5e6hhl2YSWdi9+zN06UtJ4MWcqdFEhmqB6FhKqMaiUU/4akqay0NvQZEycjJhaa4hkrbYSf
	tFA++jQruk8j5QUurvxqpebaTK3Hv81P7X5apVWpOLp57J+7dl5ZwANm8djA2+nzHgYyzIYJZmv
	8cx8qFsx/GDdHTn6Xn3Q+K6GlzrzOqX+tfc2nYAXaU+1WkleWKFgWHGVAnWXFp1EkuAgvUx478V
	Sk0xhr49Kqdkc/BbXCf0e3MznG+qNKDCz4DaRRTtPacXdpueZmg=
X-Google-Smtp-Source: AGHT+IHlibPDn6Qe/VM74aivt+OVxcQzQao4TER5pO2emnYn7W62grP/CTN3lH4uNOBj1ENgO+eP1w==
X-Received: by 2002:a17:902:f552:b0:223:5c33:56a8 with SMTP id d9443c01a7336-22bea4ff1f5mr86863435ad.35.1744444854700;
        Sat, 12 Apr 2025 01:00:54 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cafd5csm62569955ad.159.2025.04.12.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 01:00:54 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] openssh: Fix for CVE-2025-32728
Date: Sat, 12 Apr 2025 13:30:38 +0530
Message-Id: <20250412080038.855320-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 08:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214773

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/openssh/CVE-2025-32728.patch      | 44 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
new file mode 100644
index 0000000000..72fc0073e8
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
@@ -0,0 +1,44 @@
+From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 9 Apr 2025 07:00:03 +0000
+Subject: [PATCH] upstream: Fix logic error in DisableForwarding option. This
+ option
+
+was documented as disabling X11 and agent forwarding but it failed to do so.
+Spotted by Tim Rice.
+
+OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]
+CVE: CVE-2025-32728
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ session.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/session.c b/session.c
+index aa342e8..eb932b8 100644
+--- a/session.c
++++ b/session.c
+@@ -2191,7 +2191,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
+ 	if ((r = sshpkt_get_end(ssh)) != 0)
+ 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
+ 	if (!auth_opts->permit_agent_forwarding_flag ||
+-	    !options.allow_agent_forwarding) {
++	    !options.allow_agent_forwarding ||
++	    options.disable_forwarding) {
+ 		debug_f("agent forwarding disabled");
+ 		return 0;
+ 	}
+@@ -2586,7 +2587,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
+ 		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
+ 		return 0;
+ 	}
+-	if (!options.x11_forwarding) {
++	if (!options.x11_forwarding || options.disable_forwarding) {
+ 		debug("X11 forwarding disabled in server configuration file.");
+ 		return 0;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 6ae4c81a42..afcd50c7e6 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-Fix-missing-header-for-systemd-notification.patch \
            file://CVE-2025-26466.patch \
            file://CVE-2025-26465.patch \
+           file://CVE-2025-32728.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.25.1


