Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2217C556
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:18:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 5so2066604wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bW6v04iJf7amJotSCZRi3GQXvadT/dCtClxNnbjKQVA=;
	b=Ws9KLjp+xzCbTSYcERoIlHqp7vJcuTzbfXH3rxicrPfO2kF9utvxyTDHneyj9Mpa40
	O90cuZZMvdj+pUdC2MxTyOu6ZdeswR5l57gYdkQDep+hMbppOi5YCUBFGpqlJMO1+Dzs
	XSJydJdOb2Xqt/JU8VaU78HOBm22Wh4+Q2YI6LKY+JwFoUSuCna0GzWTSNZvh/a+bAUu
	JD6QzERwFTBHRvfAbAa1sEzSt+Cl/jcMigcz0lI1tGANZeAhAXtE+V3sbrufaCLrXGoX
	q4J2of/pgTb1/ygmwjX5AVyjhOwLSB9NFpWTcbqFEKuRlbqfmpmAaJEYbMLZy3/7zjpa
	WPDw==
X-Gm-Message-State: APjAAAWEBs69/tJ5ORw0s4ZdCE3VsLNt9yGXbRVzxHHEkaHDcxNUgjuk
	p7vWAD2jcGFv3HiIqSSlYL6q5QKR
X-Google-Smtp-Source: APXvYqwccYlNmyPiMl+UZLX/Ft9YZ6ODSaFxe3AgRLYIbub3sEB/ne+l13Y3CoMKn2SjR2hLmAt9mQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id
	e9mr2363409wma.64.1571217516722; 
	Wed, 16 Oct 2019 02:18:36 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v8sm31907518wra.79.2019.10.16.02.18.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 02:18:36 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 10:18:25 +0100
Message-Id: <20191016091825.1910-7-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191016091825.1910-1-git@andred.net>
References: <20191016091825.1910-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 6/6] oeqa/runtime/systemd: skip unit enable/disable on read-only-rootfs
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
X-List-Received-Date: Wed, 16 Oct 2019 09:18:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This doesn't work on read-only-rootfs:
    AssertionError: 1 != 0 : SYSTEMD_BUS_TIMEOUT=240s systemctl disable avahi-daemon.service
    Failed to disable unit: File /etc/systemd/system/multi-user.target.wants/avahi-daemon.service: Read-only file system

Skip the test in that case to avoid this.

Signed-off-by: André Draszik <andre.draszik@jci.com>
Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index c11fa49b07..e33c8a41a7 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -9,7 +9,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar, skipIfNotDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
-from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.core.decorator.data import skipIfNotFeature, skipIfFeature
 
 class SystemdTest(OERuntimeTestCase):
 
@@ -114,6 +114,8 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
 
     @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
+    @skipIfFeature('read-only-rootfs',
+                   'Test does not work with read-only-rootfs in IMAGE_FEATURES')
     def test_systemd_disable_enable(self):
         self.systemctl('disable', 'avahi-daemon.service')
         self.systemctl('is-enabled', 'avahi-daemon.service', expected=1)
-- 
2.23.0.rc1


