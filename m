Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A71C6379F
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3838.1676835068874059595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IY1XVi9X;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e2so1053810wri.12
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs0AHTp2jsHXDzWvD8gNw/bdASNDukiZGE6zLJWt2Zc=;
        b=IY1XVi9XVwrBM2yUIN6dcg7sJlZUlbVx5mWChQvWAjva6EhMgwIvXp7/sk3flB6b0m
         OOVl5e/nn/bkswWa1bg+acsF+950XRh7T02HZp/r8aZZ9H1IjDkW2ToX8IhNWfONmuaS
         e9uAsbro1DOUy130Nuf5IiH0EIsxQzO2+q6+Wtq3p9/1jiIS6nZeYWWA5zBHuQWdwb1P
         2vyJdyNqlUEh5JT5Kq4jPAxFdJsMN8jx6LHv16Pb2mV+bEVVPeJ5biHGEJ1nq3Qwu/H3
         K6LYsILt3a3pJkBs9OlkDS/TTtiOqWT6SD7/wNFeuDQN6uP3yyxoqx9nMKIqm1VULcTU
         gR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs0AHTp2jsHXDzWvD8gNw/bdASNDukiZGE6zLJWt2Zc=;
        b=Q/UQPWZhtsd7BVY7rDxnr4l7dSn8ty50dcpc+H2X4WeN1H9Js3tjxPh9SoZQ9wiJyq
         StLCKIvBH5dEVFUdL4bW5MUspIp4fPje2iBkCRAlWSmZdjwPFGNPi+jqWJ9zAGfj3edM
         NGsRevhBBNzljFpzJ3L4lqVtyZJNFqR9YO1dEOdbch2iZQEJ6yUh1as1cRHmPjDHNJaC
         QrjUP7oHe5c8p5dj9Jda04AhFUnCy6auXARzkeo8EWBDm9Z2w/OcxbJ6nhxkBljYnyv3
         mRlwO99Gkqly60Sdqfi5Qqm4qrPbEkTU0lqZmMUuiegjR4x+M7Rm3Rcoekbw+73nAaEY
         OFNw==
X-Gm-Message-State: AO0yUKWzBqem+ze8czdASrSOJRBstDuhLzwnfFGgXnqsTPK0T9m4Q2r8
	3UtBi5i0dGXKkMOt7SAJEZ+72ap++rg=
X-Google-Smtp-Source: AK7set8EVtRaDDg0GWkGgJAJOBIUVr6buZUu4WdeB7Rqrksx3vI2CB7UkI6smXRSABfh342MKFtO9A==
X-Received: by 2002:adf:edd2:0:b0:2c5:5298:893f with SMTP id v18-20020adfedd2000000b002c55298893fmr1921935wro.43.1676835067390;
        Sun, 19 Feb 2023 11:31:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/39] insane.bbclass: make patch-fuzz a warning again
Date: Sun, 19 Feb 2023 20:30:27 +0100
Message-Id: <20230219193101.338397-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177348

Having it as an error breaks the devtool workflow
('devtool modify' in particular) that is meant for fixing
the fuzz.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index ee34d5208d..e60e693ca0 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -29,7 +29,7 @@
 WARN_QA ?= " libdir xorg-driver-abi buildpaths \
             textrel incompatible-license files-invalid \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
-            invalid-packageconfig host-user-contaminated uppercase-pn \
+            invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
@@ -44,7 +44,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz patch-status-core\
+            patch-status-core\
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
-- 
2.30.2


