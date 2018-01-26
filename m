Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA2E78520
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 01:02:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jan 2018 17:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,414,1511856000"; d="scan'208";a="26426737"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2018 17:02:59 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 17:03:11 -0800
Message-Id: <1516928591-64380-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] package_rpm.bbclass: improve reproducibility of RPM packages
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
X-List-Received-Date: Fri, 26 Jan 2018 01:02:58 -0000

The RPM packages contain BUILDHOST based on the current build host.
This breaks reproducibility if the same package is build on two different hosts.
To improve reproducible builds, we always set BUILDHOST as "reproducible".

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b08608c..15fed01 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -669,6 +669,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_binary_payload w6T.xzdio'"
     cmd = cmd + " --define '_source_payload w6T.xzdio'"
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
+    cmd = cmd + " --define '_buildhost reproducible'"
     if perfiledeps:
         cmd = cmd + " --define '__find_requires " + outdepends + "'"
         cmd = cmd + " --define '__find_provides " + outprovides + "'"
-- 
2.7.4


