Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF04CD98F8
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10442.1781682489325921517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qJbthms1;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b9318997so39735305e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682487; x=1782287287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkrRUqhGrvnQyrk75T5lAdJZhMXyyEmb7w75MB6HB9k=;
        b=qJbthms1Y0u9UwuyIXAqQFBufzuVyNFnEeceVD95nERhILdRjH7SIuoVvIngdv8kz8
         8Re2E2GmubijxF9GQUHJNh8RwDuiKJtxGaBzkUNq+x8/9h2xS/yaWHE4vjuI3/V+Zf8E
         84ZZjP2CGZu3uuN1+N7XeBl8qF0NN5vm4799M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682487; x=1782287287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OkrRUqhGrvnQyrk75T5lAdJZhMXyyEmb7w75MB6HB9k=;
        b=PaP2ic4T1K1ZLM4APu9ijMus6aPes3HTsLeUDuZz0GStohQpDyeXMBHkiTFi3Au844
         jhyiubbSCd09U83fk+er4X0Vp8HuI6lgniUaEutl0t6b2frrJRIOemxPuyb1hTR0slmO
         OFwzbFmaYNWitA23mpezS5yRLyuyIeQJYtDQCsH+KQm+vGgpPzCgdrvtYa+1cc2Z4RBN
         QZCIOAdsjRnXl00Sol+dHGJT/vrCmCLym9kQc4Yy9Rrk4yT1mr2k0qdjWmi49iUsLTew
         xeigD3d+t0ARox+8s2LH3IHpA1H0ah2BQck8eGPYIj4XI2XIQGxt8lNVPL3sXZFq9ziG
         u5KQ==
X-Gm-Message-State: AOJu0YxdP86WIuB/VuWhuI9gIhn/m3yS3wVmW0THeUbUP1Smuu/w9mTV
	dSMC5y+wRb9GU8fEyp5n6/He2/phOIB4NQp0yu2dJOkbU6QRZTDnF+WAJT57wXHmASVVhuwSWLo
	2haBo
X-Gm-Gg: Acq92OGbdvZ3d8+LYwWwKnv8+rk9AneN8iTKIdEVHYjJ5TXI6KO7kguw0S2vAB3OMF9
	oxLwZMnPXiuIJnK+eAk896XjyBLqnhnTa0bFdPa7jeStdPpQWZcXmbxQHgCy9LyTQdNQxLYN4Ez
	a1G4wb2PWGQSKxBSRLDiDn4NWlNQuzlAyLr0AeJHTEdH9cIkeaZAIu000P6q4NIFO2HQl0MLvqL
	ZNTZjYeBwLgTF/gVXeCpJ5ELNZZYS2LmDpmcSMR87VsS7eq4g8mDns2trk8wrnMwqw1BHv7EAhu
	TGs74sqTHKlEKdwana77Q4286K4N8vuejiLk0JjZxkHqxNCGO5kDXGJ1GO0Eyo4ZtaCb21TWnPP
	1zu7xoehizfQPbHCxJgDZc2yCsiUVfdhRif5lSYpS4wY1fo/gQcQ+2aebUuSfhTcEJQJXqQc3xe
	qMuwWCWfZhChTCsaqmc0eSFGrIJUxSVGnoyIfCC2g1ect/R5rBaq0+WIp/U7uoX8h80PnfhFTk8
	yzhSwFzwVqQAyN/3w==
X-Received: by 2002:a05:600d:103:b0:492:10e8:3f92 with SMTP id 5b1f17b1804b1-492333c94f6mr29357575e9.17.1781682487488;
        Wed, 17 Jun 2026 00:48:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 4/8] qemu: Fix CVE-2024-6519
Date: Wed, 17 Jun 2026 09:47:55 +0200
Message-ID: <4640175a9f2795d132572c8993c6fb98a96c8a21.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239019

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream QEMU fix for CVE-2024-6519. The
upstream fix commit is referenced in [1], the Debian tracker fix
status is referenced in [2], and the public security advisory is
referenced in [3].

[1] https://gitlab.com/qemu-project/qemu/-/commit/4862d2c95104d9fd0430cc003c205094f8ada1f9
[2] https://security-tracker.debian.org/tracker/CVE-2024-6519
[3] https://www.zerodayinitiative.com/advisories/ZDI-24-1382/

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-6519.patch             | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5f30416a483..4b6c2252b7f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-6519.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
new file mode 100644
index 00000000000..9bd36bed2c3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
@@ -0,0 +1,53 @@
+From 56cd5218a61d7365e501b57d8d79330ffa696031 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Fri, 27 Mar 2026 17:37:31 +0100
+Subject: [PATCH] lsi53c895a: keep a reference to the device while SCRIPTS
+ execute
+
+SCRIPTS execution can trigger PCI device unplug and consequently
+a use-after-free after the unplug returns.  Avoid this by keeping
+the device alive.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3090
+
+CVE: CVE-2024-6519
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/4862d2c95104d9fd0430cc003c205094f8ada1f9]
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit 4862d2c95104d9fd0430cc003c205094f8ada1f9)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ hw/scsi/lsi53c895a.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 9ea4aa0a853..2cc7e945e16 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1163,6 +1163,7 @@ static void lsi_execute_script(LSIState *s)
+         s->waiting = LSI_NOWAIT;
+     }
+ 
++    object_ref(s);
+     reentrancy_level++;
+ 
+     s->istat1 |= LSI_ISTAT1_SRUN;
+@@ -1182,6 +1183,7 @@ again:
+         s->waiting = LSI_WAIT_SCRIPTS;
+         lsi_scripts_timer_start(s);
+         reentrancy_level--;
++        object_unref(s);
+         return;
+     }
+     insn = read_dword(s, s->dsp);
+@@ -1630,6 +1632,7 @@ again:
+     trace_lsi_execute_script_stop();
+ 
+     reentrancy_level--;
++    object_unref(s);
+ }
+ 
+ static uint8_t lsi_reg_readb(LSIState *s, int offset)
+-- 
+2.35.6

