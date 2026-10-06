Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45155CA6006
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48816.1791301586968510016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hmUEgS5M;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c02782159so622866f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301585; x=1791906385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aHtDJI288n0Hdx6XHTei6JPoGcaa1Vkz9RTqqFkTDYw=;
        b=hmUEgS5Mnae09h/+EnjoEstwOH4/y3T6GGCXroyXtvYV0ZxiErKyAxCDTaM533nRO2
         F9KWxjUBBmSJ+aHS2s7po0KIIbwd1QYH4wkdNld6ZLNJAUt2uv41aQcJ/2e5L7Zmapuz
         tj26a5sKzuRMWr5MOVJ8v6jTCWmG3qrge2bJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301585; x=1791906385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aHtDJI288n0Hdx6XHTei6JPoGcaa1Vkz9RTqqFkTDYw=;
        b=pXDXq5sp2o+gRje2TcC7yH3ICXkcIPvC0kGSj9XWurdck9g9Z9019FlPe6dKXkhXl2
         y+x+seaSvvPSJA8Bp7N+EG9KU9z8WhXmXoSCpGsOJcLYcAuICnwCR10h748Tc4GwNQF8
         WWnG94jB6wAGDF6Oyu9mwZArTgez/VHaQ7ztHqtLVHVlGZvZXKQAuH2v9+tcpiXn9YsP
         skZyYU0pO7jOhgaJ8ySlGnQ39QduHWj8lJyyYOp2RJwUd0/AhObDeMTWuzSyFn0gBs/2
         JXPjQCBuika4VPGuLnzOdH5Pj4IgDW7rWlYPNphUNwDnNGs/o57EhDbKvPAMog+LwzuD
         TB6Q==
X-Gm-Message-State: AFq9FYKCVn9o6K+4QMaAR5O5gGOVkWEn3S07KlEwcqqaspegSdKGuV1z
	697vd2hrCcvvNf6sDgBT1baUfA84M1UF+dGgA9QyrffbG97XQmNny5G1p1xXU6PqMMWqItiCKbW
	bbAq2X3g=
X-Gm-Gg: AYBFou0SjwoGlLvA847KFs6Gw5OTzX7Ez0IbyNBUxbNfEYnJOE6u0d18jnbhxpXUeUe
	zcbw3T+l6Ojhw59tmSnaXPymGaHgHhBzXaOq42o5q9XUfzy7N4H356Y3Cl/Jm8zdaHJ7aGP3Rwb
	axd1mXLnP2GfxlkdHBSCohVmnmfQwyMcTKgfsN5LV8I8pHro/INKLISzhhuRJTi4YGbTk/aX5AX
	Kx3WDGkTtsJy0GR+Hmm/Fk7CA/j87Eniu5EtVtwAIv2CDTdqsysOp+7NULLgyAQosjBxzN54dy4
	LyDb/DtZU9HLq2gLtvViPKMsR5FoI9oMMIIJjY1GqsAO9nwkW4XD83TEcW7p8ZOv4wXZURz41Fq
	W0UGt5QqK5AUREhjjtcDKbcKohaC46CDW+qDWjXjYhth73xSDxQL86v313/co4tzZm7W17waF48
	/bKUUQBFOV3ubScybl2rmCL0znSlETWXsM7iQ2RTx1vStMJvBGiZH/Vdws0gg1Lwuk+2qd6tOWv
	4pKFSffVzPiSBHQCZLCi2/Bc7FIPKTedjm6MZRQQWU11QqzApMgCaXZ6EHKAYaHuC/jhjTeOZxi
	UWzqWQ==
X-Received: by 2002:a5d:5f95:0:b0:48c:5c2e:434d with SMTP id ffacd0b85a97d-48c6d1aa579mr3385947f8f.21.1791301585101;
        Tue, 06 Oct 2026 08:46:25 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 03/19] elfutils: fix handling of DWARF5 compilation units
Date: Tue,  6 Oct 2026 17:45:49 +0200
Message-ID: <56d4dfb8b8e02d50006a35b4d93a0a2cc5c9dbb3.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247292

From: Ross Burton <ross.burton@arm.com>

If a source file doesn't contain any functions or variable  then it
won't appear in the source file list for the generated object if the
debug information is DWARF5.  Details of why this is are in the patch
header.

Backport a patch from upstream to fix this oversight, adding files to
the -src packages that were previously missing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bdc2869a1a9307ee4ad9cc1d662c2fc1ddd9d2c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../elfutils/elfutils_0.196.bb                |  1 +
 .../elfutils/files/srcfiles.patch             | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
index c2466134cdc..4541000840b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.196.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch \
+           file://srcfiles.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/srcfiles.patch b/meta/recipes-devtools/elfutils/files/srcfiles.patch
new file mode 100644
index 00000000000..abd0226b0fd
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/srcfiles.patch
@@ -0,0 +1,65 @@
+From: Mark Wielaard <mark@klomp.org>
+To: elfutils-devel@sourceware.org
+Cc: ross@burtonini.com, Mark Wielaard <mark@klomp.org>
+Subject: [PATCH] srcfiles: Always process the "zero" file table entry (CU comp_dir/name)
+Date: Tue, 22 Sep 2026 13:46:06 +0200
+Message-ID: <20260922114606.2865660-1-mark@klomp.org>
+X-Mailer: git-send-email 2.55.0
+MIME-Version: 1.0
+Content-Transfer-Encoding: 8bit
+X-Spam-Flag: NO
+X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00 autolearn=ham autolearn_force=no version=3.4.0
+X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on gnu.wildebeest.org
+
+If the main CU file doesn't contain any references to the file table
+it wouldn't show up in the src files list (except if --cu-only was
+given). This is because file entry "zero" is special. It cannot be
+referred to by DW_AT file attributes (because zero means, no
+file). But technically it should be equal to (implicitly before
+DWARF5) the DW_AT_name of the main CU DIE (using a zero directory
+entry, equal to DW_AT_comp_dir). collect_sourcefiles skipped this
+implicit zero entry unless --cu-only was given.
+
+Fix this by always handling the zero file table entry. And for
+--cu-only to just exit the loop early, so no other entries are handled
+This is also an optimization, before --cu-only would go through all
+indexes, but always added the CU name. Which worked, because
+duplicates were removed, but was somewhat inefficient.
+
+	   * src/srcfiles.cxx (collect_sourcefiles): Go from index
+	   zero, exit after zero index for CU_only, always handle
+	   index zero specially.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=34666
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [7b675cbdb0d1f216938b4b33aea30fd35fb1ae0a]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/srcfiles.cxx | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
+index 9bbb6ef10473..e2fc0f128d71 100644
+--- a/src/srcfiles.cxx
++++ b/src/srcfiles.cxx
+@@ -273,10 +273,14 @@ collect_sourcefiles (Dwfl_Module *dwflmod,
+             clog << "skipping cu=" << cuname << " due to empty comp_dir" << endl;
+           continue;
+         }
+-      for (size_t f = 1; f < nfiles; ++f)
++      for (size_t f = 0; f < nfiles; ++f)
+         {
++	  /* For --cu-only we are only interested in the "zero" entry.  */
++	  if (CU_only && f != 0)
++	    break;
++
+           const char *hat;
+-          if (CU_only)
++          if (f == 0)
+           {
+             if (strcmp(cuname, "<unknown>") == 0 || strcmp(cuname, "<artificial>") == 0 )
+               continue;
+-- 
+2.55.0

