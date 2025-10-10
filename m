Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E807CCD183
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:50:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.2336.1760064646340976669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BR7+rWCT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so1454796b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064645; x=1760669445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJTr5y8L9L0Gcjo6OKhcYkdb5TojQGZ69WksnVGQmE0=;
        b=BR7+rWCTqY9rxkWcwYoLYZ0no/Dwas6ENceDfBtP/yb64AQfV1mhdddYJkttXNM750
         Pmx3xJ65CFIP/m43G6+QImdPEAVMgFgmB/ZAErVDGLj1sEYZwDKmZ+r6jPZyDA5ZsTuF
         uGUd8k1jyYXVux0nWZed4KmdAFHN47oW1x2DBNjvKC5yfd6sIAi8BPuZKgkWuOAGPYb5
         YHS9r1FVmlGLygyA8aJWIzpQIb0bsLzED1fGbCdQ7FXklu8RT6HgKtMnW1p8munb+JK8
         8PSgaF+LiZmj/XoCGXVG5/e8njVqBNrGJSzFoj0PYL3xFMVgV+4JB49Vf7h8hevRR39O
         dy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064646; x=1760669446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJTr5y8L9L0Gcjo6OKhcYkdb5TojQGZ69WksnVGQmE0=;
        b=cTdSTqtCQgcQM2eWAGi6Y+iXgZiItBMiYG43c3USBQGsCKFkmT2o3AH3234L5JCcmF
         lAT637RzKNF2joUED9BIusZzrE8HE4NMmyguA1Gq30G0XzsLR66fbwDJQBCEzM7nczyx
         qAjZiOLpvYJZBL81j/bpn9R3DlnC32glcz8/4yUFBflxfuTp/vBqgqANnT08ieuOEL3Y
         D7HaPMMm2DBbOjw02A8/whaxs1F8Rg2TtmZlMfEwwSSebNASAosEwhYL6WGonbgO4fVh
         CCiCXd2JUblEIidJNJq8r/b3GFO1g+tSfKVhXXDq2Dpn+2LzqHp3bHmCXoET/C9ZoBau
         0mlw==
X-Gm-Message-State: AOJu0YxgptRbdkST9hs7IQLQIX6xHH6LWBD7ebnDI4h9hm+OfbNyZKsj
	LTv5VhVrapNQPNDpsdBZVBQC0Ly+V4Ywr0iavFofKuhWY3IpElsnrCuNstWU0+4FmGJIuTiTVGB
	oK1BH
X-Gm-Gg: ASbGncsqhswfzKw/+kPvzvRxBC5cLAK4dn7f7CQcq810tnVSnjwRI82V0vUZBr849nr
	92pLcs7CGVPJ3isg1eI6y82buiQM60iCNSl/cG09OgjdXSpcNpbMtAdIDEyvDredJiV1aM5fOIK
	yXNZEwlr9gXmRwa+WRz5LHnfFMvYLTNxoxkWJ6IMRPmOooZg3sWZjcFXSHNxOuCMnVhGMEO6Z+5
	YY8FZyuJejZq5gea5B1fv6nkDmcQxzR6hor5Rap/EbaYLrIvev0401q3aonD4e3faYMAatYki9n
	7Vs8vxGK9rLSzipeEaCCLcXOuoJ54cx9/hNB1nRN4LrOlWX5mC4IOUsW7FLZRcIeHz6pZaTms2P
	VTBbss03D/JEgEKVUrCYBNGzkzElTMaKD
X-Google-Smtp-Source: AGHT+IFhMw8z6sUeTAbqMth790vP9ei0uFy6iWDs7rYn7js+5pgg4vS9fOriuWg2FnlqLtOkRPK/nQ==
X-Received: by 2002:a05:6a00:3e08:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-7938763716amr9767040b3a.20.1760064645550;
        Thu, 09 Oct 2025 19:50:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/18] busybox: patch CVE-2025-46394
Date: Thu,  9 Oct 2025 19:50:20 -0700
Message-ID: <e348e10f35cc082ebfe22c890c5f64c4a06dcea3.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224645

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning this CVE.
Additionally fix test broken by the CVE fix.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2025-46394-01.patch   | 57 +++++++++++++++++++
 .../busybox/busybox/CVE-2025-46394-02.patch   | 32 +++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
new file mode 100644
index 0000000000..c95cba3c33
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
@@ -0,0 +1,57 @@
+From f5e1bf966b19ea1821f00a8c9ecd7774598689b4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 24 Sep 2025 03:28:47 +0200
+Subject: [PATCH] archival/libarchive: sanitize filenames on output (prevent
+ control sequence attacks
+
+This fixes CVE-2025-46394 (terminal escape sequence injection)
+
+Original credit: Ian.Norton at entrust.com
+
+function                                             old     new   delta
+header_list                                            9      15      +6
+header_verbose_list                                  239     244      +5
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ archival/libarchive/header_list.c         | 2 +-
+ archival/libarchive/header_verbose_list.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/archival/libarchive/header_list.c b/archival/libarchive/header_list.c
+index 0621aa406..9490b3635 100644
+--- a/archival/libarchive/header_list.c
++++ b/archival/libarchive/header_list.c
+@@ -8,5 +8,5 @@
+ void FAST_FUNC header_list(const file_header_t *file_header)
+ {
+ //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
+-	puts(file_header->name);
++	puts(printable_string(file_header->name));
+ }
+diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarchive/header_verbose_list.c
+index a575a08a0..e7a09430d 100644
+--- a/archival/libarchive/header_verbose_list.c
++++ b/archival/libarchive/header_verbose_list.c
+@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header_t *file_header)
+ 		ptm->tm_hour,
+ 		ptm->tm_min,
+ 		ptm->tm_sec,
+-		file_header->name);
++		printable_string(file_header->name));
+ 
+ #endif /* FEATURE_TAR_UNAME_GNAME */
+ 
+ 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
+ 	if (file_header->link_target) {
+-		printf(" -> %s", file_header->link_target);
++		printf(" -> %s", printable_string(file_header->link_target));
+ 	}
+ 	bb_putchar('\n');
+ }
diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
new file mode 100644
index 0000000000..ec17b9285a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
@@ -0,0 +1,32 @@
+From 7378db981d87b4a2264e14d60340a7fb5c67ae59 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 3 Oct 2025 16:12:56 +0200
+Subject: [PATCH] testsuite/tar.tests: fix test after CVE-2025-46394
+
+tar now sanitizes output and this test needs to expect that.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-October/091743.html]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ testsuite/tar.tests | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testsuite/tar.tests b/testsuite/tar.tests
+index 0f2e89112..48fc38114 100755
+--- a/testsuite/tar.tests
++++ b/testsuite/tar.tests
+@@ -325,9 +325,9 @@ unset LANG
+ rm -rf etc usr
+ ' "\
+ etc/ssl/certs/3b2716e5.0
+-etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
++etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.pem
+ etc/ssl/certs/f80cc7f6.0
+-usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
++usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.crt
+ 0
+ etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
+ etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 069544cc8a..d3f259d45b 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -59,6 +59,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            file://CVE-2022-48174.patch \
            file://CVE-2023-39810.patch \
+           file://CVE-2025-46394-01.patch \
+           file://CVE-2025-46394-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.43.0


