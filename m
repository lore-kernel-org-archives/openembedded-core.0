Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BADD63958
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.13856.1732111068644853460
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dJ9uRVtK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-212583bd467so16345355ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111068; x=1732715868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLmXigqoI58DgK7XiIz0/VNXT9LZFROAqvxI19JHSb8=;
        b=dJ9uRVtKLucv+5qd1xTOFkh6CFvdZ7601uO08HcqCVJuAcrZZPCAeye1mFqebZmM7F
         v6S12EcbF1N+uWnXsbFxSvu6Iw4SU2S6JIkl0v7uODphzT8Gt6xWl36mLxocxS0wx885
         MQWs5UDpIHmv2DFD5mz4NECy8cxL+bxyLkGtzLJA57M3gCkAuUxcYmWIAVMzMvZXOKZC
         Qhb55Mq1tQtkty6F70AJViQMjX4WAMIhZ1V6KoxdyL94IrccDfCR++Wwgu7KchaZbj83
         pPpDoBrmkfBGxJZDKhAfVCMgEdRMYPSniLWZ11Gmnl4DoziUoUoh4R06pXoQ1Z583kix
         wtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111068; x=1732715868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLmXigqoI58DgK7XiIz0/VNXT9LZFROAqvxI19JHSb8=;
        b=sd7/em//Njj9g/4Vvw8t9hRbPsG5nKCITlj/W6xvsLaA6EJgsilEFfNGwhbHtOxMXP
         E98gft59HxOcRBprKAimvCZsSfmv4EDaS9WK12sMD/Y1Xw3YKPQAERSkDkVwQLu6Vnp0
         K6KgXbCZTVe1cojmDcyBcdIdX0/61TIcZ5swDQRn3LKFyuBh9JaYVHTC36VoJ5P91Dhi
         yizvubfg6/tFlLnooot86KfHemxmJ/9MyVJ1S3e08JnuhhS/JZGcXo0uH0wwwR1LwF+c
         YPpPGqR+SvHNgMNYaX8OZwPEXkq4LD+ttQW3cXrJxgig9Vw8rRwBjn75fXrwRjmCyXeT
         t79g==
X-Gm-Message-State: AOJu0YyChnnCWnTIklR5Iy9Nf/2jEkhemtUF3I5wYjNqt2eT2oxNDh/e
	JeFH8CW82Nk8L9gcJRJj/x/DWmT/7ygpjjDKpUVwgOot30vSf8xloySTaA7twyVNKpKVGSpjY2b
	U
X-Google-Smtp-Source: AGHT+IFwyOdQwh27lAZ9i8DZAW713+T069M/n6YyKC7vX4NxRlXceEzb5/inIjCOOGNOcW2gF1yW9w==
X-Received: by 2002:a17:903:40ca:b0:212:349f:8413 with SMTP id d9443c01a7336-2126c0e412fmr28048215ad.21.1732111067973;
        Wed, 20 Nov 2024 05:57:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 22/31] tcl: skip io-13.6 test case
Date: Wed, 20 Nov 2024 05:56:54 -0800
Message-Id: <a3ba891e888cc93bc5287dc137ade962385b1d45.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207446

From: Ross Burton <ross.burton@arm.com>

---- Result was:
{abcdefghj
01234} 0
---- Result should have been (exact matching):
{abcdefghj
} 1 01234 0
==== io-13.6 FAILED

This test is documented as failing on slow machines, so just skip it.

[ YOCTO #15407 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f69183586655294c9aed6687cebe57767c2f3eb8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index a403a74bb6..c485e535c7 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -15,6 +15,8 @@ SKIP="$SKIP cmdMZ-6.6"
 SKIP="$SKIP exit-1.\*"
 # 15407 15421
 SKIP="$SKIP \*io-46.1"
+# io-13.6 explicitly says it can fail on slow/loaded machines
+SKIP="$SKIP io-13.6"
 # 14825
 SKIP="$SKIP socket-\* socket_inet-\*"
 
-- 
2.34.1


