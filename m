Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 997786B8BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 09:28:03 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b24so1743708wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 02:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fKyTr8UPN9vEVUNoKkQku+iNT4wAVE0Ow8R4xYFMhnE=;
	b=YJBN8RCHpaVVLMad1Mc1Y5gGAbF7FPQvLwwu+0FJ3QHU0QQmJ2Nb+3MPp6zKo576R1
	S0f/K4saWHcj1+ikI2cwlBUvLM1NyVVgZgNSCaV2+GFKo//fvMWRUhpHAIQ+D1sPYBgf
	jXXW3SP3ZvBL8xyWdfJgqWuYnEqkp1tD8YaB78Ni2EZlRWN2AqTUo9sx7ke4KDZwDwcD
	6w6pxV0h1pMS7KFcJvAyZJgwf5PBxPKsWRHXIa2k5Vmrdy0eKd2Oktm0psO9MflSsJo0
	cGQZ+knuhrtEpU2D6xpEu8sz4DzwVAsDHsWIrjIN5QiObcbF7aOKAT/ahjmbfedVFq/h
	h56Q==
X-Gm-Message-State: APjAAAWINgeXUousA66j6hWNIqox/quZyFJmw6RIzQlZeC+sDQBLlDDG
	bKV0RpX+hOa6TnIE53t+GWadBNzc
X-Google-Smtp-Source: APXvYqxdnFMOmPqMTpR1Sh+NT+3Mdh0vLlMx44Ps7f7Yi4q8f2BLgyQTN8QVPipaRBycDDwY6hcbQA==
X-Received: by 2002:a1c:444:: with SMTP id 65mr2013509wme.73.1571304483942;
	Thu, 17 Oct 2019 02:28:03 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b22sm1736487wmj.36.2019.10.17.02.28.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 02:28:02 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 10:28:02 +0100
Message-Id: <20191017092802.31082-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191016091825.1910-7-git@andred.net>
References: <20191016091825.1910-7-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] oeqa/runtime/systemd: skip unit enable/disable on read-only-rootfs
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
X-List-Received-Date: Thu, 17 Oct 2019 09:28:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This doesn't work on read-only-rootfs:
    AssertionError: 1 != 0 : SYSTEMD_BUS_TIMEOUT=240s systemctl disable avahi-daemon.service
    Failed to disable unit: File /etc/systemd/system/multi-user.target.wants/avahi-daemon.service: Read-only file system

This patch does two things:
1) Decorate the existing test to be skipped if the rootfs is
   read-only
2) add a new test to be executed only if the rootfs is
   read-only. This new test remounts the rootfs read-write
   before continuing to execute the existing test, making
   sure to clean up correctly after itself (remount r/o
   again).

Signed-off-by: André Draszik <git@andred.net>

---
v2: We can do better by adding this 2nd test described above,
rather than just doing 1) described above
---
 meta/lib/oeqa/runtime/cases/systemd.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index c11fa49b07..7c44abe8ed 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -9,7 +9,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar, skipIfNotDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
-from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.core.decorator.data import skipIfNotFeature, skipIfFeature
 
 class SystemdTest(OERuntimeTestCase):
 
@@ -114,12 +114,26 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
 
     @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
+    @skipIfFeature('read-only-rootfs',
+                   'Test is only meant to run without read-only-rootfs in IMAGE_FEATURES')
     def test_systemd_disable_enable(self):
         self.systemctl('disable', 'avahi-daemon.service')
         self.systemctl('is-enabled', 'avahi-daemon.service', expected=1)
         self.systemctl('enable', 'avahi-daemon.service')
         self.systemctl('is-enabled', 'avahi-daemon.service')
 
+    @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
+    @skipIfNotFeature('read-only-rootfs',
+                      'Test is only meant to run with read-only-rootfs in IMAGE_FEATURES')
+    def test_systemd_disable_enable_ro(self):
+        status = self.target.run('mount -orw,remount /')[0]
+        self.assertTrue(status == 0, msg='Remounting / as r/w failed')
+        try:
+            self.test_systemd_disable_enable()
+        finally:
+            status = self.target.run('mount -oro,remount /')[0]
+            self.assertTrue(status == 0, msg='Remounting / as r/o failed')
+
 class SystemdJournalTests(SystemdTest):
 
     @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
-- 
2.23.0.rc1


