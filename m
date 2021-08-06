Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.2518.1628240614581025644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17693WcS014258
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Aug 2021 02:03:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 6 Aug 2021 02:03:32 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 6 Aug 2021 02:03:32 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/2] convert-overrides.py: also convert comments without a leading whitespace
Date: Fri, 6 Aug 2021 02:03:31 -0700
Message-ID: <20210806090332.14065-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently lines like below are converted.
  e.g.
  # IMAGE_INSTALL_append = " A"

But lines without a leading whitespace are not converted.
  e.g.
  #IMAGE_INSTALL_append = " A"

We should be converting both.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/contrib/convert-overrides.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index e4a310d1d6..4d41a4c475 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -69,15 +69,15 @@ packagevars = packagevars + imagevars
 
 vars_re = {}
 for exp in vars:
-    vars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp), r"\1:" + exp)
+    vars_re[exp] = (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp), r"\1:" + exp)
 
 shortvars_re = {}
 for exp in shortvars:
-    shortvars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
+    shortvars_re[exp] = (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp + '([\(\'"\s:])'), r"\1:" + exp + r"\3")
 
 package_re = {}
 for exp in packagevars:
-    package_re[exp] = (re.compile('(^|[\'"\s\-\+]+)' + exp + '_' + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
+    package_re[exp] = (re.compile('(^|[#\'"\s\-\+]+)' + exp + '_' + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
 
 # Other substitutions to make
 subs = {
-- 
2.30.2

