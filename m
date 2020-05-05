Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.3182.1588661884067937986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DEM0oU1IqJ+lwSkZDpB+na3OSiwduuNydPgk6I2ayJ5sjcQ0P3dsy/rI/UihUsadFw5FSDug0Z
 T+c/+GAFg8VA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:03 -0700
IronPort-SDR: 8003rAFxklryxudNMQ3wrVLpATjeMYTAjXijO5fa/iQhG5sv3DIfmkkYxgH2aRLR7chyriuE3/
 v32sTKl6ej8g==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144670"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:57:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 03/18] prservice.py: fix do_package with newer Python in Ubuntu 20.04
Date: Tue,  5 May 2020 14:56:38 +0800
Message-Id: <c314c6695acca9ea68e38359fb03a94afa37bb2b.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
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
2.25.4

