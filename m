Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2887CD3436
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 14:09:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.24332.1725372589122702486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 07:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RSmXUIli;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374c8cef906so1650706f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725372587; x=1725977387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lj7RP4/Jb5WPBdX6ge4DfYjc92YSc5W+tgc0kMfQhqs=;
        b=RSmXUIliV9pqwSrywnBYcNL/bdWJWlfsCy9RmMmNNuYNOxGatoNUt8K8CYSwnK8Qbc
         sE20+p5cLz7yeMuKgaZIlt198zk/jlWAL+dSTC5HgUZni1JhX5CQhZWE3Q6QcSUcDiOw
         KzH7YrHLR0jrwZzkx+cTSQskynFmdZGBHIOzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372587; x=1725977387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lj7RP4/Jb5WPBdX6ge4DfYjc92YSc5W+tgc0kMfQhqs=;
        b=EA73HK0HMz3FUwKl8WRnAq2wiT0r4Z6DtYh69GsGEaGuTMMWeCplLFYDm+gYiCQTop
         TS7DioVbI1Z5Yzzro5rqgIa4fGvEErpEbZ3ERvzx9XIX3iXRHRMtHmSbkaOVhaX2sOyp
         eaT++jN4Fc/TFMirG9O3DS8J98saANXA1AvJzZigBRB5OYtZLrVP5/rWEUD5wY7Xiljv
         3TMUplQzkGLJSzUEaB2J/U7XKRJwA+JfGuOMzf6tNDOj3K83++N0fZqS6FbmbvcVuBrO
         zK0PMJBfROhF3Ug6eWwPqgxHUvL4ad2SDGxpZhdBA4Ujw0SnLxzL1Ey7FipHmDj+Mxl/
         /zng==
X-Gm-Message-State: AOJu0YzJ/WJljkChiMaKLc8yGmRc1sO7mfYC0GTLG5IeRdU9bSGtOvjn
	ytplaMx9iMeX0lKwhkMvt3dfP5qwOg9S7lw3HF21hiBmoPMRvxE96/SxB8QVf/RW65Q16eXmeCH
	b
X-Google-Smtp-Source: AGHT+IGuZCaCs6aNRvh3DRcyf7I99yRvo1cutRHPfofS4L95uU+FuSoKq9SYaZOVA+KU4qVavCKEJw==
X-Received: by 2002:a5d:4c44:0:b0:374:c911:7749 with SMTP id ffacd0b85a97d-376dea47285mr742223f8f.49.1725372587028;
        Tue, 03 Sep 2024 07:09:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:30b4:4276:8ea7:8aff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c96a88ebsm6437970f8f.108.2024.09.03.07.09.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:09:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gettext: Drop obsolete ptest conditional in do_install
Date: Tue,  3 Sep 2024 15:09:44 +0100
Message-ID: <20240903140945.625408-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 14:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204165

The PTEST_ENABLED conditional is no longer needed since the task is deleted
if ptest isn't enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_0.22.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index ef5272a2065..0bf2a56e5fc 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -145,7 +145,6 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-    if [ ${PTEST_ENABLED} = "1" ]; then
         mkdir -p                                        ${D}${PTEST_PATH}/tests
         mkdir -p                                        ${D}${PTEST_PATH}/src
         mkdir -p                                        ${D}${PTEST_PATH}/po
@@ -178,7 +177,6 @@ do_install_ptest() {
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
                    ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2 ${D}${PTEST_PATH}/tests/xgettext-vala-6
         sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
-    fi
 }
 
 RDEPENDS:${PN}-ptest += "make xz bash gawk autoconf locale-base-de-de locale-base-fr-fr"

