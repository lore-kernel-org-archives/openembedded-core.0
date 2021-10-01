Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB2C4321E
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8305.1633096246365064534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UliECjmf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id u18so15626390wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b/Va5TJa3BAvfGkXsJ+yfymA4jaE7SzkWelig/B8OVU=;
        b=UliECjmfB7Hq7FFGshJBgq7+jKGq339ZhzrPrQl8CmrORArEqxzr9VXmfnuYrPO6YQ
         Zh9TmYnr9be3PHpXkMF3DXUSJx2PIXfMlrstzdgZscJljDRh9j/ai5804LKCXUqTtUzF
         cOrCfIoZV57EIiKZKo1aB5n5AwmIaICZzQGvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b/Va5TJa3BAvfGkXsJ+yfymA4jaE7SzkWelig/B8OVU=;
        b=NCvkLPtUh7knIJKL9yv9cgL4+4Qo9wdUQAipcdYKzzsfYgIe5phVRVQEtA2LccmZsi
         0e7/kmmyq+hMggktWeWDSvvRvuwN5VPIFuD/Q9vpc/cFXDOtak1iUHONkMv3n4VA+Vyr
         zskWBFCqpuq4jVQl6GpojxRhb56T4eNKnZzHcBnKVU/zocKH4A52keCDMmsU4z9/l7Nv
         ORo3+kvjzlPvJy7HnOIdoCFBWXGCeqZ2Qf+U7ENHO/LroibMahP9n9p9QH3BqvzTVg91
         /aFvE2ZrTrLXYD2xuTc0LH3OgEPQd7kQ+moq7gRguAbgiREi04SA4iPAczWeHgfbSNJv
         Wq6g==
X-Gm-Message-State: AOAM531TaIczT3YjkqtumxVgZu/sKR1NnKqj51tPeEBaMONx0BwthdWj
	mjOB3F88UTO63Wcr3xp++38v/iqRL5z/Gxw9
X-Google-Smtp-Source: 
 ABdhPJyF//wKdCVZ/iarJSR3ycDtsmH63jTxVPksSV6uFaIQEhEaFDdoHvRm7QIS9Ozc9Jmvxg4saA==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr12819224wre.50.1633096244707;
        Fri, 01 Oct 2021 06:50:44 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] gobject-introspection: Don't write $HOME into scripts
Date: Fri,  1 Oct 2021 14:50:38 +0100
Message-Id: <20211001135040.2251283-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156523

Writing an expanded version of $HOME into the wrapper script breaks
reproducibility. We don't need this here so don't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gobject-introspection/gobject-introspection_1.68.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
index cf1349f830a..b1d3d8abdcc 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
@@ -93,7 +93,7 @@ EOF
         # from the target sysroot.
         cat > ${B}/g-ir-scanner-wrapper << EOF
 #!/bin/sh
-# This prevents g-ir-scanner from writing cache data to $HOME
+# This prevents g-ir-scanner from writing cache data to user's HOME dir
 export GI_SCANNER_DISABLE_CACHE=1
 
 g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 --add-include-path=${STAGING_LIBDIR}/gir-1.0 "\$@"
-- 
2.32.0


