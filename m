Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C90E99076
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:06:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152788.1775815557760045095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D7TlV9rc;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so20216315e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815556; x=1776420356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEgByVqts7D4zu+V3hq/yxQSzwcDJhl1D1IhZ0fwTuI=;
        b=D7TlV9rcrIToKBALrJEXiA+7hYaTLv5LRE38QiPMRJ7X4D1P1IrCNluRV493FnRZ/p
         DfwQzPPm4HW8HQ12bOwcge6Ag6pHrromepp8k9rjCt2khlETuZmclG508YmXYaIp0DIT
         uB5cQjoJmP6pEJt+n4OCehj7Qxma1UhrMjxVBYeQJ6WWqwFIgPOkhbdgrcn8s1TxSoDg
         HTUWeS4LP53YiacUf4sG857uievQ5LoHPoY/KcaL0eOOb9GscbgdpdMjTdN/LTmklwLg
         gIwt48cltXFH/3LPU8q6Gk+3BeSX9ZlBILUar21oFHaAkzFgyQCvfV7aZEip3M1FkgEj
         FvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815556; x=1776420356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hEgByVqts7D4zu+V3hq/yxQSzwcDJhl1D1IhZ0fwTuI=;
        b=sqoSlESQWj2oVkEcF8HBYhRYskJ9KyIdLlF+d2awxzjPJytrXMh+jdVsTNOvAASILO
         BjkN5YNHohNeMtxMsec53S6p87KbtHG0FgyyEz2h3OefOd1tUbcN0cF0keeejktDUGgy
         TWRA7VWcPjNWlQqL3xfEESpkp0MuRDPL5/tAQLmY/bLpyBcZpKj7h022jmX+c7eon0NR
         RyW0Nbb/f5UoFvmGeSIDABUc1sWMBMzXAgIJZj1GMGkpuiQPOxh4SBVdneeGwFNFgT3W
         AVuuQ9FQBm/je+qxDrNfiiCJS/1nyoZmowh3VgGAoYyuWPJ5DmkY/kKSIBLgcOvfFkng
         1jBw==
X-Gm-Message-State: AOJu0YxO4YO3QrfxDJL7YxbrG6K7OZ5/IidUphIsw4h/IaDu4PcxO1b4
	Cza5w72+5C3OItZD6kuwsgikHgBfyBO1XDyrE6ayUrMVGnx3/OTITcA6jFlyQQ==
X-Gm-Gg: AeBDietGZFl0rEu0kfYB0EfrvqsTd+9WS/lxrD2NT/bIWe9bAhLBMWpFnJ8OtKEJTxe
	PMA1KuRhW1ycSjt9TuUus7pVCiJ3Z3VZxCNW5NRfb58nqzb3G7+RqWoOU4K7BWEL6oX5S6NanK1
	V8MvUTkS5LdJ60eY5g7kJP2LpPh/PfRNIWYiMjb3M+nsGGgd1gCt/AqGKLVSphmbIChZdtknQbt
	R4OCWGo5F5I6rv/vgNFmnkjQHBQKOrpZUWmUxXB2SNNDOtdjDw7BCooOQwkyON0ElGpwkIE5bxI
	dVisQLHgOBN+B71YcrP0IikUuJXG7jnqP+jJsVnEuJimoHSmntlFkl5pn1pns83l0FhbOLGAziG
	Gm0dJstzd6BvHyWOC0xy9fFxbgwah7AQCsz4TIQPvNKPzq2J9rZLkSSsDX+dnIN9t+wIzKC9wQJ
	EK7POglHfzerbdqrEtWi6MDl6Q+TnEvQkE21Zkb7umF82PgcTHyYN1HOyDSq20t5bDKPXAa7J6u
	N5yxmWaqw==
X-Received: by 2002:a05:600c:64cf:b0:485:b6dd:5066 with SMTP id 5b1f17b1804b1-488d67ce664mr28345645e9.7.1775815555909;
        Fri, 10 Apr 2026 03:05:55 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d525c931sm61633405e9.0.2026.04.10.03.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:05:55 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/4] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Fri, 10 Apr 2026 12:05:46 +0200
Message-ID: <20260410100548.3944487-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410100548.3944487-1-martin.jansa@gmail.com>
References: <20260410100548.3944487-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235008

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building nativesdk-libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index ee6875aa05..11ec87c14e 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -23,6 +23,7 @@ S = "${WORKDIR}/git"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

