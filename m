Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E00AC3527A
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.3165.1650419971168400442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=N0qQoSVZ;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419971; x=1681955971;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j/xX7DFjFnHgSSt0x2egjZ0QsWhqFc6RiRrOenAeLmY=;
  b=N0qQoSVZqELw0jFiYr4Lq2A5/AS07USJ2XG/EtwyT5KDOmmTz415uGcp
   RlV998VK/PQ2j18betb32vRuQTY6bbr8VyJ52bThomh5lMrkt00M+yJuc
   XRuKmYFm7+ZsbWS2/J9yyqVgJtas/XmU0TQ3w4HF3l1HD67uhHYLWFH7q
   2MlSDoGyMPvK2ltuNXBJq6ZXW1p3saK6m37s/J72SvLuNkTD+eqh60b4m
   PhsRzkdLRcXnRez7KwdZDfWqP8vH88nWnr5bbzQiNcefgSvSHdCpSchjb
   FOrGIXKyMsOG2MgF8zfx8W11YHbzfjh5Gzt9sJcJFVNz4l2puV94Gj2Sc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350364623"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="350364623"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071412"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/11] unzip: fix CVE-2021-4217
Date: Wed, 20 Apr 2022 09:59:07 +0800
Message-Id: 
 <57b608a3c37d24b2d407b178b16136c1ff65b2c4.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164641

From: Joe Slater <joe.slater@windriver.com>

Avoid a null pointer dereference.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 36db85b9b127e5a9f5d3d6e428168cf597ab95f3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../unzip/unzip/CVE-2021-4217.patch           | 67 +++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
new file mode 100644
index 0000000000..6ba2b879a3
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
@@ -0,0 +1,67 @@
+From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
+From: Nils Bars <nils.bars@t-online.de>
+Date: Mon, 17 Jan 2022 16:53:16 +0000
+Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
+
+This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
+to read as many bytes as indicated by the extra field length attribute.
+Furthermore, this fixes a null pointer dereference if an archive contains an
+`EF_UNIPATH` extra field but does not have a filename set.
+---
+ fileio.c  | 5 ++++-
+ process.c | 6 +++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-) 
+---
+
+Patch from:
+https://bugs.launchpad.net/ubuntu/+source/unzip/+bug/1957077
+https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+Regenerated to apply without offsets.
+
+CVE: CVE-2021-4217
+
+Upstream-Status: Pending [infozip upstream inactive]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/fileio.c b/fileio.c
+index 14460f3..1dc319e 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -2301,8 +2301,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
+             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
+                       (G.inptr-G.inbuf) + length);
+         } else {
+-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
++            if (bytes_read == 0)
+                 return PK_EOF;
++            if (bytes_read != length)
++                return PK_ERR;
+             /* Looks like here is where extra fields are read */
+             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
+             {
+diff --git a/process.c b/process.c
+index 5f8f6c6..de843a5 100644
+--- a/process.c
++++ b/process.c
+@@ -2058,10 +2058,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
+           G.unipath_checksum = makelong(offset + ef_buf);
+           offset += 4;
+ 
++          if (!G.filename_full) {
++            /* Check if we have a unicode extra section but no filename set */
++            return PK_ERR;
++          }
++
+           /*
+            * Compute 32-bit crc
+            */
+-
+           chksum = crc32(chksum, (uch *)(G.filename_full),
+                          strlen(G.filename_full));
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 0bc6abcd4b..d074db37b4 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://CVE-2019-13232_p2.patch \
 	file://CVE-2019-13232_p3.patch \
 	file://unzip_optimization.patch \
+        file://CVE-2021-4217.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.35.1


