Return-Path: <alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 282F678408
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 01:06:43 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5FNG4t5006540 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 18:17:29 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2b43qw00ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 18:17:29 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5FNHSYu006005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 18:17:28 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 15 Jun 2017 18:17:28 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 15 Jun 2017 18:17:28 -0500
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 15 Jun 2017 18:17:28 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jun 2017 18:17:27 -0500
Message-ID: <1497568647-2740-2-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497568647-2740-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1497568647-2740-1-git-send-email-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-15_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=15 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706150402
Subject: [PATCH 2/2] opkg: upgrade to v0.3.5
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
X-List-Received-Date: Fri, 16 Jun 2017 01:06:47 -0000
Content-Type: text/plain

Drop status-conffile.patch, present in 0.3.5.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../opkg/opkg/status-conffile.patch                | 69 ----------------------
 .../opkg/{opkg_0.3.4.bb => opkg_0.3.5.bb}          |  5 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.4.bb => opkg_0.3.5.bb} (93%)

diff --git a/meta/recipes-devtools/opkg/opkg/status-conffile.patch b/meta/recipes-devtools/opkg/opkg/status-conffile.patch
deleted file mode 100644
index 6fc405b..0000000
--- a/meta/recipes-devtools/opkg/opkg/status-conffile.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 086d5083dfe0102368cb7c8ce89b0c06b64ca773 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 10 Jan 2017 15:24:59 +0000
-Subject: [PATCH 1/2] opkg_cmd: only look at conffile status if we're going to
- output it
-
-The loop to compare the recorded conffile hash with their hash on disk is
-outputted at level INFO but the loop was executed at level NOTICE and higher.
-
-This means that if a conffile had been deleted the status operation would
-produce error messages for output it isn't displaying.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- libopkg/opkg_cmd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libopkg/opkg_cmd.c b/libopkg/opkg_cmd.c
-index ba57c6a..37416fd 100644
---- a/libopkg/opkg_cmd.c
-+++ b/libopkg/opkg_cmd.c
-@@ -638,7 +638,7 @@ static int opkg_info_status_cmd(int argc, char **argv, int installed_only)
- 
-         pkg_formatted_info(stdout, pkg);
- 
--        if (opkg_config->verbosity >= NOTICE) {
-+        if (opkg_config->verbosity >= INFO) {
-             conffile_list_elt_t *iter;
-             for (iter = nv_pair_list_first(&pkg->conffiles); iter;
-                  iter = nv_pair_list_next(&pkg->conffiles, iter)) {
--- 
-2.8.1
-
-From 225e30e0f9fa7cfeaa3f89e2713e5147ab371def Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 10 Jan 2017 15:28:47 +0000
-Subject: [PATCH 2/2] conffile: gracefully handle deleted conffiles in
- conffile_has_been_modified
-
-Handle conffiles that don't exist gracefully so that instead of showing an error
-message from file_md5sum_alloc() a notice that the file has been deleted is
-shown instead.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- libopkg/conffile.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libopkg/conffile.c b/libopkg/conffile.c
-index b2f2469..7b4b87b 100644
---- a/libopkg/conffile.c
-+++ b/libopkg/conffile.c
-@@ -51,6 +51,11 @@ int conffile_has_been_modified(conffile_t * conffile)
-     }
- 
-     root_filename = root_filename_alloc(filename);
-+    if (!file_exists(root_filename)) {
-+        opkg_msg(INFO, "Conffile %s deleted\n", conffile->name);
-+        free(root_filename);
-+        return 1;
-+    }
- 
-     md5sum = file_md5sum_alloc(root_filename);
- 
--- 
-2.8.1
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.4.bb b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
similarity index 93%
rename from meta/recipes-devtools/opkg/opkg_0.3.4.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.5.bb
index a21fde1..3e511b6 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
@@ -15,11 +15,10 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg-configure.service \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://status-conffile.patch \
 "
 
-SRC_URI[md5sum] = "6c52a065499056a196e0b45a27e392de"
-SRC_URI[sha256sum] = "750b900b53b62a9b280b601a196f02da81091eda2f3478c509512aa5a1ec93be"
+SRC_URI[md5sum] = "d202d09ea0932943071b842626cab13c"
+SRC_URI[sha256sum] = "734bc21dea11262113fa86b928d09812618b3966f352350cf916a6ae0d343f32"
 
 inherit autotools pkgconfig systemd
 
-- 
2.7.4


