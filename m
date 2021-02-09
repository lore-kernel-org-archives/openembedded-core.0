Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.12227.1612886002393736054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0q9pRAPi/NqNqXQWpSpn0xnZtyshmx0DOYj25k2Qe6mAVSyACsxm+34zO14xOUgOdzt7S4OAj1
 c/v5TVcxsI/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182045241"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="182045241"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:21 -0800
IronPort-SDR: bm6DkzZbe1yF/PzyhuQuERjmT9YoKvBW1aJGotdn1C/AA7RczfFzNEs/qyMQTbUsRjvy6LVgHO
 mAwolCLmhSwg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215614"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 30/35] python3: split python target configuration into own class
Date: Tue,  9 Feb 2021 23:52:15 +0800
Message-Id: <9c1edc57ff179368ddf8a34d074312c88cacc9e4.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Setting _PYTHON_SYSCONFIGDATA_NAME in python3native class globally was
problematic as it was leaking into host python environment, which
was causing tracebacks depending on host distro and action
(typically anything involving importing sysconfig module).

The new class sets the variable only in specific tasks where it is needed,
and should be inherited explicitly:
- use python3native to run scripts with native python
- use python3targetconfig to run scripts with native python
if those scripts need to access target config data (such
as correct installation directories). This also adds a dependency
on target python, so should be used carefully to avoid lengthening builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 823cbf815d6984e813f0ae812f6a14469150eeff)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/python3native.bbclass       |  2 --
 meta/classes/python3targetconfig.bbclass | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/python3targetconfig.bbclass

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index d98fb4c758..2e3a88c126 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -17,8 +17,6 @@ export STAGING_LIBDIR
 export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
 export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
-export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
-
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
 
diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
new file mode 100644
index 0000000000..640d0c97b6
--- /dev/null
+++ b/meta/classes/python3targetconfig.bbclass
@@ -0,0 +1,15 @@
+inherit python3native
+
+DEPENDS_append = " python3"
+
+do_configure_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_compile_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_install_prepend() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
-- 
2.29.2

