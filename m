Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C681C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 16:29:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.2742.1686155344888117932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 09:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=chnupM9B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f7f543fe2fso2812675e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686155343; x=1688747343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDr2gG1JkfI4JHe86aumne2SwGJq7EKVLG91FU3WQh4=;
        b=chnupM9BcMAYGaQPQt2pvWm7JgEYjIDn685Xxo1Sz+XlTGpUFASDgDWyUAFASfBQDy
         uHqmIsriYPP3NuttnktGurfZPdD0tSCJPtXB4qx3Cqh6FKP3m29NTqiACXM3Mx2q/jbS
         W9f7h0G16yimhLwrpthn9dUdf3HYzyLBbmGaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686155343; x=1688747343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDr2gG1JkfI4JHe86aumne2SwGJq7EKVLG91FU3WQh4=;
        b=MVUF32VM1WFCX7YG4eugX0i4xG45Y5kVDOldfrx35lPiCcqayCPD3GRRhyM4T6iLws
         g4/0BnCoyV70q8UOyJEUB8j5LlTa4PzJx6bFTuHD+KyF4MeWwjGOeYd5ZOZqumk/qz7o
         9pzbg4VtgLDMNjcRQiP0z/1vjmNaT9lQu5xUK6rE6oPlsZkDRfRe3BMrDq4PsrDDwdhe
         kPZvW8P5p+6PwtyzBYUvXnhHT5tV6UJNKlyhlZfFFRartAnx8zwhC3QVGrqEuRoWpMlX
         K1IE+FjXpA/PXUPM/gcRlcuFRuihZA70nx0SA7WClKQ3upZDrnms67NfEc1acAvCk1rE
         g2/A==
X-Gm-Message-State: AC+VfDxX3DiJ7omfAu4Uc+a5r1BxQJc/Aa6cBFzR7HyYxR107d6M7EcV
	tCnhuzYw8xVuzbJZ86DFcVTjK+b+suVPk/foW3c=
X-Google-Smtp-Source: ACHHUZ5JS+6yXpBgvd0ta27pZtx2AD7GVzwTTSD5F29avnkwN9LGm7zdBO1NMK/BJCPQo4jMfWHtyA==
X-Received: by 2002:a05:600c:2118:b0:3f7:f614:996d with SMTP id u24-20020a05600c211800b003f7f614996dmr92180wml.29.1686155342916;
        Wed, 07 Jun 2023 09:29:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:247f:a475:41f0:cfdc])
        by smtp.gmail.com with ESMTPSA id u26-20020a7bcb1a000000b003f7a562ff31sm2704633wmj.6.2023.06.07.09.29.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 09:29:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/reproducible: Allow native/cross reuse in test
Date: Wed,  7 Jun 2023 17:29:01 +0100
Message-Id: <20230607162901.611495-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 16:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182478

We don't compare reproducibility of the native/cross components, only the
target ones. With the long build times of rust-native, the test now takes
crazy lengths of time so this tweak should allow us to reuse native/cross
artefacts from sstate whilst still testing the target output is
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index cd7aa8aafa7..1f0ed32fa09 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -151,7 +151,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def setUpLocal(self):
         super().setUpLocal()
-        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS']
+        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE']
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
@@ -225,7 +225,7 @@ class ReproducibleTests(OESelftestTestCase):
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
                 SSTATE_DIR = "${TMPDIR}/sstate"
-                SSTATE_MIRRORS = ""
+                SSTATE_MIRRORS = "file://.*/.*-native.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH file://.*/.*-cross.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
                 ''')
 
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
-- 
2.39.2


