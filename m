Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBADCC2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 18:31:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3978.1719340288149069143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 11:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IOuISHq+;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a72510ebc3fso388384666b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719340286; x=1719945086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYF/Q5R+eVto4srmy0ohwNxC1/JgZsdFYxwdhuOKs2I=;
        b=IOuISHq+rr+7t0WrVtdhXW1UOcgW7OO99G4ovoCb7fuyk1Grz+SlqA6EYo3GEyHJna
         JMpH529fmvQFyFZZ2LvJseycsxN/VJaTOCnyeI16wuyqR1vfgyDgjspA+C5TXdMPOQWH
         ImROPmNsQJHpoA1JJBHwB1rRDkAAuWz+xabe2jPNRFcaJ8f8r9OpE/KzYZPitI3Ju9sp
         jk9cKOkYr1iPGZj9pLnl02s6lofrJ4VFnNUl6W9d87Z+MTroB8Y4vHCk65iXK/DpONKm
         WPL5fPhvDe9sfepvtjtdluZ3P9OWEJfwxLHD4UmEvv/y12gxoAtc7lGfJlc136rzbv7f
         OpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340286; x=1719945086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYF/Q5R+eVto4srmy0ohwNxC1/JgZsdFYxwdhuOKs2I=;
        b=ddHvQhYW6UOdXIxw50+xiQBA5peHCegEYuuHb57Xn4khqaxPMahzA2kSxglqDIC5SA
         TkhSn21lqwuXP7vpgz3VOOaBlBmFGE2wAHKMzdImN4Rf1IuCM26QtSe9tHMK8slB+W1I
         +qLHwKvMH+dbSy1ao/FX64HK7NnoEYCOuV0syLC4VxAyxxmYSuZU5vA90rMo984mUZOc
         3sqnTJfWk9ymo3YnmCv703AjKpxygYeTv9Lr+5AB+QnebyrdF/IiE8FPO9VflwWCRHgW
         xtJvhmUvmYslvUhgP15asOQxgbt4rocBU/aoWNt0T7sbKn3W/Fpr62nJSPEULLGymc31
         DfAw==
X-Gm-Message-State: AOJu0YxxbssQYRK7bOzZbdPOClenz9yCr1Tdz2UWCkNmK6SbkgCXsDIq
	Nfb87+tonX5HcbibyJgmQK+h8FJQyu/ASY5DskFHRdUvbC8cuiSkVwo2Cw==
X-Google-Smtp-Source: AGHT+IFwoPiuXdcrjF6Y1W96vp+aHYvGBt85q5ogPW7BMR0B1D8NruGtYmW62LgE1sx4ODT6QrURHg==
X-Received: by 2002:a17:907:d40a:b0:a72:7a43:5cb2 with SMTP id a640c23a62f3a-a727a435f45mr262920266b.1.1719340285957;
        Tue, 25 Jun 2024 11:31:25 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf56ed47sm533136066b.197.2024.06.25.11.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:31:25 -0700 (PDT)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v1] devicetree.bbclass: fix setting S
Date: Tue, 25 Jun 2024 20:30:46 +0200
Message-ID: <20240625183047.240309-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 18:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201141

From: Max Krummenacher <max.krummenacher@toradex.com>

When a user of devicetree.bbclass overrides setting S, e.g. to
git/overlays then having UNPACKDIR set to S results in that
git repo unpacked inside UNPACKDIR. Thus the sources are actually
in git/overlays/git/overlays rather than the expected git/overlays.

Change the logic, so that S by default is set to UNPACKDIR,
but a user can change S to point to were the sources actually
will be.

Fixes: 7a06069a041a ("devicetree.bbclass: switch away from S = WORKDIR")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes-recipe/devicetree.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index 1806cb62cbf7..e5dbd9a85714 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -40,8 +40,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SYSROOT_DIRS += "/boot/devicetree"
 FILES:${PN} = "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+UNPACKDIR = "${WORKDIR}/sources"
+S = "${UNPACKDIR}"
 B = "${WORKDIR}/build"
 
 # Default kernel includes, these represent what are normally used for in-kernel
-- 
2.42.0


