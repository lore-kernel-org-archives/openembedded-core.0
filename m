Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D293C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:33 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.82435.1752510207263439539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2NEmsdGm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7426c44e014so4303259b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510206; x=1753115006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOWg99azAAA5Gw6y7c5nJ5RjwB69oS2hCd8IGLRLWVw=;
        b=2NEmsdGmvsqI7UJ5VLOqLTKIb7yBjtaHaDH00OiyUaPJQpqN3DO+GlempTAmH0WKUi
         AythMipdDgeUr++K5g86sW6wQHAAw5XPAvk6aauqdhl4qtBtwbXU1hgJWbIUU7QCKyYX
         JecUVqujgKcNnKwj2fdtgsXebRSBtD6hhBfwEQogk47KTRrDEECkV2AI1MKcRDnoFq1n
         y3kdgWPmKWz8/p29oSZpT6U54rvDohhpvjHPCQNAPPSX+hah79XgX4pq/iKGdJDLcHuf
         jLQnMtRiyZdLWz/1NTwmHx8mLkPwefiD7EnFTNtMbgeg3z9Et6NQrmjg42SA9MDs+A7I
         l7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510206; x=1753115006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOWg99azAAA5Gw6y7c5nJ5RjwB69oS2hCd8IGLRLWVw=;
        b=UpXfd0LRkrLwo+eAYkbmT/lxMhY8ZRSu+DwfxlYjt++NJV/GQ3Tmhd2JRGWu1Hedbr
         R+P5VrIXxhyfzkj3dDnzG8XD2lGU6fCQlyVZcYW4Wc8599Ciex78nAzu7iv8LBr/VXdl
         sbY1jBFOakUEQCS3WkQ6eM9NYJIKdHRUf/cZftcMsaW+u+4dXDOQxbIWx+ZLjTIVGC8t
         Ow/AWfH1ugGGSyHBzaay0CWRP6N6ACGbuUjyhosGqNoK6f/tNCDxYIpzvHuE7I3vK6dU
         itgNKbm8SBtAOb9MKkjbkE/Uetd1o0fVhi1jIRErpfcn2Or+yi9nLkzVix/NwlY5kl8M
         m3Dw==
X-Gm-Message-State: AOJu0YxbQrOyDF9V1Dodh0dX6KG8LUSWCdC5cRTNDg6iXqa0BifM/u2Y
	fzAgUw7kfzp1XloI8sUsAyrni7hfLMFY+WkbPAgSEOKj1h+ZRlb7QuNbsRK9PdAikMVfNqsOSPT
	NZnvO
X-Gm-Gg: ASbGncuAAKCh9Um7sDdCLuNbyeVSqJq2b/j3Im5BYHGFed3P4/9v9uj03z1UT2z/H/e
	atzuZR94TmZCLMsX37j0itn7h4W9X9M2h28Aoggdz7YbhO1C7CpR+l5B+faDt6zhYrA8CkfEPxh
	ki6NV98bJrgJT+UG214Xt78VgDWZUhIkwzHDk1N4qmD2y19imXWIS2yWLbV6v1DwikUSjBNerhl
	XPjD9+UDtYbjdNjZSpnUiW+3ZBByhg4FXWbznfdR98RiysgqkIRqkoGkIjXWUdiDfhySwWDYF8J
	XhWfaXIk7NYijrGJDaJAB32XJ+qVKkS3HU/+/G51L/8Z7BUJSKv5rsUZrxMPmCGhqW/AV1ndp74
	SxdJ+Oep/iheDpFAv9COt28E=
X-Google-Smtp-Source: AGHT+IGoLfPUNqOvqqIzdQkse5t5fzsZzkZsJK+uTsiFU6E25spsXk15SH2kLQxVYi9T38y2X+iM7g==
X-Received: by 2002:a05:6a00:138c:b0:748:f1ba:9af8 with SMTP id d2e1a72fcca58-74f1eeca8e2mr19475997b3a.21.1752510206294;
        Mon, 14 Jul 2025 09:23:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/15] webkitgtk: Use gcc to compile for arm target
Date: Mon, 14 Jul 2025 09:23:01 -0700
Message-ID: <13133bb709d63a5c28906167da15846eb96a9b02.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220245

From: Khem Raj <raj.khem@gmail.com>

Builds with clang run into compiler errors

<inline asm>:320:1: error: Relocation Not In Range
  320 | movw r4, #:lower16:.Lllint_op_tail_call_varargs - .Lllint_relativePCBase
      | ^

(From OE-Core rev: be459bf17d5e47c51d96da1a571de01790c277b9)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 5b9846a6d6..a58b44440e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -176,3 +176,5 @@ src_package_preprocess () {
             ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 }
 
+# Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
+TOOLCHAIN:arm = "gcc"
-- 
2.43.0


