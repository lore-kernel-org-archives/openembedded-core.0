Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06D8CD4F3C
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:20 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.62090.1725485593524767907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p48z8Zlw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7178df70f28so20697b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485593; x=1726090393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfZ6VdwNK29Ii2DqAA8QglWLE46xgE2hz4tBr75z+wM=;
        b=p48z8ZlwghcIrIfdmowJmw2IrgCJYJzekU1a8JbcET2K9ylyapOj/YQSoqPfOC1X8b
         d3m9dUyQLPHNGaM64IbSNC9WTdqrJI6HKbPYyL/ev1COsZ/Uk09gi1HgHuckPFrKgW7J
         vT+vyYGMlznq9t9/Z6wBgsIJGodG/vHm+Z8otVsnDSDZiPfzItXjCK6HkeSFS7DSnEDU
         iFMAnW6Y0UiJjeq+EkeZNN48wYDTmaTndrKj3QrEzmC1YMwCudwk1kKbdub4MAItaAbj
         VE71BJuQCCd6dnYhdf4rvmSYZD9uoxob2n5ZwYMquDLmhSQwmF4bDnlaoATr5qEnRpkh
         0PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485593; x=1726090393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfZ6VdwNK29Ii2DqAA8QglWLE46xgE2hz4tBr75z+wM=;
        b=JKS304b4w5JWdWiTlk2n+se4KNxlPHcwDUACHzLMQXQUrTxrcSUz6uN19XqtEl+ugw
         jvkZ9IqebVXI+cyBUpc5KVQv76906zmpqn22G+M6evp85jjRE5WhaPI+BmEp8wkkM9IN
         yaXWOQJ2qXKCrcnwAL2ObGaIlyVZ+EXpXlHkTTUh+ZRcXSgtQyrIKyGlDCge5hdOjzZh
         u6b96wLIsrNJ/l6JyRM40w+Ipjbn5V8OH1i79APpPYphAfMoeUTls7ezBZT4Ytmku/ER
         oweNOmSRITn+/qYOovcHONtP4OK4e5kVgeNe3ANVO68I4K6B+g3Wfd3eRO4KXI8WSb4i
         i2mw==
X-Gm-Message-State: AOJu0YzNSN88LC77R0ycxj8s12kQUOJpVuygUubnxTKmDQYylCA8HRnP
	nAL5lKnrf+gikd6srMIOxLcwPBsmWSWavNdJaky1955pkBRwQ5YZLNwZ77GyCJjjBtGiHCIu3GO
	sciQ=
X-Google-Smtp-Source: AGHT+IFxfZJ7hPnlUEMQvyfwgf0uZCp0UX2+eKwJbTFVzVy1eGYsLig45dpx5qTA6aFmcdyVrTB4hQ==
X-Received: by 2002:a05:6a20:e196:b0:1cc:dfd1:2453 with SMTP id adf61e73a8af0-1cce1016eebmr21682328637.30.1725485592737;
        Wed, 04 Sep 2024 14:33:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/14] apr: drop 0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
Date: Wed,  4 Sep 2024 14:32:46 -0700
Message-Id: <c04d1ca0d4f1c7236a5093e7be5ef51633c503fd.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204217

From: Alexander Kanavin <alex.kanavin@gmail.com>

At some point this became unnecessary, as tested by building apr
with DISTRO_FEATURES:append = " ld-is-gold"

The logs do confirm that (previously) problematic binary links without errors.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c041932f14cf552b0446732ce0cca6537f3286ab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...libapr-against-phtread-to-make-gold-.patch | 50 -------------------
 meta/recipes-support/apr/apr_1.7.4.bb         |  1 -
 2 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch

diff --git a/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch b/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
deleted file mode 100644
index 8760b0140c..0000000000
--- a/meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From c6afc4a4a766478cb6aa6b43a50051881b6318d7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 3 Mar 2017 22:24:17 +0100
-Subject: [PATCH 7/7] explicitly link libapr against phtread to make gold happy
- on test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_init'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_settype'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_destroy'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutex_trylock'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_attr_setstacksize'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_create'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_join'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_detach'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_sigmask'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_once'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_create'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_getspecific'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_delete'
-| ../.libs/libapr-1.so: error: undefined reference to 'pthread_setspecific'
-| collect2: error: ld returned 1 exit status
-| Makefile:114: recipe for target 'globalmutexchild' failed
-| make[1]: *** [globalmutexchild] Error 1
-| make[1]: Leaving directory '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/apr/1.5.2-r0/apr-1.5.2/test'
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.in b/configure.in
-index a227e72..cbc0f90 100644
---- a/configure.in
-+++ b/configure.in
-@@ -784,6 +784,7 @@ else
-           APR_PTHREADS_CHECK_RESTORE ] )
-     fi
-     if test "$pthreadh" = "1"; then
-+        APR_ADDTO(LIBS,[-lpthread])
-         APR_CHECK_PTHREAD_GETSPECIFIC_TWO_ARGS
-         APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
-         APR_CHECK_PTHREAD_RECURSIVE_MUTEX
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-support/apr/apr_1.7.4.bb
index d322629b66..4df741c766 100644
--- a/meta/recipes-support/apr/apr_1.7.4.bb
+++ b/meta/recipes-support/apr/apr_1.7.4.bb
@@ -18,7 +18,6 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch \
            file://0004-Fix-packet-discards-HTTP-redirect.patch \
            file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
-           file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
-- 
2.34.1


