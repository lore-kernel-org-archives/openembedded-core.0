Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F4CC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 12:35:43 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.17530.1751978141838227806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 05:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iC2uMEEP;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235ea292956so37271435ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 05:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1751978141; x=1752582941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ekWs7b69hAjllDgobd559XVA10wF80ktxf8YvahWZ+Q=;
        b=iC2uMEEPdZihTUMurQ6mNzSavaW+gDQUWWomeQimhz1ahffcuvripx4Vz0bXu4i7qb
         M+M6YcM6DeRZ9M4mqGtEZW9wi1lEYJWgmhJ7mkeZmBKgZ8qrGeh9zqhmI7ZfaqqNDqaQ
         4HhRLR1DziCMl51Ha91Og7ayDK/Cw576PBNlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751978141; x=1752582941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekWs7b69hAjllDgobd559XVA10wF80ktxf8YvahWZ+Q=;
        b=rgdy6S0N9OhPrfdJE/lXwvep5sSIHFG5ngaHVFqOTP8M21xmvC5ffC8jZr1sTOToMD
         tSzbTRIonDuZsk54uPjTsZInskjmi6eRg5Akeg1Qk0z1kA3mbr8g8la0LnwtDcSE8kjK
         r+doO8EaSoG05EY6C72DSwu8DMpkhUVoW/GsRgnetmBG5nWh1jCbA1M0WVzCmlI1GXXa
         YpoquT5wef2Rljcjmu6Iaj4R65MgEOjMpLnQDykt13R5FUkAcgGZAzz9Y0C13n+aP6h9
         ++MUH/pgG36Xia0qazNP/Sxn5dOyEUlOEBSfF/XJbvrbUKVA+aTqBCYT+/yXvC6MPizI
         HTig==
X-Gm-Message-State: AOJu0Yzi956N7U7sVJ5aVMtlCbdymGwxW5XlfOLF7PYIxPv4N0VxLLwt
	I+iFq32pBhJ8/42l8Y1ume+ChmKaq7RjWC5CrX0622pGljA+9+O6MX8G9uBKwsDLBpeeQVVIT2W
	7RA7kIy4=
X-Gm-Gg: ASbGncsMNJbIILS+i0XiWAy8lW4dbFPZtwU/rykGooXR0Mttnkqwmeca9yDvRuui6tk
	d5uWrQhBEW6Xl0YpVAwQ8MUD0arJqt6btJqwFtTpZ/j9TZFE1ltUNIhEjac2le/X1Uk94Q7ooAB
	PbhOVRbdW0vNSwdtXQGIx3UNtXYSpSaLpfTBthNdCT7UyuuMrlbn0qFVYjxjj4tleWkove6x08I
	vA2VKM0xukTDJwxARqqL7fTciBrCZt8MSQTBMELo36g/wiI9wc62rxxWnPCAsQjPtcDn2hJ3B1j
	xk1BXRzIuwXry94RjxadR0gNqHkkZ5bzNgfOx8BifYim9ZOiKPFPPUmgKwYnVlOGvzj+7xP/ioA
	=
X-Google-Smtp-Source: AGHT+IEgwc6cUQIMu9+7On7V9+n/6LNRgDeky4frRSyXpQcXWivXp6RflzSRoK0shaqwS9zJvVd8Aw==
X-Received: by 2002:a17:902:d4ce:b0:237:d486:706a with SMTP id d9443c01a7336-23c875acc30mr276771835ad.48.1751978140634;
        Tue, 08 Jul 2025 05:35:40 -0700 (PDT)
Received: from localhost.localdomain ([49.207.199.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8434ec91sm109551895ad.64.2025.07.08.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 05:35:40 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] sudo: Fix CVE-2025-32462
Date: Tue,  8 Jul 2025 18:05:31 +0530
Message-Id: <20250708123531.834600-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 12:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220028

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/sudo-project/sudo/commit/d530367828e3713d09489872743eb92d31fb11ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../sudo/files/CVE-2025-32462.patch           | 42 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.15p5.bb   |  1 +
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
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 8e542015ad..30860eb75e 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+           file://CVE-2025-32462.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.25.1


