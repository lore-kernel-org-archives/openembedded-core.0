Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7087FCAF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:40:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:15 -0800
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="201485325"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.245])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2019 19:39:03 +0800
Message-Id: <3654b6cc301576805c6eae76603b132d8b8fb5b9.1574422359.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1574422359.git.anuj.mittal@intel.com>
References: <cover.1574422359.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 04/15] cve-update-db-native: don't refresh more than once an hour
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Nov 2019 11:40:14 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

We already fetch the yearly CVE metadata and check that for updates before
downloading the full data, but we can speed up CVE checking further by only
checking the CVE metadata once an hour.

(From OE-Core rev: 50d898fd360c58fe85460517d965f62b7654771a)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2c427a5884..19875a49b1 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -31,8 +31,16 @@ python do_populate_cve_db() {
     db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
     db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
-    proxy = d.getVar("https_proxy")
 
+    # Don't refresh the database more than once an hour
+    try:
+        import time
+        if time.time() - os.path.getmtime(db_file) < (60*60):
+            return
+    except OSError:
+        pass
+
+    proxy = d.getVar("https_proxy")
     if proxy:
         # instantiate an opener but do not install it as the global
         # opener unless if we're really sure it's applicable for all
-- 
2.21.0


