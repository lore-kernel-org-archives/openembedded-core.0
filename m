Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FE7C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:15 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.3063.1683671580387701849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=H+hTSgYQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6436e004954so6692285b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671588; x=1686263588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7pGfHkyzIwQnok8P5aOFE8KQ39q4JJ2Ndh+/VDqX+Y=;
        b=H+hTSgYQ5NdUFwJj6IZnrsiezXx8bvOcSOT/f9MDpxU1rrzlUWoz80/lZ037bkKuwG
         VdWbk2r/zN5jzNo0/6a2+/7bDfxlau59rVni5Bhoy9x7KIF7JX0CpQEzXpbQJ1gVZ8zB
         BJ50ZzTUmoGay/UdPcywMOCQVJFnuEpmxjx611pK8i74L++F673muGhL3pgmWrbC3vHY
         A9UNjynBYl41XXrcXYRNCcIHXAcYXbVPzlFAqjzHMZtSVdmzlj7RBG9H+tCkPQ5ttBXY
         tvTsaRv9lUTVHky52feDZjxLufDpcjUfbxlTwVjlH+j3UuJ8lwxMpmHrLsHlUHcPCOBd
         TMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671588; x=1686263588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7pGfHkyzIwQnok8P5aOFE8KQ39q4JJ2Ndh+/VDqX+Y=;
        b=U4jM3Jc805GIZS/FrustlDzGABjORWorf21tTdTL/dQnwPSQBigUojs6dKCH4I9nrP
         HaiwTZP2jrCioD4MGska2wpxO0F+z53M2sQp2Ykgblptlx9RcM8Ap8lnfemU7zFdSM2w
         zQI7G2azbnk6W7wD8Y22We+DuBimg7ZZiNf9twh1IYSfA7oB4Iu4okqFGtaGZ/n8bfXg
         nDR7aDk4ES8lOAuL+QfP6bUpKEbTUSXavYXSsGEtX8IBdLWfwNQCli3e3nUHhtNlSlpd
         4cOY8ncHuknf6ilu4FFE8jCouaVjLcVe8c1fiAPREKQiGt2wl+kT+j9FELCf2B3/yOqE
         JOsA==
X-Gm-Message-State: AC+VfDxln1NGJxXnaCNwIqvMENfJxt9S5bllLPKoiNVXtE4uIJKa7gFD
	aBo0y3tzKJQXUcmOSAA/fMiVN2tGfyCquJigaYI=
X-Google-Smtp-Source: ACHHUZ4/w9DSxwXl0J7V/xzX6RdPiA5OvS+fyGGlEfrUDbojV/msQPfy03Ahax+Tthp0cVqU1A7UDQ==
X-Received: by 2002:a05:6a00:14c8:b0:63d:2d8c:7fd5 with SMTP id w8-20020a056a0014c800b0063d2d8c7fd5mr21198122pfu.12.1683671588193;
        Tue, 09 May 2023 15:33:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] libpam: Fix the xtests/tst-pam_motd[1|3] failures
Date: Tue,  9 May 2023 12:32:38 -1000
Message-Id: <1b3bf8233c30ef2e559102210e0bfd3fac958f17.1683671424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181097

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Reproducer:
1.Enable the ptest of libpam and build the image.
2.Boot the rootfs with nfs, then run the following tests as root:
 cd /usr/share/Linux-PAM/xtests
 /usr/share/Linux-PAM/xtests# ./run-xtests.sh . tst-pam_motd1
 /usr/share/Linux-PAM/xtests# ./run-xtests.sh . tst-pam_motd3

