Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4516DD28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 10:06:14 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w61so187090wes.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 02:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2y/bTacFHbVxFBNn/iv3QjifUpcitRXjet+nGAdV1do=;
	b=bPo6/ahmHfOafFdUoHfjnLlxRrePJLu+5HUpomKqbs9+4tjNAJUF3+/DGpLth7CjEH
	R51AjxSILZvK0mOyEjqFk+wwqXoPzZ+5ytNbcttmYn5HZoVQyhpE6J04DoFbRDggDam8
	noiXQDPdWoHRZ2Z+rlrSiwWp9rMl8vl4TLhAXK0jDc4ATujN/HfA2DKl2gMy47SkrEQb
	Q0UFbDCQMknl/hDDqt2pOLZ5SMz/5rZduOrutgBeTtDmnm8sq+ztB7AlRoSUhl5AMVRo
	4I/WQymAzMaGJD9mNNwJVYnPj3k7cvTniw7Yok1UOQwJQwF9Gt60bz79RrLn8RwS2oFY
	3gfQ==
X-Gm-Message-State: ALoCoQl+3YfD2nJoKQhzpqms11p8AedoGVL0JyLNDdZAVG841y9LLtwIFhmakfkqiCG03JD7JyKv
X-Received: by 10.180.81.33 with SMTP id w1mr6948480wix.42.1386842773437;
	Thu, 12 Dec 2013 02:06:13 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id xn17sm6932935wib.1.2013.12.12.02.06.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Dec 2013 02:06:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2013 10:06:09 +0000
Message-Id: <1386842769-1350-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lib/oeqa/runtime: systemd failure case improvements
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
X-List-Received-Date: Thu, 12 Dec 2013 10:06:14 -0000

If the hostnamed service can't be started or stopped, show the output from
systemctl status to assist debugging.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/systemd.py |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 17cc19f..31007df 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -34,14 +34,18 @@ class SystemdTests(oeRuntimeTest):
     def test_systemd_stop(self):
         self.target.run('systemctl stop systemd-hostnamed.service')
         (status, output) = self.target.run('systemctl show systemd-hostnamed.service | grep "ActiveState" | grep "=inactive"')
-        self.assertEqual(status, 0, msg="systemd-hostnamed.service service could not be stopped.Status and output: %s and %s" % (status, output))
+        if status != 0:
+            (status, output) = self.target.run('systemctl status -l systemd-hostnamed.service')
+            self.fail(msg="systemd-hostnamed.service service could not be stopped. Status:\n" + output)
 
     @skipUnlessPassed('test_systemd_stop')
     @skipUnlessPassed('test_systemd_version')
     def test_systemd_start(self):
         self.target.run('systemctl start systemd-hostnamed.service')
-        (status, output) = self.target.run('systemctl show systemd-hostnamed.service | grep "ActiveState" | grep "=active"')
-        self.assertEqual(status, 0, msg="systemd-hostnamed.service service could not be started. Status and output: %s and %s" % (status, output))
+        (status, output) = self.target.run('systemctl is-active systemd-hostnamed.service')
+        if status != 0:
+            (status, output) = self.target.run('systemctl status -l systemd-hostnamed.service')
+            self.fail(msg="systemd-hostnamed.service service could not be started. Status:\n" + output)
 
     @skipUnlessPassed('test_systemd_version')
     def test_systemd_enable(self):
-- 
1.7.10.4


