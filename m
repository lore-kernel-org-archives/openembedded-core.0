Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE9DC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 04:33:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.7115.1752035584923964204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 21:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bkSwuAL/;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so4697136a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 21:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752035584; x=1752640384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrR95z60QfV5YZkGjw5B7csuwWmY62gefHSMtpw7wMo=;
        b=bkSwuAL/1xwOaldC6NqvvYZeWSYfZ04KOnLDvgwL7x5lgvdiuK/TvJVPFVbA4QQa5e
         xCnSOq7HFmFF0J+YLgANTnD7OLXnFRKI4dg4JNu/yvYomRGPsLIrYMt8ilwF0/Oxdn39
         wY37Cy1QpliADLV50KwCSDq7MDc7ouTpg7cWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752035584; x=1752640384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrR95z60QfV5YZkGjw5B7csuwWmY62gefHSMtpw7wMo=;
        b=f4lahwMaweJgumw4KeMNsvjhOqQ+9z/2E79YNczITzQtxevox8gedv186x1dB1hl81
         9C3OAu7KCHCuz7HBYZAa3w+vCI1mJqdLfq13pcTX/uug9okZSB7dKP86HM6e2jNm4UWI
         nLaho61fohPBeSbxfrVH52r+quby0mX2ncy/nQwYtfTbE+AUNv0k7HRdso2tbKhzyQXS
         0hz2pURO9N0Tt1x0h5SMdq3A28KHvnAxlUFl6vTWyhKb30K4tYUaPxn/wt7KaIRqpZDr
         xQbsMyYndveMLKyL4Lvw6jIxdOmTYFJfmjhDYz5S/7R4SLDj5RZAV5u+UY8Kbaaa789p
         GUpQ==
X-Gm-Message-State: AOJu0YwqL4jEGjJl+Q/1OVR/yf4YGgEUlDfh4LZL7iaop7La3GJfPk8v
	NQVCBxddNSyoDtyg6uNzD9xS/y66ggOsKzwO/fyXlYPbbrRiZTT6UkAZbeZnZaiIRH4ZOonHVl8
	kON8jAPo=
X-Gm-Gg: ASbGnct3Nf5UVeXlUsy8pK5AKaxc//TcuJlfeGAjVCyX2raBkLdKfWy0PXs/ZDrc581
	K/mZ8M+cKZE+MT2OZI2e9b6OXCjsgykrMUcDI8WuZAUdHb5elUgImyIaYaiqnJ/dUTc7oJLApoP
	VDvJP3yP510U1PdSD4Y8qeI5EqX00cNOfpHoWQb9i9nSQpF2t8W3F2PfImB1Sf3JxDtFZ4nZ/IK
	JJ3Rc08Q4bXbaDzdZRNw+EYhdiqk9BigJb8ueCUlAeoyKFakBCo5VfG+jY3QjqIReF3Vz8tI0N3
	QomuKUa2x03UOMtp54VIQi5IKsgu36XUBcd6/jTjpM65oV7JoxrE+jApoRhVVlmQOFSQUQUk
X-Google-Smtp-Source: AGHT+IFge04uRncsDyBchgVh+ZpjWy7NLBLJkFOZBcb2BNS1h75c8IKAM1/xFLYSGdomiJDZltDh6g==
X-Received: by 2002:a17:90b:4b84:b0:311:f99e:7f4e with SMTP id 98e67ed59e1d1-31c2fdc3ed8mr1989914a91.16.1752035583706;
        Tue, 08 Jul 2025 21:33:03 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3017c660sm761373a91.28.2025.07.08.21.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 21:33:03 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] sudo: Fix CVE-2025-32462
Date: Wed,  9 Jul 2025 10:02:52 +0530
Message-Id: <20250709043252.1056767-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 04:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220072

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/sudo-project/sudo/commit/d530367828e3713d09489872743eb92d31fb11ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../sudo/files/CVE-2025-32462.patch           | 42 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.15p2.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2025-32462.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2025-32462.patch b/meta/recipes-extended/sudo/files/CVE-2025-32462.patch
new file mode 100644
index 0000000000..04610d40fd
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2025-32462.patch
@@ -0,0 +1,42 @@
+From d530367828e3713d09489872743eb92d31fb11ff Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Tue, 1 Apr 2025 09:24:51 -0600
+Subject: [PATCH] Only allow a remote host to be specified when listing
+ privileges.
+
+This fixes a bug where a user with sudoers privileges on a different
+host could execute a command on the local host, even if the sudoers
+file would not otherwise allow this.  CVE-2025-32462
+
+Reported by Rich Mirch @ Stratascale Cyber Research Unit (CRU).
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/d530367828e3713d09489872743eb92d31fb11ff]
+CVE: CVE-2025-32462
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ plugins/sudoers/sudoers.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/plugins/sudoers/sudoers.c b/plugins/sudoers/sudoers.c
+index 70a0c1a528..ad2fa2f61c 100644
+--- a/plugins/sudoers/sudoers.c
++++ b/plugins/sudoers/sudoers.c
+@@ -350,6 +350,18 @@ sudoers_check_common(struct sudoers_context *ctx, int pwflag)
+     time_t now;
+     debug_decl(sudoers_check_common, SUDOERS_DEBUG_PLUGIN);
+ 
++    /* The user may only specify a host for "sudo -l". */
++    if (!ISSET(ctx->mode, MODE_LIST|MODE_CHECK)) {
++	if (strcmp(ctx->runas.host, ctx->user.host) != 0) {
++	    log_warningx(ctx, SLOG_NO_STDERR|SLOG_AUDIT,
++		N_("user not allowed to set remote host for command"));
++	    sudo_warnx("%s",
++		U_("a remote host may only be specified when listing privileges."));
++	    ret = false;
++	    goto done;
++	}
++    }
++
+     /* If given the -P option, set the "preserve_groups" flag. */
+     if (ISSET(ctx->mode, MODE_PRESERVE_GROUPS))
+ 	def_preserve_groups = true;
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
index 431dfba3c2..4d2a228e7b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+           file://CVE-2025-32462.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.25.1


