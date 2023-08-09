Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAB0EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 13:12:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.87816.1691586726524906559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 06:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NmNAu6pj;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so56899005e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691586725; x=1692191525;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc6YzYS0ivEjsvuYuPW/TtOAMuAi+6pfDERCs/PYZZo=;
        b=NmNAu6pjFCcrs9WY3MQ1KKvVpMpeVt+UZkQwS1eS3nO2+9S4sxWBZXIMY1cKUuJ6ku
         6RilK3sukwMrQ94bh857IxVrNUBM+lI2JRZaEb5WJAnwCsb0dEHC5kMmlX9ROtOFhsOU
         rkO2+7wr83pF7z7Us1cHwAj1HXNPppgz0+Qk91F7ux+lSR+XWouF10lPa0xCXuQtXRCr
         0NOwSo4Lzm1PXT3qy/5S+XLreKR6H1pMuvBJERLjBRpix4m3z3SL4fF+6kX+e0BfZjtS
         AXfcbdzqQYh7gA9RIjcZM04O1TL2qSOkjVKxrCh7ZjpR/sejB5pGaJDzTl8H1A0FRXD7
         TlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691586725; x=1692191525;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc6YzYS0ivEjsvuYuPW/TtOAMuAi+6pfDERCs/PYZZo=;
        b=Rmn4PmLFujFTuCfEllUcYro5DvfYH4FllF6rWGDAWxtHpN2QhQ4EPdWs1uWPNNElRQ
         PhIlg9MoYjxY6fRm/AE3DTaCz8PEZf06nRV/E/3NZFoufRq0jbe/xsUdS0Db87uMwqIW
         OWL1T8N5x+ASVxdXp7r9GwOl57hQm+RZm4lltoi9XoLrjzJNgzKHeuv8CxWwfrKbhHq9
         JZwYabNEvSpstEHcNZXAB/ah6QiShYKzeJTSiUI6UPj6bsRNDu8V41PaWDVeLv5t+8nB
         fAZGxNKF8UacxucqAHgif0BRFx8fQM/WNY/ed0QonZScYNUXJHhRQnolVLH7VLmRK0I1
         q4tg==
X-Gm-Message-State: AOJu0Yx9txFBLqkzjXnDf4uAvTYtmVqS9wFMwf8cNpoEFwjXPcartpmt
	3295wGb7u0EGP5vZmbpkSygmNbpdE1IT8Q==
X-Google-Smtp-Source: AGHT+IGsexSjvKgKHNxqdNcMuO23MRycgsGq0peW/vG/dXLvVpXtQgVJHX9FwMP/Qc+fHybILsni8w==
X-Received: by 2002:adf:e8c7:0:b0:313:f5e9:13ec with SMTP id k7-20020adfe8c7000000b00313f5e913ecmr1762168wrn.68.1691586724670;
        Wed, 09 Aug 2023 06:12:04 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id y9-20020a1c4b09000000b003fe215e4492sm1953668wma.4.2023.08.09.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 06:12:04 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
Date: Wed, 09 Aug 2023 15:11:32 +0200
Subject: [PATCH v2] rust-target-config: fix target_features for vfpv3d16
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230809-rust-vfpv3d16-v2-1-dc2d492b7013@skidata.com>
X-B4-Tracking: v=1; b=H4sIAIOQ02QC/13MQQ7CIBCF4as0sxYDlFbblfcwXUwp2ImxNIBE0
 3B3sYkbl/9L3rdBMJ5MgL7awJtEgdxSQh4q0DMuN8NoKg2Sy5qfuWD+GSJLdk31JFqGbVNW7EZ
 tEcpn9cbSa/euQ+mZQnT+vfNJfNefJP+kJJhgHdpWNahGxU+XcKcJIx61e8CQc/4AO8RXrKwAA
 AA=
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185702

From: Benjamin Bara <benjamin.bara@skidata.com>

A build with vfpv3d16 (armv7at2hf-vfpv3d16) tune currently warns:
'+d16' is not a recognized feature for this target (ignoring feature)

This correlates with the supported target_features for arm[1].

With the now enabled features, rustc might use vdiv.f64 with register
d17, which leads to an illegal instruction on the given platform.

Therefore, adapt the features s.t. they correspond to the
armv7_unknown_linux_gnueabihf target[2].

Additionally, only set the latest supported version of VFP.

[1] https://github.com/rust-lang/rust/blob/1.70.0/compiler/rustc_codegen_ssa/src/target_features.rs#L32
[2] https://github.com/rust-lang/rust/blob/1.70.0/compiler/rustc_target/src/spec/armv7_unknown_linux_gnueabihf.rs#L15

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
v2:
- move armv7 check back
- only add '-neon' on armv7
- only set latest supported VFP version
- Link to v1: https://lore.kernel.org/r/20230802-rust-vfpv3d16-v1-1-9af645a4b407@skidata.com
---
 meta/classes-recipe/rust-target-config.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 21a56ede3e..9aa1fc4da5 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -21,16 +21,18 @@ def llvm_features_from_tune(d):
 
     if 'vfpv4' in feat:
         f.append("+vfp4")
-    if 'vfpv3' in feat:
+    elif 'vfpv3' in feat:
         f.append("+vfp3")
-    if 'vfpv3d16' in feat:
-        f.append("+d16")
-
-    if 'vfpv2' in feat or 'vfp' in feat:
+    elif 'vfpv3d16' in feat:
+        f.append("+vfp3")
+        f.append("-d32")
+    elif 'vfpv2' in feat or 'vfp' in feat:
         f.append("+vfp2")
 
     if 'neon' in feat:
         f.append("+neon")
+    elif target_is_armv7(d):
+        f.append("-neon")
 
     if 'mips32' in feat:
         f.append("+mips32")

---
base-commit: 46f938bbd3a143d38c5a67cfd781f19c22664c57
change-id: 20230801-rust-vfpv3d16-a65080a9bcfa

Best regards,
-- 
Benjamin Bara <benjamin.bara@skidata.com>


