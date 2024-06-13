Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6386C2BA1A
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:03 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9974.1718288461502532878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H2iq+Y//;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f44b5b9de6so9488925ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288461; x=1718893261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoXTny8K7TafjhJK6Tc/VOTOZZLKVSstwx08Awpfmuw=;
        b=H2iq+Y//+R9xslKsUmFE73Z4cc9IIwy2+W0VDPFNGDM6cqoy95FGOXAo81p/XVxOLZ
         BbVvVK4zJhMSp4+Ly28L1ah5xjZabnOQDryIBnS+zHwNgs5keTK4pez4dJXXXIcRkXrG
         KQ6u7U0LF1swKiJ+4EwTIW8CsLisU5oUzBUcCdQ7I+xdbXzT1GUuxTNwLA3qyqJ2v4nf
         6vu5VcQrNSBZdX28nvvV9WLFSLQFMC2ErC89gBpEhAkZJggTUK/dX1Cd/W4MlX0W49d3
         AuqbxUXgDLY3xXPRTzpWnKOIgxh27VyPUWA/VBO7uemGEG14wdmWAa87HfPxtUtYgEBL
         w0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288461; x=1718893261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoXTny8K7TafjhJK6Tc/VOTOZZLKVSstwx08Awpfmuw=;
        b=IgaOfK8AaxXhC5Jcg/2BeWtazTxT2L1H7q8uU09FzuFwd5FJmS0KL5J+mhcLMwLzM6
         m4a2G6x+1z5Y/HJC0c6Sho3Q2aQJKCAQC0q/S+Qo4LixTY6MffjoBZzaISePW97vp2RF
         j+G3B8Zi0awbqsWjt6cE7gkljzD5AQZKP5bLRAqzEt9FSRYJiYPkbfUf/RskHq9hYHk6
         0+OdDue3JRfn37pa3nGkzhNTc5LUv4PGJXoecFNZ6kcLD5x2krkUa8+dg9WbTFIFTYk4
         LLueGiep8PlLc4szpEP2EOFyBzA5h6vbt/XRk7tkRgJvkYOYpZR8nIHP1NOKO4DGjJ4x
         kxcA==
X-Gm-Message-State: AOJu0YzPbDuOlh6U1WUj9Y+VUdsZXxIU+M8a7WZOItvk5+u+u4o26wog
	prgSb/ZYMxnlobzOPfMS1nqIZ80gATM7SEHAzNxBYNf3rh3P7MCxLVResl4KLYGI5q9bu0aIuVC
	+
X-Google-Smtp-Source: AGHT+IGvheUketGK9dQXQzeAidshiRiVf4nxMYraCTo4/nYs2pJ9fUewrhFklnF1E2fgBymkT6euiQ==
X-Received: by 2002:a17:902:d2c6:b0:1f7:3b8d:5583 with SMTP id d9443c01a7336-1f83b521423mr52901495ad.11.1718288460693;
        Thu, 13 Jun 2024 07:21:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/29] expect: mark patches as Inactive-Upstream
Date: Thu, 13 Jun 2024 07:20:20 -0700
Message-Id: <84a8ed08e474427bf4a6b3a0026807a1bcabd417.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200618

From: Alexander Kanavin <alex.kanavin@gmail.com>

There's every indication that this is an ex-expect:
last release in 2018, stale tickets, cvs server gone.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fcfd2cb51428a3f35c0f78634bff0a16ae654e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expect/expect/0001-Resolve-string-formatting-issues.patch   | 2 +-
 meta/recipes-devtools/expect/expect/0001-configure.in.patch     | 2 +-
 .../expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch      | 2 +-
 ...1-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch | 2 +-
 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch b/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
index af1d8c626c..bfb6dcd89a 100644
--- a/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
+++ b/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 23 Mar 2017 13:44:41 +0200
 Subject: [PATCH] Resolve string formatting issues.
 
-Upstream-Status: Inappropriate [upstream seems dead]
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  exp_clib.c | 4 ++--
diff --git a/meta/recipes-devtools/expect/expect/0001-configure.in.patch b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
index 7595a254a8..618c4bee8e 100644
--- a/meta/recipes-devtools/expect/expect/0001-configure.in.patch
+++ b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
@@ -1,7 +1,7 @@
 Allow cross compiling.
 
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 ---
 diff -uNr a/configure.in b/configure.in
 --- a/configure.in	2012-12-14 15:31:32.623180450 +0100
diff --git a/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch b/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
index 37512fb9bc..d73f4c3421 100644
--- a/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
+++ b/meta/recipes-devtools/expect/expect/0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch
@@ -10,7 +10,7 @@ Aborted (core dumped)
 
 Use PATH_MAX to fix the problem.
 
-Upstream-Status: Pending [Upstream seems dead]
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch b/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
index b1d322d5c9..40f7f3bd85 100644
--- a/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
+++ b/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
@@ -42,7 +42,7 @@ Example:
  }
 Author: Sergei Golovan <sgolovan@debian.org>
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 This patch is backported from fedora changes for expect:
 http://pkgs.fedoraproject.org/cgit/rpms/expect.git/commit/
 ?h=master&id=b6737eed550be93182f2ed194e836a6cbbcf4fa3
diff --git a/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
index dc4c6ba406..eb178f462a 100644
--- a/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
+++ b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
@@ -1,7 +1,7 @@
 Use proper -L path when cross compiling.
 
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [no activity since 2018; cvs server went read-only]
 ---
 diff -uNr a/tclconfig/tcl.m4 b/tclconfig/tcl.m4
 --- a/tclconfig/tcl.m4	2012-12-14 09:16:58.789861281 +0100
-- 
2.34.1


