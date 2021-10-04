Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B7BC433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:16 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.10126.1633357275074754509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DVA6F6rR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 75so16693130pga.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZcVawyOyruoq55RDJQgu5Buag/1Y7ltmT8P+ik+01aA=;
        b=DVA6F6rRziJJAm8ZgZuhC0fbqzLuk/MVE9ego0iq2Rz2OlTUtbDE6yBkgFKEGZwpv9
         ObeqT5sgAZ0KIQPaqxutNCmY41mYAwXRZk6iYYeUJ2mXXZX2TsFTh9fgTSB/1gvMi5pj
         X8mw4EMqLXo/MpckmZUvc/L3LF5sy2stGCmOL46HYmEHYg79v8bCvOKxx9oWjLpSaZLP
         Ch4Fbvkkuyg2qNeiD/AxIIpYcw/+dhiP2M+rOGgRBOsE8doEh/8EcRbEzNjCR5673zGQ
         4nbK5Fny5kO6hGXrSG4DCFOxpV8jJBaq7uZ/hd2eFKbuZeTHM1QXnwK5xFN16bAilj1A
         liWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcVawyOyruoq55RDJQgu5Buag/1Y7ltmT8P+ik+01aA=;
        b=jSRd4TGPnLghjQa7Q5t0N10dV6ZFdp21u6hEW5P/rsPTmLpf5mnIUPmMO7fBoxlYKz
         9QrHBPsNRp5qfm0LIZmEaS4ohZZ9dPEo/JmAtOc7W3gE/azfJfl/I22xjD0OMcS2ktHd
         FESLrHx5JMyJ5xfUiHa9lD7Px1asQIQ83QBxevTe3UE3bgZlOX5fCBhM0iqI1NA8x0hH
         DK3R+CWUsgFw47LNpZsXrs9VBMHX0kFhz6L7WyypOrIOmfN+aHB+Cxtn4xzgPIuFPggt
         GZjWzwPJZo8ve8+LbxjNur+1b017D4VBQiCFf/zpq5VYWgK9ShtpCikLAsNWKpeMgyIL
         0DYA==
X-Gm-Message-State: AOAM533cVVxa5z7gPjqFbIVTwVmBCLMsLso/IAPIaaLWHkA+jT3nP6B3
	UjSjBdrIFNpU5uQEtOrjlWRQ4GkwcPS1C5QhskY=
X-Google-Smtp-Source: 
 ABdhPJydS5ewsTACFPqQqAOSRcgHPWVHkVyEZIZSDjBDtqYYWp5hHYu2iR4nTIRqOZJNYJ8Gk5VWFg==
X-Received: by 2002:a63:534f:: with SMTP id
 t15mr11249863pgl.392.1633357273976;
        Mon, 04 Oct 2021 07:21:13 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/15] bzip2: Update soname for libbz2 1.0.8
Date: Mon,  4 Oct 2021 04:18:35 -1000
Message-Id: 
 <acb560a78ecd5403cf1f79e5a452c52cd58d1cfa.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156600

From: Tom Pollard <tom.pollard@codethink.co.uk>

Set shared library name as libbz2.so.1.0.8, version in configure.ac
already synced via do_configure PV substitution.

Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07e3abc9d282a54add69a6905ec4248f3104219f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bzip2/bzip2/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index dcf64584d9..adc85a62b2 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -1,6 +1,6 @@
 
 lib_LTLIBRARIES = libbz2.la
-libbz2_la_LDFLAGS = -version-info 1:6:0
+libbz2_la_LDFLAGS = -version-info 1:8:0
 
 libbz2_la_SOURCES = blocksort.c  \
                     huffman.c    \
-- 
2.25.1


