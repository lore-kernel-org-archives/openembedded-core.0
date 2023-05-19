Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F88C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 09:58:17 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.21963.1684490295304965463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 02:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=af5YrUYp;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-95fde138693so130380366b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 02:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490294; x=1687082294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRl/kpZPEwkziJ5Ba9Sv9XKfOw7ymDcc2WS01Q/imf0=;
        b=af5YrUYpQy3UcH2IHv1O0uS5TxWx2fobPfD8ZdV7GWgwIdQoKwrM+OlCWYvuHdJbyx
         SvZJaoymgyRvM2W7S789vDsJx/rJ6sodkzGpMCXgxVi8BaYQGSIsZNKTzkOBlvDkhfyA
         dSn2j03PLfHkxK6KbU7c2ie0R72i7f60ybpsNPfFjdrXdQf5NvQNokUx86fv+5E0aWp8
         OPFGlZ9oi9cQ5Tb+ZAJFqCqlEkhVMzTRC/I+2QtxMwWiiGOOrscRYdc43NrSXQRjP68h
         EgOS86+nJdJN8fuGEpAjreTKfgE1OaFkmgiNiKrSCllo+k8yNGRBER7xDz4EtolZHYj7
         k4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490294; x=1687082294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRl/kpZPEwkziJ5Ba9Sv9XKfOw7ymDcc2WS01Q/imf0=;
        b=OdH4/Ga5lSenaXNAEHLlqrQMOjdWXgYM+3uEAlo1crT1UoD+HuXah3C0RCvn5WDJ5b
         lXqrGysagCsxaG08ZV6XJDoi0zMjJoJGvnwE/GWf0Soi9N169oWQFz8zMr4TJwBGT7a3
         HwJ9PLc7XBLtjvsQ/Lr3+eTRAuYNWtnY/z74X3ZBMbH9moC0a0PlV0Wmtm5MxkyntNRI
         mugLfCrV5KiqkEYP4rSU7tOZflzZ+4XckoyRqDvYg+pzFwosNwqkboR6/ltRd2EAxGoa
         cp0+grJ0GNTMRePSe0O5h7ivb1j5OMRLJ+v1BOZctUeTwW1dcQlT5ts4bU6uwInUfKjq
         fTFw==
X-Gm-Message-State: AC+VfDwU1gqO+mPAw+Y9ov9+xaYkQ7j/khlExD2pKD+qVgPWgl3IweX3
	KbJoHUgYUsxuc62C9rUnEmN3DeWm9Ow=
X-Google-Smtp-Source: ACHHUZ46kWLy/eGGL7dLPqrG+JROblVN/2PWu0U8UQJ2upvscI0p/sKL7U97yoXgGgnEDAiKh8otDw==
X-Received: by 2002:a17:907:7f8c:b0:96a:f8ec:c311 with SMTP id qk12-20020a1709077f8c00b0096af8ecc311mr1353956ejc.36.1684490293552;
        Fri, 19 May 2023 02:58:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w3-20020a170906d20300b0094ee700d8e4sm2077646ejz.44.2023.05.19.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 02:58:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/3] gdb: enable python PACKAGECONFIG
Date: Fri, 19 May 2023 11:58:10 +0200
Message-Id: <20230519095811.1387602-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230519095811.1387602-1-alex@linutronix.de>
References: <20230519095811.1387602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 09:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181544

This is required by latest valgrind ptests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index d03f744a845..645672ed0b4 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
-PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3"
-- 
2.30.2


