Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8D4C54E52
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 20:48:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.5941.1708894073276137725
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 12:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMTbA3kE;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d18931a94so2005154f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 12:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708894071; x=1709498871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKYnobjTqVgV5A7AI+LY6O9D/vzLr7HcWNARYV6UPpo=;
        b=KMTbA3kECWh6Z0XdHRNT5S6a234Hilpn4MwpqlgR7Ww0jBH8yXjqYu4IH9vAwpK54a
         jX/LOnvskScPhDoKGGgFvILFSdOWbZAH/PprbDiiciCH8VycUKhMKdRjGSQ6MbHIN7Sh
         k1tHYdUZehhzC3bgdPKb3NOTCnN1cHzzJNeZZJV1oWRyBxR7AFi30XfvKNgPukoaWuts
         YBoC4vSi7mP9h0qWq3nzG6nqc1vdaOoYEm7BTgolPVe694md0yTmBNZJBOzYmNitonRi
         OFYdNkNk2g0SnrQw1S6GKQIHm6jggXVXgM5qMwJCHKKH5Yxrj03Qk0yaZeVwE/V3Xgl8
         sqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894071; x=1709498871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKYnobjTqVgV5A7AI+LY6O9D/vzLr7HcWNARYV6UPpo=;
        b=HacHcDFN/EwqtgLn/Zmy10+QK2mkwTEc9iBtjHFTQRoEqAsn4rGdp/MVwilsra8OmC
         eJJFe6tZ0KiI0QkvEDK5QHRr27iDAunzAg9Tf/Dw9szrsAs4QAme9ORcHkNn1BQ3xM4x
         rPLWtM4f6mhGxXjVPnSubiS0Df74b5np3ashvhvd3qWODDtDu+cCjt+ZS5yRgno3IWcp
         WHVVTG2WyTFCqwvO5wqMeBnOkPU02MxyHIAolo5ikftNXLx6toAwb6j7mOUy32tKOpb+
         jYay40ANLaWjl9pZNF06Uu/tHgBe0DD5wvgU5RQK3zkuWYsjdUQyJ+XOXAgfd1owlevr
         Q3QA==
X-Gm-Message-State: AOJu0YwXiSUvWbEU4PpKg5NIXPZiAGH1Cyooq7WSNLhllGkwiwU4DOw/
	dU+7lvc6ix3MShbP69XMLE/NQcXU2MUAoqc6EiNI3LWDXkQ8B8IWuaHmCHrX
X-Google-Smtp-Source: AGHT+IGAgWplJmCQhx/DlB0G8Bw3FqAiV9AAmYZeNaiLdNCXLpL0AIXGpRJkhHLLKncOF1DL4cyB5Q==
X-Received: by 2002:adf:e649:0:b0:33d:1467:f06d with SMTP id b9-20020adfe649000000b0033d1467f06dmr3940371wrn.24.1708894071501;
        Sun, 25 Feb 2024 12:47:51 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id dq2-20020a0560000cc200b0033b483d1abcsm6005989wrb.53.2024.02.25.12.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:47:51 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] devtool: ide-sdk launch.json per recipe only
Date: Sun, 25 Feb 2024 21:47:00 +0100
Message-ID: <20240225204741.650070-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240225204741.650070-1-adrian.freihofer@siemens.com>
References: <20240225204741.650070-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 20:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196147

If multiple recipes are processed at once, the launch.json and the
tasks.json of the second recipe contains also the configurations for the
binaries of the first recipe.

Example:
  devtool ide-sdk powertop cmake-example oe-selftest-image
generated a launch and a tasks configuration for the cmake-example
recipe which also offers debugging the powertop binary.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index d5e3a4f4215..d58d0bdc539 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -255,8 +255,10 @@ class IdeVSCode(IdeBase):
     def vscode_launch(self, modified_recipe):
         """GDB Launch configuration for binaries (elf files)"""
 
-        configurations = [self.vscode_launch_bin_dbg(
-            gdb_cross_config) for gdb_cross_config in self.gdb_cross_configs]
+        configurations = []
+        for gdb_cross_config in self.gdb_cross_configs:
+            if gdb_cross_config.modified_recipe is modified_recipe:
+                configurations.append(self.vscode_launch_bin_dbg(gdb_cross_config))
         launch_dict = {
             "version": "0.2.0",
             "configurations": configurations
@@ -280,6 +282,8 @@ class IdeVSCode(IdeBase):
             ]
         }
         for gdb_cross_config in self.gdb_cross_configs:
+            if gdb_cross_config.modified_recipe is not modified_recipe:
+                continue
             tasks_dict['tasks'].append(
                 {
                     "label": gdb_cross_config.id_pretty,
@@ -394,6 +398,8 @@ class IdeVSCode(IdeBase):
         }
         if modified_recipe.gdb_cross:
             for gdb_cross_config in self.gdb_cross_configs:
+                if gdb_cross_config.modified_recipe is not modified_recipe:
+                    continue
                 tasks_dict['tasks'].append(
                     {
                         "label": gdb_cross_config.id_pretty,
-- 
2.43.1


