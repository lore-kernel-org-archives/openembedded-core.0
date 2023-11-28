Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4C5C07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:07 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.10464.1701211986950869792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Tr3ySwX/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c239897895so4144931a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211986; x=1701816786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuK0rXc0pvuknDehKoHn5yJXxo8k7q+CNsrX2CBIUiY=;
        b=Tr3ySwX/YBhPa2vFBH4WoP/Z3BN/x8Vi0PjWSUmkoJCrsYyYQfsAfMjY9a+ggsneZ/
         6Wj9y2tVsl/dvn0nxvxbighxW/TDRcYzcLPZClwk8ynUFj0vC4lJnDWsGtkfk6m6zYS3
         dqeB4bmfaNeoa9WBcQ1Mttxbrn5JP19URFbkdD6OOUq+OuJuaaELcudoE9lr+t1tD6XZ
         QBMr1d30JRwhru2bOJcBwN0eRjsnoM52xepuSVPHfd/IYrtzd8XfkPpmj5cOaRVp818M
         7MKrw55wXeDtFvbCBP7pewEApwX+i328YgTc19gYCczQu2BESrjBWhYws80TQeLsZjR9
         s+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211986; x=1701816786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuK0rXc0pvuknDehKoHn5yJXxo8k7q+CNsrX2CBIUiY=;
        b=R61kIJ3u9ohfwRCEjy7smmCKyw9LvToIWnUmqwW8TxUvPLfZM6DxwbyroPPH+vZRcX
         KvrIsLuu+JfkM3zHLlEIoyxdkec0pfuej5UhIbzMvsXEMjAwO5x9VrAuUpPbkgaelIyf
         ULfCOdcFRhHbioMdZgEtsbaX4beuS6e29may9+4VKLDYujzh+fDKbn14nJG7iyXVIBUQ
         eHSf8QqBxp7JtzXz8e1XFe8aMAIRuwRFWK8tqv9Sq6UdYgRxAsoYJG0bKiVTVcjUgm0m
         4dASGc5xf1Uymi7i2DE19Xqj0mboNixpLzJX9TDp+DNRY7isOEoFxXvImcyCUFRH9gyj
         MwAQ==
X-Gm-Message-State: AOJu0YzBCk2F25RlzPQYraVhlawgJiPuW+DfWSDiKmi7pBQ0p1laN8XX
	cRwI3Fsl2d+978u0ykzLYXKM4StH8xq7nNlNpMuvoQ==
X-Google-Smtp-Source: AGHT+IEzkPk1pVf/DTyv0bz7IAz/VpCcWrMmiIujKMWfuSXaWPAVaM1vpPY5zuC8YHcpwvVFT8nwHA==
X-Received: by 2002:a17:90b:4c50:b0:285:5dc3:a5bd with SMTP id np16-20020a17090b4c5000b002855dc3a5bdmr13609084pjb.24.1701211985758;
        Tue, 28 Nov 2023 14:53:05 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.53.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:53:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/13] tiff: backport Debian patch to fix CVE-2022-40090
