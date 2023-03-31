Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E54BC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:26:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.47959.1680240404715480497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rnqgwg4i;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id t4so15950251wra.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knHe8qXRx1mwlRtXI97oMvtXypdTpkDTv0MniGDEsJ0=;
        b=Rnqgwg4iqbZdK5+bXGJy8vm1zm6jJtOh1fmKweyRodiZU5buOy9QJeeFyhxKUe0mvZ
         PDaeFdJe96pN+vYsGq2a/2GZSWuA+4753Jx0h3/0gxok4yy0NlSee4+h11N7FH2hvis0
         fZqVvn9VEt5DX8De/ZhE9M4JlTWcfKTmqLiN6WJIIdrl4NjJ8w59oHGXf52gw0hQMSut
         ka+zh77Gy4WeZWWRtJ5mJ/Fm7vj3y8zzckTrYt8Vfw2mrCsF1Ys1cc/1aJ0mDD7abN9U
         vECNGIx/9Pddc1HI4OKRUtVyz+bKBYAgMGWWgo1t7Dxm/3HAj5qp8LSLsPq8eqO2GYwq
         n/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knHe8qXRx1mwlRtXI97oMvtXypdTpkDTv0MniGDEsJ0=;
        b=RjQZ2x/iSiuKUxOMDNt1nzS8n/r9E1UqtNrwwBeW2k8HJ6XkkJpsHXj7+Nwygf+z1P
         7aGHvMCuyvz63aB4kP0icDd6+3eahrDaBA0hwOZGTVGcviMtuwv2BLRe8jd9n090hUBF
         hsptvM4w3tcqBpglB1psdopsZk/2ZtHIx0nB8TTvFNwBRpJKclJ80bKe3PweoUWP8ECP
         CD0/+xyuim7WdRHFSUEovVqsRQ7mzHdugdpnKn2ZkWWX4fCNWGQ++6Oa4c7Em1aSFpYd
         o8RRF9m5CkaeegixTKhIidbihbt9FsCBXBzsxNtwsW2qKUhcjKbFRV54YiDSIsw/cH5S
         UfHA==
X-Gm-Message-State: AAQBX9enKTNGZfIXSplp7xS4p+BasNQn3gebc2EcsmG2qpQydjYdBuBb
	ORDRnz3xLtYb6q5pc+HK9blIJA4YLHs=
X-Google-Smtp-Source: AKy350Z7zcogJrqTBIv4IOEyZZVKWaB5PhHqPvo8H/TO2C3n2EoSKbDDvBF/IgHCdj7MKO4HrcRw1A==
X-Received: by 2002:a5d:490d:0:b0:2cc:4e58:f6d0 with SMTP id x13-20020a5d490d000000b002cc4e58f6d0mr17610201wrq.54.1680240403185;
        Thu, 30 Mar 2023 22:26:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5265000000b002e55cc69169sm1146902wrc.38.2023.03.30.22.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:26:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] rust: install llvm item only once
Date: Fri, 31 Mar 2023 07:26:32 +0200
Message-Id: <20230331052636.978578-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331052636.978578-1-alex@linutronix.de>
References: <20230331052636.978578-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179386

Otherwise it triggers a rebuild of llvm-dependent rust pieces every time rust_runx is called,
lengthening the builds without need.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust_1.67.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.67.1.bb b/meta/recipes-devtools/rust/rust_1.67.1.bb
index eecb05ae026..83f9bec68a4 100644
--- a/meta/recipes-devtools/rust/rust_1.67.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.67.1.bb
@@ -200,7 +200,7 @@ rust_runx () {
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         chrpath -d ${RUST_ALTERNATE_EXE_PATH}
-- 
2.30.2


