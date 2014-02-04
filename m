Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 65C7C6E944
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 12:41:19 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u57so3969355wes.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 04:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Rn4tWdtVglC4fjLiJrG4HbfutFdDNJAVuLMH9El5kz4=;
	b=KIxGio0LwpTZV2DN3u2PhYFzK0XFxUU8iVLqDIWBfShrFopAKjgY2NTFvwve3PNY+l
	NiFoAVqiEkH/THaI3WHh0pBRe3Wofed0JM+78xcNha5TQXDx4Sn2JbTMw40RxAU6ApiT
	r/Yc1PH3UpRFcT26UMLUSiFGR0sUz4SfHR1XUuOKTU5svWEzokZlGhwDpfrvUyFq2ttW
	IQnEDCPN28yu5ko4dYpr1DEXrrOOJmTU0Onb6ZQD/d6xo6zmAyqcjujk+BOGl1RJLnY7
	5upyADPkfAfdVXfNGjMMc67bwhvHyl7oC2lgjt79srxu95tH93b1eZ6GgSnmLPNai0Ro
	qEIQ==
X-Gm-Message-State: ALoCoQm/aeuAYxK3BU9P9QB8eNfwYd2HU+H43t+ACqr2lQgegho6l6t4ufB24MB2SFQ0UwE2oR26
X-Received: by 10.194.61.84 with SMTP id n20mr1341276wjr.61.1391517679952;
	Tue, 04 Feb 2014 04:41:19 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	bj3sm52331357wjb.14.2014.02.04.04.41.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Feb 2014 04:41:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2014 12:41:15 +0000
Message-Id: <1391517675-31524-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oeqa/runtime/systemd: remove race in settle()
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
X-List-Received-Date: Tue, 04 Feb 2014 12:41:21 -0000

The settle() function had a race where services could still be activating at two
minutes but then when the final log is output, they've activated.

Remove this race and generally clean up the code.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/systemd.py |   22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 6414dd6..6de84f8 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -37,25 +37,19 @@ class SystemdBasicTests(SystemdTest):
         Block until systemd has finished activating any units being activated,
         or until two minutes has elapsed.
 
-        Returns a tuple, either (True, None) if all units have finished
-        acitvating, or (False, message string) if there are still units
+        Returns a tuple, either (True, '') if all units have finished
+        activating, or (False, message string) if there are still units
         activating (generally, failing units that restart).
         """
         import time
-        settled = False
         endtime = time.time() + (60 * 2)
-        while time.time() < endtime:
-            status = self.target.run('systemctl --state=activating | grep -q "0 loaded units listed"')
-            if status == 0:
-                settled = True
-                break
-            time.sleep(10)
-
-        if settled:
-            return (True, None)
-        else:
+        while True:
             status, output = self.target.run('systemctl --state=activating')
-        return (settled, output)
+            if "0 loaded units listed" in output:
+                return (True, '')
+            if time.time() >= endtime:
+                return (False, output)
+            time.sleep(10)
 
     @skipUnlessPassed('test_systemd_basic')
     def test_systemd_failed(self):
-- 
1.7.10.4


