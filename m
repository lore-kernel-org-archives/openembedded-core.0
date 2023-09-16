Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB988C2BA1A
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 19:42:54 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.18218.1694893372951839394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Sep 2023 12:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOOKN7KL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso941213166b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Sep 2023 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694893371; x=1695498171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLTBOOI0z1HUYnHr+WMmbUsl0Q2rLe8Wkzbm0jQSqrI=;
        b=UOOKN7KLhQBZ60NZDvoytLi2Sq+2eVKuD3pTAjvD4bshCbZl/Vna/Va5T7DqANB/p0
         +jiDJ64CAaaYSlpZSyzAoW6FVMj7iyf/xV5cGfvth5eO/GjX67UYVYv4uqC5wdV0R4IC
         LqZ6DGHdU3hUwfsJSEISb6YIR6Fo3Jlxk9/XxI8ZUKOr++l1E1XmuwC6FerOstzEoOsA
         OlAs1PsMYnlMqu6k2Hc95D8vx2dzYZsKvBlLPIfSi0QnG1XF7Q0XS2Nu9FJ9Kfq3JZOm
         0BaIxfdeyXh82PmLOLx9vZSFKSpwfHZOKD6DY6kPYOYEr4hz8pF9j7B0/27KiQRIlmSF
         iy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694893371; x=1695498171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLTBOOI0z1HUYnHr+WMmbUsl0Q2rLe8Wkzbm0jQSqrI=;
        b=ZHqbmMf9a+7d4FMBcnnXq02Bp7UVRfz9kkv1GckP8Jmb1o73DkcanW4fWdiSaRdin6
         WpPdPeK3i3fb4EJc84DCjlA6eYjxRKoyUl50r+jNv0Ax3XYyV7rJkLvhIPVRFKK36/ao
         vIMhPymMegNK98htTDB1Wpd0za/9KdictEFlsthFBefuYofS4SaRBXoQPqm+fEv3oTbt
         oFVSL4juQcvp9F7/CRcfFXoHjKT9+mFe61sKHM4uP1EtiS42GMHh8r5afqesuIojiKRA
         L6lyebIELdT92RziQwGkJJSOr/lT65MhddRfag2Np1Q+Mcqs1ABlAxs3o+fe3C6GoQcW
         TMxw==
X-Gm-Message-State: AOJu0YyGK2VjeBb2W8FRAAZI7+EiM1jaF71a5h/AZovnRzMgSgkYT4f4
	qpLVg2bo/hnw/1izqalSZF2XgrWoJnU=
X-Google-Smtp-Source: AGHT+IEv1YvM1MgsBWmG0cnd5ReeVytNrn+vQeItWi9ZysQmGmRNxvkXXe3nb8oVKaQKY1EWWHJnfg==
X-Received: by 2002:a17:906:53ca:b0:9a1:b144:30f4 with SMTP id p10-20020a17090653ca00b009a1b14430f4mr7651308ejo.14.1694893370898;
        Sat, 16 Sep 2023 12:42:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0099293cdbc98sm4098410ejh.145.2023.09.16.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 12:42:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] groff: do not build in parallel
Date: Sat, 16 Sep 2023 21:42:45 +0200
Message-Id: <20230916194245.150600-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Sep 2023 19:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187772

Sadly a race has been observed, and so serial
build has to be reintroduced until upstream fixes the issue:

https://savannah.gnu.org/bugs/index.php?64681
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5622/steps/11/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/groff/groff_1.23.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 1dcd0bb605c..2c8c37cd563 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -21,6 +21,9 @@ inherit autotools-brokensep texinfo multilib_script pkgconfig
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/grog"
 
+# make race reported here
+# https://savannah.gnu.org/bugs/index.php?64681
+PARALLEL_MAKE = ""
 EXTRA_OECONF = "--without-x --with-urw-fonts-dir=/completely/bogus/dir/"
 EXTRA_OEMAKE:class-target = "GROFFBIN=groff GROFF_BIN_PATH=${STAGING_BINDIR_NATIVE}"
 
-- 
2.30.2


