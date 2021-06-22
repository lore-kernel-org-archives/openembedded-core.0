Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6656.1624355461602327474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: W5uHRYame3MQVegZ7Fwc6CsRjC1zbZjCF6mMhx2LWB0Q4hnFj3bM3Lg5ubj+2Ut9SCLzxIwk6b
 4ABDNh3CavVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014068"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014068"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:58 -0700
IronPort-SDR: FeA9MtMO6by2o1LEEsvtdn6lOoebTL5jo79sbfQ60DLWgliWvN4k53hQCBF+BC1HE1P2f514P9
 RsajNStGQbGg==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260024"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/13] native.bbclass: Do not remove "-native" in the middle of recipe names
Date: Tue, 22 Jun 2021 17:50:23 +0800
Message-Id: <a71d923d0f0e966b17e915a86b5ad7222a947122.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

For dependencies such as "${PN}-foo", when modifying them for native
recipes, it is expected that they become "${BPN}-foo-native" rather
than "${BPN}-native-foo-native". This was previously done by removing
all occurences of "-native" from the dependency before adding
"-native" at the end. However, this fails for a recipe such as
"crate-native-tls" that happens to contain the string "-native" in the
middle of the name. Solve this by simply replacing ${PN} with ${BPN}
in the name instead before adding "-native" at the end

Also simplify adding "-native" to the end of names the recipe provides.
In this case it is not necessary to replace ${PN} with ${BPN} as the
recipes are expected to use ${BPN}-foo in the first place.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edaf8ff278fc96b122c4fc3266b63856e3350f4c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/native.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index a0838e41b9..561cc23f68 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -119,6 +119,7 @@ python native_virtclass_handler () {
     pn = e.data.getVar("PN")
     if not pn.endswith("-native"):
         return
+    bpn = e.data.getVar("BPN")
 
     # Set features here to prevent appends and distro features backfill
     # from modifying native distro features
@@ -146,7 +147,10 @@ python native_virtclass_handler () {
             elif "-cross-" in dep:
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
-                newdeps.append(dep.replace("-native", "") + "-native")
+                # Replace ${PN} with ${BPN} in the dependency to make sure
+                # dependencies on, e.g., ${PN}-foo become ${BPN}-foo-native
+                # rather than ${BPN}-native-foo-native.
+                newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
         d.setVar(varname, " ".join(newdeps), parsing=True)
@@ -166,7 +170,7 @@ python native_virtclass_handler () {
         if prov.find(pn) != -1:
             nprovides.append(prov)
         elif not prov.endswith("-native"):
-            nprovides.append(prov.replace(prov, prov + "-native"))
+            nprovides.append(prov + "-native")
         else:
             nprovides.append(prov)
     e.data.setVar("PROVIDES", ' '.join(nprovides))
-- 
2.31.1

