Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8846ACA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.703.1755790809548078804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LfBWs63n;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-245f19aab6aso8132835ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790809; x=1756395609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCX6pGKbp51gBD06xhigw6l5OvKROkBX9FJGn66FOdQ=;
        b=LfBWs63nqQy1rblyIgrwgBQTpQqKvUQAej9JPDfKGrhWreWVsjld906DeJb6lwxR2Z
         W6fdGCS6Cqxp+rIXkjVhiM+WEy4/XfrGBrV2SBZJyRyQu5Edp9mXwTZPTWn8BSX0KFeI
         hOxarKrVX13jGNnX2LDaAs/9DRq4rSx/Gp2psKncBarNQS9PIPBPV89OlIT2Bo+YU7SC
         GKrah/qZ4a7UBkFfHAtr5eGGkG6dcn4LeHAQ1pcTbb6Q8ldnHYpDv7gjtE4LnDkH6BH9
         Qiy4D7Kes7n4E11KGr/9xDtpJKwUl+SB6QYXuAv4yZ7klKODa7MNo3U5TBGT8LTSlFjJ
         i4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790809; x=1756395609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCX6pGKbp51gBD06xhigw6l5OvKROkBX9FJGn66FOdQ=;
        b=pj7LXckOxpEEbHviwe4NrJjyC/ujeYnlcm9Z2es7pZjEYXJp5/WTp9/1YFfuFJ/jK/
         lTojmdICCa0Xg2Y9ptlIjYmmbf5lenY5pVGGfChhBaB1wW23gm3XhCN4hU+AW8hdkZ5O
         A6DWMRtRrZQgflny7fMRAybkJS2ItE/ic7ZmgKRKPXy2wHW8TwiPhplalfTWIuXMnbF3
         LDBC+1Vo90ghXrMldIYXXqsT5aEv0G8jOS6Ia28gkUT8Pxj40aTM2VXbpKX/UrUFTHoV
         8PuCn14o+muCOMCaMvVN1Vh+kVMCl8q62raeVqs+Fo2Ho6nSZa99c2eFYaeH3ByvoX+L
         pLQg==
X-Gm-Message-State: AOJu0Yw0rf185BsNWYYMpWX0VVFCnp0t3Y6tekVg8jYJVgbPAxvoMH3B
	nti/MeTB58tbL6lVm04u9Lf8L/e8rPQWzElwuPecwkgSpUErDtXa0MwuF3afdpA6/fFFhnA6rNB
	AHxCq
X-Gm-Gg: ASbGnctoeQXXKkrRYd8gjk1LpYtqsXv4WLDxmq6sKnM2Vu9jLOIn2/0TnwscEWYx8HR
	EXSljxVzAHrZdunQ5kQ39CFV/nq2HxHJ1MsDZVoua66+xzKe2ZzedlzceAUhJLxZhHpJr7DXyXH
	VkbxWjAScMJxFWEMeJdm7c2CwByFkgUNNF/5tDkLEHBq2lFDk7YpTEGaLVRAPquAnmv0ZL08TdT
	a1Q1fPBb43gu1xuRBMW0PPE2zjIpwX4CtCajkmxUUSERx3PFYlHy+DIgcYa7GnrV25FB8Dxnv4L
	S9UNrJ0SNrFq4pj8xwZyqF2PJwtK93kucrs21hjfCBBeHNaniy8tUU9lTP3GMzncLzyIX6hUxPy
	XmrnKCyqpub9OBg==
X-Google-Smtp-Source: AGHT+IGBgI/QbS9ATCEezMDwMJRiO7gvlU5ExNDwF2x6ECr6S0FwBafCrdN5JaDTFGqJMFWPLtf/ZQ==
X-Received: by 2002:a17:902:db03:b0:240:3e72:efb3 with SMTP id d9443c01a7336-245fede07b4mr47755845ad.43.1755790808759;
        Thu, 21 Aug 2025 08:40:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/15] elfutils: Fix CVE-2025-1372
Date: Thu, 21 Aug 2025 08:39:45 -0700
Message-ID: <76c57e74071f8f2f312d5c62e1f7a1ac74db54be.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222253

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability was found in GNU elfutils 0.192. It has been declared as critical.
Affected by this vulnerability is the function dump_data_section/print_string_section
of the file readelf.c of the component eu-readelf. The manipulation of the argument
z/x leads to buffer overflow. An attack has to be approached locally. The exploit
has been disclosed to the public and may be used. The identifier of the patch is
73db9d2021cab9e23fd734b0a76a612d52a6f1db. It is recommended to apply a patch to fix
this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1372
https://ubuntu.com/security/CVE-2025-1372

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 .../elfutils/files/CVE-2025-1372.patch        | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 2f34bfeebb..4dcc774bb9 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1371.patch \
+           file://CVE-2025-1372.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
new file mode 100644
index 0000000000..c202d8359c
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
@@ -0,0 +1,51 @@
+From 73db9d2021cab9e23fd734b0a76a612d52a6f1db Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 9 Feb 2025 00:07:39 +0100
+Subject: [PATCH] readelf: Skip trying to uncompress sections without a name
+
+When combining eu-readelf -z with -x or -p to dump the data or strings
+in an (corrupted ELF) unnamed numbered section eu-readelf could crash
+trying to check whether the section name starts with .zdebug. Fix this
+by skipping sections without a name.
+
+   * src/readelf.c (dump_data_section): Don't try to gnu decompress a
+   section without a name.
+   (print_string_section): Likewise.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32656
+
+CVE: CVE-2025-1372
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/readelf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index a526fa8..89ee80a 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -13321,7 +13321,7 @@ dump_data_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
+ 			_("Couldn't uncompress section"),
+ 			elf_ndxscn (scn));
+ 	    }
+-	  else if (startswith (name, ".zdebug"))
++	  else if (name && startswith (name, ".zdebug"))
+ 	    {
+ 	      if (elf_compress_gnu (scn, 0, 0) < 0)
+ 		printf ("WARNING: %s [%zd]\n",
+@@ -13372,7 +13372,7 @@ print_string_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
+ 			_("Couldn't uncompress section"),
+ 			elf_ndxscn (scn));
+ 	    }
+-	  else if (startswith (name, ".zdebug"))
++	  else if (name && startswith (name, ".zdebug"))
+ 	    {
+ 	      if (elf_compress_gnu (scn, 0, 0) < 0)
+ 		printf ("WARNING: %s [%zd]\n",
+-- 
+2.43.2
+
-- 
2.43.0


