Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5B97715A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:45:16 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so16106228wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dZX5XM3dBusZXnGB6kA830wzaxIlxyO7Erh72jjj9WU=;
	b=ctO3MKywR5bY4Ui9O6su9advcw9rF2OEvlncLb10nBt54eRviDJcwTHYj4ihGXwZzS
	qWR3xLfLHihM/j/BaYc/8pswA0I4PKwEjAkcALlsRw3Dt8SULwvoKZkeJeHLkorby5oY
	p2xAjJ4Z+XVTX7mx6D4o39bL6iceEPcTBj5GE8HPQaTMb3lxukr6hGWkYsJXloghwqoM
	xTla778linD2eaiZJwut1mZr5B8MNpJQfEQFSw18FsjdhykxWXi2dl1w+Rvbnfy/E1An
	6eHdCneSfJdV47kgj/JFAtiAPxQg7AjakYyUSec8f1gTIwIzXA8kGihOB0VkP+mXSapL
	fxLQ==
X-Gm-Message-State: ALoCoQkkk/U/GZONnfFt2bdNeMr4mD5p8nTiq1Q6yvghYDbymLWlscyARpVxAT+82ttrTzLaB+T0
X-Received: by 10.180.189.12 with SMTP id ge12mr5666385wic.73.1445010315981;
	Fri, 16 Oct 2015 08:45:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	it4sm23211577wjb.0.2015.10.16.08.45.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 08:45:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:37:41 +0100
Message-Id: <1445009861-5993-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445009861-5993-1-git-send-email-ross.burton@intel.com>
References: <1445009861-5993-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] oeqa/selftest: clean up selftest.inc in teardown
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
X-List-Received-Date: Fri, 16 Oct 2015 15:45:16 -0000

Test cases may want to do call bitbake in setUpClass() but at that point the
previous selftest.inc is still present which could change the build
configuration and result in any built artifacts being removed in the next
bitbake invocation as part of the sysroot clean up.

Resolve this by cleaning selftest.inc in the tearDown, the clean in setUp should
be considered a safety net.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index b2faa66..9bddc23 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -31,7 +31,7 @@ class oeSelfTest(unittest.TestCase):
         self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
-        self._track_for_cleanup = []
+        self._track_for_cleanup = [self.testinc_path]
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
-- 
2.1.4


