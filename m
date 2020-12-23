Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: AoPkInnX7Po4DS0XB104sR3yNngWgFh3R6mLyHhuWb4RW24bvOcaoRmDX6k95FlMGiz/oE3ioL
 BSIaDjT85ndg==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236010"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236010"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:05 -0800
IronPort-SDR: F5q+eWgTMXk02BKgcT0hgw6ZGoWSjDhSsZO7S5NYie5X4lrexjSTppHDnjL353QER+1yQE4Sa3
 AtNVyr+0Br/Q==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027535"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:04 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/35] grub: Add second fix for determinism issue
Date: Wed, 23 Dec 2020 23:18:20 +0800
Message-Id: <5d758a1568e5bd03fc55885d1a26de34aee7ebbd.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is a second list sorting problem in a generator script within grub,
add a sort() of a list to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb5e96e05930eaff4d679166416d6c84d6e3236b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index c4b1d3a2a8..fac80e7b54 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -4,6 +4,10 @@ depending on how awk sorts the values in the array.
 
 Be deterministic in the output by sorting the dependencies on each line.
 
+Also, the output of the SOURCES lines in grub-core/Makefile.core.am, generated
+from grub-core/Makefile.core.def with gentpl.py is not deterministic due to
+missing sorting of the list used to generate it. Add such a sort.
+
 Upstream-Status: Pending
 Richard Purdie <richard.purdie@linuxfoundation.org>
 
@@ -22,3 +26,15 @@ Index: grub-2.04/grub-core/genmoddep.awk
        modlist = modlist " " depmod;
        inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
        depcount[mod]++
+Index: grub-2.04/gentpl.py
+===================================================================
+--- grub-2.04.orig/gentpl.py
++++ grub-2.04/gentpl.py
+@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platfor
+     for group in RMAP[platform]:
+         for value in defn.find_all(group + suffix):
+             r.append(closure(value))
++    r.sort()
+     return ''.join(r)
+ 
+ def platform_conditional(platform, closure):
-- 
2.29.2

