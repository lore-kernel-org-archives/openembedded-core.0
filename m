Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD29BC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:12:04 +0000 (UTC)
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
 by mx.groups.io with SMTP id smtpd.web10.21291.1713377522535603575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 11:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=CFSGXXWR;
 spf=pass (domain: flex--wltu.bounces.google.com, ip: 209.85.216.73, mailfrom: 38ragzgqkamoc19aw44w1u.s42@flex--wltu.bounces.google.com)
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2a2e6197371so62624a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713377522; x=1713982322; darn=lists.openembedded.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wHQvyWM9E4XUPMqUp1bDzCt42ti4JsBMvAwYyXbo37Y=;
        b=CFSGXXWRZggxQrhALsYek+vn+Pt0B04Hd3JOyJ+e/XoG8zpqyazYY5BZ9nmTjKzpaf
         nJpfYMA1m8LfVGGWmMLEJkxBJi13lsh+BuXpPCE1uoo/smZS1TJMzR41pDk6SIs0dnVM
         QsBOSIaNHlWdSMTWQxyuKSeke1tLSM72pdUiF/nHxFXM8eM6fk6MNzEh9f693rxeiKLm
         1JDdDN5XJsZmTTZsKdGpgabSYMSdjwMFc+/A1yj5mTqTiYrkwNsWtkzx6QYoQPCIpl68
         MslwBaxP+Fv1nqvGUwB8HHpjlUlhwQ7R6D05A1LDjziT6FDfZwVlpmB45AImqpUUAqpA
         PMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713377522; x=1713982322;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHQvyWM9E4XUPMqUp1bDzCt42ti4JsBMvAwYyXbo37Y=;
        b=nUktoHglje36pGOZ7T7i2Fy2zvXhuvuIZxnLUl7kctxXNGU/CK4QQK+sExum30CwuV
         8ai3ocucrLJ3IyVS/i9jKaH361eSFGawZSPowo84sZncn64zWmu2acnapOD+1+a3aGp6
         9dlKd4nI16QGDSofbx+Pqe1rzdKgjKyXjWylIhoWF86ZeLllKShxqdsi0xU90xcsR1ce
         ITX7ykuTPHkiL40q3tfkLinD6MiJ7mzLYHppPYy9lkapdhj3sePeExc7+0Oe9exZyKn5
         T26bWvMAnYjqzbvCyLHTgHuTySzzvj15912LAOquN8boxMFUOIcmto2vur5f7Eg6kmQP
         XFbA==
X-Gm-Message-State: AOJu0Yy/5RmFamNxMQbqgGmQZuqiHUQs63Nt2GlMKbvnvCyRUsp8VAd+
	2iR1gz9TtjuBV8Qn4/DLmyIwe9+08gArqAP5oe++iK9p1G1bPsqCIZEZ1bkavkdpG3mb5SbhNAd
	HWE+Dp1GWY+M1C0hVGVsEaCg9j5be2zjA8N6efZSqCznSbIO9T3H753wcnVJX9yRBx9H8Z0boBU
	t6Dy17KJSgIvQNSJjR1FSHSTBj3RNIgGL9TadJRLy0H5Zvlw==
X-Google-Smtp-Source: AGHT+IE+WPCM36mPy6xne4hLCxFh4ma674b/0qSPQGyH8tI74UC5i05MsVpf4e/loCqZiS9BdFKPYvPK
X-Received: from wltu.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:d48])
 (user=wltu job=sendgmr) by 2002:a17:90b:1281:b0:2a0:b7c:265f with SMTP id
 fw1-20020a17090b128100b002a00b7c265fmr324pjb.7.1713377521599; Wed, 17 Apr
 2024 11:12:01 -0700 (PDT)
Date: Wed, 17 Apr 2024 18:11:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240417181159.100583-1-wltu@google.com>
Subject: [PATCH] rust-target-config fix target_featrue for vfpv4f16
From: Willy Tu <wltu@google.com>
To: openembedded-core@lists.openembedded.org
Cc: Willy Tu <wltu@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 18:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198471

Based on [1] which fixed the target for vfpv3d16. Adding the support for
vfpv4d16 with the same set of changes.

Tested with running tokio which hit coredump before the change. It
worked fine after this change.

[1] https://lists.openembedded.org/g/openembedded-core/message/185702

Signed-off-by: Willy Tu <wltu@google.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 926b0630b1..330ad8a3f5 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -21,6 +21,9 @@ def llvm_features_from_tune(d):
 
     if 'vfpv4' in feat:
         f.append("+vfp4")
+    elif 'vfpv4d16' in feat:
+        f.append("+vfp4")
+        f.append("-d32")
     elif 'vfpv3' in feat:
         f.append("+vfp3")
     elif 'vfpv3d16' in feat:
-- 
2.44.0.769.g3c40516874-goog


