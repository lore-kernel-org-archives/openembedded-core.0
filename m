Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3ADCA0FE5
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 16:01:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.147.1693584057859571185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 09:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SJmVjmW2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31aeee69de0so1754945f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693584056; x=1694188856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtqxSCONaqYriPYur/VcgfdhPMTvwg+J5WEsLwEiQCk=;
        b=SJmVjmW2L9MMPk1q+5cT1HHdxV1QIzhuWcrSdSxslp5sOl5dCoUNjHs/XY/5/1knQR
         nQlyCQwhL/9TMYKCKKy9DcdsXLl0k3LAJk7rrmrlRgKG7u3WB1KfqIGnPuWZb0swlG+h
         3in2V7lb0pSo5y3bsZorT/R/N7RU6I64rhnz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693584056; x=1694188856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtqxSCONaqYriPYur/VcgfdhPMTvwg+J5WEsLwEiQCk=;
        b=hLf0CbJK7trhWTnwJPCiBnAUN4LwJQzdlOoUII+PguN76IPH9qsQaVxi5EFgkUgrVW
         UatFl6ujBv4FKeiEVMDa4tZxsHI3jUDgB+SpqjmyErUXSQT5sq7exLNBBSFzhCqZy8c4
         mAgrsbnpLPKAXMaJCgOxc+PBwkCOzLw6VemhUQ/370/dirwBnOxyhjIoWaRND+socYIC
         rqdi9ttMh227S+0uhftLup5aN5ifuZ5bhhYr44XLk1UuBp6UbVDCxGNfPy3582cv/Zqr
         kAYoVjRbpT2BSKsdqG9FDnx++wm8+68CJH3Y9Qx39tSFbR+mDxSEPzztJFJLenZK3Zq8
         nU0g==
X-Gm-Message-State: AOJu0YxGNdrFGGkSy3Y0j22hKXQ0VPRbthEgQCwy2oCwNASTETolWQUL
	1lnOuXJzFzA9BhISBrRwIkJ3kZ6ojx/pL5s30Bg=
X-Google-Smtp-Source: AGHT+IFshDnzqKTVBseXrAPfaO+6+I6t7Lc6RXqFHHiN+yD8V2uQWIxZKSbxECub7xtvAMCbL6VEPw==
X-Received: by 2002:a5d:544c:0:b0:319:775f:d553 with SMTP id w12-20020a5d544c000000b00319775fd553mr2423798wrv.9.1693584055945;
        Fri, 01 Sep 2023 09:00:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:76e4:713e:b3bb:704d])
        by smtp.gmail.com with ESMTPSA id s12-20020a5d4ecc000000b0031423a8f4f7sm5659555wrv.56.2023.09.01.09.00.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 09:00:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Add glibc 2.38 stable updates
Date: Fri,  1 Sep 2023 17:00:54 +0100
Message-Id: <20230901160054.2336762-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 16:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187011

Pull in the following stable branch updates:

1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1 sysdeps: tst-bz21269: fix -Wreturn-type
ad9b8399537670a990572c4b0c4da5411e3b68cf sysdeps: tst-bz21269: handle ENOSYS & skip appropriately
c8ecda6251dd4a0dfe074e0a6011211cadeef742 sysdeps: tst-bz21269: fix test parameter
2af141bda3cd407abd4bedf615f9e45fe79518e2 malloc: Remove bin scanning from memalign (bug 30723)
98c293c61f770b6b7a22f89a6ea81b711ecb1952 malloc: Enable merging of remainders in memalign (bug 30723)
7ac405a74c6069b0627dc2d8449a82a621f8ff06 i686: Fix build with --disable-multiarch
6135d50e44233d8c89ca788f78c669941ad09fb9 x86_64: Fix build with --disable-multiarch (BZ 30721)
5ea70cc02626d9b85f1570153873d8648a47bf95 x86: Fix incorrect scope of setting `shared_per_thread` [BZ# 30745]
6b99458d197ab779ebb6ff632c168e2cbfa4f543 nscd: Do not rebuild getaddrinfo (bug 30709)
ced101ed9d3b7cfd12d97ef24940cb00b8658c81 x86: Fix for cache computation on AMD legacy cpus.
d97cca1e5df812be0e4de1e38091f02bb1e7ec4e stdlib: Improve tst-realpath compatibility with source fortification

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-core/glibc/glibc-version.inc   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2e403ce9808..69280fd2107 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "13.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.41%"
 GDBVERSION ?= "13.%"
-GLIBCVERSION ?= "2.38"
+GLIBCVERSION ?= "2.38%"
 LINUXLIBCVERSION ?= "6.4%"
 QEMUVERSION ?= "8.1%"
 GOVERSION ?= "1.20%"
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index f53e59103e2..a907444f504 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
-PV = "2.38"
-SRCREV_glibc ?= "36f2487f13e3540be9ee0fb51876b1da72176d3f"
+PV = "2.38+git"
+SRCREV_glibc ?= "1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.39.2


