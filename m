Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFCFC3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 08:00:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.10323.1746691205452061755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 01:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jDcpTL8b;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22d95f0dda4so7947315ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746691205; x=1747296005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMt5VJJ3jpomhYMQ+oXVBaYlCTHx2bUDzmJ5MRmLxus=;
        b=jDcpTL8bzPa/vXmhlsruiRj/8sL4Nhr6MHggozddLCVRnoMfiUCzL7MoZg0223ZQxA
         eCAdWTcQsdiRlsCGEz9sceaP60OOTSVQHaTXk/mA2BWrj6ZzfAHtKfpNaKht+QvuJ3Pd
         v9fvfTapNh+b4rggf91F0bKC1EIOV2xEvpxbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746691205; x=1747296005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMt5VJJ3jpomhYMQ+oXVBaYlCTHx2bUDzmJ5MRmLxus=;
        b=jsAp8ALwTtvW91zpciiQuwQXHztaLO4+SWXb0bW7thDnxqW8jzN3YUaHln3i4Hc8c8
         +RT6df2Y5vlzHpzCql/LcZ1rkMJEcIUQeIAA13ivf5uKQKo7OLbYAgCSumrfqIOiA6cP
         1Kcn9BZ8/h0RUs3I6lpo83Y6MwMdD8eNzlMNmboWyPs/wgO5FbE/wGJsTgavZl45+u5U
         iYZzlzeqU0PGS1v1TobLE10GhFOXVZIaAoE+LFbBy5J09hJ7nlqhm84gwU1kCXzkyZQT
         C37CShdvvZRuv2FLIccPEKCiobNcF2bSXA7jqbYv9hbdhO9V8WX/9SqzfzZe4vXMLC3a
         DfzQ==
X-Gm-Message-State: AOJu0YxA8hkushH9N7SNCJvnHO3ASzABJuT+TcX0AZe+QIs+KHFbEKLu
	6rujNncysj0WFSC7LzvbIQrPFspTaJCiNuHMKMwTieL8Sdru2Hho1kDqGsIccVkaecrWg4bUBeU
	B
X-Gm-Gg: ASbGnctMuABcBH+OOAcLVqTVn+NkaZpxS5gRVmZrv+SBxEMQ9sQbTz+AjGflsClELNP
	URB/HBC0E84l10pCeuLABVfD3ND0uTnrnU+m3JIWHzl099E07baXJOy1mIlz5ovl3W8VNewTIz7
	ICiSP0fqZl0a3ifqkOarjH3kNiJ7+elSMVGxa+ua7TTyHPH/aFF/f1gDSaQbWB4Q+O9n/UtkXJp
	AO+zBkIi05hIqp7/+g49vx9AiHmkQqcZndXOB309crrV8L5IxPP0Fd/ri+4RHEnuleuGFxvMupe
	lsxVvAf5L+Eu07vust+exxHPW/bWs/NZwq6l7LLFCLyJ5LGyw+RD79w=
X-Google-Smtp-Source: AGHT+IFnVBoJt8YeF2XhhIy2r3F5HieRs1drvCxiwAOP5gWbKW0+MiS2K7Z1YlKrMiq1ufkrZHQTfw==
X-Received: by 2002:a17:902:f082:b0:22e:6c96:ebd8 with SMTP id d9443c01a7336-22e6c96edcamr50137785ad.11.1746691204536;
        Thu, 08 May 2025 01:00:04 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152320c5sm105951665ad.245.2025.05.08.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:00:04 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] busybox: fix CVE-2023-39810
Date: Thu,  8 May 2025 13:29:30 +0530
Message-Id: <20250508075930.35810-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 08:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216145

Upstream-Status: Backport from https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../busybox/busybox/CVE-2023-39810.patch      | 131 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-39810.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch b/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
new file mode 100644
index 0000000000..0e7dec4f80
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
@@ -0,0 +1,131 @@
+From 9a8796436b9b0641e13480811902ea2ac57881d3 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 2 Oct 2024 10:12:05 +0200
+Subject: archival: disallow path traversals (CVE-2023-39810)
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
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3]
+CVE: CVE-2023-39810
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ archival/Config.src                        | 11 +++++++++++
+ archival/libarchive/data_extract_all.c     |  8 ++++++++
+ archival/libarchive/unsafe_prefix.c        |  6 +++++-
+ scripts/kconfig/lxdialog/check-lxdialog.sh |  2 +-
+ testsuite/cpio.tests                       | 23 ++++++++++++++++++++++
+ 5 files changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/archival/Config.src b/archival/Config.src
+index 6f4f30c..cbcd721 100644
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
+index 049c2c1..8a69711 100644
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
+index 33e487b..6670811 100644
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
+index 7003e02..b91a54b 100755
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
+index 85e7465..a4462c5 100755
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 6bffbbb5a8..1886410dd2 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -58,6 +58,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-42364_42365-2.patch \
            file://CVE-2023-42366.patch \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
+           file://CVE-2023-39810.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


