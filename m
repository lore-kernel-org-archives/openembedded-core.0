Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3875460620
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 08:23:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b201so2285088wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g6mEIUvzw1REu0o04yzSBEFPDzT+8qz+D8lil0vFhvA=;
	b=lkI+lQ9mIqQldlD3BKFbp4tiXcsNupiCGi8RKRUGZFg6koW1S+usrTv8LLdrmwwCNP
	9VxmpdiGlro55tEl8g52m/uSJBA02PhI6MaEbY9/XDi+iwdg2JqpF24zBf7EX2j1eT5m
	iBbud0LNr1wiC3KkBHYTJ7K4ICp1N9zvF4TXExCSi2PkFvO8gl/WAImWC3PxJoDP7RfA
	4LHey2w+rcIKIqTNYsb5APWzptEUyS3IHxtS4bpvp0xs8hZ4ZhAsvNOmdS4rMtRBfoF7
	sohwOiGI8UPX2TMGnVmVMGjLRLaAjWMX4KhFmehq2JwX3mR2T1NdBAChnxoonO9SVH2y
	cpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g6mEIUvzw1REu0o04yzSBEFPDzT+8qz+D8lil0vFhvA=;
	b=VHZWA/v86VnoqS2tSGevLB1DIVbLCxUTSXXxHcxRzTK6VWa8OZR804QldDogylnMMT
	qyspNFdeLedm3jxG4//D+ZSn5LITHzdvMyFQYT94LMRR1UX/+vnOy3XRScZujnM9X4Ey
	zonzDGNavuDfsFBFLebCFR2A/m+LBihPJCKMqRE4my9B3/VDUVLrEtOzRAO0npJ4HmT1
	+AWCsKAlRzXMHw3gVHsWGBDTPjrY7UXfuu4SOV2kAgxMypTCbsYz7tk0Mel3YNYvhSy6
	XwXZeEv4ABIpDe1lMMcEYFwUo+gD/u0se27KlXiqvwdC0EEfFPTx0OR15ULRKJqmB8Vi
	OfIQ==
X-Gm-Message-State: AA6/9RlQHUHilulROWm/pWQDDY6k17UQFAOMXTcYWytTsNQ94UMQ3lhuEnBzaz3A7hhZnQ==
X-Received: by 10.194.85.225 with SMTP id k1mr12826620wjz.136.1475742215898;
	Thu, 06 Oct 2016 01:23:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	p13sm13697992wmd.1.2016.10.06.01.23.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Oct 2016 01:23:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 10:23:32 +0200
Message-Id: <20161006082332.29189-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [krogoth][PATCH] binutils: fix AR issue when opkg is unpacking IPKs containing empty entries
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
X-List-Received-Date: Thu, 06 Oct 2016 08:23:35 -0000

From: Christophe Chapuis <chris.chapuis@gmail.com>

* this patch is backported from 2.26.1 which is already in oe-core/master
  since this patch:
  commit 37e8b6ecf9f9163d7b5b3becdc2feba57df4838f
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Thu Jul 7 11:08:29 2016 -0700
  Subject: binutils: Upgrade to 2.26.1

  -SRCREV = "71fa566a9cf2597b60a58c1d7c148bab637454a6"
  +SRCREV = "c29838e7f484e0b5714b02e7feb9a88d3a045dd2"

* verified that the patch exists in this SRCREV range:
  ~/projects/binutils $ git log --oneline 71fa566a9cf2597b60a58c1d7c148bab637454a6..c29838e7f484e0b5714b02e7feb9a88d3a045dd2^C
  ...
  343a405 Allow zero length archive elements
  ...
  so it isn't needed in master branch

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
 .../binutils/0015-allow-zero-length-elements.patch | 130 +++++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-allow-zero-length-elements.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index 06ce245..4b33b04 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -34,6 +34,7 @@ SRC_URI = "\
      file://0012-Add-support-for-Netlogic-XLP.patch \
      file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
      file://0014-Correct-nios2-_gp-address-computation.patch \
+     file://0015-allow-zero-length-elements.patch \
      file://aarch64-tls.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-allow-zero-length-elements.patch b/meta/recipes-devtools/binutils/binutils/0015-allow-zero-length-elements.patch
