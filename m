Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E39C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 07:53:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.8419.1648453986712569696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 00:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b03MoUVV;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id i11so2817191plg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TvwQqElRiM3abY1umKoCWnKC5J1cL0J2YX/zw5aeFiI=;
        b=b03MoUVVqgxNG5vsHOGsMv93LpQlk8Hzlgh7jZ5BmBfIkx/DU9KljMYygmRZqe8+Vi
         D9ZyQY48CAWW+ylnQ222/rpQZlWsDm/7Odh8SGeGJEk65Fy13JlRDCUjJpq7TD9845Eg
         wG+TFU7/6MyNedBXXvLT3eYyul5LjmM9Qoo6KsufT2s0tkiCLhRPDiL1L22be9BDVQgJ
         n+MH+O55LxmJVpXcQQrPZPj832/1qgCzgPcyk4JHhjBe6OTVL5gNlSJ2GDQ/VXHQc2l7
         1e38LhfJKmxVSsDym0BGEDoyeoJtfrYHnxWcUyIiO3B/DQnxedX7Z7fYKk9oj7b4U49D
         Fcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvwQqElRiM3abY1umKoCWnKC5J1cL0J2YX/zw5aeFiI=;
        b=K8fouguRAGpVdoxqy3sau0gr9WXE5sTf7e/57gusGdDtPxma/EzluHB9f8meX+9pX1
         h8i/hy1nOeqytPlbsnjEt6RZsWqgh3Qs84K9apRRWQ5FczbqERhLap0XSMck4yH3Az0v
         CviO2OKnvFw733+FXzSUY2vnYiLyMt7nmLTWifJRYgojTMj1f257JMrETZfg4hRUmY2j
         /35f4iz5Wpm0N/B0kDxVJWjB9lFtV0x/M6Sj8i95lJo2IaJAsTxU22zAQjDuUR2rKEBq
         iqt9JYcVNL3bOea9nwOTu/y0FTmtGzNg9o5kF257i0BHSqLX/Gq7IDrjJgkRpB4lEOKm
         CHCg==
X-Gm-Message-State: AOAM531KmVY7477okv4fF8F0NB5O5qhiwEwtlofMan2wzloh7tTrT8nJ
	wg939dX1nALVCgHguE3zVV8PFCCBY+Q=
X-Google-Smtp-Source: 
 ABdhPJwY+SgjJb4tRDleeBWhwPTvcd23SaSyIImts1MH92spAhRI6J6KQubIcVrFtZf3toJBTixOnw==
X-Received: by 2002:a17:90a:fcc:b0:1c6:62b5:45c0 with SMTP id
 70-20020a17090a0fcc00b001c662b545c0mr27415482pjz.133.1648453986033;
        Mon, 28 Mar 2022 00:53:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 y3-20020a056a00190300b004fa2411bb92sm15275081pfi.93.2022.03.28.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 00:53:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] go: Disable pie in cgo for mips
Date: Mon, 28 Mar 2022 00:53:02 -0700
Message-Id: <20220328075303.1519482-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328075303.1519482-1-raj.khem@gmail.com>
References: <20220328075303.1519482-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 07:53:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163684

This overcomes the linking errors e.g.
| /usr/lib/go/src/cmd/go/internal/base/base.go:110:(.text+0x60fef8): relocation R_MIPS_26 against `a local symbol' cannot be used when making a shared object; recompile with -fPIC         | /usr/lib/go/src/cmd/go/internal/base/base.go:110:(.text+0x60ff0c): relocation R_MIPS_HI16 against `a local symbol' cannot be used when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go_1.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go_1.18.bb b/meta/recipes-devtools/go/go_1.18.bb
index a492d7e64a1..98977673ee4 100644
--- a/meta/recipes-devtools/go/go_1.18.bb
+++ b/meta/recipes-devtools/go/go_1.18.bb
@@ -3,6 +3,8 @@ require go-target.inc
 
 inherit linuxloader
 
+CGO_LDFLAGS:append:mips = " -no-pie"
+
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
 export CXX_FOR_TARGET = "g++"
-- 
2.35.1


