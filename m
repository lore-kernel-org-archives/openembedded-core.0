Return-Path: <amanda.r.brindle@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 894A17891A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 19:12:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 12:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,345,1517904000"; d="scan'208";a="41343266"
Received: from aurora.jf.intel.com ([10.7.198.68])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2018 12:12:15 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 12:12:15 -0700
Message-Id: <4c681ca4c996f8d8dd6855282442576383e3a858.1521745841.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521745841.git.amanda.r.brindle@intel.com>
References: <cover.1521745841.git.amanda.r.brindle@intel.com>
Cc: Amanda Brindle <amanda.r.brindle@intel.com>, stephano.cetola@intel.com
Subject: [PATCH v2 1/1] waf.bbclass: Throw error if waf doesn't exist
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
X-List-Received-Date: Thu, 22 Mar 2018 19:12:14 -0000

Before, waf.bbclass would fail to catch FileNotFoundError. Now, it will
catch this error and say that waf doesn't exist.

Fixes [YOCTO 12553]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 meta/classes/waf.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index f9a851d..19e9376 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -15,6 +15,8 @@ python waf_preconfigure() {
             d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
     except subprocess.CalledProcessError as e:
         bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % e.returncode)
+    except FileNotFoundError:
+        bb.fatal("waf does not exist in %s" % subsrcdir)
 }
 
 do_configure[prefuncs] += "waf_preconfigure"
-- 
2.7.4


