Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6623DC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 12:15:16 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.10331.1644322515589788671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DN9obQCM;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bkylerussell@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id o25so13467066qkj.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/73OPU6t7JLQcH1hVuAVXH5nNqi2rUpWi0JmD39T13w=;
        b=DN9obQCMFlWmVvwegWgsLcFHHznaMTgXW2asZbanNlbdYcL/KnEMGpdSGXjrJTH7ZW
         zgJTxPAD0fUj4OoW95fz7rxQ9Y5q9X+KJ8nPvAaSrldNWsQKmZL4ewG090uZwXEYNh+G
         0UIXNPBj/sZn6hSBZicFu2Hu5iWaaF7Ozax02HdnUg5suNE1B+Z+EBisGoCK8g8wt2hw
         l/cIoFxc39YLk3UsIb4DjK7pSeaa6bxBW0T71KgxbONEyg7kCGNWmpmR5N8WToaEyR4a
         nVc7C7mxGbwynpox89N6ZKRBEhV/Xqw/UetvWWbNrKbk3q77/RSUjw860U5jKBhqVTEk
         LAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/73OPU6t7JLQcH1hVuAVXH5nNqi2rUpWi0JmD39T13w=;
        b=QRfFJmcCiOU6tkBH4qLSwNuln7KAyWtclXptgXbb/yS8qSvBEWP31RfL+bQmvbt5G5
         mV/CMP+L/eU61mqs1tBfzT4ZMRJU9hxdapvKNO/dkFyOscMGR0SjJJ01s64f2OnuGXy6
         TIb6dHBwGpn7SNkMMsKCNrkubGpObP5Ld797uiD3jTaG+rzd78eEuHS61q1ZQ4MVB/Bv
         9ba30IgvZhPwS1brxgi2eKwIcYJGOSneWBGNvHallyON+39xnvCwOfBqwKyD+GFnvxeU
         aMS/IGBCip7oABHdX/oHj8cI7XgtpkFGeNmXRo1Z1A50gfxu6kn8tMSm1t7JsTDpYmkO
         f8dA==
X-Gm-Message-State: AOAM531TgrelCg7u+XhQOHlTNjJorBf6l13bCQkGbJPJgqTukA2Plwlh
	+L8OKaEA7EOoAKNIu/6sSVOFloThlmXsIA==
X-Google-Smtp-Source: 
 ABdhPJzEYPQaTkKPDQRoHdB1aQFCV51qRF2n2rLuzdtGQ3rmgPN4m5XZBvkzDMehH0crZDWVxGt6Yg==
X-Received: by 2002:a05:620a:348:: with SMTP id
 t8mr2381302qkm.628.1644322514499;
        Tue, 08 Feb 2022 04:15:14 -0800 (PST)
Received: from hercule.localdomain (cpe-74-138-104-174.kya.res.rr.com.
 [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id
 f22sm7544986qtb.1.2022.02.08.04.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:15:14 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [dunfell][PATCH v2] rpm: fix intermittent compression failure in
 do_package_write_rpm
Date: Tue,  8 Feb 2022 07:15:08 -0500
Message-Id: <20220208121508.428170-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 12:15:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161501

rpmbuild can start processing random memory when processing the value
provided by XZ_THREADS, and unintentionally disable encoding for a
file descriptor that in fact requires encoding to be enabled in order
for lzwrite() to actually create an rpm.

  *** Fdopen(0x7f2030002b30,w6T16.xzdio)  | fdio 23 fp (nil)
  ==>     lzopen_internal("w6T16", 23, 1)
  ==>     lzopen_internal set encoding
  ==>     lzopen_internal clear encoding
  ==> Fdopen(0x7f2030002b30,"w6T16.xzdio") returns fd 0x7f2030002b30      | xzdio 0x7f2030004e30 fp 23 | fdio -1 fp (nil)
  ==>     lzwrite(0x7f2030004e30, 0x7f20789d8070, 6) encoding 0
  ==>     Fwrite(0x7f2030002b30,0x7f20789d8070,6) rc -1   | xzdio 0x7f2030004e30 fp 23 | fdio -1 fp (nil)
  error: create archive failed: cpio: write

When the encoding bit gets cleared on the LZFILE* struct, lzwrite() then
rightfully complains when it detects !lzfile->encoding, which then gets
bubbled up as a write failure when we go to create the archive.

This fix is available in the rpm 4.17-release.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 ..._internal-mode-parsing-when-Tn-is-us.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch b/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch
new file mode 100644
index 0000000000..9a5ebb9115
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch
@@ -0,0 +1,34 @@
+From 405fc8998181353bd510864ca251dc233afec276 Mon Sep 17 00:00:00 2001
+From: Vitaly Chikunov <vt@altlinux.org>
+Date: Wed, 6 Jan 2021 23:43:41 +0300
+Subject: [PATCH] rpmio: Fix lzopen_internal mode parsing when 'Tn' is used
+
+When there is number after "T" (suggested number of threads or "0" for
+getncpus), lzopen_internal() mode parser would skip one byte, and when
+it's at the end of the string it would then parse undesired garbage from
+the memory, making intermittent compression failures.
+
+Fixes: 7740d1098 ("Add support for multithreaded xz compression")
+Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/405fc8998181353bd510864ca251dc233afec276]
+
+---
+ rpmio/rpmio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index ed1e25140..9d32ec6d9 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -798,6 +798,7 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
+ 		 * should've processed
+ 		 * */
+ 		while (isdigit(*++mode));
++		--mode;
+ 	    }
+ #ifdef HAVE_LZMA_MT
+ 	    else
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index c39a5208e5..376021d913 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x;protoc
            file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
+           file://0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch \
            file://CVE-2021-3421.patch \
            file://CVE-2021-20266.patch \
            "
-- 
2.25.1


