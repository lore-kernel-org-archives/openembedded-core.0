Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6C01B73CB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 22:03:22 +0000 (UTC)
Received: by wiun10 with SMTP id n10so5463834wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Apr 2015 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lryO6A1N7XR1bF/R7InPdf3Q+lPU8PVvN3+BpQWqlUI=;
	b=RAgFFDV9iYArmEsqo/B469GuXmDINub1jM4eA5MK2Csh9OtF/3wLzJxZXSAvPQdxKN
	97z41gIEFcgdIsqYuZxzbOkxLK2WJI2dbiOYEyfbGPQ/5nsD1Z0zriD3NMBq15vvJ3ev
	bW5K29uEbLkGGAwP5rmBW8Xak8NVuh0P1CdcuQcyMTQUDLqA2DGMi6xJWa1sNcvn470x
	Y1UD+No8ocChb9U5a1HXBM8XcPCQmcBpVLDmDzrd8r0MEcAEZxy6klRw7URyl48ubD0a
	xQGoj11KoP+VPdTULq5f9uW4iGJ4LJrxPYe+cj8O8uErgZqBm95szfhyGNPnoL+tqPJ7
	mZAg==
X-Received: by 10.194.208.229 with SMTP id mh5mr8784660wjc.108.1428098603836; 
	Fri, 03 Apr 2015 15:03:23 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id q6sm4367886wix.3.2015.04.03.15.03.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Apr 2015 15:03:22 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Apr 2015 15:03:05 -0700
Message-Id: <1428098585-1574-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH] oe.sstatesig: align swspec handling with sstate.bbclass
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
X-List-Received-Date: Fri, 03 Apr 2015 22:03:25 -0000

The logic tries to remove the -native suffix from pn to handle this (though it
doesn't succeed, as it doesn't assign the new pn to the variable), but we need
to do more for the swspec tasks than just not set the extrapath, we also need
to change from SSTATE_PKGSPEC to SSTATE_SWSPEC. Alter to correct the spec for
these cases, and also add preconfigure to align with the current logic in
sstate.bbclass, which includes that task as well in the list of tasks to
adjust to use swspec.

[YOCTO #7563]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/lib/oe/sstatesig.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 62e75c2..9d6d7c4 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -206,9 +206,6 @@ def find_siginfo(pn, taskname, taskhashlist, d):
         if key.startswith('virtual:native:'):
             pn = pn + '-native'
 
-    if taskname in ['do_fetch', 'do_unpack', 'do_patch', 'do_populate_lic']:
-        pn.replace("-native", "")
-
     filedates = {}
 
     # First search in stamps dir
@@ -249,7 +246,10 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             localdata.setVar('PV', '*')
             localdata.setVar('PR', '*')
             localdata.setVar('BB_TASKHASH', hashval)
-            if pn.endswith('-native') or "-cross-" in pn or "-crosssdk-" in pn:
+            swspec = localdata.getVar('SSTATE_SWSPEC', True)
+            if taskname in ['do_fetch', 'do_unpack', 'do_patch', 'do_populate_lic', 'do_preconfigure'] and swspec:
+                localdata.setVar('SSTATE_PKGSPEC', '${SSTATE_SWSPEC}')
+            elif pn.endswith('-native') or "-cross-" in pn or "-crosssdk-" in pn:
                 localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
             sstatename = taskname[3:]
             filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG', True), sstatename)
-- 
2.2.1


