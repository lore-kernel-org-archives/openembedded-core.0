Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9048EC52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 09:46:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.3649.1722937586857358390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 02:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kq3ifUPp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso3903195e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722937585; x=1723542385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNc8cBCfd+8P/j7o1KQPKefaQrPXAsqINr2fjUCCYU8=;
        b=Kq3ifUPplXF9MgisRgk2Bm00WR1FgIp68hWwVbN3bq7N8dOmuxH+x2sVuLvoyTRMrY
         zMTiE2fb7yuu/snnGnjeb1D3C9/rENyPDAjd0IW/L+/euXJf6KioyyxirwGgR2FdCJRA
         zZF+DTMi/x3A8ZPWQvpeHUmwzTNAfmJDrZPBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722937585; x=1723542385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNc8cBCfd+8P/j7o1KQPKefaQrPXAsqINr2fjUCCYU8=;
        b=ESrXARHVknb1rlgzfPyXdT+Q+4tZz+73RwMerVP6Zjc7S7U7Pjzrbh4RRFDZgHXGG/
         sQe24/4mnFzuiOUbVyfiNntJ6obU+G9JONbEf8qDbhaV+HyG22q/wtsgGIB4DjO4fdgO
         WPyskMpaJKQmr8ZMhsKyRGyuzQ7iGAdp8hkvsXg5VZqsd+k4QFja3J8uaRqx8UZ0FGEc
         wBS6YExmhkOvLWcXhY772jq5Ms8KEINthmVr03CUH5EW5y/qLZdWTF97GM7VLJGCwSi/
         MpmZNGAZEGmrAU+jGMVsx0jJNnZ5cSPSCySy9kHcFc7XHexqUlWj2wHA7OHZWnwipPig
         WcHg==
X-Gm-Message-State: AOJu0YwrXAWTClwhBcx7CEA95yP3uLY7bLPiLlgDecsl0aIFPtLkxr5i
	LHTWhqGPxWFwivfCBmoxrwd/qz1rs/6/cm0Dv/W4GFvFGmqlX7OrLghRebGHQpXefh9WoHJRY6d
	C+Iw=
X-Google-Smtp-Source: AGHT+IGj7dey9HUnvjc1h8MlG41xLBFnSFCyhga7Pha1iM6nkYXnD+qNMx8NmbRX2lay9lFwq8ddig==
X-Received: by 2002:a5d:568f:0:b0:368:6b56:641b with SMTP id ffacd0b85a97d-36bbc1a6754mr12999841f8f.47.1722937584601;
        Tue, 06 Aug 2024 02:46:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01f04dsm12383034f8f.45.2024.08.06.02.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 02:46:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	"Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Subject: [PATCH] musl: Show error when used with multilibs
Date: Tue,  6 Aug 2024 10:46:23 +0100
Message-ID: <20240806094623.38564-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 09:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203014

From: "Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org>

As discussed in the bugzilla entry, musl doesn't work with multilibs.

I originally sent this patch in 2020 but was told that support was being
added. I recently revisited the bug and retested a basic config which still
fails the way it did in 2019. Since clearly nobody is using this, make it clear
we don't support it. If anyone does add support, we can remove this error very
easily.

[YOCTO #13122]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/musl/musl.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 6ca52b186a5..9999b4d2d64 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -32,3 +32,9 @@ COMPATIBLE_HOST:riscv32 = "null"
 B = "${WORKDIR}/build"
 
 do_configure[cleandirs] = "${B}"
+
+python () {
+    multilibs = d.getVar("MULTILIBS")
+    if multilibs:
+        raise bb.parse.SkipRecipe("musl is not compatible with multilibs")
+}

