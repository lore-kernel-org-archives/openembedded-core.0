Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A010BCCFA03
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 11:59:14 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8518.1762084746219332001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 03:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MLZAQae/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202511021159040741d2135100020753-mfyq6p@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202511021159040741d2135100020753
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Nov 2025 12:59:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References:In-Reply-To;
 bh=ZjYlTNUyoqgNnZ+eORT3yHeLU7gytBkRZ5BPpOHeiOg=;
 b=MLZAQae/t9x0hrMRYEf9BeP2o3v1LNLgrGpHoIHwS7qby3MHTaoZWY99Uy3bv6e+5xE+Yd
 RjFV+x4we69NXpB3inQiU6sz4nhQNuhLqbNVJSaUwlUo3m/4APvTtbVliqsEe6rCTD1cwrsM
 5c7Ka5mBYbpdFMHnEk6njzh2Z8TPGj0Nz6nE2WgFze6jmPRJaBvzLZ6lf2zGPdQYSfEhJLZ5
 vpBP1IK603B69UgJxPSEBMhbbQeebtPQkeW5n1Dm/rQHMkAtLkkQtqoDlzduFc4od26uAV0Z
 VxmGrv3lk53DzahcdyX9FFA33tJad2+KgX+14b7CxDB5JZsxdvGlccuA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 2/2] binutils: patch CVE-2025-11413
Date: Sun,  2 Nov 2025 12:59:03 +0100
Message-Id: <20251102115903.1374482-2-peter.marko@siemens.com>
In-Reply-To: <20251102115903.1374482-1-peter.marko@siemens.com>
References: <20251102115903.1374482-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 11:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225581

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

Note that there were two patches for this, first [1] and then [2].
The second patch moved the original patch to different location.
Cherry-pick of second patch is successful leaving out the code removing
the code from first location, so the patch attached here is not
identical to the upstream commit but is identical to applying both and
merging them to a single patch.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=1108620d7a521f1c85d2f629031ce0fbae14e331
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=72efdf166aa0ed72ecc69fc2349af6591a7a19c0

(From OE-Core rev: 98df728e6136d04af0f4922b7ffbeffb704de395)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/binutils/CVE-2025-11413.patch    | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 39f2827f78..d5ad3c0ecb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -85,5 +85,6 @@ SRC_URI = "\
      file://0046-CVE-2025-11081.patch \
      file://0047-CVE-2025-8225.patch \
      file://CVE-2025-11412.patch \
+     file://CVE-2025-11413.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
new file mode 100644
index 0000000000..bfd1be7787
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
@@ -0,0 +1,38 @@
+From 72efdf166aa0ed72ecc69fc2349af6591a7a19c0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 25 Sep 2025 10:41:32 +0930
+Subject: [PATCH] Re: elf: Disallow the empty global symbol name
+
+sparc64-linux-gnu  +FAIL: selective2
+sparc64-linux-gnu  +FAIL: selective3
+
+	PR ld/33456
+	* elflink.c (elf_link_add_object_symbols): Move new check later
+	to give the backend add_symbol_hook a chance to remove symbols
+	with empty names.
+
+CVE: CVE-2025-11413
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=72efdf166aa0ed72ecc69fc2349af6591a7a19c0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elflink.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 0a0456177c2..5c8b822e36a 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -4931,6 +4931,13 @@ elf_link_add_object_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	    continue;
+ 	}
+ 
++      if (name[0] == '\0')
++	{
++	  _bfd_error_handler (_("%pB: corrupt symbol table"), abfd);
++	  bfd_set_error (bfd_error_bad_value);
++	  goto error_free_vers;
++	}
++
+       /* Sanity check that all possibilities were handled.  */
+       if (sec == NULL)
+ 	abort ();

