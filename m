Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A9E8778947
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:16:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 18:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="178932844"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2018 18:16:13 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:15:17 -0800
Message-Id: <20180301021518.29564-21-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301021518.29564-1-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
Subject: [PATCH v3 20/21] systemd-boot-cfg.bbclass: Don't reference or set OVERRIDES
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
X-List-Received-Date: Thu, 01 Mar 2018 02:16:14 -0000

There's no need to add to the local copy of overrides and then not do
anything with it.

Now that this function is being used in package creation it was causing
sstate issues as well, as MACHINE is always in OVERRIDES, so something
trivial such as the name of the MACHINE would cause the hash to change.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/systemd-boot-cfg.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes/systemd-boot-cfg.bbclass b/meta/classes/systemd-boot-cfg.bbclass
index 360c86cbd34..107758548c6 100644
--- a/meta/classes/systemd-boot-cfg.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -39,10 +39,6 @@ python build_efi_cfg() {
     for label in labels.split():
         localdata = d.createCopy()
 
-        overrides = localdata.getVar('OVERRIDES')
-        if not overrides:
-            bb.fatal('OVERRIDES not defined')
-
         entryfile = "%s/%s.conf" % (s, label)
         if not os.path.exists(s):
             os.makedirs(s)
@@ -51,7 +47,6 @@ python build_efi_cfg() {
             entrycfg = open(entryfile, "w")
         except OSError:
             bb.fatal('Unable to open %s' % entryfile)
-        localdata.setVar('OVERRIDES', label + ':' + overrides)
 
         entrycfg.write('title %s\n' % label)
 
-- 
2.14.3


