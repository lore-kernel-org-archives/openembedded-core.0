Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id AA9A871C75
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 11:13:33 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b189so1407705wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+cZk7/2tPPlmsCd2Pr50JTT+g7cQ0l/Wfm2WMVvHWSc=;
	b=VMIIRcdniFOh4JcVqh7VL1dVEQaMQCRV6RgWjW5+jK6xBM9hWFW0jfrQRsht9UybVT
	AHAlM6ky7SXIJct+Z7KWMHtdDNyue2RtnUgovrUULWrl+nJ35aV6wMO+gChahwi8cMEu
	7tascKuTh4Q+SadKtaKZ+isuqJd9n70ZsDbAqF6YibVutnWUh0sLY6qKA5vHKp5ypPek
	LXiMJ7kVbYThH/bbqeFaN6BRl1CYqVGhwVReqygCaYORzNdXXohOtfnrqJFtJBpjqm23
	v1IyBkKQKEwpouBtdfLW7Eu0WYeJ2a5scYGGSU79RkpWkSf9eB2M72enLQQT2couJZYr
	KipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+cZk7/2tPPlmsCd2Pr50JTT+g7cQ0l/Wfm2WMVvHWSc=;
	b=DyvZ6nQtqYLZtVxFBbINJ1ocP5zkTmr+oTScW0tIk7Hwn3J+8/D1U3xhnynJrv91OR
	99FtHuKBrsS7RjrQX6P5aT9uMXKvPFRo1FQY8NrCuqXaAnB2W8+6GiAgtvQboauUsYKC
	Ifk9ljIFpindNazHgiNu0lOqcejLGU70b9w8tisePEjS8lGT/VXEjECJMx9NIEh9kIyU
	h94RPDppXsZJBp0N0u/MDPWJ2ysjcNnZD8CTxn3UvuGRXR8HgF1bNvpDJirAR3vh8MNo
	ubzU8ap/XOwJ3DGAUA4s4kwE8ABH/+iDrVB4Ko4N127B2qz3LBKf1tWlpoyjvA3DKd39
	B3IQ==
X-Gm-Message-State: AMCzsaXHUNy0t10AQ5Rz4obMkuuGKbkFUrF1yNNKor1DYQiXUoSuD6uA
	1tttU59udl+H1ZIXVO2vBcnitTI=
X-Google-Smtp-Source: AOwi7QD8daFYCm56sNLn4eCVCwBMIUMjGn5G16bpDR0I/ZTI4CFkqStABiNGb/AjDdMygF5ERmdK7Q==
X-Received: by 10.28.29.215 with SMTP id d206mr13709334wmd.130.1507202014053; 
	Thu, 05 Oct 2017 04:13:34 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C2E3.dip0.t-ipconnect.de.
	[93.232.194.227]) by smtp.gmail.com with ESMTPSA id
	n89sm14509462wmi.33.2017.10.05.04.13.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 04:13:33 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 13:13:21 +0200
Message-Id: <84b0261e538bca3ccc90af070d4cfb7ebcba61bf.1507201999.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libarchive: re-add non-recursive extract and list support
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
X-List-Received-Date: Thu, 05 Oct 2017 11:13:34 -0000

This patch is needed for meta-swupd. Without it, some bsdtar
invocations fail with:
bsdtar: Option -n is not permitted in mode -x

The patch was removed in the update to 3.3.1 with the claim that it
had been merged upstream, but that is not the case.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 meta/recipes-extended/libarchive/libarchive_3.3.2.bb                             |   1 +-
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch b/meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch
new file mode 100644
index 0000000..cd7be51
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch
@@ -0,0 +1,153 @@
+From 47f7566f6829c2b14e21bbbba699916de4998c72 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Mon, 24 Oct 2016 12:54:48 +0200
+Subject: [PATCH 1/1] non-recursive extract and list
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
+index 32710201..59fb4aa6 100644
+--- a/libarchive/archive.h
++++ b/libarchive/archive.h
+@@ -1093,6 +1093,8 @@ __LA_DECL int	archive_match_excluded(struct archive *,
+  */
+ __LA_DECL int	archive_match_path_excluded(struct archive *,
+ 		    struct archive_entry *);
++/* Control recursive inclusion of directory content when directory is included. Default on. */
++__LA_DECL int	archive_match_include_directories_recursively(struct archive *, int _enabled);
+ /* Add exclusion pathname pattern. */
+ __LA_DECL int	archive_match_exclude_pattern(struct archive *, const char *);
+ __LA_DECL int	archive_match_exclude_pattern_w(struct archive *,
+diff --git a/libarchive/archive_match.c b/libarchive/archive_match.c
+index be72066e..bb6a3407 100644
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
+  * Utility functions to get statistic information for inclusion patterns.
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
+index 132e1145..1dd2a847 100644
+--- a/tar/bsdtar.1
++++ b/tar/bsdtar.1
+@@ -386,8 +386,7 @@ and the default behavior in c, r, and u modes or if
+ .Nm
+ is run in x mode as root.
+ .It Fl n , Fl Fl norecurse , Fl Fl no-recursion
+-(c, r, u modes only)
+-Do not recursively archive the contents of directories.
++Do not recursively archive (c, r, u), extract (x) or list (t) the contents of directories.
+ .It Fl Fl newer Ar date
+ (c, r, u modes only)
+ Only include files and directories newer than the specified date.
+diff --git a/tar/bsdtar.c b/tar/bsdtar.c
+index 11dedbf9..d014cc3e 100644
+--- a/tar/bsdtar.c
++++ b/tar/bsdtar.c
+@@ -794,8 +794,6 @@ main(int argc, char **argv)
+ 			break;
+ 		}
+ 	}
+-	if (bsdtar->flags & OPTFLAG_NO_SUBDIRS)
+-		only_mode(bsdtar, "-n", "cru");
+ 	if (bsdtar->flags & OPTFLAG_STDOUT)
+ 		only_mode(bsdtar, "-O", "xt");
+ 	if (bsdtar->flags & OPTFLAG_UNLINK_FIRST)
+@@ -845,6 +843,16 @@ main(int argc, char **argv)
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
++						      !(bsdtar->flags & OPTFLAG_NO_SUBDIRS));
++
+ 	/* Filename "-" implies stdio. */
+ 	if (strcmp(bsdtar->filename, "-") == 0)
+ 		bsdtar->filename = NULL;
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 9e4588f..939c84d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -34,6 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://bug929.patch \
            file://CVE-2017-14166.patch \
+           file://non-recursive-extract-and-list.patch \
           "
 
 SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"

base-commit: a15ec979910a74d4490aecf30aa21fa5c2f4e99d
-- 
git-series 0.9.1

