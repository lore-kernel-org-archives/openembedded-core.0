Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D196C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 14:46:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.51876.1700491596224720706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 06:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMpGgRAT;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40a5a444c3eso13831075e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 06:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700491594; x=1701096394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E0CTfbvl60Y3TW1jFrt/VbWt4JIFlwnWyvL3oJoQic=;
        b=JMpGgRAToNOYgBo2nrqxT7Aj7SQqUPa2Rf62xw2ZqSscXYotHVwp6FGGp0Wlhi6Ofl
         4YwHbudhqJkXqyWK4rIlutUqKUwYsmnNFlfj4In7UKoT+AhhUNueYqpU4m4Dq9VY4F/X
         +LDPye8j10eS91mE4ycv+20MRgQeRNcQYlf/9yv+NwvEhVg+hACEJSxc2eXFMWc+7f5W
         5/6i63DBFztGBOO9lJpjnUf8h4nI6aAZXenxQLBD7Bap+mxht1y6rgr78OtKh129RCIA
         Q0yTJqt8i0rN77P0/5zoVJ14JSjxMLnUbxZDNbVVzIWC4MsHOgQWo53UAUs1fugWqXcT
         sgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700491594; x=1701096394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2E0CTfbvl60Y3TW1jFrt/VbWt4JIFlwnWyvL3oJoQic=;
        b=OAgBIeWVtvZreoxhHBOVIt4JZCZb50Tj6cSSzCRFo8MYEncLnv7qF7YG+BPr/jb2Rk
         N9oHGbE4+ch63t6PjcSCuaKkztFI5JPOGcrqLAfZYYtLDoOyAJOrV1oO4qgMf2981c4l
         bPAdQCOSQkAQo4DvikJcyCOL7Aa36+5Xj9u4QFOBSIvKsug3cyk66DOWcNLLicz2MOMl
         Kk30uRxekRj3B+LkIsxp73YxpdiDBXvzB1MXKXkgfNR9NtX5mGKG/6t8r5pQ3tgI13V5
         kPy4g0lA2liT6mDYtmmprJjvKZxeWSI4kQmT3IIIZ7epD/rF8kStEFW52M801yl+OZT7
         cX3A==
X-Gm-Message-State: AOJu0YwCeiGO34eHjUYkHAh55i+DKCOm/W0ETyh14HXVo9BcLKGnRE2N
	7wx/iEATjEe0f8gf2bXMF/3cQlXVjXo=
X-Google-Smtp-Source: AGHT+IEdHuS5VwB4X0nOsCR5ED1UsjzOZkPProNTlee/QjfLqyS7dQl9e2AYA4JhNfsUTdqHYyjjMw==
X-Received: by 2002:a5d:6d81:0:b0:332:ca14:f589 with SMTP id l1-20020a5d6d81000000b00332ca14f589mr1286561wrs.12.1700491594258;
        Mon, 20 Nov 2023 06:46:34 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a18-20020adfeed2000000b00327de0173f6sm11454848wrp.115.2023.11.20.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:46:33 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] cmake.bbclass: optionally support qemu
Date: Mon, 20 Nov 2023 15:46:28 +0100
Message-ID: <20231120144628.52664-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120144628.52664-1-adrian.freihofer@siemens.com>
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 14:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190880

Provide an easy way to enable cmake-qemu e.g. on distro level for all
recipes inheriting the cmake.bbclass.

Therefore a new variable is introduced: OECMAKE_EXEWRAPPER_QEMU.

If set to "1" all recipes built with CMake can use qemu to execute
cross-compiled binaries on the build machine.
One use case is the execution of cross-compiled unit tests or ptests,
e.g. in an SDK context. Therefore, a variable that activates Qemu for
all CMake recipes is much more useful than just providing the optional
cmake-qemu.bbclass.
Further information can be found in the CMake documentation in the
CMAKE_CROSSCOMPILING_EMULATOR section.

There are some use cases for qemu-user, but users should not be
encouraged to use it as an alternative for clean cross-compilation.
Since the core does not need it either it is optional.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index d978b88944..4d8e2a206f 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -14,6 +14,10 @@ B = "${WORKDIR}/build"
 # The supported options are "Unix Makefiles" or "Ninja".
 OECMAKE_GENERATOR ?= "Ninja"
 
+# qemu-user can be used for special use cases, but not by default
+OECMAKE_EXEWRAPPER_QEMU ??= "0"
+inherit ${@'cmake-qemu' if d.getVar('OECMAKE_EXEWRAPPER_QEMU') else ''}
+
 python() {
     generator = d.getVar("OECMAKE_GENERATOR")
     if "Unix Makefiles" in generator:
-- 
2.41.0


