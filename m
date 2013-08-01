Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 389B86B48F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:17:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2013 10:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="340243460"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.169])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2013 10:17:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:17:16 +0100
Message-Id: <deb18987e98b4da42468cd8162ec9dd88e0d83ba.1375377305.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375377305.git.paul.eggleton@linux.intel.com>
References: <cover.1375377305.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1375377305.git.paul.eggleton@linux.intel.com>
References: <cover.1375377305.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/2] classes/sanity: check for suid root command evility
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
X-List-Received-Date: Thu, 01 Aug 2013 17:17:20 -0000

Some users have been found to have an unnamed third-party piece of
software installed which sets chmod, chown and mknod as suid root as
part of its installation process. This interferes with the operation of
pseudo and can result in files really being owned by root within the
build output, and therefore breaks the build, apart from being a
security issue. Check for this and bail out if it is found.

Reported-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 08ab1b7..cc67490 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -530,6 +530,16 @@ def check_sanity_version_change(status, d):
     tmpdir = d.getVar('TMPDIR', True)
     status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
 
+    # Some third-party software apparently relies on chmod etc. being suid root (!!)
+    import stat
+    suid_check_bins = "chown chmod mknod".split()
+    for bin_cmd in suid_check_bins:
+        bin_path = bb.utils.which(os.environ["PATH"], bin_cmd)
+        if bin_path:
+            bin_stat = os.stat(bin_path)
+            if bin_stat.st_uid == 0 and bin_stat.st_mode & stat.S_ISUID:
+                status.addresult('%s has the setuid bit set. This interferes with pseudo and may cause other issues that break the build process.\n' % bin_path)
+
     # Check that we can fetch from various network transports
     netcheck = check_connectivity(d)
     status.addresult(netcheck)
-- 
1.8.1.2


