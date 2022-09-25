Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D084C6FA92
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:12 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.20497.1664133483897709285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=13QyIV85;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d10so3632868pfh.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=5HrfQdv30CYuvnfvJsuRrAirDiVpvBUaoNFWGqJ65SI=;
        b=13QyIV85cKLhtu1MZlYMQvCWD8pHOZQF6U7MIzViyTUBm47kQj4e/0oTjL51MJqCSm
         yC6eTZYQfYdVpU1SY1BJQFdsRyaVHsG2s2E6TX2McPUs1b0WBNTi9kntDNeIK9lg1t6J
         kXluessb0ysuuFldN9BEW26DJb06M03/Bp4/VEJHruOidh3qhPCUI03YyTWZuZIxnN75
         5eoS6foWMXwLEhrlMPLio4mVupnA9Mu9fG3tcoToGyQdVKsr6sydYFYoAiVDy9S0SA5H
         TIW5jRoXr4bGCnBs6VWGfNKWlTPJeZr0ckbuq4Bs6tysAnGRP/OJ59aFa1D9nwtMfrDU
         jYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5HrfQdv30CYuvnfvJsuRrAirDiVpvBUaoNFWGqJ65SI=;
        b=WXy5Xyh+8dhkd8KywHDwpxmxrI92nD289yrP6TSKNCVhHYJUmx2yuCOo5bUGtGvLU6
         tI3DUvScN66vwj0/7iTrF1hytdTmwWNx8bxhfIz+tDsOGGqIi1h5kgECngHM5A1CbE4n
         Vd3sq14XHwB84h2+Px2S7dZ1ol0dQcn5WmCQvkllioEBhTDct0rd6cvEHg49PGNDUwmc
         rxudrPSOmKSxhaZUGsO9oNxOLJLOatNh81LQhfiYqnC5H14YUfNaf81mjFw05MPP7Er3
         NKv1ju/sJlvIO1M5uRHU9dTYlk6XLdXMjQetq+P2EIiIMrgHelI0LEOsKTv/Wz9vO4J6
         e3TA==
X-Gm-Message-State: ACrzQf0Dl0DluLJVmfYZGPVvzeYAS2mu26NjrhvY4qPaIxVHxvkHIkxS
	xZaF/HSODH3ypn9pZIAhzVWpepvNa0teMW95
X-Google-Smtp-Source: 
 AMsMyM4qyXvhgunk8pwjtrLladA4KvNr8GJFoP2o3bFAPzB6RUIWZzFd+4dtN8YTN04Y/47vwbFwkw==
X-Received: by 2002:a65:40c8:0:b0:434:dfee:8dc1 with SMTP id
 u8-20020a6540c8000000b00434dfee8dc1mr17355832pgp.156.1664133482900;
        Sun, 25 Sep 2022 12:18:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/33] binutils: fix CVE-2022-38126
Date: Sun, 25 Sep 2022 09:17:14 -1000
Message-Id: 
 <1c3eaf29fc21579a8e4aa8ab6c356d773f8a38f5.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171017

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e3e5ae049371a27fd1737aba946fe26d06e029b5]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0016-CVE-2022-38126.patch        | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 8aa8295881..2ddeb0ed39 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0013-Avoid-as-info-race-condition.patch \
      file://0014-CVE-2019-1010204.patch \
      file://0015-CVE-2022-38533.patch \
+     file://0016-CVE-2022-38126.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
new file mode 100644
index 0000000000..8200e28a81
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
@@ -0,0 +1,34 @@
+From e3e5ae049371a27fd1737aba946fe26d06e029b5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 27 Jun 2022 13:43:02 +0100
+Subject: [PATCH] Replace a run-time assertion failure with a warning message
+ when parsing corrupt DWARF data.
+
+	PR 29289
+	* dwarf.c (display_debug_names): Replace assert with a warning
+	message.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e3e5ae049371a27fd1737aba946fe26d06e029b5]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/dwarf.c   | 7 ++++++-
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 37b477b886d..b99c56987da 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -9802,7 +9802,12 @@ display_debug_names (struct dwarf_sectio
+       printf (_("Out of %lu items there are %zu bucket clashes"
+ 		" (longest of %zu entries).\n"),
+ 	      (unsigned long) name_count, hash_clash_count, longest_clash);
+-      assert (name_count == buckets_filled + hash_clash_count);
++
++      if (name_count != buckets_filled + hash_clash_count)
++	warn (_("The name_count (%lu) is not the same as the used bucket_count (%lu) + the hash clash count (%lu)"),
++	      (unsigned long) name_count,
++	      (unsigned long) buckets_filled,
++	      (unsigned long) hash_clash_count);
+ 
+       struct abbrev_lookup_entry
+       {
-- 
2.25.1


