Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.45968.1609166170872801619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZNW7ULsR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id lj6so6027990pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8WeGKf2kSFTpiCN+MtKa4oUOLzDUHtqCHxtrD8Hcbwg=;
        b=ZNW7ULsR1ASX5gTe73aTRaAOOTnwWIO8yZ4OwsxFjmTJ5Ya9g7OeJlmbXoLYE7eK3k
         FKOoYIYJZIqieS30ncCNmIDtHu8lyDZ+L3EmqfW1T/Jyw+MyViINDbWrpaCGnOuej0rl
         zuIcPdYC9U0QzTYGtKc4InhkCSM7mHCxMJ5pGgMAmNl+L6L0lBAny4xkO2nAOgMD9xMv
         VdnsZY1KbPZkSf1/ycKCMvNtElm2qvZhMHiGFjtYekJFxQKqOXKaCkJLU/8PEy5yA7w/
         ALaGTgMJADCSa68BqQ3bM3E+Zu1P/FAQezDpWv4FExk3j6wWgPXoTqpiE0o2sC5+8Qga
         SjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8WeGKf2kSFTpiCN+MtKa4oUOLzDUHtqCHxtrD8Hcbwg=;
        b=ILTu5/5VYMfDkFEIdfO3mtX/eSObO6uHc0ig7WF9bw8EgHoaTMA00MnjoQoa60Uw5p
         CJhTMwuRBKHDbsqWTUoGTIXh1IuikbukSllEyBeTFs47o6JrG7ZPzDEPiWqTjqe/1DGi
         zINbYmoZJfi1dTqQ1F2lOrCyOi8pOeEr+yHPN+Tw0lQJfEKzoBO2bac3fEvxYLxjdGNU
         EMNImM956U4zmuPjUy+EZ1B0fNrQnbGPa122Hrx4hdz3PMp/Hv6he/HlKJqoIdL0LkVJ
         1y+OuXteT7Ir5qNiWTZgsbj0RFX1+Slzc4gA6yJqfjQkHCW8MM7irN5TV0B/axAvHQpr
         3qbw==
X-Gm-Message-State: AOAM532Hn6JhLLjYJFkvRztC4C4J6GwbAzfGlthrGYrcSJ9h06PcWGUN
	IeB+A67a6S3lYaHD64JQv0+whgZgXvKfgDdbH3Y=
X-Google-Smtp-Source: ABdhPJyKVIOKQO5C4OmwYdLq/JKoWRO0SLBYUNB4vaFygK+cfLdqNHLcusIAEwn6gxMdk1CGWr/Xmw==
X-Received: by 2002:a17:90a:5d03:: with SMTP id s3mr20455352pji.150.1609166169749;
        Mon, 28 Dec 2020 06:36:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] grub: Fix build reproducibility issue
Date: Mon, 28 Dec 2020 04:35:41 -1000
Message-Id: <351651925d854a130cfa2d04d4d3f18caa08c873.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing reproducibility issue on the autobuilder due to changing
module dependency ordering. Add some sorting to an awk script to fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 925ddd5edccbfec52ff45c1b54ab2ae1bfe0d57c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 24 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/determinism.patch

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
new file mode 100644
index 0000000000..c4b1d3a2a8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -0,0 +1,24 @@
+The output in moddep.lst generated from syminfo.lst using genmoddep.awk is
+not deterministic since the order of the dependencies on each line can vary
+depending on how awk sorts the values in the array.
+
+Be deterministic in the output by sorting the dependencies on each line.
+
+Upstream-Status: Pending
+Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: grub-2.04/grub-core/genmoddep.awk
+===================================================================
+--- grub-2.04.orig/grub-core/genmoddep.awk
++++ grub-2.04/grub-core/genmoddep.awk
+@@ -59,7 +59,9 @@ END {
+     }
+     modlist = ""
+     depcount[mod] = 0
+-    for (depmod in uniqmods) {
++    n = asorti(uniqmods, w)
++    for (i = 1; i <= n; i++) {
++      depmod = w[i]
+       modlist = modlist " " depmod;
+       inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
+       depcount[mod]++
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 4ec7d0b0fc..2c55852ef0 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://script-Remove-unused-fields-from-grub_script_functio.patch \
            file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
            file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
+           file://determinism.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.17.1

