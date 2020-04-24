Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.4298.1587691249570461880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 18:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gO5+yQnUHM3EXg3g1eOwa4JqSBps02hqIl7tm2tsS6pfKz94T0MVyMwAAZNpUqwv+XrsPvW2hU
 Bopo/XqCDzyQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 18:20:49 -0700
IronPort-SDR: UB63mVPzZGqdljYxiIzp3mYl9me+7c3Te5282bQSNVPhdKzETNrJDqq3Qnil5Bk+6uSyfAnJ6T
 Nz9NFemPTD4A==
X-IronPort-AV: E=Sophos;i="5.73,309,1583222400"; 
   d="scan'208";a="246443893"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.163.216])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 18:20:48 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH] prservice.py: fix do_package with newer Python in Ubuntu 20.04
Date: Fri, 24 Apr 2020 09:20:40 +0800
Message-Id: <20200424012040.205411-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* with Ubuntu 20.04 which is using python 3.8 I'm seeing a lot of errors like:
  ERROR: libxml2-2.9.10-r0 do_package: Can NOT get PRAUTO, exception No module named '_sysconfigdata'
  not sure what caused this from python 3.8, but this seems to work
* PRserv is enabled with:
  PRSERV_HOST = "localhost:0"

(From OE-Core rev: 4b26eaf7152fb712aba47a0c746333578f58ee8d)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c23d6f77994698e71d9a011cddec1237158b15ca)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/prservice.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index b1132ccb11..3a5ef8d921 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -3,6 +3,10 @@
 #
 
 def prserv_make_conn(d, check = False):
+    # Otherwise this fails when called from recipes which e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
+    # No module named '_sysconfigdata'
+    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
+        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
-- 
2.25.3

