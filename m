Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CF4C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 11:03:36 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.9354.1678964613057155759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 04:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9UW2rTU;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: yashinde145@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id y19so670804pgk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678964612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCo37oxWezI/H/VrZSqYG3GJC1Zr5WUYXwd0IgdH6cg=;
        b=a9UW2rTUoh4SENObwPhPesXC4Gsa2aTrZs3XbxPU1SL4C6O3OGYTRTvBytXa32I1QX
         E5LuCvVgfXyfIbvERfxN056aDN/8q1MlBIyDYPGE5EGfadl1VKi6J/NnZYvKRmAqCrW/
         7yHJKJkOVwg74xkkt2sM1nHByprojjaHPQUD5/YWV0szDqx9/WCplzYXVPerprp1JUJK
         h4/UdS6KpxItZQZhZZPzkFD4iFjDTVKkjZVqijoZJ53x9h5++R/8dif/hHKRlztpjIg1
         TZB4F8CQduZ9M8hm4Dl1SqRgHq8Ca3KLKRR5MUqu0ZmtANAMuscIVL3y/ZKvT/F8xUm0
         FgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678964612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCo37oxWezI/H/VrZSqYG3GJC1Zr5WUYXwd0IgdH6cg=;
        b=dciGoN3L25cQzz3hL87cO2iWZK5VsOXPE0fZSok/jFPTJM3L1yjCdoPPBGi3o++Ca/
         K6G3/hzDKf8ubxXTU8izIw1Xe9iQQjiY4vZhblht6ExjZ9Czs1vezn8xwqfE+a9esrUd
         5KjQ0S+AetPigvhKXI3TwmyzcLLbUPJI9+VR1OWjTGbV387Jmdameyxxtj6hrH6H/c4a
         lWC+7dmxJaNG3TnLH9oFuFVU1NOx3yBBR8QuqU2RaslrM1xU619bNL7troNmh8OubaT8
         6iB8woW+Yy9OLorRFyJBCWa9YR4Qma6Mq5CwfW989usN8bXfw7kuFP7bI0iTAh70OBWT
         hUPg==
X-Gm-Message-State: AO0yUKWTtWRQcvq6jodQIS4qA2Wd+lkRnMJjTt8R+rpmbPr0xoKUjmrU
	JeL4LxrO8U+PCQMfXaWHhHCbKFpQzmc=
X-Google-Smtp-Source: AK7set8ZlWXhNFPLyy9P12GdgnBm7xY+PJ2Xhm5LZ+ao3YsgRckoj76BgUetaL7jUuOf4R3+6xsdvw==
X-Received: by 2002:a62:5c4:0:b0:623:6131:66ca with SMTP id 187-20020a6205c4000000b00623613166camr2410012pff.32.1678964612121;
        Thu, 16 Mar 2023 04:03:32 -0700 (PDT)
Received: from bft-2.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00593adee79efsm5186066pfd.55.2023.03.16.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:03:31 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com,
	Umesh.Kallapa@windriver.com,
	Naveen.Gowda@windriver.com,
	Sundeep.Kokkonda@windriver.com,
	Shivaprasad.Moodalappa@windriver.com,
	Yash.Shinde@windriver.com
Subject: binutils: Fix CVE-2023-25586
Date: Thu, 16 Mar 2023 16:32:55 +0530
Message-Id: <20230316110255.2622075-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 11:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178700

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;h=5830876a0cca17bef3b2d54908928e72cca53502]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.40.inc                |  1 +
 .../binutils/0016-CVE-2023-25586.patch        | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index c2b926bb32..93631ca3d7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch \
      file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0016-CVE-2023-25586.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch
new file mode 100644
index 0000000000..43e36caf3f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch
@@ -0,0 +1,34 @@
+From 5830876a0cca17bef3b2d54908928e72cca53502 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 6 Dec 2022 08:37:52 +1030
+Subject: [PATCH] PR29855, ch_type in bfd_init_section_decompress_status can be
+ uninitialized
+
+	PR 29855
+	* compress.c (bfd_init_section_decompress_status): Set ch_type
+	to zero for zlib-gnu case.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5830876a0cca17bef3b2d54908928e72cca53502]
+
+CVE: CVE-2023-25586
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ bfd/compress.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bfd/compress.c b/bfd/compress.c
+index 3d8c1d769f1..6b083468ca8 100644
+--- a/bfd/compress.c
++++ b/bfd/compress.c
+@@ -1012,7 +1012,7 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
+	  return false;
+	}
+       uncompressed_size = bfd_getb64 (header + 4);
+-      ch_type = ch_none;
++      ch_type = 0;
+     }
+   else if (!bfd_check_compression_header (abfd, header, sec,
+					  &ch_type,
+--
+2.31.1
-- 
2.34.1


