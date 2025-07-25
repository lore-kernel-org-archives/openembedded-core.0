Return-Path: <lamine.rehahlia@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EF8C87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 12:38:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.18197.1753447108351144594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 05:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Atuqedn2;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: lamine.rehahlia@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b77683cc5bso385638f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 05:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753447106; x=1754051906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf1c8klOhuz+MqEMGU0mxt5G3LppF6lkgWI1WZVPoG4=;
        b=Atuqedn2Ef2Wc/NZWoopoKOe9axLwZQndbEBlxHjCn0BZ9FY0JLNasR+wTFePHyyA1
         CctoQit8mMb8pPESQHvLeJsTgIm7L3gh3koETmgcBeHrnS1ZDmanVtQ/MDFwDWegLUWJ
         WUuf0cId8ieofapU5sJTs3Me98DVzqZsqS3Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447106; x=1754051906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf1c8klOhuz+MqEMGU0mxt5G3LppF6lkgWI1WZVPoG4=;
        b=YHGuScd9aUWaHsKnB7o7CDWiqpDGPE1ySNXsmK2dALDegl8INYHutPLF/cfmN4h1vh
         rVFO2CCpu2wlcjKWphXIp5DH9i5LwNyVsX0PxxkxTyAB/MbIxFvcz/HU094FlqNGmdIa
         5V5z7VleH7F8o6meNhiMPJlnclpMcDgBWBqSRbW0A3OPi9G8zwMwckEQ230Iffzxqg3y
         DZfOYroLsQDcSVB6w2MXQ2tt/PgQ97vq/FqUYW2QFNz9oZnJYjuGCNfi65B2R8An//gO
         yGi9BBRZTq94tgYpkFKi7rmFcgdaJMjxaKwIp/59MM8MNlhPHGfbHqBHSiffebJWaABp
         /76g==
X-Gm-Message-State: AOJu0YzenfGMcWpXOOeWcWlR5KQGQ2gE9W9MpjBWVuuTHs37f9s9sXAp
	e5k8vFoNCalCTyQIWIUxdOQnb5b+zHrwT2vMCsHRV6X/b/zHs3/hIXG6wmPJ+1A0cKzAqde+nwk
	gs2bIVQ==
X-Gm-Gg: ASbGnctDlMG77psRRhMRkx83cXFH8hdMxPdhpccksesvGU0Ertq7YzBhkoxKg0HVEht
	zPaczO2AI8dJ5Ig8n7G2tTzhdLt1p2/2Gv+vQv39xqaGMAkkm+gXf56GzRr12MSqu7SQxJNOFXR
	MClXLDJBZUTMetM1mUCWXVi9JHziKczGN/KfMI+mW+EX8Vh2GR8qHXuAbAco+8AAqVJRNby3xDG
	dazuPy2bm0eerB962q3Iq7RL3bqwgCfTIgDXadD6cj05CVRTWX63HFHB9/iwt7hs3TvCgP1qSZm
	LrvJfaYINluUazVFuP6M4WBuePVF1gJOocJAApoKQhzYnElWTuNlR1gTS0zliZFlDtXPW04G8A1
	UE1xQaAjbs7jG17NEB45wxPtDEHbVeeAw
X-Google-Smtp-Source: AGHT+IE1RlCL+xMH3PV6d9seluolXvnIZjz3jBiJJxJo11ISv4nu2/09kiamOXaiIWFKO76kgUZK2g==
X-Received: by 2002:a05:6000:1889:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b7765e614amr1936947f8f.1.1753447106395;
        Fri, 25 Jul 2025 05:38:26 -0700 (PDT)
Received: from FRSMI24-GAIN.. ([2a01:e0a:98e:c1d0:8bd1:eafc:f0ae:9e4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad7fdsm5080669f8f.43.2025.07.25.05.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 05:38:26 -0700 (PDT)
From: lamine.rehahlia@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
Subject: [PATCH 1/2] runqemu: Enable snapshot mode by default
Date: Fri, 25 Jul 2025 14:38:10 +0200
Message-ID: <20250725123811.1718097-1-lamine.rehahlia@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 12:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220908

From: Lamine REHAHLIA <lamine.rehahlia@smile.fr>

When snapshot mode is enabled, all disk images are treated as read-only.
Any sectors that are written during the QEMU session are redirected to a
temporary file (usually in /tmp), and these changes are discarded when
QEMU exits.

This mode is particularly useful to:
- Avoid corruption of the original image
- Ensure repeatable and clean test runs

Signed-off-by: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 3d77046972..6c263d6b2a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -196,7 +196,7 @@ class BaseConfig(object):
         self.taplock_descriptor = None
         self.portlocks = {}
         self.bitbake_e = ''
-        self.snapshot = False
+        self.snapshot = True
         self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
                         'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz',
-- 
2.43.0


