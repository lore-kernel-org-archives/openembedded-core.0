Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6B5C001DF
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:06:50 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.26454.1688656005648298433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=aDe3RXK2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b7e66ff65fso5151925ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656005; x=1691248005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5G2s/3AoxN3ih+x/Ovc/aQj/KqnnlTVItvLMopknPU=;
        b=aDe3RXK2qPgk8utSxKvQJ7ShALg3TzdlgMmSObOGRw14ApoxKSHV/It/9RgxiWvSkX
         76gDxlu5MLYxSaVzGFgnpN/4q1sGvgnWDueRcFz3b28h7kYm/JXiLLDqNo/p9wGk/jBZ
         DBbahRKfWfCxWmPxa8AIfBJqZV8ZqivrHrX12D7C9Hv/ELDsCs3I4E/JyvDdhbXZTe4h
         DZetXRUaK/nhZGGHdIVRFUJaOKAn35c9MCglA6rNblcK3nTziyRUWN1vSW3ASTHSEXTS
         qjOefzmStzK5uykTWvcMl55BbeQjuT8LilJ6cQ30VKyJ9OhBQfxK/gz40slEB1kn1Yqe
         Ux8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656005; x=1691248005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5G2s/3AoxN3ih+x/Ovc/aQj/KqnnlTVItvLMopknPU=;
        b=DWPKO62BYdoM7s5wuYkV5FTj3uBxMyccxmdwsVlIxanrXpcgVVgF2PWdXn/9L2r5jt
         OoarPlpfIgUa/vDYsq7vpQyxDqb7hqu6taYJfRwqM1uxiD+A7l3pWNR9S0iRXTTuOhp6
         a2uIWvTfs+z2J0CiH9H6AUNDrQp8JoTT3kk7cS4CUKS/UrUrdwielw6BZsIdEb8MzcpC
         wKJb/SgoeqaupPh7DGCYpHi7W5TDe74+1bDkHY2TPQ0JXLbrAtN+lMaiT4YQfG5KmXbE
         4rjwAbI6igPtbYpLqrjnsvwMhxofWpTq4i09OSGDn0ORWQ3DAJx3EAEcSFWBA7+3OuOT
         CPsg==
X-Gm-Message-State: ABy/qLbKhV/evU9xmy/8w1K7V8CSIc6r6L+LYWica8zyigHleRD/zV+u
	gmhrh595jY1R7qfuNmeASG9aNkys+xInM52ZG6o=
X-Google-Smtp-Source: APBJJlF4Ks7Yp0GSqh/+hJ7oqOx/Qd72hdH4lykHIViCpXQe8NS3iPxPN/CKcZXmEnwWBtIRmVFCDQ==
X-Received: by 2002:a17:902:c3c4:b0:1b8:9b5e:65c8 with SMTP id j4-20020a170902c3c400b001b89b5e65c8mr2063046plj.4.1688656004316;
        Thu, 06 Jul 2023 08:06:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/28] libcap: fix CVE-2023-2603 Integer Overflow in _libcap_strdup()
Date: Thu,  6 Jul 2023 05:06:05 -1000
Message-Id: <92340bc3161259c962b5ed5f9d9055f5bd36a3ce.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183955

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


