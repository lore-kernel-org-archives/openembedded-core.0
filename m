Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81540C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.11001.1645452897814895890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=I1rcvY2o;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so4163857pja.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9hUnXfGi3BsMUMzeJgxcDhe6XzzBhu9I71kxcKhPmpc=;
        b=I1rcvY2on0ATiW2bFKC0VlT3/eDUz1KMtVhrdNTVtjQeqGlorb2yx0yUIZnK5p+7Ll
         dLXEJZborb6aDrJxBcVgGyCUeorib/kVVfdpmwBpqG0QaJNpxxvJVB1erqrs3y0k5OzE
         7wTiLNPeWoj/BgYW7uIRXvihqmDyXDAAn00sULgo5Go23O5zCnWpLtzJP4nBpRW/7Nkn
         ILu3DmZRABMFz4eKIlI0OEb9Kp7MSpY1ltyGf1GeX9kpL8roCdSJRasPtPK4g/hvKDbn
         cEAFzvjsk7/tYxviheZSipwmxMopDisCDbT03wYpXe61V24o3GucrrWLHXpJLlJT6P+a
         VlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9hUnXfGi3BsMUMzeJgxcDhe6XzzBhu9I71kxcKhPmpc=;
        b=ZjLSgwpXlAMi4ZPg7qDJyYJASljy+/T64ovGHfDlAVJxB9tLh5ByR3bijgCAHU6U3f
         RinJYfiG+zWV41IIMHtWrkZb+JyzGFKvc3RqQBWq+LAVoqzHc9U+OFLGUx80F+OzbNP6
         6ktRQSkfHJvynpA2p1q4rhw+qFzahmLyQMdB3tUDgso3HQOxWNjPF9AZutqw0/RDfLUP
         3Gy3GvFAc/fIOO9lAfpWEft4JOwz5oc2mXyG7fWrNcQ4BzGnbd6tIuheYrRnsbQgGh2A
         8nnyht1dGIhV/Xp4lCHpOBbNKcGZ59/t++jXSpf9KfmloYoLsNQ3BmIMisreFU8WlYes
         pUpw==
X-Gm-Message-State: AOAM532/TRwkr5MsG8Gh1VhD3cjcC7xZAN7Xblaqrv4aV+leVtU5us8l
	p9eI561UAF6wMvcnIVAYqQ5CD2yjSGIbU3n6
X-Google-Smtp-Source: 
 ABdhPJxOHwWSPQzbtozO7JCg56qnyGseRC9fYVy3w8p2w9jPiZn2RrAl6lNEO5gIQxzP4ZmILkQfzw==
X-Received: by 2002:a17:902:fe18:b0:14f:109b:3f4e with SMTP id
 g24-20020a170902fe1800b0014f109b3f4emr18993338plj.114.1645452896683;
        Mon, 21 Feb 2022 06:14:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/20] rpm: fix intermittent compression failure in
 do_package_write_rpm
Date: Mon, 21 Feb 2022 04:14:10 -1000
Message-Id: 
 <b093005d31467d89b00af621f86eb5cac7f845af.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162040

From: "bkylerussell@gmail.com" <bkylerussell@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


