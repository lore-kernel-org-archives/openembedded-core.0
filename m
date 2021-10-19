Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61022C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:20 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.15530.1634673319467590067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bGh8JFTf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id t184so950062pfd.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sUya17hNj/K3f4JURRjXusb5m7u20Zb6ka3G51YMHpo=;
        b=bGh8JFTf1y29cxOB4o1RPLLC74DYlWDIOaZoX1uo+5cCr0vfrPn2AVvhnRV11qsPjs
         U3PbyqFGtNN7VyQ8KYZes6jm7xnGMRkeQTUM6c6OZrG4XBFqQT1/gccwZFYorpb6p7Bx
         90lt1mfjkg5NCiCkGONtodSkvfSoTIe+BreIkS7W9hklolbNpZN5VAiDZBuDmMGfFi1y
         e08A+55s4dG71DUh6t7hGCDBsPFuHbplFa9MrGExWUTmT9Ak+CfPsx5D6ihs8Gry6xe/
         LaaEKyAdKpRdEUv6+NEU7mKOAEd3slF5oG1AQvnbqiFi85I7R+Gl76VLJdW5qa3qc+cn
         1jEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sUya17hNj/K3f4JURRjXusb5m7u20Zb6ka3G51YMHpo=;
        b=TxWXNgwB5yx/7qzjn0YQGJN7kDiWY2omKRJ+xSjE5ON4XWaBwQaxG3VzO6NEjCATeF
         KwDCw8kZy0JE0/yajKIH3LRHrA0tRIx5zcMLEoAEMwlvrs2k9nPRFis2MrHQdvewGA+Q
         xJe4HraBXi6DXgoSq2Fei75HulwdP2jGfbXoBj1+FkWLYoSEvUELmmqxIFHBCQmXBxj1
         QyLzkvse3kFzRGO2A2AgEqBjyj6qHNOsQlf+QrOqBXjn41UkEV1uuV3cZU5cf09OWMtw
         NOnmKCYn6fwCXPihX8im3ah8yOH+cOLs34btskHlUuJ8LLLR01KpZdKTAcFnUXmA/xZN
         9f+w==
X-Gm-Message-State: AOAM532Z7/168zOG3VwIoBgSf0k8OLYfpqDyNUbSk97S3bjoRZFBb555
	la7Qu/hXTxx+7eNOVKJeHV6cNUGstahr/96MCTg=
X-Google-Smtp-Source: 
 ABdhPJxgKTaNdzjpLyir+R/4kuUFGwIanJ98W3HTFr30RhYcgxgf+iBVfOoLEbTkzQElMMePNuHISg==
X-Received: by 2002:a63:f62:: with SMTP id 34mr29991023pgp.159.1634673318542;
        Tue, 19 Oct 2021 12:55:18 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/38] libtool: Fix lto option passing for
 reproducible builds
Date: Tue, 19 Oct 2021 09:53:41 -1000
Message-Id: 
 <3dcc84e37ce7e94e746304ee2a4437251af0ae41.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157235

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If lto is enabled, we need the prefix-map variables to be passed to the linker.
Add these to the list of options libtool passes through.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c26d2c00b47df856fb2d9c35486b135094d46ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 .../libtool/libtool/lto-prefix.patch          | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/lto-prefix.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index e9225e140c..1bac81331d 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
+           file://lto-prefix.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/lto-prefix.patch b/meta/recipes-devtools/libtool/libtool/lto-prefix.patch
new file mode 100644
index 0000000000..2bd010b8e4
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/lto-prefix.patch
@@ -0,0 +1,22 @@
+If lto is enabled, we need the prefix-map variables to be passed to the linker.
+Add these to the list of options libtool passes through.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: libtool-2.4.6/build-aux/ltmain.in
+===================================================================
+--- libtool-2.4.6.orig/build-aux/ltmain.in
++++ libtool-2.4.6/build-aux/ltmain.in
+@@ -5424,9 +5424,10 @@ func_mode_link ()
+       # --sysroot=*          for sysroot support
+       # -O*, -g*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
+       # -stdlib=*            select c++ std lib with clang
++      # -f*-prefix-map*      needed for lto linking
+       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
+       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
+-      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*)
++      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-f*-prefix-map*)
+         func_quote_for_eval "$arg"
+ 	arg=$func_quote_for_eval_result
+         func_append compile_command " $arg"
-- 
2.25.1


