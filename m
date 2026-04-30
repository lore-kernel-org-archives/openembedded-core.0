Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F413CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 19:56:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7358.1777579000914290882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 12:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pHkjiYJl;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-364d72f2986so714822a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777579000; x=1778183800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn+iWEGoT97rtbIhgZj/wCiftKV/jpjN0UrCF65134M=;
        b=pHkjiYJlkSj2+CSXW2IZKM3SfxD8+NSocdGaeFYYWcKlENUAO2Dc07Me0hmdrntxUX
         A7agtMI2g/zHYhfkpTznAFEXYToDl3sXOWvN/qqPHGb+ZDldJT6h0uN7wClnb2G3Atqg
         YMjGhoDJahGu1up2kDmh/K2zvwng3DO8DWPCjFO/afnmVqrzUy8N4Ti5C1DcxGPlATUq
         auvYCnATPI4YXpbJ1FgZtUSMrCLDnVFuKW3M6RBSaVTXXVwfC3mp41aT/3y1QAwsxrTs
         Ou0ncvGJ48+3HFbu8qkYH3OGglxUVuV8/Sg13198fLITbp8hF8UhMlAbPr/WP25c/DbL
         utvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777579000; x=1778183800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gn+iWEGoT97rtbIhgZj/wCiftKV/jpjN0UrCF65134M=;
        b=gYUrRmp7srAr0fw038d535uoVYmDAWUGPzG9E5rcjTMY3im+22SRZCt+WmGrMGI8rw
         F2pZP3aNktwIZCYCRjuWgX+OGSMQsVa+JG2Ga3ROFm16cVXlUj/NzzFgVfWp3VUwYKm4
         LfwGOSCMDmSwp2WM2mkY3AR98g7zmv7Cv3ET9meGUrabO1GmjhMp2rn367v3upMkaiv4
         Gh1HvgFWfhKRwjsMizRy+PkRXr0zmr+lXyDqhkJNh5DNvkVn8czxY12eDY6Smn8iqHQg
         U0bLfjpoxSNUIYeUD4qBrBDSS6mYmBrTZyv3q2kxuONybNP7g0oO4CuSr3IN2H2+GGpi
         qujQ==
X-Gm-Message-State: AOJu0YzrOaSe76d2cD7ONp1JYJd+WnCKJu+x28YLTYZdWhZlSNYpzrR9
	ht5bDXEdQPuTuhlZIwcvIlXGWxNBNbRV/B9Gqgxgm2vccy8sM1zjSAgXHaPSXHiv
X-Gm-Gg: AeBDieuw8sVbc5pto/zcJ4EGtxdBSGVnUm8K4al3HVzWYmYEB/Z+2EWrWc+gZ35t3fh
	C6tVasQFmQQPeNRF43IK1RhISU23HCXovdRrDvGnbleoO/ZXA4FKkzzECCaHzJ6Wku2U/5sR5GX
	wCGGPnZqfE521fFRyCoEQsH43EsBCUIIoe3fsQQwILDMNbx7B8eFPN2gux5MxJk9KcNj/ziYRPW
	FtXL7PRSut2+lVYKnSLqYiv9tYRvZxOqk7flmFls8ilaX/js8MSWbit7NOH87ak9HCKWEfJcKs4
	TI0As1rSlcvP+R4+yeaLoV5ZLrbNYl0Dj14ThAeOfy7cMInLYwDIFcDA+XOJTsFA65e7aZqJjDP
	bbH0+d4OFvnZaVxMDFnLvPjRkrzVS/oDCJe/YwrI+AF+oefscWalEZcTh/+rzGxqX0XXRA1jKCl
	0GmQPmzxFOi+uu2xEq4gpZcrUTQ4HbfkgUTazS+WEbBwYUqqo=
X-Received: by 2002:a17:90b:1a8d:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-364ef34a965mr26447a91.4.1777579000134;
        Thu, 30 Apr 2026 12:56:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59864sm3796735ad.75.2026.04.30.12.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:56:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][wrynose][PATCH 2/2] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
Date: Fri,  1 May 2026 07:56:23 +1200
Message-ID: <20260430195623.278134-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430195623.278134-1-ankur.tyagi85@gmail.com>
References: <20260430195623.278134-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 19:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236185

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.03.18.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
index 2f7c816043..a70e9dd0da 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
+SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
 
 inherit bin_package allarch
 

