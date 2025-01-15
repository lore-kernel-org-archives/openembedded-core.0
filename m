Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390FDC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 08:13:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.16271.1736928794121709003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 00:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3WKiMIY;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: simon.eu@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436249df846so44024265e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 00:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736928792; x=1737533592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMzY7CbB70ozUg9vYlTRPMiTK2yspWkYCX0iHhZBMMw=;
        b=N3WKiMIYkoPoa292rI+/u76Yd5bgoFc+Co9TAw7Nk+CWX9liKoc/LtbXrDDJLcX9bf
         IxGdx9i5GL2iKL1lw6qgW3cLc4Ebtt08t2lLFvjIyjwmldXxf5s7mBbWtJ5IZbJ9EJ4r
         IQOILTcVWf3ql7FBy1mjvrC0Hs9JRchOtU138+k/voffX6BwEhj4ZpxhtktkcD4ZNUHG
         aWC1jCzjG83zoaYgcdzbgdkZgoZJS/jT2yhCwsjK79aeQLu4toSKjW9p2WfriTyZsoCZ
         pSnzlclBygoX/XAAzX8An6/YeYMNmZpLLlcQ4RvZixZ1pHNLC3roox9/jzwCz7lActsO
         ufyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736928792; x=1737533592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMzY7CbB70ozUg9vYlTRPMiTK2yspWkYCX0iHhZBMMw=;
        b=Dh1wa/4rrzYrdgmICnrDjRnmE27dY7qe974+5Y3mNV/YSj4FsUkQzM3nWwOWz7EDNP
         Tv2g3IpsP0WTBnCY8vTI6xYt8Ikxwu0p6rmE3hQJJHKAa+gtjbnVE6OorKjLEA9QdKol
         YTpeI35xlMrf3a9gIPmeKaWtIPnuX24tz4+IFq9SGdy6E133wy3+qGPOBohpmLb01hdn
         ViDxoorrh/e2deYUMq2YyD7U28ex9L7TL0di5mmpS/HVgBHG6kNgt6kCPXCOA8AKr4y+
         i5j+CYOEDfNTRH/mXvOud6qEXdSm4tWPAd/figVn+5x4JnHRBx8i/9LxIUjS2CwtrMsK
         +1zg==
X-Gm-Message-State: AOJu0YxsQHUMkxftiQfE3KQqGRfkouCq1P2DIKYlOy4GJ9w8W0pQXyso
	N5n11G9IKYtncpjlBwEOpSVGONSFCkprM2/vV3fk6SaXdkBr7aiYnt5LjA==
X-Gm-Gg: ASbGncsrPla7E+Mh4zn8NHHGF7umQhBhkKvsQzqOyEBrfU1csRFTDqaH3zKAv78Um5p
	WowB8OMO4zJAqt5+Twu+fn4t60kR5Asu9Y7HdwctW3KDO9LlqRJiKpfEzIzQcr4Zd7X1g2j181m
	dDtkGW5dqP/AIQ/XWFKzSZgYLS/p7qtG9Z7EyMzLbDkqY7N52Y3lqS8044/YAnMfG9xSbAiFqCU
	/EyhWHwyKPUqUwM45xhN1idfJWpU6EWgx4bFQJ5HkEQnR3+s/vp8wI+s4w4
X-Google-Smtp-Source: AGHT+IGGdGHmwKxG29Ah341ncsPAvE9tp/PcmQNtmIPywWEE4eWjDZ1f2aprGlP0wIfZhLzMBeEeUA==
X-Received: by 2002:a05:600c:5115:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-436e266e823mr241053185e9.3.1736928791901;
        Wed, 15 Jan 2025 00:13:11 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c752910esm14414305e9.28.2025.01.15.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:13:11 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH] grub-efi-cfg: Add GRUB_TITLE for custom GRUB titles
Date: Wed, 15 Jan 2025 09:13:03 +0100
Message-ID: <20250115081303.27992-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209820

Until now, the default title of a boot entry is its label. The label is
a variable which determines the script to run during an early boot stage
and is not necessarily human readable.

This patch allows to provide a human-readable title for each boot entry.
---
 meta/classes-recipe/grub-efi-cfg.bbclass    | 8 +++++++-
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/grub-efi-cfg.bbclass b/meta/classes-recipe/grub-efi-cfg.bbclass
index 52e85a3bb0..9a5cb99c52 100644
--- a/meta/classes-recipe/grub-efi-cfg.bbclass
+++ b/meta/classes-recipe/grub-efi-cfg.bbclass
@@ -23,6 +23,7 @@ GRUB_TIMEOUT ?= "10"
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
 GRUB_ROOT ?= "${ROOT}"
+GRUB_TITLE ?= ""
 APPEND ?= ""
 
 # Uses MACHINE specific KERNEL_IMAGETYPE
@@ -91,10 +92,15 @@ python build_efi_cfg() {
         if not overrides:
             bb.fatal('OVERRIDES not defined')
 
+        localdata.need_overrides()
         localdata.setVar('OVERRIDES', 'grub_' + label + ':' + overrides)
 
         for btype in btypes:
-            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
+            title = localdata.getVar('GRUB_TITLE')
+            if not title or len(title) == 0:
+                title = label
+
+            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (title, btype[0]))
             lb = label
             if label == "install":
                 lb = "install-efi"
diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 783e30bf38..7ed0877726 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -22,7 +22,7 @@ python do_configure() {
     bb.build.exec_func('build_efi_cfg', d)
 }
 
-do_configure[vardeps] += "APPEND ROOT"
+do_configure[vardeps] += "APPEND ROOT GRUB_TITLE"
 
 do_install() {
 	install -d ${D}${EFI_FILES_PATH}
-- 
2.43.0


