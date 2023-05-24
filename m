Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D08C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 22:59:58 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.260.1684969191496729278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 15:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cBCcdXUc;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d3fbb8c1cso1645428b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684969191; x=1687561191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UueTrFj0Uj9j5Lsmk6Lggq5ZriOuQcxJpukdSmwqa20=;
        b=cBCcdXUcQsfRNrq8lc+eWL4/Eav1QDfZ75FzYQNbTVaOcUQ3Bg4ZCBopOfRV/IJnnY
         eBbNDh9fYUsp/MQNzTW/joXkKg0e7emnQeL2gciaVd1W/b5RfFK8FpouYapk/g3Kan+o
         zHlyxOXetguHzYk0j3mYrVAaSwCtUzaOvJmZgkrxgCwzTfn0Ld8A6rhJpUXbKybU311N
         bOM5LMJI8dfv4NvJy1t8IS/av0+xD7D7TmEkQWOf6qnof0OXIBPJRVF2QRXNPeajBdps
         xP7MzPWx8p/eELRzxaWKsoMRoipEpntRY0oY8Kbms7aKFzeaXfRqS7+oPaigMmXxUzF9
         jrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684969191; x=1687561191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UueTrFj0Uj9j5Lsmk6Lggq5ZriOuQcxJpukdSmwqa20=;
        b=Nj4JfCwuMnPT74j6heNLC6ZYel58rHGZmKT82I7nV73VKS8hQPtyIbCq6eKJ0er/oB
         fYCzrQwD24H6ZrYbLBa+juCXmgPvB7PNfmUqnVlM+DLWHXjOoUX4xpfhxZ6ryrzddkbl
         6AVpwSrRavy6Ug8itWpn194n9ojZQVvmhu4qPPukEFQapkfvsTwCnndETPdhDuzXGv+s
         dgn+h/DSXy+Bj98Jn7Gpmi5MlJkbrIud1CD/QHgRimWIM1s2eV36+B9WMipk9XXZEZkr
         ZDI0CGeSAwZKK9H+rQ5c6WnSJ9vvqDH3WLcepcbp7kl105zUl3w5tkoXY71x6pBRBibn
         iUgg==
X-Gm-Message-State: AC+VfDzNqUyYfXd8jHU0uabiwvM5PmwaW2RvFt4nei9KNn2bWMAuVmrT
	EwJy1kGzhbGiw+EOss+Oi4lH3rTAKvE=
X-Google-Smtp-Source: ACHHUZ7CVWcC32xfcUP/yiI/YHdptv+TD0/bR2TD2jSIDETJWcBkJIB9+fbNf5k0iL4pavGHvEYuvQ==
X-Received: by 2002:a05:6a20:3947:b0:10c:7916:f9f6 with SMTP id r7-20020a056a20394700b0010c7916f9f6mr8400773pzg.52.1684969190472;
        Wed, 24 May 2023 15:59:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id b19-20020aa78113000000b006410f4f3ecdsm7883332pfi.83.2023.05.24.15.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 15:59:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Use -no-pie to build target cgo
Date: Wed, 24 May 2023 15:59:48 -0700
Message-Id: <20230524225948.805497-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 22:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181694

Fixes
go: ELF binary /usr/lib/go/pkg/tool/linux_arm64/pprof has relocations in .text
go: ELF binary /usr/lib/go/bin/go has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go_1.20.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go_1.20.4.bb b/meta/recipes-devtools/go/go_1.20.4.bb
index 587ee55944c..46f5fbc6be9 100644
--- a/meta/recipes-devtools/go/go_1.20.4.bb
+++ b/meta/recipes-devtools/go/go_1.20.4.bb
@@ -3,7 +3,7 @@ require go-target.inc
 
 inherit linuxloader
 
-CGO_LDFLAGS:append:mips = " -no-pie"
+CGO_LDFLAGS:append = " -no-pie"
 
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
-- 
2.40.1


