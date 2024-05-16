Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AE4C25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:21:27 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.10990.1715858477668031718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E+EtG+rE;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59b097b202so237628566b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858476; x=1716463276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nQ099l2BvVtCkH+RmCDlly10F27wE3g4deWEqlmZB4=;
        b=E+EtG+rERspjK/PEPzBAs3gOy0jouR6hCCHe7147JZAxqOLh3aZCNOw6Ju3a9yh821
         UJBaZdry4yk1wuxNQSZn3XGFYuojUol/BVR+bN2CDGtwVtSQU1JuRxpD8I2aMkESJ62A
         OPKvdW0ikBAmEi1LGDQ4gOvGyL/E3XDl8XlkwL9ODvk8m9WF4l91okxwEzz0sA5E72Ew
         mvX4N1p9cqVU513DHhaNYGJnNguSkxP4Rhj7qYK+asWINYSde/sFKivH1fm5E/NXZerR
         mPkf5qk0SLzChe+miJz19rlJu26+BeJsOIVQS4JcWCwmyVWjPSFgQ3bYOKFjZtYjoqlt
         K5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858476; x=1716463276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nQ099l2BvVtCkH+RmCDlly10F27wE3g4deWEqlmZB4=;
        b=rTIZfro6SpOlMv5VOzw10+zPmXb7B4wR5NNaPfo3uf8NNtLshVfaZ4ig0j+zESr/Rz
         m3IgE7/Tv4BZhzo4V5oV7J7nhYFWS/NNSz49+RXPewfuqYyAwzvUI+TvjPMTpJ35dsZa
         zwihcPi3CGQ9orCRT2FnZXjHPZ8+DhYkprUmdonsyDwpnl1uZHwR+Ukj6AuX0cjkPCB2
         DEbEWJbOTEI/4bcb2Fjbk2pa7Z5SyE/t6P6CjH6EQDj1lLkhO5d5XC+05TrIdKXCFZ1D
         B93gkry5RA+KI7N6lpKfIf+uB4SWHvLPDmkyiiP7yw1G+QKSuglQeVWKQOEck8cUDN/M
         +zVA==
X-Gm-Message-State: AOJu0YxO6zJIeS0E3D+fwHb0FZUU+aAJoa5QjVoSq4FTNct/fbVzQig/
	xeLipVCqTdIeTVuNLwa2njEp76NkoitlHGuuHpmTg311u8FkayZjrmp3MQ==
X-Google-Smtp-Source: AGHT+IEslAkzgQ/rKuKM/Fo4xwW+CkoFgQbJBrDSfz9OLwzeqXTRycGeaxaYbRmgfu41e2gKO6h0Gw==
X-Received: by 2002:a17:907:3ac4:b0:a5c:dd34:25ec with SMTP id a640c23a62f3a-a5cdd342677mr186690966b.4.1715858476104;
        Thu, 16 May 2024 04:21:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cdcd149c5sm131254866b.201.2024.05.16.04.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:21:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] rust: build the default set of tools
Date: Thu, 16 May 2024 13:21:11 +0200
Message-Id: <20240516112111.2145436-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112111.2145436-1-alex.kanavin@gmail.com>
References: <20240516112111.2145436-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199467

From: Alexander Kanavin <alex@linutronix.de>

Setting it explicitly replaces rust's default choice which is rustdoc
(needed for example in selftests and otherwise expected to be present
in typical rust installations):

https://github.com/rust-lang/rust/blob/master/config.example.toml#L320

This addresses some of the rust selftest failures but not all. Help
is appreciate to restore the selftest.

Unfortunately, this also breaks rust reproducibility (or rather exposes
that it was never properly fixed, as explained here:
https://lists.openembedded.org/g/openembedded-core/message/199288
)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 ++
 meta/recipes-devtools/rust/rust_1.75.0.bb    | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 80e830136f7..97a9c3da908 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,6 +16,8 @@ import os
 import datetime
 
 exclude_packages = [
+       'rust-rustdoc',
+       'rust-dbg'
 	]
 
 def is_excluded(package):
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index e82a7395e44..b041a5f8e4c 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -149,7 +149,6 @@ python do_configure() {
     config.add_section("build")
     config.set("build", "submodules", e(False))
     config.set("build", "docs", e(False))
-    config.set("build", "tools", ["rust-demangler",])
 
     rustc = d.getVar('RUSTC_BOOTSTRAP')
     config.set("build", "rustc", e(rustc))
-- 
2.39.2


