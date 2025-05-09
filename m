Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32265C3ABCD
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:17:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2678.1746807448995702620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1l2aNzuf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736c277331eso3105514b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746807448; x=1747412248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeaclxEUQce0hDgu+eMk8FUUtf88ErpM48v04G1X71A=;
        b=1l2aNzufIyOZnlM3JMAYO7Zud0jni2RCta2kn682Sdb2x9SQ3aIkCmOLuQiyguddh8
         8sR2O6VpBW5wDun68damxl9NRQUY3pQQj3bUJADJLjxqpZwfCQG6jJgJTfmMytjfqIg4
         Py7pKmm+EpvgDpDqNZRZHK2Gv+ZbdjTx+iz5tqh0ekwGOM4lhXaJi2//waepwE30/AsI
         fjofLH6Qo9ZZykXnnsRfuFwzH4jzHDM0Iku2KlKyLmEc+kC1BwGIfo1bNSho2fdUTxce
         SFDlMb/Hv7HXvZwcGoMArUh9nINCMr5Exw6XClfkmomhTeHcAbiZZ1Eg9OmQZzKMNWVV
         ncyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807448; x=1747412248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeaclxEUQce0hDgu+eMk8FUUtf88ErpM48v04G1X71A=;
        b=hCBHi1r3O0IkEgSX1hdsrOO4shblvtkfQk+4tHzNhH7FnVHVWlNRrtiav7CV4qZrIp
         9aMEF/7HSrPYh4IH5DTltL40mpx0JVOFmHi3RIT0kTcQKkxz4JP1M0Pr3z+9H2yquKcT
         DztxMnA6RZfwIAslhA3EB/A/dYptMALS3X1zch3zobOcGZ4G+hUTUNoDhGSgPJdC0Vd2
         q4ZDFyqt8V62WLg1hSbrYTzUHRhTk8U05cF7y3uEC/kGYqb7au5CLBZ/cjrkQMrx14zy
         4mpPU3R8dAtut56X5HYy/QEa+Ul0Vi7HCfBsX2dZZbVsInmsO4W2+N0gIzxfCKP7pbjx
         3c/w==
X-Gm-Message-State: AOJu0YyYpjXl0cCmSaZFU+1KBvUe8T5WAUQK4YrcwqHtsMDLVkA+jwL1
	cPMTpaxO2BulZJVtMqdbCIm58FPdfhuGW/WQHEviA8deJDcMf2wtG/UB5HAfgRqgaFhLD9MTge9
	x
X-Gm-Gg: ASbGncsFHDDTubduTkSbEH5UhhG3TKyRXEqz943pLCQ0H3jR6O6AADENDkRhBVMeP1p
	B1UnJSWUqZu3jj4VowatR/k9BPtIe8OhCFMlKeHHlX8rq/4DtKr2PJ3V64nGKJbWW7tmGE2DRjF
	pzqHjxl7PeKXD2g1OEpTjFrngtkUDoeEBgyLwVKaYLO0dhqexQnc4x6lgJyBoyLVwY2jjxQR++4
	4PSZYiWwg3TxRoJyp2z5pMrpk4JIPAl+zR9TFRgAjz+vyb3PuhTv19i7UFv9sh77OhIzRxt5DLz
	WwNgwik6W2P38uEapZO1R5/1/iygACl+
X-Google-Smtp-Source: AGHT+IEXI/C1/TrlnMPoh0WqJ/JB3fwTFpHaLuf1XTcVfR6Bo8lKrU1mr7odOlEI9T/GSPGMyMbIAg==
X-Received: by 2002:a05:6a20:3d07:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-215ab4aba06mr5563302637.1.1746807448059;
        Fri, 09 May 2025 09:17:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050fesm1919134b3a.24.2025.05.09.09.17.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:17:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] busybox: fix CVE-2023-39810
Date: Fri,  9 May 2025 09:16:42 -0700
Message-ID: <c0b71ec35716a512915b00808a26f77481db0e0a.1746806788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746806788.git.steve@sakoman.com>
References: <cover.1746806788.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216240

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


