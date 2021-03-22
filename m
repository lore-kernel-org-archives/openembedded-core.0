Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: E/iEfj93ULvauO/EamnFyX/YfhE9meCYTn+FQSL5OBRPfDdJfDE9YyTzwU6Jyg3R3LF/9MIMHU
 E5CP+fjAe/+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211616"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211616"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:55 -0700
IronPort-SDR: FzKHbjJRtAji3uSFW1VSH6DbNffbRrdOjMpdP63kMYArQ/kCbYSgKfZ/DJ4pChO84QIZkdqKNq
 5MzevCAG/nCA==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295202"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/25] selftest/reproducible: Don't call sync between each file compare
Date: Mon, 22 Mar 2021 09:41:15 +0800
Message-Id: <1fddd6b891265956e0a26963459e7511d757cace.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Calling sync between each file compare is horrible performance wise
as we compare thousands of files. We don't care about IO latency here
so disable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 25f78abd8bbeb201fd9452e7983e015027954948)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 4f9adaf301..cd7be7d436 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -68,7 +68,7 @@ def compare_file(reference, test, diffutils_sysroot):
         result.status = MISSING
         return result
 
-    r = runCmd(['cmp', '--quiet', reference, test], native_sysroot=diffutils_sysroot, ignore_status=True)
+    r = runCmd(['cmp', '--quiet', reference, test], native_sysroot=diffutils_sysroot, ignore_status=True, sync=False)
 
     if r.status:
         result.status = DIFFERENT
-- 
2.30.2

