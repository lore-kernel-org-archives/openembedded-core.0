Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7151ED149F3
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 20:45:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.5672.1729889123023249199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 13:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JaV/AV9d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so24103475e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 13:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729889121; x=1730493921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb4902nfhZzF/41YXfiim7wt1vJVhWw5D28PL3sb2us=;
        b=JaV/AV9dzCmbjHQ9LKSOh0+JLzJyA1fzhKPqsqYvIyK+6zDIV7gEiRUSspCoZsgvGP
         V3I+2Lz9KKL9HRXWZDt+hazou5SEco11juH/hFQnPeJewnDVjsu+/k05QAWwHcoZz82V
         G2DrIB20iuMiYkkBswmofx91HcajioNBqDRF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729889121; x=1730493921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb4902nfhZzF/41YXfiim7wt1vJVhWw5D28PL3sb2us=;
        b=DUMBZItEd5anBqN+zknU+OpPP4tbi0gaMmscgTeT7bxamfNrQSyHZFstMW0xEBpj6v
         Dsx1OfIQiqPdBaiqn3OZwxz9EmjTZcm1NGPujS32HJIA/fKKTzit18pINn1p4bvETZN4
         syUuo1T8j4RqSHC4DoSwgecmk3zLtMfmEosXHCs5uVqzVjC0iP1oieyBVKrrrfZzo/vi
         qO90OloJ85iACHQSTQa+nOBtsxBdxBYO5sDgAG4Hn82GgtnbdPOJlVGDnrNQXqYz6SIa
         snzI6WJdL5SHvhA2eiygwA4r9F2E4sfia6ZY1f+GcgoBOPKQeYVm1i1D77lEPgSpH8eQ
         8Rdg==
X-Gm-Message-State: AOJu0YwSKxYiDTh+5GNlsO0kwBr6KP//HIF9EIGhCSH3pNP5zSu+8tY5
	2WtYN25A0KIiRahcZjCZCsMchOQy4WbpupAvQntdzyoDLgEWOiUgXTrYnfiiZ3vtWu/UyPTEoP9
	2eyE=
X-Google-Smtp-Source: AGHT+IGHtjerxnnha1h5wZV8Te06F/NZ5odQlwcOK1swXKH75+eY6+e5qjJlKkcYr2ckBE/fGQ+W3Q==
X-Received: by 2002:adf:f106:0:b0:37d:3dfd:cd92 with SMTP id ffacd0b85a97d-3806117dceamr471724f8f.28.1729889120915;
        Fri, 25 Oct 2024 13:45:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:33:ad78:da1b:e63b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b48226sm2464807f8f.60.2024.10.25.13.45.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:45:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] time64: Fix incorrect recipe override syntax
Date: Fri, 25 Oct 2024 21:45:17 +0100
Message-ID: <20241025204517.4069657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 20:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206377

The original commit incorrectly missed off the pn- override prefix, fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/time64.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 2200144719b..f9f2fd08773 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -41,7 +41,7 @@ INSANE_SKIP:append:pn-strace = " 32bit-time"
 
 # Pseudo has to wrap all glibc calls including the 32 bit ones even
 # if it doesn't use them itself
-INSANE_SKIP:append:pseudo = " 32bit-time"
+INSANE_SKIP:append:pn-pseudo = " 32bit-time"
 
 # Additionally cargo_common class (i.e. everything written in rust)
 # has the same INSANE_SKIP setting.

