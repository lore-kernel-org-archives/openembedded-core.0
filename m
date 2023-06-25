Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A90C04FE0
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.20166.1687728168874783904
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cbGaOUhS;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a113so4192785e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728167; x=1690320167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWenz+mCZ1ME2sfma5lptLtCURexvr1fvMRWaiul4eQ=;
        b=cbGaOUhS1toJlkt6Fw66Yg7VUq4IGjNXoQtX3VVjTlC5dazI8BohESlGs/dbmbEzcG
         U9gW0/cFauP+WpNyf92G9QUgUBxRwOITjxQ3Rs3o42VB6cdpct3LnZr7TL0Rfr11G3L/
         in9avMaS3s+HCrEAVQm/ZfatEhQD5aXk/3DUn8IiuANRivIpLMoAHCCs7csw3gzFRLuX
         FC0oQOdzTHpEM1wYn9CMcA1iPg0W5Ip3xCeX8qlXVGqBEVbYoKNrkO+JMnRqGPstjEo7
         bKGmAxgOzvwBC/AS08WxWqgYCLjLhkh5N6B1TYwwnfHtP88W4rkWc/MBK9VuG+ZunjvQ
         MHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728167; x=1690320167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWenz+mCZ1ME2sfma5lptLtCURexvr1fvMRWaiul4eQ=;
        b=gT4Y8+/trT7LTiLZjYewJ5wwGcH8Kj9l8FbjHD7+uR09EFb6QFxubyPo5GDbDEG92a
         9do6LDAskSKAff8t0qCWIocxapxKtneNIJ0HTqCBCFOjndQQ3I16N+tHXJSEF/ef+Frm
         urG1YjVfRqnCxCOlmsaJIDqlN0Vn9tJmWkhDo8aXaabRCeGQ6o+A1qCAiHF8I+B29Bp/
         YJb0fsGaTBQMnDdYGi0nCoTc199JJCpApzUyGnw5JHDo/pzxAzfwhUu6AEHSuTRRG5Je
         Hz+G7uNixbySZIHisIPOJglG+IahJk+W5INJr7jKaqO6YDfF1hlcJM7/0eQx8vLZmrLf
         T5CA==
X-Gm-Message-State: AC+VfDyacxBYYrXcdJX6YTvDIG+rDzjHwN/ysXrvvj3694tNXg3dlIHt
	b7PzaVPUKTtxDYmzKPILjeebeYQE/tXAeg==
X-Google-Smtp-Source: ACHHUZ4NB8VP98zgnu+Em4EyWvPYvG4bY3YSzpclouyPrr2jDTklxCIrgSD9np2ay8l0VeBRtug1/A==
X-Received: by 2002:a7b:cb88:0:b0:3fa:86d0:7d9c with SMTP id m8-20020a7bcb88000000b003fa86d07d9cmr2348327wmi.7.1687728167021;
        Sun, 25 Jun 2023 14:22:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/21] cargo.bbclass: set up cargo environment in common do_compile
Date: Sun, 25 Jun 2023 23:22:25 +0200
Message-Id: <20230625212241.915739-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183380

cargo_do_compile runs only if the recipe is built using cargo
as the top level tool. Some recipes hide usage of cargo inside setuptools
(or autoconf) and use do_compile definitions specific to those,
and so the environment isn't properly set up.

This was exposed by latest versions of python3-cryptography.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/cargo.bbclass        | 1 -
 meta/classes-recipe/cargo_common.bbclass | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 7a8cc1e7518..3ef0bbbb44e 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -55,7 +55,6 @@ oe_cargo_build () {
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"
 cargo_do_compile () {
-	oe_cargo_fix_env
 	oe_cargo_build
 }
 
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 82ab25b59c5..1ca0be471ce 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -149,6 +149,10 @@ python cargo_common_do_patch_paths() {
 }
 do_configure[postfuncs] += "cargo_common_do_patch_paths"
 
+do_compile:prepend () {
+        oe_cargo_fix_env
+}
+
 oe_cargo_fix_env () {
 	export CC="${RUST_TARGET_CC}"
 	export CXX="${RUST_TARGET_CXX}"
-- 
2.30.2


