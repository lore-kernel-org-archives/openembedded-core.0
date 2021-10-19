Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BF7C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:22 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.15314.1634673321923454225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=a/pmEYHF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so737236pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/sx/mwj50wvvIG0okeyiJAToC0bleUp/FPsASgD/NCs=;
        b=a/pmEYHF3wyaTxPrXJSiqGJesckftelvyfXD7/mk0+JJ8ClYCQcCKgnvmxW9Ij3mkU
         i9PdXsdz/LFuxV7LrmIsLHNmiBg9SLnPs8atkkFn9539ycZWuYOFCNMVJ2mB5kTAfTnq
         rwhQh+wFpL/+rIxszxqxPqi0SWHn4yF9cNk8pCT82Dc1NyzkAKtKEZ6xrTUU7kGJUHDe
         4wuLSZXWuH7qMzVtKuzeERVNAmEaa64K96wWbR2Themv2Ra2/oRaF66gPuW4PZfwPfzj
         Ef40NARhjfP11ehkq9Ymn2519j0znM+zYt99AeVfoYEP6PLbDwn4Ej3cmFqBjfc3Z644
         cZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/sx/mwj50wvvIG0okeyiJAToC0bleUp/FPsASgD/NCs=;
        b=v562jhry0Q2LnRlmt8y1xTb2hsK1zoDLQvALuV/x2WRHWak+ugQ1aUv46daxfJsGoD
         ymvfZLiytptiXJoFsxQZHYJI1cBRAZtdUiRtVxU3ixh77f5Ute0WPnsHwEO6aYbs0EWi
         QWEh1O4dFh0MfNNWCCmw2LYwD47cX+l/JVed4QX+3DwS6eS9mj0qvcHc/ReZKJrf/C65
         PnLjajOVhu0A1lCopLl0c9nLyk6pDhM9Wse/ug/pm0sRImbXcBekkGUl3FBUaul/QscJ
         GVEmiy2AqCgyW8JogY3nkEcF/Ty6oCPOCIRO4movCMb+OfKKCLNJU/lQOXqyZycdtEON
         hj4A==
X-Gm-Message-State: AOAM533ddFZK1BZVSURpPBHVDsMEf3VV9kNBRZX9y/uDfsPO6+uIkfG3
	7plduII77nhNLNSf8gehZ13rjbPjCWLI5UKMPAE=
X-Google-Smtp-Source: 
 ABdhPJxmlOAAqN4Fi4JvTlPq0MaPzqVp94VFmfS94b9QqNmUykgCyi6b9E82NECZa27mdaBXVpa02g==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id
 cp14mr1331319pjb.168.1634673321023;
        Tue, 19 Oct 2021 12:55:21 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/38] libtool: Allow libtool-cross to reproduce
Date: Tue, 19 Oct 2021 09:53:42 -1000
Message-Id: 
 <f1cc4b8d7503331f04d3f217ae67d0fd4cc483c5.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157236

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The hostname removal from the script is useful to make libtool-cross
reproduce. Apply the patch everywhere as it doesn't cause any issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c61c6f20187154d677085fc9ccdcd762d4cdf3a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.6.inc | 1 +
 meta/recipes-devtools/libtool/libtool_2.4.6.bb  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 1bac81331d..c8744e6d5f 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
            file://lto-prefix.patch \
+           file://debian-no_hostname.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index a5715faaa9..f5fdd00e5e 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-SRC_URI += "file://multilib.patch file://debian-no_hostname.patch"
+SRC_URI += "file://multilib.patch"
 
 RDEPENDS_${PN} += "bash"
 
-- 
2.25.1


