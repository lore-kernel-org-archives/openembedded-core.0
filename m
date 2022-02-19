Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B338C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 18:23:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13029.1645295002248206896
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FL6LBlk8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d27so19913695wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7tQyz+RO3AMSgTAtb87CjNo2nylNen2LLT7Aye3MRl8=;
        b=FL6LBlk8Ccu7ZVU/kt0zK+nSIDoxWYCfnCKJrAPnVpFKmNGRFIVds2AH1o+wurVvL4
         0Qjuoh/7jTvVdSwmjs8T2oGE1OVN6ZXL0TwMEbESBbviaIL8AldDdUWkF1WnFokGMQNC
         djR6WRrmK54By6nSIWeVCevhRTRiOCq592fF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tQyz+RO3AMSgTAtb87CjNo2nylNen2LLT7Aye3MRl8=;
        b=tQ0M7WkC6A4+cdWRa0WEER8YZrijv6iAjQwPJdpoZp4Zo4rsjGV1MT2hDT46yXBLfy
         yvWDh9O280iXrF5kqJKV1EylamE8DZUA6CcXOSvAbyJOhuoOlIIiCrIZyGHCA4Azgjx2
         UtcAchBNkON2TZQ+VmR74fuuEOM2RQ4YPcM46qHUiuKj3ZbNfPm761hm4Dq2dcBdtNxY
         V1BI3ZW9/AI3D4TrvasSUpQyxv2MTdxq6ogPMIozn0zxx3vQZ6xsCG+diHEruA3yyF+u
         z6cUPvWivr17Dmha7PddGPCFHLVflKJeNWsRjW1EWMHut2yNfKdPRCxWVUBZaPrAOikF
         75UA==
X-Gm-Message-State: AOAM533sLpsmyJqucARicrd9j7cTpI4iNg+4kgsRxTrrXFYuHq2cDqrS
	CnFvL+rWnbz67ZDIHdGQ+FYPQsu1NLDsw92G
X-Google-Smtp-Source: 
 ABdhPJxL2QUStjxP5jGQLm7BMCbTfvNtR9NsQt3QwGut8w3XmhFAQtq3DffyOOq77n352xAM7xFHTg==
X-Received: by 2002:a5d:4989:0:b0:1e3:1d25:528 with SMTP id
 r9-20020a5d4989000000b001e31d250528mr10072712wrq.472.1645295000385;
        Sat, 19 Feb 2022 10:23:20 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bf04:d486:cfa0:deab])
        by smtp.gmail.com with ESMTPSA id
 f6sm26152921wrv.116.2022.02.19.10.23.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:23:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] expat: Upgrade 2.4.4 -> 2.4.5
Date: Sat, 19 Feb 2022 18:23:16 +0000
Message-Id: <20220219182317.3083591-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219182317.3083591-1-richard.purdie@linuxfoundation.org>
References: <20220219182317.3083591-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 18:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161963

This is a security fix release containing fixes for CVE-2022-25235, CVE-2022-25236,
CVE-2022-25313, CVE-2022-25314 and CVE-2022-25315.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.4.4.bb => expat_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.4.bb => expat_2.4.5.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.4.bb b/meta/recipes-core/expat/expat_2.4.5.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.4.bb
rename to meta/recipes-core/expat/expat_2.4.5.bb
index 14080220d2c..83ba3a23291 100644
--- a/meta/recipes-core/expat/expat_2.4.4.bb
+++ b/meta/recipes-core/expat/expat_2.4.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "14c58c2a0b5b8b31836514dfab41bd191836db7aa7b84ae5c47bc0327a20d64a"
+SRC_URI[sha256sum] = "fbb430f964c7a2db2626452b6769e6a8d5d23593a453ccbc21701b74deabedff"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.32.0


