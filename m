Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8EA6AC6C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 07:16:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s767GLVG002116
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Aug 2014 00:16:22 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 6 Aug 2014 00:16:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 6 Aug 2014 15:16:01 +0800
Message-ID: <ba864b39e49fe87e90ea51a231090b1a857e09c5.1407306581.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407306581.git.hongxu.jia@windriver.com>
References: <cover.1407306581.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/3] bbclass/sstate approach 3: add checking in the return path of sstate_checkhashes
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
X-List-Received-Date: Wed, 06 Aug 2014 07:16:22 -0000
Content-Type: text/plain

In the sstate-cache code, add a checking in the return path of
sstate_checkhashes. If read-only sstate-cache enable, and the
recipe's ${PN} not in the ${SSTATECACHE_WHITELIST}, it trigered
an instant error.

Flaws:
1. We should manually unlock the bitbake lock which the instant error
   msg will exit the build immediately.

...
$ bitbake db
ERROR: Read-only sstate-cache is enabled, the build of
"db rpm-native gcc-runtime eglibc linux-libc-headers libgcc"
did not come from sstate-cache. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to build from source

Summary: There was 1 ERROR message shown, returning a non-zero exit code.
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate.bbclass | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0d3940e..17cd109 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -41,6 +41,14 @@ EXTRA_STAGING_FIXMES ?= ""
 sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
 sstate_unpack_package[dirs] = "${SSTATE_INSTDIR}"
 
+# 1) If ${SSTATECACHE_WHITELIST} is "", it means read-only sstate-cache
+#    disabled;
+#
+# 2) If read-only sstate-cache enabled and the recipe's ${PN} not listed
+#    in ${SSTATECACHE_WHITELIST}, the build from source will triger an
+#    instant error;
+SSTATECACHE_WHITELIST ?= ""
+
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
@@ -382,6 +390,15 @@ sstate_clean[vardepsexclude] = "SSTATE_MANFILEPREFIX"
 CLEANFUNCS += "sstate_cleanall"
 
 python sstate_cleanall() {
+    whitelist = d.getVar('SSTATECACHE_WHITELIST', True) or ""
+    if whitelist:
+        pn = d.getVar('PN', True)
+        if pn not in whitelist.split():
+            msg =  'Read-only sstate-cache is enabled, the clean of \n'
+            msg += '%s is not allowed. Only the recipe listed in\n' % pn
+            msg += 'SSTATECACHE_WHITELIST is allowed to clean sstate-cache'
+            bb.fatal(msg)
+
     bb.note("Removing shared state for package %s" % d.getVar('PN', True))
 
     manifest_dir = d.getVar('SSTATE_MANIFESTS', True)
@@ -704,6 +721,29 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
+    whitelist = d.getVar('SSTATECACHE_WHITELIST', True) or ""
+    if whitelist:
+        missed_pn = []
+        for task in missed:
+            fn = sq_fn[task]
+            data = bb.cache.Cache.loadDataFull(fn, '', d)
+            pn = data.getVar('PN', True) or ""
+            if pn and pn not in missed_pn:
+                missed_pn.append(pn)
+
+        if missed_pn:
+            blacklist = [pn for pn in missed_pn if pn not in whitelist.split()]
+            if blacklist:
+                # We should manually unlock the bitbake lock, because the fatal
+                # msg will exit the build immediately.
+                lockfile = d.expand("${TOPDIR}/bitbake.lock")
+                os.unlink(lockfile)
+                msg =  'Read-only sstate-cache is enabled, the build of \n'
+                msg += '"' + ' '.join(blacklist) + '"\n'
+                msg += 'did not come from sstate-cache. Only the recipe listed in\n'
+                msg += 'SSTATECACHE_WHITELIST is allowed to build from source'
+                bb.msg.fatal('sstate', msg)
+
     return ret
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
-- 
1.9.1


