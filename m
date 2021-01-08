Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OEolUYDSnwntHEdkTTmTtwiwSAuugUy3yZo758vxL/qrL1KJo27Ov4MDIfX9sj4j5jqeuKgGhu
 vt1vIwx5cgng==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613657"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613657"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:30 -0800
IronPort-SDR: vC4lDLbxxrofXC6YVkDDfGCA3VUXfYu2cWI4mOjVErmHc52EB9NTh7/Ld+VkzeIM1IMjyfWrqu
 rjgBR0v46LIw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209385"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/30] grub: Further reproducibility fix
Date: Fri,  8 Jan 2021 12:17:51 +0800
Message-Id: <c0f96eadf9a85c911ba551d619c32794bb620dde.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix the ordering in the generated unidata.c file to aid reproducibility.

[YOCTO #14167]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d9c9f7604fd32ef926726a46ae053bbab6ccb4f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index fac80e7b54..3c1f562c71 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -8,6 +8,9 @@ Also, the output of the SOURCES lines in grub-core/Makefile.core.am, generated
 from grub-core/Makefile.core.def with gentpl.py is not deterministic due to
 missing sorting of the list used to generate it. Add such a sort.
 
+Also ensure the generated unidata.c file is deterministic by sorting the
+keys of the dict.
+
 Upstream-Status: Pending
 Richard Purdie <richard.purdie@linuxfoundation.org>
 
@@ -38,3 +41,16 @@ Index: grub-2.04/gentpl.py
      return ''.join(r)
  
  def platform_conditional(platform, closure):
+Index: grub-2.04/util/import_unicode.py
+===================================================================
+--- grub-2.04.orig/util/import_unicode.py
++++ grub-2.04/util/import_unicode.py
+@@ -174,7 +174,7 @@ infile.close ()
+ 
+ outfile.write ("struct grub_unicode_arabic_shape grub_unicode_arabic_shapes[] = {\n ")
+ 
+-for x in arabicsubst:
++for x in sorted(arabicsubst):
+     try:
+         if arabicsubst[x]['join'] == "DUAL":
+             outfile.write ("{0x%x, 0x%x, 0x%x, 0x%x, 0x%x},\n " % (arabicsubst[x][0], arabicsubst[x][1], arabicsubst[x][2], arabicsubst[x][3], arabicsubst[x][4]))
-- 
2.29.2

