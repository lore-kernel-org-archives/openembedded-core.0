Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A847C0218C
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.42242.1737395478889554133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=idSsID3a;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so8472312a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395478; x=1738000278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I3e2C/8Y2jI7mUPRLVmLDaJUyR+uFsK/v0OHPyTaA8=;
        b=idSsID3anWvqluKLNq7p2VCWHNbILuNA0HjdJiJJkcombODEe16PvGN6BGqBqXE0hV
         vLbsjzla47caBVQXXX3w799gUAIGZ+iw77R2WqY4EjymKGHjDr4R9rKjP7vXlsY3dUoi
         XsJhMw05cin0i2+RezC6hxQOq0DC3H35uutF1HKXSvqtmXgJ+cXtqeqKeO0yKPhyVEtc
         zep2O2kyZBxSvyNLmQyfNfp5CQJle6dmdl39kj2yYChiUgYe7u1rzCnvKHEp1hwiNSm+
         r1LUOYanWWQYdUoCNR6RP9Wt1plvotzhtvoolrYPTq6pG5xabCY3uAkd2an215zlPBhz
         XD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395478; x=1738000278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I3e2C/8Y2jI7mUPRLVmLDaJUyR+uFsK/v0OHPyTaA8=;
        b=oZsCKGJEJkgrxmej+ibLhrJ2mdv24Cwj1TBmZ69t1HzUoArbV7/DNMkRLiQsFzHzG7
         A/1qqD8cPUwHfWMdEASyAxGyfvKtHCJfC81fBIycfK89eqfcb/JoPEMhPJyopcCeAIo3
         R/uEdBwveCTN1U7iZVMFJQyuphOOdnbjGvS6Cl5xd4QZkeS7TIo6EBkkPFImovB1PZ+L
         CaqW3P2jn0nRqNF3eN9mi2lLBzEKdeH3sSe5qol0HaGbpQmBo+r7QGOuA7RjMLNsJMYG
         TcZuSRGYP1tGBozf83/oj3etarHMpaUnC4IvNLESCHia6skfzuvHR3e7ztmOmApErFJ3
         7dXQ==
X-Gm-Message-State: AOJu0Yx6PYhvg4iM6GdpUwgeAECFOAZ9Fi1uTByxnP4JQ8jXlNbstLLc
	dTGEdUwa1WOlb6pakskxf9pyME59ldXiSqmBlrN8AmASmkA+4QO3JwV2y8/KsT6uPLseza/RkI5
	HCOA=
X-Gm-Gg: ASbGncuUWNfHF0fCEBDaAekIQGOyqxwHHppDB49+NOYnZ7BMvZamGXAUZlvWnmNmXNH
	A8TfcflFW+t00u/R+T1QUuTO6TU4ZNCMTgHBPLIgetC4qB4gPIEm6B7DBSLE7xLz6pCM3MEpoAH
	zK5n/pBR20fDJpw5EMdwbqysYWJnFj4nrDEWUoiJFt59LiAvvHEsugB9ut082HGcxb/XOKqa3ls
	X31gNBzNDeN9Oi5R1/ugRfBKNs+6spWvY70O39I94+9nL0MBo2ClmMMJ1g=
X-Google-Smtp-Source: AGHT+IGlwW93La+Jfqdw4jeA2dJMHDSJDxxNfGBh8y+nj5bWXFBj6fBO2H1iV3ZE5RmBhoSvFHPuwA==
X-Received: by 2002:a17:90a:c883:b0:2ee:f46f:4d5f with SMTP id 98e67ed59e1d1-2f782c669admr18616169a91.6.1737395478065;
        Mon, 20 Jan 2025 09:51:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] rsync: Delete pedantic errors re-ordering patch
Date: Mon, 20 Jan 2025 09:50:50 -0800
Message-ID: <3746c60f38a6cf99f293131b8b1bfed7c73a1944.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210050

From: Khem Raj <raj.khem@gmail.com>

It has been fixed by removing the check upstream see
https://github.com/WayneD/rsync/commit/9a3449a3980421f84ac55498ba565bc112b20d6c

(From OE-Core rev: c6228b8371ea5c3c452db7b536948ae96d83844b)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 84052d0ff1..53c2136f4d 100644
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
2.43.0


