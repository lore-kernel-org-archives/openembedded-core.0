Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.11979.1599702462470351578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 18:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ghvDivV+;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 67so3351913pgd.12
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DYHmHj4QQREoJG8MsLD01uJ72NwrGMcLg27gpFgtIZU=;
        b=ghvDivV+kmzy9U9v16JPJ6ZnqbENbIfoUbPBoh/D2O2AeaX0cS3ykf3hDgMpBe/vLf
         6oie78+eV1bNT6XSdWrMHefN8vpQebKOcbn1TbyyZpf6YYIJ+Pgg38QyJG6V38gzrW6Z
         MZ3apo71th4y8Hr+8Lb8TNQKZX6hRnteSZJesJPxndNND9bCsEoUF51L+8lDBOyOQgQJ
         Z3w6fKkSYA0OEoKwfElAunlLEJ6j4PPCKDkfzPF0xoAIvIfl4HUzk2naDhIbcrXavDd1
         A6HuC1eOda20iwN15i5GB/OK/BEZOJaqOToTh34pZ0Nrdj/znQi6nLcFF0ifWKdGAWmT
         0dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DYHmHj4QQREoJG8MsLD01uJ72NwrGMcLg27gpFgtIZU=;
        b=aZ3mGkwW4mIFpBlj8gqa8QsYBxIaFZT253xJJ6xSR2Fr6fN4sxuLqM4C1o71DxqXT4
         1YjZjNzT3lTI0bczh/IWoT+AqJUU136wGu7R6+L2vKtpwBZJ7FfXQ0IOQCyQhLaPk5aK
         VyPjMQEeVBa75NbRbcrES6ZhDA8KGmJyAIQBF3O6LlhwhPvpGjeqIOfI6ettXqFMtUDD
         /01ndIZXCHh0orzVzstZqIbcmOdXlzwkhGxEbs0oX21hExfe0WB02RFXZnYvBhbUb2Va
         o75rowzQvKdIyKVDrfVPu0Scr3T5g8ByDH9HsUGqnG7q+XTbM+hluK62RiJPuJMjJFcf
         husA==
X-Gm-Message-State: AOAM533pw8XpCXB+/5IUId517rUB9dhwXupyov8VcrN6ribHDqo/StZd
	dt05HsTPZJY3Aj2dn96CDwSdRwx+oay5iA==
X-Google-Smtp-Source: ABdhPJyAFQew7DOKc+jlZir2mBfKQ6lEHTRc0tjVn4iXZrg8PQJ/ny2c5OGiqEQ4pt6s0CjY/HZs9Q==
X-Received: by 2002:a63:8448:: with SMTP id k69mr2544134pgd.285.1599702461614;
        Wed, 09 Sep 2020 18:47:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id br22sm352852pjb.35.2020.09.09.18.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 18:47:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] linuxloader.bbclass: Define riscv32 ldso for musl
Date: Wed,  9 Sep 2020 18:47:37 -0700
Message-Id: <20200910014737.779020-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910014737.779020-1-raj.khem@gmail.com>
References: <20200910014737.779020-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index ec0e0556dd..176fd89fdb 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -21,6 +21,8 @@ def get_musl_loader_arch(d):
         ldso_arch = "aarch64${ARMPKGSFX_ENDIAN_64}"
     elif targetarch.startswith("riscv64"):
         ldso_arch = "riscv64${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
+    elif targetarch.startswith("riscv32"):
+        ldso_arch = "riscv32${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
     return ldso_arch
 
 def get_musl_loader(d):
-- 
2.28.0