Date: Tue, 28 Nov 2023 12:52:36 -1000
Message-Id: <999af9858676a0f5112ef3a9d9156be349f90cb4.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191404

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2022-40090

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches?h=ubuntu/focal-security
Upstream commit
https://gitlab.com/libtiff/libtiff/-/commit/c7caec9a4d8f24c17e667480d2c7d0d51c9fae41]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2022-40090.patch        | 548 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 2 files changed, 549 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-40090.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-40090.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-40090.patch
new file mode 100644
index 0000000000..0a88f59553
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-40090.patch
@@ -0,0 +1,548 @@
+From d385738335deb0c4bb70449f12e411f2203c0d01 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 2 Sep 2022 21:20:28 +0200
+Subject: [PATCH 1/4] Improved IFD-Loop Handling (fixes #455)
+
+Basic approach:
+- The order in the entire chain must be checked, and not only whether an offset has already been read once.
+- To do this, pairs of directory number and offset are stored and checked.
+- The offset of a directory number can change.
+- TIFFAdvanceDirectory() must also perform an IFD loop check.
+- TIFFCheckDirOffset() is replaced by _TIFFCheckDirNumberAndOffset().
+
+Rules for the check:
+- If an offset is already in the list, it must have the same IFD number. Otherwise it is an IDF loop.
+- If the offset is not in the list and the IFD number is greater than there are list entries, a new list entry is added.
+- Otherwise, the offset of the IFD number is updated.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/tiff/tree/debian/patches/CVE-2022-40090.patch?h=ubuntu/focal-security
+Upstream commit
+https://gitlab.com/libtiff/libtiff/-/commit/c7caec9a4d8f24c17e667480d2c7d0d51c9fae41]
+CVE: CVE-2022-40090
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libtiff/tif_close.c   |  6 ++-
+ libtiff/tif_dir.c     | 91 +++++++++++++++++++++++++----------------
+ libtiff/tif_dir.h     |  1 +
+ libtiff/tif_dirread.c | 94 ++++++++++++++++++++++++++++++-------------
+ libtiff/tif_open.c    |  3 +-
+ libtiff/tiffiop.h     |  3 +-
+ 6 files changed, 131 insertions(+), 67 deletions(-)
+
+--- tiff-4.1.0+git191117.orig/libtiff/tif_close.c
++++ tiff-4.1.0+git191117/libtiff/tif_close.c
+@@ -52,8 +52,10 @@ TIFFCleanup(TIFF* tif)
+ 	(*tif->tif_cleanup)(tif);
+ 	TIFFFreeDirectory(tif);
+ 
+-	if (tif->tif_dirlist)
+-		_TIFFfree(tif->tif_dirlist);
++	if (tif->tif_dirlistoff)
++		_TIFFfree(tif->tif_dirlistoff);
++	if (tif->tif_dirlistdirn)
++		_TIFFfree(tif->tif_dirlistdirn);
+ 
+ 	/*
+          * Clean up client info links.
+--- tiff-4.1.0+git191117.orig/libtiff/tif_dir.c
++++ tiff-4.1.0+git191117/libtiff/tif_dir.c
+@@ -1463,12 +1463,22 @@ TIFFDefaultDirectory(TIFF* tif)
+ }
+ 
+ static int
+-TIFFAdvanceDirectory(TIFF* tif, uint64* nextdir, uint64* off)
++TIFFAdvanceDirectory(TIFF* tif, uint64* nextdiroff, uint64* off, uint16* nextdirnum)
+ {
+ 	static const char module[] = "TIFFAdvanceDirectory";
++
++	/* Add this directory to the directory list, if not already in. */
++	if (!_TIFFCheckDirNumberAndOffset(tif, *nextdirnum, *nextdiroff)) {
++		TIFFErrorExt(tif->tif_clientdata, module, "Starting directory %hu at offset 0x%lx (%lu) might cause an IFD loop",
++			*nextdirnum, *nextdiroff, *nextdiroff);
++		*nextdiroff = 0;
++		*nextdirnum = 0;
++		return(0);
++	}
++
+ 	if (isMapped(tif))
+ 	{
+-		uint64 poff=*nextdir;
++		uint64 poff=*nextdiroff;
+ 		if (!(tif->tif_flags&TIFF_BIGTIFF))
+ 		{
+ 			tmsize_t poffa,poffb,poffc,poffd;
+@@ -1479,7 +1489,7 @@ TIFFAdvanceDirectory(TIFF* tif, uint64*
+ 			if (((uint64)poffa!=poff)||(poffb<poffa)||(poffb<(tmsize_t)sizeof(uint16))||(poffb>tif->tif_size))
+ 			{
+ 				TIFFErrorExt(tif->tif_clientdata,module,"Error fetching directory count");
+-                                  *nextdir=0;
++                                  *nextdiroff=0;
+ 				return(0);
+ 			}
+ 			_TIFFmemcpy(&dircount,tif->tif_base+poffa,sizeof(uint16));
+@@ -1497,7 +1507,7 @@ TIFFAdvanceDirectory(TIFF* tif, uint64*
+ 			_TIFFmemcpy(&nextdir32,tif->tif_base+poffc,sizeof(uint32));
+ 			if (tif->tif_flags&TIFF_SWAB)
+ 				TIFFSwabLong(&nextdir32);
+-			*nextdir=nextdir32;
++			*nextdiroff=nextdir32;
+ 		}
+ 		else
+ 		{
+@@ -1529,11 +1539,10 @@ TIFFAdvanceDirectory(TIFF* tif, uint64*
+ 			}
+ 			if (off!=NULL)
+ 				*off=(uint64)poffc;
+-			_TIFFmemcpy(nextdir,tif->tif_base+poffc,sizeof(uint64));
++			_TIFFmemcpy(nextdiroff,tif->tif_base+poffc,sizeof(uint64));
+ 			if (tif->tif_flags&TIFF_SWAB)
+-				TIFFSwabLong8(nextdir);
++				TIFFSwabLong8(nextdiroff);
+ 		}
+-		return(1);
+ 	}
+ 	else
+ 	{
+@@ -1541,7 +1550,7 @@ TIFFAdvanceDirectory(TIFF* tif, uint64*
+ 		{
+ 			uint16 dircount;
+ 			uint32 nextdir32;
+-			if (!SeekOK(tif, *nextdir) ||
++			if (!SeekOK(tif, *nextdiroff) ||
+ 			    !ReadOK(tif, &dircount, sizeof (uint16))) {
+ 				TIFFErrorExt(tif->tif_clientdata, module, "%s: Error fetching directory count",
+ 				    tif->tif_name);
+@@ -1562,13 +1571,13 @@ TIFFAdvanceDirectory(TIFF* tif, uint64*
+ 			}
+ 			if (tif->tif_flags & TIFF_SWAB)
+ 				TIFFSwabLong(&nextdir32);
+-			*nextdir=nextdir32;
++			*nextdiroff=nextdir32;
+ 		}
+ 		else
+ 		{
+ 			uint64 dircount64;
+ 			uint16 dircount16;
+-			if (!SeekOK(tif, *nextdir) ||
++			if (!SeekOK(tif, *nextdiroff) ||
+ 			    !ReadOK(tif, &dircount64, sizeof (uint64))) {
+ 				TIFFErrorExt(tif->tif_clientdata, module, "%s: Error fetching directory count",
+ 				    tif->tif_name);
+@@ -1588,17 +1597,27 @@ TIFFAdvanceDirectory(TIFF* tif, uint64*
+ 			else
+ 				(void) TIFFSeekFile(tif,
+ 				    dircount16*20, SEEK_CUR);
+-			if (!ReadOK(tif, nextdir, sizeof (uint64))) {
++			if (!ReadOK(tif, nextdiroff, sizeof (uint64))) {
+ 				TIFFErrorExt(tif->tif_clientdata, module,
+                                              "%s: Error fetching directory link",
+ 				    tif->tif_name);
+ 				return (0);
+ 			}
+ 			if (tif->tif_flags & TIFF_SWAB)
+-				TIFFSwabLong8(nextdir);
++				TIFFSwabLong8(nextdiroff);
+ 		}
+-		return (1);
+ 	}
++	if (*nextdiroff != 0) {
++		(*nextdirnum)++;
++		/* Check next directory for IFD looping and if so, set it as last directory. */
++		if (!_TIFFCheckDirNumberAndOffset(tif, *nextdirnum, *nextdiroff)) {
++			TIFFWarningExt(tif->tif_clientdata, module, "the next directory %hu at offset 0x%lx (%lu) might be an IFD loop. Treating directory %hu as last directory",
++				*nextdirnum, *nextdiroff, *nextdiroff, *nextdirnum-1);
++			*nextdiroff = 0;
++			(*nextdirnum)--;
++		}
++	}
++	return (1);
+ }
+ 
+ /*
+@@ -1608,14 +1627,16 @@ uint16
+ TIFFNumberOfDirectories(TIFF* tif)
+ {
+ 	static const char module[] = "TIFFNumberOfDirectories";
+-	uint64 nextdir;
++	uint64 nextdiroff;
++	uint16 nextdirnum;
+ 	uint16 n;
+ 	if (!(tif->tif_flags&TIFF_BIGTIFF))
+-		nextdir = tif->tif_header.classic.tiff_diroff;
++		nextdiroff = tif->tif_header.classic.tiff_diroff;
+ 	else
+-		nextdir = tif->tif_header.big.tiff_diroff;
++		nextdiroff = tif->tif_header.big.tiff_diroff;
++	nextdirnum = 0;
+ 	n = 0;
+-	while (nextdir != 0 && TIFFAdvanceDirectory(tif, &nextdir, NULL))
++	while (nextdiroff != 0 && TIFFAdvanceDirectory(tif, &nextdiroff, NULL, &nextdirnum))
+         {
+                 if (n != 65535) {
+                         ++n;
+@@ -1638,28 +1659,30 @@ TIFFNumberOfDirectories(TIFF* tif)
+ int
+ TIFFSetDirectory(TIFF* tif, uint16 dirn)
+ {
+-	uint64 nextdir;
++	uint64 nextdiroff;
++	uint16 nextdirnum;
+ 	uint16 n;
+ 
+ 	if (!(tif->tif_flags&TIFF_BIGTIFF))
+-		nextdir = tif->tif_header.classic.tiff_diroff;
++		nextdiroff = tif->tif_header.classic.tiff_diroff;
+ 	else
+-		nextdir = tif->tif_header.big.tiff_diroff;
+-	for (n = dirn; n > 0 && nextdir != 0; n--)
+-		if (!TIFFAdvanceDirectory(tif, &nextdir, NULL))
++		nextdiroff = tif->tif_header.big.tiff_diroff;
++	nextdirnum = 0;
++	for (n = dirn; n > 0 && nextdiroff != 0; n--)
++		if (!TIFFAdvanceDirectory(tif, &nextdiroff, NULL, &nextdirnum))
+ 			return (0);
+-	tif->tif_nextdiroff = nextdir;
++	/* If the n-th directory could not be reached (does not exist), 
++	 * return here without touching anything further. */
++	if (nextdiroff == 0 || n > 0)
++		return (0);
++
++	tif->tif_nextdiroff = nextdiroff;
+ 	/*
+ 	 * Set curdir to the actual directory index.  The
+ 	 * -1 is because TIFFReadDirectory will increment
+ 	 * tif_curdir after successfully reading the directory.
+ 	 */
+ 	tif->tif_curdir = (dirn - n) - 1;
+-	/*
+-	 * Reset tif_dirnumber counter and start new list of seen directories.
+-	 * We need this to prevent IFD loops.
+-	 */
+-	tif->tif_dirnumber = 0;
+ 	return (TIFFReadDirectory(tif));
+ }
+ 
+@@ -1672,13 +1695,42 @@ TIFFSetDirectory(TIFF* tif, uint16 dirn)
+ int
+ TIFFSetSubDirectory(TIFF* tif, uint64 diroff)
+ {
+-	tif->tif_nextdiroff = diroff;
+-	/*
+-	 * Reset tif_dirnumber counter and start new list of seen directories.
+-	 * We need this to prevent IFD loops.
++	/* Match nextdiroff and curdir for consistent IFD-loop checking. 
++	 * Only with TIFFSetSubDirectory() the IFD list can be corrupted with invalid offsets
++	 * within the main IFD tree.
++	 * In the case of several subIFDs of a main image, 
++	 * there are two possibilities that are not even mutually exclusive.
++	 * a.) The subIFD tag contains an array with all offsets of the subIFDs.
++	 * b.) The SubIFDs are concatenated with their NextIFD parameters.
++	 * (refer to https://www.awaresystems.be/imaging/tiff/specification/TIFFPM6.pdf.)
+ 	 */
+-	tif->tif_dirnumber = 0;
+-	return (TIFFReadDirectory(tif));
++	int retval;
++	uint16 curdir = 0;
++	int8 probablySubIFD = 0;
++	if (diroff == 0) {
++		/* Special case to invalidate the tif_lastdiroff member. */
++		tif->tif_curdir = 65535;
++	} else {
++		if (!_TIFFGetDirNumberFromOffset(tif, diroff, &curdir)) {
++			/* Non-existing offsets might point to a SubIFD or invalid IFD.*/
++			probablySubIFD = 1;
++		}
++		/* -1 because TIFFReadDirectory() will increment tif_curdir. */
++		tif->tif_curdir = curdir - 1;
++	}
++
++	tif->tif_nextdiroff = diroff;
++	retval = TIFFReadDirectory(tif);
++	/* If failed, curdir was not incremented in TIFFReadDirectory(), so set it back. */
++	if (!retval )tif->tif_curdir++; 
++	if (retval && probablySubIFD) {
++		/* Reset IFD list to start new one for SubIFD chain and also start SubIFD chain with tif_curdir=0. */
++		tif->tif_dirnumber = 0; 
++		tif->tif_curdir = 0; /* first directory of new chain */
++		/* add this offset to new IFD list */
++		_TIFFCheckDirNumberAndOffset(tif, tif->tif_curdir, diroff);
++	}
++	return (retval);
+ }
+ 
+ /*
+@@ -1702,12 +1754,15 @@ TIFFLastDirectory(TIFF* tif)
+ 
+ /*
+  * Unlink the specified directory from the directory chain.
++ * Note: First directory starts with number dirn=1. 
++ * This is different to TIFFSetDirectory() where the first directory starts with zero.
+  */
+ int
+ TIFFUnlinkDirectory(TIFF* tif, uint16 dirn)
+ {
+ 	static const char module[] = "TIFFUnlinkDirectory";
+ 	uint64 nextdir;
++	uint16 nextdirnum;
+ 	uint64 off;
+ 	uint16 n;
+ 
+@@ -1731,19 +1786,21 @@ TIFFUnlinkDirectory(TIFF* tif, uint16 di
+ 		nextdir = tif->tif_header.big.tiff_diroff;
+ 		off = 8;
+ 	}
++	nextdirnum = 0;		/* First directory is dirn=0 */
++
+ 	for (n = dirn-1; n > 0; n--) {
+ 		if (nextdir == 0) {
+ 			TIFFErrorExt(tif->tif_clientdata, module, "Directory %d does not exist", dirn);
+ 			return (0);
+ 		}
+-		if (!TIFFAdvanceDirectory(tif, &nextdir, &off))
++		if (!TIFFAdvanceDirectory(tif, &nextdir, &off, &nextdirnum))
+ 			return (0);
+ 	}
+ 	/*
+ 	 * Advance to the directory to be unlinked and fetch
+ 	 * the offset of the directory that follows.
+ 	 */
+-	if (!TIFFAdvanceDirectory(tif, &nextdir, NULL))
++	if (!TIFFAdvanceDirectory(tif, &nextdir, NULL, &nextdirnum))
+ 		return (0);
+ 	/*
+ 	 * Go back and patch the link field of the preceding
+--- tiff-4.1.0+git191117.orig/libtiff/tif_dir.h
++++ tiff-4.1.0+git191117/libtiff/tif_dir.h
+@@ -300,6 +300,8 @@ extern int _TIFFMergeFields(TIFF*, const
+ extern const TIFFField* _TIFFFindOrRegisterField(TIFF *, uint32, TIFFDataType);
+ extern  TIFFField* _TIFFCreateAnonField(TIFF *, uint32, TIFFDataType);
+ extern int _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag);
++extern int _TIFFCheckDirNumberAndOffset(TIFF *tif, uint16 dirn, uint64 diroff);
++extern int _TIFFGetDirNumberFromOffset(TIFF *tif, uint64 diroff, uint16 *dirn);
+ 
+ #if defined(__cplusplus)
+ }
+--- tiff-4.1.0+git191117.orig/libtiff/tif_dirread.c
++++ tiff-4.1.0+git191117/libtiff/tif_dirread.c
+@@ -158,7 +158,6 @@ static void TIFFReadDirectoryFindFieldIn
+ 
+ static int EstimateStripByteCounts(TIFF* tif, TIFFDirEntry* dir, uint16 dircount);
+ static void MissingRequired(TIFF*, const char*);
+-static int TIFFCheckDirOffset(TIFF* tif, uint64 diroff);
+ static int CheckDirCount(TIFF*, TIFFDirEntry*, uint32);
+ static uint16 TIFFFetchDirectory(TIFF* tif, uint64 diroff, TIFFDirEntry** pdir, uint64* nextdiroff);
+ static int TIFFFetchNormalTag(TIFF*, TIFFDirEntry*, int recover);
+@@ -3584,12 +3583,19 @@ TIFFReadDirectory(TIFF* tif)
+     int bitspersample_read = FALSE;
+         int color_channels;
+ 
+-	tif->tif_diroff=tif->tif_nextdiroff;
+-	if (!TIFFCheckDirOffset(tif,tif->tif_nextdiroff))
+-		return 0;           /* last offset or bad offset (IFD looping) */
+-	(*tif->tif_cleanup)(tif);   /* cleanup any previous compression state */
+-	tif->tif_curdir++;
+-        nextdiroff = tif->tif_nextdiroff;
++	if (tif->tif_nextdiroff == 0) {
++		/* In this special case, tif_diroff needs also to be set to 0. */
++		tif->tif_diroff = tif->tif_nextdiroff;
++		return 0;           /* last offset, thus no checking necessary */
++	}
++
++	nextdiroff = tif->tif_nextdiroff;
++	/* tif_curdir++ and tif_nextdiroff should only be updated after SUCCESSFUL reading of the directory. Otherwise, invalid IFD offsets could corrupt the IFD list. */
++	if (!_TIFFCheckDirNumberAndOffset(tif, tif->tif_curdir + 1, nextdiroff)) {
++		TIFFWarningExt(tif->tif_clientdata, module,
++			"Didn't read next directory due to IFD looping at offset 0x%lx (%lu) to offset 0x%lx (%lu)", tif->tif_diroff, tif->tif_diroff, nextdiroff, nextdiroff);
++		return 0;           /* bad offset (IFD looping) */
++	}
+ 	dircount=TIFFFetchDirectory(tif,nextdiroff,&dir,&tif->tif_nextdiroff);
+ 	if (!dircount)
+ 	{
+@@ -3597,6 +3603,11 @@ TIFFReadDirectory(TIFF* tif)
+ 		    "Failed to read directory at offset " TIFF_UINT64_FORMAT,nextdiroff);
+ 		return 0;
+ 	}
++	/* Set global values after a valid directory has been fetched.
++	 * tif_diroff is already set to nextdiroff in TIFFFetchDirectory() in the beginning. */
++	tif->tif_curdir++;
++	(*tif->tif_cleanup)(tif);   /* cleanup any previous compression state */
++
+ 	TIFFReadDirectoryCheckOrder(tif,dir,dircount);
+ 
+         /*
+@@ -4628,13 +4639,17 @@ MissingRequired(TIFF* tif, const char* t
+ }
+ 
+ /*
+- * Check the directory offset against the list of already seen directory
+- * offsets. This is a trick to prevent IFD looping. The one can create TIFF
+- * file with looped directory pointers. We will maintain a list of already
+- * seen directories and check every IFD offset against that list.
++ * Check the directory number and offset against the list of already seen
++ * directory numbers and offsets. This is a trick to prevent IFD looping.
++ * The one can create TIFF file with looped directory pointers. We will
++ * maintain a list of already seen directories and check every IFD offset
++ * and its IFD number against that list. However, the offset of an IFD number
++ * can change - e.g. when writing updates to file.
++ * Returns 1 if all is ok; 0 if last directory or IFD loop is encountered,
++ * or an error has occured.
+  */
+-static int
+-TIFFCheckDirOffset(TIFF* tif, uint64 diroff)
++int
++_TIFFCheckDirNumberAndOffset(TIFF* tif, uint16 dirn, uint64 diroff)
+ {
+ 	uint16 n;
+ 
+@@ -4646,35 +4661,64 @@ TIFFCheckDirOffset(TIFF* tif, uint64 dir
+ 	    return 0;
+ 	}
+ 
+-	for (n = 0; n < tif->tif_dirnumber && tif->tif_dirlist; n++) {
+-		if (tif->tif_dirlist[n] == diroff)
+-			return 0;
++	/* Check if offset is already in the list:
++	 * - yes: check, if offset is at the same IFD number - if not, it is an IFD loop
++	 * -  no: add to list or update offset at that IFD number
++	 */
++	for (n = 0; n < tif->tif_dirnumber && tif->tif_dirlistdirn && tif->tif_dirlistoff; n++) {
++		if (tif->tif_dirlistoff[n] == diroff) {
++			if (tif->tif_dirlistdirn[n] == dirn) {
++				return 1;
++			} else {
++				TIFFWarningExt(tif->tif_clientdata, "_TIFFCheckDirNumberAndOffset",
++					"TIFF directory %hu has IFD looping to directory %hu at offset 0x%lx (%lu)",
++					dirn-1, tif->tif_dirlistdirn[n], diroff, diroff);
++				return 0;
++			}
++		}
++	}
++	/* Check if offset of an IFD has been changed and update offset of that IFD number. */
++	if (dirn < tif->tif_dirnumber && tif->tif_dirlistdirn && tif->tif_dirlistoff) {
++		/* tif_dirlistdirn can have IFD numbers dirn in random order */
++		for (n = 0; n < tif->tif_dirnumber; n++) {
++			if (tif->tif_dirlistdirn[n] == dirn) {
++				tif->tif_dirlistoff[n] = diroff;
++				return 1;
++			}
++		}
+ 	}
+ 
++	/* Add IFD offset and dirn to IFD directory list */
+ 	tif->tif_dirnumber++;
+ 
+-	if (tif->tif_dirlist == NULL || tif->tif_dirnumber > tif->tif_dirlistsize) {
+-		uint64* new_dirlist;
+-
++	if (tif->tif_dirlistoff == NULL || tif->tif_dirlistdirn == NULL || tif->tif_dirnumber > tif->tif_dirlistsize) {
++		uint64 *new_dirlist;
+ 		/*
+ 		 * XXX: Reduce memory allocation granularity of the dirlist
+ 		 * array.
+ 		 */
+-		new_dirlist = (uint64*)_TIFFCheckRealloc(tif, tif->tif_dirlist,
+-		    tif->tif_dirnumber, 2 * sizeof(uint64), "for IFD list");
++		if (tif->tif_dirnumber >= 32768)
++			tif->tif_dirlistsize = 65535;
++		else
++			tif->tif_dirlistsize = 2 * tif->tif_dirnumber;
++
++		new_dirlist = (uint64 *)_TIFFCheckRealloc(tif, tif->tif_dirlistoff,
++			tif->tif_dirlistsize, sizeof(uint64), "for IFD offset list");
+ 		if (!new_dirlist)
+ 			return 0;
+-		if( tif->tif_dirnumber >= 32768 )
+-		    tif->tif_dirlistsize = 65535;
+-		else
+-		    tif->tif_dirlistsize = 2 * tif->tif_dirnumber;
+-		tif->tif_dirlist = new_dirlist;
++		tif->tif_dirlistoff = new_dirlist;
++		new_dirlist = (uint64 *)_TIFFCheckRealloc(tif, tif->tif_dirlistdirn,
++			tif->tif_dirlistsize, sizeof(uint16), "for IFD dirnumber list");
++		if (!new_dirlist)
++			return 0;
++		tif->tif_dirlistdirn = (uint16 *)new_dirlist;
+ 	}
+ 
+-	tif->tif_dirlist[tif->tif_dirnumber - 1] = diroff;
++	tif->tif_dirlistoff[tif->tif_dirnumber - 1] = diroff;
++	tif->tif_dirlistdirn[tif->tif_dirnumber - 1] = dirn;
+ 
+ 	return 1;
+-}
++}	/* --- _TIFFCheckDirNumberAndOffset() ---*/
+ 
+ /*
+  * Check the count field of a directory entry against a known value.  The
+@@ -4703,6 +4747,47 @@ CheckDirCount(TIFF* tif, TIFFDirEntry* d
+ }
+ 
+ /*
++ * Retrieve the matching IFD directory number of a given IFD offset
++ * from the list of directories already seen.
++ * Returns 1 if the offset was in the list and the directory number
++ * can be returned.
++ * Otherwise returns 0 or if an error occured.
++ */
++int
++_TIFFGetDirNumberFromOffset(TIFF *tif, uint64 diroff, uint16* dirn)
++{
++	uint16 n;
++
++	if (diroff == 0)			/* no more directories */
++		return 0;
++	if (tif->tif_dirnumber == 65535) {
++		TIFFErrorExt(tif->tif_clientdata, "_TIFFGetDirNumberFromOffset",
++			"Cannot handle more than 65535 TIFF directories");
++		return 0;
++	}
++
++	/* Check if offset is already in the list and return matching directory number.
++	 * Otherwise update IFD list using TIFFNumberOfDirectories() 
++	 * and search again in IFD list.
++	 */
++	for (n = 0; n < tif->tif_dirnumber && tif->tif_dirlistoff && tif->tif_dirlistdirn; n++) {
++		if (tif->tif_dirlistoff[n] == diroff) {
++			*dirn = tif->tif_dirlistdirn[n];
++			return 1;
++		}
++	}
++	TIFFNumberOfDirectories(tif);
++	for (n = 0; n < tif->tif_dirnumber && tif->tif_dirlistoff && tif->tif_dirlistdirn; n++) {
++		if (tif->tif_dirlistoff[n] == diroff) {
++			*dirn = tif->tif_dirlistdirn[n];
++			return 1;
++		}
++	}
++	return 0;
++} /*--- _TIFFGetDirNumberFromOffset() ---*/
++
++
++/*
+  * Read IFD structure from the specified offset. If the pointer to
+  * nextdiroff variable has been specified, read it too. Function returns a
+  * number of fields in the directory or 0 if failed.
+--- tiff-4.1.0+git191117.orig/libtiff/tif_open.c
++++ tiff-4.1.0+git191117/libtiff/tif_open.c
+@@ -353,7 +353,8 @@ TIFFClientOpen(
+ 		if (!TIFFDefaultDirectory(tif))
+ 			goto bad;
+ 		tif->tif_diroff = 0;
+-		tif->tif_dirlist = NULL;
++		tif->tif_dirlistoff = NULL;
++		tif->tif_dirlistdirn = NULL;
+ 		tif->tif_dirlistsize = 0;
+ 		tif->tif_dirnumber = 0;
+ 		return (tif);
+--- tiff-4.1.0+git191117.orig/libtiff/tiffiop.h
++++ tiff-4.1.0+git191117/libtiff/tiffiop.h
+@@ -145,7 +145,8 @@ struct tiff {
+         #define TIFF_CHOPPEDUPARRAYS 0x4000000U /* set when allocChoppedUpStripArrays() has modified strip array */
+ 	uint64               tif_diroff;       /* file offset of current directory */
+ 	uint64               tif_nextdiroff;   /* file offset of following directory */
+-	uint64*              tif_dirlist;      /* list of offsets to already seen directories to prevent IFD looping */
++	uint64*              tif_dirlistoff;   /* list of offsets to already seen directories to prevent IFD looping */
++	uint16*              tif_dirlistdirn;  /* list of directory numbers to already seen directories to prevent IFD looping */
+ 	uint16               tif_dirlistsize;  /* number of entries in offset list */
+ 	uint16               tif_dirnumber;    /* number of already seen directories */
+ 	TIFFDirectory        tif_dir;          /* internal rep of current directory */
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 2697a28463..8b130826e3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3618.patch \
            file://CVE-2023-40745.patch \
            file://CVE-2023-41175.patch \
+           file://CVE-2022-40090.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.34.1