After applying this patch, the ptest doesn't be failed.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 549e54ad6a175359b0a57987ccdab8989df9d3a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rely-on-all-filesystems-providing-a-.patch | 108 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch b/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
new file mode 100644
index 0000000000..94dcb04f0a
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
@@ -0,0 +1,108 @@
+From 42404548721c653317c911c83d885e2fc7fbca70 Mon Sep 17 00:00:00 2001
+From: Per Jessen <per@jessen.ch>
+Date: Fri, 22 Apr 2022 18:15:36 +0200
+Subject: [PATCH] pam_motd: do not rely on all filesystems providing a filetype
+
+When using scandir() to look for MOTD files to display, we wrongly
+relied on all filesystems providing a filetype.  This is a fix to divert
+to lstat() when we have no filetype.  To maintain MT safety, it isn't
+possible to use lstat() in the scandir() filter function, so all of the
+filtering has been moved to an additional loop after scanning all the
+motd dirs.
+Also, remove superfluous alphasort from scandir(), we are doing
+a qsort() later.
+
+Resolves: https://github.com/linux-pam/linux-pam/issues/455
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/42404548721c653317c911c83d885e2fc7fbca70]
+
+Signed-off-by: Per Jessen <per@jessen.ch>
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ modules/pam_motd/pam_motd.c | 49 ++++++++++++++++++++++++++++++-------
+ 1 file changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/modules/pam_motd/pam_motd.c b/modules/pam_motd/pam_motd.c
+index 6ac8cba2..5ca486e4 100644
+--- a/modules/pam_motd/pam_motd.c
++++ b/modules/pam_motd/pam_motd.c
+@@ -166,11 +166,6 @@ static int compare_strings(const void *a, const void *b)
+     }
+ }
+ 
+-static int filter_dirents(const struct dirent *d)
+-{
+-    return (d->d_type == DT_REG || d->d_type == DT_LNK);
+-}
+-
+ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+ 	char **motd_dir_path_split, unsigned int num_motd_dirs, int report_missing)
+ {
+@@ -199,8 +194,7 @@ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+ 
+     for (i = 0; i < num_motd_dirs; i++) {
+ 	int rv;
+-	rv = scandir(motd_dir_path_split[i], &(dirscans[i]),
+-		filter_dirents, alphasort);
++	rv = scandir(motd_dir_path_split[i], &(dirscans[i]), NULL, NULL);
+ 	if (rv < 0) {
+ 	    if (errno != ENOENT || report_missing) {
+ 		pam_syslog(pamh, LOG_ERR, "error scanning directory %s: %m",
+@@ -215,6 +209,41 @@ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+     if (dirscans_size_total == 0)
+         goto out;
+ 
++    /* filter out unwanted names, directories, and complement data with lstat() */
++    for (i = 0; i < num_motd_dirs; i++) {
++	struct dirent **d = dirscans[i];
++	for (unsigned int j = 0; j < dirscans_sizes[i]; j++) {
++	    int rc;
++	    char *fullpath;
++	    struct stat s;
++
++	    switch(d[j]->d_type) {    /* the filetype determines how to proceed */
++	    case DT_REG:              /* regular files and     */
++	    case DT_LNK:              /* symlinks              */
++		continue;             /* are good.             */
++	    case DT_UNKNOWN:   /* for file systems that do not provide */
++			       /* a filetype, we use lstat()           */
++		if (join_dir_strings(&fullpath, motd_dir_path_split[i],
++				     d[j]->d_name) <= 0)
++		    break;
++		rc = lstat(fullpath, &s);
++		_pam_drop(fullpath);  /* free the memory alloc'ed by join_dir_strings */
++		if (rc != 0)          /* if the lstat() somehow failed */
++		    break;
++
++		if (S_ISREG(s.st_mode) ||          /* regular files and  */
++		    S_ISLNK(s.st_mode)) continue;  /* symlinks are good  */
++		break;
++	    case DT_DIR:          /* We don't want directories     */
++	    default:              /* nor anything else             */
++		break;
++	    }
++	    _pam_drop(d[j]);  /* free memory                   */
++	    d[j] = NULL;      /* indicate this one was dropped */
++	    dirscans_size_total--;
++	}
++    }
++
+     /* Allocate space for all file names found in the directories, including duplicates. */
+     if ((dirnames_all = calloc(dirscans_size_total, sizeof(*dirnames_all))) == NULL) {
+ 	pam_syslog(pamh, LOG_CRIT, "failed to allocate dirname array");
+@@ -225,8 +254,10 @@ static void try_to_display_directories_with_overrides(pam_handle_t *pamh,
+ 	unsigned int j;
+ 
+ 	for (j = 0; j < dirscans_sizes[i]; j++) {
+-	    dirnames_all[i_dirnames] = dirscans[i][j]->d_name;
+-	    i_dirnames++;
++	    if (NULL != dirscans[i][j]) {
++	        dirnames_all[i_dirnames] = dirscans[i][j]->d_name;
++	        i_dirnames++;
++	    }
+ 	}
+     }
+ 
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index dabd3256c8..0799102f8e 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://run-ptest \
            file://pam-volatiles.conf \
            file://CVE-2022-28321-0002.patch \
+           file://0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.34.1


