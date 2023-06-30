Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E021AC001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:33:44 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3929.1688092420723246166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=H7VZ0MGt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-66c729f5618so1276443b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092420; x=1690684420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpzV0LBgQbdtgclu6VTDOQGbjpBMtbJXdc5wcGZbssQ=;
        b=H7VZ0MGtmRbfWLz1MWR+CEC11A2E6C6EqUVUGgVwz0g26Bfk2ZytP81HwN360vFAwo
         zi5RyRa0a+3/u9CVrc1SUlzIki0/XZTJL8dO44WMZSrIJPlbGJnirGdYz9DYeBTnxbjL
         eKL/psf7DVftNm66CxezKI9TlvGWzSGpaq09vQEi5kbYz8IYnir5fIuMpD9TloFayrs9
         l758Ivux7ICK+uqu0vpjhsKtGZPBrG5Yn7M/Sol9E4f0uCtLrgjlQqwMRCKHrFBOG3CO
         piHjcQVjKaGZWzsfSXFktrpPqL8ILzI/imHi7sODxYMCXpoo/3sSQUpRqR/SIubTRuLJ
         LeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092420; x=1690684420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpzV0LBgQbdtgclu6VTDOQGbjpBMtbJXdc5wcGZbssQ=;
        b=jPWfm/uKBcqwrMXMmqzvQjfYBa4woZJ5LfMYZbxKHQTN0ztp4lGBr+j3JNC7RjWkk8
         pjJ7qt28JtrXXsk/31u/KISAuwb/FNPdXbuilFxPZ0Eb/1J+etHHQY9mClqfls/UgZaV
         LYo7OogdwEYcPbmuoKisGFQRtkUN1XtfCGqkvCgAsgL88sCv2u892Gc/gtZUZ8X7VU2G
         p4xXndrliRKR2Mww6l20q3HefQavJJz+dozkE8NWOxE+55ox3Gv/8DP+ey5otQ7YG4xd
         V3lz4n5I+eynBVj4/ogRcOwlZFN5TVpCRHb4P66IBgQ+pqd76ZxlnyKgWi+ImVzDvGRI
         R+IA==
X-Gm-Message-State: ABy/qLbmFo7qpZ+dAuV1ggGuc4QOFfTMd+z8TKl83LN4K7oHkebtIoNz
	MG8B2FSg2e42L9BtdiExSs7SAeYlgHOjovjp0Wbwlg==
X-Google-Smtp-Source: APBJJlH/FTgPSlYqp7A5TiXFVh0GB3dbPAKbkfzCa2arsZKGaKyY5izCYgspO3OKEvAQjQWxVQ3Ueg==
X-Received: by 2002:a05:6a00:17aa:b0:676:ad06:29d7 with SMTP id s42-20020a056a0017aa00b00676ad0629d7mr2295035pfg.15.1688092419752;
        Thu, 29 Jun 2023 19:33:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006815fbe3245sm3028607pff.37.2023.06.29.19.33.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:33:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/10] libcap: backport Debian patches to fix CVE-2023-2602 and CVE-2023-2603
