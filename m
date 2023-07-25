Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29369C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 13:01:54 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.19674.1690290105960948013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 06:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=PQSK3K0e;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 635980942aeb11ee9cb5633481061a41-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5jeVbASFlpI77EKSuT2UlEO9ltJnhDhhWc2B6SxbStU=;
	b=PQSK3K0eXyLZ1aSW63XQgiwj386S5TIJk6MlwnxvcB94hyRtpBdQLsWCTd604OPQ2wnN0POdGQVQN818h7vUVDdL2n/Es3PW/of0odDdcgYp5+eesZSiQVyynxy6lnVeRXcYzW5PjzUICQM1CflBfZufEFvmWp2SphVJzBlJ+hY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:81632dcd-8d40-4a1f-83fe-9a20ea874b40,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7562a7,CLOUDID:38c24ed2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 635980942aeb11ee9cb5633481061a41-20230725
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 245561848; Tue, 25 Jul 2023 21:01:36 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jul 2023 21:01:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jul 2023 21:01:35 +0800
From: <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Ross.Burton@arm.com>, <alexandre.belloni@bootlin.com>, Yang Xu
	<yang.xu@mediatek.com>
Subject: [RESEND][PATCH v4] sstatesig: Fix pn and taskname derivation in find_siginfo
Date: Tue, 25 Jul 2023 13:01:04 +0000
Message-ID: <20230725130105.7277-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 13:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184841

From: Yang Xu <yang.xu@mediatek.com>

The `bb.siggen.compare_sigfiles` method transforms the key format from
`[mc:<mc_name>:][virtual:][native:]<recipe path>:<taskname>` to
`<recipe dir>/<recipe name>:<taskname>[:virtual][:native][:mc:<mc_name>]`
by `clean_basepaths`. However, `find_siginfo` uses the original format
to get the package name (pn) and task name.

This commit corrects the method for deriving the pn and task name in
`find_siginfo` and adds handling for multilib name.
And add test for compare_sigfiles and find_siginfo working together.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---

Notes:
    v1: correct handling for pn and taskname for native target in find_siginfo
    v2: add handling for multilib target in find_siginfo
    v3: add testcase for compare_sigfiles and find_siginfo work together.
    v4: optimize testcase to avoid non-deterministic fail

 .../recipes-test/binutils/binutils_%.bbappend |  2 +
 meta/lib/oe/sstatesig.py                      | 17 ++--
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 83 +++++++++++++++++++
 3 files changed, 97 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/binutils/binutils_%.bbappend

diff --git a/meta-selftest/recipes-test/binutils/binutils_%.bbappend b/meta-selftest/recipes-test/binutils/binutils_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/binutils/binutils_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f943df181e..f041a0c430 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -321,11 +321,18 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if not taskname:
         # We have to derive pn and taskname
         key = pn
-        splitit = key.split('.bb:')
-        taskname = splitit[1]
-        pn = os.path.basename(splitit[0]).split('_')[0]
-        if key.startswith('virtual:native:'):
-            pn = pn + '-native'
+        if key.count(':') >= 2:
+            splitit, taskname, affix = key.split(':', 2)
+        else:
+            splitit, taskname = key.split(':', 1)
+            affix = ''
+        pn = os.path.splitext(os.path.basename(splitit))[0].split('_')[0]
+        affixitems = affix.split(':')
+        if affixitems[0] == 'virtual':
+            if affixitems[1] == 'native':
+                pn = pn + '-native'
+            if affixitems[1] == 'multilib':
+                pn = affixitems[2] + '-' + pn
 
     hashfiles = {}
     filedates = {}
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index febafdb2f7..3fa3038218 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -691,3 +691,86 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
+class SStateFindSiginfo(SStateBase):
+    def test_sstate_compare_sigfiles_and_find_siginfo(self):
+        """
+        Test the functionality of the find_siginfo: basic function and callback in compare_sigfiles
+        """
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstates-findsiginfo\"
+TCLIBCAPPEND = \"\"
+MACHINE = \"qemux86-64\"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstates-findsiginfo")
+
+        pns = ["binutils", "binutils-native", "lib32-binutils"]
+        target_configs = [
+"""
+TMPVAL1 = "tmpval1"
+TMPVAL2 = "tmpval2"
+do_tmptask1() {
+    echo ${TMPVAL1}
+}
+do_tmptask2() {
+    echo ${TMPVAL2}
+}
+addtask do_tmptask1
+addtask tmptask2 before do_tmptask1
+""",
+"""
+TMPVAL3 = "tmpval3"
+TMPVAL4 = "tmpval4"
+do_tmptask1() {
+    echo ${TMPVAL3}
+}
+do_tmptask2() {
+    echo ${TMPVAL4}
+}
+addtask do_tmptask1
+addtask tmptask2 before do_tmptask1
+"""
+        ]
+
+        for target_config in target_configs:
+            self.write_recipeinc("binutils", target_config)
+            for pn in pns:
+                bitbake("%s -c do_tmptask1 -S none" % pn)
+            self.delete_recipeinc("binutils")
+
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=True)
+
+            def find_siginfo(pn, taskname, sigs=None):
+                result = None
+                tinfoil.set_event_mask(["bb.event.FindSigInfoResult",
+                                "bb.command.CommandCompleted"])
+                ret = tinfoil.run_command("findSigInfo", pn, taskname, sigs)
+                if ret:
+                    while True:
+                        event = tinfoil.wait_event(1)
+                        if event:
+                            if isinstance(event, bb.command.CommandCompleted):
+                                break
+                            elif isinstance(event, bb.event.FindSigInfoResult):
+                                result = event.result
+                return result
+
+            def recursecb(key, hash1, hash2):
+                nonlocal recursecb_count
+                recursecb_count += 1
+                hashes = [hash1, hash2]
+                hashfiles = find_siginfo(key, None, hashes)
+                self.assertCountEqual(hashes, hashfiles)
+                bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
+
+            for pn in pns:
+                recursecb_count = 0
+                filedates = find_siginfo(pn, "do_tmptask1")
+                self.assertGreaterEqual(len(filedates), 2)
+                latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-2:]
+                bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)
+                self.assertEqual(recursecb_count,1)
-- 
2.18.0


