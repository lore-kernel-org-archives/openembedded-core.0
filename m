Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEF0C35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:17 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.4554.1741809371338247717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=diBA16Xw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso487176a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809370; x=1742414170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ami0/Av9bOjw7AJqBEH4v50NSG4KG+m71xxHAcr6zI8=;
        b=diBA16XwB75sAcBUDLdqmh6odaKBogmi4yzAgjBjPBxxopuHLZBVdhV9V5g4LATAHw
         rjcNjBvZNm5Qz6QgSfmP0ZNEPbc/Jet3FHBdQ6S+DqPr218D0IiYpl2laKQygtLooyt1
         ae/9bJOgptAmxu8YU0a6Yj4NY9CLUg5tQl1kkUPAaDRb5uWRI28DlCMMNePxhN9vBKtL
         oTsN5nz+t4sA5cq6HnF/jBUZGaVmSLFWsukNJ39AKlQ3+nN/7GzxMzStczZDajpt3tNt
         XJWFgz8DpQrk+PR6HOWvUo6CymFoPRiiJBONTJaskLvxPg0FxtSh0+Ndy4kqp0uqjnDu
         tlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809370; x=1742414170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ami0/Av9bOjw7AJqBEH4v50NSG4KG+m71xxHAcr6zI8=;
        b=udqed+Y/9MhGD5SoXHoc/zfuf/wBt+MMoTedoh3xhknYXkiiDX/J/D0Ammx+dTSOn2
         DfSV+THVuKgsj+sDBp9lFFCml0xAxXpt3p3X8Bn2UHxC3TA9IWwmlKIsLFbQg60+w3VE
         eqSGjj6OZ19frObTLY/jgf1L4+tWfYGcclwqc1O8cASQDlDvORZIEMhqvJSuhqjOXeEk
         5HltZ+8FqPYUfRYOcOWYVUI8KY0skRblN6Y9yew0DOQwcK9XBmLd7akhB5FODViPuoIz
         tZSs0CPcXft6av2JvA/x1NhVfGJTbzZoZvWgFTQPC0luM46T31O68XKHWZTDoymUxSvq
         WXPw==
X-Gm-Message-State: AOJu0YyNGKnrCo0RziHRK6tqgjHY0QVDwrtwMN7QDSOGGyzLdagqfDek
	ZOTombwOuFV9ml1/4n2QQ6eyVa0sgB4bwRZvK/fOjAKIsADRpu86L7AhiBmbqDvRxgcgDL+vM4i
	u
X-Gm-Gg: ASbGncsfvKrxjve+nTLqFodG3xgRRdVZw3Yv26ssG35gAf8XBjt9kmW9TXMSRYxXysd
	o6bZ/p52ySlOwOogOmKVoaQ2SNm3N3nXi/jJEVYI9JsU9Xa5wIRPb7SII0dc4RVGzVkdFqAEI4S
	smsoP1la+t/e2lVo3sjw3oEIsb9LinOiJkepGI9qf4Ci6U1Kj7XYlGo4OL1dz8TM/pUvWD9okgs
	RzU5q8aQu3pToxyL26dl4n/vtRrn3XaMwNAFF3m3Fb8PWHtDVtxPB3MhaPMgo+qO1rm9zNkIi6v
	uCVjrG0kGxGHEmstXNhTD9mKGuPGB1B9alpbsMU96VC2fA==
X-Google-Smtp-Source: AGHT+IFFEhqgNblYskM7HVEZ9/oo7doo+PmDf15NZAjlpbKCWB02BAZQ4V3E33jDS2etwiMNLBXn2A==
X-Received: by 2002:a05:6a21:7a41:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-1f58d3bec3amr13686231637.16.1741809370533;
        Wed, 12 Mar 2025 12:56:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/28] grub: patch CVE-2024-45780
Date: Wed, 12 Mar 2025 12:55:30 -0700
Message-ID: <f3a14813ed012904e64fd9897ea4ddaf622059dd.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212703

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
index 8146ead5db..6fa096c57b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-misc-Implement-grub_strlcpy.patch \
            file://CVE-2024-45781.patch \
            file://CVE-2024-45782_CVE-2024-56737.patch \
+           file://CVE-2024-45780.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


