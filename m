Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2711C46CD3
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 05:42:15 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.14276.1702791727955833842
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 21:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4ti5DiI;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b9efed2e6fso1723643b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702791727; x=1703396527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd9hMygzd/UJ7h30NtVpK7Qm3rsQV125I2PujcGyB+0=;
        b=m4ti5DiIgy6Z3psTI2GO3+uSuHWF2r03rgN7MX0ruvK2H0gHnrdLMO+AAMclv0D+6y
         I8UnzzgvpHBaduzVasK7hDjzidlft4nZ5y0icgCQZrzHWbmtRWlwxEaUqzCa21kw8abv
         hK5RwR5DOvlDcL5g6XeiuvdSFuX4bgWVKBkNki9B0t11OMWfek+4c1cjWPTMFMWIpKLN
         BW/SLBtmh57SkUKrpmK/cEXS41R76IIiqX68sPkbCCEOxM3TEXyQCcRiW/77W0702tPA
         KYK5l1JNezKW5a8KS3po6+0VECTvwmsF+jzxx0Ih7belLBM1pGYRABXXxMqNnxI5kGDb
         RM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702791727; x=1703396527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yd9hMygzd/UJ7h30NtVpK7Qm3rsQV125I2PujcGyB+0=;
        b=hCdG2MoqnCLdH8f5or3FnVrfEgYYpiUtQh0ib+hLQVEg/47J7WJUpKaoXjhHEbMF2r
         74sAhveUB/u2xhNxOK5Bm145aHFJyaiLeyqTirijqIY01ARO0j6B4DnBLdKuHF9Nqmg+
         tpFnZ5/FQbtG99CunNOUtr3fErEEjjfoAOXHJc3jAVfWEYAOcJQ0omuq5sTjKYhCbPFi
         X18JEmw+RPaoQm35JQQlpUwp5J6gclIztwwrhxpA20GiMaedoto3v8ni4qBszEeNAb8X
         GjxLEtBf0PaUj3paJh2qfKyLMQxxjSm2GhKf/27dYBRVhOQHohxRBVYxknXBouxjawKG
         HXmA==
X-Gm-Message-State: AOJu0YySPlllPKjMRlBgBHYYEAEidbJHPI9472/JVIaOcHKs6NktzAee
	+5ED5ebVSx0eG0jJ81RtM5hLQlihB0I=
X-Google-Smtp-Source: AGHT+IGLsHasXxJS2JO1y5a/MPRtvd0slEuiLaGh5NCsH7ciODJ+kNfh2b6yYsk89sY/nOL8nMFsUQ==
X-Received: by 2002:a05:6808:3c99:b0:3b9:dfb9:ef76 with SMTP id gs25-20020a0568083c9900b003b9dfb9ef76mr22976986oib.10.1702791727064;
        Sat, 16 Dec 2023 21:42:07 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006cedd530420sm15365545pfv.52.2023.12.16.21.42.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 21:42:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] classes-recipe: add python_maturin.bbclass
Date: Sat, 16 Dec 2023 21:41:29 -0800
Message-Id: <c8c655c6cb3a2759c1230fe4c9073ff64006bc37.1702791173.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702791173.git.tim.orling@konsulko.com>
References: <cover.1702791173.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 05:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192577

maturin is a replacement for setuptools_rust and another "backend" for
building python wheels.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes-recipe/python_maturin.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/classes-recipe/python_maturin.bbclass

diff --git a/meta/classes-recipe/python_maturin.bbclass b/meta/classes-recipe/python_maturin.bbclass
new file mode 100644
index 00000000000..c39d6c6e37d
--- /dev/null
+++ b/meta/classes-recipe/python_maturin.bbclass
@@ -0,0 +1,17 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit python_pyo3 python_setuptools_build_meta
+
+DEPENDS += "python3-maturin-native"
+
+python_maturin_do_configure() {
+    python_pyo3_do_configure
+    cargo_common_do_configure
+    python_pep517_do_configure
+}
+
+EXPORT_FUNCTIONS do_configure
-- 
2.34.1


