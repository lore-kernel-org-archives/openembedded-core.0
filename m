Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49A8C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 09:53:52 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.9071.1715334831681025142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 02:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUuul6nr;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59c448b44aso465878466b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715334830; x=1715939630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cB6ll9dBQ1X7dgrHey1OCFS7KN8yOYEs26PlMQ6NqpI=;
        b=lUuul6nr+6X5Tsc7jV8leaAahkO4dfFN7ByWhTMyjW/5S177D7ODuI36/hRFKlaOFf
         ljSQKpcrxplhrAh4mLseYpRJnmaFnvC59zpTCSUVZT3nCdWj83GjVXIgngRnCcK5fZE3
         0en7xWv5SbmPomZdz3tHDpbfrxbUlwZ3MHKJeYyfGr5nf/sOkjiU4OYsKaMQcKfM3D5E
         ve9r8eUqEH1hOoOQY4zaCGInALn7Z+IjN643srG8rq2fVk9UkeKMXQUgq1UjJuu1gNFV
         rRjAr1aFza0e6SjAGmfDBB6KZey+TS+GWkTGyZW9gLgMmuMOvk3o2PqTOoM2BD4psups
         2AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715334830; x=1715939630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cB6ll9dBQ1X7dgrHey1OCFS7KN8yOYEs26PlMQ6NqpI=;
        b=SWDL6jm+61x4ZWOHCq1ugXT5A4KpWD3EnvFB/RiM8dwLvMM0zW0/csCcBJNlWUDMpp
         J+P5WegBCz2sg8wa1pshVwhUH0yodHF/AzY+V2iK9yw8cub1s5Py7STpWpmSC+Dw2OIX
         fGrBS1qLdPpjl+6vi03amnpWjBBAFaz/kdcViliNz9RmmkFj+geRDJYzT0hYlqoSg30L
         O/DSP2HKYinGILQ8TioIGq8HODtuh50+qH2yOlgJ9t5X1ypd7KO+E3DA0Lf3D7z26r30
         6rkPwjZWOF+r8AfAhYOw9VrJvIxwQadK18lmQtsCl5rCm1gNPLsi86X7KKAyGi/t/EmU
         wEEg==
X-Gm-Message-State: AOJu0YySRdvwnSJHj1yyfhpE702B8Ox2k1LwD4z2VJeXX+Zfv8Q4V5sG
	ZX2ES/DjnKUFMgfHfkGGqwuZitttJQ8xqAq1PzCLgvw3P/5raHlGpuHgkA==
X-Google-Smtp-Source: AGHT+IHu8i9xh1eaOjW9dSHHjHisHRpsaFF7ryabhIpghBr1PPKcvPzvLaiwMpbwBdKKtcJp4Or3zw==
X-Received: by 2002:a17:906:c304:b0:a59:ccb9:846d with SMTP id a640c23a62f3a-a5a2d5d364bmr111225566b.37.1715334829796;
        Fri, 10 May 2024 02:53:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cd90sm166078466b.20.2024.05.10.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 02:53:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] glib-2.0: correct deprecated man/gtk-doc options
Date: Fri, 10 May 2024 11:53:44 +0200
Message-Id: <20240510095344.2107731-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 09:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199195

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 780aa24573e..1a97a0d02a6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -32,13 +32,15 @@ inherit meson gettext gi-docgen pkgconfig ptest-gnome upstream-version-is-even b
 
 S = "${WORKDIR}/glib-${PV}"
 
+GIDOCGEN_MESON_OPTION = "documentation"
+
 PACKAGECONFIG ??= "libmount \
                    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'introspection', '', d)} \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG:class-native = ""
 
 PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
-PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, python3-docutils-native"
+PACKAGECONFIG[manpages] = "-Dman-pages=enabled, -Dman-pages=disabled, python3-docutils-native"
 PACKAGECONFIG[libelf] = "-Dlibelf=enabled,-Dlibelf=disabled,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
-- 
2.39.2


