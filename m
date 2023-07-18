Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67613EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:40 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.11606.1689696091919036947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WetMykuW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6687096c6ddso3762712b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696091; x=1692288091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fUvEd2rb7mgnVz1EtRimWn/z8Ziw3BgIPzFfBsTPY8=;
        b=WetMykuWOLvlP9ck+lq8xC1hfSBz9JNOnYSQ004zgFly7FmJOZ3owNihIFjhZmeWrI
         Lna0AHxNtQGa7KVnvs41O/lNc0LRtNRU5LaS29BlcuBV5egx+9a7yAALoZN4VSNyoSv1
         vwpgXPBQ5dDm2wEJzXR/LUGRYenTGa0JrfI41B3jjx7Vao7D0je9/sSaIlzIm4NkXjwr
         bXbuUDUyhnHH53aOig6Cb8n2I4826KLMMs34gnFoRVFy4fCE2WCkV0njqpg5kB8dLuQ2
         ZMgcMXKwT5cc/64/zOHheQpeo2OUcGR2RFVpqTnKxeDoJHMUnuXfKBVC+bkjmY5gaimg
         G7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696091; x=1692288091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fUvEd2rb7mgnVz1EtRimWn/z8Ziw3BgIPzFfBsTPY8=;
        b=QCPApGMizSIaVNT+uNCuk2XCX2WC1t2jDPKwbFKd4+8owbetz0IEU3nXU173eCXLVY
         gQ/OTvUhs7GWgmFDUaH1sui4Z2hOJa3k065VDt+y8AWg0AYpoUdF7ksyoYwdM0kCFRtd
         4YYvRqPycrgNlCqF5dUVYgO+ekPmx2qRElNgVi2rwFN7GR7tv6DGfP+PLMrjVDcqhaGE
         iPFkKpd0/qOUKkHKcVMytDJSuftS08F59qNU/IYUI8sfiSaKg19G8KCSzo81i47eAdcV
         KU7MyS7UjEuaCbGTu8u4rXr6uncavJcCnxJSCxifLtP0ThEVMxgcHVmqD334DtvY0EKW
         cbbg==
X-Gm-Message-State: ABy/qLbBxtFgO5nKU+7g/XQJ7Vwsx3oTyqteJ6Fy0MxxxxDLCit7zxqQ
	ZAGJdxK/QsafPEfJLA1L63oi4XmacnahtgbkjfU=
X-Google-Smtp-Source: APBJJlEhhWFStesbEM77iqpLZDTEizlMRgJ5h+zr4PNozislXBb4sM9uXcGeejdgKs3nz7xTX+9prg==
X-Received: by 2002:a05:6a00:1509:b0:682:4801:93d3 with SMTP id q9-20020a056a00150900b00682480193d3mr16350555pfu.31.1689696090891;
        Tue, 18 Jul 2023 09:01:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/13] glibc: stable 2.31 branch updates.
Date: Tue, 18 Jul 2023 06:00:58 -1000
Message-Id: <d89f5692514c68050349f37315e1dea14cbcfa24.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689690585.git.steve@sakoman.com>
References: <cover.1689690585.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184544

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.31 stable branch are updated.
2d4f26e5cf x86: Fix wcsnlen-avx2 page cross length comparison

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5414297ba1..95e2bba301 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "d4b75594574ab8a9c2c41209cd8c62aac76b5a04"
+SRCREV_glibc ?= "2d4f26e5cfda682f9ce61444b81533b83f6381af"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


