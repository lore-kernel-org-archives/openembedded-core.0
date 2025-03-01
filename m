Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D800C282CD
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 21:28:23 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.18097.1740864498332200367
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 13:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zvl0ezwC;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54963160818so3215e87.2
        for <Openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 13:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740864496; x=1741469296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkwR2iHFt4BYEGicfIwkm8FkjCucBEpfLkNJj1ogezE=;
        b=Zvl0ezwCAoBroP8ClyhT9fgXbTaaqFKVgSHfo7Q6boD9oo32NFaBDOabtqw+X2TsFb
         X6KPAm0StAVmZVEoI+ZrkEBxI8cXbP7cvsAOUuurWgchXnznnr0zdPjX5UtSF76/eIeo
         Yb52FOurfXrPgcuxsiYJ36TZcG1wt6ZWaNNqALsCyw+8USuM8xWwX/VAyHNakddIW07W
         AtIBJoVfWRJZhhMmodxPOUkgMYwkk68zD7fCeVZleZX11cC1+fiehPFHtQtdyjlw8PAP
         u7tM/SfcNZ0xYfAXkMrxkmD+aAAOHfxg+mAiLRh6XEi2uWF/2K56lCDDm1UIHFD6d/Qu
         rxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740864496; x=1741469296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkwR2iHFt4BYEGicfIwkm8FkjCucBEpfLkNJj1ogezE=;
        b=gc1OKoDF22AXIBKj+B8VEQjN8Rl+XbvHqu3jXxyhu+XJizxuVH8moGkMR1B1dbJwWB
         VzURlEYZqoEMMtNUlCuAdo/Z6Cojp6rNTFF29/Y9O34NQKIXGNp+D6l6d7XxbpaZrfyK
         ByTCHEveeNbWl6JWfHIPGmkwkKpmfpUpN8HoQwaD2aghWTQ0zQDZ6rbG59AyOLY+obmL
         xau3lN2ZwUCqOV/UrmbrHl87BX2X1bQfRNqn4ezKRKciJYeumv8uUOOd22Z/R4XcwAS9
         zD4k1CqCY5TO8f1NM3SXvt2FoPEeXBs+gFl8aYdGYAx0x482ctOZ81ejG5L9UhjZaSfz
         bWTA==
X-Gm-Message-State: AOJu0YwIyvPzCFWB6aBFby6sU9QnQKFBMs4gEVi5YhnXtitg8qYMgfW3
	gkcB4FSb+Jh1O+stXwi0NqhFtJ7nTZd/z6SSe4RQXtWMb8KMLgwDNYVPDFZo
X-Gm-Gg: ASbGncs/wlpIHQZvV+ulibJobSj/78lCL7JG6sr10HPr1XICefC8fzTGacev1tRrmbX
	weKqouvaQqzGJ2/9FgEHob7UIdw9loWTO9bUw/Ao+XV7MkB2dcjZNrlTQtOKkkuUBqqI+26J7rq
	Pzihjqn14kaV8ws80kXMy2Y+28LMYHbUx46fvcqN07R/w7SnFYa89pJKRfO/x1B7dnaKW0CZqG3
	T+WpM63xDenuyOgmu9nPnMtXALmTSzATzhq7z47yVDSere9FZU0o7n84HOhD8hnXO6M9cFw5FGd
	kElYNAhngXA+OtkVTMx2VTck9gnZ85cDD7WnL4Yuc8/R7ZMXDxbXsNstWf7G189HQiUHXtBHfQ=
	=
X-Google-Smtp-Source: AGHT+IHE9TmAOsR8aQ/T3NHDlZWjFMPl9/1aKbRenykQkpgX35LY44eGxW9fZfE/fi2AT2hYc/bm1Q==
X-Received: by 2002:a05:6512:32c7:b0:545:c89:2bc1 with SMTP id 2adb3069b0e04-5494c329334mr3561204e87.24.1740864496000;
        Sat, 01 Mar 2025 13:28:16 -0800 (PST)
Received: from slackware.local.localdomain ([169.150.242.3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494919b530sm721036e87.141.2025.03.01.13.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 13:28:14 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v7 2/2] classes-recipe: Consolidate machine-id handling
Date: Sat,  1 Mar 2025 22:27:53 +0100
Message-ID: <20250301212753.78302-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250301212753.78302-1-uvv.mail@gmail.com>
References: <20250301212753.78302-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 21:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212184

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Whenever Systemd is used as an init manager, it requires a machine-id
file to be present / initialized / or have the RW rootfs. This change
does not introduce a new functionality, but rather merges everything we
do with machine-id in one place.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-recipe/image.bbclass             |  9 +------
 .../rootfs-postcommands.bbclass               | 25 +++++++++++++------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index f08818db03..378d3bd0d4 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -699,13 +699,6 @@ reproducible_final_image_task () {
     find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
 }
 
-systemd_preset_all () {
-    if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
-	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
-	systemctl --root="${IMAGE_ROOTFS}" --global --preset-mode=enable-only preset-all
-    fi
-}
-
-IMAGE_PREPROCESS_COMMAND:append = " ${@ 'systemd_preset_all' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} reproducible_final_image_task "
+IMAGE_PREPROCESS_COMMAND:append = " reproducible_final_image_task "
 
 CVE_PRODUCT = ""
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 70ad3670d7..8b5822a0b5 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -43,7 +43,7 @@ ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest"
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "graphical.target", "multi-user.target", d)}'
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target systemd_sysusers_check", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target systemd_sysusers_check systemd_handle_machine_id", "", d)}'
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile'
 
@@ -173,6 +173,23 @@ python systemd_sysusers_check() {
                     check_group_exists(d, sid)
 }
 
+systemd_handle_machine_id() {
+    if ${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false", d)}; then
+        # Create machine-id
+        # 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+        touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
+    fi
+    # In order to be backward compatible with the previous OE-core specific (re)implementation of systemctl
+    # we need to touch machine-id when handling presets and when the rootfs is NOT stateless
+    if ${@ 'true' if not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'false'}; then
+        touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
+        if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
+            systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+            systemctl --root="${IMAGE_ROOTFS}" --global --preset-mode=enable-only preset-all
+        fi
+    fi
+}
+
 #
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 #
@@ -224,12 +241,6 @@ read_only_rootfs_hook () {
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
 	fi
-
-	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
-	# Create machine-id
-	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
-		touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
-	fi
 }
 
 #

