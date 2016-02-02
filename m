Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE6AC77264
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:08:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2016 10:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="41176366"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2016 10:07:38 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 12:09:37 -0600
Message-Id: <01b550d016c48dd518dfdcd8ffb4e1c3255abbbb.1454436558.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454436558.git.anibal.limon@linux.intel.com>
References: <cover.1454436558.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 21/21] classes/testimage: Fix exportTests function.
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
X-List-Received-Date: Tue, 02 Feb 2016 18:08:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With new structure of TestContext now holds suite and variable
that contains unittest instances,  it can't be exported using
JSON causing and exception.

Adds the suite variable for avoid export it.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 5fafda1..57858e6 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -112,7 +112,7 @@ def exportTests(d,tc):
     savedata["host_dumper"] = {}
     for key in tc.__dict__:
         # special cases
-        if key != "d" and key != "target" and key != "host_dumper":
+        if key != "d" and key != "target" and key != "host_dumper" and key != "suite":
             savedata[key] = getattr(tc, key)
     savedata["target"]["ip"] = tc.target.ip or d.getVar("TEST_TARGET_IP", True)
     savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP", True)
-- 
2.1.4


