Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAB6CD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.27133.1694943548383978196
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PanHjOXa;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso428661166b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943547; x=1695548347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7S6YnXiFLREBBCuCCz30lPbY2Xq1AJy8Jzad59s+BA=;
        b=PanHjOXaLiAO7MF1i3rQ3l9j+bFOkjyIddAxFMzKh3I+OhnYDIpc2zNGOXbyv7ghdQ
         ngLyTdHxSlMDX/nbi8OAo9p2am24EYkpLZxu6JJZQPAiR/HwhmEUWekLy4Qkuvjdz0nc
         kPDHRHK0hh4uldAlEiixAftOe8T1W8ie4z8Pddp5Ap1ycIlLEm7Us5SzY8ULKLSuubTw
         TAMf864DWpi/dy6Azr2m4zl1Ql/NCR9LVjEZnT+jMQQmihjcJBhzOCg9aN/qz4AVrVYT
         KStJZykAsoBQgQueDxuwhnPgQp1Wjh/YzVABHw1ggQuTkZt7C6OjH3h7pvAI29hB60La
         5oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943547; x=1695548347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7S6YnXiFLREBBCuCCz30lPbY2Xq1AJy8Jzad59s+BA=;
        b=SDP0oh2wilrkcCql52Q4n8PVwAsIkQekSp4oorXnAtI+39xYcvM+6AH4O0OUqdEc0v
         EvrwAfg16jMSPNf6eu7t1u3vluEW6V7giM34be2RcYVwc6n1k17uBCyEKNNXEyq17JyW
         57r+YbqlaiXtTQhTk6XbqTqj7yGS60pxTz2EFQ/9aOR2FjtId72wnIhaUVTDbuvQEptd
         /hfx9fMxWDqblcNJWZO3SAADuS9hw0+Lrq+IcrFpby9eGaV1HfL9tdLgrkw7f8dNKDSz
         lmxFo8JJ/Fb2e1Yj8O3c3KA0QWyQ/y+4Bwvfw7CzmZz6xKboJLWE4iY8wMut6I32omkH
         8Fuw==
X-Gm-Message-State: AOJu0YzP2BMYBP0ZuNiwl4XMPL5GNKBa8lD12W168heMkmOMAFN465Z5
	cAjHciej5ft2BvQVtxZlCPsiiPll9eI=
X-Google-Smtp-Source: AGHT+IGPSQ3Qx8Wb7zIP4VWcdWZS+mfOwVB693lyw8/cg8TV5de0W9ynasbals7V+XCt5wCh7yHy1A==
X-Received: by 2002:a17:906:2d1:b0:9a1:c399:14c9 with SMTP id 17-20020a17090602d100b009a1c39914c9mr6348689ejk.15.1694943546509;
        Sun, 17 Sep 2023 02:39:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/29] useradd.bbclass: list all needed items for package_setscene task
Date: Sun, 17 Sep 2023 11:38:34 +0200
Message-Id: <20230917093901.428214-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187775

Latest shadow-native links with additional libraries;
I was unable to find a way to resolve those in setscene context
where tasks do not contain such dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/useradd.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4d3bd9a5f56..a35785c9c23 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -179,7 +179,13 @@ SSTATEPREINSTFUNCS:append:class-target = " useradd_sysroot_sstate"
 
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
-USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene \
+                                    pseudo-native:do_populate_sysroot_setscene \
+                                    shadow-native:do_populate_sysroot_setscene \
+                                    attr-native:do_populate_sysroot_setscene \
+                                    libbsd-native:do_populate_sysroot_setscene \
+                                    libmd-native:do_populate_sysroot_setscene \
+                                    ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS = ""
 
 # Recipe parse-time sanity checks
-- 
2.30.2


