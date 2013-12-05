Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE366CC79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:56:09 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so15426177wgh.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 04:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GC/Jb8yW8Ofk58RzP080PzkCFXUsGJQtXS7KLgl+AFc=;
	b=UgBZTFTlqI48AIYCUQmNQRzRKOllt35tTBKe+QTk9nc85jHEEHv2Rq+lXCS4MyfZju
	cA6SBlW2Ya1HtnHiDozKyeu1c9hOUrc8sWATTiN6ypiohR0t8XpjJZA/P/uwj5ouqDsf
	uXdMUxQ/065nF1ahS/cefzMK1UqiS2fStcQdmfldFZWRxdBXrCKoq/sYM/gQA3VkWY77
	a5BMYzq6CeOXbpYNzCBoRv4hWTzMz7aiizSSMR2wq/87bEEnH91pfs+ALa/afzvGuiV8
	4Hjh9vqv5cdqKKdxmJaOQZ+irtsBFQgIRIQ+ccCMTMhpYa2Wnmq9gsFYj2WRdLO1smLE
	7bdQ==
X-Gm-Message-State: ALoCoQmPE+05ksgIoTmipb81UxRhybUnrgYaMC6wqm5uwgrqmCYUW0tMAx0ucpV/7NOw6i/pnBis
X-Received: by 10.180.80.233 with SMTP id u9mr11874843wix.6.1386248168892;
	Thu, 05 Dec 2013 04:56:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b7sm6059113wiz.8.2013.12.05.04.56.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 04:56:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 12:56:00 +0000
Message-Id: <1386248161-7086-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
References: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] lib/oeqa/runtime: print connman status if connman failed to start
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
X-List-Received-Date: Thu, 05 Dec 2013 12:56:10 -0000

If connman isn't running and we're running under systemd, use systemctl to get
the state according to systemd and the end of the connman log.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/connman.py |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index b592ecc..c036882 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -9,6 +9,13 @@ def setUpModule():
 
 class ConnmanTest(oeRuntimeTest):
 
+    def service_status(self, service):
+        if oeRuntimeTest.hasFeature("systemd"):
+            (status, output) = self.target.run('systemctl status -l %s' % service)
+            return output
+        else:
+            return "Unable to get status or logs for %s" % service
+
     @skipUnlessPassed('test_ssh')
     def test_connmand_help(self):
         (status, output) = self.target.run('/usr/sbin/connmand --help')
@@ -18,4 +25,6 @@ class ConnmanTest(oeRuntimeTest):
     @skipUnlessPassed('test_connmand_help')
     def test_connmand_running(self):
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
-        self.assertEqual(status, 0, msg="no connmand process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
+        if status != 0:
+            print self.service_status("connman")
+            self.fail("No connmand process running")
-- 
1.7.10.4


