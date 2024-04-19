Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447F3C071DB
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.19163.1713529203831584816
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxKgKTJU;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-518931f8d23so2004572e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529202; x=1714134002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf0ZWKlgOwdCJYNaTKVeT7MYvr614uKzAT/bIcOq3XA=;
        b=jxKgKTJUrrpkM+v41Dbw0f3VaMa5AL8taVu6aBk9xU51rIj6nn+Xxa2RPDs6u64+hF
         pYhGrLAY8rQEcTsIavvmgGZqNMGQdVT9Q1PrrzitmtRRBvm/MJnHtxYcSn12tRl+I6eO
         mD6RXCr7S26ANLaltm8PGPnZ8C/dyi0hyassm+/mwZLUb62/vBF73jy7M+tyBFYvVDP7
         IAoO5czEo0J6Fs0kRiXlYg5KJLIax1U0nSOqLn3qJ3I36wmiA8rX7bax+GuesydUg3A8
         rvO8GwT1UaUMi63NaKI31zvYt+oE19voxkXSeBurhNkbZqwy5SSHrlmnWvgSROVTtCLA
         u2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529202; x=1714134002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf0ZWKlgOwdCJYNaTKVeT7MYvr614uKzAT/bIcOq3XA=;
        b=AdGVGZsM1RTFbNS1Nt27c45+A006FQidBxKqX8+JERRElQiNbRXw0UoB9Qys0Po+gO
         cFJFZ3VbNJbAfYhRrxeRfHPj+/8btxzdV5mN1OoEaMYkOh3C7YKDZ4oT3JZspP38qUnH
         94BOK4QFAZwEBzeptqbyMdcTGz3SoaCA5Vvq+yNIk7Um/2RyU/z4VWKSC1JtdnM949Eq
         313XreHH78VJ6dcjGwUr09YkjzpvqYlg8rHlkkQLYWzwChdl3P8jbN6LvQXL3jJ+KfO1
         v3niwYkp+mYPZ209VAC33oIehDCdhzNN1QGIF9hliIvk8IaqmjPtSHe/LieE7V7HrlW4
         QWyw==
X-Gm-Message-State: AOJu0YzLg+1vlK3isdsDvp0/9I1hSvpqQ+XozHfjwihsborzex8LecsD
	hYy8IoaSu9JaN+qg4w5iZR6EjIUQYvoSp7B3/vFFgGaCHAsSwvhCfInsqw==
X-Google-Smtp-Source: AGHT+IGRU0yha3xWAqz305aX/wafBrjvjPmUggXLgn0EjDgVsfD2Y1MWU/XgboLS57cC3LfmElz1vQ==
X-Received: by 2002:ac2:5b89:0:b0:518:17ad:a6da with SMTP id o9-20020ac25b89000000b0051817ada6damr1252937lfn.44.1713529201892;
        Fri, 19 Apr 2024 05:20:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:20:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/19] connman: submit 0002-resolve-musl-does-not-implement-res_ninit.patch upstream
Date: Fri, 19 Apr 2024 14:19:45 +0200
Message-Id: <20240419121945.1920944-19-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198547

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0002-resolve-musl-does-not-implement-res_ninit.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 71efd9035e9..9e2cc34995a 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -21,7 +21,7 @@ The portion of the patch that implements a fallback is ported from
 Alpine Linux:
 http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [to connman@lists.linux.dev,marcel@holtmann.org]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.39.2


