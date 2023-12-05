Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83341C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:29:00 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.101904.1701786533500553368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y12SRumh;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: jhatnedap@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50bfd3a5b54so2269008e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701786532; x=1702391332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=irb7VdIN73NU0AxQ21dCHc0bIUS9fTaVsbu2Ga9Px2Y=;
        b=Y12SRumhZ1j7tsWzN4wz/4fvovLIWb5Uz3q0hfnuiTpS7Sj1KJ9tDuSwRlohbYpSjn
         5w21vhQIJPL8ZQjK5wqG27tDpcrztMfZvFcOxjjCY+4yqVOGXCFgdStTqWWr/s82LySk
         DNUMKJHA/04a7OP3EfVB0VUt/7AFL0iYruIefEaLjOTv40VFwVujf378S9d75c4zEflp
         yIsdZwFsW1AdHoiv209sAWLEJeIpQ/CucbcXOsDSzNhCxS/LlgHtLBoXc6LLRNbTyLQr
         JU0G1u0L+nKrDdDITXC43rg88H8ifBdTG1nXfsB2MShrP4d7lwNok1mHmLCwvjf7eGSJ
         4aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786532; x=1702391332;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irb7VdIN73NU0AxQ21dCHc0bIUS9fTaVsbu2Ga9Px2Y=;
        b=mpUUR3uZNlrO6h9zi9NilDVdHv12fl1DXsELxpWqkL2ZN6ExPLs/T1fi8m31vMA0cA
         DLf5zEtTKkuqyl1SVmAZYb2v05/F3eRx9lxpgvKE/q7W7PEOFrNwmzEmGf5XVBeJrw75
         3iPCj7CuCTrNyha1dom5eEm1RDY/wVrMkonGo38xIIJ3qy05s+0N0UXy0/iun/64HEd7
         5gAxTMeqbMxtMh0XYgtiLYVCF1jW7fHzi5MMtDFzQadM/Wd2juqaBdSF/cyZh8mKdFdd
         qAla6TesV75vBIR6i29Y9sA+TlPKZOGQxwC0OUBh6GxVxvvsDY4uHUbtpV4YLB0WHifK
         f3SA==
X-Gm-Message-State: AOJu0YxoR8GtXRfw4o527Ke5dBTQKkwW7ehGyMpEh42odrg9n+SlxVJS
	wS+katNomgqJrmjIlB34styKMHnoUB4=
X-Google-Smtp-Source: AGHT+IE8AVDaZsqLtNXsBxItv4ZDxCeyDm+Y/n0gowaD5/osjmk3evUrgbr8fwjxIROYTwG30imAMw==
X-Received: by 2002:a05:6512:484c:b0:50b:e6ff:e53e with SMTP id ep12-20020a056512484c00b0050be6ffe53emr2224469lfb.9.1701786531572;
        Tue, 05 Dec 2023 06:28:51 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7cd4c000000b0054c52a78f56sm1174043edw.56.2023.12.05.06.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:28:51 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH v2 2/5] rust-cross-canadian: Fix ordering of target json config generation
Date: Tue,  5 Dec 2023 15:27:17 +0100
Message-ID: <20231205142810.826-3-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231205142810.826-1-jermain.horsman@nedap.com>
References: <20231205142810.826-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191824

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Based upon a patch from Otavio Salvador <otavio@ossystems.com.br>,
ensure the target json files are written in the correct order with
the most specific last incase it overwrites earlier files if the prefixes
match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1912c4e9e0ecf9655f3b3a41588b54d7956f5899)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian-common.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 1f21c8af26..df4901f1fa 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -27,9 +27,10 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
 
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
     rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
 }
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
-- 
2.42.0.windows.2


