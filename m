Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C35C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:26:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.54245.1669922788449134431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ve3m5XQi;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id w37so2498141pga.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GSkWJbvRzH3/SBY57Jat6MkoC3kVcfmtBJOL9Fq1y9g=;
        b=Ve3m5XQidcQMlwwNPxKu0FCtgUAe5KVRgo4sYvyNdUmqosInCtzUzAs8fMUo13D6gU
         loSELL4PsMsvU43E+8NUGAt/lONGbhf+KDSYE8Gc5Hae4dBk5uHphZVqFtPTEft4pOlG
         fIQYQaVkzGxG3rhMgPTgkN0IPvZQhFLB86uJCN8bOOKuRAEgjDMu2114dpycIUXyddUa
         oJQvcdFt9QGow1qVzkwTkh9PaZBS7EfjFWhOIYdQxzw9T+WfkKqaZ6tIIqXVMOLPYIxH
         M+AfvNuADHp5zrbE3aGFAhIwzTHGOIbxgRBp804CQTfZMCp9XgKjZnqHZ0WnaFt66SDn
         P0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSkWJbvRzH3/SBY57Jat6MkoC3kVcfmtBJOL9Fq1y9g=;
        b=rD5gajbQpk4K+aVQFnOWqIrClEWwtLLESpGWWkoOuCCnUenfaIP5LKxFZbgbBOzvGq
         hhK2EWjByFqNkNh536DEPFSEjmbRmdVn+g/xeTnUwQUlKezupSha6zd6/GDrZHglE4LM
         jKO5wPOQhfLsojp2GmMyM1nlCTqUHbPyaAtAgzWP0Ww4FLjS6v0Xn4dx5csZSV5/n9LV
         Y1/RVEAS9H0r5c8ailVhZQmP6Vp3wiRN82ExEM0R3DJX1vC5eFzMUdGbiiZjLlTN5KoA
         17IhCEGuAkQl/+6MwBnMe3u2BBglB5SmU4e9opk6/kV5llMlIpvI+XyyMnoRYkokacJY
         eWtA==
X-Gm-Message-State: ANoB5pmhWPliMTCRb4uCeQf0eo/kbrXCIZZ22qZhxJMddaYEK+U1ITNZ
	WwwnrU850nZPj1PoeF3yhidDSF3ttsk=
X-Google-Smtp-Source: AA0mqf7jzFHj3kMfKL22uUBzRlR/yMOcPnW7LZ6gnr84sCx/G0c7dXAbJIEjtMUU1/BV+oD1ufXdOA==
X-Received: by 2002:aa7:81d8:0:b0:561:c694:80b with SMTP id c24-20020aa781d8000000b00561c694080bmr49072587pfn.47.1669922787654;
        Thu, 01 Dec 2022 11:26:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b00189b910c6ccsm248499plg.125.2022.12.01.11.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:26:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] pseudo: Disable LFS on 32bit arches
Date: Thu,  1 Dec 2022 11:26:25 -0800
Message-Id: <20221201192625.1266867-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174210

pseudo overrides certain libc functions which are aliases when LFS64 is
enabled. In anycase pseudo may not be of much use on 32bit systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add comment for this in recipe
 meta/recipes-devtools/pseudo/pseudo_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c34580b4ff..8bb8993439 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -17,5 +17,12 @@ SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
+# largefile and 64bit time_t support adds these macros via compiler flags globally
+# remove them for pseudo since pseudo intercepts some of the functions which will be
+# aliased due to this e.g. open/open64 and it will complain about duplicate definitions
+# pseudo on 32bit systems is not much of use anyway and these features are not of much
+# use for it.
+TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+
 # error: use of undeclared identifier '_STAT_VER'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.38.1