new file mode 100644
index 0000000..3a19fca
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-allow-zero-length-elements.patch
@@ -0,0 +1,130 @@
+From 343a405c03ce478634d8ce5a38faae832d39b361 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Mar 2016 17:01:54 +1030
+Subject: [PATCH] Allow zero length archive elements
+
+bfd/
+	PR binutils/19775
+	* archive.c (bfd_generic_openr_next_archived_file): Allow zero
+	length elements in the archive.
+	* coff-alpha.c (alpha_ecoff_openr_next_archived_file): Likewise.
+
+binutils/
+	PR binutils/19775
+	* testsuite/binutils-all/ar.exp (proc empty_archive): New proc.
+	Run the new proc.
+	* testsuite/binutils-all/empty: New, empty, file.
+---
+ bfd/ChangeLog                          |    8 ++++++
+ bfd/archive.c                          |    2 +-
+ bfd/coff-alpha.c                       |    2 +-
+ binutils/ChangeLog                     |    7 +++++
+ binutils/testsuite/binutils-all/ar.exp |   40 ++++++++++++++++++++++++++++++++
+ 5 files changed, 57 insertions(+), 2 deletions(-)
+ create mode 100644 binutils/testsuite/binutils-all/empty
+
+diff --git a/bfd/archive.c b/bfd/archive.c
+index b3d03d3..1fc3a94 100644
+--- a/bfd/archive.c
++++ b/bfd/archive.c
+@@ -802,7 +802,7 @@ bfd_generic_openr_next_archived_file (bfd *archive, bfd *last_file)
+ 	     Note that last_file->origin can be odd in the case of
+ 	     BSD-4.4-style element with a long odd size.  */
+ 	  filestart += filestart % 2;
+-	  if (filestart <= last_file->proxy_origin)
++	  if (filestart < last_file->proxy_origin)
+ 	    {
+ 	      /* Prevent looping.  See PR19256.  */
+ 	      bfd_set_error (bfd_error_malformed_archive);
+diff --git a/bfd/coff-alpha.c b/bfd/coff-alpha.c
+index 7478f2f..fffb9f7 100644
+--- a/bfd/coff-alpha.c
++++ b/bfd/coff-alpha.c
+@@ -2208,7 +2208,7 @@ alpha_ecoff_openr_next_archived_file (bfd *archive, bfd *last_file)
+ 	 BSD-4.4-style element with a long odd size.  */
+       filestart = last_file->proxy_origin + size;
+       filestart += filestart % 2;
+-      if (filestart <= last_file->proxy_origin)
++      if (filestart < last_file->proxy_origin)
+ 	{
+ 	  /* Prevent looping.  See PR19256.  */
+ 	  bfd_set_error (bfd_error_malformed_archive);
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index 4648d93..b04c745 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,10 @@
++2016-03-09  Nick Clifton  <nickc@redhat.com>
++
++	PR binutils/19775
++	* testsuite/binutils-all/ar.exp (proc empty_archive): New proc.
++	Run the new proc.
++	* testsuite/binutils-all/empty: New, empty, file.
++
+ 2016-02-12  H.J. Lu  <hongjiu.lu@intel.com>
+ 
+ 	Backport from master
+diff --git a/binutils/testsuite/binutils-all/ar.exp b/binutils/testsuite/binutils-all/ar.exp
+index 4c33874..e971350 100644
+--- a/binutils/testsuite/binutils-all/ar.exp
++++ b/binutils/testsuite/binutils-all/ar.exp
+@@ -555,6 +555,45 @@ proc move_an_element { } {
+     pass $testname
+ }
+ 
++# PR 19775: Test creating and listing archives with an empty element.
++
++proc empty_archive { } {
++    global AR
++    global srcdir
++    global subdir
++
++    set testname "archive with empty element"
++
++    # FIXME: There ought to be a way to dynamically create an empty file.
++    set empty $srcdir/$subdir/empty
++    
++    if [is_remote host] {
++	set archive artest.a
++	set objfile [remote_download host $empty]
++	remote_file host delete $archive
++    } else {
++	set archive tmpdir/artest.a
++	set objfile $empty
++    }
++
++    remote_file build delete tmpdir/artest.a
++
++    set got [binutils_run $AR "-r -c $archive ${objfile}"]
++    if ![string match "" $got] {
++	fail $testname
++	return
++    }
++
++    # This commmand used to fail with: "Malformed archive".
++    set got [binutils_run $AR "-t $archive"]
++    if ![string match "empty
" $got] {
++	fail $testname
++	return
++    }
++
++    pass $testname
++}
++
+ # Run the tests.
+ 
+ # Only run the bfdtest checks if the programs exist.  Since these
+@@ -574,6 +613,7 @@ argument_parsing
+ deterministic_archive
+ delete_an_element
+ move_an_element
++empty_archive
+ 
+ if { [is_elf_format]
+      && ![istarget "*-*-hpux*"]
+diff --git a/binutils/testsuite/binutils-all/empty b/binutils/testsuite/binutils-all/empty
+new file mode 100644
+index 0000000..e69de29
+-- 
+1.7.1
+
-- 
2.10.1


