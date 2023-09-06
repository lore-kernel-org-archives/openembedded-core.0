Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB614EB8FAA
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:40:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.292.1693968057863853420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DO8Tuw9x;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693968058; x=1725504058;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=E1in45u8M79oeeHXQOUy9o7BHGK8INy6pp3HMYRTsJA=;
  b=DO8Tuw9xfpnRXNDGTqqj/vKy0guJi48AbE1F40m+B6S7US6m+TSdCXtR
   ntioOHbVp1RHgDD+r0V3D0V8Ki8HzS1TzggNW2xXQ6ehPWgaCKbuPl5XA
   yHHV1v2NFSTCnMvX+jZL3y6GlaYd1U6GPEUSKpofkAyQTeK8qNjMf1TPX
   zFFJoUjmWjVYw4fSUVanwRUTeYB+XeEnoFpKPzUeKHK/3xKggIloyardK
   NzYmaXQ0OYVrPIXk4xk51hp4MJqKoOnaOojvMSrJQ9RffkrqepX5I02NO
   gfqWG1dsPv77gaMw9+EQPqwaYBKv31n0wcAiKQVuCWbxu6HUrH2FkJf+x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407953259"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407953259"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 19:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776408651"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="776408651"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 19:40:56 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/5] libxpm: fix CVE-2022-46285
Date: Wed,  6 Sep 2023 10:21:15 +0800
Message-Id: <20230906022118.1593547-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230906022118.1593547-1-chee.yang.lee@intel.com>
References: <20230906022118.1593547-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 02:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187269

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../xorg-lib/libxpm/CVE-2022-46285.patch      | 40 +++++++++++++++++++
 .../xorg-lib/libxpm_3.5.13.bb                 |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch b/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
new file mode 100644
index 0000000000..e8b654dfb2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
@@ -0,0 +1,40 @@
+CVE: CVE-2022-46285
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/a3a7c6dcc3b629d7650148 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From a3a7c6dcc3b629d765014816c566c63165c63ca8 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sat, 17 Dec 2022 12:23:45 -0800
+Subject: [PATCH] Fix CVE-2022-46285: Infinite loop on unclosed comments
+
+When reading XPM images from a file with libXpm 3.5.14 or older, if a
+comment in the file is not closed (i.e. a C-style comment starts with
+"/*" and is missing the closing "*/"), the ParseComment() function will
+loop forever calling getc() to try to read the rest of the comment,
+failing to notice that it has returned EOF, which may cause a denial of
+service to the calling program.
+
+Reported-by: Marco Ivaldi <raptor@0xdeadbeef.info>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+ src/data.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/data.c b/src/data.c
+index 898889c..bfad4ff 100644
+--- a/src/data.c
++++ b/src/data.c
+@@ -174,6 +174,10 @@ ParseComment(xpmData *data)
+ 		notend = 0;
+ 		Ungetc(data, *s, file);
+ 	    }
++	    else if (c == EOF) {
++		/* hit end of file before the end of the comment */
++		return XpmFileInvalid;
++	    }
+ 	}
+ 	return 0;
+     }
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
index fda8e32d2c..8937e61cb5 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
@@ -21,6 +21,8 @@ PACKAGES =+ "sxpm cxpm"
 FILES_cxpm = "${bindir}/cxpm"
 FILES_sxpm = "${bindir}/sxpm"
 
+SRC_URI += " file://CVE-2022-46285.patch"
+
 SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
 SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
 
-- 
2.37.3


