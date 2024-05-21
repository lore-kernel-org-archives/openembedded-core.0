Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5E1C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 12:50:55 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.18810.1716295849718138283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 05:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fH0KuT66;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5dcb5a0db4so364757066b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716295848; x=1716900648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nQ099l2BvVtCkH+RmCDlly10F27wE3g4deWEqlmZB4=;
        b=fH0KuT66pUoV0OtZwiLU6yfKXIwZfKOV6QtMFco1k7D+mrUFv3se0i/V5WQq3sDMuV
         PbYFDDTn4xFEtDY1Sjp7YKcR2as3NO5JjMAq2VeRdPgzt51GBZGl37h4vBHmrpmuU9Sy
         02bNc0Kd/3u7zO3ebujfjhBjmu/12eVArLClgw7d9k7oK2wtAUJAGzmZeG04rmPA8U4G
         fVKkT3I6ZsMEIJZaq/bEwvuE4G8LA0LQoORn4qp/wU3X0XlL3VpEtPJ4nfRm2T+6JRi0
         AYq4VIHThVCiqzWZX82iw1liD5f8S3f/yYBg0KLaclLYq0ULYb/b3Ib/d2zPtnqzJBSS
         EqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716295848; x=1716900648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nQ099l2BvVtCkH+RmCDlly10F27wE3g4deWEqlmZB4=;
        b=HJzoUI7+FqDpX2yiau2AAqF9y2zM8rYJtDaONa7Ed5RTlrsaZH15Ey2nTs0HgigBPX
         ceFgZUzD/lPV8zRvBqQ/VL+Wx3uD+9y02NS1c4Jrcuse7nTEKknCElSWSA6xe2TpCyQb
         3e/Gms625fDVVxxsdjq5CQCwc112bOg/37YYe3kXnMGbA2jbRgTOjiIRmPyG30sUJRGO
         SHGlfabFZeTTvz4CwimJGGPGrZTND00S0e5ghdmaGQVd0jWHU41ebbObkj4LqDsodiz0
         gZrnQB0lbOUtIGGDjdaI3qaqPV2jUfUFbEQ+rp8r+xHSZbn9PYeIZGxeXOvz6ASqzWB1
         RYcw==
X-Gm-Message-State: AOJu0Yy4egyhvdJakxr0asE/ZC0o/seALpFGYdv1Xu6RhMePB/RE+hBo
	Z1WEk1o+Zvr10awE9w4ejbEFrov5+djRMU+VGHsOJKMDMWF7f37/KKKb2A==
X-Google-Smtp-Source: AGHT+IGrtCPGZwMcDPjYSdAbcsEoE7I/TGTsBBwp18/mW4DLK7YvQOl/uZPfIe1XDYU3Ybg5bRqGIQ==
X-Received: by 2002:a17:906:138f:b0:a59:afbc:1b0 with SMTP id a640c23a62f3a-a5a2d676041mr2025102466b.64.1716295848176;
        Tue, 21 May 2024 05:50:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d294sm1595584166b.28.2024.05.21.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:50:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 4/5] rust: build the default set of tools
Date: Tue, 21 May 2024 14:50:40 +0200
Message-Id: <20240521125041.3611820-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521125041.3611820-1-alex.kanavin@gmail.com>
References: <20240521125041.3611820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 12:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199635

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


