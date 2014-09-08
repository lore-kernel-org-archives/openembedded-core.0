Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 860EA702D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:03 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so2501367wib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Vq1XPacKxSUHiwEOtbUhT9KDt52bfg07IgZX/v+8bXA=;
	b=Hoc1O7uTj2us5XhZjl5QDDJ4ciZ8Zi43RT3zh8GFCqA9iImjGWNibiN3Vbz4ZMN3Wv
	+sm6aAOGKAm5LU7JKfrBlRRxYGOQYkbsHB442fVVd/4kTkU8ltDqWXYH67v6lKkzAtmN
	Ro6A3/jTlq045ZhvEANMzNj4OHwsMgMgX0fIla5wFCpVbQFQP6p/fAf0nCehf6ZC70wm
	tq7YtuPrMS/dhTg2fo+hjUKbY1Hw8X1KdgBDITKlZpH3wmsyu8VYHaxtdzPwQT0r/MKQ
	Bm6qsMlqZOIEzPSquV89TBWh71Nc+hIU5VhokegJz/ev+xHBdBFilLfunyf/1AynAmHO
	fRJg==
X-Gm-Message-State: ALoCoQmhGrRZ0A/DhzvTy7p98ee7chGEGs3RKFFTwVvAOp9mOZEWWt6LP8llxb7EbitE3NqOn4cM
X-Received: by 10.194.94.73 with SMTP id da9mr12512561wjb.67.1410177543778;
	Mon, 08 Sep 2014 04:59:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:27 +0100
Message-Id: <2a0807412dfd32665239ddf56bcc35e64126c5dc.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 09/27] bbclass/sstate: add hook SSTATE_CHECK_FUNCTIONS for sstate checking
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:05 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Provide hook for sstate checking, the checking failure will
break the building immediately. Pass input parameters by
bb.data (d.setVar/d.getVar).

Hook  : SSTATE_CHECK_FUNCTIONS
Input : missed    - list of missing sstate file index in sq
      : found     - list of existing sstate file index in sq
      : sq_fn     - list of filenames in the sq
      : sq_task   - list of task names in the sq
      : sq_hash   - list of task hash in the sq
      : sq_hashfn - list of hashfn in the sq

[YOCTO #6639]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 67e0c1d..5a2e0c6 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -624,6 +624,18 @@ sstate_unpack_package () {
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
+# Provide hook for sstate checking, the checking failure will
+# break the building immediately. Pass input parameters by
+# bb.data (d.setVar/d.getVar).
+# Input : missed    - list of missing sstate file index in sq
+#       : found     - list of existing sstate file index in sq
+#       : sq_fn     - list of filenames in the sq
+#       : sq_task   - list of task names in the sq
+#       : sq_hash   - list of task hash in the sq
+#       : sq_hashfn - list of hashfn in the sq
+#
+SSTATE_CHECK_FUNCTIONS ?= ""
+
 def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
     ret = []
@@ -712,6 +724,20 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
+    localdata = bb.data.createCopy(d)
+    bb.data.update_data(localdata)
+    for f in (localdata.getVar('SSTATE_CHECK_FUNCTIONS', True) or '').split():
+        localdata = bb.data.createCopy(d)
+        bb.data.update_data(localdata)
+        localdata.setVar('missed', missed)
+        localdata.setVar('found', ret)
+        localdata.setVar('sq_fn', sq_fn)
+        localdata.setVar('sq_task', sq_task)
+        localdata.setVar('sq_hash', sq_hash)
+        localdata.setVar('sq_hashfn', sq_hashfn)
+
+        bb.build.exec_func(f, localdata)
+
     return ret
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
-- 
1.7.10.4


