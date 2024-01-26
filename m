Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049FBC47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:22 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.15938.1706276117947617017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfviPm8P;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so102123166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276116; x=1706880916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Csyy/Aco2c3rY+P4eyYSzHrkqj2bOEavVNvSKRMDJN8=;
        b=lfviPm8PkOcDLtbQAEv6G+389ot8mcpBmd7GkZIi0e9i8q31x0fQdLKXF+FjBZE/3C
         wHqGso26gjZoG8iKmxKzBMCMNvp/1n6pQVlxO5IXTbiX0UY92lI0SZu6fhWyTbMd/Vv2
         yAEE7Z8tO+Q4HfE22KySoDFFnD8ghYiK2PGU/9Mw+FHwMayD4D29JzAJvpJqnb426xvb
         97v4MK+9yXUYYtD8QbsZXb+pWKHPP3PqFRAnOpR6v002znlSROXsYYdKPDkiMARaBM+y
         rIsy6AppHJrwfE/Ue5O46IP5v6/jcyO0q2Wr8uXvkyJF0A8LXIPK48nQ1hcsUOwscCO1
         Yrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276116; x=1706880916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Csyy/Aco2c3rY+P4eyYSzHrkqj2bOEavVNvSKRMDJN8=;
        b=RwXE/KdCrLB6p5NJrWUWcxVjdqBtxDT9bAp+B/FoEgEfz7+HcCplDguSoucFPcC/ZP
         MHsh8pSmPsXbf/7OvurBshs6CUT4WDPT4+7zJIuMrdRA2TzYOSsOny59q+0Wi/HG4nDk
         BB9iDT6+W3HOHjErwZvfiMHlc5+u4RgGxe5KL8TBHyiDPPBYEo9MI9skwaauTa5zMJMW
         nSOTtM3dissEoqTmqpkSqKn4YZ7f+XKQS61iEpzQCC/x9nXAkrAK7Dz9SqbkeEv480r1
         cCxxEXH/0gWK0wg2AhMuVrxDMVPMSukyJ9/Nla0lzf1ie3clyv5Pgt2jK3EH4stLKO8S
         ONEg==
X-Gm-Message-State: AOJu0YwG7YECfB0umyyprq8fEJVEiauBRZbS2DZTP5pzhyHbCkKSok8g
	vD60jd0azjAnwIvIQcGf0i5BwbAYNlNBLJVGN1jLr30j2INt07WgJcVwEGef
X-Google-Smtp-Source: AGHT+IHFCOiKtN2oApf+osKl675or7V5o1DnTAFEmZER+87y9ieA2hZfG9p+M4v1lQ/eGWxc6PjWWQ==
X-Received: by 2002:a17:906:1949:b0:a31:59a2:b231 with SMTP id b9-20020a170906194900b00a3159a2b231mr1638427eje.8.1706276116073;
        Fri, 26 Jan 2024 05:35:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm631554ejc.127.2024.01.26.05.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:35:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/8] sysroot user management postinsts: run with /bin/sh -e to report errors when they happen
Date: Fri, 26 Jan 2024 14:34:48 +0100
Message-Id: <20240126133455.2609378-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194361

This exposes the following failure in a multilib setup, when everything
up to do_package_write_rpm is in sstate, but do_package_write_rpm is not
(there's a similar fail for lib64-man-db, and the failures themselves will be fixed separately
in the next commit):

Exception: subprocess.CalledProcessError: Command '/srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/recipe-sysroot/usr/bin/postinst-base-passwd' returned non-zero exit status 1.

Subprocess output:
install: cannot stat '/srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/lib64-recipe-sysroot/usr/share/base-passwd/passwd.master': No such file or directory

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/useradd.bbclass                       | 2 +-
 meta/recipes-core/base-passwd/base-passwd_3.6.3.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index cb809b5dd74..a58f8287c96 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -167,7 +167,7 @@ python useradd_sysroot_sstate () {
     if scriptfile:
         bb.utils.mkdirhier(os.path.dirname(scriptfile))
         with open(scriptfile, 'w') as script:
-            script.write("#!/bin/sh\n")
+            script.write("#!/bin/sh -e\n")
             bb.data.emit_func("useradd_sysroot", script, d)
             script.write("useradd_sysroot\n")
         os.chmod(scriptfile, 0o755)
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
index 9d7703b1c00..bf50b01fd5a 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
@@ -54,7 +54,7 @@ do_install () {
 }
 
 basepasswd_sysroot_postinst() {
-#!/bin/sh
+#!/bin/sh -e
 
 # Install passwd.master and group.master to sysconfdir
 install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
-- 
2.39.2


