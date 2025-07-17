Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62446C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:21 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.40512.1752721154553339102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZKBHxd3+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b170c99aa49so318812a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721154; x=1753325954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWXBKeW/N8EWFA2XQbxvAh1u3gOenNOzzH68B8S/jzk=;
        b=ZKBHxd3+H9yTLXFiUDzCXn8Nj6Kc0BRy9iFL8Wsss79r9i+iAX71rdaZrBpZiKwdp4
         oKdqjhjdS4ym/83pRt1asAKJtrRUBv1sYcm+d99+6Nx3rhHtpfGsyRmxr1bUWXvuryRO
         g/p/2gTn8VyQBmYSCxUewhn/HN19UNuLHbpJPF+gB8jfmh6fV1O//UKOaJx1jrfD0kFo
         pqaXk5f9EEqXQ/XSI731GySDMIq9zwQJbwt2cOxnZSELkRGoL4YQt5Z+cpri8BdFlQ1e
         FGnZK1r+IBsTTGSkiJ3e4dXt5gPdVts2IZpJzUb/Lnq0JPcZFPbZsnLsUYyAONpcT80C
         8mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721154; x=1753325954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWXBKeW/N8EWFA2XQbxvAh1u3gOenNOzzH68B8S/jzk=;
        b=GLawaT7DK+t3/DPYmXw/sfkMTgU6IChvdpFA5pn48Mgmr6OSg0l1HGM/VUbi7VnpP8
         16ELZiYcgCqBfNdeC4cVQW7xtIKQP0oftr1k0ZmwhBV/kd8okL0+c2Tg0lLm+OP4blEr
         5iv2VMmY7zkc2JkTQRJV6vuLnF+WC/B3reM7ZaRhg0RF+MInnYM3nFSxsnY5Ra11AJ1B
         ee6afRW4hvdy6sGDPMerveXf2utb6dA+Z29dDcwckNIq2PktXYfYxEUkscfZM0G5PlAk
         DIj2c4bTvZB9RU8ucGEfk9AIgpDaY6tOg+EHtCO9Mvm7/gCVxLA+gXw6eAiVJd0eYooP
         zsgQ==
X-Gm-Message-State: AOJu0YwgsRjzUhgFMw1y81jkTKhWVHLmiYquOdOXmC8gXJxr/6gc2wvY
	TrHQdvGpJVJjoTxZK7cmrkg0mUGoDlOFibTNURm+/cR9qmRpoEjNIKylRLz/VAa8GWcIWJLFKVX
	c/E1nns0=
X-Gm-Gg: ASbGnctPkPA5qxJhOcs/7x38ib95C4I9/DlQyWYnoCNzoGkHtgvxZxwxUyLVoruDTa2
	dt2Ypd7oFhcHGcZ3nMFDh+5e+cDYtpY9eAMovf2tRUQF7VTDHLU5sX9hb8wQgKuOA9Y18NU162I
	CLyvDP5G09cfClunmXmVWcP0O89TIQ0JJ9N1EWVurg8CvnBpXV0kJRymKAIfShi56L2c+DNi3qq
	lG7SAg80FWC/eBnclrWO2tU/PxbVIeCB2n8ZTC9+VGlDMdUvsFbE0vnHIqX/s0BUtWzlvQAdplx
	VzAMPPanHieHDhPNyD/KFrSXUKfnDOaDX/9Tn+bpkbyHIuuQUnP6TWvrXgvi7ShipDK2QPTRcDp
	ddp4+dkNbrmvguw==
X-Google-Smtp-Source: AGHT+IEIm+KeM55mepwjv1dzLp500xFa+X+5li9Y/z7ZEVdlgDvzaykgpYp6NJqo+DOEM0mdg1d1fQ==
X-Received: by 2002:a17:90b:5447:b0:311:ba2e:bdca with SMTP id 98e67ed59e1d1-31c9e76f0cbmr7570386a91.28.1752721153616;
        Wed, 16 Jul 2025 19:59:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/12] busybox: apply patch for CVE-2023-39810
Date: Wed, 16 Jul 2025 19:58:51 -0700
Message-ID: <3f2b235526d135094408e3895c01bff7b5b938fb.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220503

From: Peter Marko <peter.marko@siemens.com>

Backport patch referencing this CVE.

