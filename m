Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9232DC54EAA
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:46 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.34105.1674440557457805507
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZsNHiNNS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id z3so7770570pfb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pPxzGfzFCmHfkSMPFqAX2NLJAPD7DaR/PENfBt0xG4=;
        b=ZsNHiNNS1I5JBU1JDYaEG/Zcj5XxncI9gSVY4MgG37dILgkjlWJzg/uHbggpBr9r9f
         a3Fgu9Fus1uBBUN+snBvouPGBgzeiakMGTEYlnr3jllTbuoJCgRQV+HsJ4svQBxBvhjA
         r2uxe4PznLTN3f1mcCOiPepFui6IeKw8XQPvS4S3jJeX0LooUXaEcGDg8MJTplp+ilA5
         3+bw7s9JibJ+kJnmYbIMee+oUWhIi3wtsF6tFcswscw0qwhe1z0PdNTMTtOba5ckekvC
         Zx/biEqq/v+Zk81b5b2Jl91jaAjUuRJI9OZ3AdnwwKx/dOThlXCBor/F3/+1bpHhnl7H
         BPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pPxzGfzFCmHfkSMPFqAX2NLJAPD7DaR/PENfBt0xG4=;
        b=NOSX7wxSDdaUgYAw66J6IXpmzbDbbFf7UpS/aauQd4DG1EP10j46CCndz6F0WgbrSs
         iUjDGbJdOgvzwPeTjVrbEOp39VG1c4f2TrWOasnqdCcDpdkv+dtM5O4x860WEBpVZY8M
         aSEP8fx9fI74GuiiMZzgO4eBFY8oWLrBjDqOGMt6qpk/Dz8+9dBbbCfhDaX+kQD7exzi
         LJZjHF2yxVem12Da8jyxPCi7ccLUFoPgg4oMLpiB5lCkbkjr1qenKkjjBMLQi5PUL9RT
         uG7EQBbo1nIcVuv+BCAmQjJMsjXkjs8ao+UTDZdBh3OPN4dXO0cQd6rfTK11DFrGp+6Z
         UJpg==
X-Gm-Message-State: AFqh2kr/FGKX75p1AiscWMA76LcJ6c5ZDc9njhvJG4ubjbLKOm2ezP+Y
	0Yw36UpqHNeeXQCDO3Q+Hrato6ltvHjAqgJvlUs=
X-Google-Smtp-Source: AMrXdXuEG096egULXAJuR7VdmEnLDi4jAG88ay+frz9rnJa37Y0arGJGSQz6jEakaW2AHITGzCv6Ng==
X-Received: by 2002:a05:6a00:2ba:b0:576:7fb9:85cc with SMTP id q26-20020a056a0002ba00b005767fb985ccmr21411904pfs.14.1674440556478;
        Sun, 22 Jan 2023 18:22:36 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/32] dhcpcd: backport two patches to fix runtime error
Date: Sun, 22 Jan 2023 16:21:21 -1000
Message-Id: <a40acd3741069bb70283581d186e09d1d7df2a7a.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176291

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


