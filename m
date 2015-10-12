Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 84FBC76AE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 12:10:52 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so147474999wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 05:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4FmNIJstJ8CjT9ac+EU3fVUhzA+y6MnWwNwlkaZ27js=;
	b=By+U9xs2Qc0KOU3FTaKNLAHWJXQqG9wq60QY4AHilKxmRcO8gM36maY44qALXF/rOh
	EERXr14fpRZGoE1en4rBdXErRao5nfMHvjB1kErdBjT0j5TYv/jWEu3Ma3MZZafqEzMb
	Rd9IC8TngustgdFl0gGstoGIpdhMmfcL1RNFly4Vx73p9fVZmpDHd+5htGLmSzpEMTnD
	ihIKfY06vAVCJoCjPjK44ExpDAaKSU6EMmGZHngMv7A0y8uwPcNzp5e0+7wVXKgUCzWa
	Wt0Y/n15s03HVFcx8/kAwEzm2MdAzeYkAqsjub0MpYeioC2zjcModaYIBMrkYEgB7ybg
	kQIA==
X-Gm-Message-State: ALoCoQmVgp4pQnptmlGp2rjsq86STNR0hE3rTM/6zueF2JvC6OW5bR+X1bVkjm1+IX3ibGvt4Y+z
X-Received: by 10.194.24.68 with SMTP id s4mr32567947wjf.12.1444651851856;
	Mon, 12 Oct 2015 05:10:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	12sm19503557wjw.15.2015.10.12.05.10.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Oct 2015 05:10:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2015 13:03:25 +0100
Message-Id: <1444651405-11188-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444651405-11188-1-git-send-email-ross.burton@intel.com>
References: <1444651405-11188-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] oeqa/selftest: verify that devtool can use plugins in other layers
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
X-List-Received-Date: Mon, 12 Oct 2015 12:10:52 -0000

Verify that devtool can use plugins in other layers by invoking the
"selftest-reverse" command provided by meta-selftest.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index baa56d6..396a680 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -983,3 +983,15 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+    def test_devtool_layer_plugins(self):
+        """Test that devtool can use plugins from other layers.
+
+        This test executes the selftest-reverse command from meta-selftest."""
+
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        s = "Microsoft Made No Profit From Anyone's Zunes Yo"
+        result = runCmd("devtool --quiet selftest-reverse \"%s\"" % s)
+        self.assertEqual(result.output, s[::-1])
-- 
2.1.4


