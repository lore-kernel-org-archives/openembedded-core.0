Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3252C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 10:36:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.16576.1716287794870228833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 03:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=emNtBDx4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-420180b5838so21756715e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716287793; x=1716892593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7okfzB76WjxIbLyXSkNOfdv3154Qhlyiow5JH0VGi6I=;
        b=emNtBDx4pIfz5WJujYFAbwvhTXyf59bQ2j2bbUqXIsCjsd9aJfNrEzebFGTGvbW2OY
         VDizldodYyIa0ud9UdJ8UeZFz5sqHo9hX083AW0xmLT2zdLIixOZ5W6ov8jD9oAms/AX
         31t9ZEL9i/8TVRKyY/OxzbF8SCKEiu65ZHfMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716287793; x=1716892593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7okfzB76WjxIbLyXSkNOfdv3154Qhlyiow5JH0VGi6I=;
        b=oWofymjL8jazTXAS4xrZ5hDNZITE0XOY4RhGmpGkGHkqVhCyupEnGxI1O9i8x833q6
         zCPtabxLqIdbHXij0DK3dXkdNFCoMxf7bM1kh+hWKas7nkghHpqgo11K4Jxrh3Uyovpu
         6s0fG6rNDhJl7E4wF1+xSEKb8DY+nn6T2P0EVLfEuGuD5O4jVrjJTuYVQSy3qtM06Uvg
         ElwbgGbt+fiWYJ+eqjKJN7FbOoY7uUMU8zqRYaUbBCY/EO8dbk15qv2//QjdvdWQ0bD1
         3uZH/JLIprCwoDHZlGCXcHxtFXQQYG/hjVkSLRJehKvlhCYJCcDkefltXMNLuRWmpo9x
         3PQA==
X-Gm-Message-State: AOJu0YzfXdXSo6JmjrPGOCwG4e2ldVg20Hb+VwPbqF1XimR2dX6opi4i
	FYPX/4WtjjcVkmnOzrbvuJZ6pU0ILZVI+M2ZVBD9ZC7OgfDmowalEGev5bVS06Z4/i+YaZW9Wlz
	JvUc=
X-Google-Smtp-Source: AGHT+IGMOGyKd4KPRYRpwJtvyn7Sdk204GGn8AOm2oH3265Z8T91G5gf/NxgkwGekh9m6fWyzJ9Zag==
X-Received: by 2002:a05:600c:4f50:b0:420:34a0:bb51 with SMTP id 5b1f17b1804b1-42034a0bbbemr118310175e9.18.1716287792641;
        Tue, 21 May 2024 03:36:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88111033sm495465355e9.34.2024.05.21.03.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 03:36:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto: Avoid QA check
Date: Tue, 21 May 2024 11:36:29 +0100
Message-Id: <20240521103631.1122991-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199613

The kernel has special handling of ${S} and it is therefore expected to be empty
at do_unpack time. For now, ignore this QA check until the kernel unpack process
can be more standardised.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e8ff7311c32..f741a342d40 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -440,6 +440,11 @@ do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
 do_kernel_metadata[file-checksums] = " ${@get_dirs_with_fragments(d)}"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
+# ${S} doesn't exist for us at unpack
+do_qa_unpack() {
+    return
+}
+
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
-- 
2.40.1


