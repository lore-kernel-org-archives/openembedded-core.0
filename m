Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7CCE7542B
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 06:11:24 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.102341.1696313481342154820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 23:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KHxdxRvq;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-577fff1cae6so363426a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 23:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696313480; x=1696918280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fxnNTpX7gggoD4oE17/VvZZKiwbqwoE27VRRj8atN8=;
        b=KHxdxRvq4gRH/DVUMFeZ6Jk2u2EqT4B/jZv2Irt8ABDYUvMm697xx7c6XLRA7A9Zbd
         AJNSFI+PZiuoYnH4y+XVpRExzyZCTzjVQcvReeJNZpvZKBA1uGpNPfRVnHc/zjBcZ3Zc
         Vvse8B3uaxvrcnwG27DFIb48rjEqhsELcMel4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696313480; x=1696918280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fxnNTpX7gggoD4oE17/VvZZKiwbqwoE27VRRj8atN8=;
        b=YB/otU0HqjQWirjtzIKaM5N/PPf0/qdJm7eCtXngc0QQuqtDlKQTiaJQWaxRRnFZjw
         rdxdrHd2Lv8kPpKihEjpwweys2236qGQkVT2cFjKmPofqoQXHnYyGuR2qpfGfbcv3Kvd
         f9VbNoD/0kALuKfud2ILpvxejs09zfC6vE+J3IwNhWEKUkcoxKWqjKdFCnikLOSJS25w
         Fpum/s5FWcvEWiM6DJHEEvYU3hvGae0U0nDr0V2yyTMV9R09SN2cPwkiiKYM/QrdSBau
         3Th9LDFGTVGupzhzITBOrY5LTNZqZcApjRrSujnGiMLr6m2o5xziv0ZA+PXN98jjJm2e
         EpjQ==
X-Gm-Message-State: AOJu0YxIbQE2XgGH5+iNxIq/1X6Fs4Ljvbc9WfCKieaCFfEKTX5J71mI
	U4EqOtMawnzvYMsnfXv2BFlUK5hP7PkdVYBQo9A=
X-Google-Smtp-Source: AGHT+IF1mkzPu+iADPl/jgzbnKLBh6pYELRamBjAPUrForgcf33UQiD1hdrzjx97d9SqJyhEbG+67A==
X-Received: by 2002:a17:90a:bb13:b0:274:dd15:87bf with SMTP id u19-20020a17090abb1300b00274dd1587bfmr2750966pjr.20.1696313480102;
        Mon, 02 Oct 2023 23:11:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:b873:b7bd:8294:f7af])
        by smtp.gmail.com with ESMTPSA id f23-20020a17090a4a9700b0027909a8994fsm7428450pjh.13.2023.10.02.23.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 23:11:19 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] gawk: backport Debian patch to fix CVE-2023-4156
Date: Tue,  3 Oct 2023 11:41:06 +0530
Message-Id: <20231003061106.854646-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 06:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188624

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.launchpad.net/ubuntu/+source/gawk/tree/debian/patches?h=ubuntu/focal-security
&
https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../gawk/gawk/CVE-2023-4156.patch             | 28 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.0.1.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
new file mode 100644
index 0000000000..c6cba058a7
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
@@ -0,0 +1,28 @@
+From e709eb829448ce040087a3fc5481db6bfcaae212 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 3 Aug 2022 13:00:54 +0300
+Subject: [PATCH] Smal bug fix in builtin.c.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/gawk/tree/debian/patches/CVE-2023-4156.patch?h=ubuntu/focal-security
+Upstream commit https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]
+CVE: CVE-2023-4156
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ChangeLog | 6 ++++++
+ builtin.c | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+--- gawk-5.1.0.orig/builtin.c
++++ gawk-5.1.0/builtin.c
+@@ -957,7 +957,10 @@ check_pos:
+ 					s1++;
+ 					n0--;
+ 				}
+-				if (val >= num_args) {
++				// val could be less than zero if someone provides a field width
++				// so large that it causes integer overflow. Mainly fuzzers do this,
++				// but let's try to be good anyway.
++				if (val < 0 || val >= num_args) {
+ 					toofew = true;
+ 					break;
+ 				}
diff --git a/meta/recipes-extended/gawk/gawk_5.0.1.bb b/meta/recipes-extended/gawk/gawk_5.0.1.bb
index 1b29ec3113..c71890c19e 100644
--- a/meta/recipes-extended/gawk/gawk_5.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://remove-sensitive-tests.patch \
            file://run-ptest \
+           file://CVE-2023-4156.patch \
 "
 
 SRC_URI[md5sum] = "c5441c73cc451764055ee65e9a4292bb"
-- 
2.25.1


