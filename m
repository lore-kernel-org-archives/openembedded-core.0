Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SYzfZ-0006na-DY
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:07:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 May 2012 05:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="149243390"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.22])
	by orsmga002.jf.intel.com with ESMTP; 28 May 2012 05:57:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 13:57:11 +0100
Message-Id: <981510e35f03f1c90e7ab2cf4fd7a0bbe5045f67.1338209763.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1338209763.git.paul.eggleton@linux.intel.com>
References: <cover.1338209763.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1338209763.git.paul.eggleton@linux.intel.com>
References: <cover.1338209763.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] buildhistory_analysis: fix error when version specifier missing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2012 13:07:33 -0000

Passing None to split_versions() will raise an exception, so check that
the version is specified before passing it in.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 313416c..29dc4a9 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -272,7 +272,7 @@ def compare_pkg_lists(astr, bstr):
         if k in depverb:
             dva = depvera[k]
             dvb = depverb[k]
-            if dva != dvb:
+            if dva and dvb and dva != dvb:
                 if bb.utils.vercmp(split_version(dva), split_version(dvb)) < 0:
                     remove.append(k)
 
-- 
1.7.9.5



