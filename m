Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UI2ia-00072x-6F
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 21:01:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2JJiHWJ004097
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 12:44:17 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 19 Mar 2013 12:44:17 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 15:20:59 -0500
Message-ID: <1363724459-31561-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1363724459-31561-1-git-send-email-mark.hatle@windriver.com>
References: <1363724459-31561-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] base.bbclass: Update the preferred_ml_updates
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
X-List-Received-Date: Tue, 19 Mar 2013 20:01:15 -0000
Content-Type: text/plain

When processing the blacklists, we should avoid cross-canadian packages, as they
will not have any multilib prefixes to expand.

Similarly look for "virtual/nativesdk-" in addition to the existing "nativesdk-".
These items should also be ignored.

Finally, in order to avoid undeterministic variable key expansion, such as:

MYVAR = "foo"

PREFERRED_PROVIDER_${MYVAR} = "bar"
PREFERRED_PROVIDER_foo = "foobar"

during the multilib processing of PREFERRED_VERSION and PREFERRED_PROVIDER,
the code was changed to rename the variable key, to the final key.  This along
with the existing code avoids the problems.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5fe9a84..181bcfe 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -162,7 +162,7 @@ def preferred_ml_updates(d):
             providers.append(v)
 
     for pkg, reason in blacklists.items():
-        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith("nativesdk-") or 'cross-canadian' in pkg:
+        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
             continue
         for p in prefixes:
             newpkg = p + "-" + pkg
@@ -172,7 +172,7 @@ def preferred_ml_updates(d):
     for v in versions:
         val = d.getVar(v, False)
         pkg = v.replace("PREFERRED_VERSION_", "")
-        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith("nativesdk-"):
+        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
             continue
         if 'cross-canadian' in pkg:
             for p in prefixes:
@@ -182,8 +182,12 @@ def preferred_ml_updates(d):
                 bb.data.update_data(localdata)
                 newname = localdata.expand(v)
                 if newname != v:
-                    newval = localdata.getVar(v, True)
+                    newval = localdata.expand(val)
                     d.setVar(newname, newval)
+            # Avoid future variable key expansion
+            vexp = d.expand(v)
+            if v != vexp and d.getVar(v, False):
+                d.renameVar(v, vexp)
             continue
         for p in prefixes:
             newname = "PREFERRED_VERSION_" + p + "-" + pkg
@@ -193,7 +197,7 @@ def preferred_ml_updates(d):
     for prov in providers:
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
-        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith("nativesdk-"):
+        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
             continue
         if 'cross-canadian' in pkg:
             for p in prefixes:
@@ -205,6 +209,10 @@ def preferred_ml_updates(d):
                 if newname != prov:
                     newval = localdata.expand(val)
                     d.setVar(newname, newval)
+            # Avoid future variable key expansion
+            provexp = d.expand(prov)
+            if prov != provexp and d.getVar(prov, False):
+                d.renameVar(prov, provexp)
             continue
         virt = ""
         if pkg.startswith("virtual/"):
@@ -220,19 +228,23 @@ def preferred_ml_updates(d):
             localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
             bb.data.update_data(localdata)
             newname = localdata.expand(prov)
-            if newname != prov:
+            if newname != prov and not d.getVar(newname, False):
                 d.setVar(newname, localdata.expand(val))
 
             # implement alternative multilib name
             newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
             if not d.getVar(newname, False):
                 d.setVar(newname, val)
+        # Avoid future variable key expansion
+        provexp = d.expand(prov)
+        if prov != provexp and d.getVar(prov, False):
+            d.renameVar(prov, provexp)
 
 
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
     for p in mp:
-        if p.endswith(("-native", "-crosssdk")) or p.startswith("nativesdk-") or 'cross-canadian' in p:
+        if p.endswith(("-native", "-crosssdk")) or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
             continue
         virt = ""
         if p.startswith("virtual/"):
-- 
1.8.1.2.545.g2f19ada



