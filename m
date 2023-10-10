Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2D0CD8C85
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.92770.1696947278031480599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m7YJboZX;
 spf=temperror, err=temporary DNS error (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9bf22fe05so3233975ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947277; x=1697552077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+Z4VvcHxErnoY9Pipjc6geVt1kSElvknTGACFS+fhY=;
        b=m7YJboZXFJYntrTpZ7Y6WeSwVZHQMLxg7nLgP8SXeqg+Yo5QXcvmvk+LnsX9ChnbLk
         jtirja0RLg4UrBeFWhWUbBaeps+/LjsE/pF9oRT6GABZq4PHF7+8THcV6hNs0tR5d3ra
         Ew/OCM6PShFmhu+ETyD8HgTuMBS6vpaFJK3sG3wZic2JlqM/mCDQp+Ux/iSyI03bCfbe
         TyvjYJJkcVxZGrDl/Ee4Q154QyEjKkBgesTeQN55MRGSrYVndlp7Q2xHTLJM+rbOawkV
         v+rYKN3hq3WGPk7HBjBMwbGTSMGOhHJ76AgsvpvFxM2eG9cbu2aQJuyzYG8gntZU+QCe
         +hCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947277; x=1697552077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+Z4VvcHxErnoY9Pipjc6geVt1kSElvknTGACFS+fhY=;
        b=QJ/y4kGD2z5dbuTHKgUhTb+HBkvBLkccT1GRsmFL+Jhsoja+vZmYQkrS+3STm9Is+P
         /rYWeT85IqT53S73QpxNzWwANOnQo8DKRW8G7rMgMSE/YJAKUF7PfeMcNuFE6HutahA0
         +82GvB3coaMndipZOdS58x4TSRsWHgXXqNhSXed7qoJH0pRooI3G5y2vtIVyxXnkphtl
         L+gms2MYhoKPrXeKuR+uK7jHsfumwsc7SPfEDq2rzn49isoNDqJW736cN9a1m6CjIqPw
         NmPpnXfgv1GzxHE/v4XrsZK9YLAc/G5flc7Zk/3ayI/8KLOh9dpZ0ZwMBl/irBoc5zSI
         hosQ==
X-Gm-Message-State: AOJu0YyPHUlbYQzUSdUGoVl5ipsA2o96XTGMoOfTirC8DmEG+kvTBebP
	NTu/N87qbc8ldu7HL7NNXA40Sio+O6pzPCYf0j8=
X-Google-Smtp-Source: AGHT+IEm0ySXH1jvtZvGnZPsvBwXdpcP9ee14bCUg4AX1A3o25iTO76e63Sc8wYOFcIWYVP+Pqpqkw==
X-Received: by 2002:a17:902:e881:b0:1c4:4c10:6ae3 with SMTP id w1-20020a170902e88100b001c44c106ae3mr21230158plg.23.1696947276973;
        Tue, 10 Oct 2023 07:14:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] gawk: backport Debian patch to fix CVE-2023-4156
Date: Tue, 10 Oct 2023 04:14:19 -1000
Message-Id: <68412b76948ce185d87fda73ead7b73e5ad6defd.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188899

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.launchpad.net/ubuntu/+source/gawk/tree/debian/patches?h=ubuntu/focal-security
&
https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


