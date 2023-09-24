Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400A1CE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 23:21:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.50838.1695597692070470696
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 16:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=aColnkfP;
 spf=pass (domain: essensium.com, ip: 209.85.128.48, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405524e6740so30287295e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1695597690; x=1696202490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIb/lbPBzROPXi1plB/o9wEnCjosCWwOmYA9vOeF+3Y=;
        b=aColnkfPSHt4FeOQKZzi79y2o/PJ4EJ8pHNQj9y9YDRD5hcySjqTdATYIY/YTMTxrV
         qnw8vrq3gZXwu/XVU/KTLfm3ZuSfzVtX30yjt9PhnmKGnJcI3VVPUPqAZBNEt0u1MuGz
         Y2kx6fFTNcNFNNRigQqkj1eNO0mXT+wNvrwGjSc1QIJuY2dkyYOJKFyct559Hrc4buRV
         ubqOi7mHEZBvmZPkmfu1ammcNSBGhj3dRKLD4JVp08xxKWb8xHxXi8wjwtX9AGF3BqUs
         dhPBo+2Cnm0D5NE+yy/wJXSCH2vQehFzssWnC10yvpf0h2BH/OodwdzlfnsI+mB9TJE8
         HxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695597690; x=1696202490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIb/lbPBzROPXi1plB/o9wEnCjosCWwOmYA9vOeF+3Y=;
        b=qRT+7YlMfBHoPVGvfMNiKbz7s5n7mufW6UmfzqnF1YHPRbzrpd8R3qkz+zEDHLHasc
         VMqV3CT57aOZfr2KbPxN/eQ0kJrzr0/E67PmFQ4i8drCCf0oncLu+XygAmHoCOQ8ZTvO
         nxEEyJPUiY4+V6mat+U3Lsdfs6S0ININ4/zSHv6f7i+bcu5vXDj6e05gQtyhKMpD7j00
         OJJ4FQDBGc1MAabKMj1xa7TX26Ja4xmcTk3h5KXxzzIrbHlSeiy2dBMzqB3T3SkQya87
         GSYlGPVW6qLdy5nW5U7hgZIEEoCcQ4a7FfcBzzYYynQx0N8iybFi9zoSSo1Jq3kaCrAw
         y8Xw==
X-Gm-Message-State: AOJu0YydX0jX7HweU0Yem6UprEUbeX5VUArQS6kh5ZSjKCNI4Ga8H+9I
	n37HTwBDqXxSy1EB71vnm52Rd+Gq76nx8d8fQkA=
X-Google-Smtp-Source: AGHT+IH3UKKyc0B0ZG5rkgf7kvamQSKiiQeh0IoI+z3Di0tLagV8OTdCIJx9kWFFX0nnw8kgCtQY2A==
X-Received: by 2002:a1c:770c:0:b0:402:ea96:c09a with SMTP id t12-20020a1c770c000000b00402ea96c09amr4068060wmi.16.1695597689506;
        Sun, 24 Sep 2023 16:21:29 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b0040586360a36sm2352472wmb.17.2023.09.24.16.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 16:21:29 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH] systemd-boot-cfg: add .conf suffix to default entry label
Date: Mon, 25 Sep 2023 01:21:17 +0200
Message-ID: <20230924232119.435742-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 23:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188167

Since systemd v245 (commit 6cd12ebcfe459466257ea63022a32515d756e719), systemd-boot
expects default entry to have the complete filename as value.

LABELS from poky are by default without any suffixes like "boot install", so default entry
does not have the .conf suffix as well and systemd-boot is not able to use this information
and it's starting in any case the first entry. To be able to start another entry by default,
.conf suffix is required.

With this change, LABELS variable can still be used by other bootloaders and being used as description
field.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/systemd-boot-cfg.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd-boot-cfg.bbclass b/meta/classes-recipe/systemd-boot-cfg.bbclass
index 366dd23738..12da41ebad 100644
--- a/meta/classes-recipe/systemd-boot-cfg.bbclass
+++ b/meta/classes-recipe/systemd-boot-cfg.bbclass
@@ -35,7 +35,7 @@ python build_efi_cfg() {
         bb.fatal('Unable to open %s' % cfile)
 
     cfgfile.write('# Automatically created by OE\n')
-    cfgfile.write('default %s\n' % (labels.split()[0]))
+    cfgfile.write('default %s.conf\n' % (labels.split()[0]))
     timeout = d.getVar('SYSTEMD_BOOT_TIMEOUT')
     if timeout:
         cfgfile.write('timeout %s\n' % timeout)
-- 
2.41.0


