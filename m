Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3408C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 23:39:59 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.1027.1648597198719933540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X2CBrdr1;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id c2so16085851pga.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TvwQqElRiM3abY1umKoCWnKC5J1cL0J2YX/zw5aeFiI=;
        b=X2CBrdr1xvEsL5bwgdrc8lkhbaAgvPmTplOSMLEjvd9TfMiRWgrBnsq8g3B+9TTmLo
         CWW6ptYFxATO31fbVTt80MDtanQGdKeFEZw1ZKvxS6fDGBap+Vt4rn5QQsJJpVr67tKg
         YtWP525IQ03JNVA0v2lPubWuVcheHv5DoNVSXw44uSjC5hQst8UytTyGE3yfSnz83uK1
         eEoxxhoBzQGtbXNgNEeeAnwfBAxEhBi17PfnIV3P5WSbFWwq56GQjVFSygPgj34AhdAk
         /qBGRGQr7HJXcG6hrpukP37l+y92mg1FESYjs87RtaCG2wKGrRgVzaSMJWUYxeV10DSS
         BbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvwQqElRiM3abY1umKoCWnKC5J1cL0J2YX/zw5aeFiI=;
        b=RuqCVlcYfXAreF8KBWrpUJoLnQfaJ6ToNfzBXceH5hHj8xoBu751Lr1JbQeDB3A+n5
         n/jdwWiR+Yy65jqS0eW6H2QXCxN2o2QzopWhBuQZa58Pfv+oSV6nvptC9HQ3g+Pcr0HW
         u2B6Yes8BTzL0Fa5XDlcJLXITmDhdZS8mWlfROR9xTRftPcqmxTcjm4Xo3pcfrlDby0N
         1Z8LZfe0OwILLQg5OwIehMxuiO/yrVyDGJAPqK3jupgkib40GZogVERhPyMQYKsDrYlU
         5AeWqZ3aYWGQY+1Eko1V4ltX1cXjhJLU0JFRAdKRMsBVkXAceUFYKxabpo8OJDdCnf4A
         L9vA==
X-Gm-Message-State: AOAM5328euezzlK08iLje5O5XoOolATureDe7YdUuGDV6wceYwMXDky7
	018swoe1ZmjSufFunopLfwiXukbKvR8=
X-Google-Smtp-Source: 
 ABdhPJweZ2AkYIFieNRdGXHvgQXriMg3S7StFxEoOzqVcN0Jl1m+8+xtqSta2jEzhlLEB4VlyzVCwA==
X-Received: by 2002:a05:6a00:1a91:b0:4fa:b21d:2ce with SMTP id
 e17-20020a056a001a9100b004fab21d02cemr30765136pfv.75.1648597197993;
        Tue, 29 Mar 2022 16:39:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa784ce000000b004fa79973c94sm20010387pfn.165.2022.03.29.16.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:39:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/4] go: Disable pie in cgo for mips
Date: Tue, 29 Mar 2022 16:39:52 -0700
Message-Id: <20220329233953.3039842-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329233953.3039842-1-raj.khem@gmail.com>
References: <20220329233953.3039842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 23:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163761

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


