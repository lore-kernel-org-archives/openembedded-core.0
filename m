Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB1D600EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 09:40:54 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id c21so379690890ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/JhSUQXZn80yt2WhncqIQ8Dq2dS1QidGM225MznyxTI=;
	b=o2UwCwEWyDnz2OyHfqT/dxbBKbxpoVj1JCDEsI0zT/23VHww/BTLsiGxmtVNUykjtd
	busR598vvRR1Z1eOXqjYKcer7zWTysvEFbl/Bmkneo6gKvF/U8ibDZG+HEDWEDIefprv
	AfkRsLnN08HX1dm0aMUp3VogsafdyTXFcO0fYBcP4jys7nJzMHuWZ4tDvv6yWSe6EaU7
	3KS3WkQqP+Dv04TrdiQq+hJiI/lUjCXyKexTXe53Beb3KnUTkjh2fVLgeXNXf+uYMgnH
	TKwuLFZLzE3llgS0wiT5Qa6rFY632pysr1tR4OMPKB9YDBkMnr01Af3MmaAmoYCYtvCo
	nImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/JhSUQXZn80yt2WhncqIQ8Dq2dS1QidGM225MznyxTI=;
	b=MTS/cE9+R/6GHcb9CQItfrTZXfRuVnoyRd3aPMvSnSaG912myOkEzZuX/voRYGMvTf
	ojrZUY8elPLp288CWgRbAFHhvMwMd3Nkzff1zE2r0w8GiyEYQ85+IyBcDcuescVIMr0u
	9LocHOXHY9fwNA+6M/ptFPtNRSHREftWHwZhxtRX2B27hJdTcV4eNJKc5d7H+y9w5rTp
	ypRaxNDsbSSfaC7tEr21kZkFTx26OG5UC24qHRaB1aQP/HFN/zAuLWk/0m73i4t2CWZy
	vtheYdLBweNM72etF9cstG2ECu0DagDINQwg6+N4ZmStN+eru/z5r83xD3O4/apAlh4M
	lwng==
X-Gm-Message-State: AKaTC020ZSMCaHyHbRb43Ts4zEzgogy8328cWdE1fIGFQqLKU8s9aPz4P6EOH8EZFGdLLvKn
X-Received: by 10.36.57.20 with SMTP id l20mr32679483ita.54.1480585253771;
	Thu, 01 Dec 2016 01:40:53 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56C74.dip0.t-ipconnect.de.
	[87.165.108.116])
	by smtp.gmail.com with ESMTPSA id 130sm4196112ity.5.2016.12.01.01.40.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 01:40:52 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 10:40:46 +0100
Message-Id: <1480585246-3278-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libarchive: enable non-recursive extract/list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2016 09:40:56 -0000

Required for meta-swupd performance enhancements: in meta-swupd, the
so called "mega" image contains a rootfs with all files that can
potentially be installed on a device. Other virtual image recipes need
a subset of those files or directories, and a partial extraction from
a single tar archive is faster than letting all virtual image recipes
share access to a directory under a single pseudo instance.

