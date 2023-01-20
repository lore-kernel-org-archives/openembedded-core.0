Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C48C38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:10 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.82084.1674238329115182417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QjHmrgl5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id b12so4740677pgj.6
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pPxzGfzFCmHfkSMPFqAX2NLJAPD7DaR/PENfBt0xG4=;
        b=QjHmrgl5RXV/ATz/G6ZV6AbukFJ4PDMcNGIB+weGjnZ5VH/Y5VZ51tZBIYa+ujgETx
         YAVAtqsIvH7pu/mVEdP/+oXvOdpoCg2alD7PKDgyl3sPAXfmgEt9/Ue5ZPhvT6Ddn9Fr
         wqqkZ9vVtYQ6cCY8O5gfIXSeKQSa6jwfiVsOoSadDfTfQpYGvKtg+QI5F3VcApffOiuD
         fYf7Ai0nqLFIqRtY7CNdhuGg0IH/nKRnXo+cMYhmoEC/nwpqsGXkIkiwsOBWG5nKwBjy
         +t1ec1gEt7wLoCjSgQm/f+q02ykiyYnvVm+hcwolAjFn9gUFOGg/mJoGe2DndJ/qeJYe
         4QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pPxzGfzFCmHfkSMPFqAX2NLJAPD7DaR/PENfBt0xG4=;
        b=fsjbHm8cQAu1HMh0TqHbpn5m/695EPjyxTyeB7ic9mO2N4tpxZbyLmiLg/Q8pzEinU
         0jPDfH5TMgBKxh972V7nwG+2Z4UDS6/TjPmssChuA0iUdXOhpIkW2Gw81h1oSMoZZ7ph
         4nB8994gLOnkxP2SLp6/dr3KWOn0GcLMA7gGeG2DgDCJGcuOSllYplFlZ3qTQRdLmCOp
         MvY0rHmN1rCHF2Y4b2B9+rylak0DqQQEnF5dhWuhwsB2d/NmI0mgk96FHu6M3KRjS+CT
         2SBpBELC4+1iKcJ8DBhjD4m2p+yxTe+yNQA/XRekGL7k9Btw06YraiCJR/Lm58N+VgIv
         DuKA==
X-Gm-Message-State: AFqh2kphT0ykHnDJ56YLUoM1eOrA32ItexGfL4cLdHRdxqwyR/Ng6fDM
	bDu5oxDXLFySaTgkbaAVWuYpk4Cb/91nFR7KydI=
X-Google-Smtp-Source: AMrXdXsX7fVJQRNKAlyFE8pAEEmCCcABOxai6a8wmIoTSaOTlXQwCxF6XVGtrEKsAnX0w5h5IvfDWw==
X-Received: by 2002:aa7:8c51:0:b0:58d:8d88:447b with SMTP id e17-20020aa78c51000000b0058d8d88447bmr14110566pfd.2.1674238328097;
        Fri, 20 Jan 2023 10:12:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 35/41] dhcpcd: backport two patches to fix runtime error
Date: Fri, 20 Jan 2023 08:10:52 -1000
Message-Id: <82b7967721db08f925193a1c36232cafd0dab506.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176242

From: Chen Qi <Qi.Chen@windriver.com>

In case of nodistro, dhcpcd gives us 'Bad system call'
error and exits. This is because there are syscalls that
should be allowed but not in privsep. Backport two patches
to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1e6a0c16d6685096ec9313301aa431e73d02c07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  2 ++
 ...low-getrandom-sysctl-for-newer-glibc.patch | 30 ++++++++++++++++++
 ...sep-Allow-newfstatat-syscall-as-well.patch | 31 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 1d03de09c8..5cf77fa0f6 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -14,6 +14,8 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
+           file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
+           file://0002-privsep-Allow-newfstatat-syscall-as-well.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
new file mode 100644
index 0000000000..68ab93416a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
@@ -0,0 +1,30 @@
+From c6cdf0aee71ab4126d36b045f02428ee3c6ec50b Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Fri, 26 Aug 2022 09:08:36 +0100
+Subject: [PATCH 1/2] privsep: Allow getrandom sysctl for newer glibc
+
+Fixes #120
+
+Upstream-Status: Backport [c6cdf0aee71ab4126d36b045f02428ee3c6ec50b]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/privsep-linux.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index b238644b..479a1d82 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -300,6 +300,9 @@ static struct sock_filter ps_seccomp_filter[] = {
+ #ifdef __NR_getpid
+ 	SECCOMP_ALLOW(__NR_getpid),
+ #endif
++#ifdef __NR_getrandom
++	SECCOMP_ALLOW(__NR_getrandom),
++#endif
+ #ifdef __NR_getsockopt
+ 	/* For route socket overflow */
+ 	SECCOMP_ALLOW_ARG(__NR_getsockopt, 1, SOL_SOCKET),
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch b/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
new file mode 100644
index 0000000000..c5d2cba305
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
@@ -0,0 +1,31 @@
+From 7625a555797f587a89dc2447fd9d621024d5165c Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Fri, 26 Aug 2022 09:24:50 +0100
+Subject: [PATCH 2/2] privsep: Allow newfstatat syscall as well
+
+Allows newer glibc variants to work apparently.
+As reported in #84 and #89.
+
+Upstream-Status: Backport [7625a555797f587a89dc2447fd9d621024d5165c]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/privsep-linux.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 479a1d82..6327b1bc 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -328,6 +328,9 @@ static struct sock_filter ps_seccomp_filter[] = {
+ #ifdef __NR_nanosleep
+ 	SECCOMP_ALLOW(__NR_nanosleep),	/* XXX should use ppoll instead */
+ #endif
++#ifdef __NR_newfstatat
++	SECCOMP_ALLOW(__NR_newfstatat),
++#endif
+ #ifdef __NR_ppoll
+ 	SECCOMP_ALLOW(__NR_ppoll),
+ #endif
+-- 
+2.17.1
+
-- 
2.25.1


