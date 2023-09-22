Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EE5CD4F41
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.16020.1695367499352679211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cq+hm4Lb;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so2150033a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367498; x=1695972298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW9EcWu/YOePQoP6Aql7nAisza5GD+v9g0DNiCmKszw=;
        b=cq+hm4LbO/k6rVlM8VdkkuvWWkXhf5g+vWlNcnEop2no8ajvyuA9TlxZQBYQoyjL8o
         Uw+axJywE2m1Mkv9SH2gTaeSZ6RBLEGCwTKciIL5xZ3GMYsnv1bDOTbR8iMEP8sLgsHK
         XbpUP5V1bBtkRWW/aKrRRaEYMqYpDdePNVXk9WZltM3YHGA5+k/LEeDKUdSjqIt9oDLU
         ye9NBo3lSQ/ZNwyGLTe9WRTBjJ9b33wD+coQT7adMsYwQjeX1jbbCZ8j91wvIC0OphVY
         m/13bw9qTymYgM5g5zXewrMWI/GPvNcWE4jT75JturAXWKDUvWL0UW3/yHxwDUtDCUWW
         OUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367498; x=1695972298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW9EcWu/YOePQoP6Aql7nAisza5GD+v9g0DNiCmKszw=;
        b=AqBNINTTKsgVIoCSqznQM6xIQiL43HqGGutDsQ9o8ulHvQ/9fgsPpF7BaZS98a6bUQ
         aVb65Y+egN6FWwZbjKo1rneG4e3Uwbvp0a/57YZ1lM3HX3b/F0WiAqfpwc6b1zWReHAV
         CLH2pAHXGT2eQm4YWD0hSAz0b4VXn24eaWZN4i34hx21ly6WAlkJI24u4TeEpNRzF35O
         T5HSwyPAEJrJ2+0faItpDimmCRE5DgY3aMc5o4Wwi6tkOYFO7bmI2ZohtEM8aL+cC/SB
         tdhJ/aSRIJv2PCcJfwn3GqM/DF9VMC/d/43tNBcbd/5zVa80izt6lxOCwyEzab2myxIz
         EG+w==
X-Gm-Message-State: AOJu0YysM0x2UB0J41Pgn4dnjuXBg8ESpTK3s2a/RI/UClpZErF+5JMg
	VUz91/dgRnnxeXF6KFF4CsUtdh/6STI=
X-Google-Smtp-Source: AGHT+IGsKKIotpealjY1absBnOBRHfBDhw19vG0uT39fYoxK0wO4gQ/59LJ90FxeqLtsrr9wXtvR0A==
X-Received: by 2002:a17:907:780c:b0:9ae:56ad:65ab with SMTP id la12-20020a170907780c00b009ae56ad65abmr4673831ejc.45.1695367497639;
        Fri, 22 Sep 2023 00:24:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/40] vala: upgrade 0.56.8 -> 0.56.13
Date: Fri, 22 Sep 2023 09:24:28 +0200
Message-Id: <20230922072431.1481743-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188079

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/vala/vala_0.56.13.bb | 3 +++
 meta/recipes-devtools/vala/vala_0.56.8.bb  | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.13.bb
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.8.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.13.bb b/meta/recipes-devtools/vala/vala_0.56.13.bb
new file mode 100644
index 00000000000..0d43ac59a0c
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.13.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "4988223036c7e1e4874c476d0de8bd9cbe500ee25ef19a76e560dc0b6d56ae07"
diff --git a/meta/recipes-devtools/vala/vala_0.56.8.bb b/meta/recipes-devtools/vala/vala_0.56.8.bb
deleted file mode 100644
index f55fb41ad39..00000000000
--- a/meta/recipes-devtools/vala/vala_0.56.8.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "93f81dcfc6a93b77baa271d65e6be981ee3238ad451ef380af118e295d904bde"
-- 
2.30.2


