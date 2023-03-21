Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678E2C77B60
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:47 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.14394.1679408442693818554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ywD7IRwE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id d10so8644554pgt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlEUivZg+OiYgRRX83joiFfOa51giZ+R8/O7ynjH5Vc=;
        b=ywD7IRwE2yN6OWcwq71NPnQph1LHmH/mIOS+l5TIcEuW6bUXH7i1+Vs15I9kN9gcko
         Fc/9ut2NjVYJoRNiNoQ/twmDE5RvpqsHoR0CiqeQVIFpx0aWfcy3x7SR3hB1QNiywXrA
         B2ryJTZPXdXIBStP6iRO4FQajY6S1WQsU58i/zup+3tITBEHge8Pr/NebbEZ+cviHu/5
         G3IpGf0SffLZv1zLiHvznmafkbSDDpok+kVF7go2TvskKx5yFEHc9ZHpSL9tS4lywaUE
         f8B3cyGFAehNPDOPj8Gtb4DoyRwiB9JUk8EbJSXCICIBfndjvT8K+Eaz6cqnmfZwER8g
         LO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlEUivZg+OiYgRRX83joiFfOa51giZ+R8/O7ynjH5Vc=;
        b=8Is5qXK9t96hNJsHadUurBH/dA8wE8DR7/JKrUBeJw0bRPycCJHXXSphGQj1O09SJk
         s2VDNgI+eQMRzQS0t53zzbaumJ9Uc12UnxGNnCpw2kZY9QkMR29tYfqzJRRgwZ/rVudk
         om3aKRgmgtUMcYSUfcbY9Pki65JDesimZ2JY86lMAtJjofD+7/917jiny/kw/UU1LsxQ
         RnVLWU1NoUMzRbahOfQRRyQe7WaNMexLxXyqGeWneEWigr7us7jRrxb5NSSRN9H44t4B
         1U0Qiv7OaP++QzzkANZAkIh/8vtPycLyPl8hjd/uQvgE09nXBPL6cW8wcC5/x3ikNk2Q
         HCeQ==
X-Gm-Message-State: AO0yUKW1pBrQOQyhmkgpZxdUPNWPIHC6tFv5Z6Shyub5yOjxeD5PnJVS
	icEMFXGmLMWUnanLXXjJW+kwIP06CViPdYf6Aqk=
X-Google-Smtp-Source: AK7set91DxkYQZiiwmq3PKBnTD2gx1iyzrjUIkvuaqFykKYRQt8h7AirZseLh5nNuA0oHgQHt//Lhw==
X-Received: by 2002:aa7:8bca:0:b0:627:fd49:9ab with SMTP id s10-20020aa78bca000000b00627fd4909abmr2600989pfd.28.1679408441705;
        Tue, 21 Mar 2023 07:20:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] vim: set modified-by to the recipe MAINTAINER
Date: Tue, 21 Mar 2023 04:20:11 -1000
Message-Id: <e630b404b1d1797be5e915592a6ef71e34aaf680.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178877

From: Ross Burton <ross.burton@arm.com>

Clause II.3 of the Vim license states that any distribution of Vim that
has been extended or modified must _at least_ indicate in the :version
output that this is the case.

Handily, Vim has a --with-modified-by argument to add a line in that
text, so use MAINTAINER.  This is the distribution maintainer contact,
by default it is OE-Core Developers
<openembedded-core@lists.openembedded.org>.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit acc007e23445aa53182e13902dd9509c39dd5645)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1f5e570757..1225005b0c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -80,6 +80,7 @@ EXTRA_OECONF = " \
     --disable-netbeans \
     --disable-desktop-database-update \
     --with-tlib=ncurses \
+    --with-modified-by='${MAINTAINER}' \
     ac_cv_small_wchar_t=no \
     ac_cv_path_GLIB_COMPILE_RESOURCES=no \
     vim_cv_getcwd_broken=no \
-- 
2.34.1


