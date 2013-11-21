Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECC76D299
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 14:57:54 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id a1so10901154wgh.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 06:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MJN/6BsLnOVuIE3SDuiELEANRrPfgghPys6BELAclmI=;
	b=DghTchetUrqBaPdQYVWgf/CkjpifQqK5gesONR04ZWk3SMb9djViTf/XUPku/qbZFn
	WwwLyRifIIogWg70fA1TF2ntZZetrI6ucSJCRteXKS5i9NgaqRzyKMJcFQxYzUUitKP4
	wnGCygoJS7RM0lVkx8TAtcnn9lATP5PnqlTJjIKDYlY5QPJthk8eU+GeK0ehqho9GGn9
	+G+oJHI2yMtI/eElWlQB7m9DMpVRfOWvYT6juA7D4Q5SEUHlheESASOyE2z0YHTpBaCp
	4q5f477tYfXxq2gMZSPZt4DcUJadtUQt6dFw9/89XAZSMK/DpKeNaZgAIQXUYvzBrgZs
	cE4g==
X-Gm-Message-State: ALoCoQkkFe09jFfA+hhP73ihou2oRn3GuVNaAAZIXG46A+bFHsI91OfSlwNNtiHIIEmkdDif47BU
X-Received: by 10.194.104.66 with SMTP id gc2mr447024wjb.75.1385045872783;
	Thu, 21 Nov 2013 06:57:52 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id pi6sm6218103wic.3.2013.11.21.06.57.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 06:57:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 14:57:46 +0000
Message-Id: <1385045866-30934-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oeqa/connman: disable unique test
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
X-List-Received-Date: Thu, 21 Nov 2013 14:57:55 -0000

The connman unique test starts another instance of connmand and then does a ps to
verify that there's only one of these running, on the assumption that the new
one has quit because there's already one running (started by init).

However, connmand is forking into the background straight away so there's a race
between running ps and the second connmand discovering the first and exiting.
This race can be seen because the test displays the output of ps, and by the
time that second ps has been executed the new connmand has exited.

This is a classic race condition and on a heavily loaded autobuilder inserting
an arbitrary sleep isn't wise.  In the scheme of things this test isn't very
useful, so delete it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/connman.py |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index 5ef96f6..b592ecc 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -19,11 +19,3 @@ class ConnmanTest(oeRuntimeTest):
     def test_connmand_running(self):
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
         self.assertEqual(status, 0, msg="no connmand process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
-
-    @skipUnlessPassed('test_connmand_running')
-    def test_connmand_unique(self):
-        self.target.run('/usr/sbin/connmand')
-        output = self.target.run(oeRuntimeTest.pscmd + ' | grep -c [c]onnmand')[1]
-        self.assertEqual(output, "1", msg="more than one connmand running in background, ps output: %s\n%s" % (output, self.target.run(oeRuntimeTest.pscmd)[1]))
-
-
-- 
1.7.10.4


