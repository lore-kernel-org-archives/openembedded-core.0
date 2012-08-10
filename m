Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SzyL3-0004gH-RY
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 01:09:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7AMw21b017874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 15:58:02 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 10 Aug 2012 15:58:02 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 17:57:59 -0500
Message-ID: <2b1b028b5ad68154cd4a2a2ebd7cc2ff03b50b2b.1344639098.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1344639098.git.peter.seebach@windriver.com>
References: <cover.1344639098.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] base.bbclass: Expand PNBLACKLIST across multilibs too
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
X-List-Received-Date: Fri, 10 Aug 2012 23:09:54 -0000
Content-Type: text/plain

The PNBLACKLIST feature does not currently work with multilibs,
because they have different ${PN}. The obvious thing to do is to
do this at the same point that we do the PREFERRED_PROVIDER
and PREFERRED_VERSION fixups. (Making the PNBLACKLIST check
do the for-each-multilib check requires it to do the multilib
list generation repeatedly.)
---
 meta/classes/base.bbclass |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e15fa26..8677a30 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -151,7 +151,8 @@ def pkgarch_mapping(d):
 
 def preferred_ml_updates(d):
     # If any PREFERRED_PROVIDER or PREFERRED_VERSIONS are set,
-    # we need to mirror these variables in the multilib case
+    # we need to mirror these variables in the multilib case;
+    # likewise the PNBLACKLIST flags.
     multilibs = d.getVar('MULTILIBS', True) or ""
     if not multilibs:
         return
@@ -164,12 +165,19 @@ def preferred_ml_updates(d):
 
     versions = []
     providers = []
+    blacklists = d.getVarFlags('PNBLACKLIST') or []
     for v in d.keys():
         if v.startswith("PREFERRED_VERSION_"):
             versions.append(v)
         if v.startswith("PREFERRED_PROVIDER_"):
             providers.append(v)
 
+    for pkg, reason in blacklists.items():
+        for p in prefixes:
+            newpkg = p + "-" + pkg
+            if not d.getVarFlag('PNBLACKLIST', newpkg, True):
+                d.setVarFlag('PNBLACKLIST', newpkg, reason)
+
     for v in versions:
         val = d.getVar(v, False)
         pkg = v.replace("PREFERRED_VERSION_", "")
-- 
1.7.0.4



