Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1121CD4945
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.16344.1695367480692625499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fcPc4xxM;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9adb9fa7200so439621366b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367479; x=1695972279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUkhT6vlHiDXdYMURdPWt3zammu9oRmSK1KN4KNvFAI=;
        b=fcPc4xxMxNIM5CI54VsLRZTdENta6XfeL2lgtkNfgM3z+VaHAcpF9vf8cMFPv6ssXl
         fL9oHIoD8Mktk71vtaoi7Ev1D21N6K8BZxX7A5facUf7HF9yJ/FXkiVz34vNvRtYMsu3
         Ldiif26j/B5u1EzLgMhL7DBdinPLf51fU79mlzSBWoT2JDwf5P4dwZDgyNqrGcF7oOpR
         qBexYBsmPh+OM+5P/nzYH4QtQX3hv9yHs5tSJGrXqkn/rZi6h34FvyuPe47DEiDlr52u
         sFefHCisU2fk428Xm5wyAcRLFXyOw1J7DMUx3wTzpSA2GrjJFmsJoCVLHSq6kZ9iBRzk
         i74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367479; x=1695972279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUkhT6vlHiDXdYMURdPWt3zammu9oRmSK1KN4KNvFAI=;
        b=OuHy2FiFzmUVgfQw9glyN3eeFSHGrt9u/d7SnwjbvEBnhOeXrX4EuWTczkt9rm5N7B
         qxn5otumOyOz0FmzysXDdGB4rjmqvMAx5oSLG09WpIogYrmtt89VKiOh1eLWQZAFLJKN
         yi/U/G9mtLznxMsIyAI2/GR1A5d6M/7dUknuVRv6Q6A4QJ9yXlJXqdB8TVtmQH/ZgWUw
         c6p+60VYsuoyUSPhoK7WFU4XYqLyAxYJU3miQo66m00r8flcdVjH2/DmVGOM/SCExM+I
         iXOPlNIcIcrgCUeM7sakSWrIJhgmTlhMRBmpWjjvIYsf3uQhB7iBPVh0MMUfjlKtDMMd
         ITlw==
X-Gm-Message-State: AOJu0Yw5ycwEoxB94sQqmcctW/MzRajTFgH1IX23wQHfOFkMHyBbGh7e
	qdnDamx6WtXaf+jgxu2+b+JahXkaXuA=
X-Google-Smtp-Source: AGHT+IEMy5aaWZZyFgWFpIsVf4YJN36wxlxFXeq8rsBuSFokzrhZBv66imtioMbBWRIXJmZKx51Sdw==
X-Received: by 2002:a17:906:8478:b0:9ae:659f:4d2f with SMTP id hx24-20020a170906847800b009ae659f4d2fmr2450687ejc.26.1695367479014;
        Fri, 22 Sep 2023 00:24:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/40] xcb-proto: upgrade 1.15.2 -> 1.16.0
Date: Fri, 22 Sep 2023 09:23:59 +0200
Message-Id: <20230922072431.1481743-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188052

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-proto/{xcb-proto_1.15.2.bb => xcb-proto_1.16.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.15.2.bb => xcb-proto_1.16.0.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
index e60e7958a76..67c1e8d97df 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz \
            file://0001-xcb-proto.pc.in-reinstate-libdir.patch \
            file://0001-Fix-install-conflict-when-enable-multilib.patch \
            "
-SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
+SRC_URI[sha256sum] = "a75a1848ad2a89a82d841a51be56ce988ff3c63a8d6bf4383ae3219d8d915119"
 
 inherit autotools pkgconfig python3native
 
-- 
2.30.2


