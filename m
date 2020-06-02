Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.51643.1591056805389311816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 17:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j8/0OT8M;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id nm22so521326pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BaQazz1RxsfC3hQeOpk87mkOov+3NNf0xD3//H9M908=;
        b=j8/0OT8MGXLybd4xlrgBZ5cdT2m6Tf66KlyYHQ/QOiDjiKkoHlpffirXFmNO7R0n4c
         YDlSxwxQfV6K32QOMRLEJ4IbEuWjDOg0vV2qt7BpJ42Ch4ORefxSDyEAwO8tcApRpR8b
         EFfhugfEotnJcw3hmwbr4HO9CkCkd40/V87dKZfdXd1cYSPI5iTfrQrYarSZrPdm2bGH
         PELgDnC+JY+bRtHA8MhISNiUFDKYX7jGup0FDjQGxYgQspUQNSdOhWzEdULXHEb9QzFg
         G/LkZEpLmQAMGHnUIGQU5WuwSVhgXaygWCgYOduph13QRZppB/qK1zwGsxmUSYLrYpjp
         5Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BaQazz1RxsfC3hQeOpk87mkOov+3NNf0xD3//H9M908=;
        b=LjUrJBjV6prQzq81XuvAdHGHOTVb6sjsfyna2/whlk0WPdWgrnv5dMHWOfuWFAyzHt
         D5Qy8R5J0Wn2xoCuC0Yqx3RM8B1Do2PwR0Ltig+WGre+Y4WgRPgi/nXmUFfiqi1uEZY/
         qW/IjaOTQUbKhBIwEzgMXjjXtei+G/DVlqYqw7glMtEilfC5rnxfqxCGgLekAtHfbKw3
         uwe8h5UY3ijUdvS31V094+LYGTu9FyLQrIaeRMdOCjbyL2g3PNnz34jxvGHUXWAw1mUM
         6vfbHgb5aKrG2nTf9CtMZUBc/R6AZjsmUOn/J38jXkjCk4126s1nHB9U7pnMd5ScZ+VD
         qfnA==
X-Gm-Message-State: AOAM5333myGaYP8sNQs2rHeMqbH7gKQ7kKyB8GzFZmUyuDbyNdfXn2oP
	uyX5hawyXom8yYtAgfEks8yP7p2+ZtA=
X-Google-Smtp-Source: ABdhPJwIhYocIpTaJvaxaVF4g0cSHQmYLjPsu6BAOxl/leAqXUs5nT8NfBcq+is/vQQIxNfphmwCLA==
X-Received: by 2002:a17:90a:a40b:: with SMTP id y11mr2333694pjp.54.1591056804330;
        Mon, 01 Jun 2020 17:13:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c195sm442699pfc.203.2020.06.01.17.13.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:13:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/8] linux-yocto/5.4: temporarily revert IKHEADERS in standard kernels
Date: Mon,  1 Jun 2020 14:12:44 -1000
Message-Id: <85c481d13814b889a3d86044dcaac7d4eb685ade.1591056239.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591056239.git.steve@sakoman.com>
References: <cover.1591056239.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We had a commit that enabled IKHEADERS, since bpf requires them on
target.

This is still causing incremental reproducibility errors during the
module compilation phase of the build.

We are temporarily turning this off, so we can integrate -stable
and other related changes. A replacement feature "reproducibility"
is also being added to this can be conditionally enabled while
we debug.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5706788603b38ad4a0987e187a1c11c06f4d4e6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 760ded446a..e6366ee36d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3d70f110c590b38219843a3a0815a232fd542cec"
-SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
+SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 1645906034..4a37c758b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "80606f0432a35225e7bff188a890b836018bae61"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
+SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 068cebca2c..2bba72df77 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemux86-64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemumips64 ?= "2da40cf3f065512eea3729172f8e3f0cf1857160"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
+SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