Date: Thu, 29 Jun 2023 16:33:18 -1000
Message-Id: <d0718a43a00223aa074f14e769214ba11d4f8ef2.1688092252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092252.git.steve@sakoman.com>
References: <cover.1688092252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183676

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-2602
 CVE-2023-2603

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libcap2/tree/debian/patches?h=ubuntu/focal-security
Upstream commit
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=bc6b36682f188020ee4770fae1d41bde5b2c97bb
&
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=422bec25ae4a1ab03fd4d6f728695ed279173b18]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libcap/files/CVE-2023-2602.patch          | 52 +++++++++++++++++
 .../libcap/files/CVE-2023-2603.patch          | 58 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.32.bb    |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2602.patch
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2023-2602.patch b/meta/recipes-support/libcap/files/CVE-2023-2602.patch
new file mode 100644
index 0000000000..ca04d7297a
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2023-2602.patch
@@ -0,0 +1,52 @@
+Backport of:
+
+From bc6b36682f188020ee4770fae1d41bde5b2c97bb Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Wed, 3 May 2023 19:18:36 -0700
+Subject: Correct the check of pthread_create()'s return value.
+
+This function returns a positive number (errno) on error, so the code
+wasn't previously freeing some memory in this situation.
+
+Discussion:
+
+  https://stackoverflow.com/a/3581020/14760867
+
+Credit for finding this bug in libpsx goes to David Gstir of
+X41 D-Sec GmbH (https://x41-dsec.de/) who performed a security
+audit of the libcap source code in April of 2023. The audit
+was sponsored by the Open Source Technology Improvement Fund
+(https://ostif.org/).
+
+Audit ref: LCAP-CR-23-01 (CVE-2023-2602)
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libcap2/tree/debian/patches/CVE-2023-2602.patch?h=ubuntu/focal-security
+Upstream commit https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=bc6b36682f188020ee4770fae1d41bde5b2c97bb]
+CVE: CVE-2023-2602
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ psx/psx.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/libcap/psx.c
++++ b/libcap/psx.c
+@@ -272,7 +272,7 @@ int psx_pthread_create(pthread_t *thread
+ 
+     psx_wait_for_idle();
+     int ret = pthread_create(thread, attr, start_routine, arg);
+-    if (ret != -1) {
++    if (ret == 0) {
+ 	psx_do_registration(*thread);
+     }
+     psx_resume_idle();
+@@ -287,7 +287,7 @@ int __wrap_pthread_create(pthread_t *thr
+ 			  void *(*start_routine) (void *), void *arg) {
+     psx_wait_for_idle();
+     int ret = __real_pthread_create(thread, attr, start_routine, arg);
+-    if (ret != -1) {
++    if (ret == 0) {
+ 	psx_do_registration(*thread);
+     }
+     psx_resume_idle();
diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
new file mode 100644
index 0000000000..cf86ac2a46
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
@@ -0,0 +1,58 @@
+Backport of:
+
+From 422bec25ae4a1ab03fd4d6f728695ed279173b18 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Wed, 3 May 2023 19:44:22 -0700
+Subject: Large strings can confuse libcap's internal strdup code.
+
+Avoid something subtle with really long strings: 1073741823 should
+be enough for anybody. This is an improved fix over something attempted
+in libcap-2.55 to address some static analysis findings.
+
+Reviewing the library, cap_proc_root() and cap_launcher_set_chroot()
+are the only two calls where the library is potentially exposed to a
+user controlled string input.
+
+Credit for finding this bug in libcap goes to Richard Weinberger of
+X41 D-Sec GmbH (https://x41-dsec.de/) who performed a security audit
+of the libcap source code in April of 2023. The audit was sponsored
+by the Open Source Technology Improvement Fund (https://ostif.org/).
+
+Audit ref: LCAP-CR-23-02 (CVE-2023-2603)
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libcap2/tree/debian/patches/CVE-2023-2603.patch?h=ubuntu/focal-security
+Upstream commit https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=422bec25ae4a1ab03fd4d6f728695ed279173b18]
+CVE: CVE-2023-2603
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libcap/cap_alloc.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+--- a/libcap/cap_alloc.c
++++ b/libcap/cap_alloc.c
+@@ -76,13 +76,22 @@ cap_t cap_init(void)
+ char *_libcap_strdup(const char *old)
+ {
+     __u32 *raw_data;
++    size_t len;
+ 
+     if (old == NULL) {
+ 	errno = EINVAL;
+ 	return NULL;
+     }
+ 
+-    raw_data = malloc( sizeof(__u32) + strlen(old) + 1 );
++    len = strlen(old);
++    if ((len & 0x3fffffff) != len) {
++	_cap_debug("len is too long for libcap to manage");
++	errno = EINVAL;
++	return NULL;
++    }
++    len += sizeof(__u32) + 1;
++
++    raw_data = malloc(len);
+     if (raw_data == NULL) {
+ 	errno = ENOMEM;
+ 	return NULL;
diff --git a/meta/recipes-support/libcap/libcap_2.32.bb b/meta/recipes-support/libcap/libcap_2.32.bb
index d67babb5e9..64d5190aa7 100644
--- a/meta/recipes-support/libcap/libcap_2.32.bb
+++ b/meta/recipes-support/libcap/libcap_2.32.bb
@@ -13,6 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
+           file://CVE-2023-2602.patch \
+           file://CVE-2023-2603.patch \
            "
 SRC_URI[md5sum] = "7416119c9fdcfd0e8dd190a432c668e9"
 SRC_URI[sha256sum] = "1005e3d227f2340ad1e3360ef8b69d15e3c72a29c09f4894d7aac038bd26e2be"
-- 
2.34.1


