Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4234EB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:40:23 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.8067.1687786815337450619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=SwV8i6Co;
 spf=pass (domain: mvista.com, ip: 209.85.160.54, mailfrom: vkumbhar@mvista.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1b049163c93so542295fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687786814; x=1690378814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAV+TIW0lIXRLzFOBg7Ck/IZPmJUUrmNXmCNQQ3fXzo=;
        b=SwV8i6CozzFiYHasO1B2Ilku/JOnd0HEYtwYvqoKqS1x78Yrfwf69PRrDA49+UdyGL
         0MKsn8xfZaqv7kecZL7LzG8gez8isXxKzrEK7RnFFCcopUkejUcjYO24MhamCQnNY5O2
         JYi4gf/yh1mPwlRgZjkEcCUYOw0cqYcSVcLu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786814; x=1690378814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAV+TIW0lIXRLzFOBg7Ck/IZPmJUUrmNXmCNQQ3fXzo=;
        b=dMZ/E2Rfo9S5gjWcw5xxyvQGvMEyZHq277MbE30L04FMpQrAi4tolNQrlAEoSfn9Km
         uEUix3LEYw+ZZUSy0IOTSMFFfwxmu/etLQNkZo2z5DblA3Gs4tvFzqR1hBcbKN5yBufH
         mNjC7cgC19mK7huzSurALey6CtMI+xURr6V3+zmOx2gThVoEO6RtCwFBlQ4YWnHHLpfU
         v/uwIP9V8Dg/M3/86Wyd62IGJhEUBnu3AuVFDBg/KD1Y0sYw3akz/VBGvLnQCc+BbFzi
         ECxkjewpMIuXAwDvH1hAwFIz5OYXfp6L4/+zToVvSZgbKxQB9H/TOR74D0bXOsiVZj1U
         QbLw==
X-Gm-Message-State: AC+VfDxKbGMQap3AIoMmpab27pjR6hehhHO0QGrOcVAo2dyBsfSHcs3E
	idzeg0wCi6ZyH70hUV7+ilJjKhwEjiTCzeOhfoo=
X-Google-Smtp-Source: ACHHUZ5iDleHYjKrnD5+eDYotM/LAlQ0Hms8jymzNLlhEtjx0YxChpU59KswIjWKBdOvpt4oIffhUQ==
X-Received: by 2002:a05:6870:5241:b0:1a9:99f5:7d46 with SMTP id o1-20020a056870524100b001a999f57d46mr16074548oai.11.1687786814070;
        Mon, 26 Jun 2023 06:40:14 -0700 (PDT)
Received: from localhost.localdomain ([116.75.153.33])
        by smtp.googlemail.com with ESMTPSA id h3-20020a635303000000b0051b9e82d6d6sm4104771pgb.40.2023.06.26.06.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:40:13 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2] libcap: fix CVE-2023-2603 Integer Overflow in _libcap_strdup()
Date: Mon, 26 Jun 2023 19:10:00 +0530
Message-Id: <20230626134000.426080-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183418

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
index c50e9d8cc7..844ae58506 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
+           file://CVE-2023-2603.patch \
            "
 SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
 
-- 
2.25.1


