Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB807C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 23:40:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.1126.1648597199673601822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U3gOU1xz;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id j13so19005781plj.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GacjhN9r8laBy2CxZKEmSqLVyHWabB4WvMw2Kb6Pkpc=;
        b=U3gOU1xzwlQXZH2DzbR93InCSXZkHiIh2aqafMZttxsq/TPemPKbYkWm/IGtwV6iOf
         SQxrHh4LThUuLIWhwwDvA3wtMlRLxHOB+jiNYTM955oWrdlgBP70FTepXUhDdvARnFzX
         JDnZ7ud0eoq205yXI5YsCK3PosBPSzKGgfiyVgh3CW3tHK2vXCicNqk94660XZtIgPjz
         gTxu6wQJ1CWXnXX480LQRgu7dWDhqca32TbRZ5uQXyPMZSaEJV96I4c58nUWN1gz6R0f
         65XSuPJ71uVJXZ2/xC02faXXygoMdTe1lHuGwVqqGueVfkIs4AsoGgh6TUxmw3MQO8iv
         KEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GacjhN9r8laBy2CxZKEmSqLVyHWabB4WvMw2Kb6Pkpc=;
        b=dt/waR+GzH8bh/V9F4P4cMEjZxDMbUzyhN2usqI5c+zfDso++xZePUbiwt3VdrULXd
         J5dVOBI7HkS1SHA4H59U9zQfkhfbwMw1cmH1HUujEbM+8Zxbe/6m6ycum3TejOuP5E0A
         Wb69P8PDw1j8DeTXnZgY2iPe8hr4zFx4g7wn0e1TiLQW9luOnCZagtHOWSdgnhv4t51W
         JqlKZKhvE84mTj0/nRprkn7x0KAC32ZO1rpfQpmtt5I67K0tjhIpgh7GSxgZjFIhjF9s
         U0w7syECUn14zg1iKetRxuZ7s/VLceF2X0ecPayjmIcLctOtDshNSgptveDtGis54sYY
         a8hg==
X-Gm-Message-State: AOAM531evNplN/x7bWD2PdskW/100za9DFh2TdsBcHRvBMiSxmYk+LD3
	05Us+BZumJ5wRHoG798VyN8IgqgxFnE=
X-Google-Smtp-Source: 
 ABdhPJyr4I93Dwz4QXb4WQDFht39FLxUaNH+BTfeZpnzt+Ap2l+rI257QQreRVUuii+KZ4oDUK9jyw==
X-Received: by 2002:a17:90a:d302:b0:1c9:9204:136a with SMTP id
 p2-20020a17090ad30200b001c99204136amr1668992pju.136.1648597198955;
        Tue, 29 Mar 2022 16:39:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa784ce000000b004fa79973c94sm20010387pfn.165.2022.03.29.16.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:39:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 4/4] go-target: Pass -trimpath to go linker
Date: Tue, 29 Mar 2022 16:39:53 -0700
Message-Id: <20220329233953.3039842-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329233953.3039842-1-raj.khem@gmail.com>
References: <20220329233953.3039842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 23:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163762

This is for improving reproducibility to trim absolute paths as these
recipes do not inherit go bbclass where it would be set automatically

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-target.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index d085643036a..ed09cfe8061 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -14,9 +14,9 @@ export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-pr
 
 export GOCACHE = "${B}/.cache"
 GO_LDFLAGS = ""
-GO_LDFLAGS:class-nativesdk = "-linkmode external"
+GO_LDFLAGS:class-nativesdk = " -linkmode external"
 export GO_LDFLAGS
-
+export GOBUILDFLAGS = "-gcflags=-trimpath=$GOPATH -asmflags=-trimpath=$GOPATH -trimpath"
 CC:append:class-nativesdk = " ${SECURITY_NOPIE_CFLAGS}"
 
 do_configure[noexec] = "1"
-- 
2.35.1


