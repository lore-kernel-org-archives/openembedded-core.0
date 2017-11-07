Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 101BE78435
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 10:32:30 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l22so608014wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PHPsUfAp8Kswwr0f13nNU0tF1wFJmfdfw+LYJrxRbTs=;
	b=jVq4VAGGw28CO+dQjPKUdnz2numGtwzFHsbyliIMi9rYurCcmEV6prn+PRFRtF7SKG
	oDAgGYKG4uhEa5lrOP0Q498mqZHTXpw93yDom815B/iJSKcDGXnXMUIftx4Cc2DD6ycu
	S/+ibmU0EbhJOR3q416O5StoD0pMzZ08StqyOQFCmbNRtkR3F+Rdo++hiT0862LCesyn
	LrN9uKl5c4GRKq+YMSrnHxJ8MAhQ65Qq0B3PsrotfraIxfa5cpLfqhnkcAYvCeuH67sK
	dwFlAvddKeNu9bqQartzBqjhlFycyGBDPiAaOuo+HtE4bwUxiK4lE+6vu6+qx+lQnzYj
	JtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PHPsUfAp8Kswwr0f13nNU0tF1wFJmfdfw+LYJrxRbTs=;
	b=ShUhlMQSsqRmfsgF07WMilrLOZJ1mBPQTUFvOYFSz7vQfZ7fNV9mtEWLrXYwWYwvWA
	Ly1jJ5okJn6jdi08mGCAfVf+5YBYnpSxzZcCZkIUJjDgj0uFbc6RLJhcQ6xa/f1ewJd3
	vv1fMAeTkU/fi3lH5fr6DuFqraHbFSI8NfeWpd6tGEC+4d7vWIDgO5dEhElXL/itanOG
	oHDtkSmEOUc2TMAyJdtxVoC7gNqU+j9tRpP3ft7BUNJT91x8FxaipoQiIOf9EL2S9gM5
	XPwotNiNuxuE2Oy72SwM1z9MiVdl/mPCLxdmVq+g2aQAOCRYldCTl1/7T/gvZAzP7vM7
	Q26A==
X-Gm-Message-State: AMCzsaUhfUDMrsZ+2V7bMnh2Mr6FgCY2NMlKkdK7jcLtQuKUs6K6shdI
	2iip6ZJ1iGH/Hmqzcs5GI6jVxtRJ
X-Google-Smtp-Source: ABhQp+S2v/cPQYftXvFv3XjnINegu6oTNRtF5wELUP9xK9/sY07Z2dRYepP/017QEE4A5ZXXVcA+dA==
X-Received: by 10.223.192.10 with SMTP id z10mr15311286wre.101.1510050751396; 
	Tue, 07 Nov 2017 02:32:31 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l7sm357179wrg.69.2017.11.07.02.32.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 02:32:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Nov 2017 10:32:27 +0000
Message-Id: <20171107103227.9306-1-ross.burton@intel.com>
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
X-List-Received-Date: Tue, 07 Nov 2017 10:32:31 -0000

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


