Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85924C3DA40
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 05:32:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.11784.1687584747353347128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 22:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YvFIB6ux;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso1171738a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 22:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584746; x=1690176746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utgaStT22TtZyQ8DPAK0DQfWBlt6Vb6F6A2fG/lzS4E=;
        b=YvFIB6uxsDAFS4zHT8oLcOT6xi+Wz6ulJw8S7+rBuo3MROKWw184lkrVspVwBEYObV
         IUht9rJrus5uL2K4iQZpBiL7bNJYVnVO8bnEBKL9IAqlHegKsyBPZAvTNRQw6EGxoidE
         CbOZ6zSQqaWZMGUazm+cuFc8yogrGHiAV8eIH1/4bK4cKTj0U/rLMHJwYQTvKEJMPkLb
         J9pHTHuiA62QHIW3D60gGsgahrQnPWEQDul0BKD/FOecor6I7Iyc7tRldcdLdJoWPJMg
         FaCZqTPr0gZdA4dPVlhmEt/sgHhzjTLNaTW0K/hYOQqARSqvl/j9IHKUu5NAe5UgUBNq
         AOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584746; x=1690176746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utgaStT22TtZyQ8DPAK0DQfWBlt6Vb6F6A2fG/lzS4E=;
        b=JOzCb4mbo+7cIUHPZ6kgITOER3yzEuxTToQb0h26Eza0spsIey2+PYAScQozHRIOy8
         fcCBls1lifePNm1lGv79b0uY4mYLW7ak5vMG+ohNP0z5WqVJ7NcgKdv9SwUv+3SYXOQg
         Iekq0YdRpwEC08E6PgqRpToujWtO8YTjgd24EwOK3WrgDsym+rXZAGAX95GcoWplo0In
         R0wU/pTBJ6NEQ+ZLooGXyhOa9T5y765JA68ojWyisqG5hywfcpjL0RNmbqcZL9qid0mu
         ISg4xg3Zt3vmRC2ytz3rH6SLdrR742vAFuDz05Kydb4fZdhr3buSDe0AFEgqwZ/tfCFJ
         BbtA==
X-Gm-Message-State: AC+VfDweLF0kutafMDSCqwHXaKMd+BmFRRM9Ithx1j8rs0D4PKlHg+YW
	cMN4rs2Ev/a7y2X64G7n8lW/SeO/9wM=
X-Google-Smtp-Source: ACHHUZ6exh9RFRYAKz9cpW/Gnd53zNGyKyydlExv1f4SZp9a9oUvE/JjNbPQ7waRzqfgFCRasIRulA==
X-Received: by 2002:a05:6a20:1590:b0:122:de52:eaf4 with SMTP id h16-20020a056a20159000b00122de52eaf4mr13609413pzj.22.1687584746450;
        Fri, 23 Jun 2023 22:32:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b0063b6cccd5dfsm353797pfn.195.2023.06.23.22.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:32:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] libxcrypt: Limit to enabling strong hash algos only
Date: Fri, 23 Jun 2023 22:32:21 -0700
Message-ID: <20230624053223.228117-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230624053223.228117-1-raj.khem@gmail.com>
References: <20230624053223.228117-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 05:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183356

This ensures that weak algorithms are not included, which should improve
the defauls to be more secure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 997e83fb004..db43a34b11d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -29,7 +29,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
 
-API = "--disable-obsolete-api"
+API = "--disable-obsolete-api --enable-hashes=strong"
 EXTRA_OECONF += "${API}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


