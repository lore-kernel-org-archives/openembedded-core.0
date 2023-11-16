Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D86CC5AE5B
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2234.1700120222404821141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/lHJCYV;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso62337766b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120221; x=1700725021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhCTfZ5G0hg8d/E5cueAWWdXRUj/CtXC1+tPI7b1kNE=;
        b=M/lHJCYVxCwrLGERUQ5wRjQzUqWxUXej7j4Dh+gbNN6F+FchgxTIGEpTVpA6t4pQWh
         /iJPb4XRNbB+9rLxS0vb6wbbGmDvQwjtMjqOALgTFSe8XPSD732nin/bNZGZBnZx1AJQ
         DbMgbHSmel4uf3JhXMr9NWXWP73N+sau6AsR4XdX2yxUXZv+Xpj+2H6P8nR4tUMaQoPS
         1LXfcJ6sheaSCYf/9FaAWG6pgcDtIumEuRGLVOLxZe6oRLXLAT+PLWlv/sgGximSxLP3
         yJzEO0uX0wQKqKpizGp0m4y93JByVSeaBzmVkf7Tjpt2Kd2aYtwU0P8w5uPeDh+50sSJ
         6tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120221; x=1700725021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhCTfZ5G0hg8d/E5cueAWWdXRUj/CtXC1+tPI7b1kNE=;
        b=DCTXWPOP8Dp+hnJHUYHQCjwFrXQnozLy00yVkr4z8menpl+MLhpSkeLpVHIl1oehho
         Xu98d8rdvjNyTzfP4qOPnSKCkO7AeBkV3azuQB7phjqBAPREZ/dk0Sl2QFMUFdQMXLI6
         DuPb3HUsOH1AVBA/UMLACl748/fAw+t+kcVVnSIher0lYu9sQMZFTLbNAnC7VSdPno96
         xntnE9+GKaDYJmHjmTDhqEc+//lqoOBvVP9FgkGG9l1VdQN7k/JlPp90GmC0bZKpDWtO
         OKB8BLjL3n3bxNQbyTi7GFH2nE73O9FUSrxtiWRcNOGF+SQQL2vbj9g6ksQAhu+F7Pe1
         7B/g==
X-Gm-Message-State: AOJu0Yzs+RJCndEL+KA54430LarUp6Hqij2/b+g1zWnaehwXqF7P+F89
	v0XQJw6L33HFpnMFP8FVOHLv9fa0Ovw=
X-Google-Smtp-Source: AGHT+IEFlgot/OObY0yMNce1yAtvnoT1eWyP334ERnQqpbszAYczXSOFqkw+NFN5/tM83DPpHa2p0w==
X-Received: by 2002:a17:906:34cc:b0:9e0:2319:16f2 with SMTP id h12-20020a17090634cc00b009e0231916f2mr11244322ejb.43.1700120220540;
        Wed, 15 Nov 2023 23:37:00 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t2-20020a17090616c200b009ddaf5ebb6fsm8129704ejd.177.2023.11.15.23.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:37:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 06/11] ffmpeg: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:45 +0100
Message-ID: <20231116073650.2710535-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190758

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index e65f80d64b..0ad2f80217 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -151,7 +151,7 @@ do_configure() {
     export TMPDIR="${B}/tmp"
     mkdir -p ${B}/tmp
     ${S}/configure ${EXTRA_OECONF}
-    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g" ${B}/ffbuild/config.mak
+    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${PV} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${PV},g" ${B}/ffbuild/config.mak
 }
 
 # patch out build host paths for reproducibility
-- 
2.42.1


