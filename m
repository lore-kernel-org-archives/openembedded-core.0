Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A35EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 15:12:26 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.10822.1688051538687783918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 08:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=P/qVA+Iv;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-666e916b880so509693b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688051538; x=1690643538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITEITcmhozRjwSMB4wAWVCp+K0Q/X2khHwh9ARKKK8U=;
        b=P/qVA+IvlsV3vrVHUSqxBCAJZb5Txcbnr5bq/1arNSivzmlKsc2W3hmq9QJJC9MDQj
         Uku7yNzW1toIixr/ahuSAbORc+cum4AiSSDmrATs+ZNSXnFcPqojj/aZnmGK+0jYqPVg
         +dXaKXwSs/Bgl2wOhMBsyBgvdxeOmPwarjPFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688051538; x=1690643538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITEITcmhozRjwSMB4wAWVCp+K0Q/X2khHwh9ARKKK8U=;
        b=IvpAE3zb8P8dtYHKbXm0u3ZD2pV3DqNfsaiwZG0+o6nses+umpU7MnjaIJ+Brh7EiT
         QmsjsP+gMT40Clc+JQwTtsJmv/KMkNdCPJTLRfDsQi6NSW/hNNsoSW6I1jECZwNhLd0o
         NoCKMc6kvNpOdkosm9BbvG8FVP+nV3G2NN3Ip4Ss/kva5XjduU6N7d5BTmTKC8OO/DK/
         qu9aKwTieGYx5U4yK6I+yRt1g5chvav9mXTEoWopsGsTwh6KkQ5/eboFHU+Q0Xz7NHYs
         L8rx28jv5OX9fi4rjxkoN3mc/Mi/1RhxbwcWQww0bBNDcGSvjm/zzTTIJq+G6Rw6JHWY
         pagw==
X-Gm-Message-State: AC+VfDy2RD+MPaqskvzj3350fIRT4p1MKkAveqFVxQILVZduVGnJ3AS0
	JMhwrQWzxycJme1GdJyDWI4wpwOgoi1vSeHFpeg=
X-Google-Smtp-Source: ACHHUZ4SSRZaRHT8x9ynkHlSEYL5R3f5jEEH5XKSqLmANZElNNqo1sNZ0tqXDYD9fG4kfuy8kBR2jg==
X-Received: by 2002:a05:6a20:7fa0:b0:10f:f672:6e6b with SMTP id d32-20020a056a207fa000b0010ff6726e6bmr73577pzj.5.1688051537589;
        Thu, 29 Jun 2023 08:12:17 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.29.143])
        by smtp.googlemail.com with ESMTPSA id 16-20020a630f50000000b00553c09cc795sm8719399pgp.50.2023.06.29.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:12:17 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH v3] libcap: fix CVE-2023-2603 Integer Overflow in _libcap_strdup()
Date: Thu, 29 Jun 2023 20:40:46 +0530
Message-Id: <20230629151046.1229575-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 15:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183636

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../libcap/files/CVE-2023-2603.patch          | 60 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
new file mode 100644
index 0000000000..e09be78640
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
@@ -0,0 +1,60 @@
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
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=422bec25ae4a1ab03fd4d6f728695ed279173b18]
+CVE: CVE-2023-2603
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+
+---
+ libcap/cap_alloc.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/libcap/cap_alloc.c b/libcap/cap_alloc.c
+index c826e7a..25f9981 100644
+--- a/libcap/cap_alloc.c
++++ b/libcap/cap_alloc.c
+@@ -105,15 +105,17 @@ char *_libcap_strdup(const char *old)
+ 	errno = EINVAL;
+ 	return NULL;
+     }
+-    len = strlen(old) + 1 + 2*sizeof(__u32);
+-    if (len < sizeof(struct _cap_alloc_s)) {
+-	len = sizeof(struct _cap_alloc_s);
+-    }
+-    if ((len & 0xffffffff) != len) {
++
++    len = strlen(old);
++    if ((len & 0x3fffffff) != len) {
+ 	_cap_debug("len is too long for libcap to manage");
+ 	errno = EINVAL;
+ 	return NULL;
+     }
++    len += 1 + 2*sizeof(__u32);
++    if (len < sizeof(struct _cap_alloc_s)) {
++	len = sizeof(struct _cap_alloc_s);
++    }
+ 
+     raw_data = calloc(1, len);
+     if (raw_data == NULL) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.66.bb
index d3189fb105..7534063b7d 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -17,6 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://CVE-2023-2602.patch \
+           file://CVE-2023-2603.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
-- 
2.25.1


