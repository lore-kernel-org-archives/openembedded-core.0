Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41EFC2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.4658.1741809172927630033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ln6KVejw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22337bc9ac3so4388045ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809172; x=1742413972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foBHVc7gA79kI2fjro55hXvwMr0msPBEDFda5nm8xR8=;
        b=Ln6KVejwuEqFBtczwiMlH+mj+c2Rt7K8FcUq51flWfXm5HIJguAgY9HzWPvu9As5cY
         bm/eUyS0QUxSXrhoIkvBjJYyNH5BQC4RxtG408hVzaT8pcuctNsoOedgeVOO9EX2xqFO
         5+izJlUGzcR24If7SCLa3rZaviIlpzehvl0/wxFUghct+ETvrqq39yPVjK6xYhTISOFC
         mK94uEWQnGotmiYShX2x+PO0+50MOzejGdJLcS4Kis+wyHUjcLI5SxXqgHnFYs2+feU3
         iFvNSq6YpoSjbr3nYuIguqj89qPtaMjrXY9s0ACq5EwfnSdzYU8b3BWOR+IFEWdgbq1f
         wtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809172; x=1742413972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foBHVc7gA79kI2fjro55hXvwMr0msPBEDFda5nm8xR8=;
        b=TdwZ9N2rGocSiv0rYnZ6581GEh1YrbeRWMwDPiyqYvZTVQMqrW7+beNZOIrAmYYBpv
         vzg8d4ATeUwJ231AbIFWLnz9TrTHI4GiTpAZXy567i5PfgXQwob9F0vafUlswy5oljia
         5hwu2mphJhL6cAPpj5GAB35shuLZGp8vwrQr1FWuhTRHWptSb60flmcL4eSi6INksPgc
         jPGjw9iSLtaJr1bZ0tqxZPFyebw314d/cz/CSL/TJhLYIj2FDzF27K+V20pO1GdETElI
         8VSRaoXBKA6f78RpBRiGX/WB8OzsnKLzfUjCl9GAER0uhqulIqOqSZvqvH+9ot4VvrTI
         amCg==
X-Gm-Message-State: AOJu0YwqE8Aenbjz8lE8Pgcu6jHWp7RinlSYA9GPHaUMcSd/oXVkyNpK
	cB2Q+syNxa4PoUILqPntL/w1q61XReXF4SKxZlhqxmpktb+Kmo1DCBo3vIdAUdn01p4d/8D5qou
	m
X-Gm-Gg: ASbGncsr4I6xvPvN7y2AbpPyKrSKsyWVY3mI5PfwoRLjDN0wGk6QH8DRuADHeCtpCsC
	1051xNEvGvKvU0vndZfzeRjTNiKQ6XS0ou/kW59TT+spzYvJvfqOT8eqM3kyjpoT3tTE8anP/ki
	RX0PZIpNbsmUDFQS3uytJ+AtYxUlG05qDdlvuyO3CS19njZVU2ZrFveNpsMrDLpVd+0kz8sj7w/
	ZqgLKa2iPdUR6SySBnoh9kXCDh+mmoutmtlNRZQlFu56KeOrClb6spyPgIXM6UXT6CPCk+GQ5YK
	M/MVybSkE50QYQ5WtXhE4xsfwFa7rnFMIg5L8hL3xRXQsw==
X-Google-Smtp-Source: AGHT+IFBsmrU844c6HkR2gHdtlIjin5m1T++UtLfSU+p/VxxZ1am2cSp+NXNR+AkgFy3lgkpvpjMPw==
X-Received: by 2002:a05:6a21:1fc5:b0:1f5:86f2:a674 with SMTP id adf61e73a8af0-1f58cb1bc29mr13678223637.12.1741809170627;
        Wed, 12 Mar 2025 12:52:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 07/25] grub: patch CVE-2024-45780
Date: Wed, 12 Mar 2025 12:52:15 -0700
Message-ID: <3c33dbc32859ce45743c507120317a562b1a897d.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212674

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45780.patch           | 93 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45780.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45780.patch b/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
new file mode 100644
index 0000000000..1de0099f94
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
@@ -0,0 +1,93 @@
+From 0087bc6902182fe5cedce2d034c75a79cf6dd4f3 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:58 +0000
+Subject: [PATCH] fs/tar: Integer overflow leads to heap OOB write
+
+Both namesize and linksize are derived from hd.size, a 12-digit octal
+number parsed by read_number(). Later direct arithmetic calculation like
+"namesize + 1" and "linksize + 1" may exceed the maximum value of
+grub_size_t leading to heap OOB write. This patch fixes the issue by
+using grub_add() and checking for an overflow.
+
+Fixes: CVE-2024-45780
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45780
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0087bc6902182fe5cedce2d034c75a79cf6dd4f3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/tar.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
+index 646bce5eb..386c09022 100644
+--- a/grub-core/fs/tar.c
++++ b/grub-core/fs/tar.c
+@@ -25,6 +25,7 @@
+ #include <grub/mm.h>
+ #include <grub/dl.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -76,6 +77,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ {
+   struct head hd;
+   int reread = 0, have_longname = 0, have_longlink = 0;
++  grub_size_t sz;
+ 
+   data->hofs = data->next_hofs;
+ 
+@@ -97,7 +99,11 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	{
+ 	  grub_err_t err;
+ 	  grub_size_t namesize = read_number (hd.size, sizeof (hd.size));
+-	  *name = grub_malloc (namesize + 1);
++
++	  if (grub_add (namesize, 1, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("name size overflow"));
++
++	  *name = grub_malloc (sz);
+ 	  if (*name == NULL)
+ 	    return grub_errno;
+ 	  err = grub_disk_read (data->disk, 0,
+@@ -117,15 +123,19 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	{
+ 	  grub_err_t err;
+ 	  grub_size_t linksize = read_number (hd.size, sizeof (hd.size));
+-	  if (data->linkname_alloc < linksize + 1)
++
++	  if (grub_add (linksize, 1, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("link size overflow"));
++
++	  if (data->linkname_alloc < sz)
+ 	    {
+ 	      char *n;
+-	      n = grub_calloc (2, linksize + 1);
++	      n = grub_calloc (2, sz);
+ 	      if (!n)
+ 		return grub_errno;
+ 	      grub_free (data->linkname);
+ 	      data->linkname = n;
+-	      data->linkname_alloc = 2 * (linksize + 1);
++	      data->linkname_alloc = 2 * (sz);
+ 	    }
+ 
+ 	  err = grub_disk_read (data->disk, 0,
+@@ -148,7 +158,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	  while (extra_size < sizeof (hd.prefix)
+ 		 && hd.prefix[extra_size])
+ 	    extra_size++;
+-	  *name = grub_malloc (sizeof (hd.name) + extra_size + 2);
++
++	  if (grub_add (sizeof (hd.name) + 2, extra_size, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("long name size overflow"));
++	  *name = grub_malloc (sz);
+ 	  if (*name == NULL)
+ 	    return grub_errno;
+ 	  if (hd.prefix[0])
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f5112d773d..01d9be6bc2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-misc-Implement-grub_strlcpy.patch \
            file://CVE-2024-45781.patch \
            file://CVE-2024-45782_CVE-2024-56737.patch \
+           file://CVE-2024-45780.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


