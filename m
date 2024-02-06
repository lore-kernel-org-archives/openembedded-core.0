Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3B7C48BC0
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:47:27 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.24451.1707234443457907525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JYxwgNNC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d99c5f6bfeso5511005ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 07:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707234442; x=1707839242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3U1zYiltrUU6a+BoXP2bl5zju9uaP+iaN5h6v7fap0=;
        b=JYxwgNNCICNRsrie+HU+3BrAIJUEobvjK0rsHgMpYA6eaBefbll9ayUUQvjQO/MEG5
         Xc7PYTu3sc+yiV+51szanDsCGyiT6NZU60hsSkOPkuxeQLalW9IcP19Qe26Bq/I2NlhM
         r+dxWkk8nvyMpFU6wKsqtrL8AMQ+qNuPM9oD0e5YtD+7BIafno3wkLCRfAMeRvg45dNx
         Oiw3/bNNhvfyRI5BoTaIWFSo09JVzOSFTQFB5qbZJ0U5bm1qW1ONCY0NucqxXnFFP1J2
         YXu9B3eoYR7LoduLhO4yJ/7iUHZcEjEgBmNsxxuiGixKjZoJukNoqKtyhoOPohAuCLgB
         p1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707234442; x=1707839242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3U1zYiltrUU6a+BoXP2bl5zju9uaP+iaN5h6v7fap0=;
        b=s0mm8dIH0WjZirEE16xtEUR//XHP9xD8tOGM3m/4MqwW94wA1QSSblIgZc/qnSa9df
         vVZA6vx4UZdw3enuwSL7gaPbjKdav6kFvGXqqI9gmq7XXDqqHGXJiLIZ04BRvM32LNw/
         jfqh1dHVo9UCEFnTTH20r9soE/7rL+myM8hRCXomsTsNuAq2+a/NdK6c31IHzeHn10Ii
         OItr3IEAmFZynrqm47GsqC8F7ZD7Q3tQdG4VgsKzaDeSs0GQCQuP3LqxBzv3SRrI3iMC
         FaNefztmXU0ISLEvgqN8VoRJkbNMbaYKKEGB+1P4HUyvnRkVAFljYMnOe0mbxcS2hGOE
         P8aQ==
X-Gm-Message-State: AOJu0YwOk1/bXSg6rbnNdxZfOhQcEx//eWZsSsp3XYkX+n/RuSvw0Zkk
	zH0TJmVdXPdyz+bY7F8LM56kN+ZUF2QreJO8M8KlpuE8eKzU9qiSbr22EM8DlHA0a+P42AvBRC6
	GolE=
X-Google-Smtp-Source: AGHT+IFAWMZbcxOyjxksd/gNEs6PUUSpvZXBnDzyZOtgxoJrlLVyGlxpiRzAmZFb0Djyf0DWjRoadg==
X-Received: by 2002:a17:90b:3187:b0:296:2358:6e28 with SMTP id hc7-20020a17090b318700b0029623586e28mr13436544pjb.14.1707234442486;
        Tue, 06 Feb 2024 07:47:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id kx18-20020a17090b229200b0029454cca5c3sm1811452pjb.39.2024.02.06.07.47.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:47:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] gdb: Fix CVE-2023-39129
Date: Tue,  6 Feb 2024 05:45:22 -1000
Message-Id: <67b62fd57d7073b42db2747227d07841d0d064e3.1707234215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707234215.git.steve@sakoman.com>
References: <cover.1707234215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195003

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE: CVE-2023-39129
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0012-CVE-2023-39129.patch         | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 099bd2d8f5..ad2b3ad4b7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
            file://0011-CVE-2023-39128.patch \
+	   file://0012-CVE-2023-39129.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
new file mode 100644
index 0000000000..63fb44d59a
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
@@ -0,0 +1,50 @@
+From: Keith Seitz <keiths@...>
+Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
+Subject: Verify COFF symbol stringtab offset
+X-Git-Tag: gdb-14-branchpoint~473
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a
+
+Verify COFF symbol stringtab offset
+
+This patch addresses an issue with malformed/fuzzed debug information that
+was recently reported in gdb/30639. That bug specifically deals with
+an ASAN issue, but the reproducer provided by the reporter causes a
+another failure outside of ASAN:
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a]
+
+CVE: CVE-2023-39129
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+ 
+ static char *stringtab = NULL;
++static long stringtab_length = 0;
+ 
+ extern void stabsread_clear_cache (void);
+ 
+@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length = length;
+   if (length == sizeof length)	/* Empty table -- just the count.  */
+     return 0;
+ 
+@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entry)
+ 
+   if (symbol_entry->_n._n_n._n_zeroes == 0)
+     {
+-      /* FIXME: Probably should be detecting corrupt symbol files by
+-	 seeing whether offset points to within the stringtab.  */
++      if (symbol_entry->_n._n_n._n_offset > stringtab_length)
++	error (_("COFF Error: string table offset (%ld) outside string table (length %ld)"),
++	       symbol_entry->_n._n_n._n_offset, stringtab_length);
+       result = stringtab + symbol_entry->_n._n_n._n_offset;
+     }
+   else
-- 
2.34.1


