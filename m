Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F5AC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.101.1667835441632220345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PsLaiIqc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id c2so11372904plz.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h6weqAD9xa3p3LV0uS4nscUohy13EduPZcOMzZg4x0=;
        b=PsLaiIqc62mGdvUhoXI4u7Xp/hHT3EApvxOD8xkRa+yN5gPRxx97TcmBYVzzqEVQF0
         8+qRyi3TzkRpLlr25MTZeasFvEttjH+kCBfBiLxYwl4Ns1wZXEbmTVLvWjHA4bYa2vkq
         v2yo+VFGUtVW8DNPGH3l8CPjXx1h7RG8UoLcwZraknGsoyu/9mhQSCm4U42ehNokE3Ju
         WP9h3uBi+GiN5pHbJ875gAztn7+KrKJSGUhZQDf2a7fjRM3FL1fBnCWmhIRaGGb+Znx1
         wWnG+gp8sKo12vhdBJx9UqS1eFCyGi91EyE6wde6Ts4qxiuGOpMgwgcI+GE0zd0+TLj0
         /QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2h6weqAD9xa3p3LV0uS4nscUohy13EduPZcOMzZg4x0=;
        b=Qac8vXzjRRMQ5YcGXhdvbLsAQQGIYhSLnsEZr/q4MzJF7Lo+alUz6ByNVw+OfRAbEk
         wPY9IXuQpdGi7OAkEYkpbc9VJg+WcVfF3i4doggXHsDxWJ7a2mwQI0pGSkz4uBFU1ZIE
         zrkVUEOzZNHVwnGZx2Signre72xCfRCxReC4NmVd4ayWc1wRFjNA1A+dS/s9i5wqW8m8
         hrbmOoqJ9JTmbv+s9eDUn6xm2uE1bpyWeLltH++MEW5bw7v1ECcy3YQ5Qs8p84h0fYBS
         Wzm8pW2V1XCd5OnMadvdZ2/UbtCThJb87sHRvarWTh0BciSq1k0gvJylIeq8oDHm2bBa
         VIFA==
X-Gm-Message-State: ACrzQf3hUz3aeAS5Gtx2wLGddLpcAbmful6vojWwheOK5rUDTfwF5AEb
	J5GMdzB5XUTpnIBAvx77ViyRCXsx+qoXodGw
X-Google-Smtp-Source: AMsMyM78MmCHKjLZYW/f9QKd/3yEl34+n8OXzh7fyW/+Ywpupw+kSxzd6pzXgevp/QDuBvYRfQvWUA==
X-Received: by 2002:a17:90a:ad08:b0:212:d5f1:e0c6 with SMTP id r8-20020a17090aad0800b00212d5f1e0c6mr67635235pjq.228.1667835440735;
        Mon, 07 Nov 2022 07:37:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/25] kern-tools: fix relative path processing
Date: Mon,  7 Nov 2022 05:36:32 -1000
Message-Id: <110bcaf1629ee89d7117ea1d4f860fe9f61ce225.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172912

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The previous fix for processing of paths with relative components, broke
uses cases that were a mix of patches and configuration fragments.

Updating the SRCREV to include a simplied fix for relative paths, and
a cleanup patch from Jose:

[
  Author: Jose Quaresma <quaresma.jose@gmail.com>
  Date:   Thu Sep 29 16:37:23 2022 +0000

      scc: only look for error in scc_output_file if it has valid content

      When process_file function fails the output of the processed script is show to
      the user, some parsing is performed as well to look for common errors so we
      can point to the right input file.

      This can only be done when the scc_output_file have some valid content
      otherwise it will show invalid messages to the user.

      Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Wed Oct 5 19:13:33 2022 +0000

      spp: ensure that prefix check uses absolute paths

      The previous fix for this issue was too broad, and impacted
      all calls to the prefix check and removal. With this change,
      we only expand the input on scc/spp operations that may
      execute with relative paths.

      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 533720a1756454447341769c4a0969fce8d6f287)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index dea7b65a7c..07d7daf5fb 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "ba600ef61a85966596126a6e8d936971905e8749"
+SRCREV = "6a4752ebbe7d242c02b3c74a5772926edd243626"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.25.1


