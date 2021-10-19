Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF29C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:31 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.15533.1634673330920752528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vCvNfoPL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id g5so14481760plg.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A6jTxxZejTjTwqp7RanmZJMKZf6c/f84kRxog2xme3Y=;
        b=vCvNfoPLvEHxXwPtzhAMfx/zcH0+lyzB+Q3P5f0l4A/6+TvkT2mWTm4Wk9VBcfmeMI
         aNL2frvgOShf2+DT0SwZ03q1aLtq8+Mf2XvIFaTrNdgDptV/g8ixcsqKzy0iUC71Fcnc
         b9l9higJHvw9bxLCvxX8flquboM/AeeeRXv+l4500tw4caT2TXxCQoP4Q6+f5bes76Sj
         T0uX1gcgKcykM/dDEDPyXHdZQsucRPY+k9hm2k96VXzTwdkJeA5ly9y+iqy82a7dRzBE
         LB5HTZq2msaFxieRKHlrLpSwNtjWQoebo7vHrIwuQch391QV1sbUvhu3RedwOMn2j/c7
         gr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A6jTxxZejTjTwqp7RanmZJMKZf6c/f84kRxog2xme3Y=;
        b=tQh4Z3+l0M2QdDk1feO/1L4fd9x3UaRf3gAbsg2lzmD203GjMI1hLjgYq8y1bFraE5
         nTjGHczkXbUIBr6vO1ARBrqTY7e7sSxFUj/ClLa8PEU90PjACYtAyOJc02FinfClqRIY
         znN10CL1PKaMb/XGrOFOteyLgA/kqV2T+sw38v8Vrnv1sWJSu0/up5XItQgV6bIwFQBc
         qkmul9vO7G3iuQiRZF8ar+LydfTR4KY9gJDJbjHKiRK3gqpVO5e7INeVgZBk3Eg1TlxR
         UzZ/m+zcny9uTl90kLM3KGGYARzR1Z5olMXXvfRdZi7+NUtqYlMA0xF6CaAPN9oinuQW
         PlXw==
X-Gm-Message-State: AOAM533t/kplj10IowWrRvTJHVg9B9hN3pkoPtATLlF3IZFMfq6J0ha5
	Ec93k5cNwiRKpJ86KydfVNw2y5dokG8xUBWa
X-Google-Smtp-Source: 
 ABdhPJzDL9SaGrofzmb2EAfNTQWpbY3UyaQOdlLYSUvxTIXKUG5tuRqN/dUfC24R//wXlXtjYdRiBg==
X-Received: by 2002:a17:902:8b8b:b0:13d:e91c:a1b9 with SMTP id
 ay11-20020a1709028b8b00b0013de91ca1b9mr35167315plb.60.1634673329984;
        Tue, 19 Oct 2021 12:55:29 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/38] libxml2: Use python3targetconfig to fix
 reproducibility issue
Date: Tue, 19 Oct 2021 09:53:46 -1000
Message-Id: 
 <e570efa43d5655afa041bd4ab52fec2de2216e4d.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157240

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing pthread being linked sometimes and not others leading to
non-reproducible target binaries. The reason is mixing the native python
config with the target one. We should use the target one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1bc5378db760963e2ad46542f2907dd6a592eb66)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.9.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 60dc71f38d..ebb996c8dd 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 inherit autotools pkgconfig binconfig-disabled ptest features_check
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
 RDEPENDS_${PN}-ptest += "bash make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
-- 
2.25.1


