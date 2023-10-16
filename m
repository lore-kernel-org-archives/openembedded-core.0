Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F78FCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 10:21:09 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.115360.1697451660202256172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 03:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=TgzM9Qv6;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697451660; x=1728987660;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WQa6M6InhW/cnDNZCZYWDJJDva4MrY5VpR3hWtDOA8c=;
  b=TgzM9Qv6NDVGKLBBrTENsRnbgcezQP8fya6CYJqkfQsGQGpiiTaPOxc7
   5fMzow4WfKfOaEhfWoPa6m7HYrSVNUZPG+4nFGWzXU3fCQGJZzPM0PpDM
   ADHBQG36BAcUBLZDobz47E4dboOjGe2s7XpD48AfKg9PYwRdy62w0HEmV
   iHt4x52WajIiwU2Mf0bN/BxTrdmnmfl6DNEKabn8E9l+qII7q7FjICsCU
   8+Su4F6yMPshveBXzG9un2W/OG+37PRU5VMKYtcE/FZZL3EPIU2lSLGnx
   oLk6FnSDq4NojuXFc8mjwZjtFeJ8r9SbrH5gKKDruwc0lNgc/X9d2DJH9
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,229,1694728800"; 
   d="scan'208";a="33478718"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Oct 2023 12:20:57 +0200
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 21CC7280082;
	Mon, 16 Oct 2023 12:20:57 +0200 (CEST)
Message-ID: <7403d466aa1827b4c0966c22e7b79e03cb50bfeb.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] oeqa: wic: Add test for --no-table option
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: oss@ew.tq-group.com
Date: Mon, 16 Oct 2023 12:20:56 +0200
In-Reply-To: <20230821101545.3351643-2-Markus.Niebel@ew.tq-group.com>
References: <20230821101545.3351643-1-Markus.Niebel@ew.tq-group.com>
	 <20230821101545.3351643-2-Markus.Niebel@ew.tq-group.com>
Organization: TQ Systems GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 10:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189281

Gentle ping. I added the Test case and resent the fix together with
this test.

Markus

-------- Ursprüngliche Nachricht --------
Von: Markus Niebel <Markus.Niebel@ew.tq-group.com>
An: openembedded-core@lists.openembedded.org
Kopie: oss@ew.tq-group.com, Markus Niebel <
Markus.Niebel@ew.tq-group.com>
Betreff: [PATCH v2 1/2] oeqa: wic: Add test for --no-table option
Datum: Mon, 21 Aug 2023 12:15:44 +0200

Add basic test for the --no-table wic part option.

Signed-off-by: Markus Niebel <
Markus.Niebel@ew.tq-group.com
>
---
v2: add this test case

 meta/lib/oeqa/selftest/cases/wic.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py
b/meta/lib/oeqa/selftest/cases/wic.py
index a3c6deb5aa..aa61349ed1 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -731,6 +731,23 @@ part /etc --source rootfs --fstype=ext4 --change-
directory=etc
         size = os.path.getsize(wicout[0])
         self.assertTrue(size > extraspace)
 
+    def test_no_table(self):
+        """Test --no-table wks option."""
+        wks_file = 'temp.wks'
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part testspace --no-table --fixed-size 16k --
offset 4080k")
+        runCmd("wic create %s --image-name core-image-minimal -o %s" %
(wks_file, self.resultdir))
+
+        wicout = glob(os.path.join(self.resultdir, "*.*"))
+
+        self.assertEqual(1, len(wicout))
+        size = os.path.getsize(wicout[0])
+        self.assertEqual(size, 4 * 1024 * 1024)
+
+        os.remove(wks_file)
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


