Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F07C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 06:02:49 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.14530.1707285763243293665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 22:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejwQEr3Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e054f674b3so211675b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 22:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707285762; x=1707890562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=22brXw/t+guv+rrIYO8+nTfsrSmw31P9GR2kE9/nM20=;
        b=ejwQEr3YNf7CBI0Qn9uqGxLteHVY7mQdLS5ZxfR7kpwOOvE1nr9W4B5enOL+Pa5YmB
         afBr0PTasWGAOJ7keMWv2pGwMoMg3muvKRneONEX5DEhrDENBxT/GR+cHyB7AFzNmR/F
         lfvrUwCUHEofMZvVDDQ4/YFPt6x/PdCdWq0D9Dn7HOFbdJVA/vxd8B7Wv9Glx3r4N1sT
         TN942FElWYVs6uB5KumNxugH/toXqZus3zspUdIZYuUe2uE6WBvSSoXXMbE0rPUSvlzZ
         UcajdUd3lrOrrtUFxdzgvIUVw92qkH9/5AgGt9J6PgDM9zqKbw64K3jkab3BF5PJKoKS
         s0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707285762; x=1707890562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22brXw/t+guv+rrIYO8+nTfsrSmw31P9GR2kE9/nM20=;
        b=pSfdkTh9IYKrBySNyA4Y0dh+/ENSn6xzR3cTI/tKxco5ZMo2KWtVBtEC4A/xKVf8Ri
         2w+v3e8WL7v+NtOHAHVjHFXH6m4ZQ9p20hhTDiZRxVq6Kk3XDeSOmApE6O1LbSwTHKs5
         dLfUb9ew8h/4W3sfi0UMxwN7Zd7oAKsLA8uDWkASyTfZOFTzwCM1HB2AgJDOjt6eMwUt
         j5pw2IX4f6lhhTYlaV0BTVB7NvMxXcYUXZnGPRCvtKuUdqtfwL6gUx8hEPHKmy8FQ3/Q
         3Vtxv8I7lpApYHF/x8a9fRo+7l5maewPcXMNIwsBksNg/ffyDMLLOPEolEh6axnvL5sW
         uZAQ==
X-Gm-Message-State: AOJu0Yw3ES5q7ZyZw2zedQKoViZjaiXKSpurwgaAn8qYE9szmVwwkPI8
	dYGjOBOk+qoeStgPhzP4GCGywHoPd7FjHspLRvcSEhYvDvOI2WmILLumGGieBRU=
X-Google-Smtp-Source: AGHT+IG/mxnTvmaghCASetntHkQpN3Z/YWyPhdiQHuRgCoRxM9SV2GNS1yxvylQBeGVlXvbxd5xyog==
X-Received: by 2002:a05:6a00:1d86:b0:6e0:6bc7:15e8 with SMTP id z6-20020a056a001d8600b006e06bc715e8mr218902pfw.12.1707285762171;
        Tue, 06 Feb 2024 22:02:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id fb37-20020a056a002da500b006d0d90edd2csm559599pfb.42.2024.02.06.22.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 22:02:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] ptest.bbclass: Handle the case when Makefile does not exist in do_install_ptest_base
Date: Tue,  6 Feb 2024 22:02:38 -0800
Message-ID: <20240207060239.2202928-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 06:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195037

Some recipes e.g. expant generate ninja files and no Makefile may exist,
therefore grep -q would fail on a non-existent file, we just need the
return code  to decide if intall-ptest target should be run or not.

Fixes errors like
| grep: Makefile: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/ptest.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
index a1c3c3f1a65..348d729aef1 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -56,9 +56,9 @@ do_install_ptest_base() {
     if [ -f ${WORKDIR}/run-ptest ]; then
         install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
     fi
-    if grep -q install-ptest: Makefile; then
-        oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
-    fi
+
+    grep -q install-ptest: Makefile 2>/dev/null && oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
+
     do_install_ptest
     chown -R root:root ${D}${PTEST_PATH}
 
-- 
2.43.0


