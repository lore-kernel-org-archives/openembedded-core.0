Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB78EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 06:52:58 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.7069.1688712774060395133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 23:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=J6cc+hOS;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: e02056001c9211ee9cb5633481061a41-20230707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tS9Eg54jU9K48VXo53uIqXW29Jbx2uFAv/pxRF+yOeU=;
	b=J6cc+hOSuypyjheCTppTtOAYIrj7eR7tWwauk1iO4Aarn2S603JW0xIq2F9n1qCfF1KyyCcJrkre7hfZ2/9UoMGVZsROBBeUW/7uVZJBpXtzclODFYd58ODPPP6EneNVeX9bwKwBYgJPwgPrDL4kf5+hNcV/knzSbHf6UqqaEaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:05ce022a-c630-4038-bcde-e32e0012849b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.27,REQID:05ce022a-c630-4038-bcde-e32e0012849b,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:01c9525,CLOUDID:3cc6cd82-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:2307071452470PBJY85U,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,
	TF_CID_SPAM_SNR,TF_CID_SPAM_SDM
X-UUID: e02056001c9211ee9cb5633481061a41-20230707
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1987419794; Fri, 07 Jul 2023 14:52:44 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 7 Jul 2023 14:52:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 7 Jul 2023 14:52:43 +0800
From: <yang.xu@mediatek.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>, Yang Xu <yang.xu@mediatek.com>
Subject: [PATCH v3] sstatesig: Fix pn and taskname derivation in find_siginfo
Date: Fri, 7 Jul 2023 06:52:39 +0000
Message-ID: <20230707065239.28468-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 06:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184001

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
 .../recipes-test/binutils/binutils_%.bbappend |  2 +
 meta/lib/oe/sstatesig.py                      | 17 ++++--
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 53 +++++++++++++++++++
 3 files changed, 67 insertions(+), 5 deletions(-)
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
index febafdb2f7..818d8b623d 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -691,3 +691,56 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
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
+MACHINE = \"qemux86\"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstates-findsiginfo")
+
+        pns = ["binutils", "binutils-native", "lib32-binutils"]
+
+        #forcing generate different stamps for binutils every time
+        self.write_recipeinc("binutils", 'do_fetch[nostamp] = "1"')
+        for pn in pns*2:
+            bitbake("%s -S none" % pn)
+        self.delete_recipeinc("binutils")
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
+                hashes = [hash1, hash2]
+                hashfiles = find_siginfo(key, None, hashes)
+                self.assertCountEqual(hashes, hashfiles)
+                bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
+
+            for pn in pns:
+                filedates = find_siginfo(pn, "do_compile")
+                self.assertGreaterEqual(len(filedates), 2)
+                latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-2:]
+                bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)
-- 
2.25.1


