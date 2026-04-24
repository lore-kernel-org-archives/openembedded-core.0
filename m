Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DACFFF884F
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32588.1777064218043137694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JPZNyJve;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891cd41959so64026515e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064216; x=1777669016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z70MwCvaGBDJ5jUnCYCJCJ73/Idy0ChYJTwhXXd7X3w=;
        b=JPZNyJveRPGoTinViZ+obdulAIsxi7t1eFvt2GyKBg/I54gu2lccNiOxpF5FqdlJyb
         HM7qePRC1MomJZVlOjEn7ktdOvcfKilpxRbkFtZfHNqIo30ydVklvdcAB/ama91aKWDG
         HTuo/TCfB+LP/4wwu+IG7gR6Rq8o9RLYabX2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064216; x=1777669016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z70MwCvaGBDJ5jUnCYCJCJ73/Idy0ChYJTwhXXd7X3w=;
        b=AsvJjkuLS6tiC0IsS/uCLZ5Jfzwm1yzYvPWwYRUIOGt5CN8QmqNI7TK1hCimVGkJ+6
         Hj5XA9FTAF9PUjxTk4aMqRzE4u+HHX4V+4I50d0wq9guXLnMQ2fYGNHZyb0uuA1i4MiB
         urR778z5PNvlQRk6R3EakJnNv7ajijKgHUoCjeqeIkPjTAVwXKGQBb14Tcrw3/NUNOvP
         YKTrj3fN1wW7dOi9Di6Grzn6sSfmpF6wpVyU6/tRTVgAKFk8CnpCUCSJik1NJ8VMG4/6
         qhIeETDi+dS+Tgk/zyTisKCHZuNLc3v7aZybl7I+2Cl3zUECDNvfiBrbqcXS8wU2KVBH
         t+lg==
X-Gm-Message-State: AOJu0YzCRaly1qQHoVRezKZLmUIg8KZUCST9bOirFjXYOFuvb2wCFoFS
	y5Jv5EqtYfBNICfFM0FjS6rh/qEex7kinckRiqe0kOtmfkcB6ruBXoVzIS/PNw3k6zDVmfm1InK
	dC4EhYkcq+A==
X-Gm-Gg: AeBDieuDHISKcSYaNEsXI3Ha8xouWrJJEDK0Q7Najka/w5jJ/q6gWeOMZwOJ/oykztX
	X2ywe42a+NM9Kx62XZ8YstZcF58LD6O8QQGCklke5M2bDIELg90gncqA03lIBQHm+j/CsXU5C20
	ur2xNUutaABCWAnyD/sLb9uBxDiEsLGzMGRtfxykFhnzZfWSEUAYgkWIkMcV47Mg3KxIXeC5lrw
	B3r3AspU3sQ4ofk/PVZUcQMw6SvvDTfBFB9p5l5/DR9ZAZVkGQJeGwJqEEL6MqDqgcg91gw/fpI
	Y8CO9tYrnuN0DJ/1jfWRyiU7UNOQkdCxtfXF7sryR2N8KVtp2xS5NfQ3Io1Z+R5pyvvgDa5QpQa
	vJAHDFhdz9KGqMVNcRaYsN6we1t2oDUJdM/yqQ5++O8zGIA9BfAiMxJ7Th3F3adeqyllD8L3aFy
	YaNVPbi19qj8fFLabtVWm9W/RNy2doWqvhXa1GWGspnIcVwLNRWbqqj7yrbzRhvMw8Gs2A2WtLl
	G85HQApincin9QipeiZ9lkLXMw4VIEIIK2jZXO6vvbLsndf
X-Received: by 2002:a05:600d:b:b0:48a:563c:c8e2 with SMTP id 5b1f17b1804b1-48a563cd137mr202090315e9.3.1777064216186;
        Fri, 24 Apr 2026 13:56:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/66] libxcrypt: Use configure knob to disable warnings as errors
Date: Fri, 24 Apr 2026 22:55:33 +0200
Message-ID: <2151e4824bb45200173e95e2a08eab9057cea29d.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235907

From: Khem Raj <raj.khem@gmail.com>

Passing Wno-error via environment flags for target and nativesdk
is intended but is not effective due to command line ordering and
as a result some patches have been added to disable particular kind
of warning as error. Given the scenario, warnings as errors should
be disabled for all builds, this makes it portable across hosts and
across compilers ( gcc, clang ) and glibc versions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 25f26861ddc8d71af5381d1acc883ad948bddace)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 4e240f4d145..25c4fde813b 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -23,9 +23,9 @@ PROVIDES = "virtual/crypt"
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
-CPPFLAGS:append:class-nativesdk = " -Wno-error"
-CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+EXTRA_OECONF += "--disable-werror"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

