Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4596E6CC79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 12:56:11 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id x55so16773113wes.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 04:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GAoawMUIdPjlXKVMPd3ljMd3jMpWJ/7rS1iXQHFQ5xs=;
	b=LZBluLLLULrS9BVTbx99/UGKGTh3cdAREHtsZlTeIjvbR46YAbw8kV9NE4e8P0qOoT
	tvQdhmEnpkwfNH0KSPR4em3+afCifMXw+WAlllAoFwIkgVSAGAVQOCI+y76nfiJD5mUP
	TInCFFhtDGtBCxlWuYpU336iz3DdGxBMvwcaGNNMtEFh3bKuQxT6bVhcdJz7Ao8qzC8a
	1rqsXrOoa8koIe0tzP+gnPDbd9FH1qYEPXfwlJ3VK0RWk/viL8mW4DT3RbXLuH0k3ln4
	pYCKPV6uwEBE5HY48hdIr8TWZr9YuO9gWfm3JDwh7S0KdtRCgWnIu2blOUUgEDMwiswJ
	HSVQ==
X-Gm-Message-State: ALoCoQn8qjZD1YGLJIbSKd5x1pfx09n7dK3AmahNsM74P1f4JdWtzC4oYvH4CtlJE58jytkzWZdy
X-Received: by 10.180.108.97 with SMTP id hj1mr11789940wib.59.1386248170550;
	Thu, 05 Dec 2013 04:56:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b7sm6059113wiz.8.2013.12.05.04.56.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 04:56:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 12:56:01 +0000
Message-Id: <1386248161-7086-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
References: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] lib/oeqa/runtime: output more logging from systemd when services have failed
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
X-List-Received-Date: Thu, 05 Dec 2013 12:56:12 -0000

If some services have failed to start, get the status of them and some of their
log to help debug the problem.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/systemd.py |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index e4f4336..17cc19f 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -21,7 +21,9 @@ class SystemdTests(oeRuntimeTest):
     @skipUnlessPassed('test_systemd_version')
     def test_systemd_failed(self):
         (status, output) = self.target.run('systemctl --failed | grep "0 loaded units listed"')
-        self.assertEqual(status, 0, msg="Failed systemd services: %s" % self.target.run('systemctl --failed')[1])
+        if status != 0:
+            print self.target.run('systemctl status --failed -l')[1]
+            self.fail("Some systemd units failed.")
 
     @skipUnlessPassed('test_systemd_version')
     def test_systemd_service(self):
-- 
1.7.10.4


