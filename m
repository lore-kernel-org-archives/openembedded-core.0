Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AEECCD19F
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 22:09:34 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.4816.1760998172974854454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 15:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YbJ3+q8m;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025102022093169dd36cf35000207b2-62d5gb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025102022093169dd36cf35000207b2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Oct 2025 00:09:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6mzVu+b39HiIHVK4dcAOigJZgFa9km7+NKmPOmUfk/0=;
 b=YbJ3+q8mwQosJOtAQveZ1hkpcHfsgQl1OlypupyHdQ8FwXLD3VIGqjqIgZFpUUjUnNFozx
 zFH8tlxKOGyRDsQW6/1IYpT7SnoOOh783+4I4sQYzEG6wQNeflNdxLm6znrOvVSLDS0yNXcs
 KS3wr5RwLA7LLpA/0MqO8oSB+JlA3jD/UFS65muwTkbm0zPMKF39wEqXAkIt57AajhEajTzt
 CiD+3IBGd0/YidKZm91epG5i1yAEQHbs7eQnn5rNEf4RtXsu2UQrNnV9U8hSDRe/0NdnO3Hy
 N6VRottcnD+ZASTJAljTi44joBIYwLi2GyArH+Wo500kHoox4bCOGJBw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/5] binutils: patch CVE-2025-11413
Date: Tue, 21 Oct 2025 00:09:10 +0200
Message-Id: <20251020220912.483748-3-peter.marko@siemens.com>
In-Reply-To: <20251020220912.483748-1-peter.marko@siemens.com>
References: <20251020220912.483748-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225137

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

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/binutils/CVE-2025-11413.patch    | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index ffd6c3b2388..62b5bf6c264 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -41,4 +41,5 @@ SRC_URI = "\
      file://0017-CVE-2025-11083.patch \
      file://CVE-2025-11414.patch \
      file://CVE-2025-11412.patch \
+     file://CVE-2025-11413.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
new file mode 100644
index 00000000000..1467d38049a
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
+@@ -5118,6 +5118,13 @@ elf_link_add_object_symbols (bfd *abfd, struct bfd_link_info *info)
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

