Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 70BF97136A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:03 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u57so1703891wes.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KJcinTWKssBiBQb4VvOUWz+eWWXyAltUusCHcztkHRs=;
	b=bEC67DrOZtFg7BFWAYe7qAewaguV3xDbc8hA+z/p+W7Pyd8qk0J76PsVJwhLdPc0X6
	p1Ja7ZR3NkwG29WJs7MyNHc4LZw+xVJYMSOvnSglyhLtBv1oobx/fvtSv8+xUNyhbu7E
	Sy26JrAePI0+sPeeAUjl8bMq9o13f7oELwnfvAGl1dtGhZ8q67FziIXqgjEtBPreXw8+
	1UEGEnlOVdrf2oO9mVCU1yvPIcpMPIuuCinoPf1hvXrVRiAvdBXhhtH/hq2Pb7x6GSRc
	SK0q6mmd4n3tr86bkocZOzVNCgE69k1ZQLLnkjwUhaDuvPeGfAZwGTt2VQwRGJxFxFUU
	N39Q==
X-Gm-Message-State: ALoCoQm7B91GR5kBxDs/Z5RmBf+PhxrpZmz6ZDwFHn5f9BdApw/zjK/aZkQISBU/LtSPldv67gTM
X-Received: by 10.194.236.132 with SMTP id uu4mr3215016wjc.108.1410177544990; 
	Mon, 08 Sep 2014 04:59:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:28 +0100
Message-Id: <073afda9ae6b22c908190983250a3bb4cac85ee3.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 10/27] bbclass/sstate_readonly: only allowed sstate-cache objects to be built (read-only sstate-cache)
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:04 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

The requirement is the developer who demand only the "new" software
they write is allowed to be compiled from source, they only want to
reuse binaries from an existed sstate-cache, if the developer makes
a change that triggers a rebuild, it should be an instant error.

When the readonly sstate-cache is enabled, an error will be generated
if a recipe is not available within the sstate-cache. Adding recipes
to the whitelist will allow only select recipes to be allowed to build
from source.

[YOCTO #6639]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate_readonly.bbclass |   53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta/classes/sstate_readonly.bbclass

diff --git a/meta/classes/sstate_readonly.bbclass b/meta/classes/sstate_readonly.bbclass
new file mode 100644
index 0000000..488353d
--- /dev/null
+++ b/meta/classes/sstate_readonly.bbclass
@@ -0,0 +1,53 @@
+SSTATE_CHECK_FUNCTIONS_append = " sstate_readonly_check"
+# 1) The read-only sstate-cache will always be enabled if this bbclass
+#    inherited
+#
+# 2) If ${SSTATECACHE_WHITELIST} is "", it means always blacklist
+#    everything
+#
+# 3) Adding recipes to ${SSTATECACHE_WHITELIST} will allow only select
+#    recipes to be allowed to build
+#
+# 4) While recipes not in ${SSTATECACHE_WHITELIST}, an error will be
+#    generated if a recipe is not available within sstate-cache.
+SSTATECACHE_WHITELIST ?= ""
+
+python sstate_readonly_check(){
+    whitelist = (d.getVar('SSTATECACHE_WHITELIST', True) or '').split()
+    sq_fn = d.getVar('sq_fn', True) or []
+    missed = d.getVar('missed', True) or []
+    missed_pn = []
+    for task in missed:
+        fn = sq_fn[task]
+        data = bb.cache.Cache.loadDataFull(fn, '', d)
+        pn = data.getVar('PN', True)
+        if pn and pn not in missed_pn:
+            missed_pn.append(pn)
+
+    if missed_pn:
+        blacklist = [pn for pn in missed_pn if pn not in whitelist]
+        if blacklist:
+            msg =  'Read-only sstate-cache is enabled, the build of \n'
+            msg += '"' + ' '.join(blacklist) + '"\n'
+            msg += 'did not come from sstate-cache. Only the recipe listed in\n'
+            msg += 'SSTATECACHE_WHITELIST is allowed to build from source'
+            bb.fatal(msg)
+}
+
+def _sstate_readonly_clean_check(d):
+    whitelist = (d.getVar('SSTATECACHE_WHITELIST', True) or '').split()
+    pn = d.getVar('PN', True)
+    if pn not in whitelist:
+        msg =  'Read-only sstate-cache is enabled, the clean of \n'
+        msg += '%s is not allowed. Only the recipe listed in\n' % pn
+        msg += 'SSTATECACHE_WHITELIST is allowed to clean sstate-cache'
+        bb.fatal(msg)
+
+python do_cleansstate_prepend() {
+        _sstate_readonly_clean_check(d)
+}
+
+python do_cleanall_prepend() {
+    _sstate_readonly_clean_check(d)
+}
+
-- 
1.7.10.4


