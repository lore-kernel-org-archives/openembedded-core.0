Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id A7C6E7F363
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:33:14 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id w10so3267884pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3UJvszKz9DF45/bfC6uSILI94t7Ow87OLVEwXH5KXiE=;
	b=L+eQnT8HdReC4Tm6a4KvdY1P4nekXJbeMuJGRNLCQoMu2fbKWWXTmA0tpq98+0L6Ax
	0dzNNiKWaTI2Hfx7l5ocFwe9qH0oumcCYMI8VbkhQIvnUn3bn3zyCzFaO6+w6GY9P90H
	kerWkYQuVbukDhAy5wSI9Bgs+CsWrBWbpDTmnpfZWJ1X61iX8VkvFtZdRnisiPwdkOI4
	Cklx6/HcnQNQ+6BVlFzPjQB9Seeb4sBUvXrH78LtkvlCAbI6nNvPSNWn5zUgsOKc7A/m
	No7GKn9I0kJeINNVLghAkNjYB4psso/4ookb0aFAIWM++Fo3twDTiHvx1LtsCYo5+pGJ
	k9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3UJvszKz9DF45/bfC6uSILI94t7Ow87OLVEwXH5KXiE=;
	b=EOs2hFgBzR3RCuixbY8Lbmg8CwAROz6Yzsuj2WOwVlwIGEI4fdINMnq1m7HwGggm/b
	fHABC4HaHDgBVn+HGdNIpVPeDkwA9yd4lcw3J94TRIk2bvHseh7M9biACSBiB1VDU+U4
	1s4X5tGBxTwRNU76zgehwg2s4AecheuJ2Mmf2XIIoPRauqXPLZoizYRf4EcB1kLoXoRL
	QcPP2OhH9wJp3eX00kBL35DyF10/oFLwbNQUFlEyBZpS93fr5XciMVN7IvZHZVL00GhE
	0XmWtt/UryjGeI4hvSNp7/rYjEWXbOkK6yt5Di9Vb2/0viQHpQYvwvZSzyr1BU/588ZY
	XJbQ==
X-Gm-Message-State: APjAAAU7zkeW89/D6YHtKECa8d7LrksIMM/czPR8Pb7xqh/XSCJQNM9o
	2FQw0UVFYU7rSvwUgTLCFyalsp/YeQk=
X-Google-Smtp-Source: APXvYqz4L1pF7RyOBDwi+OMQEe8dyyj7H8f6w4di0XE2okpie90HdTZZmGcLLT8r4hjP1XSnF8Aubw==
X-Received: by 2002:a17:90a:dc82:: with SMTP id
	j2mr8543070pjv.89.1565976794983; 
	Fri, 16 Aug 2019 10:33:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id a6sm6188517pjv.30.2019.08.16.10.33.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 10:33:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:33:00 -0700
Message-Id: <20190816173301.807-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gcc: Search in OE specific target gcclibdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 17:33:14 -0000
Content-Transfer-Encoding: 8bit

We put gcclibir to be /usr/lib/<arch>/... and not default
usr/lib/gcc/<arch>, therefore make the include search path also look
into this directory, this should help in finding gcc headers like omp.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 .../0021-Ensure-target-gcc-headers-can-be-included.patch  | 8 ++++----
 .../0019-Ensure-target-gcc-headers-can-be-included.patch  | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch
index 60d72699d6..58b4d1aa68 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 476eda9054df443d094273c8b61fce63d940adfc Mon Sep 17 00:00:00 2001
+From 94cc995cee76a9d59204a900fcaa2afb2eaa75c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH 21/40] Ensure target gcc headers can be included
@@ -23,14 +23,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 15 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 71a8275c39f..5ae693fb06c 100644
+index 71a8275c39f..aa4adc3db24 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -614,6 +614,7 @@ libexecdir = @libexecdir@
  
  # Directory in which the compiler finds libraries etc.
  libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
-+libsubdir_target = gcc/$(target_noncanonical)/$(version)
++libsubdir_target = $(target_noncanonical)/$(version)
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
@@ -94,5 +94,5 @@ index 570cdc00034..3fb64d453f1 100644
  #undef MD_EXEC_PREFIX
  #undef MD_STARTFILE_PREFIX
 -- 
-2.21.0
+2.22.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
index 4809bdf4bd..af0ea5c60a 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 5225980db3e03b2fe6597393d7177d0cafd1b1d9 Mon Sep 17 00:00:00 2001
+From d27ba49e2e5c608c43265462d6831363cc7f565b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH 19/36] Ensure target gcc headers can be included
@@ -23,14 +23,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 15 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 0064a282488..21472745c2c 100644
+index 0064a282488..98d1488171f 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -618,6 +618,7 @@ libexecdir = @libexecdir@
  
  # Directory in which the compiler finds libraries etc.
  libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
-+libsubdir_target = gcc/$(target_noncanonical)/$(version)
++libsubdir_target = $(target_noncanonical)/$(version)
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-- 
2.22.1


