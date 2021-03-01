Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.10743.1614596108734916403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 02:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UWnumwLK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id m1so14022071wml.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eY+nVn7qzP5q5pZ7WAKJaTAMKp9VPOxW8OAKwSqYk/k=;
        b=UWnumwLKIg/Dlez3pKxG8TjWNDoCbfY+ets+HIhwziVb0vW6+eIUKZRralPhZr07ph
         Q1HpfaWw2vrHOaKGBTUhW03C9S5C2Qho5kcHOAhtNWTugQo6bcIUFkBcx3DCZs2TxFs4
         aBakHDa3FAcFM0UUxEuaKBsQnpeV6m8y7xiyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eY+nVn7qzP5q5pZ7WAKJaTAMKp9VPOxW8OAKwSqYk/k=;
        b=LApgFdSQLR12cuBAqCEoVJULItSXqD7oJiiTWqFhFyzdbE9RWxDTnklwPUyM3dGF4X
         B63AY1/oWNhi7EH+4VnEj/LheDtXd7dkdhw68y0OHNvvQYFFR6R0wiGkTDRl4UVY18Ju
         AEtFUOkPqscNuMrEM9xk7294bhTpp0fXh0rFTzN9oZTNkIdB5JsGhpjkZe25Ld75pvba
         0aurXDqqNw8oU2YBk7+GBKDn9nhgxeFtFC61CKjUDX7Evjv7jLIt0MBV/CkKr9jxCBL5
         0sXnAp3UsiCq4CcHGgO4W1e13ZZjEJ9G8WK2OPMHFIi2zN0EGNjwgy1TQy4mJyTNo873
         my6Q==
X-Gm-Message-State: AOAM533yg8PTIIZ+9Tez3J7cBjXLGsMRQC37z/UnbxwSqoosYu/T8Uo7
	WSzOCFjm9H1U4FvEXVwyD/V0RAvjU+CAYg==
X-Google-Smtp-Source: ABdhPJxKwGUu2PvPvCrM3yj4wNYvBBnFTQRI86wfa3+qwu9oR7sRI+R9VGmpIOPB9ZYqjZDSAkbGow==
X-Received: by 2002:a1c:bac2:: with SMTP id k185mr1041804wmf.148.1614596106782;
        Mon, 01 Mar 2021 02:55:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id a131sm22455807wmc.48.2021.03.01.02.55.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 02:55:06 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] syslinux: Fix reproducibility issues
Date: Mon,  1 Mar 2021 10:55:02 +0000
Message-Id: <20210301105505.2176093-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sorting to wildcard expansion in the makefile to make builds
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../syslinux/syslinux/determinism.patch       | 22 +++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |  5 +++++
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/determinism.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 3f99359bdbe..a15601e5e5d 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -45,7 +45,6 @@ exclude_packages = [
 	'qemu',
 	'ruby-ri-docs',
 	'swig',
-	'syslinux-misc',
 	'systemd-bootchart'
 	]
 
diff --git a/meta/recipes-devtools/syslinux/syslinux/determinism.patch b/meta/recipes-devtools/syslinux/syslinux/determinism.patch
new file mode 100644
index 00000000000..2fb8c64df37
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/determinism.patch
@@ -0,0 +1,22 @@
+In order to build deterministic binaries, we need to sort the wildcard expansion
+so the libraries are linked in the same order each time. This fixes reproducibility
+issues within syslinux builds.
+
+Upstream-Status: Pending
+RP 2021/3/1
+
+Index: syslinux-6.04-pre2/mk/lib.mk
+===================================================================
+--- syslinux-6.04-pre2.orig/mk/lib.mk
++++ syslinux-6.04-pre2/mk/lib.mk
+@@ -130,8 +130,8 @@ LIBENTRY_OBJS = \
+ 	exit.o
+ 
+ LIBGCC_OBJS = \
+-	  $(patsubst $(com32)/lib/%.c,%.o,$(wildcard $(com32)/lib/$(ARCH)/libgcc/*.c)) \
+-	  $(patsubst $(com32)/lib/%.S,%.o,$(wildcard $(com32)/lib/$(ARCH)/libgcc/*.S))
++	  $(sort $(patsubst $(com32)/lib/%.c,%.o,$(wildcard $(com32)/lib/$(ARCH)/libgcc/*.c))) \
++	  $(sort $(patsubst $(com32)/lib/%.S,%.o,$(wildcard $(com32)/lib/$(ARCH)/libgcc/*.S)))
+ 
+ LIBCONSOLE_OBJS = \
+ 	\
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 8d78f62efa0..dadba9eca9a 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -20,11 +20,16 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
            file://0009-linux-syslinux-implement-install_bootblock.patch \
            file://0010-Workaround-multiple-definition-of-symbol-errors.patch \
            file://0001-install-don-t-install-obsolete-file-com32.ld.patch \
+           file://determinism.patch \
            "
 
 SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
 SRC_URI[sha256sum] = "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3fadf94"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 RECIPE_NO_UPDATE_REASON = "6.04-pre3 is broken"
 UPSTREAM_CHECK_URI = "https://www.zytor.com/pub/syslinux/"
 UPSTREAM_CHECK_REGEX = "syslinux-(?P<pver>.+)\.tar"
-- 
2.27.0

