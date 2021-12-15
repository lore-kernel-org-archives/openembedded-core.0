Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D8FC35269
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.2680.1639608052543776803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6TXkHZl;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id s1so6595564wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0VbPpNWvXk1VXRchLeftTF893RfQmhgn1OqKLZcpwwc=;
        b=G6TXkHZlWgKWsAr4JN8y6e4koCaJFaFy21NZ7KBSilBNqaRsB+FOvQMk7fbzfo56AH
         mYchggxLJycYomWjE8mB5iVoSKZQeGFkNCfTtzd7oSj6jenE4j/rJJS7O5meMLXvfsV5
         lpU4fVfL7huLLiWvCopdaNzKEKPyOZtysEeUR6Nz4Aq6mnonbvBXkzeSlIKYrqs4/XRa
         g6fhT/Q2bbhK3hxaUEabcpY090FIRlMQ7YdrIEcSLupJmCfSYGPrbnKTmNyISspKfngo
         k8tguTESttUzTWOE8LYc1TKghoMwIth1yUKL8qk2ux/QgL+sBnpy7CJk3w3KVo36G8sr
         Vdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0VbPpNWvXk1VXRchLeftTF893RfQmhgn1OqKLZcpwwc=;
        b=2zQTpEPVZPRY780iKEbfk6EgjkV2ZlXhdkC4e/Z8u09TS1u6HR0bxQ1r4RX/j/qQx+
         YvIkFTHjdNNEtg6YTLGQKtXQ7DLNvW9kb5ru0Lp86KN1nJ3Mbh4MlWoFNbc6oRI/kud3
         /PHx54L1CZsByDgWcnniwLBw0eljRtx7a9u9wT8t0CXTqc0EwGQy7qTygma+pNL/Iq7S
         ay79uh7lMM0mefw4qq3nWKsQd3HbSB4beO16LPGTJeDoVq5AMEAv3ycM7Y0cgjbGcxsN
         ad9eiey7BP1TzXKtpiPVumJp1MsrK0hWOnzOFhEjotqg7OJ369V/YVIlFE3ByXhT7v9T
         fjgw==
X-Gm-Message-State: AOAM533KOM9My7es6+/zJp8FXF41j2lt16kbPIde1qt6oxD1D/YawbM6
	aidzMG677E4LZ/mZnnOo4Ayy5Qg/Nz+HYw==
X-Google-Smtp-Source: 
 ABdhPJwRdDojYGZDFAJq5GetBkydbMhETgf5z6maqa9cQcBPlrUtFH3QLTqpqdfauAauxVh7WluQeQ==
X-Received: by 2002:a5d:4588:: with SMTP id p8mr1191066wrq.106.1639608051184;
        Wed, 15 Dec 2021 14:40:51 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/26] libptytty: add recipe
Date: Wed, 15 Dec 2021 23:40:27 +0100
Message-Id: <20211215224034.1814148-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159761

It is a dependency of new rxvt-unicode.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...akeLists.txt-do-not-run-cross-binary.patch | 24 +++++++++++++++++++
 meta/recipes-sato/libptytty/libptytty_2.0.bb  | 13 ++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-sato/libptytty/libptytty/0001-CMakeLists.txt-do-not-run-cross-binary.patch
 create mode 100644 meta/recipes-sato/libptytty/libptytty_2.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8e86ea45d2..4fe655fdcd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -373,6 +373,7 @@ RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libpsl = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-librepo = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-librsvg = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-sato/libptytty/libptytty/0001-CMakeLists.txt-do-not-run-cross-binary.patch b/meta/recipes-sato/libptytty/libptytty/0001-CMakeLists.txt-do-not-run-cross-binary.patch
new file mode 100644
index 0000000000..d3a458f100
--- /dev/null
+++ b/meta/recipes-sato/libptytty/libptytty/0001-CMakeLists.txt-do-not-run-cross-binary.patch
@@ -0,0 +1,24 @@
+From 989ae1f3651686c1f1046fe1c1596d564c3f452d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 13 Dec 2021 14:33:01 +0100
+Subject: [PATCH] CMakeLists.txt: do not run cross-binary
+
+Upstream-Status: Inappropriate [issue reported at https://github.com/yusiwen/libptytty/issues/2]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c1ad6c0..3bd4d97 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -271,7 +271,7 @@ if(NOT HAVE_UNIX_FDPASS)
+   message(FATAL_ERROR "libptytty requires unix-compliant filehandle passing ability")
+ endif()
+ 
+-check_c_source_runs(
++check_c_source_compiles(
+   "
+    #include <grp.h>
+    #include <sys/stat.h>
diff --git a/meta/recipes-sato/libptytty/libptytty_2.0.bb b/meta/recipes-sato/libptytty/libptytty_2.0.bb
new file mode 100644
index 0000000000..85e3a36fba
--- /dev/null
+++ b/meta/recipes-sato/libptytty/libptytty_2.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = " OS independent and secure pty/tty and utmp/wtmp/lastlog handling"
+HOMEPAGE = "http://software.schmorp.de/pkg/libptytty.html"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+SRC_URI = "http://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
+           file://0001-CMakeLists.txt-do-not-run-cross-binary.patch \
+           "
+SRC_URI[sha256sum] = "8033ed3aadf28759660d4f11f2d7b030acf2a6890cb0f7926fb0cfa6739d31f7"
+
+inherit cmake
+
+EXTRA_OECMAKE:append:libc-musl = " -DWTMP_SUPPORT=OFF"
-- 
2.20.1


