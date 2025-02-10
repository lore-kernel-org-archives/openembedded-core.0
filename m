Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F812C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 15:50:21 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.54771.1739202610604804508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 07:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=JLjuFXK0;
 spf=pass (domain: snapchat.com, ip: 209.85.208.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so4914419a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 07:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739202609; x=1739807409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYf5C3VMUr9n2PSopaUrBUo/mphJ+KdaQnVGLRYR9/s=;
        b=JLjuFXK0/VVcTnMFGPR6OyqkainXARxP+JupN0VllvF2iMA3p6brA1DkUXVtsHWpnS
         v+Up5uLqfBuEFGEpdwv8njY9Qb2QVCA5GcS+t34jQNFUABUPziXkXO+Gg0yP4tQFay8r
         Fwi/9FglDawfMhyfm6baPOuDTiVZCjfBDz6W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202609; x=1739807409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYf5C3VMUr9n2PSopaUrBUo/mphJ+KdaQnVGLRYR9/s=;
        b=i5vYwsy/xOT3MPowuDyIMbD0jQFrP7f6OsijH1noPzDVu18tqKe/LEu6Q+x5jlhr0o
         nd/ds6J8hezMsEcxX+ghSB9G3TOiZNe+wmdaXJ6hBC+jY4bofABDq0VQ/2mI8QfLECmV
         yXhn+RAcAUNeQiA7kXZRdXisNcysfr1jaNwSADAT5vvGGExYjIMp1YMtHr0hV+rwfl/1
         ImlZQJ0nZZDROfIUFktBbBAdz6EM18JrVbHgQwa138ncuBV5iMFGCeoIWJKJ5EOJAa1P
         CQqw7hlYj5kGDFVytfaB2m3zF/2QsLtr1Dh3emvvx/MBtSxK7Gqmk38u5Ehmv2zj4e8c
         ciRA==
X-Gm-Message-State: AOJu0YyhcBRhYvtZJcD7juY8vxeauOcrjdUASK6An33TukrBZDQuiERX
	H4xN+nmLQ86vHxsmDj7GgZ8u2jpMtBjem0a38lpu8VCHXVa4ysiDwoyTFaSJAxvQyAm04xlsZ92
	f
X-Gm-Gg: ASbGncvLAZ+UgGB99YEOksEc2nMBmcZxdN2wVteH/Ipad2nV45rTIrecz9pEnp8yeeT
	3lFcBgfDUv1IX0GnWRPSqNGzV92mHemVPdFpd1eWC2EejHDXRKks6nSm1QvEH9TQC1R6vK0BiSc
	OqiB/t5Ul5VSPy36B2yMC4IgoMCMGgAEQPYmuXBwnMJen7Axgu11kXeoqX8wTHUFmjeS2/dMOAm
	g1wv617BYXeYGElbyJtyOrRlVdEMWhfNJlFRsPNJUmUKvCP2aGgl02Bk6LOJNnxZTM2Yx8GEulC
	A+7yYrRDuN5Ql1H1RO7aeMAxNfyp
X-Google-Smtp-Source: AGHT+IGUuGZshCmwzfbrfDukQNIr5RAXLbKcxESLXecmiUVXen5Rps4ekpqbRVQjs4M1jg8l+W+8MQ==
X-Received: by 2002:a17:907:c283:b0:aa6:66eb:9c06 with SMTP id a640c23a62f3a-ab789a9be1fmr1616504266b.5.1739202608698;
        Mon, 10 Feb 2025 07:50:08 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d243bba5sm77004466b.71.2025.02.10.07.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:50:08 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] gdb-cross: remove duplicated PACKAGECONFIG
Date: Mon, 10 Feb 2025 16:49:58 +0100
Message-ID: <20250210154958.1119250-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 15:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211099

From: Etienne Cordonnier <ecordonnier@snap.com>

Duplicating the PACKAGECONFIG variable in gdb-cross and gdb-common makes
it easy to forget updating one definition without updating the other.
However at the moment there is no need for two different definitions.

xz is also useful for gdb-cross when minidebuginfo is enabled, so it also needs
to be in the definition of PACKAGECONFIG in gdb-cross.inc

Let's remove the definition from gdb-cross.inc to make maintenance easier.
This enables xz for gdb-cross as side-effect.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 399f4bba97a..4f16deabe3e 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -5,7 +5,6 @@ DEPENDS = "expat-native gmp-native mpfr-native ncurses-native flex-native bison-
 inherit python3native pkgconfig
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3-native"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils-native"
-- 
2.43.0


