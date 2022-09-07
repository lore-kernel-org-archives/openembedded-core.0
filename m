Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAD3C6FA86
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:20:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.8356.1662560445113510708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wTyqQI1p;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id fv3so8596380pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=OCzS/U8kRjB/NdaBN/k125K9o6q45GZohHlsid32Y30=;
        b=wTyqQI1p7ASdboIkKmNHIZivwxSQbUSSQnCjOBpDBpapb6itAy68lJWfIJwfm6dRFx
         s5br9xjDzo+T4wwuW7JXL+3RB6z78ZhHQ+kkbKctahEHVFAMv2ccC+LzUtgz+PMqtg7U
         a+aHOwBFbNdFSBZpu7XtNCBo2HrH8BwXpv8bUyQbrg61m5WMBJu4fs4Ae2JpvumT+MtI
         NCMM2yrKg4yrHADm0l/TvfCZx4GpXrSLvxWQfImI87kTlLb2/7eP3t6JONxBPl++WYu1
         Z3isgcNZwnc9tlvQn8pxOE9CHzD9BCzR2tCADSm/HT2HFP7SPQ1FK3m3mhBRwYP7GmFo
         pyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OCzS/U8kRjB/NdaBN/k125K9o6q45GZohHlsid32Y30=;
        b=b4ZhcuYD/2ev5zQqZD7KBEBBPOT5stbzCB8At+2Qp0TUe8f0U/AB7GSiL4WZkJuZLQ
         NwfakYtD4DMr8p4NJC59qj9jPatPPLy4Q1f1sKHEW0JIIX8flYaaLnGJD7vb589SqVO4
         Lt7ni93zyakLI2pSuwBbmwfQqL3WOXM+PhBzogNH6VSc+zFZerHA5tecSEN+Xhn9n5d1
         XW5NYzUUd7o8IZ+PYmJiIYOoFz1oVLK9FckLDDeNVWuT7bROEe8nvOUsRgAG9EPosEaC
         X3xg/9wR4tXGViMSBotwwKfxu8ltIMXOzd7EcOLWg2OojPKwP++1cY1zdR6oTSPZZTJ4
         BJBA==
X-Gm-Message-State: ACgBeo0bt5oqK5VF8PYKez5C0KtXRch7tps37CiDby3hV7jcG9IyZPGQ
	nIFjAxZFQOjeD/BmQDaOpSs4HJTJCmLvpLQU
X-Google-Smtp-Source: 
 AA6agR7M2s5RJtVXkqnJrrgPv7uu0Z0Aa+pA8Dalh87ubpBl3EI4YuLRfUlHj80YZjpYZMxrGhP8/w==
X-Received: by 2002:a17:903:244f:b0:176:85e3:4236 with SMTP id
 l15-20020a170903244f00b0017685e34236mr4293832pls.103.1662560443402;
        Wed, 07 Sep 2022 07:20:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/24] binutils : CVE-2022-38533
Date: Wed,  7 Sep 2022 04:20:04 -1000
Message-Id: 
 <9644d9a38dac8d2c0263f4e8a67624da7a8bc55b.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170398

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport
[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0015-CVE-2022-38533.patch        | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index eed252976a..8aa8295881 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -33,5 +33,6 @@ SRC_URI = "\
      file://0012-Check-for-clang-before-checking-gcc-version.patch \
      file://0013-Avoid-as-info-race-condition.patch \
      file://0014-CVE-2019-1010204.patch \
+     file://0015-CVE-2022-38533.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch
new file mode 100644
index 0000000000..5d9ac2cb1f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch
@@ -0,0 +1,36 @@
+From ef186fe54aa6d281a3ff8a9528417e5cc614c797 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 13 Aug 2022 15:32:47 +0930
+Subject: [PATCH] PR29482 - strip: heap-buffer-overflow
+
+	PR 29482
+	* coffcode.h (coff_set_section_contents): Sanity check _LIB.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ bfd/coffcode.h | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 67aaf158ca1..52027981c3f 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -4302,10 +4302,13 @@ coff_set_section_contents (bfd * abfd,
+ 
+ 	rec = (bfd_byte *) location;
+ 	recend = rec + count;
+-	while (rec < recend)
++	while (recend - rec >= 4)
+ 	  {
++	    size_t len = bfd_get_32 (abfd, rec);
++	    if (len == 0 || len > (size_t) (recend - rec) / 4)
++	      break;
++	    rec += len * 4;
+ 	    ++section->lma;
+-	    rec += bfd_get_32 (abfd, rec) * 4;
+ 	  }
+ 
+ 	BFD_ASSERT (rec == recend);
-- 
2.25.1


