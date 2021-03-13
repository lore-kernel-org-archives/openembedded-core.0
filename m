Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.2778.1615661508522705412
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AYBy8MAR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id t16so5181411ott.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GbdHB5dmkMYdTH2Wk/UlZOWb5kQIutyvvJHDl5JupPg=;
        b=AYBy8MAR2xK1+y0YuULD0n7wWfcGBGlSkAyYy3wCFST3WZRp/eXDNSorFW5vnwG53b
         hPIWNAaCO4zNiSrzr46cReocE7Egcluw3/dmzv9i19nIPZEjaqfHmx6ZrQOmQkm5waGg
         t/8jU2tXepNNZ2P7FVLIQwaN6SgWL4jVq5jVReMDKp2RpS85wcFVbvuDs98B1qqdet30
         zpqNUc9p082/1iJszNEcUsRwTTotTK0PyL94/uAuwf+sBp53gY8hLQGsXtUCE/X6LO9b
         IHB9H/6WGNUhFTrIXPwPvXJk17SxobqTjCcEdeyIPuSYvetCxieH+UgXPBSzEACejjEy
         rQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GbdHB5dmkMYdTH2Wk/UlZOWb5kQIutyvvJHDl5JupPg=;
        b=YRtF/4sdt6/W2AmRs+cBcsAkHVXmAnY5QfgY/9XPfTGooAnysK2uE50UnK5YGpL3zE
         xsywiB40G6rGVUFy4qJLh4ev8LhW1/nz6V4gAFdQoIVoM3GJ03BwD9V7t8kvPcbVKPaz
         slLPGNhpMLuCkhbD+B3kq0cbrzjqJddb6fJy4GA0+NNFPIVbH09PLjK5FnHRcIaTzICI
         Uu0Q59b+JfORT8DEx1Rq716ZZg4WuVkn8cCv+OZugdGC28FD5UYPXno51zeDrVZfyyQk
         Ffd7bf5rfyhgCaKaLiNVcei1tdPdjQpZq40Wrz5bJ9fmVR1mzY2e25n2htSanI2KCwHs
         aD9g==
X-Gm-Message-State: AOAM533g/kDqNW4llI7HNb+9ikznk834dzOma8MkVZGaXLCZag2A1InH
	taGb8Ms8oP2+CKA5ffHyTgMJUtIvTukri2Lb
X-Google-Smtp-Source: ABdhPJxkoFwMUB3x4It29Br+oZx8A9lmljlOQaF1Fqq5InGfmE0widTDK0JghsPIElAv0jXZwBlAnQ==
X-Received: by 2002:a05:6830:1b68:: with SMTP id d8mr7839084ote.235.1615661507396;
        Sat, 13 Mar 2021 10:51:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/38] syslinux: Fix reproducibility issues
Date: Sat, 13 Mar 2021 08:49:12 -1000
Message-Id: <7529d0a5fff17e35238c0f005163360f7f903898.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add sorting to wildcard expansion in the makefile to make builds
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5541ba76ccc0c416f315bc0dc14a20a33059bd5f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../syslinux/syslinux/determinism.patch       | 22 +++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |  5 +++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/determinism.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/determinism.patch b/meta/recipes-devtools/syslinux/syslinux/determinism.patch
new file mode 100644
index 0000000000..2fb8c64df3
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
index 4ac46ed57f..a5618327bf 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -23,11 +23,16 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
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
 UPSTREAM_CHECK_URI = "https://www.zytor.com/pub/syslinux/"
 UPSTREAM_CHECK_REGEX = "syslinux-(?P<pver>.+)\.tar"
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1

