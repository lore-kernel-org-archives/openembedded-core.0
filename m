Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4749D75794
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 17:05:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Aug 2015 10:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,671,1432623600"; d="scan'208";a="768232452"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2015 10:04:01 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2015 08:58:02 +0000
Message-Id: <757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] package_deb.bbclass: Handle exception when encoding non-ASCII characters
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
X-List-Received-Date: Thu, 13 Aug 2015 17:05:14 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

On package creation, handle exception when encoding non-ASCII characteres.

[YOCTO #6693]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 9e1ed28..374adb6 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -171,6 +171,10 @@ python do_package_deb () {
             bb.utils.unlockfile(lf)
             ctrlfile.close()
             raise bb.build.FuncFailed("Missing field for deb generation: %s" % value)
+        except UnicodeDecodeError:
+            bb.utils.unlockfile(lf)
+            ctrlfile.close()
+            raise bb.build.FuncFailed("Non-ASCII characters found in one of the fields")
         # more fields
 
         custom_fields_chunk = get_package_additional_metadata("deb", localdata)
-- 
1.8.4.5


