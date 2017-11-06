Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E3F7460125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 17:56:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y83so15921993wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 09:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PHPsUfAp8Kswwr0f13nNU0tF1wFJmfdfw+LYJrxRbTs=;
	b=fv1dHZ8nQtqFMbn4Iom3+/X8vv6IReo4YqrnPQDZRbxZhPNFuSE8/+yUBwxf3+Wdv1
	7ExWz9bs/+Fg9nWqb50GTEbvFEHPHA4rAo67qAXSGYodvM8n3zS/vASnigp1SeQKqID1
	0NYpt2GpNpv8RShXG0ef61kELumuMum3N4VbNfxMi4STNdpcXk1hpij72uLntHIayReG
	4VdXDTI9xBDHZrOc5d+0Y5oQQceh5fl9YwjVX2hv6xr2+jkbjIzi4yXRiOaMTamh/ANy
	fKtSnYpxZvNu5vaQxEkGcUiL3JGMLH1QMvW1rX8KlDpfRmRBmXDDpHEcAMzmqc8hVn0J
	AtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PHPsUfAp8Kswwr0f13nNU0tF1wFJmfdfw+LYJrxRbTs=;
	b=RCo0hjDnEwY8ufhGVc564EgfTLyxjLdVVZVkP75e+SettbhbVB1QQ5WCCBDfHhuVuK
	hP+9YyEgWUyoeAiKbTk1PJRI070G/vMt3fu9Tg57FtRtnM8qquxyQuQS9ZD8qp6IOkpy
	qCk3gK4XS0brrFFOratNC1Aj7Q4K7qsg0Iu17fI57apA43UASjkAOrLYRiddwetQ6jfM
	HhOODRB7jXqjZUE26sT8tX6ekmOC3L/b+EJV/FmCFV8vRwk7ZGBpOb51yZrExW/WpiV0
	2HOOSoDZAJSM3d6KcBA9joCWulVY2z24xkRj8ZXhbeZ9H/9yJRcPHq93LglIKlxqVlVz
	B84w==
X-Gm-Message-State: AJaThX43svnc/00iX/2lPq5IyYIb4AG8LLxH3INxh8pOF4fculAN+H8z
	iJa3/cZJ2ew+BdqJ9BJvFBsKwGzF
X-Google-Smtp-Source: ABhQp+S/Pc6w3obG/S7gwKT+fSZUT0Oz2Tza5UnohUVUW1hMXoyEtXV4L/RyeCy31dm2xssWWJ6WeA==
X-Received: by 10.28.193.76 with SMTP id r73mr5467692wmf.18.1509990961474;
	Mon, 06 Nov 2017 09:56:01 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	n14sm15168327wrg.38.2017.11.06.09.56.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 09:56:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Nov 2017 17:55:58 +0000
Message-Id: <20171106175558.24581-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/selftest/runtime_test: fix postinst_rootfs_and_boot
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
X-List-Received-Date: Mon, 06 Nov 2017 17:56:01 -0000

This test overrides IMAGE_FEATURES but failed to include package-management,
which is essential for postinsts to work under dpkg.

Also rewrite the file existence check to use a console login not SSH for
simplicity.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7ce81c3ff0f..25270b7535b 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -244,7 +244,7 @@ postinst-delayed-t \
                 with self.subTest(init_manager=init_manager, package_class=classes):
                     features = 'MACHINE = "qemux86"\n'
                     features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
-                    features += 'IMAGE_FEATURES += "empty-root-password ssh-server-openssh"\n'
+                    features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
                     features += 'PACKAGE_CLASSES = "%s"\n' % classes
                     if init_manager == "systemd":
                         features += 'DISTRO_FEATURES_append = " systemd"\n'
@@ -263,6 +263,5 @@ postinst-delayed-t \
 
                     testcommand = 'ls /etc/' + fileboot_name
                     with runqemu('core-image-minimal') as qemu:
-                        ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog)
-                        status, output = ssh.run(testcommand)
+                        status, output = qemu.run_serial("-f /etc/" + fileboot_name)
                         self.assertEqual(status, 0, 'File %s was not created at first boot (%s)' % (fileboot_name, output))
-- 
2.11.0


