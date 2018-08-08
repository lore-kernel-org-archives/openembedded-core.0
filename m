Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id C1DEB78E9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:38 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f1-v6so1246286pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H62H9CbATCumE8MbJFga6vuYX6iyg/bH6XTFPyiKta4=;
	b=J9BtNETMId2Ezhvxy3NuUrlQ7oWgxpf3RC3eptj+Xph+XHi+LP7t2rDGdQ5E9a771Q
	iwznIHCFVNoeAOB3SG2Mi1BZED15iwJE3tqdqoRucir0zvBPWrhEpv9DTVup48Sd9s7R
	BYXQOQUwEFJkPCwFHFLgINQegI6cD1G7KRBI28giUQucJGod1+o1kkiF7ErpsvmetA8J
	Freq1VxjiBPIzF5iAn9Go/EJ2ucYnVWXwg5bFLuLeqoDl1usXOrWmWCHJ6V8anjnElSU
	KxDuC6ibe0CXEtWtmwL9uOOnxHuElRFkMZh6iWb3vxYjevmA480Aw5isna1TdfniEbiL
	tXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H62H9CbATCumE8MbJFga6vuYX6iyg/bH6XTFPyiKta4=;
	b=lZ70N9SEDTrqAKVGf6zJc3isIb1OE8t+yLKoJYx6EuB0oboz6UzhJnYErEJkrzsuWb
	c4vuIWz4VBAi9S20IYJ3blG5iafAsVibkqUzxEEzzXF8pRz1Uw3ZalKw3iEyX/uObnF5
	owoRcX8FnD8kGMRITTIBCSR945sc4Mai6wfKvz7Ur62Z+RH5C6/jLYZHwPaVX6eU0xyT
	Io44UwMuXlMwErlBxk8IYxwObFmTTVhxdrpP6LihGOicmUlzkWh1kX4v2lARbVBk2jXU
	mSfRQUt88j0GNZHI5LMPwJeKfi5usmjQMKI9uI1uZ2nyv0offGQG0zsqFLaPix76z8VV
	knPg==
X-Gm-Message-State: AOUpUlGyRu2NS7rF8VpvQ2NYw9M8JU6NZyvdWkONcJZntKRWg9fYBsJl
	0nh32jrPAo906wWCrzRO6bo=
X-Google-Smtp-Source: AA+uWPwqYyhTTOJKX1vtWrlVj7OqG/GTSQs7PtnndZHUngU82lROo3JeaPH+3TJ2vx8lcLHHC7l0Xw==
X-Received: by 2002:a63:fe02:: with SMTP id
	p2-v6mr3073189pgh.148.1533742539883; 
	Wed, 08 Aug 2018 08:35:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:11 -0700
Message-Id: <1533742522-24357-16-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 16/27] binutls: Security fix for CVE-2017-15996
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:39 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-15996.patch         | 84 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15996.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 917f667..7928de9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -51,6 +51,7 @@ SRC_URI = "\
      file://CVE-2017-15025.patch \
      file://CVE-2017-15225.patch \
      file://CVE-2017-15939.patch \
+     file://CVE-2017-15996.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15996.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15996.patch
new file mode 100644
index 0000000..dab8380
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15996.patch
@@ -0,0 +1,84 @@
+From d91f0b20e561e326ee91a09a76206257bde8438b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 28 Oct 2017 21:31:16 +1030
+Subject: [PATCH] PR22361 readelf buffer overflow on fuzzed archive header
+
+	PR 22361
+	* readelf.c (process_archive_index_and_symbols): Ensure ar_size
+	field is zero terminated for strtoul.
+	(setup_archive, get_archive_member_name): Likewise.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15996
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  7 +++++++
+ binutils/elfcomm.c | 11 +++++++++++
+ 2 files changed, 18 insertions(+)
+
+Index: git/binutils/elfcomm.c
+===================================================================
+--- git.orig/binutils/elfcomm.c
++++ git/binutils/elfcomm.c
+@@ -466,8 +466,12 @@ process_archive_index_and_symbols (struc
+ {
+   size_t got;
+   unsigned long size;
++  char fmag_save;
+ 
++  fmag_save = arch->arhdr.ar_fmag[0];
++  arch->arhdr.ar_fmag[0] = 0;
+   size = strtoul (arch->arhdr.ar_size, NULL, 10);
++  arch->arhdr.ar_fmag[0] = fmag_save;
+   /* PR 17531: file: 912bd7de.  */
+   if ((signed long) size < 0)
+     {
+@@ -655,7 +659,10 @@ setup_archive (struct archive_info *arch
+   if (const_strneq (arch->arhdr.ar_name, "//              "))
+     {
+       /* This is the archive string table holding long member names.  */
++      char fmag_save = arch->arhdr.ar_fmag[0];
++      arch->arhdr.ar_fmag[0] = 0;
+       arch->longnames_size = strtoul (arch->arhdr.ar_size, NULL, 10);
++      arch->arhdr.ar_fmag[0] = fmag_save;
+       /* PR 17531: file: 01068045.  */
+       if (arch->longnames_size < 8)
+ 	{
+@@ -758,6 +765,7 @@ get_archive_member_name (struct archive_
+       char *endp;
+       char *member_file_name;
+       char *member_name;
++      char fmag_save;
+ 
+       if (arch->longnames == NULL || arch->longnames_size == 0)
+ 	{
+@@ -766,9 +774,12 @@ get_archive_member_name (struct archive_
+ 	}
+ 
+       arch->nested_member_origin = 0;
++      fmag_save = arch->arhdr.ar_fmag[0];
++      arch->arhdr.ar_fmag[0] = 0;
+       k = j = strtoul (arch->arhdr.ar_name + 1, &endp, 10);
+       if (arch->is_thin_archive && endp != NULL && * endp == ':')
+         arch->nested_member_origin = strtoul (endp + 1, NULL, 10);
++      arch->arhdr.ar_fmag[0] = fmag_save;
+ 
+       if (j > arch->longnames_size)
+ 	{
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-10-28  Alan Modra  <amodra@gmail.com>
++
++       PR 22361
++       * readelf.c (process_archive_index_and_symbols): Ensure ar_size
++       field is zero terminated for strtoul.
++       (setup_archive, get_archive_member_name): Likewise.
++
+ 2017-09-26  Alan Modra  <amodra@gmail.com>
+  
+        PR 22205
-- 
2.7.4


