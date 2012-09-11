Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TBN9I-0007Ts-BR
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:52:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Sep 2012 02:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,402,1344236400"; d="scan'208";a="143720392"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.164])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Sep 2012 02:40:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 10:40:15 +0100
Message-Id: <0117d738c5da14ceb5be3c50fd7875d3b9390485.1347356375.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347356375.git.paul.eggleton@linux.intel.com>
References: <cover.1347356375.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347356375.git.paul.eggleton@linux.intel.com>
References: <cover.1347356375.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/sanity: remove obsolete code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 09:52:52 -0000

We can now rely upon the minimum BitBake version having the
SanityCheckFailed event, so remove the code to handle if this is not
there.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1210f14..385d733 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -6,13 +6,8 @@ SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk ch
 
 def raise_sanity_error(msg, d):
     if d.getVar("SANITY_USE_EVENTS", True) == "1":
-        # FIXME: handle when BitBake version is too old to support bb.event.SanityCheckFailed
-        # We can just fire the event directly once the minimum version is bumped beyond 1.15.1
-        try:
-            bb.event.fire(bb.event.SanityCheckFailed(msg), d)
-            return
-        except AttributeError:
-            pass
+        bb.event.fire(bb.event.SanityCheckFailed(msg), d)
+        return
 
     bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
-- 
1.7.9.5



