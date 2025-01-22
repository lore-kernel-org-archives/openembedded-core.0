Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD78C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 10:03:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.39959.1737540212258410939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 02:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JdJ0MDnb;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43626213fffso4047245e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737540211; x=1738145011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy/9KyZmlmhm4oA/Gz3wIfYuioa6eXEPkSnehC/F/SM=;
        b=JdJ0MDnbKxUSkXghTIvDfK5PDl3BYzjkm/S+9Iz376fo4CCG9q15QeaK2e2HD4S4BD
         6VCNPfGPuZw30KYUBSheLA3uGBgR5qFFZYp5cdaafFK8i6AoHvomB5Yw0tI+Pdy/KnyF
         b5PBFakOYsY8pEfRo4T8Is1HAfQyoQA1IF9CAHCYJABsp3kYylsVcaKaffUM1tVmmv7m
         Tn51HwlDi1B7vjjfEN9cKgpiDwKWHPoDLoCCVEth4IctnwgEbK3bIJ5+grgKAs3pU/1Y
         sN8hSG59L6Fdp4nPtvLxa/XSa/SRiXX264mqJeSrrTg12cGRokleRkRdHypZ4bps41/R
         SUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540211; x=1738145011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yy/9KyZmlmhm4oA/Gz3wIfYuioa6eXEPkSnehC/F/SM=;
        b=B0Z4pwD4OAs0+pM3revnR1bjNwQcCagc6jQ7BM8noKssGW5KUepPUAcRIUezR9A5XO
         1uqKaN33JooFLfUKhNktNSjfEHBZCz2tAfKxjmOiVWtnxtn0Wf6eU56G/MYATRriO1xO
         8XlsQqTwG9ewZd6uPbq8BXszd4lfGo+RtzuIrbQVu1f91/JnPqSALzh2jHKO7LzfUPR4
         3QJ0/MxP8MJWd5ffTdj/36rnt0Ie818Ircj9vmTG4D0lltzd66Xk4vDeq/qxyLXoaY5E
         PsKd03FcJz4WMZWKObiZcP9m0FaJAMOOZr1JSxfTbtbjndEtMPfDhnHmxe05CvUX/0SB
         pa8g==
X-Gm-Message-State: AOJu0YwgQZPyJuLA4UdVEJ0CzHOumh2YjEZAahwZ1a8cl1u/fny07bGM
	5JUBaq6nten8MjxTbGxIN8r9zxfnl21fwJK2Ncz+Fhuy7gadH2o4IeXm6w==
X-Gm-Gg: ASbGncv9kzSp7lYjBo1RN5VBwvbP5ZK5bcUUGggQ2zBWw4eR6/fCKxEcShbfdWj1IfP
	U1SemIYyNC2MFTb0eDOLQZYIERQsYiEmChahSJF3jDwf30t9ZR5wJ+48KtEPXFI3v/L4MdyZMkY
	UMuR531m4P7ToiNxY7miPkBn9rnXIwyQoXsM3pJB/9/3VmElQx3HDL8tBgtaMp++fBSy1o8j/6I
	joIkdljoVJkI0CuGoonQNNU9ZuQdQB95UTzAJ08OxI2KTpctKr9vb0BPePHMHfvPSC42SskTGFu
	bQgMrRotHraPdlDJS96p9FmxXtpWx+w=
X-Google-Smtp-Source: AGHT+IHRkpgBaVyIyYCs+v8Vk0zNdWonifWzyZjS8y01xhNYGhU3mfgkce1e3Q2SLaGYA91KVJtAOQ==
X-Received: by 2002:a05:600c:1c21:b0:434:f3d8:62db with SMTP id 5b1f17b1804b1-438918b9b23mr180781035e9.2.1737540210042;
        Wed, 22 Jan 2025 02:03:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm15606997f8f.28.2025.01.22.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:03:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] tcl8: add a patch to address Y2038 issues (tcl 9.x doesn't need it)
Date: Wed, 22 Jan 2025 11:03:23 +0100
Message-Id: <20250122100324.1561841-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122100324.1561841-1-alex.kanavin@gmail.com>
References: <20250122100324.1561841-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 10:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210141

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
new file mode 100644
index 00000000000..18599928385
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -0,0 +1,33 @@
+From ff508f2e6786df697876140f21855ecb92a3ed36 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 18 Aug 2023 12:25:11 +0200
+Subject: [PATCH] generic/tcl.h: use Tcl_WideInt for seconds in Tcl_Time
+
+This ensures the value will not overflow, particularly on 32 bit systems
+in 2038, where long will.
+
+This patch was proposed at https://core.tcl-lang.org/tcl/tktview/86dd172271
+Upstream was generally supportive of the fix, but they merged a much more
+elaborate version of it for tcl 9.x (released in 9.0.0), and declined
+to merge it into 8.x due to ABI breakage (sadly this change is in a public header).
+But we can carry the fix downstream.
+
+Upstream-Status: Inappropriate [see above]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ generic/tcl.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/generic/tcl.h b/generic/tcl.h
+index 3a4622e..6204c57 100644
+--- a/generic/tcl.h
++++ b/generic/tcl.h
+@@ -1418,7 +1418,7 @@ typedef enum {
+  */
+ 
+ typedef struct Tcl_Time {
+-    long sec;			/* Seconds. */
++    Tcl_WideInt sec;			/* Seconds. */
+     long usec;			/* Microseconds. */
+ } Tcl_Time;
+ 
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
index c8f4b5df2aa..076bbc906c4 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
@@ -23,6 +23,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://interp.patch \
            file://run-ptest \
+           file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
 SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
 
-- 
2.39.5


