Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AE4D58096
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.17237.1732536115212332733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RB1zDGzK;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffbf4580cbso10086601fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536113; x=1733140913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIm61w0uf6dDXlptg0TfP+r+VQ7ovG+xkPEZJWVWIJw=;
        b=RB1zDGzKCOZqpgdAUBZmByyJONsFc5PVb6+O7OFhOxeWPULP0L5fed5vrB7beFvwwb
         oS6i3xssCHhrfn/hf7I606M6dXqMZuVGRP4Rc9sy2Z36GydywX8+2WUHu8T+l9iiBaLs
         mUu+wnDdf/mH/hChW2pB+0Avf+T0mKQc8dt/GnjRR615luoNvKZFawjzqB0DkDjnHeFe
         vWx+FTq1udSHTsZd/yxnEARb9xcMloiMl5svjLHUmwDNGRIiyl0vpLlYqt9HpEwSHLkE
         LMYTqCD/niEnq2xKOsH7JifQwHrlK4yz0c39VzFAk7cH+Kx8xFgI5DDT+BmjgUUoTpqC
         BvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536113; x=1733140913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIm61w0uf6dDXlptg0TfP+r+VQ7ovG+xkPEZJWVWIJw=;
        b=fzwf610/vjxBm6tb39cMyWA/NJXtvtugAglk+NF739ZkZtPMN8Q7FWBaEKiylJ25AI
         KrN0/qIj84YCGVNilZmHOZVyOQ0rD1h/fhDoVQD0KymGMEzrUKpik6DGsLY78bc5isDS
         BKeQedNMuBdtcpxjL/NWSc/tVaP0k0FGNNXUo9CBr7yebX7BXs8jWlM6+samvlHZ73IT
         OPj25e8vc9ZJgQO2nQN+d6dYT+77KT52EiZmU6n7YPueBTM9fyo5ZYgj/76Qw3E5SYlb
         WyV9pAqkpvP+iebdEQfuWQhdusM1V7e7YNqT1ainlIGDhbbzH/TCubgVTEPxuG5NiYkF
         GLNw==
X-Gm-Message-State: AOJu0YyUlCBsnkL/MXM6NUM100xFu2G9TY+uFKlGanQL4rUDGphCtTal
	JGlZQ/L0u0qECBDb2qkyn4D4Q/tCLg5zNDggDiY9BbpzeljSqlbvyFxFdw==
X-Gm-Gg: ASbGncvLsrwUjF+gKIhxdI2H7erilm3BP9IFxvkgjD+oby33LL39zLCHVDlx4PvGnXw
	vsQESc3NqpkZehBkNNvulQYD06zIMWfgj70LtQ2O+ctHguf1b5J1TsF/hRXP09j/b1QXGqM8aoa
	2wqz4MXB2c0d4tLYKm3QH6oh7B3P3ylKgV7vt8uVQwXttBXSuPuhQXPoY7b4mVp62nOIZDOcddr
	azpBuPW47lwIdNgVrSfqeqFnSbyL2DotdDc/kXLg+8tf7LnwjSgRCwnAykFfQQ6iCwLGYmXwcwT
	ximuuwLBixc=
X-Google-Smtp-Source: AGHT+IGU4iIxruVqijYiD+rpDA9Ok6afQ2g216XcPVmp0DLDur6rMPaT8ZH7YhXwT62cIIYOU5Hfww==
X-Received: by 2002:a2e:99c4:0:b0:2ff:a7cd:ee7e with SMTP id 38308e7fff4ca-2ffa7cdeee8mr46020921fa.6.1732536112856;
        Mon, 25 Nov 2024 04:01:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/35] util-macros: upgrade 1.20.1 -> 1.20.2
Date: Mon, 25 Nov 2024 13:01:22 +0100
Message-Id: <20241125120127.2205232-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207778

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch | 4 ++--
 .../{util-macros_1.20.1.bb => util-macros_1.20.2.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.20.1.bb => util-macros_1.20.2.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch b/meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch
index e08b586bf0a..0670cf5715e 100644
--- a/meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch
+++ b/meta/recipes-graphics/xorg-util/util-macros/0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch
@@ -1,4 +1,4 @@
-From 6afaaf164ab9370204856961a92ad8ee523a8293 Mon Sep 17 00:00:00 2001
+From ffd285a567e69f1bba5d47c4c0bb493345678055 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 3 Mar 2023 13:24:58 +0100
 Subject: [PATCH] xorg-macros.m4.in: do not run AC_CANONICAL_HOST in manpage
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 deletion(-)
 
 diff --git a/xorg-macros.m4.in b/xorg-macros.m4.in
-index 3b8b8e9..6541236 100644
+index b15daf1..2a526a4 100644
 --- a/xorg-macros.m4.in
 +++ b/xorg-macros.m4.in
 @@ -111,7 +111,6 @@ AC_SUBST(TRADITIONALCPPFLAGS)
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
index 8a0e7bec41c..c8e0b8d4904 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb
@@ -11,7 +11,7 @@ PE = "1"
 
 SRC_URI += "file://0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.patch"
 
-SRC_URI[sha256sum] = "b373f72887b1394ce2193180a60cb0d1fb8b17bc96ddd770cfd7a808cb489a15"
+SRC_URI[sha256sum] = "f642f8964d81acdf06653fdf9dbc210c43ce4bd308bd644a8d573148d0ced76b"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 DEV_PKG_DEPENDENCY = ""
-- 
2.39.5


