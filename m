Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B9EC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 00:11:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12389.1789431059822648030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 17:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jo+dHxkC;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e717c9841so15307965e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431058; x=1790035858; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlUqsUyPuPJzFkpkyMGCdfD0/mQE4M857jrLZFSUqwo=;
        b=jo+dHxkC4XFyv/cQ/QZXH/lDNPrDpot9JjGwZ+Q0pRShsEi6YevXPi9Ikz+lkrNcSd
         J2JKsVGbWSvsU9eT93jT+PDWPHh3WUWBHuGLguFeviheqJ9pnoozA9ZAlbJuH8GIHXwk
         Ix0x8ObOP2DWmbUc1TBbSkchGcxwbXHRt4x9eI8ehL9C8r6ahL0we0offoWLOcVcflGW
         dZl5y43ooMUUWhhu/m7Zz/WwL50ldnRsTLNEJckGh8Fld2ob6bts52HYrE26U6qBmZpO
         AYoLf0qsRX2yWBLFM+6wQALwmh8h5me+urKF5mducZKUp1Ck+YvMrQPrhRCtbE+zJdrw
         xgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431058; x=1790035858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlUqsUyPuPJzFkpkyMGCdfD0/mQE4M857jrLZFSUqwo=;
        b=I1r3tNnpsI5PUTavVsDmygAATC9C8rQr4QxKiPFxfP4MFfZwM1hLzCPNg0WbNFgsIk
         SaKD5Ya/uKwkFFXydPyEbv96lvVNhxVij6lKe8i5HR6LYS47j5h994zpaZcXFKr2hHX1
         a+wrinhIeRk2gqvAQcqmQOd8bQZw0zf3ysVUSZ8UgclbA9OjJgZyyOkM3eGk4O2NweZ7
         8jrJHUh0JI0vMAbi2yRob2dVIPgeMKPLq/gLYeWiaLHMTezjpRhdS0ssN2isIEViG7IV
         /Hiz5I4YjZ+eztJygdrzIhQi3R50hYFA8DqA29eUHOPMnLeCd1UArxUfP7GUHZQyrlIr
         6y0A==
X-Gm-Message-State: AFuF++m2PvTFfbNLDiK2GDHSYEHIM483cYE/94zQdw+Xim+fP7Hz081L
	a1XlzYxhCJp0keuJe20H6bM2zbs4fpN2M1w2eCS3SLl4IPpqE1WL/wSl
X-Gm-Gg: AYBFou2uo4DtL2GsGsjiCVsNp/MFYBRSdsF5z/pD+UujhDMzdTRaG2NoU9B8FjvPNE2
	sa9F/lKrm5TEXu+gPLRzNKWm55SLHUwlfzChJullvEgobevRgKU86FD0Bf9RwG+dZ7kkuwi+1yW
	T9b2NuIwFjKV5E/NRaC3xIQVYQUQ2Nz784RxSmgJIqiMcTPM0SMYJtYppQS/Dg6afPaCxKNQVph
	Whk7qyfykiYOMQoqUqTP2sifIBzIL/SjPfSx3pTzM6W6SuZjtZfSPbvyhtYGb4QNEGOdxKdIQ6E
	aGBFgQ/H9v88JVY8MK0UKqJyVFHmnqizIVTRrKgXpK0yb+voyiChSOnu2uSTjLeIC1/pUrTllvP
	OW6AjgSdzKb9gdAiWMTIfJvIS/55CLeNwCz7rsbxUgUiZ8Eyt7sejX+GODYRfIZYSvRvQM/34vM
	CPJpyRXTz+0WuueLK5HqvV227eG//lCkKBixcl93tRoGaHpBOlJmEVmF1gvWcskH0vZKI1nehCF
	w==
X-Received: by 2002:a05:600c:a08:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49e7a66cb16mr59070895e9.20.1789431057730;
        Mon, 14 Sep 2026 17:10:57 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm29287221f8f.1.2026.09.14.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:10:57 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Tue, 15 Sep 2026 02:10:40 +0200
Subject: [PATCH 5/6] strace: Add PACKAGECONFIG for libdw unwinder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msieron-some-packageconfigs-v1-5-44dcf1145d3d@nokia.com>
References: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
In-Reply-To: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245804

Strace supports two unwinders: libdw and libunwind, but libdw is
preferred as a more featureful one.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/recipes-devtools/strace/strace_7.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_7.2.bb b/meta/recipes-devtools/strace/strace_7.2.bb
index 6ae1de7c0b..451ffa6f88 100644
--- a/meta/recipes-devtools/strace/strace_7.2.bb
+++ b/meta/recipes-devtools/strace/strace_7.2.bb
@@ -29,7 +29,9 @@ COMPATIBLE_HOST:riscv32 = "null"
 # bluez is not enabled by default due to build dependency creep in smaller builds
 # like core-image-minimal leading to significantly more tasks being executed
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
-PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+# Stack unwinders - mutually exclusive
+PACKAGECONFIG[libdw]     = "--with-libdw,--without-libdw,elfutils,,,libunwind"
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind,,,libdw"
 
 EXTRA_OECONF += "--enable-mpers=no --disable-gcc-Werror"
 

-- 
2.43.0


