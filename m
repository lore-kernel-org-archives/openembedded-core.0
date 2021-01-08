Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Et28bwbuj/C5JBJhT0lJrYxYBHUfh/gTL+WOTl2+ltHKhSfBIbLjw+EyhxLY1idLVXbJ0htXJh
 HWgqY1kKZf1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613653"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613653"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:29 -0800
IronPort-SDR: jZ/Lfp9lBx5O6o2KAIPONYKr2PSP8QfDt8AtGpSW7xVO8B4W388fb5AbPjZSGx9pnSfoVxnIfD
 hjr0injDcHoA==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209381"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/30] patch: fix CVE-2019-20633
Date: Fri,  8 Jan 2021 12:17:50 +0800
Message-Id: <b364688110ce8f4d2085319577f9e08a698d6564.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Scott Murray <scott.murray@konsulko.com>

* CVE detail: https://nvd.nist.gov/vuln/detail/CVE-2019-20633

* upstream tracking: https://savannah.gnu.org/bugs/index.php?56683

* Fixes potential for double free after incomplete fix for CVE-2018-6952
  - src/pch.c (another_hunk): Avoid invalid memory access in context format
    diffs.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be71dd2cc16a4c0d244a76a748f08ca0d9bfeba0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../patch/patch/CVE-2019-20633.patch          | 31 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
new file mode 100644
index 0000000000..03988a179c
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
@@ -0,0 +1,31 @@
+From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 15 Jul 2019 19:10:02 +0200
+Subject: Avoid invalid memory access in context format diffs
+
+* src/pch.c (another_hunk): Avoid invalid memory access in context format
+diffs.
+
+CVE: CVE-2019-20633
+Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+---
+ src/pch.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pch.c b/src/pch.c
+index a500ad9..cb54e03 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1328,6 +1328,7 @@ another_hunk (enum diff difftype, bool rev)
+ 		  ptrn_prefix_context = context;
+ 		ptrn_suffix_context = context;
+ 		if (repl_beginning
++		    || p_end <= 0
+ 		    || (p_end
+ 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
+ 		  {
+-- 
+cgit v1.2.1
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index b5897b357a..1997af0c25 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
+            file://CVE-2019-20633.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.29.2