It may be necessary to extract a directory with all of its attributes
without the content of the directory, hence this patch. Upstream
agreed to consider merging such a patch (see
https://groups.google.com/forum/#!topic/libarchive-discuss/JO3hqSaAVfs)
but has been slow in actually commenting on it, so for now it has
to be carried as distro patch.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../files/non-recursive-extract-and-list.patch     | 153 +++++++++++++++++++++
 .../libarchive/libarchive_3.2.2.bb                 |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch

diff --git a/meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch b/meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch
new file mode 100644
index 0000000..61f8f3e
--- /dev/null
+++ b/meta/recipes-extended/libarchive/files/non-recursive-extract-and-list.patch
@@ -0,0 +1,153 @@
+From d6271709d2deb980804f92e75f9b5cb600dc42ed Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Mon, 24 Oct 2016 12:54:48 +0200
+Subject: [PATCH 1/2] non-recursive extract and list
+
+Sometimes it makes sense to extract or list a directory contained in
+an archive without also doing the same for the content of the
+directory, i.e. allowing -n (= --no-recursion) in combination with the
+x and t modes.
+
+bsdtar uses the match functionality in libarchive to track include
+matches. A new libarchive API call
+archive_match_include_directories_recursively() gets introduced to
+influence the matching behavior, with the default behavior as before.
+
+Non-recursive matching can be achieved by anchoring the path match at
+both start and end. Asking for a directory which itself isn't in the
+archive when in non-recursive mode is an error and handled by the
+existing mechanism for tracking unused inclusion entries.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/812]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+
+---
+ libarchive/archive.h       |  2 ++
+ libarchive/archive_match.c | 30 +++++++++++++++++++++++++++++-
+ tar/bsdtar.1               |  3 +--
+ tar/bsdtar.c               | 12 ++++++++++--
+ 4 files changed, 42 insertions(+), 5 deletions(-)
+
+diff --git a/libarchive/archive.h b/libarchive/archive.h
+index ff401e9..38d8746 100644
+--- a/libarchive/archive.h
++++ b/libarchive/archive.h
+@@ -1085,6 +1085,8 @@ __LA_DECL int	archive_match_excluded(struct archive *,
+  */
+ __LA_DECL int	archive_match_path_excluded(struct archive *,
+ 		    struct archive_entry *);
++/* Control recursive inclusion of directory content when directory is included. Default on. */
++__LA_DECL int	archive_match_include_directories_recursively(struct archive *, int _enabled);
+ /* Add exclusion pathname pattern. */
+ __LA_DECL int	archive_match_exclude_pattern(struct archive *, const char *);
+ __LA_DECL int	archive_match_exclude_pattern_w(struct archive *,
+diff --git a/libarchive/archive_match.c b/libarchive/archive_match.c
+index 0719cbd..6d03a65 100644
+--- a/libarchive/archive_match.c
++++ b/libarchive/archive_match.c
+@@ -93,6 +93,9 @@ struct archive_match {
+ 	/* exclusion/inclusion set flag. */
+ 	int			 setflag;
+ 
++	/* Recursively include directory content? */
++	int			 recursive_include;
++
+ 	/*
+ 	 * Matching filename patterns.
+ 	 */
+@@ -223,6 +226,7 @@ archive_match_new(void)
+ 		return (NULL);
+ 	a->archive.magic = ARCHIVE_MATCH_MAGIC;
+ 	a->archive.state = ARCHIVE_STATE_NEW;
++	a->recursive_include = 1;
+ 	match_list_init(&(a->inclusions));
+ 	match_list_init(&(a->exclusions));
+ 	__archive_rb_tree_init(&(a->exclusion_tree), &rb_ops_mbs);
+@@ -471,6 +475,28 @@ archive_match_path_excluded(struct archive *_a,
+ }
+ 
+ /*
++ * When recursive inclusion of directory content is enabled,
++ * an inclusion pattern that matches a directory will also
++ * include everything beneath that directory. Enabled by default.
++ *
++ * For compatibility with GNU tar, exclusion patterns always
++ * match if a subset of the full patch matches (i.e., they are
++ * are not rooted at the beginning of the path) and thus there
++ * is no corresponding non-recursive exclusion mode.
++ */
++int
++archive_match_include_directories_recursively(struct archive *_a, int _enabled)
++{
++	struct archive_match *a;
++
++	archive_check_magic(_a, ARCHIVE_MATCH_MAGIC,
++	    ARCHIVE_STATE_NEW, "archive_match_include_directories_recursively");
++	a = (struct archive_match *)_a;
++	a->recursive_include = _enabled;
++	return (ARCHIVE_OK);
++}
++
++/*
+  * Utilty functions to get statistic information for inclusion patterns.
+  */
+ int
+@@ -781,7 +807,9 @@ static int
+ match_path_inclusion(struct archive_match *a, struct match *m,
+     int mbs, const void *pn)
+ {
+-	int flag = PATHMATCH_NO_ANCHOR_END;
++	int flag = a->recursive_include ?
++		PATHMATCH_NO_ANCHOR_END : /* Prefix match is good enough. */
++		0; /* Full match required. */
+ 	int r;
+ 
+ 	if (mbs) {
+diff --git a/tar/bsdtar.1 b/tar/bsdtar.1
+index 9eadaaf..f5d6457 100644
+--- a/tar/bsdtar.1
++++ b/tar/bsdtar.1
+@@ -346,8 +346,7 @@ In extract or list modes, this option is ignored.
+ Do not extract modification time.
+ By default, the modification time is set to the time stored in the archive.
+ .It Fl n , Fl Fl norecurse , Fl Fl no-recursion
+-(c, r, u modes only)
+-Do not recursively archive the contents of directories.
++Do not recursively archive (c, r, u), extract (x) or list (t) the contents of directories.
+ .It Fl Fl newer Ar date
+ (c, r, u modes only)
+ Only include files and directories newer than the specified date.
+diff --git a/tar/bsdtar.c b/tar/bsdtar.c
+index 93bf60a..001d5ed 100644
+--- a/tar/bsdtar.c
++++ b/tar/bsdtar.c
+@@ -738,8 +738,6 @@ main(int argc, char **argv)
+ 			break;
+ 		}
+ 	}
+-	if (bsdtar->option_no_subdirs)
+-		only_mode(bsdtar, "-n", "cru");
+ 	if (bsdtar->option_stdout)
+ 		only_mode(bsdtar, "-O", "xt");
+ 	if (bsdtar->option_unlink_first)
+@@ -788,6 +786,16 @@ main(int argc, char **argv)
+ 		only_mode(bsdtar, buff, "cru");
+ 	}
+ 
++	/*
++	 * When creating an archive from a directory tree, the directory
++	 * walking code will already avoid entering directories when
++	 * recursive inclusion of directory content is disabled, therefore
++	 * changing the matching behavior has no effect for creation modes.
++	 * It is relevant for extraction or listing.
++	 */
++	archive_match_include_directories_recursively(bsdtar->matching,
++						      !bsdtar->option_no_subdirs);
++
+ 	/* Filename "-" implies stdio. */
+ 	if (strcmp(bsdtar->filename, "-") == 0)
+ 		bsdtar->filename = NULL;
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
index cf66e9d..64e8983 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.2.bb
@@ -32,6 +32,7 @@ PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://non-recursive-extract-and-list.patch \
            "
 
 SRC_URI[md5sum] = "1ec00b7dcaf969dd2a5712f85f23c764"
-- 
2.1.4


