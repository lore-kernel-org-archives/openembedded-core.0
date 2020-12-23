Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WNlLa0iUBO4S/C0FQFLJC7TaL73150fskYf4ii4kULIZKDiy5MIdW+/hroAvID3UXh0tbb0Bsp
 ZOXYySHrufqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235994"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235994"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:04 -0800
IronPort-SDR: hQxvZqIZj4r+W5DbvPAo+oYIGaSX/aO3NaRm8KXmadfcOZY4OCgj8S/QnIUDawLdB3K5Hj9ZdZ
 GNfAD2YNQLaw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027531"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:03 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/35] grub: Fix build reproducibility issue
Date: Wed, 23 Dec 2020 23:18:19 +0800
Message-Id: <c494d69efbc9035d6d9ff8dae8a606aeaf378adc.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing reproducibility issue on the autobuilder due to changing
module dependency ordering. Add some sorting to an awk script to fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 925ddd5edccbfec52ff45c1b54ab2ae1bfe0d57c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 24 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/determinism.patch

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
new file mode 100644
index 0000000000..c4b1d3a2a8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -0,0 +1,24 @@
+The output in moddep.lst generated from syminfo.lst using genmoddep.awk is
+not deterministic since the order of the dependencies on each line can vary
+depending on how awk sorts the values in the array.
+
+Be deterministic in the output by sorting the dependencies on each line.
+
+Upstream-Status: Pending
+Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: grub-2.04/grub-core/genmoddep.awk
+===================================================================
+--- grub-2.04.orig/grub-core/genmoddep.awk
++++ grub-2.04/grub-core/genmoddep.awk
+@@ -59,7 +59,9 @@ END {
+     }
+     modlist = ""
+     depcount[mod] = 0
+-    for (depmod in uniqmods) {
++    n = asorti(uniqmods, w)
++    for (i = 1; i <= n; i++) {
++      depmod = w[i]
+       modlist = modlist " " depmod;
+       inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
+       depcount[mod]++
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ff17dbe8b7..95c25d78f9 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://script-Remove-unused-fields-from-grub_script_functio.patch \
            file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
            file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
+           file://determinism.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.29.2

