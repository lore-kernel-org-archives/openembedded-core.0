Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE22EC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:14:01 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.106726.1701990837514191271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EgZdI5Cr;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d2e6e14865so5177175ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701990836; x=1702595636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi695pgdsjJ9Qelrmi0i6JZ9ODoRUIDSy6IQP/OEYMg=;
        b=EgZdI5CrfMIDljMCo7FK2R8gH+TImDAVCGIMPKL+2AxFc7e1P4si0gxxPg5Z9TR98G
         ll0asBtU2Z+zC3zn7Eq4XJKWboBnfD7o5lRzwv9bIpFdz0U5DXDhy+Z8YvxUj0cObPrl
         NiTksBSGfnbnqkdZX8zld9Bi1IU+oA9kkdPaB5Fi3RCagDZpW6ZZ3cpYLI6jilCz4rZK
         X5mMAzTLogBG4Yn3JB6rHgc3lF/N6FZom2pGlwwFRm0uT83nL2xYe80zS/xrsVsiLkvC
         EyvU4w5aXEuCFM9WUKR4TJL8HHij3rMl6eamuGIT5e/mO+GV1IGB4dvZP26I0i45CsmP
         Bu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701990836; x=1702595636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pi695pgdsjJ9Qelrmi0i6JZ9ODoRUIDSy6IQP/OEYMg=;
        b=vgUbjcMk7rxAEb+Exgm5gIX8BHs5Xl7oQcIVWFkO0sExwQ5ffn3jdorPrx5mQLAMFO
         1QLQiKIFXcoLJ6zoXfLErYTRkK/rip6E70g/MM9kOPZBC36KAVGAV3szN8QhcxGUr5Ax
         PRHCXOjnBxEjUU8NRu7t37KxfuPAlpksLWs1fVweo9w4IeiFb9Bbla1bAWNacJvhztYP
         E4x8FTjDPA1iqSKUhO4774Dw/0XBEQBufKSj8zgioNF0o+iG9XCrCkmwRRHzcHcnXjOK
         FJQxOQFK2/7WsWRmo13LogjKhCi5oIfhchid5nJP9vWVbbpdfSAbGTkCz39I2EyJfGA1
         VCEQ==
X-Gm-Message-State: AOJu0YwtR27x4m5RqqNNtqBxjeH+bldf6wbvWeIssE9XC8ETB4AefnQL
	M6+fd+S3Je3uYgukXIyuI08Rv1s0YN0=
X-Google-Smtp-Source: AGHT+IElgfnPRVLXjp2wxJFHouOTgWG+cENYtTFRvBqwegHwtTGOxDlLWEaQX3V//f1SmrMiMlfqew==
X-Received: by 2002:a17:903:18e:b0:1d0:c942:37c4 with SMTP id z14-20020a170903018e00b001d0c94237c4mr3405260plg.52.1701990836539;
        Thu, 07 Dec 2023 15:13:56 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001d0696e9237sm349695pls.118.2023.12.07.15.13.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:13:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] classes-recipe: add python_maturin.bbclass
Date: Thu,  7 Dec 2023 15:13:20 -0800
Message-Id: <dbd974364878615b6d8a1dbfa40de92be0e71ab1.1701989368.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701989368.git.tim.orling@konsulko.com>
References: <cover.1701989368.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 23:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191984

maturin is a replacement for setuptools_rust and another "backend" for
building python wheels.

[YOCTO #15312]

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


