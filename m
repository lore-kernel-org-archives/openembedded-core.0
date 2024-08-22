Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588D5C54731
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.9506.1724319334748146216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IlczbVuv;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bef295a429so964257a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319333; x=1724924133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BbD9SkEuhE+i6UvkrDi9/wmgmjqZ1cHtYV4T2Zb7Ns=;
        b=IlczbVuv2ejYEt5EGm14uQriHr328QmCBySwfw+BRUA02lWLDcm8lmXbo47KLQq5rz
         wNr5tfHKUR+X55leBdKqY5td+kInVHqJEBQgkVRqKaK9y5Tn8iCoyjZTcW4LuTEFyWxv
         wXZT8FlhZMc5jjUZs6t/jE0k3NdUCbt32X0PlztBvxTCSzIYxyO/v5chutoI2pdcUlr3
         E4AF7Iiur8PPCNjjptmN1Naxj73orEeTtrsrbuUbBtWoLlXv6llhb0qc+n57NbwoJlmW
         IM0gNLcGZgXdWHv9sDfApfteq5NU1fEzCSswrgVrISpo9GfBso1j1eb2z2yskGqDnmHu
         chFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319333; x=1724924133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BbD9SkEuhE+i6UvkrDi9/wmgmjqZ1cHtYV4T2Zb7Ns=;
        b=omAgP7ysVaUmsMtCHtvqnAcP2X6zhmKRGrkMI/n668tDgMYsMpDIcV5kadyEpIsRuB
         f+rLBewjW6YPQ/QuleejGa7EaDyNMhWagDIwoLD5D3xEOR8dduYlFN1uDDgqZU5oaDSs
         2Bou3DEWSFLF9jU9pZy8uuO96u+ihtD04LdhIvd82JYH3LXRhLEHHszH77x4G78unBpz
         pQCInx2DUHEp+wLQMe52LuFjpNLDA04OjIM8HROVpur2cbe05r1yVbTA56qzXln6hmHh
         jIeVYJEjAFxE4LbKNdnt6AdETnQgrIti+DVvi103ptIf4IAiVehBbvqCctYVyXyQa4HT
         Nwlw==
X-Gm-Message-State: AOJu0YyvipvT5QXXpd+RsPl9EXbmSxHDmEUu9slK/wWvgJMn+HGJfJvU
	CsSkE+NCY4sHBkBqEqap8/c62IfyAfcW6YQFjScar8gY06Zr+o4gaDhyZA==
X-Google-Smtp-Source: AGHT+IGTodyDgrXfxZ0q64xdljtEYrl4giVgyNL7Wfa2S7utITT1SW059AHG9Vc0QyasfcQDuN2OsA==
X-Received: by 2002:a05:6402:528f:b0:5a1:369b:bb61 with SMTP id 4fb4d7f45d1cf-5bf1f27a242mr2853603a12.36.1724319332740;
        Thu, 22 Aug 2024 02:35:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/32] kmscube: upgrade to latest revision
Date: Thu, 22 Aug 2024 11:35:01 +0200
Message-Id: <20240822093521.36790-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203627

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch     | 2 +-
 meta/recipes-graphics/kmscube/kmscube_git.bb                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
index f8608d46769..415515b908d 100644
--- a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
@@ -1,4 +1,4 @@
-From 5f54f067da7ee24a61d6cb41e0636383729e2bad Mon Sep 17 00:00:00 2001
+From 38237aee63d671cc418902951b8945b59a41a4fd Mon Sep 17 00:00:00 2001
 From: Fabio Estevam <festevam@gmail.com>
 Date: Mon, 8 Jan 2024 15:00:01 -0300
 Subject: [PATCH] cube-gears: Change header file to <GLES3/gl3.h>
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 19bbcd195d2..34d5a7d71d7 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "6ab022fdfcfedd28f4b5dbd8d3299414a367746f"
+SRCREV = "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "
-- 
2.39.2


