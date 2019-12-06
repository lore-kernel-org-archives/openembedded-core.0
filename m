Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id F3F687FA47
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 01:32:47 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id l4so2026985pjt.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 17:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1K/jDz3tRz4WjyXDMyBG123VzCK7yw8lIwGJ78kfY6s=;
	b=HThgxWUw9k2waJlif97tV7aB7E+cxAERrQ5OWpoqJskHgxCcgej8qgFWmIEtI10EUy
	pNUGvp5ofrWzsoZkGCgG9kqD0mHvIZO1DNUvjGQ7R8jLUXFLqe4ojYjShGnqzRX/V/9T
	RjashkKhSJkRfd+OjOwROd91LE93AWcYhJ1x5SC7uZwrQDgbdinuUuQlFBQe7tfdKu5W
	5yjgSpj2R4Uu7H2xI4vQuchqrb14gU78SFDiQ/z/JCLFRumdzxrODeJScdJW80KZ9IZ0
	0XrLJmo7gdeSVeY9bx6755LG1OMh6o9vjbtUpJ4ujcEr6BnYVNnzpbd1jqdG0FUYRrDJ
	NjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1K/jDz3tRz4WjyXDMyBG123VzCK7yw8lIwGJ78kfY6s=;
	b=QyUmc4kn0jvyV2H8Qa8JR4wo0kqWAXn+SQsY2wpqHQC5G1aPecwzqi/brAWkQ0wDLr
	bD2/dvJoNPcnUG9RRh4hLi8FCBoeGvaQw43lkprl+CkJ3eImm29wXzEITwmGvU7tNh6J
	Xm+/c/7uXPTbJ8d2WjBHsW/29Wi3a4ctwgyHOJMmuGkgOWQuCZH8JAQCPr6lbE9Ru3bd
	jz2OWZr6B0Pgc5LHAlhJaBJNOR9uBgn6cCGyUyCU3OwrnsCj+D+4MfYEZtWTXiNKOyt9
	MWBXRXz08oIl6pRoy37u9HbbTVUT8LtjY8AVQrOaDC9GiqIGgY7TAysXPz2CuxVs4rkz
	0gJA==
X-Gm-Message-State: APjAAAWb6ewT/Jy+R+NlNpaYh9NTEIRKZpqeWkAF5zsIlQiRwPprU9YI
	S8tqCzUZTZp5p9xtQ/eri/cXnOKkwtM=
X-Google-Smtp-Source: APXvYqwSEAusxgok6esfB4ND0A09vn4S5zGrYc0ZRWXFb2pX8LMXT1mQbJa+kui8NluQDFN+VHTiUQ==
X-Received: by 2002:a17:902:a5c8:: with SMTP id
	t8mr11069807plq.86.1575595967740; 
	Thu, 05 Dec 2019 17:32:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id o8sm936360pjo.7.2019.12.05.17.32.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 17:32:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 17:32:36 -0800
Message-Id: <20191206013237.3105393-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 1/2] libffi: Fix build on ppc64
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
X-List-Received-Date: Fri, 06 Dec 2019 01:32:48 -0000
Content-Transfer-Encoding: 8bit

Similar fix was applied already upstream but not extended to all the
cases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ess-platforms-with-no-__int128-part2.patch | 34 +++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.3.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch b/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch
new file mode 100644
index 0000000000..6b5b7d4747
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch
@@ -0,0 +1,34 @@
+Address platforms with no __int128.
+
+Fixes remaining pieces from
+https://github.com/libffi/libffi/commit/6663047f56c2932a6b10a790f4ac6666dd181326
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/powerpc/ffi_linux64.c.org	2019-12-05 14:48:33.140579431 -0800
++++ a/src/powerpc/ffi_linux64.c	2019-12-05 14:53:58.827244495 -0800
+@@ -680,9 +680,9 @@ ffi_prep_args64 (extended_cif *ecif, uns
+                     {
+                       if (vecarg_count < NUM_VEC_ARG_REGISTERS64
+                           && i < nfixedargs)
+-                        *vec_base.f128++ = *arg.f128++;
++		        memcpy (vec_base.f128++, arg.f128, sizeof (float128));
+                       else
+-                        *next_arg.f128 = *arg.f128++;
++		        memcpy (next_arg.f128, arg.f128++, sizeof (float128));
+                       if (++next_arg.f128 == gpr_end.f128)
+                         next_arg.f128 = rest.f128;
+                       vecarg_count++;
+@@ -986,9 +986,9 @@ ffi_closure_helper_LINUX64 (ffi_cif *cif
+                   do
+                     {
+                       if (pvec < end_pvec && i < nfixedargs)
+-                        *to.f128 = *pvec++;
++		        memcpy (to.f128, pvec++, sizeof (float128));
+                       else
+-                        *to.f128 = *from.f128;
++		        memcpy (to.f128, from.f128, sizeof (float128));
+                       to.f128++;
+                       from.f128++;
+                     }
diff --git a/meta/recipes-support/libffi/libffi_3.3.bb b/meta/recipes-support/libffi/libffi_3.3.bb
index f57d03d2f5..803a25fa35 100644
--- a/meta/recipes-support/libffi/libffi_3.3.bb
+++ b/meta/recipes-support/libffi/libffi_3.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV
            file://0001-Fixed-missed-ifndef-for-__mips_soft_float.patch \
            file://0001-powerpc-fix-build-failure-on-power7-and-older-532.patch \
            file://0001-Address-platforms-with-no-__int128.patch \
+           file://0001-Address-platforms-with-no-__int128-part2.patch \
            "
 SRC_URI[md5sum] = "6313289e32f1d38a9df4770b014a2ca7"
 SRC_URI[sha256sum] = "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"
-- 
2.24.0