Note that the hardening is not activated by default, it adds defconfig
option to enable it.
Since it introduces a breaking change, it shouldn't be enabled in LTS
release by default.
This patch makes busybox cpio equivalent in this release to what is
currently in master and in kirkstone.
Also note that gnu cpio also does not have this hardening, but the CVE
is created only against busybox.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2023-39810.patch      | 136 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-39810.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch b/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
new file mode 100644
index 0000000000..821ab3508f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
@@ -0,0 +1,136 @@
+From 9a8796436b9b0641e13480811902ea2ac57881d3 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 2 Oct 2024 10:12:05 +0200
+Subject: [PATCH] archival: disallow path traversals (CVE-2023-39810)
+
+Create new configure option for archival/libarchive based extractions to
+disallow path traversals.
+As this is a paranoid option and might introduce backward
+incompatibility, default it to no.
+
+Fixes: CVE-2023-39810
+
+Based on the patch by Peter Kaestle <peter.kaestle@nokia.com>
+
+function                                             old     new   delta
+data_extract_all                                     921     945     +24
+strip_unsafe_prefix                                  101     102      +1
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 25/0)               Total: 25 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2023-39810
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ archival/Config.src                        | 11 +++++++++++
+ archival/libarchive/data_extract_all.c     |  8 ++++++++
+ archival/libarchive/unsafe_prefix.c        |  6 +++++-
+ scripts/kconfig/lxdialog/check-lxdialog.sh |  2 +-
+ testsuite/cpio.tests                       | 23 ++++++++++++++++++++++
+ 5 files changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/archival/Config.src b/archival/Config.src
+index 6f4f30c43..cbcd7217c 100644
+--- a/archival/Config.src
++++ b/archival/Config.src
+@@ -35,4 +35,15 @@ config FEATURE_LZMA_FAST
+ 	This option reduces decompression time by about 25% at the cost of
+ 	a 1K bigger binary.
+ 
++config FEATURE_PATH_TRAVERSAL_PROTECTION
++	bool "Prevent extraction of filenames with /../ path component"
++	default n
++	help
++	busybox tar and unzip remove "PREFIX/../" (if it exists)
++	from extracted names.
++	This option enables this behavior for all other unpacking applets,
++	such as cpio, ar, rpm.
++	GNU cpio 2.15 has NO such sanity check.
++# try other archivers and document their behavior?
++
+ endmenu
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 049c2c156..8a69711c1 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -65,6 +65,14 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 		} while (--n != 0);
+ 	}
+ #endif
++#if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
++	/* Strip leading "/" and up to last "/../" path component */
++	dst_name = (char *)strip_unsafe_prefix(dst_name);
++#endif
++// ^^^ This may be a problem if some applets do need to extract absolute names.
++// (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
++// You might think that rpm needs it, but in my tests rpm's internal cpio
++// archive has names like "./usr/bin/FOO", not "/usr/bin/FOO".
+ 
+ 	if (archive_handle->ah_flags & ARCHIVE_CREATE_LEADING_DIRS) {
+ 		char *slash = strrchr(dst_name, '/');
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 33e487bf9..667081195 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -14,7 +14,11 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp++;
+ 			continue;
+ 		}
+-		if (is_prefixed_with(cp, "/../"+1)) {
++		/* We are called lots of times.
++		 * is_prefixed_with(cp, "../") is slower than open-coding it,
++		 * with minimal code growth (~few bytes).
++		 */
++		if (cp[0] == '.' && cp[1] == '.' && cp[2] == '/') {
+ 			cp += 3;
+ 			continue;
+ 		}
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..910ca1f7c 100755
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -55,7 +55,7 @@ trap "rm -f $tmp" 0 1 2 3 15
+ check() {
+         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main() { return 0; }
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+diff --git a/testsuite/cpio.tests b/testsuite/cpio.tests
+index 85e746589..a4462c53e 100755
+--- a/testsuite/cpio.tests
++++ b/testsuite/cpio.tests
+@@ -154,6 +154,29 @@ testing "cpio -R with extract" \
+ " "" ""
+ SKIP=
+ 
++# Create an archive containing a file with "../dont_write" filename.
++# See that it will not be allowed to unpack.
++# NB: GNU cpio 2.15 DOES NOT do such checks.
++optional FEATURE_PATH_TRAVERSAL_PROTECTION
++rm -rf cpio.testdir
++mkdir -p cpio.testdir/prepare/inner
++echo "file outside of destination was written" > cpio.testdir/prepare/dont_write
++echo "data" > cpio.testdir/prepare/inner/to_extract
++mkdir -p cpio.testdir/extract
++testing "cpio extract file outside of destination" "\
++(cd cpio.testdir/prepare/inner && echo -e '../dont_write\nto_extract' | cpio -o -H newc) | (cd cpio.testdir/extract && cpio -vi 2>&1)
++echo \$?
++ls cpio.testdir/dont_write 2>&1" \
++"\
++cpio: removing leading '../' from member names
++../dont_write
++to_extract
++1 blocks
++0
++ls: cpio.testdir/dont_write: No such file or directory
++" "" ""
++SKIP=
++
+ # Clean up
+ rm -rf cpio.testdir cpio.testdir2 2>/dev/null
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 69e9555766..069544cc8a 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -58,6 +58,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            file://CVE-2022-48174.patch \
+           file://CVE-2023-39810.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.43.0


