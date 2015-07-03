Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3F2975D25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:40:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t638elAX016425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 01:40:47 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 3 Jul 2015 01:40:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 01:40:46 -0700
Message-ID: <1f153bbbdc6b7db05529fda3b36464f646f8fcb8.1435912813.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435912813.git.liezhi.yang@windriver.com>
References: <cover.1435912813.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib_global.bbclass: fix PREFERRED_VERSION for cross-canadian
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
X-List-Received-Date: Fri, 03 Jul 2015 08:40:49 -0000
Content-Type: text/plain

Fixed:
When both gcc 4.9 and 5.1 are in the layer, and set these in local.conf:
GCCVERSION = "4.9%"
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake gcc-cross-canadian-i586

Then gcc 5.1 would be built rather than 4.9, it is because
multilib_virtclass_handler() doesn't reset PN such as gcc-cross-canadian
to lib32-gcc-cross-canadian, but preferred_ml_updates() rename
PREFERRED_VERSION_gcc-cross-canadian to
PREFERRED_VERSION_lib32-gcc-cross-canadian, so it can't get the required
value PREFERRED_VERSION_gcc-cross-canadian, and then gcc 5.1 would be
used, don't reset it in preferred_ml_updates() will fix the problem.

[YOCTO #7950]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib_global.bbclass |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 67bd70d..a9c0efc 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -30,7 +30,16 @@ def preferred_ml_updates(d):
                 override = ":virtclass-multilib-" + p
                 localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
                 bb.data.update_data(localdata)
-                newname = localdata.expand(v).replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p + '-')
+                # Because multilib_virtclass_handler() doesn't reset PN such as
+                # gcc-cross-canadian to lib32-gcc-cross-canadian, so don't
+                # reset PREFERRED_VERSION_gcc-cross-canadian to
+                # PREFERRED_VERSION_lib32-gcc-cross-canadian, just expand v
+                # (need expand TRANSLATED_TARGET_ARCH) and set
+                # PREFERRED_VERSION_gcc-cross-canadian again.
+                if '-cross-canadian-' in pkg:
+                    newname = localdata.expand(v)
+                else:
+                    newname = localdata.expand(v).replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p + '-')
                 if newname != v:
                     newval = localdata.expand(val)
                     d.setVar(newname, newval)
@@ -49,7 +58,7 @@ def preferred_ml_updates(d):
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
         if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
             continue
-        if 'cross-canadian' in pkg:
+        if '-cross-canadian-' in pkg:
             for p in prefixes:
                 localdata = bb.data.createCopy(d)
                 override = ":virtclass-multilib-" + p
@@ -94,7 +103,7 @@ def preferred_ml_updates(d):
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
     for p in mp:
-        if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in p:
+        if p.endswith("-native") or "-crosssdk-" in p or p.startswith(("nativesdk-", "virtual/nativesdk-")) or '-cross-canadian-' in p:
             continue
         virt = ""
         if p.startswith("virtual/"):
-- 
1.7.9.5


