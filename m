Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D14CEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 07:30:36 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.10794.1687937425939417916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 00:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=OUrJTsM2;
 spf=pass (domain: mvista.com, ip: 209.85.210.53, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b74e2d8c98so2549850a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687937424; x=1690529424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrHSmyLGvMSc/7TG37PqXzbEYu+Wf+Jddjx48rHyERY=;
        b=OUrJTsM27bmZyvTEiKmpVrCF/bQXsEVjLcWUXxUx7F86ZyAlBjFxCUA5pxaMEj7BBp
         cBhlYdejshMhrK4Pv57pB4R2O1aWyAKB3vP8i1QE5PcrWwfrIux1WnpJbjfzpu7CKs2j
         GxrUk1LDICFUrg8/YG1gr9Q37eFXE9RE6InSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687937424; x=1690529424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrHSmyLGvMSc/7TG37PqXzbEYu+Wf+Jddjx48rHyERY=;
        b=gcrf6QhC+E/76KgdMZL5mLo1cDmoKokdJk9zbdLS4LYL60dbrwqBA/r8NIscwbn7AZ
         gLI05IbUs96kt+bhtxrfAtb398JheWFLSJ6de2VPGXC4hUQDEeA0wVj+wQRdJCYTiBh6
         pLCcHyiPI+aOD5Y362VN8E3e4SoIXSM0OgcLBroSO3Ojjb5D+thv+lZSvVwXx4h28fGf
         XSb/TkVEkFAcUyFzRRzV31ut5AzgWJnszwzYi37b+EW5ahO0tcv1aLHZcCEPW0KPw+G+
         Ntve/5YNaEmsSc3nTNF7rPaNbe8QNC9sN6wjZT7btBeAX83z6eNnxPhlYUAQqR8ZxaTc
         NtpQ==
X-Gm-Message-State: AC+VfDxy1zGJQh99l9pNLcIDLV0+mnqYiznD1Wa9RyRs5E3camdNeG+Q
	8cmzM5GOiHoZUtoSQ7It6Jn4pRjSRtkPyZb31y0=
X-Google-Smtp-Source: ACHHUZ42aX9jikdOYM9y7d0RbaeTcT3fKXGqlzDH1u+e7UrKlE3qXJv/ZqckmABxPDmBQLRxGLoyBQ==
X-Received: by 2002:a05:6358:c68f:b0:134:5667:a16c with SMTP id fe15-20020a056358c68f00b001345667a16cmr5778482rwb.32.1687937424555;
        Wed, 28 Jun 2023 00:30:24 -0700 (PDT)
Received: from MVIN00020.mvista.com ([122.173.144.12])
        by smtp.gmail.com with ESMTPSA id 199-20020a6301d0000000b005533a901a5dsm6787161pgb.19.2023.06.28.00.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 00:30:24 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libcap: backport Debian patches to fix CVE-2023-2602 and CVE-2023-2603
Date: Wed, 28 Jun 2023 12:58:12 +0530
Message-Id: <20230628072812.30547-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183545

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
2.25.1


