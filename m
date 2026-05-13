Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F99CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 11:59:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5831.1778673567482959909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 04:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JSwrG9hV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so71344085e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778673565; x=1779278365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnuqz9ynQKph3a2Ok4O3L5AgERSzQlo412aiePajP2Q=;
        b=JSwrG9hVTYo/6j9Mxz+Ky7/Hl8pExwalXkRE0IL0UWvlXKjA6sTCEK/eI0f7Aoh4N2
         Gsyj1b/0uCZwTs8xOCzk7VmSl/0qhUmZk3CRDHLX4z9fw1nJyzZUmCs10VBfZTktQS5g
         ggByR4eenu5UDUnLFroZ+Rq9zMRobHgHzxFRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673565; x=1779278365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnuqz9ynQKph3a2Ok4O3L5AgERSzQlo412aiePajP2Q=;
        b=P8/r0DcPoAhr1nIs9EtX9oXEDKcX63FYgD3YqXsbVQ1HeVAp924orxLCo/5QxXKRrq
         uuGWdgjqArT9h5Y6USVShmSFhF//hGjwL50g+TwgwUaRsFzFyoW2hu0dkV6xBP/00UPQ
         v2R+GUhA4pWLQCwYNc0lN1quds1AlICm9aM2ZjmxcutsSnN7RIm+yAsf6LaXOfe6VYG3
         BN1qy4Xkw5M/pPvmDKdZSZ6W0cBzi108PMLjDQ1ZaeQsY4QIi0TtanPNjVka3Dtfp3Qw
         ElIJjhpXi3S3Pob454x50sJFgfwS168CMz1IiZSdJkBip5P6iL+lY30sBkm8783QPvEZ
         1B/w==
X-Gm-Message-State: AOJu0Yx9XB9Ym6QKgajW/jsWsaIy4M+iyLmqx1peclp/6Nl1CXHCUi9h
	zF5MAdIdwQcskLZjbKbfC2hZNr9DRKGm/NXEXmHolK9HihgLgT01VUwrdeWZkdjl9mwBknK//Cg
	9oFJ6
X-Gm-Gg: Acq92OHgQd6+wS49gv0NyJ1U8BPRVO6nIS+Sd2BN4xHHQ50c5IGxaBNoYVQekZVwmxL
	aVmgs/pCP85kuBEvI40QPPjXgg9UWiCpUwX63bCH11pQY9F7mBBZURGEQcigV/uKxuFCn8H+dM2
	MCqsmA6i22WSxOVMQLJ4bsglxHGnpasgVwlrad46lEoAfXvF77Qe0srNI7/mCOAOJmPw4yrw+80
	M+0Yil1aIfG0vodqvp4M27dralzj95jkOrZFj4vTGTDfALFtgtCdnLe+cQWZ6qvxXdXKGQSPHiz
	oGREM6TgkGG5e3bDiKhifHbE6P13TbboWFjDJTu4XBnNS+B6+L+6VS28mjFs3LDn/05GBetxBm0
	BuLYCngFhWtcEPb8/6Z6N2iCDgpgR+3cnuIYmjgJFdLHT/kWwfQChjJdzUGz+nK5/cOorAS85kO
	fxJPIn3gEUVxuYHnjGvO6JoBQLZakeimNoUTFFIosnmb/5n1D1MsJ1
X-Received: by 2002:a05:600c:19c9:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-48fc999e736mr41507555e9.0.1778673565058;
        Wed, 13 May 2026 04:59:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b7ef:b234:c010:91da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d624fbsm160495895e9.10.2026.05.13.04.59.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:59:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Upgrade 2.8.0 -> 2.8.1
Date: Wed, 13 May 2026 12:59:23 +0100
Message-ID: <20260513115923.3375717-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 11:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236965

https://blog.hartwork.org/posts/expat-2-8-1-released/

Security fixes:
  #1216  CVE-2026-45186 -- Fix quadratic runtime from attribute name
            collision checks that allowed denial of service attacks
            through moderately sized crafted XML input (CWE-407).
            Please note that a layer of compression around XML can
            significantly reduce the minimum attack payload size.

Other changes:
  #1209 #1213  Drop more casts related to `void *` that C99 does not need
  #1213        xmlwf: Streamline use of `mmap`
  #1214 #1217  Version info bumped from 13:0:12 (libexpat*.so.1.12.0)
                    to 13:1:12 (libexpat*.so.1.12.1); see https://verbump.de/
                    for what these numbers do

Infrastructure:
  #1210  CI: Cover compilation with Visual Studio 18 2026 on Windows
  #1215  CI: Cover compilation for ARM64 on Windows
  #1212  CI: Bump WASI SDK from 32 to 33

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.8.0.bb => expat_2.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.8.0.bb => expat_2.8.1.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.8.0.bb b/meta/recipes-core/expat/expat_2.8.1.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.8.0.bb
rename to meta/recipes-core/expat/expat_2.8.1.bb
index 53c141c2005..fa48d42bf86 100644
--- a/meta/recipes-core/expat/expat_2.8.0.bb
+++ b/meta/recipes-core/expat/expat_2.8.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "586494499ac3ad46d87f3beda7b1f770c1c8026a9b60e151593f8b29089a52ca"
+SRC_URI[sha256sum] = "f5833dd2e1cd7739ec9182804a1a29c4f0cc7c2f26b633d3a2188b7766a88ecb"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

