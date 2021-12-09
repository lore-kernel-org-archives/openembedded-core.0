Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8CBC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 20:51:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.17385.1639083098788219201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 12:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gxby57TR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id a18so11824066wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 12:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHbani3VCrW7+1ThpyWL4cwc43sj8YA40OQRWNXWAr8=;
        b=Gxby57TRS0ZD/T+PrPDEb64pDx7vOPQjyju9LXsPNSCRB4xBKVD4B1ld7ctnrJmZhk
         8FW52KKEY0hUtZLmX00651zRF2N4IWwk55edTp5XSoFi5ms9i3G1+4CZVUEyo0+avUuw
         NInIIYcgh6kXClfmZ8LBVIdD5kh7ASe2QaEktADEB/iWTIrHrpRROZ1mm8chSliDmgev
         3eIuSx34OfLbLLIaGnSqB4JGXXrphplaErNtzgiDzoAw4HU+rZypMFkoITIxe1CHPdd+
         jXrMW+xAMDtWuvY4SEQOv0qp6BaU43MKVk4Fg1A7wVA/lAz03SKw5nsEZ2IFOVOCvcJI
         jGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHbani3VCrW7+1ThpyWL4cwc43sj8YA40OQRWNXWAr8=;
        b=So5ywGpgne+Mtu8wY3uJPYHy/7tMGEbMigqkKafAek96K74nNW67hzXVoF1+7Toug6
         E1pVWj1qyrOZ/ERIqZLOBYdW/hNmcilbMwu5pFCL6/jwfLld17oixJ/MqqktNPIw3EQH
         I9Y2g2rZgszmJmZQKKbmGi58eijhS9KXZrNMHta1hx/6+DsTeN+jWTjYfOGBfS6eKi5v
         PqRh+yrs1WKJu8jPd8YDoTO8fzuXX3pxe/Yn58uj0JI+pZrrG91ZD1AWJom3lo1ISfg7
         nxq0pc3CjbshD8kMXkTxQwuWCoyAcU/qXsUxvdoaNlh3dblRa26QmmbSfokww2fH48TS
         eeHQ==
X-Gm-Message-State: AOAM530XLBr6SBUN/P2mU83nmITo/pPxrCawY4Qx/knJB07XtYstzUXg
	Vcx9A5QfL/Ucbezsoh5KGrPPtG5Z8++ZZg==
X-Google-Smtp-Source: 
 ABdhPJxwOeNSYKLOq5Fmvai/kcek1TUzNfWdQSG6JqDY4ARp9RcUd2+PKWHzDcpUPkROjtbmj5P6sg==
X-Received: by 2002:a5d:6d8b:: with SMTP id l11mr8931300wrs.458.1639083097019;
        Thu, 09 Dec 2021 12:51:37 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n33sm429179wms.46.2021.12.09.12.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 12:51:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] sstatetests: add a test for moving oe-core around in the
 filesystem
Date: Thu,  9 Dec 2021 21:51:23 +0100
Message-Id: <20211209205123.2231389-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 20:51:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159479

Doing that should not change the task signatures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 42 +++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index c5beb4de39..2be96f1781 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -11,6 +11,7 @@ import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer, create_temp_layer
 from oeqa.selftest.cases.sstate import SStateBase
+import oe
 
 import bb.siggen
 
@@ -573,3 +574,44 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         compare_sigfiles(rest, files1, files2, compare=False)
 
         self.fail("sstate hashes not identical.")
+
+    def test_sstate_movelayer_samesigs(self):
+        """
+        The sstate checksums of two builds with the same oe-core layer in two
+        different locations should be the same.
+        """
+        core_layer = os.path.join(
+                    self.tc.td["COREBASE"], 'meta')
+        copy_layer_1 = self.topdir + "/meta-copy1/meta"
+        copy_layer_2 = self.topdir + "/meta-copy2/meta"
+
+        oe.path.copytree(core_layer, copy_layer_1)
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
+""")
+        bblayers_conf = 'BBLAYERS += "%s"\nBBLAYERS:remove = "%s"' % (copy_layer_1, core_layer)
+        self.write_bblayers_config(bblayers_conf)
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
+        bitbake("bash -S none")
+
+        oe.path.copytree(core_layer, copy_layer_2)
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
+""")
+        bblayers_conf = 'BBLAYERS += "%s"\nBBLAYERS:remove = "%s"' % (copy_layer_2, core_layer)
+        self.write_bblayers_config(bblayers_conf)
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
+        bitbake("bash -S none")
+
+        def get_files(d):
+            f = []
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    f.append(os.path.join(root, name))
+            return f
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps")
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps")
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.maxDiff = None
+        self.assertCountEqual(files1, files2)
+
-- 
2.20.1


