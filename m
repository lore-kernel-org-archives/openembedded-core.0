Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07D0C433EF
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 10:05:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.13486.1653732304869301488
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 03:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@linuxfoundation.org
 header.s=google header.b=QPhqx2bl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so5811661wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AHuK/H71cPb75F6QDLgwvtg323gh1Z89ynloeK46VLo=;
        b=QPhqx2blmDbmsiVStNeyjH6sX0UcbW2WPjgTmF5gMrrwvH2Q/eAsqV/rNZzMXhSNbK
         sX2Ss2y5jzSN+Emn87TOdGj2QSRuS7Fg/yVqVAuUmPSidRFjcBpJjGOYo5cWmDEfZezD
         IwuiTF6h6z4oc55wrCPo68bL3f9sBnjYmFMH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AHuK/H71cPb75F6QDLgwvtg323gh1Z89ynloeK46VLo=;
        b=6n7p/NfrfKFB1Sx9gnoh0VK9mRbDZF12HUxjxJ913A38BDU7ftMihBcMzDqJ1DxWi/
         e4IKx46YBwetROvaqJORcQ3/yX/d014e4L2RHWp69F1DY/QEDwj5HNisfYZDDIGe1L2X
         MPlO7bDsY5pRVazPzVLvRLjvfhfJb9A3HbeoJIMwoDuN8PUj+nqGjmd03V89ojiiIgmt
         aG+waUPBj6U6dedqiYCtAdxfpLFcZHXGdyg+42GGnJDA4dmSw4UzIo9HtQRCPHqmel2f
         SXf7T6ZBtLhNZ/kNzzWL+pSbxcoQ8LxdpktRRQC4HTkRPd0V8kTAHi8oYxeO4Imkspf4
         lfAw==
X-Gm-Message-State: AOAM533R2F8j9rqBqlq64CHD/upBqC6qRxMLHSUbcxQBkPcxtKfzkAKP
	uIMIYRI97ZIvf74yKQIypBkNyOS9MG78UkL3
X-Google-Smtp-Source: 
 ABdhPJybawWJE1OOstuYUitcrJqnrvgQWq1LroAjZtHpxmBKNyMlzhsdBIv4nWFEDUx6ii/XgFiJQw==
X-Received: by 2002:a7b:ca46:0:b0:397:7c5c:b962 with SMTP id
 m6-20020a7bca46000000b003977c5cb962mr10284106wml.139.1653732302924;
        Sat, 28 May 2022 03:05:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41b6:b722:6b4c:6704])
        by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020d106c0386sm3791350wrf.89.2022.05.28.03.05.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 03:05:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tiff: Add jbig PACKAGECONFIG and clarify CVE-2022-1210
Date: Sat, 28 May 2022 11:05:01 +0100
Message-Id: <20220528100501.508207-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 10:05:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166225

We never depended upon libjbig so this was never present. Add the
PACKAGECONFIG to make this explict.

CVE-2022-1210 is an issue in libjbig so we don't have a problem there,
mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index c5e964ec8c1..7a5e4816a6e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -32,6 +32,9 @@ CVE_CHECK_IGNORE += "CVE-2015-7313"
 # caused by 3079627e and fixed by b4e79bfa.
 CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623"
 
+# Issue is in jbig which we don't enable
+CVE_CHECK_IGNORE += "CVE-2022-1210"
+
 inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
@@ -40,6 +43,7 @@ PACKAGECONFIG ?= "cxx jpeg zlib lzma \
                   strip-chopping extrasample-as-alpha check-ycbcr-subsampling"
 
 PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,,"
+PACKAGECONFIG[jbig] = "--enable-jbig,--disable-jbig,jbig,"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg,"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz,"
-- 
2.34.1


