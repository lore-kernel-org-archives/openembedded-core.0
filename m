Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2842CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:42:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.30681.1695188558031210502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mH8bms+X;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c3bd829b86so48367305ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695188557; x=1695793357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ioehwqq5FV7RtHmZmMcJQggjnKSDISSuTZtekPpEkig=;
        b=mH8bms+Xi3gw6EAkDZIsAUBqbwwR9BAySoiqHtnM0yxHdI+2/dNobjHgGkXixTON+o
         7SIYfcqKsZRkJwSPgPzuQQvFMy6ZDtaDlLJX6nezowltQfCjrNg/Cg4ikVZ857J/HS5Z
         6rLFlsjhQfT7G3NsHRHNZnkmE2+5YNPUevB+suZ8jIOO04FpUNpMN+y9INyewg60Pj/V
         +jXVpaJeqP0/P2bYZXyV06XV6+0oYZKigVjJJm2Qgn5sXC9/IeFXDbqxgx6AXzBF8Fi4
         +8R8O39bSkyBzITHI/G/V4zWXc6pTXrq2PCRE2TAKyP9VpooAmIqItqEDGubXFTSf1vm
         rDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695188557; x=1695793357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioehwqq5FV7RtHmZmMcJQggjnKSDISSuTZtekPpEkig=;
        b=jJb+NpbHr4MJNqpISQ4iy1tYsd+UJu3fPPF5dLvJnhHph11TU4yIzkWdNFV7HFStXL
         7NZFcJF5EggdetU3kDy5A5IRraZXZuvWkuZ3i0aH3zauIqdRMivPwakJSKApTAlOoev5
         IDa2aswtVOUBA6DCGph3Zib4XHYfVfR1MzbgEUwxN1NimiBF1cnGoaknxoL36sFt7uWa
         Aava9XP/+9YxHx+KJ/lB8TDgvcRdbJrA7FE1HUwHYUfZqtE2Z8lT0EuAjLZDSGpaLR+M
         2troXJw6bFRoBPhYNUJ7hFSRDbWRrl2QvqOpoVcW/luV9FQZroULUBy+7mdiBxZimkwV
         2JzQ==
X-Gm-Message-State: AOJu0YyNoupOIiTFUj8KA0NSlDRUwgWPCE6IPpAMh4oJICYDqv78NswX
	SJ1/qabyyp0KU//yCuEjSfvg3GMm9iM=
X-Google-Smtp-Source: AGHT+IGC3xD6vT5+KI2K2qxu3z+OxgqmSk1rlLTm51sKaV0/pMcGVgkXL9GvfUfcFYhuJOS5EoBYKQ==
X-Received: by 2002:a17:903:25d1:b0:1bf:cac:13b4 with SMTP id jc17-20020a17090325d100b001bf0cac13b4mr1216373plb.5.1695188557096;
        Tue, 19 Sep 2023 22:42:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id bh3-20020a170902a98300b001c55d591f07sm5134485plb.260.2023.09.19.22.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:42:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] coreutils: Disable error_at_line detection for musl
Date: Tue, 19 Sep 2023 22:42:31 -0700
Message-ID: <20230920054234.2514751-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187889

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index e3e27e099d0..fa319f0acb9 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -26,6 +26,7 @@ CVE_STATUS[CVE-2016-2781] = "disputed: runcon is not really a sandbox command, u
 
 EXTRA_OECONF:class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
 EXTRA_OECONF:class-nativesdk = "--enable-install-program=arch,hostname"
+EXTRA_OECONF:append:libc-musl = " ac_cv_lib_error_at_line=no"
 
 # acl and xattr are not default features
 #
-- 
2.42.0


