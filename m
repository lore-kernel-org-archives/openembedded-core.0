Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC67C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:33 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.11478.1720800203551896646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KqlYND+6;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-25e400d78b0so848980fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800202; x=1721405002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VYdiuKrDKrBqkpOiI+JNPgOWytHmfR9UpW3NdsbrnU=;
        b=KqlYND+6WjJ3gtdRgC5CbRWie+7g+Iai0n7T4uQEwiu2VloxdHHw6U2uuEERGAyMIo
         y6q6xrL/v8IdoCuasoOALZsiOyt/xh8LLCqm8Iu7Ng6XkToX1JXQzl0/rf/aBixOXQm+
         fG5EfLGt7wWcSwDL/qvdZbWsov6P111NL+SME/rnvB4BAYj7XXC2TSYqh8p1M54XWcZg
         MPDpW5JauKhrbCx2iCe7J9HlmNj7fXYs2dCOYJBMTC96vluU+h50pJOOoYMxLiQxu2ge
         4CYnv9q+TvKnqq3wP/xjIMAKBErRN5KRe8KiZjO2+Vzxueevp/6QDb2Dhe9RsM/1CSD1
         XZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800202; x=1721405002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VYdiuKrDKrBqkpOiI+JNPgOWytHmfR9UpW3NdsbrnU=;
        b=fMXu/lJtAOTQK3dW7Tj3Beb8jVTQt/zVlCobS/ZV0HEvgSFP/2Cl+IOt/hNCVciYrk
         XALkc9+MEd8BDF/OV+jciducrOrY399BXBG38+k1yIQxI2Ar1pFzDf5Ix/hzlXKPXlHF
         LkysmEDRWfBiUDmRDGVn1FZTrW8OSgR8sUDp41L54xAq9/j8lI5WkHgW20VXTODoitdy
         mH1kweMyWLyOPnPBCPbWf99lMkPW7SQIUFx2vB0ZACHJRoc4fJAtSbVcErunbJDAig6C
         YeRb6ZxkJJ2ngG03sDL/ywUiG3LVW/Qbyfd9FjUWHZXA/nDm8tHoWJKMY/lyjY8RKNv8
         2XZw==
X-Gm-Message-State: AOJu0YxSOMdqqlEyba7jUmho30eoHkF1zQ18UX55yiju+Cf+4BxsGeKK
	RwpyZcrQdIGFHrn5nMV/5qjBl7ZfWdl1csLrVjO9oxHhHstN5P9P5P+mwQ==
X-Google-Smtp-Source: AGHT+IG69cuxBmpwyQrevepLflPjHvxBJ88TMGoOLVFSFnUgBeoD7Ix2M6xX1H+nozKImK7FvNmqBw==
X-Received: by 2002:a05:6870:55ce:b0:250:756b:b1ed with SMTP id 586e51a60fabf-25eae806599mr10068761fac.19.1720800202062;
        Fri, 12 Jul 2024 09:03:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:21 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 08/12] selftest: sstatetests: Exclude all SPDX tasks
Date: Fri, 12 Jul 2024 09:58:18 -0600
Message-ID: <20240712160304.3514496-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201842

SPDX 3.0 introduces a bunch of new SPDX tasks. Instead of explicitly
enumerating them all, modify the regex to match 'create_.*spdx' which
will cover all of the SPDX 2.0 and SPDX 3.0 tasks

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 94ad6e38b68..0153ef37cb6 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -933,8 +933,7 @@ class SStateCheckObjectPresence(SStateBase):
         # these get influnced by IMAGE_FSTYPES tweaks in yocto-autobuilder-helper's config.json (on x86-64)
         # additionally, they depend on noexec (thus, absent stamps) package, install, etc. image tasks,
         # which makes tracing other changes difficult
-        exceptions += ["{}.*create_spdx".format(t) for t in targets.split()]
-        exceptions += ["{}.*create_runtime_spdx".format(t) for t in targets.split()]
+        exceptions += ["{}.*create_.*spdx".format(t) for t in targets.split()]
 
         output_l = output.splitlines()
         for l in output_l:
-- 
2.45.2


