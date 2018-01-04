Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 398B1600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 20:01:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 12:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,315,1511856000"; d="scan'208";a="21470716"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2018 12:01:17 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 12:01:13 -0800
Message-Id: <1515096073-16860-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] package_rpm.bbclass: clamp timestamps
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
X-List-Received-Date: Thu, 04 Jan 2018 20:01:16 -0000

Improve binary reproducibility of RPM packages.
Ensure timestamps in RPM packages are not later than the value
of SOURCE_DATE_EPOCH. If SOURCE_DATE_EPOCH is not set,
timestamps are not clamped.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1deaf83..b08608c 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -668,6 +668,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_binary_payload w6T.xzdio'"
     cmd = cmd + " --define '_source_payload w6T.xzdio'"
+    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     if perfiledeps:
         cmd = cmd + " --define '__find_requires " + outdepends + "'"
         cmd = cmd + " --define '__find_provides " + outprovides + "'"
-- 
2.7.4


