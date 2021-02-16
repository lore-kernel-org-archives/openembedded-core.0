Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.13034.1613502363399406081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 11:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Od79i8xW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o24so15410322wmh.5
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 11:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMbqrOoch2zjDWCgDVGLfgZlIUFKEz5Iv5LVQzaeXys=;
        b=Od79i8xWD6bDcbwRNt2RHFWlwJ6yr/dDz5pqwtcCD7yf7pd5kcoRBeHxLmLROnavxx
         ZAkhc1tFnb2N8sNBsy3Dl199j04Ddm9fB+VBFQwzvkVxVbqoYyf5ZpFXvLlT7P0aQDZ9
         3l/HfARjsCuPOfCJjny43hvN4PZ0pGEEmtarM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMbqrOoch2zjDWCgDVGLfgZlIUFKEz5Iv5LVQzaeXys=;
        b=qsCdfhRDv+Z8IDdHnV2DCk68q9krlquGIt6UI/ZGT+E/0k9gOlVt4l6/V/rio7XOLC
         Knp0g7K6nYkMH4zXts9nN/ahZLaAwaY3pS1ctSQvROzHzZUgxzI+otvUQkxN4erHBvh6
         d/JOF8iRHdL9dKkHPQ+eV08yN8bZu4bF8IBM6AIX/8l1S+J37uMqAdKmiz3dhYP064sG
         KqVAilMhUcJ+ekXiFe7GNg/pDnJ5c+1Eu0g3B4ms9YguNvWZqaJpbpn5yQTZRwQaK0P0
         CEWmk70aykBZoNeh26TRru9zWFo7mAFBw6Lw+TAx5DTe7nEQYWbKd1EFuAaZw/5L6lnm
         Drqw==
X-Gm-Message-State: AOAM53219N/8dgVQuwqYIYUBX+RlQ/gbggkrG3SWqIYbXytz3sRqw0rF
	dFbUeNDi/7uWSR/nxVJG1Ifd7SU9d8ul7A==
X-Google-Smtp-Source: ABdhPJzl176LU1sPAmR/Msirjm94VVF+nR5bIc1+ygLWkNZz2Un1esJO5/tnT8rge69bv7Kw9atJLQ==
X-Received: by 2002:a05:600c:4305:: with SMTP id p5mr4279488wme.8.1613502361635;
        Tue, 16 Feb 2021 11:06:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id y1sm20186836wrr.41.2021.02.16.11.06.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 11:06:01 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Refresh mmap fixes patch status/content
Date: Tue, 16 Feb 2021 19:06:00 +0000
Message-Id: <20210216190600.2038009-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One mmap patch was merged upstream, the other is in progress but after
discussion has been amended and resent. Update the patches as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu/mmap.patch  |  2 +-
 meta/recipes-devtools/qemu/qemu/mmap2.patch | 26 ++++++++++++++++-----
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/mmap.patch b/meta/recipes-devtools/qemu/qemu/mmap.patch
index 0f7d2ce04c2..edd9734f30a 100644
--- a/meta/recipes-devtools/qemu/qemu/mmap.patch
+++ b/meta/recipes-devtools/qemu/qemu/mmap.patch
@@ -9,7 +9,7 @@ avoid asserting binaries when reserved_va is set.
 This meant a test case now gives the same behaviour regardless of whether
 reserved_va is set or not.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/ccc5ccc17f8cfbfd87d9aede5d12a2d47c56e712]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
 Index: qemu-5.2.0/linux-user/mmap.c
diff --git a/meta/recipes-devtools/qemu/qemu/mmap2.patch b/meta/recipes-devtools/qemu/qemu/mmap2.patch
index 9d40565938f..1652131757b 100644
--- a/meta/recipes-devtools/qemu/qemu/mmap2.patch
+++ b/meta/recipes-devtools/qemu/qemu/mmap2.patch
@@ -6,21 +6,35 @@ if it only sees ENOMEM and only exits when it hits EFAULT.
 
 According to the docs, trying to mremap outside the address space
 can/should return EFAULT and changing this allows the build to succeed.
-Whether this should be fixed in qemu and/or musl, not sure.
 
-Upstream-Status: Pending
+A better return value for the other cases of invalid addresses is EINVAL
+rather than ENOMEM so adjust the other part of the test to this.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01355.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
 Index: qemu-5.2.0/linux-user/mmap.c
 ===================================================================
 --- qemu-5.2.0.orig/linux-user/mmap.c
 +++ qemu-5.2.0/linux-user/mmap.c
-@@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
-          !guest_range_valid(new_addr, new_size)) ||
-         ((flags & MREMAP_MAYMOVE) == 0 &&
-          !guest_range_valid(old_addr, new_size))) {
+@@ -722,12 +722,14 @@ abi_long target_mremap(abi_ulong old_add
+     int prot;
+     void *host_addr;
+ 
+-    if (!guest_range_valid(old_addr, old_size) ||
+-        ((flags & MREMAP_FIXED) &&
+-         !guest_range_valid(new_addr, new_size)) ||
+-        ((flags & MREMAP_MAYMOVE) == 0 &&
+-         !guest_range_valid(old_addr, new_size))) {
 -        errno = ENOMEM;
++    if (!guest_range_valid(old_addr, old_size)) {
 +        errno = EFAULT;
++        return -1;
++    }
++
++    if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
++        ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
++        errno = EINVAL;
          return -1;
      }
  
-- 
2.27.0

