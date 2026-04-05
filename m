Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8269E9D805
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 14:43:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36096.1775400198158771079
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 07:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Asd8A52t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso27778225e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775400196; x=1776004996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1QsPQzDa+AeS3dnuKMPE4W3yuqCR6I3V7c7ipGU+FY=;
        b=Asd8A52tJW1JXp06o3QP4qJ0hs/am0ehCUXQnjzhPJQL8mlY2x2YkHM52NpFLgAGsL
         xN1dr+PAbUJublhnAXtXR2k+grrNmHcubGh8cqXefoOt20aLWAlYygp6pqLNksjoo+F9
         ByxoTBVddpzYbnnz5S7W8mVuB8dQjb0vJW/RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400196; x=1776004996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1QsPQzDa+AeS3dnuKMPE4W3yuqCR6I3V7c7ipGU+FY=;
        b=rFSxvmMOhLjWfH3OCU5pUkV7Oci7uBR39uoZLPCp6D+Ezp11ZrgufRLJ7+x2Z4Niww
         qhrlbD8kK0vubKiSo+hvD6RJHP4ECtNX9PhylVel11ZMFnMfsJdHameLUtxaBpzaNIRB
         a3jbwLLH9kTjTQyGzfdCHLrhz4Lr1NxW6vXpL7PgqKAn3eenbr1Ny4FLXdPPqgKO5vlI
         dM0wB31ab/zAWLVzVa8xGkDsITZGTM4SB4WVQBJsqQJkx6CgJBOgBP12mp6m6dXvY2+7
         qCOR9bVdZ87BEjt6yMdtTmE65KMzmg46dYYz+ER4uWc4G5qTWc1EyCPNBUn+w3AJJa7y
         s0aw==
X-Gm-Message-State: AOJu0YzRvNalT+TuRum3Frta6BZ9cA/oQzcy9oZzA1qoUYwhJXxvL4yk
	yRSiJsP0LDxJirPgeZgN2hWwzF3F8kynpfDtq9cT0NaXBJg+o9acinERU7DGKOx+UBkvFik5wJL
	acvq0
X-Gm-Gg: AeBDiesn8HOVJ1jVphf1GeXvQJzaDrklpGchZrjCbO0NkxADzcKdTLv5QVpWsHkAHXO
	UWH42mo5YVa4Ornu3TN2yYFLA4V+IawjCpgpRsIzsVOnmnrwQCmq+PdClZ3eLGeCOSeUCrsLkaj
	SDKIzlVqGMgtzJQe6TwnE//o6hCvtKwwaHYpiHInKqoAlVXo3Wv5sP9hJkOSyhjoXU3RFfMLC3m
	y/suhCBN5+uDLR/yLgKfLv1zA1o5s7RlYcvWbRADBgHUQ+7Ym5K+OD1M/Yj/5KH7NTEWRzNZuv9
	FfgZ/ivGeP7hkfO1iJRSP/BEybIDgt+YWChPj9OuELBCoDJ0E4xuee6BROErAkc5k287IILA94O
	LHSbuFigwwh8p9Cvy1E9E1vnGdBzZCAhFTdTw5swljACkxaaPl+9iy9/jcn7iXiEW97+7azkJZj
	Nm1OcVgzyNKHQynTgQlho2hon7RAprRiS0fxwoUleAK+BMXRRe8q3w
X-Received: by 2002:a05:600c:8216:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488ac017468mr31447175e9.21.1775400196117;
        Sun, 05 Apr 2026 07:43:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5468sm32474083f8f.13.2026.04.05.07.43.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:43:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] image_types_wic: Simplify search path
Date: Sun,  5 Apr 2026 15:43:11 +0100
Message-ID: <20260405144311.3734472-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405144311.3734472-1-richard.purdie@linuxfoundation.org>
References: <20260405144311.3734472-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234634

Standardise on one location by default for wic/wks files and simplify the
search path accordingly.

wic is now using BBPATH instead of BBLAYERS so this needs to be added to
WICVARS too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index cd1131a7ccc..aa0680561b9 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -10,6 +10,7 @@ WICVARS ?= "\
 	APPEND \
 	ASSUME_PROVIDED \
 	BBLAYERS \
+	BBPATH \
 	DEPLOY_DIR_IMAGE \
 	FAKEROOTCMD \
 	HOSTTOOLS_DIR \
@@ -45,7 +46,7 @@ inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifa
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
-WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/files/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
+WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/files/wic' % p for p in '${BBPATH}'.split(':'))}"
 WKS_FULL_PATH = "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) or ''}"
 
 def wks_search(files, search_path):

