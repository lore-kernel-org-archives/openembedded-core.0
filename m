Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.57914.1600077593044566143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DAARYdgj;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 85079209F314
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 02:59:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 85079209F314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1600077592;
	bh=b73pASN65OAxCcqlD9XEjrVPMf5mdh1gJl/Ug6ujFqc=;
	h=From:To:Subject:Date:From;
	b=DAARYdgjminQJtJT7GpqmkJTCX1fVrsnV6YGlKkFj+4eHTNS+L0NZ4fsAzYVLqle9
	 y9uQAlGamyZgqd+oH1d2da258fmQy6FYb/6t4/ByJBvaLCB1FAsmhTiVVqDf8Is+1D
	 AzBWn8nZHMn4kkonL5ZQ/aBuS72QGYsGc7E1Kt3g=
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
Date: Mon, 14 Sep 2020 02:59:31 -0700
Message-Id: <1600077571-7368-1-git-send-email-pemorrow@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

The default compression algorithm is currently gzip, this patch allows the
default to be changed by setting SQUASHFS_TOOLS_COMP_DEFAULT to a valid
compression algorithm.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index b06951d..42fae28 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -25,6 +25,9 @@ PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
 PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
 PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
 
+SQUASHFS_TOOLS_COMP_DEFAULT ?= "gzip"
+EXTRA_OEMAKE += "COMP_DEFAULT=${SQUASHFS_TOOLS_COMP_DEFAULT}"
+
 do_compile() {
 	oe_runmake all
 }
-- 
1.8.3.1

