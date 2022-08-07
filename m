Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC558C3F6B0
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 04:15:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.10722.1659845749316002441
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VSAs4GmU;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso11645586pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=QSTKx70TjCXQB0BjtmCdqcq90+Wl1SPhAWHgwNi4zgI=;
        b=VSAs4GmUJh4aDRXCobZmk0qTavSh9FUelLZgU07wcIaVH9sYHdqxiuLny/8ud0PqNA
         Wwbh+aoemrD5Luvxcl52elOIAudRf8NB+KUghuJDpZW1wXWwe57Oq0HtLXTIEZLf88ET
         7blbuAFf+gRzQ2G7bThKYutJx3HxGA8i0Log1MyQxiILz7eJvrykjt6Dob5rj2kfyuzc
         eH+Nf6j/PMFXybaXwukib9CIgzFUDD2pC5xEAhVhCT2cEw3epLWcb/vnmljI6VHD4Ps4
         Krx+kd3dXnVLRnNXf5BP0zp8JlDGU9I9/Ilri+8FlhzzP0RVUU3Jnj6Z7EN9+n+MPk5h
         R4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QSTKx70TjCXQB0BjtmCdqcq90+Wl1SPhAWHgwNi4zgI=;
        b=aKBBWYT39x3fKPlYFgjBWuRF2SiZLTF41M10hHlimWtWVyadn/IBcf6Ylx3a/oCOeB
         R1HQPBs4ewVLjtU8T8hKLb7p6OSySchdRCPVpJSUsj1p68vSwhTsqirP2iWhQfVn0WQg
         qQKOG6wO6V/nGpVTJKOKZxCdz2a/6aOz7h1OUP5YtZLgaNl/Hdhk3xMNkPP11n6bUfia
         7hXBiH7RC4qilLHIYodQeralSS1JYWd0/MIHDCg7f+AZ3bXxJ0uAhsjKkGNtay3eombS
         2EX2xuDhzu4Wgjr1tH9BXt7SBzhvjhU59wcgEMqSc+BVSZBkOmnDjD2MTI2vj/fAQxiB
         WfOw==
X-Gm-Message-State: ACgBeo2FZX5ZgrfAmnw6dng6HK8IV2QKv/k35GlylkgXBLvrqwqt+qYb
	TmyV7sIwwuWY97+d3wjf8kQ3TkDGd98=
X-Google-Smtp-Source: 
 AA6agR75uJe9ruP2PUKNeS1fTnLEw5Eyfn8OQ7J5Vn9sH4eE4n4ho3BAtv/aRRBgCqdZROrdidCq6Q==
X-Received: by 2002:a17:90b:33cb:b0:1f4:f635:93f8 with SMTP id
 lk11-20020a17090b33cb00b001f4f63593f8mr24120530pjb.74.1659845748270;
        Sat, 06 Aug 2022 21:15:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z67-20020a626546000000b0052e8bf1c27fsm5654146pfb.31.2022.08.06.21.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 21:15:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/7] stress-ng: Upgrade to 0.14.03
Date: Sat,  6 Aug 2022 21:15:38 -0700
Message-Id: <20220807041541.2665647-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807041541.2665647-1-raj.khem@gmail.com>
References: <20220807041541.2665647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 04:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168985

Backport fixes for build with glibc 2.36+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...helper-remove-include-of-sys-mount.h.patch | 34 +++++++++++++++++++
 ...e-shim-remove-include-of-sys-mount.h.patch | 34 +++++++++++++++++++
 ...ess-ng_0.14.02.bb => stress-ng_0.14.03.bb} |  7 ++--
 3 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.14.02.bb => stress-ng_0.14.03.bb} (77%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch
new file mode 100644
index 00000000000..52b2e61bc14
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch
@@ -0,0 +1,34 @@
+From 627e5227783ff2a0c3b11adee57ef7f0684a367e Mon Sep 17 00:00:00 2001
+From: Colin Ian King <colin.i.king@gmail.com>
+Date: Mon, 1 Aug 2022 21:39:39 +0100
+Subject: [PATCH 1/2] core-helper: remove include of sys/mount.h
+
+This is not required in the shim core and it fixes a build issue
+with newer glibc 2.36
+
+Fixes: https://github.com/ColinIanKing/stress-ng/issues/216
+
+Upstream-Status: Backport [https://github.com/ColinIanKing/stress-ng/commit/69f4f4d629c5f4304b5388b6a7fa8616de23f50e]
+Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+---
+ core-helper.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/core-helper.c b/core-helper.c
+index 6795410d..9e4533f2 100644
+--- a/core-helper.c
++++ b/core-helper.c
+@@ -39,10 +39,6 @@
+ #include <sys/loadavg.h>
+ #endif
+ 
+-#if defined(HAVE_SYS_MOUNT_H)
+-#include <sys/mount.h>
+-#endif
+-
+ #if defined(HAVE_SYS_PRCTL_H)
+ #include <sys/prctl.h>
+ #endif
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch b/meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch
new file mode 100644
index 00000000000..5cb95f1f2b8
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch
@@ -0,0 +1,34 @@
+From 0503ec88e9187c0152b7b2840a1ad5bfb022bbfe Mon Sep 17 00:00:00 2001
+From: Colin Ian King <colin.i.king@gmail.com>
+Date: Mon, 1 Aug 2022 21:28:49 +0100
+Subject: [PATCH 2/2] core-shim: remove include of sys/mount.h
+
+This is not required in the shim core and it fixes a build issue
+with newer glibc 2.36
+
+Fixes: https://github.com/ColinIanKing/stress-ng/issues/216
+
+Upstream-Status: Backport [https://github.com/ColinIanKing/stress-ng/commit/0c9a711f213b5734729ab0c5ed90669e9fd11ca2]
+Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+---
+ core-shim.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/core-shim.c b/core-shim.c
+index 0343402a..324eba7d 100644
+--- a/core-shim.c
++++ b/core-shim.c
+@@ -52,10 +52,6 @@
+ #include <asm/ldt.h>
+ #endif
+ 
+-#if defined(HAVE_SYS_MOUNT_H)
+-#include <sys/mount.h>
+-#endif
+-
+ #if defined(HAVE_SYS_PRCTL_H)
+ #include <sys/prctl.h>
+ #endif
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
similarity index 77%
rename from meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
index 000a640917c..370662bbb30 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
@@ -5,8 +5,11 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "5239ae6c82bfb239637b5a66cd39a035a158e641"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+           file://0001-core-helper-remove-include-of-sys-mount.h.patch \
+           file://0002-core-shim-remove-include-of-sys-mount.h.patch \
+"
+SRCREV = "346518caffe5302f9a6d36860459c297c6968aaa"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.37.1


