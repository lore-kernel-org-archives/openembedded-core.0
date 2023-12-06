Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AD3C46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.32049.1701870968366395881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Sx6muxRi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d05199f34dso34772655ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870967; x=1702475767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtz42OUAjFHcsJGp0kS3sklzIxo0exg1meDzWLcrarY=;
        b=Sx6muxRihs8oMKKlUvVv/6CSn3vBc02RRGMSUxaFBVwGbjocBO2pzdgzuaZCny9o2B
         3Jt/hypm1vTyA4nlsuk9HA76nzhi47gejSwFaxIlgKDV+YH4bN/zRZjfN+R9qdNM1M37
         li6mKUCSXvKGG0Luip3q6crB0GFlmkwxvyVeCPwCQjDqm4XG+WWOxfghJhQtXVTIp6yX
         KAorjMKu2/+0G2rwPQVwS7FdSYGQz1KYgI1mpoGSjoZMye7PMfMnzmMCrVDuuhkD1oFr
         I2zQG86qipGKjQEbn+d5yPl+xeHsKt6TjJhf6wlWwH+A3e8CLS+uWPrkobRq1MNJ1Dzy
         SQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870967; x=1702475767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtz42OUAjFHcsJGp0kS3sklzIxo0exg1meDzWLcrarY=;
        b=quHaGcgrTxaDqA0s6dr/MbyANmUAIaMqwfeliA6K5An1ESjg2vlSuP6uvBKK/N45YI
         bbKUkT0CQI7ZLbNnvc6fZmtV7iPM0Ob84QUnd5/FWWafma20/FLOYxjUhna3gmbEYFv6
         vYPqeF4sxkz45p7fLrG8+KUngQxdq80LJdTWfb2QYhSjp+NkHhnr7C3PRG8f3mRCqCHN
         Oq0qlMuzV+ZEbDWkJXY2yfiHp4T6BkamHpGxxiF6xR0zfnJjjUX9bBiAklZVblqF42x0
         4if9UNEQRjlF1jiXI5jNqJg/R/qY2tkgDw3qkAYJMpo2NbXNL70LNyEiJwacWHxP20BW
         dX7g==
X-Gm-Message-State: AOJu0Yw8t4wfUzBi1Gkar85UOHiAU9nZtw9c7prML/ixUJw/qDvQaued
	3bi+N4HgTugvbG6nPypPiSnd/0U0HIqg6i7kYQE=
X-Google-Smtp-Source: AGHT+IGkacOrystYy7I2DfAIjvBtjJGfS1Qz13jLITW9s03qUROW1tYHcVc1+uf30LwJlimeoy9JNA==
X-Received: by 2002:a17:903:1105:b0:1d0:6b95:9bfe with SMTP id n5-20020a170903110500b001d06b959bfemr713711plh.1.1701870966996;
        Wed, 06 Dec 2023 05:56:06 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] libsndfile: fix CVE-2022-33065 Signed integer overflow in src/mat4.c
Date: Wed,  6 Dec 2023 03:55:47 -1000
Message-Id: <f9cc32ed3c67c8fe60debbc23b579e120038b2e9.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191890

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsndfile1/CVE-2022-33065.patch          | 46 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
new file mode 100644
index 0000000000..e22b4e9389
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
@@ -0,0 +1,46 @@
+From 0754562e13d2e63a248a1c82f90b30bc0ffe307c Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 10 Oct 2023 16:10:34 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow in dataend calculation
+
+The clang sanitizer warns of a possible signed integer overflow when
+calculating the `dataend` value in `mat4_read_header()`.
+
+```
+src/mat4.c:323:41: runtime error: signed integer overflow: 205 * -100663296 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:41 in
+src/mat4.c:323:48: runtime error: signed integer overflow: 838860800 * 4 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:48 in
+```
+
+Cast the offending `rows` and `cols` ints to `sf_count_t` (the type of
+`dataend` before performing the calculation, to avoid the issue.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/789
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c]
+CVE: CVE-2022-33065
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/mat4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 3c73680..e2f98b7 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -320,7 +320,7 @@ mat4_read_header (SF_PRIVATE *psf)
+				psf->filelength - psf->dataoffset, psf->sf.channels * psf->sf.frames * psf->bytewidth) ;
+		}
+	else if ((psf->filelength - psf->dataoffset) > psf->sf.channels * psf->sf.frames * psf->bytewidth)
+-		psf->dataend = psf->dataoffset + rows * cols * psf->bytewidth ;
++		psf->dataend = psf->dataoffset + (sf_count_t) rows * (sf_count_t) cols * psf->bytewidth ;
+
+	psf->datalength = psf->filelength - psf->dataoffset - psf->dataend ;
+
+--
+2.40.1
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 2525af8fe0..32b678ce90 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -22,7 +22,8 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2019-3832.patch \
            file://CVE-2021-3246_1.patch \
            file://CVE-2021-3246_2.patch \
-          "
+           file://CVE-2022-33065.patch \
+           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
 SRC_URI[sha256sum] = "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
-- 
2.34.1


