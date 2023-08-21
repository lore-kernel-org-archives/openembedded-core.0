Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EC1EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 10:16:33 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.7778.1692612982853984697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 03:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=mLZlytSs;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1692612983; x=1724148983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KP0hxR6D0a0N0rLQYX24zIwdSL3WEbqF1nxSPVuLEq0=;
  b=mLZlytSsLPbt9e2EIwvOjQijSjIFPpYiTOrnyVAy9m8JYu3HyNQCmeMr
   97fzzHTnmptaCsCBgnTAoobE/s3tdMxUW0/NjEleF/QPwgjJRNyprX2Zh
   ckhZnpUvmkoyq9sKxsvrdikizNQ2kGEkPmuGH/FWrbbhoF9FFNhqydU8W
   JlxdHZHx85X1jwLOnrL8pD5rRFF36vY3Pzjb1mp1T+uBxQMNrIo7KaQQz
   6VUqFSCNR54C9QEBiL9KW7J/6HtdlA4hvgXXeqkYE2XelP3o0qD7ATw9c
   PoPsC4bpAd6M1GA6+vvNPi1iighF6Z5XpiHflna6YHTIkwt8O0f31ViTJ
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,189,1684792800"; 
   d="scan'208";a="32537809"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Aug 2023 12:16:20 +0200
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7BB50280084;
	Mon, 21 Aug 2023 12:16:20 +0200 (CEST)
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH v2 1/2] oeqa: wic: Add test for --no-table option
Date: Mon, 21 Aug 2023 12:15:44 +0200
Message-Id: <20230821101545.3351643-2-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821101545.3351643-1-Markus.Niebel@ew.tq-group.com>
References: <20230821101545.3351643-1-Markus.Niebel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186425

Add basic test for the --no-table wic part option.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
v2: add this test case

 meta/lib/oeqa/selftest/cases/wic.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index a3c6deb5aa..aa61349ed1 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -731,6 +731,23 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         size = os.path.getsize(wicout[0])
         self.assertTrue(size > extraspace)
 
+    def test_no_table(self):
+        """Test --no-table wks option."""
+        wks_file = 'temp.wks'
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part testspace --no-table --fixed-size 16k --offset 4080k")
+        runCmd("wic create %s --image-name core-image-minimal -o %s" % (wks_file, self.resultdir))
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
2.25.1


