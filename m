Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5058C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 21:59:45 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.9418.1669240784718368457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 13:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jUhZPiQH;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id w79so778235pfc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 13:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=05fh17hzP30GZgmm2KnrAJfq05hZATNqmkd+cbFU6M4=;
        b=jUhZPiQHzcuZxZzsxkr8i4M5CdB8QijXwS/f4uPTw8qzQogdDofN/C3xrw2DpyBsZC
         q0Hs8XsvuDl4Of88u4ZibyqIvwUgCusPqHrqqeCNHCGRDgafCJXms5DbSgpi0W+esSOV
         gLl8ymnLaKWOWvqWUV9NzU2nWZ/d61vY6PBWGPUr/ubcFJeCutoaSGQ7KzO13rBL9BX+
         BEiJu1/mFUV8QUkkUNDsQdSv4TQMZ4a76GjFVCBarhcTw1aVgYy44O6ev1SIkJEcSFTK
         VbRewY+Up+NjXa2q4EN3s2Fv5Bgv6tch+g4//VxBKEXAicO2qMVDjCK62LmZk7AQmnB2
         jBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05fh17hzP30GZgmm2KnrAJfq05hZATNqmkd+cbFU6M4=;
        b=PchWiSebJ8D4ON/xWlj3v4KE6nj7+OO2WN88kvRWkn3NxdzuFvZ5oKQfr7it6YQk4y
         f4gku+hxkd0bKVH7sU7yxmhvQT93uL8u6TCd5095IGf9D182m2o6EUWU3ESMiDri2+NN
         up9zPBKElgVpnWJ/skS8M/2q0ffq632USjTsYaUUrZBeh/9ljTOr0j4Aef6XL4Cu47xg
         /inZyld5AIkLRYu1rwowXPKdgjtxri64iV9CpcnwE+k8MDUHb1Zl49GMX5jP6x2Fqxzm
         dD8I06eHAKQHIv+zR0hAkPThlDrENC/YLOQBDAyyEsx/0ZEq2P/gQRw7lXVSf+U+dm6s
         fIzA==
X-Gm-Message-State: ANoB5pmP8DJmp1qB05rReDYTiWt+z/H1/sRQxZOcX2nJvmZ1WonKlpWB
	hDDvmJEpywlOqE6pOB8j4u2pJQdx9ZE=
X-Google-Smtp-Source: AA0mqf7K81Yg57uz9Hk5RKdGk0NcG+LOS/+eHS9bidad60KdvRmAHgooc7GvdvF3gD6UytF0ZwYjtg==
X-Received: by 2002:a63:4944:0:b0:46f:ec9f:dcb0 with SMTP id y4-20020a634944000000b0046fec9fdcb0mr11809102pgk.202.1669240783779;
        Wed, 23 Nov 2022 13:59:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id p1-20020a170902e74100b00178b6ccc8a0sm2555159plf.51.2022.11.23.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:59:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rsync: Delete pedantic errors re-ordering patch
Date: Wed, 23 Nov 2022 13:59:41 -0800
Message-Id: <20221123215941.2411460-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173729

It has been fixed by removing the check upstream see
https://github.com/WayneD/rsync/commit/9a3449a3980421f84ac55498ba565bc112b20d6c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...antic-errors-at-the-end-of-configure.patch | 44 -------------------
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
deleted file mode 100644
index f11f13dd48..0000000000
--- a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e6321b0b456fca987b48d5ec7aba7e2826128e5f Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 18 Aug 2022 07:46:28 -0700
-Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
-
-Problem reported by Khem Raj in:
-https://lists.gnu.org/r/autoconf-patches/2022-08/msg00009.html
-Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032862.html]
-
----
- configure.ac | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index a2c9955..afabef0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1437,6 +1437,26 @@ case "$CC" in
-     ;;
- esac
- 
-+# Enable -pedantic-errors last, so that it doesn't mess up other
-+# 'configure' tests.  For example, Autoconf uses empty function
-+# prototypes like 'int main () {}' which Clang 15's -pedantic-errors
-+# would reject.  Generally it's not a good idea to try to run
-+# 'configure' itself with strict compiler checking.
-+if test x"$GCC" = x"yes"; then
-+    if test x"$with_included_popt" != x"yes"; then
-+	# Turn pedantic warnings into errors to ensure an array-init overflow is an error.
-+	CFLAGS="$CFLAGS -pedantic-errors"
-+    else
-+	# Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
-+	# turn off pedantic warnings (which will not lose the error for array-init overflow).
-+	# Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
-+	# -Wpedantic and use that as a flag.
-+	case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
-+	    *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
-+	esac
-+    fi
-+fi
-+
- AC_CONFIG_FILES([Makefile lib/dummy zlib/dummy popt/dummy shconfig])
- AC_OUTPUT
- 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index e52699d24f..19574bcb1c 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -15,7 +15,6 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.38.1


