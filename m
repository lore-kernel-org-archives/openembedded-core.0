Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A661C83F24
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:32:55 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.15175.1724938366016773904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wubqkwgT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so433723a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938365; x=1725543165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdZ7qWq3OelA4oDFInKlY2gXPiQJKP5z6HlR1bgE9zI=;
        b=wubqkwgT1yYzm4roNuzqTcU7KcywHzlJHJO+FsQr8fFvdDl/eI6MEMvTN2G/dCyx0M
         osoirumcmUFrY6gyf8wKjCYgIO3F6pHd9GBM5Wp8ofn0fczM7tRSkClyhd7OCsn9gEps
         sYvRNncVndLAEPZmM+f9jZDBnc6NR/XCWMBC8/5zy7mbWgaMr1It8mtzAGP+DrYkmMV7
         Rvi+WrimaX+O3jI7M2QXfGMuLDO59Aw3v3nvGi0iJxjYlJqPV1KPUK2IRYjPwRraRIpj
         XzMc6f/dFyr7sxF+icB316GwPg1ulYrGL44s5gSjuJJq/7YpjXh6jX1Eh/EgNGzNc/pn
         sOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938365; x=1725543165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdZ7qWq3OelA4oDFInKlY2gXPiQJKP5z6HlR1bgE9zI=;
        b=f6umFLt/bxERB0VB0faU+HWay0PXNOEfszWZHESWef/KV/hBsfQpbnirLMlkY14rEa
         clG1Jd+MT+coyBS5kg2xTJ4B+YvmITBNS5zhpIP6Z+EnKGGQjU/TrYLklXCtq4tZBWJg
         OHABcIJ/bmM9oNGu+nEqcUWdIlErjM9qYVhAEtObs+Z6MvUR/GQwTPg3RVduwbPMchNw
         Q7OkIaE12rCkVeYS/091fDn4/b1QS6f6Urewx+yLMNkpH/cBf0DNlPoy8sFe/oVImzZc
         ob+IrHoSPU2XjCwwb+RvfKQdzIeHQ8U+wioUbti1cmtCfh5j1eE846Pl9qRtQq1WJLYc
         O/ug==
X-Gm-Message-State: AOJu0YyXmrYs06b/MWCNsDWXla68KmXJAcQOs0X4n9M45Aa38mpv41yY
	qwnGaV2onTSkuREJplSD9nvIYrQJCZ4HgiBTPeJGMG3/evSqx/1DlTdAzuEDLW7RUohCKfBNXIB
	2zjA=
X-Google-Smtp-Source: AGHT+IEjN9m7ruYaljXUQ13WvRa4qyKPtTJ7jqaj/OE9k2mLjSrPip3EAIDLUGxYu+jWxZ3OhFU27Q==
X-Received: by 2002:a17:902:d2d1:b0:1fb:7654:4a40 with SMTP id d9443c01a7336-20516752045mr26287735ad.14.1724938365112;
        Thu, 29 Aug 2024 06:32:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/12] libyaml: Ignore CVE-2024-35325
Date: Thu, 29 Aug 2024 06:32:25 -0700
Message-Id: <f233c1b7d55fbc8c1968c105905462eed5c793e6.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203922

From: Peter Marko <peter.marko@siemens.com>

This is similar CVE as the previous ones from the same author.
https://github.com/yaml/libyaml/issues/303 explain why this is misuse
(or wrong use) of libyaml.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 334d9113d2..aa7fc5e914 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35325] = "upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303"
 CVE_STATUS[CVE-2024-35326] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 
-- 
2.34.1


